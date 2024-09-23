@implementation MDLMesh

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allocator, 0);
  objc_storeStrong((id *)&self->_controlNodes, 0);
  objc_storeStrong((id *)&self->_vertexDescriptor, 0);
  objc_storeStrong((id *)&self->_vertexBuffers, 0);
  objc_storeStrong((id *)&self->_submeshes, 0);
}

- (void)setSubdivisionScheme:(unint64_t)a3
{
  self->_subdivisionScheme = a3;
}

- (MDLMesh)initWithVertexBuffers:(NSArray *)vertexBuffers vertexCount:(NSUInteger)vertexCount descriptor:(MDLVertexDescriptor *)descriptor submeshes:(NSArray *)submeshes
{
  NSArray *v8;
  NSArray *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  objc_class *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  MDLVertexDescriptor *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  char isEqual;
  unint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  const char *v52;
  NSArray *v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  BOOL v67;
  const char *v68;
  uint64_t v69;
  unint64_t i;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  char v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  BOOL v82;
  void *v83;
  objc_class *v84;
  void *v85;
  void *v86;
  const char *v87;
  MDLMesh *v88;
  MDLMesh *v89;
  id v95;
  const char *v96;
  uint64_t v97;
  NSMutableArray *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  MDLVertexDescriptor *vertexDescriptor;
  id v103;
  const char *v104;
  uint64_t v105;
  NSMutableArray *v106;
  MDLMesh *v107;
  NSArray *v110;
  MDLVertexDescriptor *v111;
  objc_super v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v8 = vertexBuffers;
  v111 = descriptor;
  v110 = submeshes;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v9 = v8;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v123, v129, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v124;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v124 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v15);
        objc_msgSend_null(MEMORY[0x1E0C99E38], v11, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v16, v18, (uint64_t)v17) & 1) == 0)
        {
          v21 = objc_msgSend_type(v16, v19, v20) == 1;

          if (v21)
            goto LABEL_10;
          v22 = (void *)MEMORY[0x1E0C99DA0];
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_raise_format_(v22, v25, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: vertexBuffer.type must be MDLMeshBufferTypeVertex"), v17, v24);

        }
LABEL_10:
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v123, v129, 16);
    }
    while (v13);
  }

  v28 = v111;
  if (!v111)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v29, v33, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: No descriptor supplied"), v31, v32);

    v28 = 0;
  }
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  objc_msgSend_attributes(v28, v26, v27);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v119, v128, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v120;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v120 != v39)
          objc_enumerationMutation(v34);
        v41 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v40);
        objc_msgSend_null(MEMORY[0x1E0C99E38], v36, v37);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v41, v43, (uint64_t)v42);

        if ((isEqual & 1) == 0)
        {
          v45 = objc_msgSend_bufferIndex(v41, v36, v37);
          if (v45 > objc_msgSend_count(v9, v46, v47))
          {
            v48 = (void *)MEMORY[0x1E0C99DA0];
            v49 = (objc_class *)objc_opt_class();
            NSStringFromClass(v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_raise_format_(v48, v52, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Buffer index out of range"), v50, v51);

          }
        }
        ++v40;
      }
      while (v38 != v40);
      v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v36, (uint64_t)&v119, v128, 16);
    }
    while (v38);
  }

  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v53 = v9;
  v55 = 0;
  v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v115, v127, 16);
  if (v58)
  {
    v59 = *(_QWORD *)v116;
    do
    {
      v60 = 0;
      do
      {
        if (*(_QWORD *)v116 != v59)
          objc_enumerationMutation(v53);
        if (!v55)
        {
          v61 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v60);
          objc_msgSend_null(MEMORY[0x1E0C99E38], v56, v57);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqual_(v61, v63, (uint64_t)v62))
          {

          }
          else
          {
            objc_msgSend_allocator(v61, v64, v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = v66 == 0;

            if (!v67)
            {
              objc_msgSend_allocator(v61, v56, v57);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_35;
            }
          }
          v55 = 0;
        }
LABEL_35:
        ++v60;
      }
      while (v58 != v60);
      v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v115, v127, 16);
    }
    while (v58);
  }

  for (i = 0; objc_msgSend_count(v53, v68, v69) > i; ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v53, v71, i);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_null(MEMORY[0x1E0C99E38], v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend_isEqual_(v72, v76, (uint64_t)v75);

    if ((v77 & 1) == 0)
    {
      objc_msgSend_objectAtIndexedSubscript_(v53, v68, i);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allocator(v78, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v81 == v55;

      if (!v82)
      {
        v83 = (void *)MEMORY[0x1E0C99DA0];
        v84 = (objc_class *)objc_opt_class();
        NSStringFromClass(v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_raise_format_(v83, v87, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Allocators on supplied vertexBuffers do not all match, but they must"), v85, v86);

      }
    }
  }
  v114.receiver = self;
  v114.super_class = (Class)MDLMesh;
  v88 = -[MDLObject init](&v114, sel_init);
  v89 = v88;
  if (v88)
  {
    __asm { FMOV            V1.4S, #-1.0 }
    *(_OWORD *)v88->_anon_50 = _Q1;
    *(_OWORD *)&v88->_anon_50[16] = 0u;
    objc_storeStrong((id *)&v88->_allocator, v55);
    v89->_vertexCount = vertexCount;
    v95 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v97 = objc_msgSend_initWithArray_(v95, v96, (uint64_t)v53);
    v98 = v89->_vertexBuffers;
    v89->_vertexBuffers = (NSMutableArray *)v97;

    v99 = MEMORY[0x1DF0D0AF8]();
    v101 = objc_msgSend_copyWithZone_(v111, v100, v99);
    vertexDescriptor = v89->_vertexDescriptor;
    v89->_vertexDescriptor = (MDLVertexDescriptor *)v101;

    v103 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v105 = objc_msgSend_initWithArray_(v103, v104, (uint64_t)v110);
    v106 = v89->_submeshes;
    v89->_submeshes = (NSMutableArray *)v105;

    v107 = v89;
  }

  return v89;
}

- (MDLVertexDescriptor)vertexDescriptor
{
  MDLVertexDescriptor *vertexDescriptor;
  uint64_t v3;
  const char *v4;

  vertexDescriptor = self->_vertexDescriptor;
  v3 = MEMORY[0x1DF0D0AF8]();
  return (MDLVertexDescriptor *)(id)objc_msgSend_copyWithZone_(vertexDescriptor, v4, v3);
}

- (NSMutableArray)submeshes
{
  return self->_submeshes;
}

- (NSArray)vertexBuffers
{
  return (NSArray *)self->_vertexBuffers;
}

- (MDLMesh)initConeWithExtent:(vector_float3)extent segments:(vector_uint2)segments inwardNormals:(BOOL)inwardNormals cap:(BOOL)cap geometryType:(MDLGeometryType)geometryType allocator:(id)allocator
{
  uint32x2_t v8;
  _BOOL8 v9;
  __int32 v10;
  uint32x2_t v11;
  const char *v14;
  id v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  const char *v20;
  MDLMesh *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  int32x2_t v27;
  uint64_t v28;
  unsigned int v29;
  float32x4_t v30;
  unsigned int v31;
  float v32;
  float v33;
  unsigned int v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  __float2 v41;
  float32x4_t v42;
  char *v43;
  float *v44;
  float *v45;
  float *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  float *v52;
  int v53;
  float *v54;
  float *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char *v60;
  float *v61;
  int v62;
  float v63;
  float *v64;
  float32x4_t v65;
  float *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  float *v72;
  int v73;
  int32x4_t v74;
  float32x2_t v75;
  float32x2_t v76;
  float32x4_t v77;
  char *v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char *v86;
  char *v87;
  int v88;
  __int32 v89;
  char *v90;
  char *v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  __int32 *v97;
  __int32 v98;
  char *v99;
  char *v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  char *v105;
  char *v106;
  int v107;
  unint64_t v108;
  uint64_t v109;
  float v110;
  float *v111;
  float *v112;
  float *v113;
  float *v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  char *v118;
  float *v119;
  int v120;
  float *v121;
  float *v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  char *v126;
  float *v127;
  int v128;
  uint64_t v129;
  uint64_t v130;
  float *v131;
  float *v132;
  char *v133;
  float *v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  unint64_t v138;
  char *v139;
  float *v140;
  char *v141;
  int v142;
  uint64_t v143;
  float *v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  unint64_t v148;
  char *v149;
  float *v150;
  char *v151;
  int v152;
  uint64_t v153;
  float *v154;
  uint64_t v155;
  unint64_t v156;
  uint64_t v157;
  unint64_t v158;
  char *v159;
  float *v160;
  char *v161;
  int v162;
  float *v163;
  char *v164;
  float *v165;
  float *v166;
  uint64_t v167;
  unint64_t v168;
  uint64_t v169;
  unint64_t v170;
  char *v171;
  float *v172;
  float *v173;
  int v174;
  uint64_t v175;
  float *v176;
  uint64_t v177;
  unint64_t v178;
  unint64_t v179;
  unint64_t v180;
  unint64_t v181;
  char *v182;
  float *v183;
  float *v184;
  int v185;
  float v186;
  __float2 v187;
  float *v188;
  char *v189;
  char *v190;
  char *v191;
  char *v192;
  uint64_t v193;
  unint64_t v194;
  uint64_t v195;
  char *v196;
  char *v197;
  char *v198;
  int v199;
  char *v200;
  uint64_t v201;
  unint64_t v202;
  uint64_t v203;
  char *v204;
  char *v205;
  char *v206;
  int v207;
  char *v208;
  uint64_t v209;
  unint64_t v210;
  uint64_t v211;
  char *v212;
  char *v213;
  char *v214;
  int v215;
  char *v216;
  char *v217;
  float *v218;
  float *v219;
  void *v220;
  float *v221;
  uint64_t v222;
  unint64_t v223;
  uint64_t v224;
  char *v225;
  char *v226;
  int v227;
  float *v228;
  float *v229;
  uint64_t v230;
  unint64_t v231;
  uint64_t v232;
  char *v233;
  float *v234;
  char *v235;
  int v236;
  float *v237;
  float *v238;
  uint64_t v239;
  unint64_t v240;
  uint64_t v241;
  char *v242;
  char *v243;
  char *v244;
  int v245;
  float *v246;
  float *v247;
  float *v248;
  float *v249;
  uint64_t v250;
  unint64_t v251;
  uint64_t v252;
  char *v253;
  float *v254;
  int v255;
  float *v256;
  float *v257;
  uint64_t v258;
  unint64_t v259;
  uint64_t v260;
  char *v261;
  float *v262;
  char *v263;
  int v264;
  char *v265;
  char *v266;
  char *v267;
  char *v268;
  uint64_t v269;
  unint64_t v270;
  uint64_t v271;
  char *v272;
  char *v273;
  int v274;
  char *v275;
  char *v276;
  uint64_t v277;
  unint64_t v278;
  uint64_t v279;
  char *v280;
  char *v281;
  int v282;
  char *v283;
  char *v284;
  uint64_t v285;
  unint64_t v286;
  uint64_t v287;
  char *v288;
  char *v289;
  char *v290;
  int v291;
  void *v292;
  void *v293;
  const char *v294;
  void *v295;
  id v296;
  const char *v297;
  void *v298;
  const char *v299;
  void *v300;
  const char *v301;
  uint64_t v302;
  void *v303;
  const char *v304;
  void *v305;
  id v306;
  const char *v307;
  void *v308;
  const char *v309;
  void *v310;
  const char *v311;
  uint64_t v312;
  void *v313;
  const char *v314;
  void *v315;
  id v316;
  const char *v317;
  void *v318;
  const char *v319;
  const char *v320;
  uint64_t v321;
  void *v322;
  void *v323;
  const char *v324;
  id v325;
  const char *v326;
  const char *v327;
  uint64_t v328;
  void *v329;
  const char *v330;
  MDLVertexDescriptor *v331;
  const char *v332;
  uint64_t v333;
  void *v334;
  const char *v335;
  void *v336;
  const char *v337;
  const char *v338;
  uint64_t v339;
  void *v340;
  const char *v341;
  void *v342;
  const char *v343;
  const char *v344;
  uint64_t v345;
  void *v346;
  const char *v347;
  void *v348;
  const char *v349;
  const char *v350;
  uint64_t v351;
  void *v352;
  const char *v353;
  void *v354;
  const char *v355;
  const char *v356;
  uint64_t v357;
  void *v358;
  const char *v359;
  void *v360;
  const char *v361;
  const char *v362;
  uint64_t v363;
  void *v364;
  const char *v365;
  void *v366;
  const char *v367;
  const char *v368;
  uint64_t v369;
  void *v370;
  const char *v371;
  void *v372;
  const char *v373;
  const char *v374;
  uint64_t v375;
  void *v376;
  const char *v377;
  void *v378;
  const char *v379;
  const char *v380;
  uint64_t v381;
  void *v382;
  const char *v383;
  void *v384;
  const char *v385;
  const char *v386;
  uint64_t v387;
  const char *v388;
  uint64_t v389;
  MDLAsset *v390;
  const char *v391;
  uint64_t v392;
  void *v393;
  const char *v394;
  void *v395;
  const char *v396;
  const char *v397;
  const char *v398;
  MDLMesh *v399;
  void *context;
  unsigned int v402;
  uint64_t v403;
  void *v404;
  MDLMesh *v405;
  float v406;
  float v407;
  float v408;
  float v409;
  float v410;
  float v411;
  unint64_t v412;
  unint64_t v413;
  uint64_t v414;
  float32x4_t v415;
  float32x4_t v416;
  int32x2_t v417;
  float32x4_t v418;
  float32x4_t v419;
  unsigned int v420;
  void *__p;
  float *v422;
  char *v423;
  char *v424;
  char *v425;
  char *v426;
  float *v427;
  float *v428;
  _QWORD v429[2];

  v9 = inwardNormals;
  v10 = extent.i32[0];
  v11 = v8;
  v416 = *(float32x4_t *)segments.i8;
  v15 = (id)cap;
  v403 = v9;
  if ((unint64_t)(v9 - 1) >= 2)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v16, v20, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: geometryType for Cone must be MDLGeometryTypeTriangles or MDLGeometryTypeLines"), v18, v19);

  }
  v21 = (MDLMesh *)(id)objc_msgSend_initWithBufferAllocator_(self, v14, (uint64_t)v15);

  if (v21)
  {
    v405 = v21;
    objc_msgSend_allocator(v21, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend_setName_(v405, v25, (uint64_t)CFSTR("cone"));
    v404 = (void *)v24;
    v417 = (int32x2_t)vmax_u32(v11, (uint32x2_t)0x100000003);
    context = (void *)MEMORY[0x1DF0D25C8](v26);
    v27 = vadd_s32(v417, (int32x2_t)0x100000001);
    v414 = v27.u32[0];
    v28 = (v27.i32[0] * v27.i32[1] + 2);
    v427 = 0;
    v428 = 0;
    v429[0] = 0;
    sub_1DCB0BBF4((void **)&v427, 3 * v28);
    v424 = 0;
    v425 = 0;
    v426 = 0;
    sub_1DCB0BBF4((void **)&v424, 3 * v28);
    v402 = v28;
    __p = 0;
    v422 = 0;
    v423 = 0;
    sub_1DCB0BBF4(&__p, 2 * v28);
    v29 = 0;
    v30 = v416;
    v411 = vmuls_lane_f32(0.5, v416, 2);
    v31 = v417.i32[0];
    v32 = 6.28318531 / (double)v417.u32[0];
    v412 = v417.u32[1];
    if (v10)
      v30.f32[0] = -1.0;
    else
      v30.f32[0] = 1.0;
    v415 = v30;
    if (v10)
      v33 = 1.0;
    else
      v33 = -1.0;
    v408 = 1.0 / (float)v417.u32[0];
    v409 = (float)v417.u32[1] * 0.5;
    v410 = (float)v417.u32[1];
    v406 = v33;
    v407 = 1.0 / (float)v417.u32[1];
    v413 = v417.u32[0];
    do
    {
      v34 = 0;
      v35 = (float)(v410 - (float)v29) * v407;
      v36 = (float)(0.5 * v416.f32[0]) * v35;
      v37 = v411 * v35;
      v38 = (float)(v416.f32[1] * (float)((float)v29 - v409)) * v407;
      v39 = (float)((float)((float)v29 * -3.0) * v408) + 0.66667;
      do
      {
        v40 = (float)((float)v34 * v32) + 1.57079633;
        v41 = __sincosf_stret(v40);
        v42.f32[0] = v36 * v41.__cosval;
        v44 = v428;
        v43 = (char *)v429[0];
        v418 = v42;
        if ((unint64_t)v428 >= v429[0])
        {
          v46 = v427;
          v47 = v428 - v427;
          v48 = v47 + 1;
          if ((unint64_t)(v47 + 1) >> 62)
            sub_1DCAE4C44();
          v49 = v429[0] - (_QWORD)v427;
          if ((uint64_t)(v429[0] - (_QWORD)v427) >> 1 > v48)
            v48 = v49 >> 1;
          if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFFCLL)
            v50 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v50 = v48;
          if (v50)
          {
            v51 = (char *)sub_1DCAE4D04((uint64_t)v429, v50);
            v46 = v427;
            v44 = v428;
          }
          else
          {
            v51 = 0;
          }
          v52 = (float *)&v51[4 * v47];
          *v52 = v418.f32[0];
          v45 = v52 + 1;
          while (v44 != v46)
          {
            v53 = *((_DWORD *)v44-- - 1);
            *((_DWORD *)v52-- - 1) = v53;
          }
          v43 = &v51[4 * v50];
          v427 = v52;
          v428 = v45;
          v429[0] = v43;
          if (v46)
          {
            operator delete(v46);
            v43 = (char *)v429[0];
          }
        }
        else
        {
          *v428 = v42.f32[0];
          v45 = v44 + 1;
        }
        v428 = v45;
        if (v45 >= (float *)v43)
        {
          v55 = v427;
          v56 = v45 - v427;
          v57 = v56 + 1;
          if ((unint64_t)(v56 + 1) >> 62)
            sub_1DCAE4C44();
          v58 = v43 - (char *)v427;
          if (v58 >> 1 > v57)
            v57 = v58 >> 1;
          if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFFCLL)
            v59 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v59 = v57;
          if (v59)
          {
            v60 = (char *)sub_1DCAE4D04((uint64_t)v429, v59);
            v55 = v427;
            v45 = v428;
          }
          else
          {
            v60 = 0;
          }
          v61 = (float *)&v60[4 * v56];
          *v61 = v38;
          v54 = v61 + 1;
          while (v45 != v55)
          {
            v62 = *((_DWORD *)v45-- - 1);
            *((_DWORD *)v61-- - 1) = v62;
          }
          v43 = &v60[4 * v59];
          v427 = v61;
          v428 = v54;
          v429[0] = v43;
          if (v55)
          {
            operator delete(v55);
            v43 = (char *)v429[0];
          }
        }
        else
        {
          *v45 = v38;
          v54 = v45 + 1;
        }
        v63 = v37 * v41.__sinval;
        v428 = v54;
        if (v54 >= (float *)v43)
        {
          v66 = v427;
          v67 = v54 - v427;
          v68 = v67 + 1;
          if ((unint64_t)(v67 + 1) >> 62)
            sub_1DCAE4C44();
          v69 = v43 - (char *)v427;
          if (v69 >> 1 > v68)
            v68 = v69 >> 1;
          if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFFCLL)
            v70 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v70 = v68;
          if (v70)
          {
            v71 = (char *)sub_1DCAE4D04((uint64_t)v429, v70);
            v66 = v427;
            v54 = v428;
          }
          else
          {
            v71 = 0;
          }
          v72 = (float *)&v71[4 * v67];
          *v72 = v37 * v41.__sinval;
          v64 = v72 + 1;
          while (v54 != v66)
          {
            v73 = *((_DWORD *)v54-- - 1);
            *((_DWORD *)v72-- - 1) = v73;
          }
          v427 = v72;
          v428 = v64;
          v429[0] = &v71[4 * v70];
          if (v66)
            operator delete(v66);
          v63 = v37 * v41.__sinval;
          v65 = v418;
        }
        else
        {
          *v54 = v63;
          v64 = v54 + 1;
          v65 = v418;
        }
        v65.f32[1] = (float)(v416.f32[0] * -0.25) / v416.f32[1];
        v428 = v64;
        v65.f32[2] = v63;
        v74 = (int32x4_t)vmulq_f32(v65, v65);
        v74.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v74.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v74.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v74, 2)).u32[0];
        v75 = vrsqrte_f32((float32x2_t)v74.u32[0]);
        v76 = vmul_f32(vrsqrts_f32((float32x2_t)v74.u32[0], vmul_f32(v75, v75)), v75);
        *(float32x2_t *)v74.i8 = vmul_f32(v76, vrsqrts_f32((float32x2_t)v74.u32[0], vmul_f32(v76, v76)));
        v77 = vmulq_n_f32(v65, vmulq_f32((float32x4_t)v74, v415).f32[0]);
        v79 = v425;
        v78 = v426;
        v419 = v77;
        if (v425 >= v426)
        {
          v81 = v424;
          v82 = (v425 - v424) >> 2;
          v83 = v82 + 1;
          if ((unint64_t)(v82 + 1) >> 62)
            sub_1DCAE4C44();
          v84 = v426 - v424;
          if ((v426 - v424) >> 1 > v83)
            v83 = v84 >> 1;
          if ((unint64_t)v84 >= 0x7FFFFFFFFFFFFFFCLL)
            v85 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v85 = v83;
          if (v85)
          {
            v86 = (char *)sub_1DCAE4D04((uint64_t)&v426, v85);
            v81 = v424;
            v79 = v425;
          }
          else
          {
            v86 = 0;
          }
          v87 = &v86[4 * v82];
          *(_DWORD *)v87 = v419.i32[0];
          v80 = v87 + 4;
          while (v79 != v81)
          {
            v88 = *((_DWORD *)v79 - 1);
            v79 -= 4;
            *((_DWORD *)v87 - 1) = v88;
            v87 -= 4;
          }
          v78 = &v86[4 * v85];
          v424 = v87;
          v425 = v80;
          v426 = v78;
          if (v81)
          {
            operator delete(v81);
            v78 = v426;
          }
          v77.i32[1] = v419.i32[1];
        }
        else
        {
          *(_DWORD *)v425 = v77.i32[0];
          v80 = v79 + 4;
        }
        v425 = v80;
        v89 = v77.i32[1];
        if (v80 >= v78)
        {
          v91 = v424;
          v92 = (v80 - v424) >> 2;
          v93 = v92 + 1;
          if ((unint64_t)(v92 + 1) >> 62)
            sub_1DCAE4C44();
          v94 = v78 - v424;
          if (v94 >> 1 > v93)
            v93 = v94 >> 1;
          if ((unint64_t)v94 >= 0x7FFFFFFFFFFFFFFCLL)
            v95 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v95 = v93;
          if (v95)
          {
            v96 = (char *)sub_1DCAE4D04((uint64_t)&v426, v95);
            v91 = v424;
            v80 = v425;
          }
          else
          {
            v96 = 0;
          }
          v97 = (__int32 *)&v96[4 * v92];
          *v97 = v89;
          v90 = (char *)(v97 + 1);
          while (v80 != v91)
          {
            v98 = *((_DWORD *)v80 - 1);
            v80 -= 4;
            *--v97 = v98;
          }
          v78 = &v96[4 * v95];
          v424 = (char *)v97;
          v425 = v90;
          v426 = v78;
          if (v91)
          {
            operator delete(v91);
            v78 = v426;
          }
        }
        else
        {
          *(_DWORD *)v80 = v77.i32[1];
          v90 = v80 + 4;
        }
        v425 = v90;
        if (v90 >= v78)
        {
          v100 = v424;
          v101 = (v90 - v424) >> 2;
          v102 = v101 + 1;
          if ((unint64_t)(v101 + 1) >> 62)
            sub_1DCAE4C44();
          v103 = v78 - v424;
          if (v103 >> 1 > v102)
            v102 = v103 >> 1;
          if ((unint64_t)v103 >= 0x7FFFFFFFFFFFFFFCLL)
            v104 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v104 = v102;
          if (v104)
          {
            v105 = (char *)sub_1DCAE4D04((uint64_t)&v426, v104);
            v100 = v424;
            v90 = v425;
          }
          else
          {
            v105 = 0;
          }
          v106 = &v105[4 * v101];
          *(_DWORD *)v106 = v419.i32[2];
          v99 = v106 + 4;
          while (v90 != v100)
          {
            v107 = *((_DWORD *)v90 - 1);
            v90 -= 4;
            *((_DWORD *)v106 - 1) = v107;
            v106 -= 4;
          }
          v424 = v106;
          v425 = v99;
          v426 = &v105[4 * v104];
          if (v100)
            operator delete(v100);
        }
        else
        {
          *(_DWORD *)v90 = v419.i32[2];
          v99 = v90 + 4;
        }
        v425 = v99;
        v110 = (float)(cosf((float)v34 * v32) * 0.25) + 0.25;
        v112 = v422;
        v111 = (float *)v423;
        if (v422 >= (float *)v423)
        {
          v114 = (float *)__p;
          v115 = ((char *)v422 - (_BYTE *)__p) >> 2;
          v116 = v115 + 1;
          if ((unint64_t)(v115 + 1) >> 62)
            sub_1DCAE4C44();
          v117 = v423 - (_BYTE *)__p;
          if ((v423 - (_BYTE *)__p) >> 1 > v116)
            v116 = v117 >> 1;
          if ((unint64_t)v117 >= 0x7FFFFFFFFFFFFFFCLL)
            v108 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v108 = v116;
          if (v108)
          {
            v118 = (char *)sub_1DCAE4D04((uint64_t)&v423, v108);
            v114 = (float *)__p;
            v112 = v422;
          }
          else
          {
            v118 = 0;
          }
          v119 = (float *)&v118[4 * v115];
          *v119 = v110;
          v113 = v119 + 1;
          while (v112 != v114)
          {
            v120 = *((_DWORD *)v112-- - 1);
            *((_DWORD *)v119-- - 1) = v120;
          }
          v111 = (float *)&v118[4 * v108];
          __p = v119;
          v422 = v113;
          v423 = (char *)v111;
          if (v114)
          {
            operator delete(v114);
            v111 = (float *)v423;
          }
        }
        else
        {
          *v422 = v110;
          v113 = v112 + 1;
        }
        v422 = v113;
        if (v113 >= v111)
        {
          v122 = (float *)__p;
          v123 = ((char *)v113 - (_BYTE *)__p) >> 2;
          v124 = v123 + 1;
          if ((unint64_t)(v123 + 1) >> 62)
            sub_1DCAE4C44();
          v125 = (char *)v111 - (_BYTE *)__p;
          if (v125 >> 1 > v124)
            v124 = v125 >> 1;
          if ((unint64_t)v125 >= 0x7FFFFFFFFFFFFFFCLL)
            v108 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v108 = v124;
          if (v108)
          {
            v126 = (char *)sub_1DCAE4D04((uint64_t)&v423, v108);
            v122 = (float *)__p;
            v113 = v422;
          }
          else
          {
            v126 = 0;
          }
          v127 = (float *)&v126[4 * v123];
          *v127 = v39;
          v121 = v127 + 1;
          while (v113 != v122)
          {
            v128 = *((_DWORD *)v113-- - 1);
            *((_DWORD *)v127-- - 1) = v128;
          }
          __p = v127;
          v422 = v121;
          v423 = &v126[4 * v108];
          if (v122)
            operator delete(v122);
        }
        else
        {
          *v113 = v39;
          v121 = v113 + 1;
        }
        v422 = v121;
        ++v34;
      }
      while (v34 <= v31);
      v420 = v29;
      if (!v29)
      {
        v129 = 0;
        do
        {
          v130 = (3 * v129);
          v132 = v427;
          v131 = v428;
          v133 = (char *)v429[0];
          if ((unint64_t)v428 >= v429[0])
          {
            v135 = v428 - v427;
            v136 = v135 + 1;
            if ((unint64_t)(v135 + 1) >> 62)
              goto LABEL_430;
            v137 = v429[0] - (_QWORD)v427;
            if ((uint64_t)(v429[0] - (_QWORD)v427) >> 1 > v136)
              v136 = v137 >> 1;
            if ((unint64_t)v137 >= 0x7FFFFFFFFFFFFFFCLL)
              v138 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v138 = v136;
            if (v138)
            {
              v139 = (char *)sub_1DCAE4D04((uint64_t)v429, v138);
              v140 = v427;
              v131 = v428;
            }
            else
            {
              v139 = 0;
              v140 = v427;
            }
            v141 = &v139[4 * v135];
            *(float *)v141 = v132[v130];
            v134 = (float *)(v141 + 4);
            while (v131 != v140)
            {
              v142 = *((_DWORD *)v131-- - 1);
              *((_DWORD *)v141 - 1) = v142;
              v141 -= 4;
            }
            v133 = &v139[4 * v138];
            v427 = (float *)v141;
            v428 = v134;
            v429[0] = v133;
            if (v140)
            {
              operator delete(v140);
              v132 = v427;
              v133 = (char *)v429[0];
            }
            else
            {
              v132 = (float *)v141;
            }
          }
          else
          {
            *v428 = v427[v130];
            v134 = v131 + 1;
          }
          v428 = v134;
          v143 = (v130 + 1);
          if (v134 >= (float *)v133)
          {
            v145 = v134 - v132;
            v146 = v145 + 1;
            if ((unint64_t)(v145 + 1) >> 62)
              goto LABEL_430;
            v147 = v133 - (char *)v132;
            if (v147 >> 1 > v146)
              v146 = v147 >> 1;
            if ((unint64_t)v147 >= 0x7FFFFFFFFFFFFFFCLL)
              v148 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v148 = v146;
            if (v148)
            {
              v149 = (char *)sub_1DCAE4D04((uint64_t)v429, v148);
              v150 = v427;
              v134 = v428;
            }
            else
            {
              v149 = 0;
              v150 = v132;
            }
            v151 = &v149[4 * v145];
            *(float *)v151 = v132[v143];
            v144 = (float *)(v151 + 4);
            while (v134 != v150)
            {
              v152 = *((_DWORD *)v134-- - 1);
              *((_DWORD *)v151 - 1) = v152;
              v151 -= 4;
            }
            v133 = &v149[4 * v148];
            v427 = (float *)v151;
            v428 = v144;
            v429[0] = v133;
            if (v150)
            {
              operator delete(v150);
              v132 = v427;
              v133 = (char *)v429[0];
            }
            else
            {
              v132 = (float *)v151;
            }
          }
          else
          {
            *v134 = v132[v143];
            v144 = v134 + 1;
          }
          v428 = v144;
          v153 = (v130 + 2);
          if (v144 >= (float *)v133)
          {
            v155 = v144 - v132;
            v156 = v155 + 1;
            if ((unint64_t)(v155 + 1) >> 62)
              goto LABEL_430;
            v157 = v133 - (char *)v132;
            if (v157 >> 1 > v156)
              v156 = v157 >> 1;
            if ((unint64_t)v157 >= 0x7FFFFFFFFFFFFFFCLL)
              v158 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v158 = v156;
            if (v158)
            {
              v159 = (char *)sub_1DCAE4D04((uint64_t)v429, v158);
              v160 = v427;
              v144 = v428;
            }
            else
            {
              v159 = 0;
              v160 = v132;
            }
            v161 = &v159[4 * v155];
            *(float *)v161 = v132[v153];
            v154 = (float *)(v161 + 4);
            while (v144 != v160)
            {
              v162 = *((_DWORD *)v144-- - 1);
              *((_DWORD *)v161 - 1) = v162;
              v161 -= 4;
            }
            v427 = (float *)v161;
            v428 = v154;
            v429[0] = &v159[4 * v158];
            if (v160)
              operator delete(v160);
          }
          else
          {
            *v144 = v132[v153];
            v154 = v144 + 1;
          }
          v428 = v154;
          v164 = (char *)__p;
          v163 = v422;
          v165 = (float *)v423;
          if (v422 >= (float *)v423)
          {
            v167 = ((char *)v422 - (_BYTE *)__p) >> 2;
            v168 = v167 + 1;
            if ((unint64_t)(v167 + 1) >> 62)
              goto LABEL_430;
            v169 = v423 - (_BYTE *)__p;
            if ((v423 - (_BYTE *)__p) >> 1 > v168)
              v168 = v169 >> 1;
            if ((unint64_t)v169 >= 0x7FFFFFFFFFFFFFFCLL)
              v170 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v170 = v168;
            if (v170)
            {
              v171 = (char *)sub_1DCAE4D04((uint64_t)&v423, v170);
              v172 = (float *)__p;
              v163 = v422;
            }
            else
            {
              v171 = 0;
              v172 = (float *)__p;
            }
            v173 = (float *)&v171[4 * v167];
            *v173 = *(float *)&v164[8 * v129];
            v166 = v173 + 1;
            while (v163 != v172)
            {
              v174 = *((_DWORD *)v163-- - 1);
              *((_DWORD *)v173-- - 1) = v174;
            }
            v165 = (float *)&v171[4 * v170];
            __p = v173;
            v422 = v166;
            v423 = (char *)v165;
            if (v172)
            {
              operator delete(v172);
              v164 = (char *)__p;
              v165 = (float *)v423;
            }
            else
            {
              v164 = (char *)v173;
            }
          }
          else
          {
            *v422 = *((float *)__p + 2 * v129);
            v166 = v163 + 1;
          }
          v422 = v166;
          v175 = (2 * v129) | 1;
          if (v166 >= v165)
          {
            v177 = ((char *)v166 - v164) >> 2;
            v178 = v177 + 1;
            if ((unint64_t)(v177 + 1) >> 62)
              goto LABEL_430;
            v179 = (char *)v165 - v164;
            v180 = ((char *)v165 - v164) >> 1;
            if (v180 > v178)
              v178 = v180;
            if (v179 >= 0x7FFFFFFFFFFFFFFCLL)
              v181 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v181 = v178;
            if (v181)
            {
              v182 = (char *)sub_1DCAE4D04((uint64_t)&v423, v181);
              v183 = (float *)__p;
              v166 = v422;
            }
            else
            {
              v182 = 0;
              v183 = (float *)v164;
            }
            v184 = (float *)&v182[4 * v177];
            *v184 = *(float *)&v164[4 * v175];
            v176 = v184 + 1;
            while (v166 != v183)
            {
              v185 = *((_DWORD *)v166-- - 1);
              *((_DWORD *)v184-- - 1) = v185;
            }
            __p = v184;
            v422 = v176;
            v423 = &v182[4 * v181];
            if (v183)
              operator delete(v183);
          }
          else
          {
            *v166 = *(float *)&v164[4 * v175];
            v176 = v166 + 1;
          }
          v422 = v176;
          v186 = (float)((float)(int)v129 * v32) + 1.57079633;
          v187 = __sincosf_stret(v186);
          v188 = (float *)__p;
          *((float *)__p + 2 * v129) = (float)(v187.__cosval * 0.5) + 0.5;
          v188[v175] = (float)(v187.__sinval * -0.16667) + 0.83333;
          v190 = v424;
          v189 = v425;
          v191 = v426;
          if (v425 >= v426)
          {
            v193 = (v425 - v424) >> 2;
            v194 = v193 + 1;
            if ((unint64_t)(v193 + 1) >> 62)
              goto LABEL_430;
            v195 = v426 - v424;
            if ((v426 - v424) >> 1 > v194)
              v194 = v195 >> 1;
            if ((unint64_t)v195 >= 0x7FFFFFFFFFFFFFFCLL)
              v108 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v108 = v194;
            if (v108)
            {
              v196 = (char *)sub_1DCAE4D04((uint64_t)&v426, v108);
              v197 = v424;
              v189 = v425;
            }
            else
            {
              v196 = 0;
              v197 = v424;
            }
            v198 = &v196[4 * v193];
            *(_DWORD *)v198 = *(_DWORD *)&v190[4 * v130];
            v192 = v198 + 4;
            while (v189 != v197)
            {
              v199 = *((_DWORD *)v189 - 1);
              v189 -= 4;
              *((_DWORD *)v198 - 1) = v199;
              v198 -= 4;
            }
            v191 = &v196[4 * v108];
            v424 = v198;
            v425 = v192;
            v426 = v191;
            if (v197)
            {
              operator delete(v197);
              v190 = v424;
              v191 = v426;
            }
            else
            {
              v190 = v198;
            }
          }
          else
          {
            *(_DWORD *)v425 = *(_DWORD *)&v424[4 * v130];
            v192 = v189 + 4;
          }
          v425 = v192;
          if (v192 >= v191)
          {
            v201 = (v192 - v190) >> 2;
            v202 = v201 + 1;
            if ((unint64_t)(v201 + 1) >> 62)
              goto LABEL_430;
            v203 = v191 - v190;
            if (v203 >> 1 > v202)
              v202 = v203 >> 1;
            if ((unint64_t)v203 >= 0x7FFFFFFFFFFFFFFCLL)
              v108 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v108 = v202;
            if (v108)
            {
              v204 = (char *)sub_1DCAE4D04((uint64_t)&v426, v108);
              v205 = v424;
              v192 = v425;
            }
            else
            {
              v204 = 0;
              v205 = v190;
            }
            v206 = &v204[4 * v201];
            *(_DWORD *)v206 = *(_DWORD *)&v190[4 * v143];
            v200 = v206 + 4;
            while (v192 != v205)
            {
              v207 = *((_DWORD *)v192 - 1);
              v192 -= 4;
              *((_DWORD *)v206 - 1) = v207;
              v206 -= 4;
            }
            v191 = &v204[4 * v108];
            v424 = v206;
            v425 = v200;
            v426 = v191;
            if (v205)
            {
              operator delete(v205);
              v190 = v424;
              v191 = v426;
            }
            else
            {
              v190 = v206;
            }
          }
          else
          {
            *(_DWORD *)v192 = *(_DWORD *)&v190[4 * v143];
            v200 = v192 + 4;
          }
          v425 = v200;
          if (v200 >= v191)
          {
            v209 = (v200 - v190) >> 2;
            v210 = v209 + 1;
            if ((unint64_t)(v209 + 1) >> 62)
LABEL_430:
              sub_1DCAE4C44();
            v211 = v191 - v190;
            if (v211 >> 1 > v210)
              v210 = v211 >> 1;
            if ((unint64_t)v211 >= 0x7FFFFFFFFFFFFFFCLL)
              v108 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v108 = v210;
            if (v108)
            {
              v212 = (char *)sub_1DCAE4D04((uint64_t)&v426, v108);
              v213 = v424;
              v200 = v425;
            }
            else
            {
              v212 = 0;
              v213 = v190;
            }
            v214 = &v212[4 * v209];
            *(_DWORD *)v214 = *(_DWORD *)&v190[4 * v153];
            v208 = v214 + 4;
            while (v200 != v213)
            {
              v215 = *((_DWORD *)v200 - 1);
              v200 -= 4;
              *((_DWORD *)v214 - 1) = v215;
              v214 -= 4;
            }
            v424 = v214;
            v425 = v208;
            v426 = &v212[4 * v108];
            if (v213)
              operator delete(v213);
          }
          else
          {
            *(_DWORD *)v200 = *(_DWORD *)&v190[4 * v153];
            v208 = v200 + 4;
          }
          v425 = v208;
          v216 = v424;
          *(_DWORD *)&v424[4 * v130] = 0;
          *(float *)&v216[4 * v143] = v406;
          *(_DWORD *)&v216[4 * v153] = 0;
          ++v129;
        }
        while (v129 != v414);
      }
      v29 = v420 + 1;
      v31 = v413;
    }
    while (v420 + 1 <= v412);
    v218 = v428;
    v217 = (char *)v429[0];
    if ((unint64_t)v428 >= v429[0])
    {
      v221 = v427;
      v222 = v428 - v427;
      v223 = v222 + 1;
      if ((unint64_t)(v222 + 1) >> 62)
        sub_1DCAE4C44();
      v224 = v429[0] - (_QWORD)v427;
      if ((uint64_t)(v429[0] - (_QWORD)v427) >> 1 > v223)
        v223 = v224 >> 1;
      if ((unint64_t)v224 >= 0x7FFFFFFFFFFFFFFCLL)
        v108 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v108 = v223;
      if (v108)
      {
        v225 = (char *)sub_1DCAE4D04((uint64_t)v429, v108);
        v221 = v427;
        v218 = v428;
      }
      else
      {
        v225 = 0;
      }
      v226 = &v225[4 * v222];
      v217 = &v225[4 * v108];
      *(_DWORD *)v226 = 0;
      v219 = (float *)(v226 + 4);
      while (v218 != v221)
      {
        v227 = *((_DWORD *)v218-- - 1);
        *((_DWORD *)v226 - 1) = v227;
        v226 -= 4;
      }
      v427 = (float *)v226;
      v428 = v219;
      v429[0] = v217;
      if (v221)
      {
        operator delete(v221);
        v217 = (char *)v429[0];
      }
    }
    else
    {
      *v428 = 0.0;
      v219 = v218 + 1;
    }
    v428 = v219;
    v228 = v427;
    if (v219 >= (float *)v217)
    {
      v230 = v219 - v427;
      v231 = v230 + 1;
      if ((unint64_t)(v230 + 1) >> 62)
        sub_1DCAE4C44();
      v232 = v217 - (char *)v427;
      if (v232 >> 1 > v231)
        v231 = v232 >> 1;
      if ((unint64_t)v232 >= 0x7FFFFFFFFFFFFFFCLL)
        v108 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v108 = v231;
      if (v108)
      {
        v233 = (char *)sub_1DCAE4D04((uint64_t)v429, v108);
        v234 = v427;
        v219 = v428;
      }
      else
      {
        v233 = 0;
        v234 = v427;
      }
      v235 = &v233[4 * v230];
      v217 = &v233[4 * v108];
      *(float *)v235 = v228[1];
      v229 = (float *)(v235 + 4);
      while (v219 != v234)
      {
        v236 = *((_DWORD *)v219-- - 1);
        *((_DWORD *)v235 - 1) = v236;
        v235 -= 4;
      }
      v427 = (float *)v235;
      v428 = v229;
      v429[0] = v217;
      if (v234)
      {
        operator delete(v234);
        v217 = (char *)v429[0];
      }
    }
    else
    {
      *v219 = v427[1];
      v229 = v219 + 1;
    }
    v428 = v229;
    if (v229 >= (float *)v217)
    {
      v238 = v427;
      v239 = v229 - v427;
      v240 = v239 + 1;
      if ((unint64_t)(v239 + 1) >> 62)
        sub_1DCAE4C44();
      v241 = v217 - (char *)v427;
      if (v241 >> 1 > v240)
        v240 = v241 >> 1;
      if ((unint64_t)v241 >= 0x7FFFFFFFFFFFFFFCLL)
        v108 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v108 = v240;
      if (v108)
      {
        v242 = (char *)sub_1DCAE4D04((uint64_t)v429, v108);
        v238 = v427;
        v229 = v428;
      }
      else
      {
        v242 = 0;
      }
      v243 = &v242[4 * v239];
      v244 = &v242[4 * v108];
      *(_DWORD *)v243 = 0;
      v237 = (float *)(v243 + 4);
      while (v229 != v238)
      {
        v245 = *((_DWORD *)v229-- - 1);
        *((_DWORD *)v243 - 1) = v245;
        v243 -= 4;
      }
      v427 = (float *)v243;
      v428 = v237;
      v429[0] = v244;
      if (v238)
        operator delete(v238);
    }
    else
    {
      *v229 = 0.0;
      v237 = v229 + 1;
    }
    v428 = v237;
    v247 = v422;
    v246 = (float *)v423;
    if (v422 >= (float *)v423)
    {
      v249 = (float *)__p;
      v250 = ((char *)v422 - (_BYTE *)__p) >> 2;
      v251 = v250 + 1;
      if ((unint64_t)(v250 + 1) >> 62)
        sub_1DCAE4C44();
      v252 = v423 - (_BYTE *)__p;
      if ((v423 - (_BYTE *)__p) >> 1 > v251)
        v251 = v252 >> 1;
      if ((unint64_t)v252 >= 0x7FFFFFFFFFFFFFFCLL)
        v108 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v108 = v251;
      if (v108)
      {
        v253 = (char *)sub_1DCAE4D04((uint64_t)&v423, v108);
        v249 = (float *)__p;
        v247 = v422;
      }
      else
      {
        v253 = 0;
      }
      v254 = (float *)&v253[4 * v250];
      v246 = (float *)&v253[4 * v108];
      *v254 = 0.5;
      v248 = v254 + 1;
      while (v247 != v249)
      {
        v255 = *((_DWORD *)v247-- - 1);
        *((_DWORD *)v254-- - 1) = v255;
      }
      __p = v254;
      v422 = v248;
      v423 = (char *)v246;
      if (v249)
      {
        operator delete(v249);
        v246 = (float *)v423;
      }
    }
    else
    {
      *v422 = 0.5;
      v248 = v247 + 1;
    }
    v422 = v248;
    if (v248 >= v246)
    {
      v257 = (float *)__p;
      v258 = ((char *)v248 - (_BYTE *)__p) >> 2;
      v259 = v258 + 1;
      if ((unint64_t)(v258 + 1) >> 62)
        sub_1DCAE4C44();
      v260 = (char *)v246 - (_BYTE *)__p;
      if (v260 >> 1 > v259)
        v259 = v260 >> 1;
      if ((unint64_t)v260 >= 0x7FFFFFFFFFFFFFFCLL)
        v108 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v108 = v259;
      if (v108)
      {
        v261 = (char *)sub_1DCAE4D04((uint64_t)&v423, v108);
        v257 = (float *)__p;
        v248 = v422;
      }
      else
      {
        v261 = 0;
      }
      v262 = (float *)&v261[4 * v258];
      v263 = &v261[4 * v108];
      *v262 = 0.83333;
      v256 = v262 + 1;
      while (v248 != v257)
      {
        v264 = *((_DWORD *)v248-- - 1);
        *((_DWORD *)v262-- - 1) = v264;
      }
      __p = v262;
      v422 = v256;
      v423 = v263;
      if (v257)
        operator delete(v257);
    }
    else
    {
      *v248 = 0.83333;
      v256 = v248 + 1;
    }
    v422 = v256;
    v266 = v425;
    v265 = v426;
    if (v425 >= v426)
    {
      v268 = v424;
      v269 = (v425 - v424) >> 2;
      v270 = v269 + 1;
      if ((unint64_t)(v269 + 1) >> 62)
        sub_1DCAE4C44();
      v271 = v426 - v424;
      if ((v426 - v424) >> 1 > v270)
        v270 = v271 >> 1;
      if ((unint64_t)v271 >= 0x7FFFFFFFFFFFFFFCLL)
        v108 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v108 = v270;
      if (v108)
      {
        v272 = (char *)sub_1DCAE4D04((uint64_t)&v426, v108);
        v268 = v424;
        v266 = v425;
      }
      else
      {
        v272 = 0;
      }
      v273 = &v272[4 * v269];
      v265 = &v272[4 * v108];
      *(_DWORD *)v273 = 0;
      v267 = v273 + 4;
      while (v266 != v268)
      {
        v274 = *((_DWORD *)v266 - 1);
        v266 -= 4;
        *((_DWORD *)v273 - 1) = v274;
        v273 -= 4;
      }
      v424 = v273;
      v425 = v267;
      v426 = v265;
      if (v268)
      {
        operator delete(v268);
        v265 = v426;
      }
    }
    else
    {
      *(_DWORD *)v425 = 0;
      v267 = v266 + 4;
    }
    v425 = v267;
    if (v267 >= v265)
    {
      v276 = v424;
      v277 = (v267 - v424) >> 2;
      v278 = v277 + 1;
      if ((unint64_t)(v277 + 1) >> 62)
        sub_1DCAE4C44();
      v279 = v265 - v424;
      if (v279 >> 1 > v278)
        v278 = v279 >> 1;
      if ((unint64_t)v279 >= 0x7FFFFFFFFFFFFFFCLL)
        v108 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v108 = v278;
      if (v108)
      {
        v280 = (char *)sub_1DCAE4D04((uint64_t)&v426, v108);
        v276 = v424;
        v267 = v425;
      }
      else
      {
        v280 = 0;
      }
      v281 = &v280[4 * v277];
      v265 = &v280[4 * v108];
      *(float *)v281 = v406;
      v275 = v281 + 4;
      while (v267 != v276)
      {
        v282 = *((_DWORD *)v267 - 1);
        v267 -= 4;
        *((_DWORD *)v281 - 1) = v282;
        v281 -= 4;
      }
      v424 = v281;
      v425 = v275;
      v426 = v265;
      if (v276)
      {
        operator delete(v276);
        v265 = v426;
      }
    }
    else
    {
      *(float *)v267 = v406;
      v275 = v267 + 4;
    }
    v425 = v275;
    if (v275 >= v265)
    {
      v284 = v424;
      v285 = (v275 - v424) >> 2;
      v286 = v285 + 1;
      if ((unint64_t)(v285 + 1) >> 62)
        sub_1DCAE4C44();
      v287 = v265 - v424;
      if (v287 >> 1 > v286)
        v286 = v287 >> 1;
      if ((unint64_t)v287 >= 0x7FFFFFFFFFFFFFFCLL)
        v108 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v108 = v286;
      if (v108)
      {
        v288 = (char *)sub_1DCAE4D04((uint64_t)&v426, v108);
        v284 = v424;
        v275 = v425;
      }
      else
      {
        v288 = 0;
      }
      v289 = &v288[4 * v285];
      v290 = &v288[4 * v108];
      *(_DWORD *)v289 = 0;
      v283 = v289 + 4;
      while (v275 != v284)
      {
        v291 = *((_DWORD *)v275 - 1);
        v275 -= 4;
        *((_DWORD *)v289 - 1) = v291;
        v289 -= 4;
      }
      v424 = v289;
      v425 = v283;
      v426 = v290;
      if (v284)
        operator delete(v284);
    }
    else
    {
      *(_DWORD *)v275 = 0;
      v283 = v275 + 4;
    }
    v425 = v283;
    v292 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_name(v405, (const char *)v108, v109);
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v292, v294, (uint64_t)CFSTR("%@-%@"), v293, CFSTR("position"));
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    v296 = objc_alloc(MEMORY[0x1E0C99D50]);
    v298 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v296, v297, (uint64_t)v427, (char *)v428 - (char *)v427, 0);
    objc_msgSend_addAttributeWithName_format_type_data_stride_(v405, v299, (uint64_t)v295, 786435, CFSTR("position"), v298, 12);

    v300 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_name(v405, v301, v302);
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v300, v304, (uint64_t)CFSTR("%@-%@"), v303, CFSTR("normal"));
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    v306 = objc_alloc(MEMORY[0x1E0C99D50]);
    v308 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v306, v307, (uint64_t)v424, v425 - v424, 0);
    objc_msgSend_addAttributeWithName_format_type_data_stride_(v405, v309, (uint64_t)v305, 786435, CFSTR("normal"), v308, 12);

    v310 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_name(v405, v311, v312);
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v310, v314, (uint64_t)CFSTR("%@-%@"), v313, CFSTR("textureCoordinate"));
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    v316 = objc_alloc(MEMORY[0x1E0C99D50]);
    v318 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v316, v317, (uint64_t)__p, (char *)v422 - (_BYTE *)__p, 0);
    objc_msgSend_addAttributeWithName_format_type_data_stride_(v405, v319, (uint64_t)v315, 786434, CFSTR("textureCoordinate"), v318, 8);

    objc_msgSend_name(v405, v320, v321);
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    if (v402 > 0xFFFE)
      sub_1DCB0CB0C(v322, v404, v413, v412, (v428 - v427) / 3uLL - 1, v403);
    else
      sub_1DCB0BC88(v322, v404, v413, v412, (v428 - v427) / 3uLL - 1, v403);
    v323 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setVertexCount_(v405, v324, (v428 - v427) / 3uLL);
    v325 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend_setSubmeshes_(v405, v326, (uint64_t)v325);

    objc_msgSend_submeshes(v405, v327, v328);
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v329, v330, (uint64_t)v323);

    v331 = objc_alloc_init(MDLVertexDescriptor);
    objc_msgSend_attributes(v331, v332, v333);
    v334 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v334, v335, 0);
    v336 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v336, v337, (uint64_t)CFSTR("position"));

    objc_msgSend_attributes(v331, v338, v339);
    v340 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v340, v341, 0);
    v342 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFormat_(v342, v343, 786435);

    objc_msgSend_attributes(v331, v344, v345);
    v346 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v346, v347, 0);
    v348 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBufferIndex_(v348, v349, 0);

    objc_msgSend_attributes(v331, v350, v351);
    v352 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v352, v353, 1);
    v354 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v354, v355, (uint64_t)CFSTR("normal"));

    objc_msgSend_attributes(v331, v356, v357);
    v358 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v358, v359, 1);
    v360 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFormat_(v360, v361, 786435);

    objc_msgSend_attributes(v331, v362, v363);
    v364 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v364, v365, 1);
    v366 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBufferIndex_(v366, v367, 0);

    objc_msgSend_attributes(v331, v368, v369);
    v370 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v370, v371, 2);
    v372 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v372, v373, (uint64_t)CFSTR("textureCoordinate"));

    objc_msgSend_attributes(v331, v374, v375);
    v376 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v376, v377, 2);
    v378 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFormat_(v378, v379, 786434);

    objc_msgSend_attributes(v331, v380, v381);
    v382 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v382, v383, 2);
    v384 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBufferIndex_(v384, v385, 0);

    objc_msgSend_setPackedOffsets(v331, v386, v387);
    objc_msgSend_setPackedStrides(v331, v388, v389);
    v390 = [MDLAsset alloc];
    objc_msgSend_vertexDescriptor(v405, v391, v392);
    v393 = (void *)objc_claimAutoreleasedReturnValue();
    v395 = (void *)objc_msgSend_initWithURL_vertexDescriptor_bufferAllocator_(v390, v394, 0, v393, v404);

    objc_msgSend_addObject_(v395, v396, (uint64_t)v405);
    objc_msgSend__conformVertexBuffers_error_(v395, v397, (uint64_t)v331, 0);
    objc_msgSend_removeObject_(v395, v398, (uint64_t)v405);

    if (__p)
    {
      v422 = (float *)__p;
      operator delete(__p);
    }
    if (v424)
    {
      v425 = v424;
      operator delete(v424);
    }
    if (v427)
    {
      v428 = v427;
      operator delete(v427);
    }
    v220 = v404;
    objc_autoreleasePoolPop(context);
    v21 = v405;
    v399 = v405;
  }
  else
  {
    v220 = v15;
  }

  return v21;
}

+ (MDLMesh)newEllipticalConeWithHeight:(float)height radii:(vector_float2)radii radialSegments:(NSUInteger)radialSegments verticalSegments:(NSUInteger)verticalSegments geometryType:(MDLGeometryType)geometryType inwardNormals:(BOOL)inwardNormals allocator:(id)allocator
{
  _BOOL8 v9;
  unsigned int v11;
  unsigned int v12;
  id v13;
  MDLMesh *v14;
  const char *v15;
  MDLMesh *inited;
  __int32 v19;

  v9 = inwardNormals;
  v11 = verticalSegments;
  v12 = radialSegments;
  v19 = radii.i32[0];
  v13 = allocator;
  v14 = [MDLMesh alloc];
  inited = (MDLMesh *)objc_msgSend_initConeWithExtent_segments_inwardNormals_cap_geometryType_allocator_(v14, v15, v9, 1, geometryType, v13, COERCE_DOUBLE(__PAIR64__(LODWORD(height), v19)), COERCE_DOUBLE(__PAIR64__(v11, v12)));

  return inited;
}

- (MDLMesh)initBoxWithExtent:(vector_float3)extent segments:(vector_uint3)segments inwardNormals:(BOOL)inwardNormals geometryType:(MDLGeometryType)geometryType allocator:(id)allocator
{
  __int128 v7;
  unint64_t v8;
  int v9;
  const char *v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  const char *v18;
  MDLMesh *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int16 v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  __int16 v66;
  __int16 v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  char *v74;
  char *v75;
  __int16 v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  char *v83;
  char *v84;
  __int16 v85;
  __int16 v86;
  __int16 v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  char *v93;
  char *v94;
  __int16 v95;
  char *v96;
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  __int16 v104;
  __int16 v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  char *v112;
  char *v113;
  __int16 v114;
  __int16 v115;
  char *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  unint64_t v121;
  char *v122;
  char *v123;
  __int16 v124;
  __int16 v125;
  char *v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  unint64_t v131;
  char *v132;
  char *v133;
  __int16 v134;
  __int16 v135;
  char *v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  unint64_t v141;
  char *v142;
  char *v143;
  __int16 v144;
  __int16 v145;
  __int16 v146;
  char *v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  unint64_t v152;
  char *v153;
  char *v154;
  __int16 v155;
  __int16 v156;
  char *v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  unint64_t v162;
  char *v163;
  char *v164;
  __int16 v165;
  __int16 v166;
  __int16 v167;
  char *v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  unint64_t v173;
  char *v174;
  char *v175;
  __int16 v176;
  __int16 v177;
  char *v178;
  char *v179;
  uint64_t v180;
  uint64_t v181;
  unint64_t v182;
  unint64_t v183;
  char *v184;
  char *v185;
  __int16 v186;
  char *v187;
  char *v188;
  uint64_t v189;
  uint64_t v190;
  unint64_t v191;
  unint64_t v192;
  char *v193;
  char *v194;
  __int16 v195;
  char *v196;
  char *v197;
  uint64_t v198;
  uint64_t v199;
  unint64_t v200;
  unint64_t v201;
  char *v202;
  char *v203;
  __int16 v204;
  __int16 v205;
  char *v206;
  uint64_t v207;
  uint64_t v208;
  unint64_t v209;
  unint64_t v210;
  char *v211;
  char *v212;
  __int16 v213;
  __int16 v214;
  uint64_t v215;
  uint64_t v216;
  unint64_t v217;
  unint64_t v218;
  char *v219;
  __int16 v220;
  char *v221;
  uint64_t v222;
  uint64_t v223;
  unint64_t v224;
  unint64_t v225;
  char *v226;
  char *v227;
  __int16 v228;
  __int16 v229;
  char *v230;
  char *v231;
  uint64_t v232;
  uint64_t v233;
  unint64_t v234;
  unint64_t v235;
  char *v236;
  char *v237;
  __int16 v238;
  __int16 v239;
  char *v240;
  __int16 v241;
  uint64_t v242;
  uint64_t v243;
  unint64_t v244;
  unint64_t v245;
  char *v246;
  __int16 v247;
  char *v248;
  uint64_t v249;
  uint64_t v250;
  unint64_t v251;
  unint64_t v252;
  char *v253;
  __int16 v254;
  __int16 v255;
  char *v256;
  uint64_t v257;
  uint64_t v258;
  unint64_t v259;
  unint64_t v260;
  char *v261;
  __int16 v262;
  __int16 v263;
  char *v264;
  __int16 v265;
  char *v266;
  char *v267;
  char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  char *v272;
  char *v273;
  __int16 v274;
  __int16 v275;
  uint64_t v276;
  uint64_t v277;
  unint64_t v278;
  unint64_t v279;
  __int16 v280;
  __int16 v281;
  const char *v282;
  const char *v283;
  void *v284;
  void *v285;
  objc_class *v286;
  void *v287;
  void *v288;
  const char *v289;
  const char *v290;
  id v291;
  void *v292;
  const char *v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  void *v297;
  const char *v298;
  id v299;
  const char *v300;
  const char *v301;
  void *v302;
  const char *v303;
  id v304;
  const char *v305;
  uint64_t v306;
  void *v307;
  const char *v308;
  void *v309;
  const char *v310;
  MDLSubmesh *v311;
  MDLMaterial *v312;
  const char *v313;
  uint64_t v314;
  void *v315;
  const char *v316;
  void *v317;
  void *v318;
  const char *v319;
  void *v320;
  const char *v321;
  void *v322;
  const char *v323;
  uint64_t v324;
  void *v325;
  const char *v326;
  void *v327;
  const char *v328;
  const char *v329;
  void *v330;
  const char *v331;
  MDLMesh *v332;
  void *v333;
  const char *aSelector;
  void *context;
  void *v337;
  void *v338;
  MDLMesh *v339;
  uint64_t v340;
  __int16 v341;
  uint64_t v342;
  uint64_t v343;
  void *v344;
  __int128 v345;
  int v346;
  void *v347;
  __int16 v349;
  uint64_t v350;
  char *__p;
  char *v352;
  char *v353;
  void *v354;
  _BYTE *v355;
  uint64_t v356;
  void *v357;
  _QWORD v358[6];
  _QWORD v359[8];

  v8 = extent.u64[1];
  v9 = extent.i32[0];
  v345 = v7;
  v359[6] = *MEMORY[0x1E0C80C00];
  v13 = (id)inwardNormals;
  if (v8 > 4 || ((1 << v8) & 0x16) == 0)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v14, v18, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: geometryType must be MDLGeometryTypeLines, MDLGeometryTypeTriangles, or MDLGeometryTypeQuads"), v16, v17);

  }
  v19 = (MDLMesh *)(id)objc_msgSend_initWithBufferAllocator_(self, v12, (uint64_t)v13);

  v339 = v19;
  if (!v19)
  {
    v333 = v13;
    goto LABEL_515;
  }
  objc_msgSend_allocator(v19, v20, v21);
  aSelector = a2;
  v338 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = MEMORY[0x1DF0D25C8]();
  sub_1DCB12C54();
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)v22;
  if (DWORD1(v345) <= 1)
    v23 = 1;
  else
    v23 = DWORD1(v345);
  if (v345 <= 1)
    v24 = 1;
  else
    v24 = v345;
  v354 = 0;
  v355 = 0;
  v356 = 0;
  sub_1DCB12ED4((uint64_t)&v354, DWORD2(v345), v23, v9, (int32x4_t)xmmword_1DCC58360, (float32x4_t)xmmword_1DCC58370, *(float *)&segments.i32[2], *(float *)&segments.i32[1], *(float *)segments.i32);
  sub_1DCB12ED4((uint64_t)&v354, DWORD2(v345), v23, v9, (int32x4_t)xmmword_1DCC58380, (float32x4_t)xmmword_1DCC58370, *(float *)&segments.i32[2], *(float *)&segments.i32[1], *(float *)segments.i32);
  sub_1DCB12ED4((uint64_t)&v354, v24, DWORD2(v345), v9, (int32x4_t)xmmword_1DCC56FD0, (float32x4_t)xmmword_1DCC58380, *(float *)segments.i32, *(float *)&segments.i32[2], *(float *)&segments.i32[1]);
  sub_1DCB12ED4((uint64_t)&v354, v24, DWORD2(v345), v9, (int32x4_t)xmmword_1DCC56FD0, (float32x4_t)xmmword_1DCC58360, *(float *)segments.i32, *(float *)&segments.i32[2], *(float *)&segments.i32[1]);
  sub_1DCB12ED4((uint64_t)&v354, v24, v23, v9, (int32x4_t)xmmword_1DCC56FD0, (float32x4_t)xmmword_1DCC58370, *(float *)segments.i32, *(float *)&segments.i32[1], *(float *)&segments.i32[2]);
  sub_1DCB12ED4((uint64_t)&v354, v24, v23, v9, (int32x4_t)xmmword_1DCC58390, (float32x4_t)xmmword_1DCC58370, *(float *)segments.i32, *(float *)&segments.i32[1], *(float *)&segments.i32[2]);
  v26 = 0;
  v27 = 0;
  v341 = 0;
  v359[0] = DWORD2(v345);
  v359[1] = DWORD2(v345);
  v359[2] = v24;
  v359[3] = v24;
  v359[4] = v24;
  v359[5] = v24;
  v358[0] = v23;
  v358[1] = v23;
  v358[2] = DWORD2(v345);
  v358[3] = DWORD2(v345);
  v358[4] = v23;
  v358[5] = v23;
  __p = 0;
  v352 = 0;
  v353 = 0;
  v346 = v9;
  do
  {
    v28 = v359[v27];
    v340 = v27;
    v342 = v358[v27];
    if (v342)
    {
      v29 = 0;
      while (!v28)
      {
        ++v29;
LABEL_499:
        if (v29 == v342)
        {
          v281 = v28 + 1;
          goto LABEL_502;
        }
      }
      v30 = 0;
      v349 = v341 + v29 * (v28 + 1);
      v343 = v29 + 1;
      while (1)
      {
        v31 = v349 + v30;
        if (v8 != 4)
          break;
        v36 = v353;
        if (v9)
        {
          if (v26 >= v353)
          {
            v55 = __p;
            v56 = v26 - __p;
            if (v26 - __p <= -3)
              sub_1DCAE4C44();
            v57 = v56 >> 1;
            if (v353 - __p <= (unint64_t)((v56 >> 1) + 1))
              v58 = v57 + 1;
            else
              v58 = v353 - __p;
            if ((unint64_t)(v353 - __p) >= 0x7FFFFFFFFFFFFFFELL)
              v25 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v25 = v58;
            if (v25)
            {
              v59 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
              v55 = __p;
              v26 = v352;
            }
            else
            {
              v59 = 0;
            }
            v123 = &v59[2 * v57];
            *(_WORD *)v123 = v31;
            v37 = v123 + 2;
            while (v26 != v55)
            {
              v124 = *((_WORD *)v26 - 1);
              v26 -= 2;
              *((_WORD *)v123 - 1) = v124;
              v123 -= 2;
            }
            v36 = &v59[2 * v25];
            __p = v123;
            v353 = v36;
            if (v55)
            {
              operator delete(v55);
              v36 = v353;
            }
          }
          else
          {
            *(_WORD *)v26 = v31;
            v37 = v26 + 2;
          }
          v125 = v31 + 1;
          if (v37 >= v36)
          {
            v127 = __p;
            v128 = v37 - __p;
            if (v37 - __p <= -3)
              sub_1DCAE4C44();
            v129 = v128 >> 1;
            v130 = v36 - __p;
            if (v130 <= (v128 >> 1) + 1)
              v131 = v129 + 1;
            else
              v131 = v130;
            if (v130 >= 0x7FFFFFFFFFFFFFFELL)
              v25 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v25 = v131;
            if (v25)
            {
              v132 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
              v127 = __p;
            }
            else
            {
              v132 = 0;
            }
            v164 = &v132[2 * v129];
            *(_WORD *)v164 = v125;
            v126 = v164 + 2;
            while (v37 != v127)
            {
              v165 = *((_WORD *)v37 - 1);
              v37 -= 2;
              *((_WORD *)v164 - 1) = v165;
              v164 -= 2;
            }
            v36 = &v132[2 * v25];
            __p = v164;
            v353 = v36;
            if (v127)
            {
              operator delete(v127);
              v36 = v353;
            }
          }
          else
          {
            *(_WORD *)v37 = v125;
            v126 = v37 + 2;
          }
          v166 = v31 + v28;
          v167 = v31 + v28 + 2;
          if (v126 >= v36)
          {
            v169 = __p;
            v170 = v126 - __p;
            if (v126 - __p <= -3)
              sub_1DCAE4C44();
            v171 = v170 >> 1;
            v172 = v36 - __p;
            if (v172 <= (v170 >> 1) + 1)
              v173 = v171 + 1;
            else
              v173 = v172;
            if (v172 >= 0x7FFFFFFFFFFFFFFELL)
              v25 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v25 = v173;
            if (v25)
            {
              v174 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
              v169 = __p;
            }
            else
            {
              v174 = 0;
            }
            v203 = &v174[2 * v171];
            *(_WORD *)v203 = v167;
            v168 = v203 + 2;
            while (v126 != v169)
            {
              v204 = *((_WORD *)v126 - 1);
              v126 -= 2;
              *((_WORD *)v203 - 1) = v204;
              v203 -= 2;
            }
            v36 = &v174[2 * v25];
            __p = v203;
            v353 = v36;
            if (v169)
            {
              operator delete(v169);
              v36 = v353;
            }
          }
          else
          {
            *(_WORD *)v126 = v167;
            v168 = v126 + 2;
          }
          v205 = v166 + 1;
          if (v168 >= v36)
          {
            v206 = __p;
            v207 = v168 - __p;
            if (v168 - __p <= -3)
              sub_1DCAE4C44();
            v208 = v207 >> 1;
            v209 = v36 - __p;
            if (v209 <= (v207 >> 1) + 1)
              v210 = v208 + 1;
            else
              v210 = v209;
            if (v209 >= 0x7FFFFFFFFFFFFFFELL)
              v25 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v25 = v210;
            if (v25)
            {
              v211 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
              v206 = __p;
            }
            else
            {
              v211 = 0;
            }
            v237 = &v211[2 * v208];
            *(_WORD *)v237 = v205;
            v26 = v237 + 2;
            while (v168 != v206)
            {
              v238 = *((_WORD *)v168 - 1);
              v168 -= 2;
              *((_WORD *)v237 - 1) = v238;
              v237 -= 2;
            }
            goto LABEL_493;
          }
LABEL_398:
          *(_WORD *)v168 = v205;
          v26 = v168 + 2;
          goto LABEL_495;
        }
        if (v26 >= v353)
        {
          v60 = __p;
          v61 = v26 - __p;
          if (v26 - __p <= -3)
            sub_1DCAE4C44();
          v62 = v61 >> 1;
          if (v353 - __p <= (unint64_t)((v61 >> 1) + 1))
            v63 = v62 + 1;
          else
            v63 = v353 - __p;
          if ((unint64_t)(v353 - __p) >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v63;
          if (v25)
          {
            v64 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
            v60 = __p;
            v26 = v352;
          }
          else
          {
            v64 = 0;
          }
          v133 = &v64[2 * v62];
          *(_WORD *)v133 = v31;
          v39 = v133 + 2;
          while (v26 != v60)
          {
            v134 = *((_WORD *)v26 - 1);
            v26 -= 2;
            *((_WORD *)v133 - 1) = v134;
            v133 -= 2;
          }
          v36 = &v64[2 * v25];
          __p = v133;
          v353 = v36;
          if (v60)
          {
            operator delete(v60);
            v36 = v353;
          }
        }
        else
        {
          *(_WORD *)v26 = v31;
          v39 = v26 + 2;
        }
        v135 = v31 + v28 + 1;
        if (v39 >= v36)
        {
          v137 = __p;
          v138 = v39 - __p;
          if (v39 - __p <= -3)
            sub_1DCAE4C44();
          v139 = v138 >> 1;
          v140 = v36 - __p;
          if (v140 <= (v138 >> 1) + 1)
            v141 = v139 + 1;
          else
            v141 = v140;
          if (v140 >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v141;
          if (v25)
          {
            v142 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
            v137 = __p;
          }
          else
          {
            v142 = 0;
          }
          v175 = &v142[2 * v139];
          *(_WORD *)v175 = v135;
          v136 = v175 + 2;
          while (v39 != v137)
          {
            v176 = *((_WORD *)v39 - 1);
            v39 -= 2;
            *((_WORD *)v175 - 1) = v176;
            v175 -= 2;
          }
          v36 = &v142[2 * v25];
          __p = v175;
          v353 = v36;
          if (v137)
          {
            operator delete(v137);
            v36 = v353;
          }
        }
        else
        {
          *(_WORD *)v39 = v135;
          v136 = v39 + 2;
        }
        v177 = v31 + v28 + 2;
        if (v136 >= v36)
        {
          v179 = __p;
          v180 = v136 - __p;
          if (v136 - __p <= -3)
            sub_1DCAE4C44();
          v181 = v180 >> 1;
          v182 = v36 - __p;
          if (v182 <= (v180 >> 1) + 1)
            v183 = v181 + 1;
          else
            v183 = v182;
          if (v182 >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v183;
          if (v25)
          {
            v184 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
            v179 = __p;
          }
          else
          {
            v184 = 0;
          }
          v212 = &v184[2 * v181];
          *(_WORD *)v212 = v177;
          v178 = v212 + 2;
          while (v136 != v179)
          {
            v213 = *((_WORD *)v136 - 1);
            v136 -= 2;
            *((_WORD *)v212 - 1) = v213;
            v212 -= 2;
          }
          v36 = &v184[2 * v25];
          __p = v212;
          v353 = v36;
          if (v179)
          {
            operator delete(v179);
            v36 = v353;
          }
        }
        else
        {
          *(_WORD *)v136 = v177;
          v178 = v136 + 2;
        }
        v214 = v31 + 1;
        if (v178 >= v36)
        {
          v206 = __p;
          v215 = v178 - __p;
          if (v178 - __p <= -3)
            sub_1DCAE4C44();
          v216 = v215 >> 1;
          v217 = v36 - __p;
          if (v217 <= (v215 >> 1) + 1)
            v218 = v216 + 1;
          else
            v218 = v217;
          if (v217 >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v218;
          if (v25)
          {
            v211 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
            v206 = __p;
          }
          else
          {
            v211 = 0;
          }
          v237 = &v211[2 * v216];
          *(_WORD *)v237 = v214;
          v26 = v237 + 2;
          while (v178 != v206)
          {
            v239 = *((_WORD *)v178 - 1);
            v178 -= 2;
            *((_WORD *)v237 - 1) = v239;
            v237 -= 2;
          }
          goto LABEL_493;
        }
        *(_WORD *)v178 = v214;
        v26 = v178 + 2;
LABEL_495:
        v352 = v26;
LABEL_496:
        if (++v30 == v28)
        {
          v29 = v343;
          goto LABEL_499;
        }
      }
      if (v8 != 2)
      {
        if (v8 != 1)
          goto LABEL_496;
        v32 = v353;
        if (v26 >= v353)
        {
          v40 = __p;
          v41 = v26 - __p;
          if (v26 - __p <= -3)
            sub_1DCAE4C44();
          v42 = v41 >> 1;
          if (v353 - __p <= (unint64_t)((v41 >> 1) + 1))
            v43 = v42 + 1;
          else
            v43 = v353 - __p;
          if ((unint64_t)(v353 - __p) >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v43;
          if (v25)
          {
            v44 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
            v40 = __p;
            v26 = v352;
          }
          else
          {
            v44 = 0;
          }
          v65 = &v44[2 * v42];
          *(_WORD *)v65 = v31;
          v33 = v65 + 2;
          while (v26 != v40)
          {
            v66 = *((_WORD *)v26 - 1);
            v26 -= 2;
            *((_WORD *)v65 - 1) = v66;
            v65 -= 2;
          }
          v32 = &v44[2 * v25];
          __p = v65;
          v353 = v32;
          if (v40)
          {
            operator delete(v40);
            v32 = v353;
          }
        }
        else
        {
          *(_WORD *)v26 = v31;
          v33 = v26 + 2;
        }
        v67 = v31 + 1;
        if (v33 >= v32)
        {
          v69 = __p;
          v70 = v33 - __p;
          if (v33 - __p <= -3)
            sub_1DCAE4C44();
          v71 = v70 >> 1;
          v72 = v32 - __p;
          if (v72 <= (v70 >> 1) + 1)
            v73 = v71 + 1;
          else
            v73 = v72;
          if (v72 >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v73;
          if (v25)
          {
            v74 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
            v69 = __p;
          }
          else
          {
            v74 = 0;
          }
          v75 = &v74[2 * v71];
          *(_WORD *)v75 = v67;
          v68 = v75 + 2;
          while (v33 != v69)
          {
            v76 = *((_WORD *)v33 - 1);
            v33 -= 2;
            *((_WORD *)v75 - 1) = v76;
            v75 -= 2;
          }
          v32 = &v74[2 * v25];
          __p = v75;
          v353 = v32;
          if (v69)
          {
            operator delete(v69);
            v32 = v353;
          }
        }
        else
        {
          *(_WORD *)v33 = v67;
          v68 = v33 + 2;
        }
        if (v68 >= v32)
        {
          v78 = __p;
          v79 = v68 - __p;
          if (v68 - __p <= -3)
            sub_1DCAE4C44();
          v80 = v79 >> 1;
          v81 = v32 - __p;
          if (v81 <= (v79 >> 1) + 1)
            v82 = v80 + 1;
          else
            v82 = v81;
          if (v81 >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v82;
          if (v25)
          {
            v83 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
            v78 = __p;
          }
          else
          {
            v83 = 0;
          }
          v84 = &v83[2 * v80];
          *(_WORD *)v84 = v31;
          v77 = v84 + 2;
          while (v68 != v78)
          {
            v85 = *((_WORD *)v68 - 1);
            v68 -= 2;
            *((_WORD *)v84 - 1) = v85;
            v84 -= 2;
          }
          v32 = &v83[2 * v25];
          __p = v84;
          v353 = v32;
          if (v78)
          {
            operator delete(v78);
            v32 = v353;
          }
        }
        else
        {
          *(_WORD *)v68 = v31;
          v77 = v68 + 2;
        }
        v86 = v31 + v28;
        v87 = v86 + 1;
        if (v77 >= v32)
        {
          v88 = __p;
          v89 = v77 - __p;
          if (v77 - __p <= -3)
            sub_1DCAE4C44();
          v90 = v89 >> 1;
          v91 = v32 - __p;
          if (v91 <= (v89 >> 1) + 1)
            v92 = v90 + 1;
          else
            v92 = v91;
          if (v91 >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v92;
          if (v25)
          {
            v93 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
            v88 = __p;
          }
          else
          {
            v93 = 0;
          }
          v94 = &v93[2 * v90];
          *(_WORD *)v94 = v87;
          v26 = v94 + 2;
          while (v77 != v88)
          {
            v95 = *((_WORD *)v77 - 1);
            v77 -= 2;
            *((_WORD *)v94 - 1) = v95;
            v94 -= 2;
          }
          __p = v94;
          v353 = &v93[2 * v25];
          if (v88)
            operator delete(v88);
        }
        else
        {
          *(_WORD *)v77 = v87;
          v26 = v77 + 2;
        }
        v352 = v26;
        if (v30 + 1 == v28)
        {
          v96 = v353;
          if (v26 >= v353)
          {
            v98 = __p;
            v99 = v26 - __p;
            if (v26 - __p <= -3)
              sub_1DCAE4C44();
            v100 = v99 >> 1;
            if (v353 - __p <= (unint64_t)((v99 >> 1) + 1))
              v101 = v100 + 1;
            else
              v101 = v353 - __p;
            if ((unint64_t)(v353 - __p) >= 0x7FFFFFFFFFFFFFFELL)
              v25 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v25 = v101;
            if (v25)
            {
              v102 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
              v98 = __p;
            }
            else
            {
              v102 = 0;
            }
            v253 = &v102[2 * v100];
            *(_WORD *)v253 = v67;
            v97 = v253 + 2;
            while (v26 != v98)
            {
              v254 = *((_WORD *)v26 - 1);
              v26 -= 2;
              *((_WORD *)v253 - 1) = v254;
              v253 -= 2;
            }
            v96 = &v102[2 * v25];
            __p = v253;
            v353 = v96;
            if (v98)
            {
              operator delete(v98);
              v96 = v353;
            }
          }
          else
          {
            *(_WORD *)v26 = v67;
            v97 = v26 + 2;
          }
          v255 = v86 + 2;
          if (v97 >= v96)
          {
            v256 = __p;
            v257 = v97 - __p;
            if (v97 - __p <= -3)
              sub_1DCAE4C44();
            v258 = v257 >> 1;
            v259 = v96 - __p;
            if (v259 <= (v257 >> 1) + 1)
              v260 = v258 + 1;
            else
              v260 = v259;
            if (v259 >= 0x7FFFFFFFFFFFFFFELL)
              v25 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v25 = v260;
            if (v25)
            {
              v261 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
              v256 = __p;
            }
            else
            {
              v261 = 0;
            }
            v264 = &v261[2 * v258];
            *(_WORD *)v264 = v255;
            v26 = v264 + 2;
            if (v97 == v256)
            {
              v9 = v346;
            }
            else
            {
              v9 = v346;
              do
              {
                v265 = *((_WORD *)v97 - 1);
                v97 -= 2;
                *((_WORD *)v264 - 1) = v265;
                v264 -= 2;
              }
              while (v97 != v256);
            }
            __p = v264;
            v353 = &v261[2 * v25];
            if (v256)
              operator delete(v256);
          }
          else
          {
            *(_WORD *)v97 = v255;
            v26 = v97 + 2;
            v9 = v346;
          }
          v352 = v26;
        }
        else
        {
          v9 = v346;
        }
        if (v343 != v342)
          goto LABEL_496;
        v266 = v353;
        if (v26 >= v353)
        {
          v268 = __p;
          v269 = v26 - __p;
          if (v26 - __p <= -3)
            sub_1DCAE4C44();
          v270 = v269 >> 1;
          if (v353 - __p <= (unint64_t)((v269 >> 1) + 1))
            v271 = v270 + 1;
          else
            v271 = v353 - __p;
          if ((unint64_t)(v353 - __p) >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v271;
          if (v25)
          {
            v272 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
            v268 = __p;
            v26 = v352;
          }
          else
          {
            v272 = 0;
          }
          v273 = &v272[2 * v270];
          *(_WORD *)v273 = v87;
          v267 = v273 + 2;
          while (v26 != v268)
          {
            v274 = *((_WORD *)v26 - 1);
            v26 -= 2;
            *((_WORD *)v273 - 1) = v274;
            v273 -= 2;
          }
          v266 = &v272[2 * v25];
          __p = v273;
          v353 = v266;
          if (v268)
          {
            operator delete(v268);
            v266 = v353;
          }
        }
        else
        {
          *(_WORD *)v26 = v87;
          v267 = v26 + 2;
        }
        v275 = v86 + 2;
        if (v267 >= v266)
        {
          v206 = __p;
          v276 = v267 - __p;
          if (v267 - __p <= -3)
            sub_1DCAE4C44();
          v277 = v276 >> 1;
          v278 = v266 - __p;
          if (v278 <= (v276 >> 1) + 1)
            v279 = v277 + 1;
          else
            v279 = v278;
          if (v278 >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v279;
          if (v25)
          {
            v211 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
            v206 = __p;
          }
          else
          {
            v211 = 0;
          }
          v237 = &v211[2 * v277];
          *(_WORD *)v237 = v275;
          v26 = v237 + 2;
          while (v267 != v206)
          {
            v280 = *((_WORD *)v267 - 1);
            v267 -= 2;
            *((_WORD *)v237 - 1) = v280;
            v237 -= 2;
          }
LABEL_493:
          __p = v237;
          v353 = &v211[2 * v25];
          if (v206)
            operator delete(v206);
          goto LABEL_495;
        }
        *(_WORD *)v267 = v275;
        v248 = v267 + 2;
        goto LABEL_479;
      }
      v34 = v353;
      if (!v9)
      {
        if (v26 >= v353)
        {
          v50 = __p;
          v51 = v26 - __p;
          if (v26 - __p <= -3)
            sub_1DCAE4C44();
          v52 = v51 >> 1;
          if (v353 - __p <= (unint64_t)((v51 >> 1) + 1))
            v53 = v52 + 1;
          else
            v53 = v353 - __p;
          if ((unint64_t)(v353 - __p) >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v53;
          if (v25)
          {
            v54 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
            v50 = __p;
            v26 = v352;
          }
          else
          {
            v54 = 0;
          }
          v113 = &v54[2 * v52];
          *(_WORD *)v113 = v31;
          v38 = v113 + 2;
          while (v26 != v50)
          {
            v114 = *((_WORD *)v26 - 1);
            v26 -= 2;
            *((_WORD *)v113 - 1) = v114;
            v113 -= 2;
          }
          v34 = &v54[2 * v25];
          __p = v113;
          v353 = v34;
          if (v50)
          {
            operator delete(v50);
            v34 = v353;
          }
        }
        else
        {
          *(_WORD *)v26 = v31;
          v38 = v26 + 2;
        }
        v115 = v31 + v28 + 2;
        if (v38 >= v34)
        {
          v117 = __p;
          v118 = v38 - __p;
          if (v38 - __p <= -3)
            sub_1DCAE4C44();
          v119 = v118 >> 1;
          v120 = v34 - __p;
          if (v120 <= (v118 >> 1) + 1)
            v121 = v119 + 1;
          else
            v121 = v120;
          if (v120 >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v121;
          if (v25)
          {
            v122 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
            v117 = __p;
          }
          else
          {
            v122 = 0;
          }
          v154 = &v122[2 * v119];
          *(_WORD *)v154 = v115;
          v116 = v154 + 2;
          while (v38 != v117)
          {
            v155 = *((_WORD *)v38 - 1);
            v38 -= 2;
            *((_WORD *)v154 - 1) = v155;
            v154 -= 2;
          }
          v34 = &v122[2 * v25];
          __p = v154;
          v353 = v34;
          if (v117)
          {
            operator delete(v117);
            v34 = v353;
          }
        }
        else
        {
          *(_WORD *)v38 = v115;
          v116 = v38 + 2;
        }
        v156 = v31 + 1;
        if (v116 >= v34)
        {
          v158 = __p;
          v159 = v116 - __p;
          if (v116 - __p <= -3)
            sub_1DCAE4C44();
          v160 = v159 >> 1;
          v161 = v34 - __p;
          if (v161 <= (v159 >> 1) + 1)
            v162 = v160 + 1;
          else
            v162 = v161;
          if (v161 >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v162;
          if (v25)
          {
            v163 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
            v158 = __p;
          }
          else
          {
            v163 = 0;
          }
          v194 = &v163[2 * v160];
          *(_WORD *)v194 = v156;
          v157 = v194 + 2;
          while (v116 != v158)
          {
            v195 = *((_WORD *)v116 - 1);
            v116 -= 2;
            *((_WORD *)v194 - 1) = v195;
            v194 -= 2;
          }
          v34 = &v163[2 * v25];
          __p = v194;
          v353 = v34;
          if (v158)
          {
            operator delete(v158);
            v34 = v353;
          }
        }
        else
        {
          *(_WORD *)v116 = v156;
          v157 = v116 + 2;
        }
        if (v157 >= v34)
        {
          v197 = __p;
          v198 = v157 - __p;
          if (v157 - __p <= -3)
            sub_1DCAE4C44();
          v199 = v198 >> 1;
          v200 = v34 - __p;
          if (v200 <= (v198 >> 1) + 1)
            v201 = v199 + 1;
          else
            v201 = v200;
          if (v200 >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v201;
          if (v25)
          {
            v202 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
            v197 = __p;
          }
          else
          {
            v202 = 0;
          }
          v227 = &v202[2 * v199];
          *(_WORD *)v227 = v31;
          v196 = v227 + 2;
          while (v157 != v197)
          {
            v228 = *((_WORD *)v157 - 1);
            v157 -= 2;
            *((_WORD *)v227 - 1) = v228;
            v227 -= 2;
          }
          v34 = &v202[2 * v25];
          __p = v227;
          v353 = v34;
          if (v197)
          {
            operator delete(v197);
            v34 = v353;
          }
        }
        else
        {
          *(_WORD *)v157 = v31;
          v196 = v157 + 2;
        }
        v9 = v346;
        v229 = v31 + v28 + 1;
        if (v196 >= v34)
        {
          v231 = __p;
          v232 = v196 - __p;
          if (v196 - __p <= -3)
            sub_1DCAE4C44();
          v233 = v232 >> 1;
          v234 = v34 - __p;
          if (v234 <= (v232 >> 1) + 1)
            v235 = v233 + 1;
          else
            v235 = v234;
          if (v234 >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v235;
          if (v25)
          {
            v236 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
            v231 = __p;
          }
          else
          {
            v236 = 0;
          }
          v246 = &v236[2 * v233];
          *(_WORD *)v246 = v229;
          v230 = v246 + 2;
          while (v196 != v231)
          {
            v247 = *((_WORD *)v196 - 1);
            v196 -= 2;
            *((_WORD *)v246 - 1) = v247;
            v246 -= 2;
          }
          v34 = &v236[2 * v25];
          __p = v246;
          v353 = v34;
          if (v231)
          {
            operator delete(v231);
            v34 = v353;
          }
        }
        else
        {
          *(_WORD *)v196 = v229;
          v230 = v196 + 2;
        }
        if (v230 >= v34)
        {
          v206 = __p;
          v249 = v230 - __p;
          if (v230 - __p <= -3)
            sub_1DCAE4C44();
          v250 = v249 >> 1;
          v251 = v34 - __p;
          if (v251 <= (v249 >> 1) + 1)
            v252 = v250 + 1;
          else
            v252 = v251;
          if (v251 >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v252;
          if (v25)
          {
            v211 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
            v206 = __p;
          }
          else
          {
            v211 = 0;
          }
          v237 = &v211[2 * v250];
          *(_WORD *)v237 = v115;
          v26 = v237 + 2;
          while (v230 != v206)
          {
            v263 = *((_WORD *)v230 - 1);
            v230 -= 2;
            *((_WORD *)v237 - 1) = v263;
            v237 -= 2;
          }
          goto LABEL_493;
        }
        *(_WORD *)v230 = v115;
        v248 = v230 + 2;
LABEL_479:
        v26 = v248;
        goto LABEL_495;
      }
      if (v26 >= v353)
      {
        v45 = __p;
        v46 = v26 - __p;
        if (v26 - __p <= -3)
          sub_1DCAE4C44();
        v47 = v46 >> 1;
        if (v353 - __p <= (unint64_t)((v46 >> 1) + 1))
          v48 = v47 + 1;
        else
          v48 = v353 - __p;
        if ((unint64_t)(v353 - __p) >= 0x7FFFFFFFFFFFFFFELL)
          v25 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v25 = v48;
        if (v25)
        {
          v49 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
          v45 = __p;
          v26 = v352;
        }
        else
        {
          v49 = 0;
        }
        v103 = &v49[2 * v47];
        *(_WORD *)v103 = v31;
        v35 = v103 + 2;
        while (v26 != v45)
        {
          v104 = *((_WORD *)v26 - 1);
          v26 -= 2;
          *((_WORD *)v103 - 1) = v104;
          v103 -= 2;
        }
        v34 = &v49[2 * v25];
        __p = v103;
        v353 = v34;
        if (v45)
        {
          operator delete(v45);
          v34 = v353;
        }
      }
      else
      {
        *(_WORD *)v26 = v31;
        v35 = v26 + 2;
      }
      v105 = v31 + 1;
      if (v35 >= v34)
      {
        v107 = __p;
        v108 = v35 - __p;
        if (v35 - __p <= -3)
          sub_1DCAE4C44();
        v109 = v108 >> 1;
        v110 = v34 - __p;
        if (v110 <= (v108 >> 1) + 1)
          v111 = v109 + 1;
        else
          v111 = v110;
        if (v110 >= 0x7FFFFFFFFFFFFFFELL)
          v25 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v25 = v111;
        if (v25)
        {
          v112 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
          v107 = __p;
        }
        else
        {
          v112 = 0;
        }
        v143 = &v112[2 * v109];
        *(_WORD *)v143 = v105;
        v106 = v143 + 2;
        while (v35 != v107)
        {
          v144 = *((_WORD *)v35 - 1);
          v35 -= 2;
          *((_WORD *)v143 - 1) = v144;
          v143 -= 2;
        }
        v34 = &v112[2 * v25];
        __p = v143;
        v353 = v34;
        if (v107)
        {
          operator delete(v107);
          v34 = v353;
        }
      }
      else
      {
        *(_WORD *)v35 = v105;
        v106 = v35 + 2;
      }
      v145 = v31 + v28;
      v146 = v31 + v28 + 2;
      if (v106 >= v34)
      {
        v148 = __p;
        v149 = v106 - __p;
        if (v106 - __p <= -3)
          sub_1DCAE4C44();
        v150 = v149 >> 1;
        v151 = v34 - __p;
        if (v151 <= (v149 >> 1) + 1)
          v152 = v150 + 1;
        else
          v152 = v151;
        if (v151 >= 0x7FFFFFFFFFFFFFFELL)
          v25 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v25 = v152;
        if (v25)
        {
          v153 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
          v148 = __p;
        }
        else
        {
          v153 = 0;
        }
        v185 = &v153[2 * v150];
        *(_WORD *)v185 = v146;
        v147 = v185 + 2;
        while (v106 != v148)
        {
          v186 = *((_WORD *)v106 - 1);
          v106 -= 2;
          *((_WORD *)v185 - 1) = v186;
          v185 -= 2;
        }
        v34 = &v153[2 * v25];
        __p = v185;
        v353 = v34;
        if (v148)
        {
          operator delete(v148);
          v34 = v353;
        }
      }
      else
      {
        *(_WORD *)v106 = v146;
        v147 = v106 + 2;
      }
      if (v147 >= v34)
      {
        v188 = __p;
        v189 = v147 - __p;
        if (v147 - __p <= -3)
          sub_1DCAE4C44();
        v190 = v189 >> 1;
        v191 = v34 - __p;
        if (v191 <= (v189 >> 1) + 1)
          v192 = v190 + 1;
        else
          v192 = v191;
        if (v191 >= 0x7FFFFFFFFFFFFFFELL)
          v25 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v25 = v192;
        if (v25)
        {
          v193 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
          v188 = __p;
        }
        else
        {
          v193 = 0;
        }
        v219 = &v193[2 * v190];
        *(_WORD *)v219 = v31;
        v187 = v219 + 2;
        while (v147 != v188)
        {
          v220 = *((_WORD *)v147 - 1);
          v147 -= 2;
          *((_WORD *)v219 - 1) = v220;
          v219 -= 2;
        }
        v34 = &v193[2 * v25];
        __p = v219;
        v353 = v34;
        if (v188)
        {
          operator delete(v188);
          v34 = v353;
        }
      }
      else
      {
        *(_WORD *)v147 = v31;
        v187 = v147 + 2;
      }
      v9 = v346;
      if (v187 >= v34)
      {
        v221 = __p;
        v222 = v187 - __p;
        if (v187 - __p <= -3)
          sub_1DCAE4C44();
        v223 = v222 >> 1;
        v224 = v34 - __p;
        if (v224 <= (v222 >> 1) + 1)
          v225 = v223 + 1;
        else
          v225 = v224;
        if (v224 >= 0x7FFFFFFFFFFFFFFELL)
          v25 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v25 = v225;
        if (v25)
        {
          v226 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
          v221 = __p;
        }
        else
        {
          v226 = 0;
        }
        v240 = &v226[2 * v223];
        *(_WORD *)v240 = v146;
        v168 = v240 + 2;
        while (v187 != v221)
        {
          v241 = *((_WORD *)v187 - 1);
          v187 -= 2;
          *((_WORD *)v240 - 1) = v241;
          v240 -= 2;
        }
        v34 = &v226[2 * v25];
        __p = v240;
        v353 = v34;
        if (v221)
        {
          operator delete(v221);
          v34 = v353;
        }
      }
      else
      {
        *(_WORD *)v187 = v146;
        v168 = v187 + 2;
      }
      v205 = v145 + 1;
      if (v168 >= v34)
      {
        v206 = __p;
        v242 = v168 - __p;
        if (v168 - __p <= -3)
          sub_1DCAE4C44();
        v243 = v242 >> 1;
        v244 = v34 - __p;
        if (v244 <= (v242 >> 1) + 1)
          v245 = v243 + 1;
        else
          v245 = v244;
        if (v244 >= 0x7FFFFFFFFFFFFFFELL)
          v25 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v25 = v245;
        if (v25)
        {
          v211 = (char *)sub_1DCB0DAEC((uint64_t)&v353, v25);
          v206 = __p;
        }
        else
        {
          v211 = 0;
        }
        v237 = &v211[2 * v243];
        *(_WORD *)v237 = v205;
        v26 = v237 + 2;
        while (v168 != v206)
        {
          v262 = *((_WORD *)v168 - 1);
          v168 -= 2;
          *((_WORD *)v237 - 1) = v262;
          v237 -= 2;
        }
        goto LABEL_493;
      }
      goto LABEL_398;
    }
    v281 = v28 + 1;
LABEL_502:
    v341 += v281 + v281 * v342;
    v27 = v340 + 1;
  }
  while (v340 != 5);
  v350 = v355 - (_BYTE *)v354;
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], (const char *)v25, (uint64_t)v354);
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  v284 = (void *)objc_msgSend_newBufferWithData_type_(v338, v282, (uint64_t)v347, 1);
  if (!v284)
  {
    v285 = (void *)MEMORY[0x1E0C99DA0];
    v286 = (objc_class *)objc_opt_class();
    NSStringFromClass(v286);
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v285, v289, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Could not allocate mesh buffer"), v287, v288);

  }
  objc_msgSend_setName_(v339, v283, (uint64_t)CFSTR("box"));
  if (objc_msgSend_conformsToProtocol_(v284, v290, (uint64_t)&unk_1F03B6D88))
  {
    v291 = v284;
    v292 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_name(v339, v293, v294);
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v292, v296, (uint64_t)CFSTR("%@-%@"), v295, CFSTR("position"));
    v297 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v291, v298, (uint64_t)v297);

  }
  v299 = objc_alloc(MEMORY[0x1E0C99D50]);
  v344 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v299, v300, (uint64_t)__p, v352 - __p, 0);
  v302 = (void *)objc_msgSend_newBufferWithData_type_(v338, v301, (uint64_t)v344, 2);
  if (objc_msgSend_conformsToProtocol_(v302, v303, (uint64_t)&unk_1F03B6D88))
  {
    v304 = v302;
    objc_msgSend_name(v339, v305, v306);
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(v307, v308, (uint64_t)CFSTR("-Indices"));
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v304, v310, (uint64_t)v309);

  }
  v311 = [MDLSubmesh alloc];
  v312 = [MDLMaterial alloc];
  objc_msgSend_name(v339, v313, v314);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v315, v316, (uint64_t)CFSTR("-Material"));
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  v318 = (void *)objc_opt_new();
  v320 = (void *)objc_msgSend_initWithName_scatteringFunction_(v312, v319, (uint64_t)v317, v318);
  v322 = (void *)objc_msgSend_initWithIndexBuffer_indexCount_indexType_geometryType_material_(v311, v321, (uint64_t)v302, (v352 - __p) >> 1, 16, v8, v320);

  objc_msgSend_name(v339, v323, v324);
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v325, v326, (uint64_t)CFSTR("-0"));
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v322, v328, (uint64_t)v327);

  v357 = v322;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v329, (uint64_t)&v357, 1);
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__createWithVertexBuffer_vertexCount_descriptor_submeshes_(v339, v331, (uint64_t)v284, (unint64_t)(v350 >> 2) >> 3, v337, v330);

  v332 = v339;
  if (__p)
    operator delete(__p);
  if (v354)
  {
    v355 = v354;
    operator delete(v354);
  }

  v333 = v338;
  objc_autoreleasePoolPop(context);
LABEL_515:

  return v339;
}

+ (MDLMesh)newBoxWithDimensions:(vector_float3)dimensions segments:(vector_uint3)segments geometryType:(MDLGeometryType)geometryType inwardNormals:(BOOL)inwardNormals allocator:(id)allocator
{
  double v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  MDLMesh *v11;
  const char *v12;
  MDLMesh *inited;
  double v15;
  double v16;

  v8 = dimensions.i64[1];
  v9 = dimensions.i64[0];
  v15 = *(double *)segments.i64;
  v16 = v7;
  v10 = (id)geometryType;
  v11 = [MDLMesh alloc];
  inited = (MDLMesh *)objc_msgSend_initBoxWithExtent_segments_inwardNormals_geometryType_allocator_(v11, v12, v8, v9, v10, v15, v16);

  return inited;
}

- (MDLMesh)initIcosahedronWithExtent:(vector_float3)extent inwardNormals:(BOOL)inwardNormals geometryType:(MDLGeometryType)geometryType allocator:(id)allocator
{
  float32x4_t v6;
  __int32 v7;
  id v9;
  const char *v10;
  MDLMesh *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  float v15;
  float v16;
  float v17;
  float32x4_t v18;
  __float2 v19;
  float32x4_t v20;
  char *v21;
  float *v22;
  float *v23;
  float *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  int v31;
  float *v32;
  float *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  float *v39;
  int v40;
  float v41;
  float *v42;
  float32x4_t v43;
  float *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  float *v50;
  int v51;
  int32x4_t v52;
  float32x2_t v53;
  float32x2_t v54;
  float32x4_t v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  char *v65;
  int v66;
  __int32 v67;
  char *v68;
  char *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  __int32 *v75;
  __int32 v76;
  char *v77;
  char *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  char *v84;
  int v85;
  float v86;
  float *v87;
  float *v88;
  float *v89;
  float *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  float *v96;
  int v97;
  float *v98;
  float *v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  char *v104;
  float *v105;
  int v106;
  int v107;
  __float2 v108;
  float32x4_t v109;
  char *v110;
  float *v111;
  float *v112;
  float *v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char *v118;
  float *v119;
  int v120;
  float *v121;
  float *v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  unint64_t v126;
  char *v127;
  float *v128;
  int v129;
  float v130;
  float *v131;
  float32x4_t v132;
  float *v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  unint64_t v137;
  char *v138;
  float *v139;
  int v140;
  int32x4_t v141;
  float32x2_t v142;
  float32x2_t v143;
  float32x4_t v144;
  char *v145;
  char *v146;
  char *v147;
  char *v148;
  uint64_t v149;
  unint64_t v150;
  uint64_t v151;
  unint64_t v152;
  char *v153;
  char *v154;
  int v155;
  __int32 v156;
  char *v157;
  char *v158;
  uint64_t v159;
  unint64_t v160;
  uint64_t v161;
  unint64_t v162;
  char *v163;
  __int32 *v164;
  __int32 v165;
  char *v166;
  char *v167;
  uint64_t v168;
  unint64_t v169;
  uint64_t v170;
  unint64_t v171;
  char *v172;
  char *v173;
  int v174;
  float v175;
  float *v176;
  float *v177;
  float *v178;
  float *v179;
  uint64_t v180;
  unint64_t v181;
  uint64_t v182;
  unint64_t v183;
  char *v184;
  float *v185;
  int v186;
  float *v187;
  float *v188;
  uint64_t v189;
  unint64_t v190;
  uint64_t v191;
  unint64_t v192;
  char *v193;
  float *v194;
  int v195;
  char *v196;
  float *v197;
  float *v198;
  void *v199;
  float *v200;
  uint64_t v201;
  unint64_t v202;
  uint64_t v203;
  unint64_t v204;
  char *v205;
  float *v206;
  int v207;
  float *v208;
  float *v209;
  uint64_t v210;
  unint64_t v211;
  uint64_t v212;
  unint64_t v213;
  char *v214;
  float *v215;
  int v216;
  float *v217;
  float *v218;
  uint64_t v219;
  unint64_t v220;
  uint64_t v221;
  unint64_t v222;
  char *v223;
  char *v224;
  char *v225;
  int v226;
  char *v227;
  char *v228;
  char *v229;
  char *v230;
  uint64_t v231;
  unint64_t v232;
  uint64_t v233;
  unint64_t v234;
  char *v235;
  char *v236;
  int v237;
  char *v238;
  char *v239;
  uint64_t v240;
  unint64_t v241;
  uint64_t v242;
  unint64_t v243;
  char *v244;
  char *v245;
  int v246;
  char *v247;
  char *v248;
  uint64_t v249;
  unint64_t v250;
  uint64_t v251;
  unint64_t v252;
  char *v253;
  char *v254;
  char *v255;
  int v256;
  float *v257;
  float *v258;
  float *v259;
  float *v260;
  uint64_t v261;
  unint64_t v262;
  uint64_t v263;
  unint64_t v264;
  char *v265;
  float *v266;
  int v267;
  float *v268;
  float *v269;
  uint64_t v270;
  unint64_t v271;
  uint64_t v272;
  unint64_t v273;
  char *v274;
  float *v275;
  char *v276;
  int v277;
  char *v278;
  float *v279;
  float *v280;
  float *v281;
  uint64_t v282;
  unint64_t v283;
  uint64_t v284;
  unint64_t v285;
  char *v286;
  float *v287;
  int v288;
  float v289;
  float *v290;
  float *v291;
  uint64_t v292;
  unint64_t v293;
  uint64_t v294;
  unint64_t v295;
  char *v296;
  float *v297;
  int v298;
  float *v299;
  float *v300;
  uint64_t v301;
  unint64_t v302;
  uint64_t v303;
  unint64_t v304;
  char *v305;
  char *v306;
  char *v307;
  int v308;
  char *v309;
  float *v310;
  float *v311;
  float *v312;
  uint64_t v313;
  unint64_t v314;
  uint64_t v315;
  unint64_t v316;
  char *v317;
  float *v318;
  int v319;
  float v320;
  char *v321;
  float *v322;
  uint64_t v323;
  unint64_t v324;
  uint64_t v325;
  unint64_t v326;
  char *v327;
  float *v328;
  int v329;
  char *v330;
  char *v331;
  uint64_t v332;
  unint64_t v333;
  uint64_t v334;
  unint64_t v335;
  char *v336;
  char *v337;
  char *v338;
  int v339;
  float *v340;
  float *v341;
  float *v342;
  float *v343;
  uint64_t v344;
  unint64_t v345;
  uint64_t v346;
  unint64_t v347;
  char *v348;
  float *v349;
  int v350;
  float *v351;
  float *v352;
  uint64_t v353;
  unint64_t v354;
  uint64_t v355;
  unint64_t v356;
  char *v357;
  float *v358;
  char *v359;
  int v360;
  __int16 *v361;
  int v362;
  unint64_t v363;
  __int16 v364;
  char *v365;
  char *v366;
  char *v367;
  __int16 *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  char *v373;
  __int16 *v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  char *v379;
  char *v380;
  __int16 v381;
  int v382;
  __int16 v383;
  char *v384;
  __int16 *v385;
  uint64_t v386;
  uint64_t v387;
  unint64_t v388;
  unint64_t v389;
  uint64_t v390;
  char *v391;
  char *v392;
  __int16 v393;
  __int16 *v394;
  uint64_t v395;
  uint64_t v396;
  unint64_t v397;
  unint64_t v398;
  uint64_t v399;
  char *v400;
  char *v401;
  __int16 v402;
  __int16 *v403;
  uint64_t v404;
  uint64_t v405;
  unint64_t v406;
  unint64_t v407;
  uint64_t v408;
  char *v409;
  char *v410;
  __int16 v411;
  char *v412;
  __int16 v413;
  int v414;
  char *v415;
  char *v416;
  char *v417;
  __int16 *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  char *v423;
  __int16 *v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  char *v429;
  char *v430;
  __int16 v431;
  int v432;
  __int16 v433;
  __int16 v434;
  char *v435;
  __int16 *v436;
  uint64_t v437;
  uint64_t v438;
  unint64_t v439;
  unint64_t v440;
  uint64_t v441;
  char *v442;
  char *v443;
  __int16 v444;
  __int16 v445;
  char *v446;
  __int16 *v447;
  uint64_t v448;
  uint64_t v449;
  unint64_t v450;
  unint64_t v451;
  uint64_t v452;
  char *v453;
  char *v454;
  __int16 v455;
  __int16 v456;
  char *v457;
  __int16 *v458;
  uint64_t v459;
  uint64_t v460;
  unint64_t v461;
  unint64_t v462;
  uint64_t v463;
  char *v464;
  char *v465;
  __int16 v466;
  char *v467;
  __int16 *v468;
  uint64_t v469;
  uint64_t v470;
  unint64_t v471;
  unint64_t v472;
  uint64_t v473;
  char *v474;
  char *v475;
  __int16 v476;
  char *v477;
  __int16 *v478;
  uint64_t v479;
  uint64_t v480;
  unint64_t v481;
  unint64_t v482;
  uint64_t v483;
  char *v484;
  char *v485;
  __int16 v486;
  __int16 v487;
  char *v488;
  __int16 *v489;
  uint64_t v490;
  uint64_t v491;
  unint64_t v492;
  unint64_t v493;
  uint64_t v494;
  char *v495;
  char *v496;
  __int16 v497;
  char *v498;
  __int16 *v499;
  uint64_t v500;
  uint64_t v501;
  unint64_t v502;
  unint64_t v503;
  uint64_t v504;
  char *v505;
  char *v506;
  __int16 v507;
  char *v508;
  __int16 *v509;
  uint64_t v510;
  uint64_t v511;
  unint64_t v512;
  unint64_t v513;
  uint64_t v514;
  char *v515;
  char *v516;
  __int16 v517;
  __int16 *v518;
  uint64_t v519;
  uint64_t v520;
  unint64_t v521;
  unint64_t v522;
  uint64_t v523;
  char *v524;
  char *v525;
  __int16 v526;
  char *v527;
  __int16 *v528;
  uint64_t v529;
  uint64_t v530;
  unint64_t v531;
  unint64_t v532;
  uint64_t v533;
  char *v534;
  char *v535;
  __int16 v536;
  char *v537;
  __int16 v538;
  __int16 *v539;
  uint64_t v540;
  uint64_t v541;
  unint64_t v542;
  unint64_t v543;
  uint64_t v544;
  char *v545;
  char *v546;
  __int16 v547;
  uint64_t v548;
  uint64_t v549;
  unint64_t v550;
  unint64_t v551;
  __int16 v552;
  int v553;
  char *v554;
  char *v555;
  char *v556;
  __int16 *v557;
  uint64_t v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  char *v562;
  __int16 *v563;
  uint64_t v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  char *v568;
  char *v569;
  __int16 v570;
  __int16 v571;
  __int16 *v572;
  __int16 *v573;
  uint64_t v574;
  uint64_t v575;
  unint64_t v576;
  unint64_t v577;
  uint64_t v578;
  char *v579;
  char *v580;
  __int16 v581;
  __int16 v582;
  __int16 *v583;
  uint64_t v584;
  uint64_t v585;
  unint64_t v586;
  unint64_t v587;
  uint64_t v588;
  char *v589;
  __int16 *v590;
  __int16 v591;
  int v592;
  __int16 v593;
  __int16 *v594;
  uint64_t v595;
  uint64_t v596;
  unint64_t v597;
  unint64_t v598;
  uint64_t v599;
  char *v600;
  char *v601;
  __int16 v602;
  __int16 *v603;
  __int16 v604;
  float *v605;
  float *v606;
  id v607;
  uint64_t v608;
  unint64_t v609;
  const char *v610;
  MDLMesh *v611;
  const char *v612;
  uint64_t v613;
  uint64_t v614;
  const char *v615;
  unsigned int v616;
  unsigned int v617;
  unsigned int v618;
  char *v619;
  uint64_t v620;
  char *v621;
  uint64_t v622;
  BOOL v623;
  const char *v624;
  void *v625;
  const char *v626;
  void *v627;
  objc_class *v628;
  void *v629;
  void *v630;
  const char *v631;
  id v632;
  void *v633;
  const char *v634;
  uint64_t v635;
  void *v636;
  const char *v637;
  void *v638;
  const char *v639;
  id v640;
  const char *v641;
  const char *v642;
  void *v643;
  const char *v644;
  id v645;
  const char *v646;
  uint64_t v647;
  void *v648;
  const char *v649;
  void *v650;
  const char *v651;
  MDLSubmesh *v652;
  MDLMaterial *v653;
  const char *v654;
  uint64_t v655;
  void *v656;
  const char *v657;
  void *v658;
  void *v659;
  const char *v660;
  void *v661;
  const char *v662;
  void *v663;
  const char *v664;
  uint64_t v665;
  void *v666;
  const char *v667;
  void *v668;
  const char *v669;
  MDLVertexDescriptor *v670;
  const char *v671;
  uint64_t v672;
  void *v673;
  const char *v674;
  void *v675;
  const char *v676;
  const char *v677;
  uint64_t v678;
  void *v679;
  const char *v680;
  void *v681;
  const char *v682;
  const char *v683;
  uint64_t v684;
  void *v685;
  const char *v686;
  void *v687;
  const char *v688;
  const char *v689;
  uint64_t v690;
  void *v691;
  const char *v692;
  void *v693;
  const char *v694;
  const char *v695;
  uint64_t v696;
  void *v697;
  const char *v698;
  void *v699;
  const char *v700;
  const char *v701;
  uint64_t v702;
  void *v703;
  const char *v704;
  void *v705;
  const char *v706;
  const char *v707;
  uint64_t v708;
  void *v709;
  const char *v710;
  void *v711;
  const char *v712;
  const char *v713;
  uint64_t v714;
  void *v715;
  const char *v716;
  void *v717;
  const char *v718;
  const char *v719;
  uint64_t v720;
  void *v721;
  const char *v722;
  void *v723;
  const char *v724;
  const char *v725;
  uint64_t v726;
  const char *v727;
  uint64_t v728;
  const char *v729;
  void *v730;
  const char *v731;
  MDLMesh *v732;
  void *context;
  __int32 v736;
  void *v737;
  MDLMesh *v738;
  float v739;
  float v740;
  void *v741;
  float32x4_t v742;
  void *v743;
  float32x4_t v744;
  float32x4_t v745;
  float32x4_t v746;
  float32x4_t v747;
  float32x4_t v748;
  __int16 v749;
  id v750;
  uint64_t v751;
  __int16 *v752;
  __int16 *v753;
  char *v754;
  void *v755;
  float *v756;
  char *v757;
  void *__p;
  char *v759;
  char *v760;
  float *v761;
  float *v762;
  char *v763;
  _QWORD v764[3];

  v751 = extent.i64[1];
  v7 = extent.i32[0];
  v744 = v6;
  v764[1] = *MEMORY[0x1E0C80C00];
  v9 = (id)inwardNormals;
  v11 = (MDLMesh *)(id)objc_msgSend_initWithBufferAllocator_(self, v10, (uint64_t)v9);

  v738 = v11;
  if (!v11)
  {
    v199 = v9;
    goto LABEL_976;
  }
  objc_msgSend_allocator(v11, v12, v13);
  v737 = (void *)objc_claimAutoreleasedReturnValue();

  context = (void *)MEMORY[0x1DF0D25C8]();
  v14 = 0;
  v761 = 0;
  v762 = 0;
  v763 = 0;
  __p = 0;
  v759 = 0;
  v760 = 0;
  v15 = 0.89443 * v744.f32[0];
  v16 = v744.f32[1];
  v739 = vmuls_lane_f32(0.44721, *(float32x2_t *)v744.f32, 1);
  v17 = vmuls_lane_f32(0.89443, v744, 2);
  v736 = v7;
  v18.i32[0] = 1.0;
  if (v7)
    v18.f32[0] = -1.0;
  v742 = v18;
  v755 = 0;
  v756 = 0;
  v757 = 0;
  do
  {
    v19 = __sincosf_stret((float)((float)v14 * 1.2566) + 0.62832);
    v20.f32[0] = v15 * v19.__cosval;
    v22 = v762;
    v21 = v763;
    v745 = v20;
    if (v762 >= (float *)v763)
    {
      v24 = v761;
      v25 = v762 - v761;
      v26 = v25 + 1;
      if ((unint64_t)(v25 + 1) >> 62)
        goto LABEL_977;
      v27 = v763 - (char *)v761;
      if ((v763 - (char *)v761) >> 1 > v26)
        v26 = v27 >> 1;
      if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL)
        v28 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v28 = v26;
      if (v28)
      {
        v29 = (char *)sub_1DCAE4D04((uint64_t)&v763, v28);
        v24 = v761;
        v22 = v762;
      }
      else
      {
        v29 = 0;
      }
      v30 = &v29[4 * v25];
      *(_DWORD *)v30 = v745.i32[0];
      v23 = (float *)(v30 + 4);
      while (v22 != v24)
      {
        v31 = *((_DWORD *)v22-- - 1);
        *((_DWORD *)v30 - 1) = v31;
        v30 -= 4;
      }
      v21 = &v29[4 * v28];
      v761 = (float *)v30;
      v762 = v23;
      v763 = v21;
      if (v24)
      {
        operator delete(v24);
        v21 = v763;
      }
    }
    else
    {
      *v762 = v20.f32[0];
      v23 = v22 + 1;
    }
    v762 = v23;
    if (v23 >= (float *)v21)
    {
      v33 = v761;
      v34 = v23 - v761;
      v35 = v34 + 1;
      if ((unint64_t)(v34 + 1) >> 62)
        goto LABEL_977;
      v36 = v21 - (char *)v761;
      if (v36 >> 1 > v35)
        v35 = v36 >> 1;
      if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL)
        v37 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v37 = v35;
      if (v37)
      {
        v38 = (char *)sub_1DCAE4D04((uint64_t)&v763, v37);
        v33 = v761;
        v23 = v762;
      }
      else
      {
        v38 = 0;
      }
      v39 = (float *)&v38[4 * v34];
      *v39 = v739;
      v32 = v39 + 1;
      while (v23 != v33)
      {
        v40 = *((_DWORD *)v23-- - 1);
        *((_DWORD *)v39-- - 1) = v40;
      }
      v21 = &v38[4 * v37];
      v761 = v39;
      v762 = v32;
      v763 = v21;
      if (v33)
      {
        operator delete(v33);
        v21 = v763;
      }
    }
    else
    {
      *v23 = v739;
      v32 = v23 + 1;
    }
    v41 = v17 * v19.__sinval;
    v762 = v32;
    if (v32 >= (float *)v21)
    {
      v44 = v761;
      v45 = v32 - v761;
      v46 = v45 + 1;
      if ((unint64_t)(v45 + 1) >> 62)
LABEL_977:
        sub_1DCAE4C44();
      v47 = v21 - (char *)v761;
      if (v47 >> 1 > v46)
        v46 = v47 >> 1;
      if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFFCLL)
        v48 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v48 = v46;
      if (v48)
      {
        v49 = (char *)sub_1DCAE4D04((uint64_t)&v763, v48);
        v44 = v761;
        v32 = v762;
      }
      else
      {
        v49 = 0;
      }
      v50 = (float *)&v49[4 * v45];
      *v50 = v17 * v19.__sinval;
      v42 = v50 + 1;
      while (v32 != v44)
      {
        v51 = *((_DWORD *)v32-- - 1);
        *((_DWORD *)v50-- - 1) = v51;
      }
      v761 = v50;
      v762 = v42;
      v763 = &v49[4 * v48];
      if (v44)
        operator delete(v44);
      v43 = v745;
      v41 = v17 * v19.__sinval;
    }
    else
    {
      *v32 = v41;
      v42 = v32 + 1;
      v43 = v745;
    }
    v43.f32[1] = v739;
    v762 = v42;
    v43.f32[2] = v41;
    v52 = (int32x4_t)vmulq_f32(v43, v43);
    v52.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v52.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v52.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v52, 2)).u32[0];
    v53 = vrsqrte_f32((float32x2_t)v52.u32[0]);
    v54 = vmul_f32(vrsqrts_f32((float32x2_t)v52.u32[0], vmul_f32(v53, v53)), v53);
    *(float32x2_t *)v52.i8 = vmul_f32(v54, vrsqrts_f32((float32x2_t)v52.u32[0], vmul_f32(v54, v54)));
    v55 = vmulq_n_f32(v43, vmulq_f32((float32x4_t)v52, v742).f32[0]);
    v57 = v759;
    v56 = v760;
    v746 = v55;
    if (v759 >= v760)
    {
      v59 = (char *)__p;
      v60 = (v759 - (_BYTE *)__p) >> 2;
      v61 = v60 + 1;
      if ((unint64_t)(v60 + 1) >> 62)
        sub_1DCAE4C44();
      v62 = v760 - (_BYTE *)__p;
      if ((v760 - (_BYTE *)__p) >> 1 > v61)
        v61 = v62 >> 1;
      if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFFCLL)
        v63 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v63 = v61;
      if (v63)
      {
        v64 = (char *)sub_1DCAE4D04((uint64_t)&v760, v63);
        v59 = (char *)__p;
        v57 = v759;
      }
      else
      {
        v64 = 0;
      }
      v65 = &v64[4 * v60];
      *(_DWORD *)v65 = v746.i32[0];
      v58 = v65 + 4;
      while (v57 != v59)
      {
        v66 = *((_DWORD *)v57 - 1);
        v57 -= 4;
        *((_DWORD *)v65 - 1) = v66;
        v65 -= 4;
      }
      v56 = &v64[4 * v63];
      __p = v65;
      v759 = v58;
      v760 = v56;
      if (v59)
      {
        operator delete(v59);
        v56 = v760;
      }
      v55.i32[1] = v746.i32[1];
    }
    else
    {
      *(_DWORD *)v759 = v55.i32[0];
      v58 = v57 + 4;
    }
    v759 = v58;
    v67 = v55.i32[1];
    if (v58 >= v56)
    {
      v69 = (char *)__p;
      v70 = (v58 - (_BYTE *)__p) >> 2;
      v71 = v70 + 1;
      if ((unint64_t)(v70 + 1) >> 62)
        sub_1DCAE4C44();
      v72 = v56 - (_BYTE *)__p;
      if (v72 >> 1 > v71)
        v71 = v72 >> 1;
      if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFFCLL)
        v73 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v73 = v71;
      if (v73)
      {
        v74 = (char *)sub_1DCAE4D04((uint64_t)&v760, v73);
        v69 = (char *)__p;
        v58 = v759;
      }
      else
      {
        v74 = 0;
      }
      v75 = (__int32 *)&v74[4 * v70];
      *v75 = v67;
      v68 = (char *)(v75 + 1);
      while (v58 != v69)
      {
        v76 = *((_DWORD *)v58 - 1);
        v58 -= 4;
        *--v75 = v76;
      }
      v56 = &v74[4 * v73];
      __p = v75;
      v759 = v68;
      v760 = v56;
      if (v69)
      {
        operator delete(v69);
        v56 = v760;
      }
    }
    else
    {
      *(_DWORD *)v58 = v55.i32[1];
      v68 = v58 + 4;
    }
    v759 = v68;
    if (v68 >= v56)
    {
      v78 = (char *)__p;
      v79 = (v68 - (_BYTE *)__p) >> 2;
      v80 = v79 + 1;
      if ((unint64_t)(v79 + 1) >> 62)
        sub_1DCAE4C44();
      v81 = v56 - (_BYTE *)__p;
      if (v81 >> 1 > v80)
        v80 = v81 >> 1;
      if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFFCLL)
        v82 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v82 = v80;
      if (v82)
      {
        v83 = (char *)sub_1DCAE4D04((uint64_t)&v760, v82);
        v78 = (char *)__p;
        v68 = v759;
      }
      else
      {
        v83 = 0;
      }
      v84 = &v83[4 * v79];
      *(_DWORD *)v84 = v746.i32[2];
      v77 = v84 + 4;
      while (v68 != v78)
      {
        v85 = *((_DWORD *)v68 - 1);
        v68 -= 4;
        *((_DWORD *)v84 - 1) = v85;
        v84 -= 4;
      }
      __p = v84;
      v759 = v77;
      v760 = &v83[4 * v82];
      if (v78)
        operator delete(v78);
    }
    else
    {
      *(_DWORD *)v68 = v746.i32[2];
      v77 = v68 + 4;
    }
    v759 = v77;
    v86 = (float)(cosf((float)((float)((float)v14 * 1.2566) + 0.62832) * 0.5) * 0.5) + 0.5;
    v88 = v756;
    v87 = (float *)v757;
    if (v756 >= (float *)v757)
    {
      v90 = (float *)v755;
      v91 = ((char *)v756 - (_BYTE *)v755) >> 2;
      v92 = v91 + 1;
      if ((unint64_t)(v91 + 1) >> 62)
        goto LABEL_980;
      v93 = v757 - (_BYTE *)v755;
      if ((v757 - (_BYTE *)v755) >> 1 > v92)
        v92 = v93 >> 1;
      if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFFCLL)
        v94 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v94 = v92;
      if (v94)
      {
        v95 = (char *)sub_1DCAE4D04((uint64_t)&v757, v94);
        v90 = (float *)v755;
        v88 = v756;
      }
      else
      {
        v95 = 0;
      }
      v96 = (float *)&v95[4 * v91];
      *v96 = v86;
      v89 = v96 + 1;
      while (v88 != v90)
      {
        v97 = *((_DWORD *)v88-- - 1);
        *((_DWORD *)v96-- - 1) = v97;
      }
      v87 = (float *)&v95[4 * v94];
      v755 = v96;
      v756 = v89;
      v757 = (char *)v87;
      if (v90)
      {
        operator delete(v90);
        v87 = (float *)v757;
      }
    }
    else
    {
      *v756 = v86;
      v89 = v88 + 1;
    }
    v756 = v89;
    if (v89 >= v87)
    {
      v99 = (float *)v755;
      v100 = ((char *)v89 - (_BYTE *)v755) >> 2;
      v101 = v100 + 1;
      if ((unint64_t)(v100 + 1) >> 62)
LABEL_980:
        sub_1DCAE4C44();
      v102 = (char *)v87 - (_BYTE *)v755;
      if (v102 >> 1 > v101)
        v101 = v102 >> 1;
      if ((unint64_t)v102 >= 0x7FFFFFFFFFFFFFFCLL)
        v103 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v103 = v101;
      if (v103)
      {
        v104 = (char *)sub_1DCAE4D04((uint64_t)&v757, v103);
        v99 = (float *)v755;
        v89 = v756;
      }
      else
      {
        v104 = 0;
      }
      v105 = (float *)&v104[4 * v100];
      *v105 = 0.72361;
      v98 = v105 + 1;
      while (v89 != v99)
      {
        v106 = *((_DWORD *)v89-- - 1);
        *((_DWORD *)v105-- - 1) = v106;
      }
      v755 = v105;
      v756 = v98;
      v757 = &v104[4 * v103];
      if (v99)
        operator delete(v99);
    }
    else
    {
      *v89 = 0.72361;
      v98 = v89 + 1;
    }
    v756 = v98;
    ++v14;
  }
  while (v14 != 5);
  v107 = 0;
  v740 = v16 * -0.44721;
  do
  {
    v108 = __sincosf_stret((float)v107 * 1.2566);
    v109.f32[0] = v15 * v108.__cosval;
    v111 = v762;
    v110 = v763;
    v747 = v109;
    if (v762 >= (float *)v763)
    {
      v113 = v761;
      v114 = v762 - v761;
      v115 = v114 + 1;
      if ((unint64_t)(v114 + 1) >> 62)
        goto LABEL_978;
      v116 = v763 - (char *)v761;
      if ((v763 - (char *)v761) >> 1 > v115)
        v115 = v116 >> 1;
      if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFFCLL)
        v117 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v117 = v115;
      if (v117)
      {
        v118 = (char *)sub_1DCAE4D04((uint64_t)&v763, v117);
        v113 = v761;
        v111 = v762;
      }
      else
      {
        v118 = 0;
      }
      v119 = (float *)&v118[4 * v114];
      *v119 = v747.f32[0];
      v112 = v119 + 1;
      while (v111 != v113)
      {
        v120 = *((_DWORD *)v111-- - 1);
        *((_DWORD *)v119-- - 1) = v120;
      }
      v110 = &v118[4 * v117];
      v761 = v119;
      v762 = v112;
      v763 = v110;
      if (v113)
      {
        operator delete(v113);
        v110 = v763;
      }
    }
    else
    {
      *v762 = v109.f32[0];
      v112 = v111 + 1;
    }
    v762 = v112;
    if (v112 >= (float *)v110)
    {
      v122 = v761;
      v123 = v112 - v761;
      v124 = v123 + 1;
      if ((unint64_t)(v123 + 1) >> 62)
        goto LABEL_978;
      v125 = v110 - (char *)v761;
      if (v125 >> 1 > v124)
        v124 = v125 >> 1;
      if ((unint64_t)v125 >= 0x7FFFFFFFFFFFFFFCLL)
        v126 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v126 = v124;
      if (v126)
      {
        v127 = (char *)sub_1DCAE4D04((uint64_t)&v763, v126);
        v122 = v761;
        v112 = v762;
      }
      else
      {
        v127 = 0;
      }
      v128 = (float *)&v127[4 * v123];
      *v128 = v740;
      v121 = v128 + 1;
      while (v112 != v122)
      {
        v129 = *((_DWORD *)v112-- - 1);
        *((_DWORD *)v128-- - 1) = v129;
      }
      v110 = &v127[4 * v126];
      v761 = v128;
      v762 = v121;
      v763 = v110;
      if (v122)
      {
        operator delete(v122);
        v110 = v763;
      }
    }
    else
    {
      *v112 = v740;
      v121 = v112 + 1;
    }
    v130 = v17 * v108.__sinval;
    v762 = v121;
    if (v121 >= (float *)v110)
    {
      v133 = v761;
      v134 = v121 - v761;
      v135 = v134 + 1;
      if ((unint64_t)(v134 + 1) >> 62)
LABEL_978:
        sub_1DCAE4C44();
      v136 = v110 - (char *)v761;
      if (v136 >> 1 > v135)
        v135 = v136 >> 1;
      if ((unint64_t)v136 >= 0x7FFFFFFFFFFFFFFCLL)
        v137 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v137 = v135;
      if (v137)
      {
        v138 = (char *)sub_1DCAE4D04((uint64_t)&v763, v137);
        v133 = v761;
        v121 = v762;
      }
      else
      {
        v138 = 0;
      }
      v139 = (float *)&v138[4 * v134];
      *v139 = v17 * v108.__sinval;
      v131 = v139 + 1;
      while (v121 != v133)
      {
        v140 = *((_DWORD *)v121-- - 1);
        *((_DWORD *)v139-- - 1) = v140;
      }
      v761 = v139;
      v762 = v131;
      v763 = &v138[4 * v137];
      if (v133)
        operator delete(v133);
      v132 = v747;
      v130 = v17 * v108.__sinval;
    }
    else
    {
      *v121 = v130;
      v131 = v121 + 1;
      v132 = v747;
    }
    v132.f32[1] = v16 * -0.44721;
    v762 = v131;
    v132.f32[2] = v130;
    v141 = (int32x4_t)vmulq_f32(v132, v132);
    v141.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v141.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v141.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v141, 2)).u32[0];
    v142 = vrsqrte_f32((float32x2_t)v141.u32[0]);
    v143 = vmul_f32(vrsqrts_f32((float32x2_t)v141.u32[0], vmul_f32(v142, v142)), v142);
    *(float32x2_t *)v141.i8 = vmul_f32(v143, vrsqrts_f32((float32x2_t)v141.u32[0], vmul_f32(v143, v143)));
    v144 = vmulq_n_f32(v132, vmulq_f32((float32x4_t)v141, v742).f32[0]);
    v146 = v759;
    v145 = v760;
    v748 = v144;
    if (v759 >= v760)
    {
      v148 = (char *)__p;
      v149 = (v759 - (_BYTE *)__p) >> 2;
      v150 = v149 + 1;
      if ((unint64_t)(v149 + 1) >> 62)
        sub_1DCAE4C44();
      v151 = v760 - (_BYTE *)__p;
      if ((v760 - (_BYTE *)__p) >> 1 > v150)
        v150 = v151 >> 1;
      if ((unint64_t)v151 >= 0x7FFFFFFFFFFFFFFCLL)
        v152 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v152 = v150;
      if (v152)
      {
        v153 = (char *)sub_1DCAE4D04((uint64_t)&v760, v152);
        v148 = (char *)__p;
        v146 = v759;
      }
      else
      {
        v153 = 0;
      }
      v154 = &v153[4 * v149];
      *(_DWORD *)v154 = v748.i32[0];
      v147 = v154 + 4;
      while (v146 != v148)
      {
        v155 = *((_DWORD *)v146 - 1);
        v146 -= 4;
        *((_DWORD *)v154 - 1) = v155;
        v154 -= 4;
      }
      v145 = &v153[4 * v152];
      __p = v154;
      v759 = v147;
      v760 = v145;
      if (v148)
      {
        operator delete(v148);
        v145 = v760;
      }
      v144.i32[1] = v748.i32[1];
    }
    else
    {
      *(_DWORD *)v759 = v144.i32[0];
      v147 = v146 + 4;
    }
    v759 = v147;
    v156 = v144.i32[1];
    if (v147 >= v145)
    {
      v158 = (char *)__p;
      v159 = (v147 - (_BYTE *)__p) >> 2;
      v160 = v159 + 1;
      if ((unint64_t)(v159 + 1) >> 62)
        sub_1DCAE4C44();
      v161 = v145 - (_BYTE *)__p;
      if (v161 >> 1 > v160)
        v160 = v161 >> 1;
      if ((unint64_t)v161 >= 0x7FFFFFFFFFFFFFFCLL)
        v162 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v162 = v160;
      if (v162)
      {
        v163 = (char *)sub_1DCAE4D04((uint64_t)&v760, v162);
        v158 = (char *)__p;
        v147 = v759;
      }
      else
      {
        v163 = 0;
      }
      v164 = (__int32 *)&v163[4 * v159];
      *v164 = v156;
      v157 = (char *)(v164 + 1);
      while (v147 != v158)
      {
        v165 = *((_DWORD *)v147 - 1);
        v147 -= 4;
        *--v164 = v165;
      }
      v145 = &v163[4 * v162];
      __p = v164;
      v759 = v157;
      v760 = v145;
      if (v158)
      {
        operator delete(v158);
        v145 = v760;
      }
    }
    else
    {
      *(_DWORD *)v147 = v144.i32[1];
      v157 = v147 + 4;
    }
    v759 = v157;
    if (v157 >= v145)
    {
      v167 = (char *)__p;
      v168 = (v157 - (_BYTE *)__p) >> 2;
      v169 = v168 + 1;
      if ((unint64_t)(v168 + 1) >> 62)
        sub_1DCAE4C44();
      v170 = v145 - (_BYTE *)__p;
      if (v170 >> 1 > v169)
        v169 = v170 >> 1;
      if ((unint64_t)v170 >= 0x7FFFFFFFFFFFFFFCLL)
        v171 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v171 = v169;
      if (v171)
      {
        v172 = (char *)sub_1DCAE4D04((uint64_t)&v760, v171);
        v167 = (char *)__p;
        v157 = v759;
      }
      else
      {
        v172 = 0;
      }
      v173 = &v172[4 * v168];
      *(_DWORD *)v173 = v748.i32[2];
      v166 = v173 + 4;
      while (v157 != v167)
      {
        v174 = *((_DWORD *)v157 - 1);
        v157 -= 4;
        *((_DWORD *)v173 - 1) = v174;
        v173 -= 4;
      }
      __p = v173;
      v759 = v166;
      v760 = &v172[4 * v171];
      if (v167)
        operator delete(v167);
    }
    else
    {
      *(_DWORD *)v157 = v748.i32[2];
      v166 = v157 + 4;
    }
    v759 = v166;
    v175 = (float)(cosf((float)v107 * 0.62832) * 0.5) + 0.5;
    v177 = v756;
    v176 = (float *)v757;
    if (v756 >= (float *)v757)
    {
      v179 = (float *)v755;
      v180 = ((char *)v756 - (_BYTE *)v755) >> 2;
      v181 = v180 + 1;
      if ((unint64_t)(v180 + 1) >> 62)
        goto LABEL_981;
      v182 = v757 - (_BYTE *)v755;
      if ((v757 - (_BYTE *)v755) >> 1 > v181)
        v181 = v182 >> 1;
      if ((unint64_t)v182 >= 0x7FFFFFFFFFFFFFFCLL)
        v183 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v183 = v181;
      if (v183)
      {
        v184 = (char *)sub_1DCAE4D04((uint64_t)&v757, v183);
        v179 = (float *)v755;
        v177 = v756;
      }
      else
      {
        v184 = 0;
      }
      v185 = (float *)&v184[4 * v180];
      *v185 = v175;
      v178 = v185 + 1;
      while (v177 != v179)
      {
        v186 = *((_DWORD *)v177-- - 1);
        *((_DWORD *)v185-- - 1) = v186;
      }
      v176 = (float *)&v184[4 * v183];
      v755 = v185;
      v756 = v178;
      v757 = (char *)v176;
      if (v179)
      {
        operator delete(v179);
        v176 = (float *)v757;
      }
    }
    else
    {
      *v756 = v175;
      v178 = v177 + 1;
    }
    v756 = v178;
    if (v178 >= v176)
    {
      v188 = (float *)v755;
      v189 = ((char *)v178 - (_BYTE *)v755) >> 2;
      v190 = v189 + 1;
      if ((unint64_t)(v189 + 1) >> 62)
LABEL_981:
        sub_1DCAE4C44();
      v191 = (char *)v176 - (_BYTE *)v755;
      if (v191 >> 1 > v190)
        v190 = v191 >> 1;
      if ((unint64_t)v191 >= 0x7FFFFFFFFFFFFFFCLL)
        v192 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v192 = v190;
      if (v192)
      {
        v193 = (char *)sub_1DCAE4D04((uint64_t)&v757, v192);
        v188 = (float *)v755;
        v178 = v756;
      }
      else
      {
        v193 = 0;
      }
      v194 = (float *)&v193[4 * v189];
      *v194 = 0.27639;
      v187 = v194 + 1;
      while (v178 != v188)
      {
        v195 = *((_DWORD *)v178-- - 1);
        *((_DWORD *)v194-- - 1) = v195;
      }
      v755 = v194;
      v756 = v187;
      v757 = &v193[4 * v192];
      if (v188)
        operator delete(v188);
    }
    else
    {
      *v178 = 0.27639;
      v187 = v178 + 1;
    }
    v756 = v187;
    ++v107;
  }
  while (v107 != 5);
  v197 = v762;
  v196 = v763;
  if (v762 >= (float *)v763)
  {
    v200 = v761;
    v201 = v762 - v761;
    v202 = v201 + 1;
    if ((unint64_t)(v201 + 1) >> 62)
      sub_1DCAE4C44();
    v203 = v763 - (char *)v761;
    if ((v763 - (char *)v761) >> 1 > v202)
      v202 = v203 >> 1;
    if ((unint64_t)v203 >= 0x7FFFFFFFFFFFFFFCLL)
      v204 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v204 = v202;
    if (v204)
    {
      v205 = (char *)sub_1DCAE4D04((uint64_t)&v763, v204);
      v200 = v761;
      v197 = v762;
    }
    else
    {
      v205 = 0;
    }
    v206 = (float *)&v205[4 * v201];
    v196 = &v205[4 * v204];
    *v206 = 0.0;
    v198 = v206 + 1;
    while (v197 != v200)
    {
      v207 = *((_DWORD *)v197-- - 1);
      *((_DWORD *)v206-- - 1) = v207;
    }
    v761 = v206;
    v762 = v198;
    v763 = v196;
    if (v200)
    {
      operator delete(v200);
      v196 = v763;
    }
  }
  else
  {
    *v762 = 0.0;
    v198 = v197 + 1;
  }
  v762 = v198;
  if (v198 >= (float *)v196)
  {
    v209 = v761;
    v210 = v198 - v761;
    v211 = v210 + 1;
    if ((unint64_t)(v210 + 1) >> 62)
      sub_1DCAE4C44();
    v212 = v196 - (char *)v761;
    if (v212 >> 1 > v211)
      v211 = v212 >> 1;
    if ((unint64_t)v212 >= 0x7FFFFFFFFFFFFFFCLL)
      v213 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v213 = v211;
    if (v213)
    {
      v214 = (char *)sub_1DCAE4D04((uint64_t)&v763, v213);
      v209 = v761;
      v198 = v762;
    }
    else
    {
      v214 = 0;
    }
    v215 = (float *)&v214[4 * v210];
    v196 = &v214[4 * v213];
    *v215 = v16;
    v208 = v215 + 1;
    while (v198 != v209)
    {
      v216 = *((_DWORD *)v198-- - 1);
      *((_DWORD *)v215-- - 1) = v216;
    }
    v761 = v215;
    v762 = v208;
    v763 = v196;
    if (v209)
    {
      operator delete(v209);
      v196 = v763;
    }
  }
  else
  {
    *v198 = v16;
    v208 = v198 + 1;
  }
  v762 = v208;
  if (v208 >= (float *)v196)
  {
    v218 = v761;
    v219 = v208 - v761;
    v220 = v219 + 1;
    if ((unint64_t)(v219 + 1) >> 62)
      sub_1DCAE4C44();
    v221 = v196 - (char *)v761;
    if (v221 >> 1 > v220)
      v220 = v221 >> 1;
    if ((unint64_t)v221 >= 0x7FFFFFFFFFFFFFFCLL)
      v222 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v222 = v220;
    if (v222)
    {
      v223 = (char *)sub_1DCAE4D04((uint64_t)&v763, v222);
      v218 = v761;
      v208 = v762;
    }
    else
    {
      v223 = 0;
    }
    v224 = &v223[4 * v219];
    v225 = &v223[4 * v222];
    *(_DWORD *)v224 = 0;
    v217 = (float *)(v224 + 4);
    while (v208 != v218)
    {
      v226 = *((_DWORD *)v208-- - 1);
      *((_DWORD *)v224 - 1) = v226;
      v224 -= 4;
    }
    v761 = (float *)v224;
    v762 = v217;
    v763 = v225;
    if (v218)
      operator delete(v218);
  }
  else
  {
    *v208 = 0.0;
    v217 = v208 + 1;
  }
  v762 = v217;
  v228 = v759;
  v227 = v760;
  if (v759 >= v760)
  {
    v230 = (char *)__p;
    v231 = (v759 - (_BYTE *)__p) >> 2;
    v232 = v231 + 1;
    if ((unint64_t)(v231 + 1) >> 62)
      sub_1DCAE4C44();
    v233 = v760 - (_BYTE *)__p;
    if ((v760 - (_BYTE *)__p) >> 1 > v232)
      v232 = v233 >> 1;
    if ((unint64_t)v233 >= 0x7FFFFFFFFFFFFFFCLL)
      v234 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v234 = v232;
    if (v234)
    {
      v235 = (char *)sub_1DCAE4D04((uint64_t)&v760, v234);
      v230 = (char *)__p;
      v228 = v759;
    }
    else
    {
      v235 = 0;
    }
    v236 = &v235[4 * v231];
    v227 = &v235[4 * v234];
    *(_DWORD *)v236 = 0;
    v229 = v236 + 4;
    while (v228 != v230)
    {
      v237 = *((_DWORD *)v228 - 1);
      v228 -= 4;
      *((_DWORD *)v236 - 1) = v237;
      v236 -= 4;
    }
    __p = v236;
    v759 = v229;
    v760 = v227;
    if (v230)
    {
      operator delete(v230);
      v227 = v760;
    }
  }
  else
  {
    *(_DWORD *)v759 = 0;
    v229 = v228 + 4;
  }
  v759 = v229;
  if (v229 >= v227)
  {
    v239 = (char *)__p;
    v240 = (v229 - (_BYTE *)__p) >> 2;
    v241 = v240 + 1;
    if ((unint64_t)(v240 + 1) >> 62)
      sub_1DCAE4C44();
    v242 = v227 - (_BYTE *)__p;
    if (v242 >> 1 > v241)
      v241 = v242 >> 1;
    if ((unint64_t)v242 >= 0x7FFFFFFFFFFFFFFCLL)
      v243 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v243 = v241;
    if (v243)
    {
      v244 = (char *)sub_1DCAE4D04((uint64_t)&v760, v243);
      v239 = (char *)__p;
      v229 = v759;
    }
    else
    {
      v244 = 0;
    }
    v245 = &v244[4 * v240];
    v227 = &v244[4 * v243];
    *(_DWORD *)v245 = v742.i32[0];
    v238 = v245 + 4;
    while (v229 != v239)
    {
      v246 = *((_DWORD *)v229 - 1);
      v229 -= 4;
      *((_DWORD *)v245 - 1) = v246;
      v245 -= 4;
    }
    __p = v245;
    v759 = v238;
    v760 = v227;
    if (v239)
    {
      operator delete(v239);
      v227 = v760;
    }
  }
  else
  {
    *(_DWORD *)v229 = v742.i32[0];
    v238 = v229 + 4;
  }
  v759 = v238;
  if (v238 >= v227)
  {
    v248 = (char *)__p;
    v249 = (v238 - (_BYTE *)__p) >> 2;
    v250 = v249 + 1;
    if ((unint64_t)(v249 + 1) >> 62)
      sub_1DCAE4C44();
    v251 = v227 - (_BYTE *)__p;
    if (v251 >> 1 > v250)
      v250 = v251 >> 1;
    if ((unint64_t)v251 >= 0x7FFFFFFFFFFFFFFCLL)
      v252 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v252 = v250;
    if (v252)
    {
      v253 = (char *)sub_1DCAE4D04((uint64_t)&v760, v252);
      v248 = (char *)__p;
      v238 = v759;
    }
    else
    {
      v253 = 0;
    }
    v254 = &v253[4 * v249];
    v255 = &v253[4 * v252];
    *(_DWORD *)v254 = 0;
    v247 = v254 + 4;
    while (v238 != v248)
    {
      v256 = *((_DWORD *)v238 - 1);
      v238 -= 4;
      *((_DWORD *)v254 - 1) = v256;
      v254 -= 4;
    }
    __p = v254;
    v759 = v247;
    v760 = v255;
    if (v248)
      operator delete(v248);
  }
  else
  {
    *(_DWORD *)v238 = 0;
    v247 = v238 + 4;
  }
  v759 = v247;
  v258 = v756;
  v257 = (float *)v757;
  if (v756 >= (float *)v757)
  {
    v260 = (float *)v755;
    v261 = ((char *)v756 - (_BYTE *)v755) >> 2;
    v262 = v261 + 1;
    if ((unint64_t)(v261 + 1) >> 62)
      sub_1DCAE4C44();
    v263 = v757 - (_BYTE *)v755;
    if ((v757 - (_BYTE *)v755) >> 1 > v262)
      v262 = v263 >> 1;
    if ((unint64_t)v263 >= 0x7FFFFFFFFFFFFFFCLL)
      v264 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v264 = v262;
    if (v264)
    {
      v265 = (char *)sub_1DCAE4D04((uint64_t)&v757, v264);
      v260 = (float *)v755;
      v258 = v756;
    }
    else
    {
      v265 = 0;
    }
    v266 = (float *)&v265[4 * v261];
    v257 = (float *)&v265[4 * v264];
    *v266 = 0.5;
    v259 = v266 + 1;
    while (v258 != v260)
    {
      v267 = *((_DWORD *)v258-- - 1);
      *((_DWORD *)v266-- - 1) = v267;
    }
    v755 = v266;
    v756 = v259;
    v757 = (char *)v257;
    if (v260)
    {
      operator delete(v260);
      v257 = (float *)v757;
    }
  }
  else
  {
    *v756 = 0.5;
    v259 = v258 + 1;
  }
  v756 = v259;
  if (v259 >= v257)
  {
    v269 = (float *)v755;
    v270 = ((char *)v259 - (_BYTE *)v755) >> 2;
    v271 = v270 + 1;
    if ((unint64_t)(v270 + 1) >> 62)
      sub_1DCAE4C44();
    v272 = (char *)v257 - (_BYTE *)v755;
    if (v272 >> 1 > v271)
      v271 = v272 >> 1;
    if ((unint64_t)v272 >= 0x7FFFFFFFFFFFFFFCLL)
      v273 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v273 = v271;
    if (v273)
    {
      v274 = (char *)sub_1DCAE4D04((uint64_t)&v757, v273);
      v269 = (float *)v755;
      v259 = v756;
    }
    else
    {
      v274 = 0;
    }
    v275 = (float *)&v274[4 * v270];
    v276 = &v274[4 * v273];
    *v275 = 1.0;
    v268 = v275 + 1;
    while (v259 != v269)
    {
      v277 = *((_DWORD *)v259-- - 1);
      *((_DWORD *)v275-- - 1) = v277;
    }
    v755 = v275;
    v756 = v268;
    v757 = v276;
    if (v269)
      operator delete(v269);
  }
  else
  {
    *v259 = 1.0;
    v268 = v259 + 1;
  }
  v756 = v268;
  v279 = v762;
  v278 = v763;
  if (v762 >= (float *)v763)
  {
    v281 = v761;
    v282 = v762 - v761;
    v283 = v282 + 1;
    if ((unint64_t)(v282 + 1) >> 62)
      sub_1DCAE4C44();
    v284 = v763 - (char *)v761;
    if ((v763 - (char *)v761) >> 1 > v283)
      v283 = v284 >> 1;
    if ((unint64_t)v284 >= 0x7FFFFFFFFFFFFFFCLL)
      v285 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v285 = v283;
    if (v285)
    {
      v286 = (char *)sub_1DCAE4D04((uint64_t)&v763, v285);
      v281 = v761;
      v279 = v762;
    }
    else
    {
      v286 = 0;
    }
    v287 = (float *)&v286[4 * v282];
    v278 = &v286[4 * v285];
    *v287 = 0.0;
    v280 = v287 + 1;
    while (v279 != v281)
    {
      v288 = *((_DWORD *)v279-- - 1);
      *((_DWORD *)v287-- - 1) = v288;
    }
    v761 = v287;
    v762 = v280;
    v763 = v278;
    if (v281)
    {
      operator delete(v281);
      v278 = v763;
    }
  }
  else
  {
    *v762 = 0.0;
    v280 = v279 + 1;
  }
  v762 = v280;
  v289 = -v16;
  if (v280 >= (float *)v278)
  {
    v291 = v761;
    v292 = v280 - v761;
    v293 = v292 + 1;
    if ((unint64_t)(v292 + 1) >> 62)
      sub_1DCAE4C44();
    v294 = v278 - (char *)v761;
    if (v294 >> 1 > v293)
      v293 = v294 >> 1;
    if ((unint64_t)v294 >= 0x7FFFFFFFFFFFFFFCLL)
      v295 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v295 = v293;
    if (v295)
    {
      v296 = (char *)sub_1DCAE4D04((uint64_t)&v763, v295);
      v291 = v761;
      v280 = v762;
    }
    else
    {
      v296 = 0;
    }
    v297 = (float *)&v296[4 * v292];
    v278 = &v296[4 * v295];
    *v297 = v289;
    v290 = v297 + 1;
    while (v280 != v291)
    {
      v298 = *((_DWORD *)v280-- - 1);
      *((_DWORD *)v297-- - 1) = v298;
    }
    v761 = v297;
    v762 = v290;
    v763 = v278;
    if (v291)
    {
      operator delete(v291);
      v278 = v763;
    }
  }
  else
  {
    *v280 = v289;
    v290 = v280 + 1;
  }
  v762 = v290;
  if (v290 >= (float *)v278)
  {
    v300 = v761;
    v301 = v290 - v761;
    v302 = v301 + 1;
    if ((unint64_t)(v301 + 1) >> 62)
      sub_1DCAE4C44();
    v303 = v278 - (char *)v761;
    if (v303 >> 1 > v302)
      v302 = v303 >> 1;
    if ((unint64_t)v303 >= 0x7FFFFFFFFFFFFFFCLL)
      v304 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v304 = v302;
    if (v304)
    {
      v305 = (char *)sub_1DCAE4D04((uint64_t)&v763, v304);
      v300 = v761;
      v290 = v762;
    }
    else
    {
      v305 = 0;
    }
    v306 = &v305[4 * v301];
    v307 = &v305[4 * v304];
    *(_DWORD *)v306 = 0;
    v299 = (float *)(v306 + 4);
    while (v290 != v300)
    {
      v308 = *((_DWORD *)v290-- - 1);
      *((_DWORD *)v306 - 1) = v308;
      v306 -= 4;
    }
    v761 = (float *)v306;
    v762 = v299;
    v763 = v307;
    if (v300)
      operator delete(v300);
  }
  else
  {
    *v290 = 0.0;
    v299 = v290 + 1;
  }
  v762 = v299;
  v310 = (float *)v759;
  v309 = v760;
  if (v759 >= v760)
  {
    v312 = (float *)__p;
    v313 = (v759 - (_BYTE *)__p) >> 2;
    v314 = v313 + 1;
    if ((unint64_t)(v313 + 1) >> 62)
      sub_1DCAE4C44();
    v315 = v760 - (_BYTE *)__p;
    if ((v760 - (_BYTE *)__p) >> 1 > v314)
      v314 = v315 >> 1;
    if ((unint64_t)v315 >= 0x7FFFFFFFFFFFFFFCLL)
      v316 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v316 = v314;
    if (v316)
    {
      v317 = (char *)sub_1DCAE4D04((uint64_t)&v760, v316);
      v312 = (float *)__p;
      v310 = (float *)v759;
    }
    else
    {
      v317 = 0;
    }
    v318 = (float *)&v317[4 * v313];
    v309 = &v317[4 * v316];
    *v318 = 0.0;
    v311 = v318 + 1;
    while (v310 != v312)
    {
      v319 = *((_DWORD *)v310-- - 1);
      *((_DWORD *)v318-- - 1) = v319;
    }
    __p = v318;
    v759 = (char *)v311;
    v760 = v309;
    if (v312)
    {
      operator delete(v312);
      v309 = v760;
    }
  }
  else
  {
    *(_DWORD *)v759 = 0;
    v311 = v310 + 1;
  }
  v759 = (char *)v311;
  if (v736)
    v320 = 1.0;
  else
    v320 = -1.0;
  if (v311 >= (float *)v309)
  {
    v322 = (float *)__p;
    v323 = ((char *)v311 - (_BYTE *)__p) >> 2;
    v324 = v323 + 1;
    if ((unint64_t)(v323 + 1) >> 62)
      sub_1DCAE4C44();
    v325 = v309 - (_BYTE *)__p;
    if (v325 >> 1 > v324)
      v324 = v325 >> 1;
    if ((unint64_t)v325 >= 0x7FFFFFFFFFFFFFFCLL)
      v326 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v326 = v324;
    if (v326)
    {
      v327 = (char *)sub_1DCAE4D04((uint64_t)&v760, v326);
      v322 = (float *)__p;
      v311 = (float *)v759;
    }
    else
    {
      v327 = 0;
    }
    v328 = (float *)&v327[4 * v323];
    v309 = &v327[4 * v326];
    *v328 = v320;
    v321 = (char *)(v328 + 1);
    while (v311 != v322)
    {
      v329 = *((_DWORD *)v311-- - 1);
      *((_DWORD *)v328-- - 1) = v329;
    }
    __p = v328;
    v759 = v321;
    v760 = v309;
    if (v322)
    {
      operator delete(v322);
      v309 = v760;
    }
  }
  else
  {
    *v311 = v320;
    v321 = (char *)(v311 + 1);
  }
  v759 = v321;
  if (v321 >= v309)
  {
    v331 = (char *)__p;
    v332 = (v321 - (_BYTE *)__p) >> 2;
    v333 = v332 + 1;
    if ((unint64_t)(v332 + 1) >> 62)
      sub_1DCAE4C44();
    v334 = v309 - (_BYTE *)__p;
    if (v334 >> 1 > v333)
      v333 = v334 >> 1;
    if ((unint64_t)v334 >= 0x7FFFFFFFFFFFFFFCLL)
      v335 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v335 = v333;
    if (v335)
    {
      v336 = (char *)sub_1DCAE4D04((uint64_t)&v760, v335);
      v331 = (char *)__p;
      v321 = v759;
    }
    else
    {
      v336 = 0;
    }
    v337 = &v336[4 * v332];
    v338 = &v336[4 * v335];
    *(_DWORD *)v337 = 0;
    v330 = v337 + 4;
    while (v321 != v331)
    {
      v339 = *((_DWORD *)v321 - 1);
      v321 -= 4;
      *((_DWORD *)v337 - 1) = v339;
      v337 -= 4;
    }
    __p = v337;
    v759 = v330;
    v760 = v338;
    if (v331)
      operator delete(v331);
  }
  else
  {
    *(_DWORD *)v321 = 0;
    v330 = v321 + 4;
  }
  v759 = v330;
  v341 = v756;
  v340 = (float *)v757;
  if (v756 >= (float *)v757)
  {
    v343 = (float *)v755;
    v344 = ((char *)v756 - (_BYTE *)v755) >> 2;
    v345 = v344 + 1;
    if ((unint64_t)(v344 + 1) >> 62)
      sub_1DCAE4C44();
    v346 = v757 - (_BYTE *)v755;
    if ((v757 - (_BYTE *)v755) >> 1 > v345)
      v345 = v346 >> 1;
    if ((unint64_t)v346 >= 0x7FFFFFFFFFFFFFFCLL)
      v347 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v347 = v345;
    if (v347)
    {
      v348 = (char *)sub_1DCAE4D04((uint64_t)&v757, v347);
      v343 = (float *)v755;
      v341 = v756;
    }
    else
    {
      v348 = 0;
    }
    v349 = (float *)&v348[4 * v344];
    v340 = (float *)&v348[4 * v347];
    *v349 = 0.5;
    v342 = v349 + 1;
    while (v341 != v343)
    {
      v350 = *((_DWORD *)v341-- - 1);
      *((_DWORD *)v349-- - 1) = v350;
    }
    v755 = v349;
    v756 = v342;
    v757 = (char *)v340;
    if (v343)
    {
      operator delete(v343);
      v340 = (float *)v757;
    }
  }
  else
  {
    *v756 = 0.5;
    v342 = v341 + 1;
  }
  v756 = v342;
  if (v342 >= v340)
  {
    v352 = (float *)v755;
    v353 = ((char *)v342 - (_BYTE *)v755) >> 2;
    v354 = v353 + 1;
    if ((unint64_t)(v353 + 1) >> 62)
      sub_1DCAE4C44();
    v355 = (char *)v340 - (_BYTE *)v755;
    if (v355 >> 1 > v354)
      v354 = v355 >> 1;
    if ((unint64_t)v355 >= 0x7FFFFFFFFFFFFFFCLL)
      v356 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v356 = v354;
    if (v356)
    {
      v357 = (char *)sub_1DCAE4D04((uint64_t)&v757, v356);
      v352 = (float *)v755;
      v342 = v756;
    }
    else
    {
      v357 = 0;
    }
    v358 = (float *)&v357[4 * v353];
    v359 = &v357[4 * v356];
    *v358 = 0.0;
    v351 = v358 + 1;
    while (v342 != v352)
    {
      v360 = *((_DWORD *)v342-- - 1);
      *((_DWORD *)v358-- - 1) = v360;
    }
    v755 = v358;
    v756 = v351;
    v757 = v359;
    if (v352)
      operator delete(v352);
  }
  else
  {
    *v342 = 0.0;
    v351 = v342 + 1;
  }
  v361 = 0;
  v362 = 0;
  v756 = v351;
  v363 = (v762 - v761) / 3uLL;
  v752 = 0;
  v753 = 0;
  v754 = 0;
  v364 = v363 - 2;
  v749 = v363 - 1;
  do
  {
    v365 = v754;
    if (v751 == 2)
    {
      if (v361 >= (__int16 *)v754)
      {
        v368 = v752;
        v369 = (char *)v361 - (char *)v752;
        if ((char *)v361 - (char *)v752 <= -3)
          goto LABEL_982;
        v370 = v369 >> 1;
        if (v754 - (char *)v752 <= (unint64_t)((v369 >> 1) + 1))
          v371 = v370 + 1;
        else
          v371 = v754 - (char *)v752;
        if ((unint64_t)(v754 - (char *)v752) >= 0x7FFFFFFFFFFFFFFELL)
          v372 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v372 = v371;
        if (v372)
        {
          v373 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v372);
          v368 = v752;
          v361 = v753;
        }
        else
        {
          v373 = 0;
        }
        v380 = &v373[2 * v370];
        *(_WORD *)v380 = v364;
        v366 = v380 + 2;
        while (v361 != v368)
        {
          v381 = *--v361;
          *((_WORD *)v380 - 1) = v381;
          v380 -= 2;
        }
        v365 = &v373[2 * v372];
        v752 = (__int16 *)v380;
        v754 = v365;
        if (v368)
        {
          operator delete(v368);
          v365 = v754;
        }
      }
      else
      {
        *v361 = v364;
        v366 = (char *)(v361 + 1);
      }
      v382 = v362 + 1;
      if (v362 == 4)
        v383 = 0;
      else
        v383 = v362 + 1;
      if (v366 >= v365)
      {
        v385 = v752;
        v386 = v366 - (char *)v752;
        if (v366 - (char *)v752 <= -3)
          sub_1DCAE4C44();
        v387 = v386 >> 1;
        v388 = v365 - (char *)v752;
        if (v388 <= (v386 >> 1) + 1)
          v389 = v387 + 1;
        else
          v389 = v388;
        if (v388 >= 0x7FFFFFFFFFFFFFFELL)
          v390 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v390 = v389;
        if (v390)
        {
          v391 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v390);
          v385 = v752;
        }
        else
        {
          v391 = 0;
        }
        v401 = &v391[2 * v387];
        *(_WORD *)v401 = v383;
        v384 = v401 + 2;
        while (v366 != (char *)v385)
        {
          v402 = *((_WORD *)v366 - 1);
          v366 -= 2;
          *((_WORD *)v401 - 1) = v402;
          v401 -= 2;
        }
        v365 = &v391[2 * v390];
        v752 = (__int16 *)v401;
        v754 = v365;
        if (v385)
        {
          operator delete(v385);
          v365 = v754;
        }
      }
      else
      {
        *(_WORD *)v366 = v383;
        v384 = v366 + 2;
      }
      if (v384 >= v365)
      {
        v403 = v752;
        v404 = v384 - (char *)v752;
        if (v384 - (char *)v752 < -2)
LABEL_982:
          sub_1DCAE4C44();
        v405 = v404 >> 1;
        v406 = v365 - (char *)v752;
        if (v406 <= (v404 >> 1) + 1)
          v407 = v405 + 1;
        else
          v407 = v406;
        if (v406 >= 0x7FFFFFFFFFFFFFFELL)
          v408 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v408 = v407;
        if (v408)
        {
          v409 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v408);
          v403 = v752;
        }
        else
        {
          v409 = 0;
        }
        v412 = &v409[2 * v405];
        *(_WORD *)v412 = v362;
        v361 = (__int16 *)(v412 + 2);
        while (v384 != (char *)v403)
        {
          v413 = *((_WORD *)v384 - 1);
          v384 -= 2;
          *((_WORD *)v412 - 1) = v413;
          v412 -= 2;
        }
        v752 = (__int16 *)v412;
        v754 = &v409[2 * v408];
        if (v403)
          operator delete(v403);
      }
      else
      {
        *(_WORD *)v384 = v362;
        v361 = (__int16 *)(v384 + 2);
      }
      v753 = v361;
    }
    else
    {
      if (v361 >= (__int16 *)v754)
      {
        v374 = v752;
        v375 = (char *)v361 - (char *)v752;
        if ((char *)v361 - (char *)v752 < -2)
          goto LABEL_982;
        v376 = v375 >> 1;
        if (v754 - (char *)v752 <= (unint64_t)((v375 >> 1) + 1))
          v377 = v376 + 1;
        else
          v377 = v754 - (char *)v752;
        if ((unint64_t)(v754 - (char *)v752) >= 0x7FFFFFFFFFFFFFFELL)
          v378 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v378 = v377;
        if (v378)
        {
          v379 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v378);
          v374 = v752;
          v361 = v753;
        }
        else
        {
          v379 = 0;
        }
        v392 = &v379[2 * v376];
        *(_WORD *)v392 = v364;
        v367 = v392 + 2;
        while (v361 != v374)
        {
          v393 = *--v361;
          *((_WORD *)v392 - 1) = v393;
          v392 -= 2;
        }
        v365 = &v379[2 * v378];
        v752 = (__int16 *)v392;
        v754 = v365;
        if (v374)
        {
          operator delete(v374);
          v365 = v754;
        }
      }
      else
      {
        *v361 = v364;
        v367 = (char *)(v361 + 1);
      }
      if (v367 >= v365)
      {
        v394 = v752;
        v395 = v367 - (char *)v752;
        if (v367 - (char *)v752 < -2)
          goto LABEL_982;
        v396 = v395 >> 1;
        v397 = v365 - (char *)v752;
        if (v397 <= (v395 >> 1) + 1)
          v398 = v396 + 1;
        else
          v398 = v397;
        if (v397 >= 0x7FFFFFFFFFFFFFFELL)
          v399 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v399 = v398;
        if (v399)
        {
          v400 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v399);
          v394 = v752;
        }
        else
        {
          v400 = 0;
        }
        v410 = &v400[2 * v396];
        *(_WORD *)v410 = v362;
        v361 = (__int16 *)(v410 + 2);
        while (v367 != (char *)v394)
        {
          v411 = *((_WORD *)v367 - 1);
          v367 -= 2;
          *((_WORD *)v410 - 1) = v411;
          v410 -= 2;
        }
        v752 = (__int16 *)v410;
        v754 = &v400[2 * v399];
        if (v394)
          operator delete(v394);
      }
      else
      {
        *(_WORD *)v367 = v362;
        v361 = (__int16 *)(v367 + 2);
      }
      v753 = v361;
      v382 = v362 + 1;
    }
    v362 = v382;
  }
  while (v382 != 5);
  v414 = 0;
  do
  {
    v415 = v754;
    if (v751 == 2)
    {
      if (v361 >= (__int16 *)v754)
      {
        v418 = v752;
        v419 = (char *)v361 - (char *)v752;
        if ((char *)v361 - (char *)v752 <= -3)
          goto LABEL_979;
        v420 = v419 >> 1;
        if (v754 - (char *)v752 <= (unint64_t)((v419 >> 1) + 1))
          v421 = v420 + 1;
        else
          v421 = v754 - (char *)v752;
        if ((unint64_t)(v754 - (char *)v752) >= 0x7FFFFFFFFFFFFFFELL)
          v422 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v422 = v421;
        if (v422)
        {
          v423 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v422);
          v418 = v752;
          v361 = v753;
        }
        else
        {
          v423 = 0;
        }
        v430 = &v423[2 * v420];
        *(_WORD *)v430 = v414;
        v416 = v430 + 2;
        while (v361 != v418)
        {
          v431 = *--v361;
          *((_WORD *)v430 - 1) = v431;
          v430 -= 2;
        }
        v415 = &v423[2 * v422];
        v752 = (__int16 *)v430;
        v754 = v415;
        if (v418)
        {
          operator delete(v418);
          v415 = v754;
        }
      }
      else
      {
        *v361 = v414;
        v416 = (char *)(v361 + 1);
      }
      v432 = v414 + 1;
      if (v414 == 4)
        v433 = 0;
      else
        v433 = v414 + 1;
      v434 = v433 + 5;
      if (v416 >= v415)
      {
        v436 = v752;
        v437 = v416 - (char *)v752;
        if (v416 - (char *)v752 <= -3)
          sub_1DCAE4C44();
        v438 = v437 >> 1;
        v439 = v415 - (char *)v752;
        if (v439 <= (v437 >> 1) + 1)
          v440 = v438 + 1;
        else
          v440 = v439;
        if (v439 >= 0x7FFFFFFFFFFFFFFELL)
          v441 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v441 = v440;
        if (v441)
        {
          v442 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v441);
          v436 = v752;
        }
        else
        {
          v442 = 0;
        }
        v454 = &v442[2 * v438];
        *(_WORD *)v454 = v434;
        v435 = v454 + 2;
        while (v416 != (char *)v436)
        {
          v455 = *((_WORD *)v416 - 1);
          v416 -= 2;
          *((_WORD *)v454 - 1) = v455;
          v454 -= 2;
        }
        v415 = &v442[2 * v441];
        v752 = (__int16 *)v454;
        v754 = v415;
        if (v436)
        {
          operator delete(v436);
          v415 = v754;
        }
      }
      else
      {
        *(_WORD *)v416 = v434;
        v435 = v416 + 2;
      }
      v456 = v414 + 5;
      if (v435 >= v415)
      {
        v458 = v752;
        v459 = v435 - (char *)v752;
        if (v435 - (char *)v752 <= -3)
          sub_1DCAE4C44();
        v460 = v459 >> 1;
        v461 = v415 - (char *)v752;
        if (v461 <= (v459 >> 1) + 1)
          v462 = v460 + 1;
        else
          v462 = v461;
        if (v461 >= 0x7FFFFFFFFFFFFFFELL)
          v463 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v463 = v462;
        if (v463)
        {
          v464 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v463);
          v458 = v752;
        }
        else
        {
          v464 = 0;
        }
        v475 = &v464[2 * v460];
        *(_WORD *)v475 = v456;
        v457 = v475 + 2;
        while (v435 != (char *)v458)
        {
          v476 = *((_WORD *)v435 - 1);
          v435 -= 2;
          *((_WORD *)v475 - 1) = v476;
          v475 -= 2;
        }
        v415 = &v464[2 * v463];
        v752 = (__int16 *)v475;
        v754 = v415;
        if (v458)
        {
          operator delete(v458);
          v415 = v754;
        }
      }
      else
      {
        *(_WORD *)v435 = v456;
        v457 = v435 + 2;
      }
      if (v457 >= v415)
      {
        v478 = v752;
        v479 = v457 - (char *)v752;
        if (v457 - (char *)v752 <= -3)
          sub_1DCAE4C44();
        v480 = v479 >> 1;
        v481 = v415 - (char *)v752;
        if (v481 <= (v479 >> 1) + 1)
          v482 = v480 + 1;
        else
          v482 = v481;
        if (v481 >= 0x7FFFFFFFFFFFFFFELL)
          v483 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v483 = v482;
        if (v483)
        {
          v484 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v483);
          v478 = v752;
        }
        else
        {
          v484 = 0;
        }
        v496 = &v484[2 * v480];
        *(_WORD *)v496 = v433;
        v477 = v496 + 2;
        while (v457 != (char *)v478)
        {
          v497 = *((_WORD *)v457 - 1);
          v457 -= 2;
          *((_WORD *)v496 - 1) = v497;
          v496 -= 2;
        }
        v415 = &v484[2 * v483];
        v752 = (__int16 *)v496;
        v754 = v415;
        if (v478)
        {
          operator delete(v478);
          v415 = v754;
        }
      }
      else
      {
        *(_WORD *)v457 = v433;
        v477 = v457 + 2;
      }
      if (v477 >= v415)
      {
        v499 = v752;
        v500 = v477 - (char *)v752;
        if (v477 - (char *)v752 <= -3)
          sub_1DCAE4C44();
        v501 = v500 >> 1;
        v502 = v415 - (char *)v752;
        if (v502 <= (v500 >> 1) + 1)
          v503 = v501 + 1;
        else
          v503 = v502;
        if (v502 >= 0x7FFFFFFFFFFFFFFELL)
          v504 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v504 = v503;
        if (v504)
        {
          v505 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v504);
          v499 = v752;
        }
        else
        {
          v505 = 0;
        }
        v516 = &v505[2 * v501];
        *(_WORD *)v516 = v434;
        v498 = v516 + 2;
        while (v477 != (char *)v499)
        {
          v517 = *((_WORD *)v477 - 1);
          v477 -= 2;
          *((_WORD *)v516 - 1) = v517;
          v516 -= 2;
        }
        v415 = &v505[2 * v504];
        v752 = (__int16 *)v516;
        v754 = v415;
        if (v499)
        {
          operator delete(v499);
          v415 = v754;
        }
      }
      else
      {
        *(_WORD *)v477 = v434;
        v498 = v477 + 2;
      }
      if (v498 < v415)
        goto LABEL_848;
      v518 = v752;
      v519 = v498 - (char *)v752;
      if (v498 - (char *)v752 < -2)
LABEL_979:
        sub_1DCAE4C44();
      v520 = v519 >> 1;
      v521 = v415 - (char *)v752;
      if (v521 <= (v519 >> 1) + 1)
        v522 = v520 + 1;
      else
        v522 = v521;
      if (v521 >= 0x7FFFFFFFFFFFFFFELL)
        v523 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v523 = v522;
      if (v523)
      {
        v524 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v523);
        v518 = v752;
      }
      else
      {
        v524 = 0;
      }
      v535 = &v524[2 * v520];
      *(_WORD *)v535 = v414;
      v361 = (__int16 *)(v535 + 2);
      while (v498 != (char *)v518)
      {
        v536 = *((_WORD *)v498 - 1);
        v498 -= 2;
        *((_WORD *)v535 - 1) = v536;
        v535 -= 2;
      }
    }
    else
    {
      if (v361 >= (__int16 *)v754)
      {
        v424 = v752;
        v425 = (char *)v361 - (char *)v752;
        if ((char *)v361 - (char *)v752 < -2)
          goto LABEL_979;
        v426 = v425 >> 1;
        if (v754 - (char *)v752 <= (unint64_t)((v425 >> 1) + 1))
          v427 = v426 + 1;
        else
          v427 = v754 - (char *)v752;
        if ((unint64_t)(v754 - (char *)v752) >= 0x7FFFFFFFFFFFFFFELL)
          v428 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v428 = v427;
        if (v428)
        {
          v429 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v428);
          v424 = v752;
          v361 = v753;
        }
        else
        {
          v429 = 0;
        }
        v443 = &v429[2 * v426];
        *(_WORD *)v443 = v414;
        v417 = v443 + 2;
        while (v361 != v424)
        {
          v444 = *--v361;
          *((_WORD *)v443 - 1) = v444;
          v443 -= 2;
        }
        v415 = &v429[2 * v428];
        v752 = (__int16 *)v443;
        v754 = v415;
        if (v424)
        {
          operator delete(v424);
          v415 = v754;
        }
      }
      else
      {
        *v361 = v414;
        v417 = (char *)(v361 + 1);
      }
      v445 = v414 + 5;
      if (v417 >= v415)
      {
        v447 = v752;
        v448 = v417 - (char *)v752;
        if (v417 - (char *)v752 <= -3)
          sub_1DCAE4C44();
        v449 = v448 >> 1;
        v450 = v415 - (char *)v752;
        if (v450 <= (v448 >> 1) + 1)
          v451 = v449 + 1;
        else
          v451 = v450;
        if (v450 >= 0x7FFFFFFFFFFFFFFELL)
          v452 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v452 = v451;
        if (v452)
        {
          v453 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v452);
          v447 = v752;
        }
        else
        {
          v453 = 0;
        }
        v465 = &v453[2 * v449];
        *(_WORD *)v465 = v445;
        v446 = v465 + 2;
        while (v417 != (char *)v447)
        {
          v466 = *((_WORD *)v417 - 1);
          v417 -= 2;
          *((_WORD *)v465 - 1) = v466;
          v465 -= 2;
        }
        v415 = &v453[2 * v452];
        v752 = (__int16 *)v465;
        v754 = v415;
        if (v447)
        {
          operator delete(v447);
          v415 = v754;
        }
      }
      else
      {
        *(_WORD *)v417 = v445;
        v446 = v417 + 2;
      }
      if (v446 >= v415)
      {
        v468 = v752;
        v469 = v446 - (char *)v752;
        if (v446 - (char *)v752 < -2)
          goto LABEL_979;
        v470 = v469 >> 1;
        v471 = v415 - (char *)v752;
        if (v471 <= (v469 >> 1) + 1)
          v472 = v470 + 1;
        else
          v472 = v471;
        if (v471 >= 0x7FFFFFFFFFFFFFFELL)
          v473 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v473 = v472;
        if (v473)
        {
          v474 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v473);
          v468 = v752;
        }
        else
        {
          v474 = 0;
        }
        v485 = &v474[2 * v470];
        *(_WORD *)v485 = v414;
        v467 = v485 + 2;
        while (v446 != (char *)v468)
        {
          v486 = *((_WORD *)v446 - 1);
          v446 -= 2;
          *((_WORD *)v485 - 1) = v486;
          v485 -= 2;
        }
        v415 = &v474[2 * v473];
        v752 = (__int16 *)v485;
        v754 = v415;
        if (v468)
        {
          operator delete(v468);
          v415 = v754;
        }
      }
      else
      {
        *(_WORD *)v446 = v414;
        v467 = v446 + 2;
      }
      v432 = v414 + 1;
      if (v414 == 4)
        v487 = 0;
      else
        v487 = v414 + 1;
      if (v467 >= v415)
      {
        v489 = v752;
        v490 = v467 - (char *)v752;
        if (v467 - (char *)v752 <= -3)
          sub_1DCAE4C44();
        v491 = v490 >> 1;
        v492 = v415 - (char *)v752;
        if (v492 <= (v490 >> 1) + 1)
          v493 = v491 + 1;
        else
          v493 = v492;
        if (v492 >= 0x7FFFFFFFFFFFFFFELL)
          v494 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v494 = v493;
        if (v494)
        {
          v495 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v494);
          v489 = v752;
        }
        else
        {
          v495 = 0;
        }
        v506 = &v495[2 * v491];
        *(_WORD *)v506 = v487;
        v488 = v506 + 2;
        while (v467 != (char *)v489)
        {
          v507 = *((_WORD *)v467 - 1);
          v467 -= 2;
          *((_WORD *)v506 - 1) = v507;
          v506 -= 2;
        }
        v415 = &v495[2 * v494];
        v752 = (__int16 *)v506;
        v754 = v415;
        if (v489)
        {
          operator delete(v489);
          v415 = v754;
        }
      }
      else
      {
        *(_WORD *)v467 = v487;
        v488 = v467 + 2;
      }
      if (v488 >= v415)
      {
        v509 = v752;
        v510 = v488 - (char *)v752;
        if (v488 - (char *)v752 < -2)
          goto LABEL_979;
        v511 = v510 >> 1;
        v512 = v415 - (char *)v752;
        if (v512 <= (v510 >> 1) + 1)
          v513 = v511 + 1;
        else
          v513 = v512;
        if (v512 >= 0x7FFFFFFFFFFFFFFELL)
          v514 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v514 = v513;
        if (v514)
        {
          v515 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v514);
          v509 = v752;
        }
        else
        {
          v515 = 0;
        }
        v525 = &v515[2 * v511];
        *(_WORD *)v525 = v414;
        v508 = v525 + 2;
        while (v488 != (char *)v509)
        {
          v526 = *((_WORD *)v488 - 1);
          v488 -= 2;
          *((_WORD *)v525 - 1) = v526;
          v525 -= 2;
        }
        v415 = &v515[2 * v514];
        v752 = (__int16 *)v525;
        v754 = v415;
        if (v509)
        {
          operator delete(v509);
          v415 = v754;
        }
      }
      else
      {
        *(_WORD *)v488 = v414;
        v508 = v488 + 2;
      }
      LOWORD(v414) = v487 + 5;
      if (v508 >= v415)
      {
        v528 = v752;
        v529 = v508 - (char *)v752;
        if (v508 - (char *)v752 <= -3)
          sub_1DCAE4C44();
        v530 = v529 >> 1;
        v531 = v415 - (char *)v752;
        if (v531 <= (v529 >> 1) + 1)
          v532 = v530 + 1;
        else
          v532 = v531;
        if (v531 >= 0x7FFFFFFFFFFFFFFELL)
          v533 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v533 = v532;
        if (v533)
        {
          v534 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v533);
          v528 = v752;
        }
        else
        {
          v534 = 0;
        }
        v537 = &v534[2 * v530];
        *(_WORD *)v537 = v414;
        v527 = v537 + 2;
        while (v508 != (char *)v528)
        {
          v538 = *((_WORD *)v508 - 1);
          v508 -= 2;
          *((_WORD *)v537 - 1) = v538;
          v537 -= 2;
        }
        v415 = &v534[2 * v533];
        v752 = (__int16 *)v537;
        v754 = v415;
        if (v528)
        {
          operator delete(v528);
          v415 = v754;
        }
      }
      else
      {
        *(_WORD *)v508 = v414;
        v527 = v508 + 2;
      }
      if (v527 >= v415)
      {
        v539 = v752;
        v540 = v527 - (char *)v752;
        if (v527 - (char *)v752 <= -3)
          sub_1DCAE4C44();
        v541 = v540 >> 1;
        v542 = v415 - (char *)v752;
        if (v542 <= (v540 >> 1) + 1)
          v543 = v541 + 1;
        else
          v543 = v542;
        if (v542 >= 0x7FFFFFFFFFFFFFFELL)
          v544 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v544 = v543;
        if (v544)
        {
          v545 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v544);
          v539 = v752;
        }
        else
        {
          v545 = 0;
        }
        v546 = &v545[2 * v541];
        *(_WORD *)v546 = v445;
        v498 = v546 + 2;
        while (v527 != (char *)v539)
        {
          v547 = *((_WORD *)v527 - 1);
          v527 -= 2;
          *((_WORD *)v546 - 1) = v547;
          v546 -= 2;
        }
        v415 = &v545[2 * v544];
        v752 = (__int16 *)v546;
        v754 = v415;
        if (v539)
        {
          operator delete(v539);
          v415 = v754;
        }
      }
      else
      {
        *(_WORD *)v527 = v445;
        v498 = v527 + 2;
      }
      if (v498 < v415)
      {
LABEL_848:
        *(_WORD *)v498 = v414;
        v361 = (__int16 *)(v498 + 2);
        goto LABEL_864;
      }
      v518 = v752;
      v548 = v498 - (char *)v752;
      if (v498 - (char *)v752 <= -3)
        sub_1DCAE4C44();
      v549 = v548 >> 1;
      v550 = v415 - (char *)v752;
      if (v550 <= (v548 >> 1) + 1)
        v551 = v549 + 1;
      else
        v551 = v550;
      if (v550 >= 0x7FFFFFFFFFFFFFFELL)
        v523 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v523 = v551;
      if (v523)
      {
        v524 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v523);
        v518 = v752;
      }
      else
      {
        v524 = 0;
      }
      v535 = &v524[2 * v549];
      *(_WORD *)v535 = v414;
      v361 = (__int16 *)(v535 + 2);
      while (v498 != (char *)v518)
      {
        v552 = *((_WORD *)v498 - 1);
        v498 -= 2;
        *((_WORD *)v535 - 1) = v552;
        v535 -= 2;
      }
    }
    v752 = (__int16 *)v535;
    v754 = &v524[2 * v523];
    if (v518)
      operator delete(v518);
LABEL_864:
    v753 = v361;
    v414 = v432;
  }
  while (v432 != 5);
  v553 = 0;
  do
  {
    v554 = v754;
    if (v751 == 2)
    {
      if (v361 >= (__int16 *)v754)
      {
        v557 = v752;
        v558 = (char *)v361 - (char *)v752;
        if ((char *)v361 - (char *)v752 <= -3)
          goto LABEL_989;
        v559 = v558 >> 1;
        if (v754 - (char *)v752 <= (unint64_t)((v558 >> 1) + 1))
          v560 = v559 + 1;
        else
          v560 = v754 - (char *)v752;
        if ((unint64_t)(v754 - (char *)v752) >= 0x7FFFFFFFFFFFFFFELL)
          v561 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v561 = v560;
        if (v561)
        {
          v562 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v561);
          v557 = v752;
          v361 = v753;
        }
        else
        {
          v562 = 0;
        }
        v569 = &v562[2 * v559];
        *(_WORD *)v569 = v749;
        v555 = v569 + 2;
        while (v361 != v557)
        {
          v570 = *--v361;
          *((_WORD *)v569 - 1) = v570;
          v569 -= 2;
        }
        v554 = &v562[2 * v561];
        v752 = (__int16 *)v569;
        v754 = v554;
        if (v557)
        {
          operator delete(v557);
          v554 = v754;
        }
      }
      else
      {
        *v361 = v749;
        v555 = (char *)(v361 + 1);
      }
      v571 = v553 + 5;
      if (v555 >= v554)
      {
        v573 = v752;
        v574 = v555 - (char *)v752;
        if (v555 - (char *)v752 <= -3)
          sub_1DCAE4C44();
        v575 = v574 >> 1;
        v576 = v554 - (char *)v752;
        if (v576 <= (v574 >> 1) + 1)
          v577 = v575 + 1;
        else
          v577 = v576;
        if (v576 >= 0x7FFFFFFFFFFFFFFELL)
          v578 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v578 = v577;
        if (v578)
        {
          v579 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v578);
          v573 = v752;
        }
        else
        {
          v579 = 0;
        }
        v590 = (__int16 *)&v579[2 * v575];
        *v590 = v571;
        v572 = v590 + 1;
        while (v555 != (char *)v573)
        {
          v591 = *((_WORD *)v555 - 1);
          v555 -= 2;
          *--v590 = v591;
        }
        v554 = &v579[2 * v578];
        v752 = v590;
        v754 = v554;
        if (v573)
        {
          operator delete(v573);
          v554 = v754;
        }
      }
      else
      {
        *(_WORD *)v555 = v571;
        v572 = (__int16 *)(v555 + 2);
      }
      v592 = v553 + 1;
      if (v553 == 4)
        v593 = 5;
      else
        v593 = v553 + 6;
      if (v572 >= (__int16 *)v554)
      {
        v594 = v752;
        v595 = (char *)v572 - (char *)v752;
        if ((char *)v572 - (char *)v752 <= -3)
          sub_1DCAE4C44();
        v596 = v595 >> 1;
        v597 = v554 - (char *)v752;
        if (v597 <= (v595 >> 1) + 1)
          v598 = v596 + 1;
        else
          v598 = v597;
        if (v597 >= 0x7FFFFFFFFFFFFFFELL)
          v599 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v599 = v598;
        if (v599)
        {
          v600 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v599);
          v594 = v752;
        }
        else
        {
          v600 = 0;
        }
        v603 = (__int16 *)&v600[2 * v596];
        *v603 = v593;
        v361 = v603 + 1;
        while (v572 != v594)
        {
          v604 = *--v572;
          *--v603 = v604;
        }
        v752 = v603;
        v754 = &v600[2 * v599];
        if (v594)
          operator delete(v594);
      }
      else
      {
        *v572 = v593;
        v361 = v572 + 1;
      }
      v753 = v361;
    }
    else
    {
      if (v361 >= (__int16 *)v754)
      {
        v563 = v752;
        v564 = (char *)v361 - (char *)v752;
        if ((char *)v361 - (char *)v752 < -2)
LABEL_989:
          sub_1DCAE4C44();
        v565 = v564 >> 1;
        if (v754 - (char *)v752 <= (unint64_t)((v564 >> 1) + 1))
          v566 = v565 + 1;
        else
          v566 = v754 - (char *)v752;
        if ((unint64_t)(v754 - (char *)v752) >= 0x7FFFFFFFFFFFFFFELL)
          v567 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v567 = v566;
        if (v567)
        {
          v568 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v567);
          v563 = v752;
          v361 = v753;
        }
        else
        {
          v568 = 0;
        }
        v580 = &v568[2 * v565];
        *(_WORD *)v580 = v749;
        v556 = v580 + 2;
        while (v361 != v563)
        {
          v581 = *--v361;
          *((_WORD *)v580 - 1) = v581;
          v580 -= 2;
        }
        v554 = &v568[2 * v567];
        v752 = (__int16 *)v580;
        v754 = v554;
        if (v563)
        {
          operator delete(v563);
          v554 = v754;
        }
      }
      else
      {
        *v361 = v749;
        v556 = (char *)(v361 + 1);
      }
      v582 = v553 + 5;
      if (v556 >= v554)
      {
        v583 = v752;
        v584 = v556 - (char *)v752;
        if (v556 - (char *)v752 <= -3)
          sub_1DCAE4C44();
        v585 = v584 >> 1;
        v586 = v554 - (char *)v752;
        if (v586 <= (v584 >> 1) + 1)
          v587 = v585 + 1;
        else
          v587 = v586;
        if (v586 >= 0x7FFFFFFFFFFFFFFELL)
          v588 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v588 = v587;
        if (v588)
        {
          v589 = (char *)sub_1DCB0DAEC((uint64_t)&v754, v588);
          v583 = v752;
        }
        else
        {
          v589 = 0;
        }
        v601 = &v589[2 * v585];
        *(_WORD *)v601 = v582;
        v361 = (__int16 *)(v601 + 2);
        while (v556 != (char *)v583)
        {
          v602 = *((_WORD *)v556 - 1);
          v556 -= 2;
          *((_WORD *)v601 - 1) = v602;
          v601 -= 2;
        }
        v752 = (__int16 *)v601;
        v754 = &v589[2 * v588];
        if (v583)
          operator delete(v583);
      }
      else
      {
        *(_WORD *)v556 = v582;
        v361 = (__int16 *)(v556 + 2);
      }
      v753 = v361;
      v592 = v553 + 1;
    }
    v553 = v592;
  }
  while (v592 != 5);
  v606 = v761;
  v605 = v762;
  v607 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v608 = (char *)v605 - (char *)v606;
  v609 = (v608 >> 2) / 3uLL;
  v750 = objc_retainAutorelease((id)objc_msgSend_initWithLength_(v607, v610, 32 * v609));
  v611 = v738;
  v614 = objc_msgSend_mutableBytes(v750, v612, v613);
  if ((unint64_t)v608 >= 0xC)
  {
    v616 = 0;
    v617 = 0;
    v618 = 1;
    do
    {
      v619 = (char *)&v761[v617];
      v620 = *(_QWORD *)v619;
      *(_DWORD *)(v614 + 8) = *((_DWORD *)v619 + 2);
      *(_QWORD *)v614 = v620;
      v621 = (char *)__p + 4 * v617;
      v622 = *(_QWORD *)v621;
      *(_DWORD *)(v614 + 20) = *((_DWORD *)v621 + 2);
      *(_QWORD *)(v614 + 12) = v622;
      *(_QWORD *)(v614 + 24) = *(_QWORD *)((char *)v755 + 4 * v616);
      v617 += 3;
      v623 = v609 > v618++;
      v616 += 2;
      v614 += 32;
    }
    while (v623);
  }
  objc_msgSend_setName_(v738, v615, (uint64_t)CFSTR("icosahedron"));
  v625 = (void *)objc_msgSend_newBufferWithData_type_(v737, v624, (uint64_t)v750, 1);
  v743 = v625;
  if (!v625)
  {
    v627 = (void *)MEMORY[0x1E0C99DA0];
    v628 = (objc_class *)objc_opt_class();
    NSStringFromClass(v628);
    v629 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v630 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v627, v631, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Could not allocate mesh buffer"), v629, v630);

    v611 = v738;
    v625 = 0;
  }
  if (objc_msgSend_conformsToProtocol_(v625, v626, (uint64_t)&unk_1F03B6D88))
  {
    v632 = v743;
    v633 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_name(v611, v634, v635);
    v636 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v633, v637, (uint64_t)CFSTR("%@-%@"), v636, CFSTR("position"));
    v638 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v632, v639, (uint64_t)v638);

  }
  v640 = objc_alloc(MEMORY[0x1E0C99D50]);
  v741 = (void *)objc_msgSend_initWithBytes_length_(v640, v641, (uint64_t)v752, (char *)v753 - (char *)v752);
  v643 = (void *)objc_msgSend_newBufferWithData_type_(v737, v642, (uint64_t)v741, 2);
  if (objc_msgSend_conformsToProtocol_(v643, v644, (uint64_t)&unk_1F03B6D88))
  {
    v645 = v643;
    objc_msgSend_name(v738, v646, v647);
    v648 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(v648, v649, (uint64_t)CFSTR("-Indices"));
    v650 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v645, v651, (uint64_t)v650);

  }
  v652 = [MDLSubmesh alloc];
  v653 = [MDLMaterial alloc];
  objc_msgSend_name(v738, v654, v655);
  v656 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v656, v657, (uint64_t)CFSTR("-Material"));
  v658 = (void *)objc_claimAutoreleasedReturnValue();
  v659 = (void *)objc_opt_new();
  v661 = (void *)objc_msgSend_initWithName_scatteringFunction_(v653, v660, (uint64_t)v658, v659);
  v663 = (void *)objc_msgSend_initWithIndexBuffer_indexCount_indexType_geometryType_material_(v652, v662, (uint64_t)v643, v753 - v752, 16, v751, v661);

  objc_msgSend_name(v738, v664, v665);
  v666 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v666, v667, (uint64_t)CFSTR("-0"));
  v668 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v663, v669, (uint64_t)v668);

  v670 = objc_alloc_init(MDLVertexDescriptor);
  objc_msgSend_attributes(v670, v671, v672);
  v673 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v673, v674, 0);
  v675 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v675, v676, (uint64_t)CFSTR("position"));

  objc_msgSend_attributes(v670, v677, v678);
  v679 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v679, v680, 0);
  v681 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFormat_(v681, v682, 786435);

  objc_msgSend_attributes(v670, v683, v684);
  v685 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v685, v686, 0);
  v687 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBufferIndex_(v687, v688, 0);

  objc_msgSend_attributes(v670, v689, v690);
  v691 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v691, v692, 1);
  v693 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v693, v694, (uint64_t)CFSTR("normal"));

  objc_msgSend_attributes(v670, v695, v696);
  v697 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v697, v698, 1);
  v699 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFormat_(v699, v700, 786435);

  objc_msgSend_attributes(v670, v701, v702);
  v703 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v703, v704, 1);
  v705 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBufferIndex_(v705, v706, 0);

  objc_msgSend_attributes(v670, v707, v708);
  v709 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v709, v710, 2);
  v711 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v711, v712, (uint64_t)CFSTR("textureCoordinate"));

  objc_msgSend_attributes(v670, v713, v714);
  v715 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v715, v716, 2);
  v717 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFormat_(v717, v718, 786434);

  objc_msgSend_attributes(v670, v719, v720);
  v721 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v721, v722, 2);
  v723 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBufferIndex_(v723, v724, 0);

  objc_msgSend_setPackedOffsets(v670, v725, v726);
  objc_msgSend_setPackedStrides(v670, v727, v728);
  v764[0] = v663;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v729, (uint64_t)v764, 1);
  v730 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__createWithVertexBuffer_vertexCount_descriptor_submeshes_(v738, v731, (uint64_t)v743, v609, v670, v730);

  v732 = v738;
  if (v752)
    operator delete(v752);
  if (v755)
  {
    v756 = (float *)v755;
    operator delete(v755);
  }
  if (__p)
  {
    v759 = (char *)__p;
    operator delete(__p);
  }
  if (v761)
  {
    v762 = v761;
    operator delete(v761);
  }
  v199 = v737;
  objc_autoreleasePoolPop(context);
LABEL_976:

  return v738;
}

+ (MDLMesh)newIcosahedronWithRadius:(float)radius inwardNormals:(BOOL)inwardNormals geometryType:(MDLGeometryType)geometryType allocator:(id)allocator
{
  _BOOL8 v7;
  id v8;
  MDLMesh *v9;
  const char *v10;
  MDLMesh *inited;
  int32x2_t v13;

  v7 = inwardNormals;
  v13 = *(int32x2_t *)&radius;
  v8 = allocator;
  v9 = [MDLMesh alloc];
  inited = (MDLMesh *)objc_msgSend_initIcosahedronWithExtent_inwardNormals_geometryType_allocator_(v9, v10, v7, geometryType, v8, *(double *)vdupq_lane_s32(v13, 0).i64);

  return inited;
}

+ (MDLMesh)newIcosahedronWithRadius:(float)radius inwardNormals:(BOOL)inwardNormals allocator:(id)allocator
{
  _BOOL8 v5;
  id v6;
  MDLMesh *v7;
  const char *v8;
  MDLMesh *inited;
  int32x2_t v11;

  v5 = inwardNormals;
  v11 = *(int32x2_t *)&radius;
  v6 = allocator;
  v7 = [MDLMesh alloc];
  inited = (MDLMesh *)objc_msgSend_initIcosahedronWithExtent_inwardNormals_geometryType_allocator_(v7, v8, v5, 2, v6, *(double *)vdupq_lane_s32(v11, 0).i64);

  return inited;
}

- (MDLMesh)initSphereWithExtent:(vector_float3)extent segments:(vector_uint2)segments inwardNormals:(BOOL)inwardNormals geometryType:(MDLGeometryType)geometryType allocator:(id)allocator
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  const char *v18;
  MDLMesh *v19;
  const char *v20;
  uint64_t v21;
  MDLMesh *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  const char *v38;
  void *v39;
  const char *v40;
  const char *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  id v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  const char *v66;
  void *v67;
  const char *v68;
  MDLMesh *v69;
  void *context;
  uint64_t v72;
  float32x4_t v73;
  uint64_t v74;
  void *v75;
  int v76;
  _QWORD v77[2];

  v8 = extent.i64[1];
  v9 = extent.i32[0];
  v73 = *(float32x4_t *)segments.i8;
  v74 = v7;
  v77[1] = *MEMORY[0x1E0C80C00];
  v13 = (id)inwardNormals;
  v72 = v8;
  if ((unint64_t)(v8 - 1) >= 2)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v14, v18, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: geometryType for Ellipsoid must be MDLGeometryTypeTriangles or MDLGeometryTypeLines"), v16, v17);

  }
  v19 = (MDLMesh *)objc_msgSend_initWithBufferAllocator_(self, v12, (uint64_t)v13);
  v22 = v19;
  if (v19)
  {
    objc_msgSend_allocator(v19, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74 <= 3)
      v24 = 3;
    else
      v24 = v74;
    if (HIDWORD(v74) <= 2)
      v25 = 2;
    else
      v25 = HIDWORD(v74);
    context = (void *)MEMORY[0x1DF0D25C8]();
    objc_msgSend_setName_(v22, v26, (uint64_t)CFSTR("ellipsoid"));
    v76 = 0;
    v27 = (v25 + 2 + (v25 + 2) * v24);
    v28 = malloc_type_malloc((32 * v27), 0xA1216F76uLL);
    sub_1DCB17090((uint64_t)v28, &v76, v24, v25, v9, 0, v73);
    sub_1DCB12C54();
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_layouts(v75, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v31, v32, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_stride(v33, v34, v35);

    v37 = objc_alloc(MEMORY[0x1E0C99D50]);
    v39 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v37, v38, (uint64_t)v28, v36 * v27, 1);
    v42 = (void *)objc_msgSend_newBufferWithData_type_(v23, v40, (uint64_t)v39, 1);
    if (!v42)
    {
      v43 = (void *)MEMORY[0x1E0C99DA0];
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_raise_format_(v43, v47, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Could not allocate mesh buffer"), v45, v46);

    }
    if (objc_msgSend_conformsToProtocol_(v42, v41, (uint64_t)&unk_1F03B6D88))
    {
      v50 = v42;
      v51 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_name(v22, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v51, v55, (uint64_t)CFSTR("%@-%@"), v54, CFSTR("position"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setName_(v50, v57, (uint64_t)v56);

    }
    objc_msgSend_name(v22, v48, v49);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27 > 0xFFFE)
      sub_1DCB175D0(v58, v23, v24, v25, v72, 0);
    else
      sub_1DCB172E8(v58, v23, v24, v25, v72, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_name(v22, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(v62, v63, (uint64_t)CFSTR("-0"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v59, v65, (uint64_t)v64);

    v77[0] = v59;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v66, (uint64_t)v77, 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__createWithVertexBuffer_vertexCount_descriptor_submeshes_(v22, v68, (uint64_t)v42, v27, v75, v67);

    v69 = v22;
    objc_autoreleasePoolPop(context);
  }
  else
  {
    v23 = v13;
  }

  return v22;
}

- (MDLMesh)initHemisphereWithExtent:(vector_float3)extent segments:(vector_uint2)segments inwardNormals:(BOOL)inwardNormals cap:(BOOL)cap geometryType:(MDLGeometryType)geometryType allocator:(id)allocator
{
  uint64_t v8;
  _BOOL8 v9;
  int v10;
  const char *v13;
  id v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  const char *v19;
  MDLMesh *v20;
  const char *v21;
  uint64_t v22;
  MDLMesh *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  const char *v27;
  int v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  const char *v40;
  void *v41;
  const char *v42;
  const char *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  id v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  const char *v68;
  void *v69;
  const char *v70;
  MDLMesh *v71;
  void *context;
  uint64_t v74;
  float32x4_t v75;
  uint64_t v76;
  void *v77;
  int v78;
  _QWORD v79[2];

  v9 = inwardNormals;
  v10 = extent.i32[0];
  v75 = *(float32x4_t *)segments.i8;
  v76 = v8;
  v79[1] = *MEMORY[0x1E0C80C00];
  v14 = (id)cap;
  v74 = v9;
  if ((unint64_t)(v9 - 1) >= 2)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v15, v19, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: geometryType for Ellipsoid must be MDLGeometryTypeTriangles or MDLGeometryTypeLines"), v17, v18);

  }
  v20 = (MDLMesh *)objc_msgSend_initWithBufferAllocator_(self, v13, (uint64_t)v14);
  v23 = v20;
  if (v20)
  {
    objc_msgSend_allocator(v20, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v76 <= 3)
      v25 = 3;
    else
      v25 = v76;
    if (HIDWORD(v76) <= 2)
      v26 = 2;
    else
      v26 = HIDWORD(v76);
    context = (void *)MEMORY[0x1DF0D25C8]();
    objc_msgSend_setName_(v23, v27, (uint64_t)CFSTR("sphere"));
    v78 = 0;
    if ((v26 & 1) != 0)
      v28 = 2;
    else
      v28 = 1;
    v29 = (v28 + v26 + (v28 + v26) * v25);
    v30 = malloc_type_malloc((32 * v29), 0x73788202uLL);
    sub_1DCB17090((uint64_t)v30, &v78, v25, v26, v10, 1, v75);
    sub_1DCB12C54();
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_layouts(v77, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v33, v34, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend_stride(v35, v36, v37);

    v39 = objc_alloc(MEMORY[0x1E0C99D50]);
    v41 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v39, v40, (uint64_t)v30, v38 * v29, 1);
    v44 = (void *)objc_msgSend_newBufferWithData_type_(v24, v42, (uint64_t)v41, 1);
    if (!v44)
    {
      v45 = (void *)MEMORY[0x1E0C99DA0];
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_raise_format_(v45, v49, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Could not allocate mesh buffer"), v47, v48);

    }
    if (objc_msgSend_conformsToProtocol_(v44, v43, (uint64_t)&unk_1F03B6D88))
    {
      v52 = v44;
      v53 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_name(v23, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v53, v57, (uint64_t)CFSTR("%@-%@"), v56, CFSTR("position"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setName_(v52, v59, (uint64_t)v58);

    }
    objc_msgSend_name(v23, v50, v51);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 > 0xFFFE)
      sub_1DCB175D0(v60, v24, v25, v26, v74, 1);
    else
      sub_1DCB172E8(v60, v24, v25, v26, v74, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_name(v23, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(v64, v65, (uint64_t)CFSTR("-0"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v61, v67, (uint64_t)v66);

    v79[0] = v61;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v68, (uint64_t)v79, 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__createWithVertexBuffer_vertexCount_descriptor_submeshes_(v23, v70, (uint64_t)v44, v29, v77, v69);

    v71 = v23;
    objc_autoreleasePoolPop(context);
  }
  else
  {
    v24 = v14;
  }

  return v23;
}

+ (MDLMesh)newEllipsoidWithRadii:(vector_float3)radii radialSegments:(NSUInteger)radialSegments verticalSegments:(NSUInteger)verticalSegments geometryType:(MDLGeometryType)geometryType inwardNormals:(BOOL)inwardNormals hemisphere:(BOOL)hemisphere allocator:(id)allocator
{
  double v9;
  int v10;
  __int32 v13;
  __int32 v14;
  id v15;
  MDLMesh *v16;
  const char *v17;
  uint64_t inited;
  MDLMesh *v19;
  double v21;

  v10 = geometryType;
  v13 = radii.i32[2];
  v14 = radii.i32[0];
  v21 = v9;
  v15 = (id)inwardNormals;
  v16 = [MDLMesh alloc];
  if (v10)
    inited = objc_msgSend_initHemisphereWithExtent_segments_inwardNormals_cap_geometryType_allocator_(v16, v17, verticalSegments, 1, radialSegments, v15, v21, COERCE_DOUBLE(__PAIR64__(v13, v14)));
  else
    inited = objc_msgSend_initSphereWithExtent_segments_inwardNormals_geometryType_allocator_(v16, v17, verticalSegments, radialSegments, v15, v21, COERCE_DOUBLE(__PAIR64__(v13, v14)));
  v19 = (MDLMesh *)inited;

  return v19;
}

- (MDLMesh)initMeshBySubdividingMesh:(MDLMesh *)mesh submeshIndex:(int)submeshIndex subdivisionLevels:(unsigned int)subdivisionLevels allocator:(id)allocator
{
  MDLMesh *v7;

  sub_1DCB4A1E0(mesh, submeshIndex, *(uint64_t *)&subdivisionLevels, allocator);
  v7 = (MDLMesh *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (MDLMesh)newSubdividedMesh:(MDLMesh *)mesh submeshIndex:(NSUInteger)submeshIndex subdivisionLevels:(NSUInteger)subdivisionLevels
{
  MDLMesh *v7;
  MDLMesh *v8;
  const char *v9;
  MDLMesh *inited;

  v7 = mesh;
  v8 = [MDLMesh alloc];
  inited = (MDLMesh *)objc_msgSend_initMeshBySubdividingMesh_submeshIndex_subdivisionLevels_allocator_(v8, v9, (uint64_t)v7, submeshIndex, subdivisionLevels, 0);

  return inited;
}

- (MDLMesh)initCapsuleWithExtent:(vector_float3)extent cylinderSegments:(vector_uint2)segments hemisphereSegments:(int)hemisphereSegments inwardNormals:(BOOL)inwardNormals geometryType:(MDLGeometryType)geometryType allocator:(id)allocator
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  const char *v14;
  id v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  const char *v20;
  MDLMesh *inited;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  int v28;
  unint64_t v29;
  float v30;
  float v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  unint64_t v35;
  uint64_t v36;
  float32x4_t v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  unsigned int v43;
  float v44;
  __float2 v45;
  __float2 v46;
  unsigned int v47;
  float v48;
  float32x4_t v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float32x4_t v55;
  float v56;
  float v57;
  float v58;
  float v59;
  char *v60;
  float *v61;
  float *v62;
  float *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  char *v67;
  float *v68;
  int v69;
  float *v70;
  float *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  char *v75;
  float *v76;
  int v77;
  float v78;
  float *v79;
  float *v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  char *v84;
  float *v85;
  int v86;
  float32x4_t v87;
  int32x4_t v88;
  float32x2_t v89;
  float32x2_t v90;
  float32x4_t v91;
  char *v92;
  float *v93;
  float *v94;
  float *v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  int v101;
  __int32 v102;
  float *v103;
  float *v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  char *v108;
  __int32 *v109;
  __int32 v110;
  float *v111;
  float *v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  int v118;
  float v119;
  float *v120;
  float *v121;
  float *v122;
  float *v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  char *v127;
  float *v128;
  int v129;
  float v130;
  float *v131;
  float *v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  char *v136;
  float *v137;
  int v138;
  char *v139;
  float *v140;
  float *v141;
  double v142;
  float *v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  char *v147;
  float *v148;
  int v149;
  float *v150;
  float *v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  char *v155;
  float *v156;
  int v157;
  float *v158;
  float *v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  char *v163;
  char *v164;
  char *v165;
  int v166;
  float *v167;
  float *v168;
  float *v169;
  float *v170;
  uint64_t v171;
  unint64_t v172;
  uint64_t v173;
  char *v174;
  float *v175;
  int v176;
  float *v177;
  float *v178;
  uint64_t v179;
  unint64_t v180;
  uint64_t v181;
  char *v182;
  float *v183;
  char *v184;
  int v185;
  char *v186;
  float *v187;
  float *v188;
  float *v189;
  uint64_t v190;
  unint64_t v191;
  uint64_t v192;
  char *v193;
  float *v194;
  int v195;
  float v196;
  float *v197;
  float *v198;
  uint64_t v199;
  unint64_t v200;
  uint64_t v201;
  char *v202;
  float *v203;
  int v204;
  float *v205;
  float *v206;
  uint64_t v207;
  unint64_t v208;
  uint64_t v209;
  char *v210;
  char *v211;
  char *v212;
  int v213;
  char *v214;
  float *v215;
  float *v216;
  float *v217;
  uint64_t v218;
  unint64_t v219;
  uint64_t v220;
  char *v221;
  float *v222;
  int v223;
  float v224;
  float *v225;
  float *v226;
  uint64_t v227;
  unint64_t v228;
  uint64_t v229;
  char *v230;
  float *v231;
  int v232;
  float *v233;
  float *v234;
  uint64_t v235;
  unint64_t v236;
  uint64_t v237;
  char *v238;
  char *v239;
  char *v240;
  int v241;
  float *v242;
  float *v243;
  float *v244;
  float *v245;
  uint64_t v246;
  unint64_t v247;
  uint64_t v248;
  char *v249;
  float *v250;
  int v251;
  float *v252;
  float *v253;
  uint64_t v254;
  unint64_t v255;
  uint64_t v256;
  char *v257;
  float *v258;
  char *v259;
  int v260;
  char *v261;
  float *v262;
  float *v263;
  float *v264;
  uint64_t v265;
  unint64_t v266;
  uint64_t v267;
  char *v268;
  float *v269;
  int v270;
  float v271;
  float *v272;
  float *v273;
  uint64_t v274;
  unint64_t v275;
  uint64_t v276;
  char *v277;
  float *v278;
  int v279;
  float *v280;
  float *v281;
  uint64_t v282;
  unint64_t v283;
  uint64_t v284;
  char *v285;
  char *v286;
  char *v287;
  int v288;
  float *v289;
  unint64_t v290;
  int v291;
  unsigned int v292;
  BOOL v293;
  void *v294;
  void *v295;
  const char *v296;
  void *v297;
  id v298;
  const char *v299;
  void *v300;
  const char *v301;
  void *v302;
  const char *v303;
  uint64_t v304;
  void *v305;
  const char *v306;
  void *v307;
  id v308;
  const char *v309;
  void *v310;
  const char *v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  void *v315;
  const char *v316;
  void *v317;
  id v318;
  const char *v319;
  void *v320;
  const char *v321;
  unint64_t v322;
  uint64_t v323;
  uint64_t v324;
  unsigned int v325;
  unsigned int *v326;
  unsigned int v327;
  unsigned int v328;
  char *v329;
  unsigned int *v330;
  unsigned int *v331;
  unsigned int *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  char *v336;
  unsigned int *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  char *v341;
  char *v342;
  __int16 v343;
  unsigned int *v344;
  unsigned int *v345;
  uint64_t v346;
  uint64_t v347;
  unint64_t v348;
  unint64_t v349;
  char *v350;
  char *v351;
  __int16 v352;
  unsigned int *v353;
  unsigned int *v354;
  uint64_t v355;
  uint64_t v356;
  unint64_t v357;
  unint64_t v358;
  char *v359;
  char *v360;
  __int16 v361;
  unsigned int *v362;
  uint64_t v363;
  uint64_t v364;
  unint64_t v365;
  unint64_t v366;
  char *v367;
  char *v368;
  __int16 v369;
  unsigned int *v370;
  uint64_t v371;
  uint64_t v372;
  unint64_t v373;
  unint64_t v374;
  char *v375;
  char *v376;
  __int16 v377;
  char *v378;
  __int16 v379;
  uint64_t v380;
  uint64_t v381;
  unint64_t v382;
  unint64_t v383;
  __int16 v384;
  int v385;
  unsigned int v386;
  int v387;
  int v388;
  __int16 v389;
  __int16 v390;
  int v391;
  int v392;
  char *v393;
  unsigned int *v394;
  unsigned int *v395;
  unsigned int *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  char *v400;
  unsigned int *v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  char *v405;
  char *v406;
  __int16 v407;
  unsigned int *v408;
  unsigned int *v409;
  uint64_t v410;
  uint64_t v411;
  unint64_t v412;
  unint64_t v413;
  char *v414;
  char *v415;
  __int16 v416;
  unsigned int *v417;
  unsigned int *v418;
  uint64_t v419;
  uint64_t v420;
  unint64_t v421;
  unint64_t v422;
  char *v423;
  char *v424;
  __int16 v425;
  unsigned int *v426;
  unsigned int *v427;
  uint64_t v428;
  uint64_t v429;
  unint64_t v430;
  unint64_t v431;
  char *v432;
  char *v433;
  __int16 v434;
  unsigned int *v435;
  unsigned int *v436;
  uint64_t v437;
  uint64_t v438;
  unint64_t v439;
  unint64_t v440;
  char *v441;
  char *v442;
  __int16 v443;
  unsigned int *v444;
  unsigned int *v445;
  uint64_t v446;
  uint64_t v447;
  unint64_t v448;
  unint64_t v449;
  char *v450;
  char *v451;
  __int16 v452;
  unsigned int *v453;
  unsigned int *v454;
  uint64_t v455;
  uint64_t v456;
  unint64_t v457;
  unint64_t v458;
  char *v459;
  char *v460;
  __int16 v461;
  unsigned int *v462;
  unsigned int *v463;
  uint64_t v464;
  uint64_t v465;
  unint64_t v466;
  unint64_t v467;
  char *v468;
  char *v469;
  __int16 v470;
  unsigned int *v471;
  unsigned int *v472;
  uint64_t v473;
  uint64_t v474;
  unint64_t v475;
  unint64_t v476;
  char *v477;
  char *v478;
  __int16 v479;
  unsigned int *v480;
  unsigned int *v481;
  uint64_t v482;
  uint64_t v483;
  unint64_t v484;
  unint64_t v485;
  char *v486;
  char *v487;
  __int16 v488;
  unsigned int *v489;
  unsigned int *v490;
  uint64_t v491;
  uint64_t v492;
  unint64_t v493;
  unint64_t v494;
  char *v495;
  char *v496;
  __int16 v497;
  char *v498;
  __int16 v499;
  unsigned int *v500;
  unsigned int *v501;
  uint64_t v502;
  uint64_t v503;
  unint64_t v504;
  unint64_t v505;
  char *v506;
  char *v507;
  __int16 v508;
  uint64_t v509;
  uint64_t v510;
  unint64_t v511;
  unint64_t v512;
  __int16 v513;
  unsigned int v514;
  __int16 v515;
  unsigned int v516;
  unsigned int v517;
  char *v518;
  unsigned int *v519;
  unsigned int *v520;
  unsigned int *v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  char *v525;
  unsigned int *v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  char *v530;
  char *v531;
  __int16 v532;
  __int16 v533;
  unsigned int *v534;
  unsigned int *v535;
  uint64_t v536;
  uint64_t v537;
  unint64_t v538;
  unint64_t v539;
  char *v540;
  char *v541;
  __int16 v542;
  __int16 v543;
  unsigned int *v544;
  unsigned int *v545;
  uint64_t v546;
  uint64_t v547;
  unint64_t v548;
  unint64_t v549;
  char *v550;
  char *v551;
  __int16 v552;
  __int16 v553;
  unsigned int *v554;
  uint64_t v555;
  uint64_t v556;
  unint64_t v557;
  unint64_t v558;
  char *v559;
  char *v560;
  __int16 v561;
  unsigned int *v562;
  unsigned int *v563;
  uint64_t v564;
  uint64_t v565;
  unint64_t v566;
  unint64_t v567;
  char *v568;
  char *v569;
  __int16 v570;
  char *v571;
  __int16 v572;
  __int16 v573;
  uint64_t v574;
  uint64_t v575;
  unint64_t v576;
  unint64_t v577;
  __int16 v578;
  id v579;
  MDLMeshBufferDataAllocator *v580;
  id v581;
  const char *v582;
  void *v583;
  const char *v584;
  void *v585;
  const char *v586;
  id v587;
  const char *v588;
  void *v589;
  const char *v590;
  MDLMaterial *v591;
  void *v592;
  const char *v593;
  void *v594;
  const char *v595;
  void *v596;
  double v597;
  const char *v598;
  uint64_t v599;
  const char *v600;
  void *v601;
  double v602;
  const char *v603;
  uint64_t v604;
  const char *v605;
  void *v606;
  MDLSubmesh *v607;
  const char *v608;
  void *v609;
  unint64_t v610;
  uint64_t v611;
  unsigned int v612;
  unsigned int *v613;
  unsigned int v614;
  unsigned int v615;
  char *v616;
  unsigned int *v617;
  unsigned int *v618;
  unsigned int *v619;
  uint64_t v620;
  unint64_t v621;
  uint64_t v622;
  char *v623;
  unsigned int *v624;
  uint64_t v625;
  unint64_t v626;
  uint64_t v627;
  char *v628;
  char *v629;
  int v630;
  unsigned int *v631;
  unsigned int *v632;
  uint64_t v633;
  unint64_t v634;
  uint64_t v635;
  char *v636;
  char *v637;
  int v638;
  unsigned int *v639;
  unsigned int *v640;
  uint64_t v641;
  unint64_t v642;
  uint64_t v643;
  char *v644;
  unsigned int *v645;
  unsigned int v646;
  unsigned int *v647;
  uint64_t v648;
  unint64_t v649;
  uint64_t v650;
  char *v651;
  char *v652;
  int v653;
  unsigned int *v654;
  uint64_t v655;
  unint64_t v656;
  uint64_t v657;
  char *v658;
  unsigned int *v659;
  unsigned int v660;
  unsigned int *v661;
  unsigned int v662;
  uint64_t v663;
  unint64_t v664;
  uint64_t v665;
  unsigned int v666;
  int v667;
  unsigned int v668;
  int v669;
  int v670;
  unsigned int v671;
  unsigned int v672;
  int v673;
  int v674;
  char *v675;
  char *v676;
  int *v677;
  unsigned int *v678;
  uint64_t v679;
  unint64_t v680;
  uint64_t v681;
  char *v682;
  unsigned int *v683;
  uint64_t v684;
  unint64_t v685;
  uint64_t v686;
  char *v687;
  char *v688;
  int v689;
  int *v690;
  unsigned int *v691;
  uint64_t v692;
  unint64_t v693;
  uint64_t v694;
  char *v695;
  char *v696;
  int v697;
  int *v698;
  int *v699;
  uint64_t v700;
  unint64_t v701;
  uint64_t v702;
  char *v703;
  char *v704;
  int v705;
  int *v706;
  int *v707;
  uint64_t v708;
  unint64_t v709;
  uint64_t v710;
  char *v711;
  int *v712;
  int v713;
  int *v714;
  int *v715;
  uint64_t v716;
  unint64_t v717;
  uint64_t v718;
  char *v719;
  int *v720;
  int v721;
  char *v722;
  int *v723;
  uint64_t v724;
  unint64_t v725;
  uint64_t v726;
  char *v727;
  int *v728;
  int v729;
  int *v730;
  int *v731;
  uint64_t v732;
  unint64_t v733;
  uint64_t v734;
  char *v735;
  int *v736;
  int v737;
  int *v738;
  unsigned int *v739;
  uint64_t v740;
  unint64_t v741;
  uint64_t v742;
  char *v743;
  int *v744;
  int v745;
  unsigned int *v746;
  int *v747;
  uint64_t v748;
  unint64_t v749;
  uint64_t v750;
  char *v751;
  char *v752;
  int v753;
  unsigned int *v754;
  int *v755;
  uint64_t v756;
  unint64_t v757;
  uint64_t v758;
  char *v759;
  int *v760;
  int v761;
  unsigned int *v762;
  unsigned int *v763;
  uint64_t v764;
  unint64_t v765;
  uint64_t v766;
  char *v767;
  char *v768;
  int v769;
  char *v770;
  int v771;
  unsigned int *v772;
  unsigned int *v773;
  uint64_t v774;
  unint64_t v775;
  uint64_t v776;
  char *v777;
  char *v778;
  int v779;
  uint64_t v780;
  unint64_t v781;
  uint64_t v782;
  int v783;
  unsigned int v784;
  unsigned int v785;
  unsigned int v786;
  unsigned int v787;
  char *v788;
  unsigned int *v789;
  unsigned int *v790;
  unsigned int *v791;
  uint64_t v792;
  unint64_t v793;
  uint64_t v794;
  char *v795;
  unsigned int *v796;
  uint64_t v797;
  unint64_t v798;
  uint64_t v799;
  char *v800;
  char *v801;
  int v802;
  unsigned int v803;
  unsigned int *v804;
  unsigned int *v805;
  uint64_t v806;
  unint64_t v807;
  uint64_t v808;
  char *v809;
  char *v810;
  int v811;
  unsigned int v812;
  unsigned int *v813;
  unsigned int *v814;
  uint64_t v815;
  unint64_t v816;
  uint64_t v817;
  char *v818;
  char *v819;
  int v820;
  unsigned int v821;
  unsigned int *v822;
  uint64_t v823;
  unint64_t v824;
  uint64_t v825;
  char *v826;
  char *v827;
  int v828;
  unsigned int *v829;
  unsigned int *v830;
  uint64_t v831;
  unint64_t v832;
  uint64_t v833;
  char *v834;
  char *v835;
  int v836;
  char *v837;
  int v838;
  unsigned int v839;
  uint64_t v840;
  unint64_t v841;
  uint64_t v842;
  int v843;
  id v844;
  const char *v845;
  const char *v846;
  const char *v847;
  id v848;
  const char *v849;
  void *v850;
  const char *v851;
  MDLMaterial *v852;
  void *v853;
  const char *v854;
  const char *v855;
  void *v856;
  double v857;
  const char *v858;
  uint64_t v859;
  const char *v860;
  void *v861;
  double v862;
  const char *v863;
  uint64_t v864;
  const char *v865;
  void *v866;
  MDLSubmesh *v867;
  const char *v868;
  const char *v869;
  id v870;
  const char *v871;
  const char *v872;
  uint64_t v873;
  void *v874;
  const char *v875;
  MDLVertexDescriptor *v876;
  const char *v877;
  uint64_t v878;
  void *v879;
  const char *v880;
  void *v881;
  const char *v882;
  const char *v883;
  uint64_t v884;
  void *v885;
  const char *v886;
  void *v887;
  const char *v888;
  const char *v889;
  uint64_t v890;
  void *v891;
  const char *v892;
  void *v893;
  const char *v894;
  const char *v895;
  uint64_t v896;
  void *v897;
  const char *v898;
  void *v899;
  const char *v900;
  const char *v901;
  uint64_t v902;
  void *v903;
  const char *v904;
  void *v905;
  const char *v906;
  const char *v907;
  uint64_t v908;
  void *v909;
  const char *v910;
  void *v911;
  const char *v912;
  const char *v913;
  uint64_t v914;
  void *v915;
  const char *v916;
  void *v917;
  const char *v918;
  const char *v919;
  uint64_t v920;
  void *v921;
  const char *v922;
  void *v923;
  const char *v924;
  const char *v925;
  uint64_t v926;
  void *v927;
  const char *v928;
  void *v929;
  const char *v930;
  const char *v931;
  uint64_t v932;
  const char *v933;
  uint64_t v934;
  MDLAsset *v935;
  const char *v936;
  uint64_t v937;
  void *v938;
  const char *v939;
  void *v940;
  const char *v941;
  const char *v942;
  const char *v943;
  void *context;
  unsigned int v946;
  unint64_t v947;
  unint64_t v948;
  void *v949;
  float v950;
  float v951;
  float v952;
  float v953;
  float v954;
  float v955;
  float v956;
  float v957;
  MDLMesh *v958;
  float v959;
  float v960;
  float v961;
  float v962;
  float32x4_t v963;
  float v964;
  int v965;
  int v966;
  uint64_t v967;
  unsigned int v968;
  float v969;
  unsigned int v970;
  unsigned int v971;
  uint64_t v972;
  float v973;
  unsigned int v974;
  float32x4_t v975;
  float32x4_t v976;
  float32x4_t v977;
  unsigned int *v978;
  unsigned int *v979;
  char *v980;
  float *v981;
  float *v982;
  float *v983;
  float *v984;
  float *v985;
  float *v986;
  float *v987;
  float *v988;
  _QWORD v989[2];

  v9 = *(_QWORD *)&hemisphereSegments;
  v10 = extent.i64[1];
  v11 = extent.i64[0];
  v972 = v8;
  v975 = *(float32x4_t *)segments.i8;
  v15 = (id)inwardNormals;
  v967 = v9;
  if ((unint64_t)(v9 - 1) >= 2)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v16, v20, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Unsupported geometry type for capsule"), v18, v19);

  }
  inited = (MDLMesh *)(id)objc_msgSend_initWithBufferAllocator_(self, v14, (uint64_t)v15);

  if (!inited)
    goto LABEL_1391;
  v958 = inited;
  objc_msgSend_allocator(inited, v22, v23);
  v24 = objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend_setName_(v958, v25, (uint64_t)CFSTR("capsule"));
  v949 = (void *)v24;
  if (v972 <= 3)
    v28 = 3;
  else
    v28 = v972;
  v971 = v28;
  if (v11 <= 1)
    v29 = 1;
  else
    v29 = v11;
  v30 = v975.f32[2];
  if (v975.f32[2] >= v975.f32[0])
    v31 = v975.f32[0];
  else
    v31 = v975.f32[2];
  if (v975.f32[0] >= v975.f32[2])
    v30 = v975.f32[0];
  v962 = v30;
  if (!HIDWORD(v972) || v975.f32[1] <= v31)
  {
    LODWORD(v142) = v975.i32[0];
    *((float *)&v142 + 1) = v975.f32[1] * 0.5;
    v15 = (id)v24;
    inited = (MDLMesh *)objc_msgSend_initSphereWithExtent_segments_inwardNormals_geometryType_allocator_(v958, v27, v10, v967, v24, v142, COERCE_DOUBLE(__PAIR64__(v29, v28)));
    goto LABEL_1391;
  }
  v32 = MEMORY[0x1DF0D25C8](v26);
  v33 = v971 + 1;
  v34 = v33 * (HIDWORD(v972) - 1);
  v968 = v971 + 1;
  v948 = v34 + 2 + 2 * v29 * v33;
  v987 = 0;
  v988 = 0;
  v989[0] = 0;
  sub_1DCB0BBF4((void **)&v987, 3 * v948);
  v984 = 0;
  v985 = 0;
  v986 = 0;
  sub_1DCB0BBF4((void **)&v984, 3 * v948);
  v946 = v34;
  context = (void *)v32;
  v981 = 0;
  v982 = 0;
  v983 = 0;
  sub_1DCB0BBF4((void **)&v981, 2 * v948);
  v947 = v29;
  v38 = (float)v29;
  v953 = v31 / v975.f32[1];
  v954 = (float)HIDWORD(v972);
  v39 = v975.f32[1] + v31 * -2.0;
  v952 = (float)HIDWORD(v972) + (float)((float)v29 * 2.0);
  v955 = (float)(v31 / v975.f32[1]) * v975.f32[1];
  v956 = -v955;
  v957 = v39;
  if (v952 > 1.0)
  {
    v40 = 6.28318531 / (double)v971;
    v964 = v40;
    v41 = 3.14159265 / (double)(2 * v29);
    v42 = v38 + v954;
    v951 = v41;
    v37.i64[0] = COERCE_UNSIGNED_INT(-1.0) | 0x400921FB00000000;
    if (!(_DWORD)v10)
      v37.f32[0] = 1.0;
    v963 = v37;
    v950 = 1.0 / v954;
    v43 = 1;
    v44 = 1.0;
    v961 = v31;
    do
    {
      v45 = __sincosf_stret((float)(v44 - v954) * v951);
      v960 = v45.__sinval * v31;
      v46 = __sincosf_stret(v44 * v951);
      v47 = 0;
      v959 = v46.__sinval * v31;
      do
      {
        v48 = (float)((float)v47 * v964) + 1.57079633;
        v49.f32[0] = cosf(v48);
        v50 = v49.f32[0];
        if (v44 >= v38)
        {
          v54 = sinf(v48);
          v55.f32[0] = v960 * v50;
          v56 = (float)(v45.__sinval * v962) * v54;
          v57 = v50 * v961;
          v58 = v54 * v962;
          if (v42 >= v44)
            v52 = v953 + (float)((float)((float)(v44 - v38) * (float)((float)(v953 * -2.0) + 1.0)) * v950);
          else
            v52 = 1.0 - (float)(v953 + (float)(v45.__cosval * v953));
          if (v42 >= v44)
            v53 = (float)((float)(v44 - v38) * v957) * v950;
          else
            v53 = v957 - (float)(v45.__cosval * v955);
          if (v42 >= v44)
            v55.f32[0] = v57;
          v976 = v55;
          v59 = 0.0;
          if (v42 < v44)
            v59 = -(float)(v45.__cosval * v955);
          v969 = v59;
          if (v42 < v44)
            v58 = v56;
          v973 = v58;
        }
        else
        {
          v49.f32[0] = v959 * v49.f32[0];
          v976 = v49;
          v51 = sinf(v48);
          v52 = v953 - (float)(v46.__cosval * v953);
          v973 = (float)(v46.__sinval * v962) * v51;
          v53 = v46.__cosval * v956;
          v969 = v46.__cosval * v956;
        }
        v61 = v988;
        v60 = (char *)v989[0];
        if ((unint64_t)v988 >= v989[0])
        {
          v63 = v987;
          v64 = v988 - v987;
          v65 = v64 + 1;
          if ((unint64_t)(v64 + 1) >> 62)
            goto LABEL_1394;
          v66 = v989[0] - (_QWORD)v987;
          if ((uint64_t)(v989[0] - (_QWORD)v987) >> 1 > v65)
            v65 = v66 >> 1;
          if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFFCLL)
            v35 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v35 = v65;
          if (v35)
          {
            v67 = (char *)sub_1DCAE4D04((uint64_t)v989, v35);
            v63 = v987;
            v61 = v988;
          }
          else
          {
            v67 = 0;
          }
          v68 = (float *)&v67[4 * v64];
          *v68 = v976.f32[0];
          v62 = v68 + 1;
          while (v61 != v63)
          {
            v69 = *((_DWORD *)v61-- - 1);
            *((_DWORD *)v68-- - 1) = v69;
          }
          v60 = &v67[4 * v35];
          v987 = v68;
          v988 = v62;
          v989[0] = v60;
          if (v63)
          {
            operator delete(v63);
            v60 = (char *)v989[0];
          }
        }
        else
        {
          *v988 = v976.f32[0];
          v62 = v61 + 1;
        }
        v988 = v62;
        if (v62 >= (float *)v60)
        {
          v71 = v987;
          v72 = v62 - v987;
          v73 = v72 + 1;
          if ((unint64_t)(v72 + 1) >> 62)
            goto LABEL_1394;
          v74 = v60 - (char *)v987;
          if (v74 >> 1 > v73)
            v73 = v74 >> 1;
          if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFFCLL)
            v35 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v35 = v73;
          if (v35)
          {
            v75 = (char *)sub_1DCAE4D04((uint64_t)v989, v35);
            v71 = v987;
            v62 = v988;
          }
          else
          {
            v75 = 0;
          }
          v76 = (float *)&v75[4 * v72];
          *v76 = v53;
          v70 = v76 + 1;
          while (v62 != v71)
          {
            v77 = *((_DWORD *)v62-- - 1);
            *((_DWORD *)v76-- - 1) = v77;
          }
          v60 = &v75[4 * v35];
          v987 = v76;
          v988 = v70;
          v989[0] = v60;
          if (v71)
          {
            operator delete(v71);
            v60 = (char *)v989[0];
          }
        }
        else
        {
          *v62 = v53;
          v70 = v62 + 1;
        }
        v988 = v70;
        if (v70 >= (float *)v60)
        {
          v80 = v987;
          v81 = v70 - v987;
          v82 = v81 + 1;
          if ((unint64_t)(v81 + 1) >> 62)
            goto LABEL_1394;
          v83 = v60 - (char *)v987;
          if (v83 >> 1 > v82)
            v82 = v83 >> 1;
          if ((unint64_t)v83 >= 0x7FFFFFFFFFFFFFFCLL)
            v35 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v35 = v82;
          if (v35)
          {
            v84 = (char *)sub_1DCAE4D04((uint64_t)v989, v35);
            v80 = v987;
            v70 = v988;
          }
          else
          {
            v84 = 0;
          }
          v85 = (float *)&v84[4 * v81];
          *v85 = v973;
          v79 = v85 + 1;
          while (v70 != v80)
          {
            v86 = *((_DWORD *)v70-- - 1);
            *((_DWORD *)v85-- - 1) = v86;
          }
          v987 = v85;
          v988 = v79;
          v989[0] = &v84[4 * v35];
          if (v80)
            operator delete(v80);
          v78 = v973;
        }
        else
        {
          v78 = v973;
          *v70 = v973;
          v79 = v70 + 1;
        }
        v87 = v976;
        v87.f32[1] = v969;
        v988 = v79;
        v87.f32[2] = v78;
        v88 = (int32x4_t)vmulq_f32(v87, v87);
        v88.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v88.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v88.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v88, 2)).u32[0];
        v89 = vrsqrte_f32((float32x2_t)v88.u32[0]);
        v90 = vmul_f32(vrsqrts_f32((float32x2_t)v88.u32[0], vmul_f32(v89, v89)), v89);
        *(float32x2_t *)v88.i8 = vmul_f32(v90, vrsqrts_f32((float32x2_t)v88.u32[0], vmul_f32(v90, v90)));
        v91 = vmulq_n_f32(v87, vmulq_f32((float32x4_t)v88, v963).f32[0]);
        v93 = v985;
        v92 = (char *)v986;
        v977 = v91;
        if (v985 >= v986)
        {
          v95 = v984;
          v96 = v985 - v984;
          v97 = v96 + 1;
          if ((unint64_t)(v96 + 1) >> 62)
            goto LABEL_1394;
          v98 = (char *)v986 - (char *)v984;
          if (((char *)v986 - (char *)v984) >> 1 > v97)
            v97 = v98 >> 1;
          if ((unint64_t)v98 >= 0x7FFFFFFFFFFFFFFCLL)
            v35 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v35 = v97;
          if (v35)
          {
            v99 = (char *)sub_1DCAE4D04((uint64_t)&v986, v35);
            v95 = v984;
            v93 = v985;
          }
          else
          {
            v99 = 0;
          }
          v100 = &v99[4 * v96];
          *(_DWORD *)v100 = v977.i32[0];
          v94 = (float *)(v100 + 4);
          while (v93 != v95)
          {
            v101 = *((_DWORD *)v93-- - 1);
            *((_DWORD *)v100 - 1) = v101;
            v100 -= 4;
          }
          v92 = &v99[4 * v35];
          v984 = (float *)v100;
          v985 = v94;
          v986 = (float *)v92;
          if (v95)
          {
            operator delete(v95);
            v92 = (char *)v986;
          }
          v91.i32[1] = v977.i32[1];
        }
        else
        {
          *v985 = v91.f32[0];
          v94 = v93 + 1;
        }
        v985 = v94;
        v102 = v91.i32[1];
        if (v94 >= (float *)v92)
        {
          v104 = v984;
          v105 = v94 - v984;
          v106 = v105 + 1;
          if ((unint64_t)(v105 + 1) >> 62)
            goto LABEL_1394;
          v107 = v92 - (char *)v984;
          if (v107 >> 1 > v106)
            v106 = v107 >> 1;
          if ((unint64_t)v107 >= 0x7FFFFFFFFFFFFFFCLL)
            v35 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v35 = v106;
          if (v35)
          {
            v108 = (char *)sub_1DCAE4D04((uint64_t)&v986, v35);
            v104 = v984;
            v94 = v985;
          }
          else
          {
            v108 = 0;
          }
          v109 = (__int32 *)&v108[4 * v105];
          *v109 = v102;
          v103 = (float *)(v109 + 1);
          while (v94 != v104)
          {
            v110 = *((_DWORD *)v94-- - 1);
            *--v109 = v110;
          }
          v92 = &v108[4 * v35];
          v984 = (float *)v109;
          v985 = v103;
          v986 = (float *)v92;
          if (v104)
          {
            operator delete(v104);
            v92 = (char *)v986;
          }
        }
        else
        {
          *v94 = v91.f32[1];
          v103 = v94 + 1;
        }
        v985 = v103;
        if (v103 >= (float *)v92)
        {
          v112 = v984;
          v113 = v103 - v984;
          v114 = v113 + 1;
          if ((unint64_t)(v113 + 1) >> 62)
            goto LABEL_1394;
          v115 = v92 - (char *)v984;
          if (v115 >> 1 > v114)
            v114 = v115 >> 1;
          if ((unint64_t)v115 >= 0x7FFFFFFFFFFFFFFCLL)
            v35 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v35 = v114;
          if (v35)
          {
            v116 = (char *)sub_1DCAE4D04((uint64_t)&v986, v35);
            v112 = v984;
            v103 = v985;
          }
          else
          {
            v116 = 0;
          }
          v117 = &v116[4 * v113];
          *(_DWORD *)v117 = v977.i32[2];
          v111 = (float *)(v117 + 4);
          while (v103 != v112)
          {
            v118 = *((_DWORD *)v103-- - 1);
            *((_DWORD *)v117 - 1) = v118;
            v117 -= 4;
          }
          v984 = (float *)v117;
          v985 = v111;
          v986 = (float *)&v116[4 * v35];
          if (v112)
            operator delete(v112);
        }
        else
        {
          *v103 = v977.f32[2];
          v111 = v103 + 1;
        }
        v119 = (float)v47 * (float)(1.0 / (float)v971);
        v985 = v111;
        v121 = v982;
        v120 = v983;
        if (v982 >= v983)
        {
          v123 = v981;
          v124 = v982 - v981;
          v125 = v124 + 1;
          if ((unint64_t)(v124 + 1) >> 62)
            goto LABEL_1394;
          v126 = (char *)v983 - (char *)v981;
          if (((char *)v983 - (char *)v981) >> 1 > v125)
            v125 = v126 >> 1;
          if ((unint64_t)v126 >= 0x7FFFFFFFFFFFFFFCLL)
            v35 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v35 = v125;
          if (v35)
          {
            v127 = (char *)sub_1DCAE4D04((uint64_t)&v983, v35);
            v123 = v981;
            v121 = v982;
          }
          else
          {
            v127 = 0;
          }
          v128 = (float *)&v127[4 * v124];
          *v128 = v119;
          v122 = v128 + 1;
          while (v121 != v123)
          {
            v129 = *((_DWORD *)v121-- - 1);
            *((_DWORD *)v128-- - 1) = v129;
          }
          v120 = (float *)&v127[4 * v35];
          v981 = v128;
          v982 = v122;
          v983 = v120;
          if (v123)
          {
            operator delete(v123);
            v120 = v983;
          }
        }
        else
        {
          *v982 = v119;
          v122 = v121 + 1;
        }
        v130 = 1.0 - v52;
        v982 = v122;
        if (v122 >= v120)
        {
          v132 = v981;
          v133 = v122 - v981;
          v134 = v133 + 1;
          if ((unint64_t)(v133 + 1) >> 62)
            goto LABEL_1394;
          v135 = (char *)v120 - (char *)v981;
          if (v135 >> 1 > v134)
            v134 = v135 >> 1;
          if ((unint64_t)v135 >= 0x7FFFFFFFFFFFFFFCLL)
            v35 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v35 = v134;
          if (v35)
          {
            v136 = (char *)sub_1DCAE4D04((uint64_t)&v983, v35);
            v132 = v981;
            v122 = v982;
          }
          else
          {
            v136 = 0;
          }
          v137 = (float *)&v136[4 * v133];
          *v137 = v130;
          v131 = v137 + 1;
          while (v122 != v132)
          {
            v138 = *((_DWORD *)v122-- - 1);
            *((_DWORD *)v137-- - 1) = v138;
          }
          v981 = v137;
          v982 = v131;
          v983 = (float *)&v136[4 * v35];
          if (v132)
            operator delete(v132);
        }
        else
        {
          *v122 = v130;
          v131 = v122 + 1;
        }
        v982 = v131;
        ++v47;
      }
      while (v47 <= v971);
      v44 = (float)++v43;
      v31 = v961;
    }
    while (v952 > (float)v43);
  }
  v140 = v988;
  v139 = (char *)v989[0];
  if ((unint64_t)v988 >= v989[0])
  {
    v143 = v987;
    v144 = v988 - v987;
    v145 = v144 + 1;
    if ((unint64_t)(v144 + 1) >> 62)
      goto LABEL_1394;
    v146 = v989[0] - (_QWORD)v987;
    if ((uint64_t)(v989[0] - (_QWORD)v987) >> 1 > v145)
      v145 = v146 >> 1;
    if ((unint64_t)v146 >= 0x7FFFFFFFFFFFFFFCLL)
      v35 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v35 = v145;
    if (v35)
    {
      v147 = (char *)sub_1DCAE4D04((uint64_t)v989, v35);
      v143 = v987;
      v140 = v988;
    }
    else
    {
      v147 = 0;
    }
    v148 = (float *)&v147[4 * v144];
    v139 = &v147[4 * v35];
    *v148 = 0.0;
    v141 = v148 + 1;
    while (v140 != v143)
    {
      v149 = *((_DWORD *)v140-- - 1);
      *((_DWORD *)v148-- - 1) = v149;
    }
    v987 = v148;
    v988 = v141;
    v989[0] = v139;
    if (v143)
    {
      operator delete(v143);
      v139 = (char *)v989[0];
    }
  }
  else
  {
    *v988 = 0.0;
    v141 = v140 + 1;
  }
  v988 = v141;
  if (v141 >= (float *)v139)
  {
    v151 = v987;
    v152 = v141 - v987;
    v153 = v152 + 1;
    if ((unint64_t)(v152 + 1) >> 62)
      goto LABEL_1394;
    v154 = v139 - (char *)v987;
    if (v154 >> 1 > v153)
      v153 = v154 >> 1;
    if ((unint64_t)v154 >= 0x7FFFFFFFFFFFFFFCLL)
      v35 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v35 = v153;
    if (v35)
    {
      v155 = (char *)sub_1DCAE4D04((uint64_t)v989, v35);
      v151 = v987;
      v141 = v988;
    }
    else
    {
      v155 = 0;
    }
    v156 = (float *)&v155[4 * v152];
    v139 = &v155[4 * v35];
    *v156 = v956;
    v150 = v156 + 1;
    while (v141 != v151)
    {
      v157 = *((_DWORD *)v141-- - 1);
      *((_DWORD *)v156-- - 1) = v157;
    }
    v987 = v156;
    v988 = v150;
    v989[0] = v139;
    if (v151)
    {
      operator delete(v151);
      v139 = (char *)v989[0];
    }
  }
  else
  {
    *v141 = v956;
    v150 = v141 + 1;
  }
  v988 = v150;
  if (v150 >= (float *)v139)
  {
    v159 = v987;
    v160 = v150 - v987;
    v161 = v160 + 1;
    if ((unint64_t)(v160 + 1) >> 62)
      goto LABEL_1394;
    v162 = v139 - (char *)v987;
    if (v162 >> 1 > v161)
      v161 = v162 >> 1;
    if ((unint64_t)v162 >= 0x7FFFFFFFFFFFFFFCLL)
      v35 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v35 = v161;
    if (v35)
    {
      v163 = (char *)sub_1DCAE4D04((uint64_t)v989, v35);
      v159 = v987;
      v150 = v988;
    }
    else
    {
      v163 = 0;
    }
    v164 = &v163[4 * v160];
    v165 = &v163[4 * v35];
    *(_DWORD *)v164 = 0;
    v158 = (float *)(v164 + 4);
    while (v150 != v159)
    {
      v166 = *((_DWORD *)v150-- - 1);
      *((_DWORD *)v164 - 1) = v166;
      v164 -= 4;
    }
    v987 = (float *)v164;
    v988 = v158;
    v989[0] = v165;
    if (v159)
      operator delete(v159);
  }
  else
  {
    *v150 = 0.0;
    v158 = v150 + 1;
  }
  v988 = v158;
  v168 = v982;
  v167 = v983;
  if (v982 >= v983)
  {
    v170 = v981;
    v171 = v982 - v981;
    v172 = v171 + 1;
    if ((unint64_t)(v171 + 1) >> 62)
      goto LABEL_1394;
    v173 = (char *)v983 - (char *)v981;
    if (((char *)v983 - (char *)v981) >> 1 > v172)
      v172 = v173 >> 1;
    if ((unint64_t)v173 >= 0x7FFFFFFFFFFFFFFCLL)
      v35 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v35 = v172;
    if (v35)
    {
      v174 = (char *)sub_1DCAE4D04((uint64_t)&v983, v35);
      v170 = v981;
      v168 = v982;
    }
    else
    {
      v174 = 0;
    }
    v175 = (float *)&v174[4 * v171];
    v167 = (float *)&v174[4 * v35];
    *v175 = 0.5;
    v169 = v175 + 1;
    while (v168 != v170)
    {
      v176 = *((_DWORD *)v168-- - 1);
      *((_DWORD *)v175-- - 1) = v176;
    }
    v981 = v175;
    v982 = v169;
    v983 = v167;
    if (v170)
    {
      operator delete(v170);
      v167 = v983;
    }
  }
  else
  {
    *v982 = 0.5;
    v169 = v168 + 1;
  }
  v982 = v169;
  if (v169 >= v167)
  {
    v178 = v981;
    v179 = v169 - v981;
    v180 = v179 + 1;
    if ((unint64_t)(v179 + 1) >> 62)
      goto LABEL_1394;
    v181 = (char *)v167 - (char *)v981;
    if (v181 >> 1 > v180)
      v180 = v181 >> 1;
    if ((unint64_t)v181 >= 0x7FFFFFFFFFFFFFFCLL)
      v35 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v35 = v180;
    if (v35)
    {
      v182 = (char *)sub_1DCAE4D04((uint64_t)&v983, v35);
      v178 = v981;
      v169 = v982;
    }
    else
    {
      v182 = 0;
    }
    v183 = (float *)&v182[4 * v179];
    v184 = &v182[4 * v35];
    *v183 = 1.0;
    v177 = v183 + 1;
    while (v169 != v178)
    {
      v185 = *((_DWORD *)v169-- - 1);
      *((_DWORD *)v183-- - 1) = v185;
    }
    v981 = v183;
    v982 = v177;
    v983 = (float *)v184;
    if (v178)
      operator delete(v178);
  }
  else
  {
    *v169 = 1.0;
    v177 = v169 + 1;
  }
  v982 = v177;
  v187 = v985;
  v186 = (char *)v986;
  if (v985 >= v986)
  {
    v189 = v984;
    v190 = v985 - v984;
    v191 = v190 + 1;
    if ((unint64_t)(v190 + 1) >> 62)
      goto LABEL_1394;
    v192 = (char *)v986 - (char *)v984;
    if (((char *)v986 - (char *)v984) >> 1 > v191)
      v191 = v192 >> 1;
    if ((unint64_t)v192 >= 0x7FFFFFFFFFFFFFFCLL)
      v35 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v35 = v191;
    if (v35)
    {
      v193 = (char *)sub_1DCAE4D04((uint64_t)&v986, v35);
      v189 = v984;
      v187 = v985;
    }
    else
    {
      v193 = 0;
    }
    v194 = (float *)&v193[4 * v190];
    v186 = &v193[4 * v35];
    *v194 = 0.0;
    v188 = v194 + 1;
    while (v187 != v189)
    {
      v195 = *((_DWORD *)v187-- - 1);
      *((_DWORD *)v194-- - 1) = v195;
    }
    v984 = v194;
    v985 = v188;
    v986 = (float *)v186;
    if (v189)
    {
      operator delete(v189);
      v186 = (char *)v986;
    }
  }
  else
  {
    *v985 = 0.0;
    v188 = v187 + 1;
  }
  v985 = v188;
  if ((_DWORD)v10)
    v196 = 1.0;
  else
    v196 = -1.0;
  if (v188 >= (float *)v186)
  {
    v198 = v984;
    v199 = v188 - v984;
    v200 = v199 + 1;
    if ((unint64_t)(v199 + 1) >> 62)
      goto LABEL_1394;
    v201 = v186 - (char *)v984;
    if (v201 >> 1 > v200)
      v200 = v201 >> 1;
    if ((unint64_t)v201 >= 0x7FFFFFFFFFFFFFFCLL)
      v35 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v35 = v200;
    if (v35)
    {
      v202 = (char *)sub_1DCAE4D04((uint64_t)&v986, v35);
      v198 = v984;
      v188 = v985;
    }
    else
    {
      v202 = 0;
    }
    v203 = (float *)&v202[4 * v199];
    v186 = &v202[4 * v35];
    *v203 = v196;
    v197 = v203 + 1;
    while (v188 != v198)
    {
      v204 = *((_DWORD *)v188-- - 1);
      *((_DWORD *)v203-- - 1) = v204;
    }
    v984 = v203;
    v985 = v197;
    v986 = (float *)v186;
    if (v198)
    {
      operator delete(v198);
      v186 = (char *)v986;
    }
  }
  else
  {
    *v188 = v196;
    v197 = v188 + 1;
  }
  v985 = v197;
  if (v197 >= (float *)v186)
  {
    v206 = v984;
    v207 = v197 - v984;
    v208 = v207 + 1;
    if ((unint64_t)(v207 + 1) >> 62)
      goto LABEL_1394;
    v209 = v186 - (char *)v984;
    if (v209 >> 1 > v208)
      v208 = v209 >> 1;
    if ((unint64_t)v209 >= 0x7FFFFFFFFFFFFFFCLL)
      v35 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v35 = v208;
    if (v35)
    {
      v210 = (char *)sub_1DCAE4D04((uint64_t)&v986, v35);
      v206 = v984;
      v197 = v985;
    }
    else
    {
      v210 = 0;
    }
    v211 = &v210[4 * v207];
    v212 = &v210[4 * v35];
    *(_DWORD *)v211 = 0;
    v205 = (float *)(v211 + 4);
    while (v197 != v206)
    {
      v213 = *((_DWORD *)v197-- - 1);
      *((_DWORD *)v211 - 1) = v213;
      v211 -= 4;
    }
    v984 = (float *)v211;
    v985 = v205;
    v986 = (float *)v212;
    if (v206)
      operator delete(v206);
  }
  else
  {
    *v197 = 0.0;
    v205 = v197 + 1;
  }
  v985 = v205;
  v215 = v988;
  v214 = (char *)v989[0];
  if ((unint64_t)v988 >= v989[0])
  {
    v217 = v987;
    v218 = v988 - v987;
    v219 = v218 + 1;
    if ((unint64_t)(v218 + 1) >> 62)
      goto LABEL_1394;
    v220 = v989[0] - (_QWORD)v987;
    if ((uint64_t)(v989[0] - (_QWORD)v987) >> 1 > v219)
      v219 = v220 >> 1;
    if ((unint64_t)v220 >= 0x7FFFFFFFFFFFFFFCLL)
      v35 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v35 = v219;
    if (v35)
    {
      v221 = (char *)sub_1DCAE4D04((uint64_t)v989, v35);
      v217 = v987;
      v215 = v988;
    }
    else
    {
      v221 = 0;
    }
    v222 = (float *)&v221[4 * v218];
    v214 = &v221[4 * v35];
    *v222 = 0.0;
    v216 = v222 + 1;
    while (v215 != v217)
    {
      v223 = *((_DWORD *)v215-- - 1);
      *((_DWORD *)v222-- - 1) = v223;
    }
    v987 = v222;
    v988 = v216;
    v989[0] = v214;
    if (v217)
    {
      operator delete(v217);
      v214 = (char *)v989[0];
    }
  }
  else
  {
    *v988 = 0.0;
    v216 = v215 + 1;
  }
  v988 = v216;
  v224 = v955 + v957;
  if (v216 >= (float *)v214)
  {
    v226 = v987;
    v227 = v216 - v987;
    v228 = v227 + 1;
    if ((unint64_t)(v227 + 1) >> 62)
      goto LABEL_1394;
    v229 = v214 - (char *)v987;
    if (v229 >> 1 > v228)
      v228 = v229 >> 1;
    if ((unint64_t)v229 >= 0x7FFFFFFFFFFFFFFCLL)
      v35 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v35 = v228;
    if (v35)
    {
      v230 = (char *)sub_1DCAE4D04((uint64_t)v989, v35);
      v226 = v987;
      v216 = v988;
    }
    else
    {
      v230 = 0;
    }
    v231 = (float *)&v230[4 * v227];
    v214 = &v230[4 * v35];
    *v231 = v224;
    v225 = v231 + 1;
    while (v216 != v226)
    {
      v232 = *((_DWORD *)v216-- - 1);
      *((_DWORD *)v231-- - 1) = v232;
    }
    v987 = v231;
    v988 = v225;
    v989[0] = v214;
    if (v226)
    {
      operator delete(v226);
      v214 = (char *)v989[0];
    }
  }
  else
  {
    *v216 = v224;
    v225 = v216 + 1;
  }
  v988 = v225;
  if (v225 >= (float *)v214)
  {
    v234 = v987;
    v235 = v225 - v987;
    v236 = v235 + 1;
    if ((unint64_t)(v235 + 1) >> 62)
      goto LABEL_1394;
    v237 = v214 - (char *)v987;
    if (v237 >> 1 > v236)
      v236 = v237 >> 1;
    if ((unint64_t)v237 >= 0x7FFFFFFFFFFFFFFCLL)
      v35 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v35 = v236;
    if (v35)
    {
      v238 = (char *)sub_1DCAE4D04((uint64_t)v989, v35);
      v234 = v987;
      v225 = v988;
    }
    else
    {
      v238 = 0;
    }
    v239 = &v238[4 * v235];
    v240 = &v238[4 * v35];
    *(_DWORD *)v239 = 0;
    v233 = (float *)(v239 + 4);
    while (v225 != v234)
    {
      v241 = *((_DWORD *)v225-- - 1);
      *((_DWORD *)v239 - 1) = v241;
      v239 -= 4;
    }
    v987 = (float *)v239;
    v988 = v233;
    v989[0] = v240;
    if (v234)
      operator delete(v234);
  }
  else
  {
    *v225 = 0.0;
    v233 = v225 + 1;
  }
  v988 = v233;
  v243 = v982;
  v242 = v983;
  if (v982 >= v983)
  {
    v245 = v981;
    v246 = v982 - v981;
    v247 = v246 + 1;
    if ((unint64_t)(v246 + 1) >> 62)
      goto LABEL_1394;
    v248 = (char *)v983 - (char *)v981;
    if (((char *)v983 - (char *)v981) >> 1 > v247)
      v247 = v248 >> 1;
    if ((unint64_t)v248 >= 0x7FFFFFFFFFFFFFFCLL)
      v35 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v35 = v247;
    if (v35)
    {
      v249 = (char *)sub_1DCAE4D04((uint64_t)&v983, v35);
      v245 = v981;
      v243 = v982;
    }
    else
    {
      v249 = 0;
    }
    v250 = (float *)&v249[4 * v246];
    v242 = (float *)&v249[4 * v35];
    *v250 = 0.5;
    v244 = v250 + 1;
    while (v243 != v245)
    {
      v251 = *((_DWORD *)v243-- - 1);
      *((_DWORD *)v250-- - 1) = v251;
    }
    v981 = v250;
    v982 = v244;
    v983 = v242;
    if (v245)
    {
      operator delete(v245);
      v242 = v983;
    }
  }
  else
  {
    *v982 = 0.5;
    v244 = v243 + 1;
  }
  v982 = v244;
  if (v244 >= v242)
  {
    v253 = v981;
    v254 = v244 - v981;
    v255 = v254 + 1;
    if ((unint64_t)(v254 + 1) >> 62)
      goto LABEL_1394;
    v256 = (char *)v242 - (char *)v981;
    if (v256 >> 1 > v255)
      v255 = v256 >> 1;
    if ((unint64_t)v256 >= 0x7FFFFFFFFFFFFFFCLL)
      v35 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v35 = v255;
    if (v35)
    {
      v257 = (char *)sub_1DCAE4D04((uint64_t)&v983, v35);
      v253 = v981;
      v244 = v982;
    }
    else
    {
      v257 = 0;
    }
    v258 = (float *)&v257[4 * v254];
    v259 = &v257[4 * v35];
    *v258 = 0.0;
    v252 = v258 + 1;
    while (v244 != v253)
    {
      v260 = *((_DWORD *)v244-- - 1);
      *((_DWORD *)v258-- - 1) = v260;
    }
    v981 = v258;
    v982 = v252;
    v983 = (float *)v259;
    if (v253)
      operator delete(v253);
  }
  else
  {
    *v244 = 0.0;
    v252 = v244 + 1;
  }
  v982 = v252;
  v262 = v985;
  v261 = (char *)v986;
  if (v985 >= v986)
  {
    v264 = v984;
    v265 = v985 - v984;
    v266 = v265 + 1;
    if ((unint64_t)(v265 + 1) >> 62)
      goto LABEL_1394;
    v267 = (char *)v986 - (char *)v984;
    if (((char *)v986 - (char *)v984) >> 1 > v266)
      v266 = v267 >> 1;
    if ((unint64_t)v267 >= 0x7FFFFFFFFFFFFFFCLL)
      v35 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v35 = v266;
    if (v35)
    {
      v268 = (char *)sub_1DCAE4D04((uint64_t)&v986, v35);
      v264 = v984;
      v262 = v985;
    }
    else
    {
      v268 = 0;
    }
    v269 = (float *)&v268[4 * v265];
    v261 = &v268[4 * v35];
    *v269 = 0.0;
    v263 = v269 + 1;
    while (v262 != v264)
    {
      v270 = *((_DWORD *)v262-- - 1);
      *((_DWORD *)v269-- - 1) = v270;
    }
    v984 = v269;
    v985 = v263;
    v986 = (float *)v261;
    if (v264)
    {
      operator delete(v264);
      v261 = (char *)v986;
    }
  }
  else
  {
    *v985 = 0.0;
    v263 = v262 + 1;
  }
  v985 = v263;
  if ((_DWORD)v10)
    v271 = -1.0;
  else
    v271 = 1.0;
  if (v263 >= (float *)v261)
  {
    v273 = v984;
    v274 = v263 - v984;
    v275 = v274 + 1;
    if ((unint64_t)(v274 + 1) >> 62)
      goto LABEL_1394;
    v276 = v261 - (char *)v984;
    if (v276 >> 1 > v275)
      v275 = v276 >> 1;
    if ((unint64_t)v276 >= 0x7FFFFFFFFFFFFFFCLL)
      v35 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v35 = v275;
    if (v35)
    {
      v277 = (char *)sub_1DCAE4D04((uint64_t)&v986, v35);
      v273 = v984;
      v263 = v985;
    }
    else
    {
      v277 = 0;
    }
    v278 = (float *)&v277[4 * v274];
    v261 = &v277[4 * v35];
    *v278 = v271;
    v272 = v278 + 1;
    while (v263 != v273)
    {
      v279 = *((_DWORD *)v263-- - 1);
      *((_DWORD *)v278-- - 1) = v279;
    }
    v984 = v278;
    v985 = v272;
    v986 = (float *)v261;
    if (v273)
    {
      operator delete(v273);
      v261 = (char *)v986;
    }
  }
  else
  {
    *v263 = v271;
    v272 = v263 + 1;
  }
  v985 = v272;
  if (v272 >= (float *)v261)
  {
    v281 = v984;
    v282 = v272 - v984;
    v283 = v282 + 1;
    if (!((unint64_t)(v282 + 1) >> 62))
    {
      v284 = v261 - (char *)v984;
      if (v284 >> 1 > v283)
        v283 = v284 >> 1;
      if ((unint64_t)v284 >= 0x7FFFFFFFFFFFFFFCLL)
        v35 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v35 = v283;
      if (v35)
      {
        v285 = (char *)sub_1DCAE4D04((uint64_t)&v986, v35);
        v281 = v984;
        v272 = v985;
      }
      else
      {
        v285 = 0;
      }
      v286 = &v285[4 * v282];
      v287 = &v285[4 * v35];
      *(_DWORD *)v286 = 0;
      v280 = (float *)(v286 + 4);
      while (v272 != v281)
      {
        v288 = *((_DWORD *)v272-- - 1);
        *((_DWORD *)v286 - 1) = v288;
        v286 -= 4;
      }
      v984 = (float *)v286;
      v985 = v280;
      v986 = (float *)v287;
      if (v281)
        operator delete(v281);
      goto LABEL_432;
    }
LABEL_1394:
    sub_1DCAE4C44();
  }
  *v272 = 0.0;
  v280 = v272 + 1;
LABEL_432:
  v985 = v280;
  v289 = v987;
  v290 = (v988 - v987) / 3uLL;
  if ((unint64_t)((char *)v988 - (char *)v987) >= 0xC)
  {
    v291 = 1;
    v292 = 1;
    do
    {
      v289[v291] = v289[v291] - (float)(v957 * 0.5);
      v293 = v290 > v292++;
      v291 += 3;
    }
    while (v293);
  }
  v294 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(v958, (const char *)v35, v36);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v294, v296, (uint64_t)CFSTR("%@-%@"), v295, CFSTR("position"));
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  v298 = objc_alloc(MEMORY[0x1E0C99D50]);
  v300 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v298, v299, (uint64_t)v987, (char *)v988 - (char *)v987, 0);
  objc_msgSend_addAttributeWithName_format_type_data_stride_(v958, v301, (uint64_t)v297, 786435, CFSTR("position"), v300, 12);

  v302 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(v958, v303, v304);
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v302, v306, (uint64_t)CFSTR("%@-%@"), v305, CFSTR("normal"));
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  v308 = objc_alloc(MEMORY[0x1E0C99D50]);
  v310 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v308, v309, (uint64_t)v984, (char *)v985 - (char *)v984, 0);
  objc_msgSend_addAttributeWithName_format_type_data_stride_(v958, v311, (uint64_t)v307, 786435, CFSTR("normal"), v310, 12);

  v312 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(v958, v313, v314);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v312, v316, (uint64_t)CFSTR("%@-%@"), v315, CFSTR("textureCoordinate"));
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  v318 = objc_alloc(MEMORY[0x1E0C99D50]);
  v320 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v318, v319, (uint64_t)v981, (char *)v982 - (char *)v981, 0);
  objc_msgSend_addAttributeWithName_format_type_data_stride_(v958, v321, (uint64_t)v317, 786434, CFSTR("textureCoordinate"), v320, 8);
  v974 = v290 - 2;
  v970 = v290 - 1;

  v322 = v947 * 2 * v968 + v946;
  if (v948 <= 0xFFFE)
  {
    v978 = 0;
    v979 = 0;
    v980 = 0;
    sub_1DCB0DA5C((void **)&v978, v322);
    v325 = 0;
    v326 = v979;
    while (1)
    {
      v327 = v325 + 1;
      v328 = (v325 + 1) % v968;
      v329 = v980;
      if (v967 == 2)
      {
        if (v326 >= (unsigned int *)v980)
        {
          v332 = v978;
          v333 = (char *)v326 - (char *)v978;
          if ((char *)v326 - (char *)v978 <= -3)
            goto LABEL_1392;
          v334 = v333 >> 1;
          if (v980 - (char *)v978 <= (unint64_t)((v333 >> 1) + 1))
            v335 = v334 + 1;
          else
            v335 = v980 - (char *)v978;
          if ((unint64_t)(v980 - (char *)v978) >= 0x7FFFFFFFFFFFFFFELL)
            v323 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v323 = v335;
          if (v323)
          {
            v336 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
            v332 = v978;
            v326 = v979;
          }
          else
          {
            v336 = 0;
          }
          v342 = &v336[2 * v334];
          *(_WORD *)v342 = v974;
          v330 = (unsigned int *)(v342 + 2);
          while (v326 != v332)
          {
            v343 = *((_WORD *)v326 - 1);
            v326 = (unsigned int *)((char *)v326 - 2);
            *((_WORD *)v342 - 1) = v343;
            v342 -= 2;
          }
          v329 = &v336[2 * v323];
          v978 = (unsigned int *)v342;
          v979 = v330;
          v980 = v329;
          if (v332)
          {
            operator delete(v332);
            v329 = v980;
          }
        }
        else
        {
          *(_WORD *)v326 = v974;
          v330 = (unsigned int *)((char *)v326 + 2);
        }
        v979 = v330;
        if (v330 >= (unsigned int *)v329)
        {
          v345 = v978;
          v346 = (char *)v330 - (char *)v978;
          if ((char *)v330 - (char *)v978 < -2)
            goto LABEL_1392;
          v347 = v346 >> 1;
          v348 = v329 - (char *)v978;
          if (v348 <= (v346 >> 1) + 1)
            v349 = v347 + 1;
          else
            v349 = v348;
          if (v348 >= 0x7FFFFFFFFFFFFFFELL)
            v323 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v323 = v349;
          if (v323)
          {
            v350 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
            v345 = v978;
            v330 = v979;
          }
          else
          {
            v350 = 0;
          }
          v360 = &v350[2 * v347];
          *(_WORD *)v360 = v325;
          v344 = (unsigned int *)(v360 + 2);
          while (v330 != v345)
          {
            v361 = *((_WORD *)v330 - 1);
            v330 = (unsigned int *)((char *)v330 - 2);
            *((_WORD *)v360 - 1) = v361;
            v360 -= 2;
          }
          v329 = &v350[2 * v323];
          v978 = (unsigned int *)v360;
          v979 = v344;
          v980 = v329;
          if (v345)
          {
            operator delete(v345);
            v329 = v980;
          }
        }
        else
        {
          *(_WORD *)v330 = v325;
          v344 = (unsigned int *)((char *)v330 + 2);
        }
        v979 = v344;
        if (v344 >= (unsigned int *)v329)
        {
          v362 = v978;
          v363 = (char *)v344 - (char *)v978;
          if ((char *)v344 - (char *)v978 < -2)
            goto LABEL_1392;
          v364 = v363 >> 1;
          v365 = v329 - (char *)v978;
          if (v365 <= (v363 >> 1) + 1)
            v366 = v364 + 1;
          else
            v366 = v365;
          if (v365 >= 0x7FFFFFFFFFFFFFFELL)
            v323 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v323 = v366;
          if (v323)
          {
            v367 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
            v362 = v978;
            v344 = v979;
          }
          else
          {
            v367 = 0;
          }
          v376 = &v367[2 * v364];
          *(_WORD *)v376 = v328;
          v326 = (unsigned int *)(v376 + 2);
          while (v344 != v362)
          {
            v377 = *((_WORD *)v344 - 1);
            v344 = (unsigned int *)((char *)v344 - 2);
            *((_WORD *)v376 - 1) = v377;
            v376 -= 2;
          }
LABEL_552:
          v978 = (unsigned int *)v376;
          v979 = v326;
          v980 = &v367[2 * v323];
          if (v362)
            operator delete(v362);
          goto LABEL_554;
        }
      }
      else
      {
        if (v326 >= (unsigned int *)v980)
        {
          v337 = v978;
          v338 = (char *)v326 - (char *)v978;
          if ((char *)v326 - (char *)v978 < -2)
            goto LABEL_1392;
          v339 = v338 >> 1;
          if (v980 - (char *)v978 <= (unint64_t)((v338 >> 1) + 1))
            v340 = v339 + 1;
          else
            v340 = v980 - (char *)v978;
          if ((unint64_t)(v980 - (char *)v978) >= 0x7FFFFFFFFFFFFFFELL)
            v323 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v323 = v340;
          if (v323)
          {
            v341 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
            v337 = v978;
            v326 = v979;
          }
          else
          {
            v341 = 0;
          }
          v351 = &v341[2 * v339];
          *(_WORD *)v351 = v974;
          v331 = (unsigned int *)(v351 + 2);
          while (v326 != v337)
          {
            v352 = *((_WORD *)v326 - 1);
            v326 = (unsigned int *)((char *)v326 - 2);
            *((_WORD *)v351 - 1) = v352;
            v351 -= 2;
          }
          v329 = &v341[2 * v323];
          v978 = (unsigned int *)v351;
          v979 = v331;
          v980 = v329;
          if (v337)
          {
            operator delete(v337);
            v329 = v980;
          }
        }
        else
        {
          *(_WORD *)v326 = v974;
          v331 = (unsigned int *)((char *)v326 + 2);
        }
        v979 = v331;
        if (v331 >= (unsigned int *)v329)
        {
          v354 = v978;
          v355 = (char *)v331 - (char *)v978;
          if ((char *)v331 - (char *)v978 < -2)
            goto LABEL_1392;
          v356 = v355 >> 1;
          v357 = v329 - (char *)v978;
          if (v357 <= (v355 >> 1) + 1)
            v358 = v356 + 1;
          else
            v358 = v357;
          if (v357 >= 0x7FFFFFFFFFFFFFFELL)
            v323 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v323 = v358;
          if (v323)
          {
            v359 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
            v354 = v978;
            v331 = v979;
          }
          else
          {
            v359 = 0;
          }
          v368 = &v359[2 * v356];
          *(_WORD *)v368 = v325;
          v353 = (unsigned int *)(v368 + 2);
          while (v331 != v354)
          {
            v369 = *((_WORD *)v331 - 1);
            v331 = (unsigned int *)((char *)v331 - 2);
            *((_WORD *)v368 - 1) = v369;
            v368 -= 2;
          }
          v329 = &v359[2 * v323];
          v978 = (unsigned int *)v368;
          v979 = v353;
          v980 = v329;
          if (v354)
          {
            operator delete(v354);
            v329 = v980;
          }
        }
        else
        {
          *(_WORD *)v331 = v325;
          v353 = (unsigned int *)((char *)v331 + 2);
        }
        v979 = v353;
        if (v353 >= (unsigned int *)v329)
        {
          v370 = v978;
          v371 = (char *)v353 - (char *)v978;
          if ((char *)v353 - (char *)v978 < -2)
            goto LABEL_1392;
          v372 = v371 >> 1;
          v373 = v329 - (char *)v978;
          if (v373 <= (v371 >> 1) + 1)
            v374 = v372 + 1;
          else
            v374 = v373;
          if (v373 >= 0x7FFFFFFFFFFFFFFELL)
            v323 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v323 = v374;
          if (v323)
          {
            v375 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
            v370 = v978;
            v353 = v979;
          }
          else
          {
            v375 = 0;
          }
          v378 = &v375[2 * v372];
          *(_WORD *)v378 = v325;
          v344 = (unsigned int *)(v378 + 2);
          while (v353 != v370)
          {
            v379 = *((_WORD *)v353 - 1);
            v353 = (unsigned int *)((char *)v353 - 2);
            *((_WORD *)v378 - 1) = v379;
            v378 -= 2;
          }
          v329 = &v375[2 * v323];
          v978 = (unsigned int *)v378;
          v979 = v344;
          v980 = v329;
          if (v370)
          {
            operator delete(v370);
            v329 = v980;
          }
        }
        else
        {
          *(_WORD *)v353 = v325;
          v344 = (unsigned int *)((char *)v353 + 2);
        }
        v979 = v344;
        if (v344 >= (unsigned int *)v329)
        {
          v362 = v978;
          v380 = (char *)v344 - (char *)v978;
          if ((char *)v344 - (char *)v978 < -2)
LABEL_1392:
            sub_1DCAE4C44();
          v381 = v380 >> 1;
          v382 = v329 - (char *)v978;
          if (v382 <= (v380 >> 1) + 1)
            v383 = v381 + 1;
          else
            v383 = v382;
          if (v382 >= 0x7FFFFFFFFFFFFFFELL)
            v323 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v323 = v383;
          if (v323)
          {
            v367 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
            v362 = v978;
            v344 = v979;
          }
          else
          {
            v367 = 0;
          }
          v376 = &v367[2 * v381];
          *(_WORD *)v376 = v328;
          v326 = (unsigned int *)(v376 + 2);
          while (v344 != v362)
          {
            v384 = *((_WORD *)v344 - 1);
            v344 = (unsigned int *)((char *)v344 - 2);
            *((_WORD *)v376 - 1) = v384;
            v376 -= 2;
          }
          goto LABEL_552;
        }
      }
      *(_WORD *)v344 = v328;
      v326 = (unsigned int *)((char *)v344 + 2);
LABEL_554:
      v979 = v326;
      v325 = v327;
      if (v327 > v971)
      {
        if (HIDWORD(v972) + 2 * (_DWORD)v947 == 2)
          goto LABEL_798;
        v385 = 0;
LABEL_557:
        v386 = 0;
        v387 = v385 * v968;
        v965 = v385 + 1;
        v388 = (v385 + 1) * v968;
        while (1)
        {
          v389 = v386 + v387;
          v390 = v386++ + v388;
          v391 = v386 % v968 + v387;
          v392 = v386 % v968 + v388;
          v393 = v980;
          if (v967 == 2)
          {
            if (v326 >= (unsigned int *)v980)
            {
              v396 = v978;
              v397 = (char *)v326 - (char *)v978;
              if ((char *)v326 - (char *)v978 < -2)
                goto LABEL_1392;
              v398 = v397 >> 1;
              if (v980 - (char *)v978 <= (unint64_t)((v397 >> 1) + 1))
                v399 = v398 + 1;
              else
                v399 = v980 - (char *)v978;
              if ((unint64_t)(v980 - (char *)v978) >= 0x7FFFFFFFFFFFFFFELL)
                v323 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v323 = v399;
              if (v323)
              {
                v400 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                v396 = v978;
                v326 = v979;
              }
              else
              {
                v400 = 0;
              }
              v406 = &v400[2 * v398];
              *(_WORD *)v406 = v389;
              v394 = (unsigned int *)(v406 + 2);
              while (v326 != v396)
              {
                v407 = *((_WORD *)v326 - 1);
                v326 = (unsigned int *)((char *)v326 - 2);
                *((_WORD *)v406 - 1) = v407;
                v406 -= 2;
              }
              v393 = &v400[2 * v323];
              v978 = (unsigned int *)v406;
              v979 = v394;
              v980 = v393;
              if (v396)
              {
                operator delete(v396);
                v393 = v980;
              }
            }
            else
            {
              *(_WORD *)v326 = v389;
              v394 = (unsigned int *)((char *)v326 + 2);
            }
            v979 = v394;
            if (v394 >= (unsigned int *)v393)
            {
              v409 = v978;
              v410 = (char *)v394 - (char *)v978;
              if ((char *)v394 - (char *)v978 < -2)
                goto LABEL_1392;
              v411 = v410 >> 1;
              v412 = v393 - (char *)v978;
              if (v412 <= (v410 >> 1) + 1)
                v413 = v411 + 1;
              else
                v413 = v412;
              if (v412 >= 0x7FFFFFFFFFFFFFFELL)
                v323 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v323 = v413;
              if (v323)
              {
                v414 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                v409 = v978;
                v394 = v979;
              }
              else
              {
                v414 = 0;
              }
              v424 = &v414[2 * v411];
              *(_WORD *)v424 = v390;
              v408 = (unsigned int *)(v424 + 2);
              while (v394 != v409)
              {
                v425 = *((_WORD *)v394 - 1);
                v394 = (unsigned int *)((char *)v394 - 2);
                *((_WORD *)v424 - 1) = v425;
                v424 -= 2;
              }
              v393 = &v414[2 * v323];
              v978 = (unsigned int *)v424;
              v979 = v408;
              v980 = v393;
              if (v409)
              {
                operator delete(v409);
                v393 = v980;
              }
            }
            else
            {
              *(_WORD *)v394 = v390;
              v408 = (unsigned int *)((char *)v394 + 2);
            }
            v979 = v408;
            if (v408 >= (unsigned int *)v393)
            {
              v427 = v978;
              v428 = (char *)v408 - (char *)v978;
              if ((char *)v408 - (char *)v978 < -2)
                goto LABEL_1392;
              v429 = v428 >> 1;
              v430 = v393 - (char *)v978;
              if (v430 <= (v428 >> 1) + 1)
                v431 = v429 + 1;
              else
                v431 = v430;
              if (v430 >= 0x7FFFFFFFFFFFFFFELL)
                v323 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v323 = v431;
              if (v323)
              {
                v432 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                v427 = v978;
                v408 = v979;
              }
              else
              {
                v432 = 0;
              }
              v442 = &v432[2 * v429];
              *(_WORD *)v442 = v392;
              v426 = (unsigned int *)(v442 + 2);
              while (v408 != v427)
              {
                v443 = *((_WORD *)v408 - 1);
                v408 = (unsigned int *)((char *)v408 - 2);
                *((_WORD *)v442 - 1) = v443;
                v442 -= 2;
              }
              v393 = &v432[2 * v323];
              v978 = (unsigned int *)v442;
              v979 = v426;
              v980 = v393;
              if (v427)
              {
                operator delete(v427);
                v393 = v980;
              }
            }
            else
            {
              *(_WORD *)v408 = v392;
              v426 = (unsigned int *)((char *)v408 + 2);
            }
            v979 = v426;
            if (v426 >= (unsigned int *)v393)
            {
              v445 = v978;
              v446 = (char *)v426 - (char *)v978;
              if ((char *)v426 - (char *)v978 < -2)
                goto LABEL_1392;
              v447 = v446 >> 1;
              v448 = v393 - (char *)v978;
              if (v448 <= (v446 >> 1) + 1)
                v449 = v447 + 1;
              else
                v449 = v448;
              if (v448 >= 0x7FFFFFFFFFFFFFFELL)
                v323 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v323 = v449;
              if (v323)
              {
                v450 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                v445 = v978;
                v426 = v979;
              }
              else
              {
                v450 = 0;
              }
              v460 = &v450[2 * v447];
              *(_WORD *)v460 = v391;
              v444 = (unsigned int *)(v460 + 2);
              while (v426 != v445)
              {
                v461 = *((_WORD *)v426 - 1);
                v426 = (unsigned int *)((char *)v426 - 2);
                *((_WORD *)v460 - 1) = v461;
                v460 -= 2;
              }
              v393 = &v450[2 * v323];
              v978 = (unsigned int *)v460;
              v979 = v444;
              v980 = v393;
              if (v445)
              {
                operator delete(v445);
                v393 = v980;
              }
            }
            else
            {
              *(_WORD *)v426 = v391;
              v444 = (unsigned int *)((char *)v426 + 2);
            }
            v979 = v444;
            if (v444 >= (unsigned int *)v393)
            {
              v463 = v978;
              v464 = (char *)v444 - (char *)v978;
              if ((char *)v444 - (char *)v978 < -2)
                goto LABEL_1392;
              v465 = v464 >> 1;
              v466 = v393 - (char *)v978;
              if (v466 <= (v464 >> 1) + 1)
                v467 = v465 + 1;
              else
                v467 = v466;
              if (v466 >= 0x7FFFFFFFFFFFFFFELL)
                v323 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v323 = v467;
              if (v323)
              {
                v468 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                v463 = v978;
                v444 = v979;
              }
              else
              {
                v468 = 0;
              }
              v478 = &v468[2 * v465];
              *(_WORD *)v478 = v389;
              v462 = (unsigned int *)(v478 + 2);
              while (v444 != v463)
              {
                v479 = *((_WORD *)v444 - 1);
                v444 = (unsigned int *)((char *)v444 - 2);
                *((_WORD *)v478 - 1) = v479;
                v478 -= 2;
              }
              v393 = &v468[2 * v323];
              v978 = (unsigned int *)v478;
              v979 = v462;
              v980 = v393;
              if (v463)
              {
                operator delete(v463);
                v393 = v980;
              }
            }
            else
            {
              *(_WORD *)v444 = v389;
              v462 = (unsigned int *)((char *)v444 + 2);
            }
            v979 = v462;
            if (v462 >= (unsigned int *)v393)
            {
              v481 = v978;
              v482 = (char *)v462 - (char *)v978;
              if ((char *)v462 - (char *)v978 < -2)
                goto LABEL_1392;
              v483 = v482 >> 1;
              v484 = v393 - (char *)v978;
              if (v484 <= (v482 >> 1) + 1)
                v485 = v483 + 1;
              else
                v485 = v484;
              if (v484 >= 0x7FFFFFFFFFFFFFFELL)
                v323 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v323 = v485;
              if (v323)
              {
                v486 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                v481 = v978;
                v462 = v979;
              }
              else
              {
                v486 = 0;
              }
              v496 = &v486[2 * v483];
              *(_WORD *)v496 = v392;
              v326 = (unsigned int *)(v496 + 2);
              while (v462 != v481)
              {
                v497 = *((_WORD *)v462 - 1);
                v462 = (unsigned int *)((char *)v462 - 2);
                *((_WORD *)v496 - 1) = v497;
                v496 -= 2;
              }
LABEL_794:
              v978 = (unsigned int *)v496;
              v979 = v326;
              v980 = &v486[2 * v323];
              if (v481)
                operator delete(v481);
              goto LABEL_796;
            }
            *(_WORD *)v462 = v392;
            v480 = (unsigned int *)((char *)v462 + 2);
          }
          else
          {
            if (v326 >= (unsigned int *)v980)
            {
              v401 = v978;
              v402 = (char *)v326 - (char *)v978;
              if ((char *)v326 - (char *)v978 < -2)
                goto LABEL_1392;
              v403 = v402 >> 1;
              if (v980 - (char *)v978 <= (unint64_t)((v402 >> 1) + 1))
                v404 = v403 + 1;
              else
                v404 = v980 - (char *)v978;
              if ((unint64_t)(v980 - (char *)v978) >= 0x7FFFFFFFFFFFFFFELL)
                v323 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v323 = v404;
              if (v323)
              {
                v405 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                v401 = v978;
                v326 = v979;
              }
              else
              {
                v405 = 0;
              }
              v415 = &v405[2 * v403];
              *(_WORD *)v415 = v389;
              v395 = (unsigned int *)(v415 + 2);
              while (v326 != v401)
              {
                v416 = *((_WORD *)v326 - 1);
                v326 = (unsigned int *)((char *)v326 - 2);
                *((_WORD *)v415 - 1) = v416;
                v415 -= 2;
              }
              v393 = &v405[2 * v323];
              v978 = (unsigned int *)v415;
              v979 = v395;
              v980 = v393;
              if (v401)
              {
                operator delete(v401);
                v393 = v980;
              }
            }
            else
            {
              *(_WORD *)v326 = v389;
              v395 = (unsigned int *)((char *)v326 + 2);
            }
            v979 = v395;
            if (v395 >= (unsigned int *)v393)
            {
              v418 = v978;
              v419 = (char *)v395 - (char *)v978;
              if ((char *)v395 - (char *)v978 < -2)
                goto LABEL_1392;
              v420 = v419 >> 1;
              v421 = v393 - (char *)v978;
              if (v421 <= (v419 >> 1) + 1)
                v422 = v420 + 1;
              else
                v422 = v421;
              if (v421 >= 0x7FFFFFFFFFFFFFFELL)
                v323 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v323 = v422;
              if (v323)
              {
                v423 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                v418 = v978;
                v395 = v979;
              }
              else
              {
                v423 = 0;
              }
              v433 = &v423[2 * v420];
              *(_WORD *)v433 = v391;
              v417 = (unsigned int *)(v433 + 2);
              while (v395 != v418)
              {
                v434 = *((_WORD *)v395 - 1);
                v395 = (unsigned int *)((char *)v395 - 2);
                *((_WORD *)v433 - 1) = v434;
                v433 -= 2;
              }
              v393 = &v423[2 * v323];
              v978 = (unsigned int *)v433;
              v979 = v417;
              v980 = v393;
              if (v418)
              {
                operator delete(v418);
                v393 = v980;
              }
            }
            else
            {
              *(_WORD *)v395 = v391;
              v417 = (unsigned int *)((char *)v395 + 2);
            }
            v979 = v417;
            if (v417 >= (unsigned int *)v393)
            {
              v436 = v978;
              v437 = (char *)v417 - (char *)v978;
              if ((char *)v417 - (char *)v978 < -2)
                goto LABEL_1392;
              v438 = v437 >> 1;
              v439 = v393 - (char *)v978;
              if (v439 <= (v437 >> 1) + 1)
                v440 = v438 + 1;
              else
                v440 = v439;
              if (v439 >= 0x7FFFFFFFFFFFFFFELL)
                v323 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v323 = v440;
              if (v323)
              {
                v441 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                v436 = v978;
                v417 = v979;
              }
              else
              {
                v441 = 0;
              }
              v451 = &v441[2 * v438];
              *(_WORD *)v451 = v391;
              v435 = (unsigned int *)(v451 + 2);
              while (v417 != v436)
              {
                v452 = *((_WORD *)v417 - 1);
                v417 = (unsigned int *)((char *)v417 - 2);
                *((_WORD *)v451 - 1) = v452;
                v451 -= 2;
              }
              v393 = &v441[2 * v323];
              v978 = (unsigned int *)v451;
              v979 = v435;
              v980 = v393;
              if (v436)
              {
                operator delete(v436);
                v393 = v980;
              }
            }
            else
            {
              *(_WORD *)v417 = v391;
              v435 = (unsigned int *)((char *)v417 + 2);
            }
            v979 = v435;
            if (v435 >= (unsigned int *)v393)
            {
              v454 = v978;
              v455 = (char *)v435 - (char *)v978;
              if ((char *)v435 - (char *)v978 < -2)
                goto LABEL_1392;
              v456 = v455 >> 1;
              v457 = v393 - (char *)v978;
              if (v457 <= (v455 >> 1) + 1)
                v458 = v456 + 1;
              else
                v458 = v457;
              if (v457 >= 0x7FFFFFFFFFFFFFFELL)
                v323 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v323 = v458;
              if (v323)
              {
                v459 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                v454 = v978;
                v435 = v979;
              }
              else
              {
                v459 = 0;
              }
              v469 = &v459[2 * v456];
              *(_WORD *)v469 = v392;
              v453 = (unsigned int *)(v469 + 2);
              while (v435 != v454)
              {
                v470 = *((_WORD *)v435 - 1);
                v435 = (unsigned int *)((char *)v435 - 2);
                *((_WORD *)v469 - 1) = v470;
                v469 -= 2;
              }
              v393 = &v459[2 * v323];
              v978 = (unsigned int *)v469;
              v979 = v453;
              v980 = v393;
              if (v454)
              {
                operator delete(v454);
                v393 = v980;
              }
            }
            else
            {
              *(_WORD *)v435 = v392;
              v453 = (unsigned int *)((char *)v435 + 2);
            }
            v979 = v453;
            if (v453 >= (unsigned int *)v393)
            {
              v472 = v978;
              v473 = (char *)v453 - (char *)v978;
              if ((char *)v453 - (char *)v978 < -2)
                goto LABEL_1392;
              v474 = v473 >> 1;
              v475 = v393 - (char *)v978;
              if (v475 <= (v473 >> 1) + 1)
                v476 = v474 + 1;
              else
                v476 = v475;
              if (v475 >= 0x7FFFFFFFFFFFFFFELL)
                v323 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v323 = v476;
              if (v323)
              {
                v477 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                v472 = v978;
                v453 = v979;
              }
              else
              {
                v477 = 0;
              }
              v487 = &v477[2 * v474];
              *(_WORD *)v487 = v392;
              v471 = (unsigned int *)(v487 + 2);
              while (v453 != v472)
              {
                v488 = *((_WORD *)v453 - 1);
                v453 = (unsigned int *)((char *)v453 - 2);
                *((_WORD *)v487 - 1) = v488;
                v487 -= 2;
              }
              v393 = &v477[2 * v323];
              v978 = (unsigned int *)v487;
              v979 = v471;
              v980 = v393;
              if (v472)
              {
                operator delete(v472);
                v393 = v980;
              }
            }
            else
            {
              *(_WORD *)v453 = v392;
              v471 = (unsigned int *)((char *)v453 + 2);
            }
            v979 = v471;
            if (v471 >= (unsigned int *)v393)
            {
              v490 = v978;
              v491 = (char *)v471 - (char *)v978;
              if ((char *)v471 - (char *)v978 < -2)
                goto LABEL_1392;
              v492 = v491 >> 1;
              v493 = v393 - (char *)v978;
              if (v493 <= (v491 >> 1) + 1)
                v494 = v492 + 1;
              else
                v494 = v493;
              if (v493 >= 0x7FFFFFFFFFFFFFFELL)
                v323 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v323 = v494;
              if (v323)
              {
                v495 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                v490 = v978;
                v471 = v979;
              }
              else
              {
                v495 = 0;
              }
              v498 = &v495[2 * v492];
              *(_WORD *)v498 = v390;
              v489 = (unsigned int *)(v498 + 2);
              while (v471 != v490)
              {
                v499 = *((_WORD *)v471 - 1);
                v471 = (unsigned int *)((char *)v471 - 2);
                *((_WORD *)v498 - 1) = v499;
                v498 -= 2;
              }
              v393 = &v495[2 * v323];
              v978 = (unsigned int *)v498;
              v979 = v489;
              v980 = v393;
              if (v490)
              {
                operator delete(v490);
                v393 = v980;
              }
            }
            else
            {
              *(_WORD *)v471 = v390;
              v489 = (unsigned int *)((char *)v471 + 2);
            }
            v979 = v489;
            if (v489 >= (unsigned int *)v393)
            {
              v501 = v978;
              v502 = (char *)v489 - (char *)v978;
              if ((char *)v489 - (char *)v978 < -2)
                goto LABEL_1392;
              v503 = v502 >> 1;
              v504 = v393 - (char *)v978;
              if (v504 <= (v502 >> 1) + 1)
                v505 = v503 + 1;
              else
                v505 = v504;
              if (v504 >= 0x7FFFFFFFFFFFFFFELL)
                v323 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v323 = v505;
              if (v323)
              {
                v506 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                v501 = v978;
                v489 = v979;
              }
              else
              {
                v506 = 0;
              }
              v507 = &v506[2 * v503];
              *(_WORD *)v507 = v390;
              v500 = (unsigned int *)(v507 + 2);
              while (v489 != v501)
              {
                v508 = *((_WORD *)v489 - 1);
                v489 = (unsigned int *)((char *)v489 - 2);
                *((_WORD *)v507 - 1) = v508;
                v507 -= 2;
              }
              v393 = &v506[2 * v323];
              v978 = (unsigned int *)v507;
              v979 = v500;
              v980 = v393;
              if (v501)
              {
                operator delete(v501);
                v393 = v980;
              }
            }
            else
            {
              *(_WORD *)v489 = v390;
              v500 = (unsigned int *)((char *)v489 + 2);
            }
            v979 = v500;
            if (v500 >= (unsigned int *)v393)
            {
              v481 = v978;
              v509 = (char *)v500 - (char *)v978;
              if ((char *)v500 - (char *)v978 < -2)
                goto LABEL_1392;
              v510 = v509 >> 1;
              v511 = v393 - (char *)v978;
              if (v511 <= (v509 >> 1) + 1)
                v512 = v510 + 1;
              else
                v512 = v511;
              if (v511 >= 0x7FFFFFFFFFFFFFFELL)
                v323 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v323 = v512;
              if (v323)
              {
                v486 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                v481 = v978;
                v500 = v979;
              }
              else
              {
                v486 = 0;
              }
              v496 = &v486[2 * v510];
              *(_WORD *)v496 = v389;
              v326 = (unsigned int *)(v496 + 2);
              while (v500 != v481)
              {
                v513 = *((_WORD *)v500 - 1);
                v500 = (unsigned int *)((char *)v500 - 2);
                *((_WORD *)v496 - 1) = v513;
                v496 -= 2;
              }
              goto LABEL_794;
            }
            *(_WORD *)v500 = v389;
            v480 = (unsigned int *)((char *)v500 + 2);
          }
          v326 = v480;
LABEL_796:
          v979 = v326;
          if (v386 > v971)
          {
            v385 = v965;
            if (v965 != HIDWORD(v972) + 2 * (_DWORD)v947 - 2)
              goto LABEL_557;
LABEL_798:
            v514 = 0;
            v515 = v974 + ~(_WORD)v971;
            while (2)
            {
              v516 = v514 + 1;
              v517 = (v514 + 1) % v968;
              v518 = v980;
              if (v967 == 2)
              {
                if (v326 >= (unsigned int *)v980)
                {
                  v521 = v978;
                  v522 = (char *)v326 - (char *)v978;
                  if ((char *)v326 - (char *)v978 < -2)
                    goto LABEL_1392;
                  v523 = v522 >> 1;
                  if (v980 - (char *)v978 <= (unint64_t)((v522 >> 1) + 1))
                    v524 = v523 + 1;
                  else
                    v524 = v980 - (char *)v978;
                  if ((unint64_t)(v980 - (char *)v978) >= 0x7FFFFFFFFFFFFFFELL)
                    v323 = 0x7FFFFFFFFFFFFFFFLL;
                  else
                    v323 = v524;
                  if (v323)
                  {
                    v525 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                    v521 = v978;
                    v326 = v979;
                  }
                  else
                  {
                    v525 = 0;
                  }
                  v531 = &v525[2 * v523];
                  *(_WORD *)v531 = v970;
                  v519 = (unsigned int *)(v531 + 2);
                  while (v326 != v521)
                  {
                    v532 = *((_WORD *)v326 - 1);
                    v326 = (unsigned int *)((char *)v326 - 2);
                    *((_WORD *)v531 - 1) = v532;
                    v531 -= 2;
                  }
                  v518 = &v525[2 * v323];
                  v978 = (unsigned int *)v531;
                  v979 = v519;
                  v980 = v518;
                  if (v521)
                  {
                    operator delete(v521);
                    v518 = v980;
                  }
                }
                else
                {
                  *(_WORD *)v326 = v970;
                  v519 = (unsigned int *)((char *)v326 + 2);
                }
                v979 = v519;
                v533 = v517 + v515;
                if (v519 >= (unsigned int *)v518)
                {
                  v535 = v978;
                  v536 = (char *)v519 - (char *)v978;
                  if ((char *)v519 - (char *)v978 < -2)
                    goto LABEL_1392;
                  v537 = v536 >> 1;
                  v538 = v518 - (char *)v978;
                  if (v538 <= (v536 >> 1) + 1)
                    v539 = v537 + 1;
                  else
                    v539 = v538;
                  if (v538 >= 0x7FFFFFFFFFFFFFFELL)
                    v323 = 0x7FFFFFFFFFFFFFFFLL;
                  else
                    v323 = v539;
                  if (v323)
                  {
                    v540 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                    v535 = v978;
                    v519 = v979;
                  }
                  else
                  {
                    v540 = 0;
                  }
                  v551 = &v540[2 * v537];
                  *(_WORD *)v551 = v533;
                  v534 = (unsigned int *)(v551 + 2);
                  while (v519 != v535)
                  {
                    v552 = *((_WORD *)v519 - 1);
                    v519 = (unsigned int *)((char *)v519 - 2);
                    *((_WORD *)v551 - 1) = v552;
                    v551 -= 2;
                  }
                  v518 = &v540[2 * v323];
                  v978 = (unsigned int *)v551;
                  v979 = v534;
                  v980 = v518;
                  if (v535)
                  {
                    operator delete(v535);
                    v518 = v980;
                  }
                }
                else
                {
                  *(_WORD *)v519 = v533;
                  v534 = (unsigned int *)((char *)v519 + 2);
                }
                v979 = v534;
                v553 = v514 + v515;
                if (v534 < (unsigned int *)v518)
                {
                  *(_WORD *)v534 = v553;
                  v326 = (unsigned int *)((char *)v534 + 2);
                  goto LABEL_917;
                }
                v554 = v978;
                v555 = (char *)v534 - (char *)v978;
                if ((char *)v534 - (char *)v978 < -2)
                  goto LABEL_1392;
                v556 = v555 >> 1;
                v557 = v518 - (char *)v978;
                if (v557 <= (v555 >> 1) + 1)
                  v558 = v556 + 1;
                else
                  v558 = v557;
                if (v557 >= 0x7FFFFFFFFFFFFFFELL)
                  v323 = 0x7FFFFFFFFFFFFFFFLL;
                else
                  v323 = v558;
                if (v323)
                {
                  v559 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                  v554 = v978;
                  v534 = v979;
                }
                else
                {
                  v559 = 0;
                }
                v569 = &v559[2 * v556];
                *(_WORD *)v569 = v553;
                v326 = (unsigned int *)(v569 + 2);
                while (v534 != v554)
                {
                  v570 = *((_WORD *)v534 - 1);
                  v534 = (unsigned int *)((char *)v534 - 2);
                  *((_WORD *)v569 - 1) = v570;
                  v569 -= 2;
                }
LABEL_915:
                v978 = (unsigned int *)v569;
                v979 = v326;
                v980 = &v559[2 * v323];
                if (v554)
                  operator delete(v554);
              }
              else
              {
                if (v326 >= (unsigned int *)v980)
                {
                  v526 = v978;
                  v527 = (char *)v326 - (char *)v978;
                  if ((char *)v326 - (char *)v978 < -2)
                    goto LABEL_1392;
                  v528 = v527 >> 1;
                  if (v980 - (char *)v978 <= (unint64_t)((v527 >> 1) + 1))
                    v529 = v528 + 1;
                  else
                    v529 = v980 - (char *)v978;
                  if ((unint64_t)(v980 - (char *)v978) >= 0x7FFFFFFFFFFFFFFELL)
                    v323 = 0x7FFFFFFFFFFFFFFFLL;
                  else
                    v323 = v529;
                  if (v323)
                  {
                    v530 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                    v526 = v978;
                    v326 = v979;
                  }
                  else
                  {
                    v530 = 0;
                  }
                  v541 = &v530[2 * v528];
                  *(_WORD *)v541 = v970;
                  v520 = (unsigned int *)(v541 + 2);
                  while (v326 != v526)
                  {
                    v542 = *((_WORD *)v326 - 1);
                    v326 = (unsigned int *)((char *)v326 - 2);
                    *((_WORD *)v541 - 1) = v542;
                    v541 -= 2;
                  }
                  v518 = &v530[2 * v323];
                  v978 = (unsigned int *)v541;
                  v979 = v520;
                  v980 = v518;
                  if (v526)
                  {
                    operator delete(v526);
                    v518 = v980;
                  }
                }
                else
                {
                  *(_WORD *)v326 = v970;
                  v520 = (unsigned int *)((char *)v326 + 2);
                }
                v979 = v520;
                v543 = v514 + v515;
                if (v520 >= (unsigned int *)v518)
                {
                  v545 = v978;
                  v546 = (char *)v520 - (char *)v978;
                  if ((char *)v520 - (char *)v978 < -2)
                    goto LABEL_1392;
                  v547 = v546 >> 1;
                  v548 = v518 - (char *)v978;
                  if (v548 <= (v546 >> 1) + 1)
                    v549 = v547 + 1;
                  else
                    v549 = v548;
                  if (v548 >= 0x7FFFFFFFFFFFFFFELL)
                    v323 = 0x7FFFFFFFFFFFFFFFLL;
                  else
                    v323 = v549;
                  if (v323)
                  {
                    v550 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                    v545 = v978;
                    v520 = v979;
                  }
                  else
                  {
                    v550 = 0;
                  }
                  v560 = &v550[2 * v547];
                  *(_WORD *)v560 = v543;
                  v544 = (unsigned int *)(v560 + 2);
                  while (v520 != v545)
                  {
                    v561 = *((_WORD *)v520 - 1);
                    v520 = (unsigned int *)((char *)v520 - 2);
                    *((_WORD *)v560 - 1) = v561;
                    v560 -= 2;
                  }
                  v518 = &v550[2 * v323];
                  v978 = (unsigned int *)v560;
                  v979 = v544;
                  v980 = v518;
                  if (v545)
                  {
                    operator delete(v545);
                    v518 = v980;
                  }
                }
                else
                {
                  *(_WORD *)v520 = v543;
                  v544 = (unsigned int *)((char *)v520 + 2);
                }
                v979 = v544;
                if (v544 >= (unsigned int *)v518)
                {
                  v563 = v978;
                  v564 = (char *)v544 - (char *)v978;
                  if ((char *)v544 - (char *)v978 < -2)
                    goto LABEL_1392;
                  v565 = v564 >> 1;
                  v566 = v518 - (char *)v978;
                  if (v566 <= (v564 >> 1) + 1)
                    v567 = v565 + 1;
                  else
                    v567 = v566;
                  if (v566 >= 0x7FFFFFFFFFFFFFFELL)
                    v323 = 0x7FFFFFFFFFFFFFFFLL;
                  else
                    v323 = v567;
                  if (v323)
                  {
                    v568 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                    v563 = v978;
                    v544 = v979;
                  }
                  else
                  {
                    v568 = 0;
                  }
                  v571 = &v568[2 * v565];
                  *(_WORD *)v571 = v543;
                  v562 = (unsigned int *)(v571 + 2);
                  while (v544 != v563)
                  {
                    v572 = *((_WORD *)v544 - 1);
                    v544 = (unsigned int *)((char *)v544 - 2);
                    *((_WORD *)v571 - 1) = v572;
                    v571 -= 2;
                  }
                  v518 = &v568[2 * v323];
                  v978 = (unsigned int *)v571;
                  v979 = v562;
                  v980 = v518;
                  if (v563)
                  {
                    operator delete(v563);
                    v518 = v980;
                  }
                }
                else
                {
                  *(_WORD *)v544 = v543;
                  v562 = (unsigned int *)((char *)v544 + 2);
                }
                v979 = v562;
                v573 = v517 + v515;
                if (v562 >= (unsigned int *)v518)
                {
                  v554 = v978;
                  v574 = (char *)v562 - (char *)v978;
                  if ((char *)v562 - (char *)v978 < -2)
                    goto LABEL_1392;
                  v575 = v574 >> 1;
                  v576 = v518 - (char *)v978;
                  if (v576 <= (v574 >> 1) + 1)
                    v577 = v575 + 1;
                  else
                    v577 = v576;
                  if (v576 >= 0x7FFFFFFFFFFFFFFELL)
                    v323 = 0x7FFFFFFFFFFFFFFFLL;
                  else
                    v323 = v577;
                  if (v323)
                  {
                    v559 = (char *)sub_1DCB0DAEC((uint64_t)&v980, v323);
                    v554 = v978;
                    v562 = v979;
                  }
                  else
                  {
                    v559 = 0;
                  }
                  v569 = &v559[2 * v575];
                  *(_WORD *)v569 = v573;
                  v326 = (unsigned int *)(v569 + 2);
                  while (v562 != v554)
                  {
                    v578 = *((_WORD *)v562 - 1);
                    v562 = (unsigned int *)((char *)v562 - 2);
                    *((_WORD *)v569 - 1) = v578;
                    v569 -= 2;
                  }
                  goto LABEL_915;
                }
                *(_WORD *)v562 = v573;
                v326 = (unsigned int *)((char *)v562 + 2);
              }
LABEL_917:
              v979 = v326;
              v514 = v516;
              if (v516 > v971)
              {
                objc_msgSend_name(v958, (const char *)v323, v324);
                v579 = (id)objc_claimAutoreleasedReturnValue();
                v580 = v949;
                if (!v580)
                  v580 = objc_alloc_init(MDLMeshBufferDataAllocator);
                v581 = objc_alloc(MEMORY[0x1E0C99D50]);
                v583 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v581, v582, (uint64_t)v978, (char *)v979 - (char *)v978, 0);
                v585 = (void *)objc_msgSend_newBufferWithData_type_(v580, v584, (uint64_t)v583, 2);
                if (objc_msgSend_conformsToProtocol_(v585, v586, (uint64_t)&unk_1F03B6D88))
                {
                  v587 = v585;
                  objc_msgSend_stringByAppendingString_(v579, v588, (uint64_t)CFSTR("-Indices"));
                  v589 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setName_(v587, v590, (uint64_t)v589);

                }
                v591 = [MDLMaterial alloc];
                v592 = (void *)objc_opt_new();
                v594 = (void *)objc_msgSend_initWithName_scatteringFunction_(v591, v593, (uint64_t)CFSTR("material"), v592);

                objc_msgSend_propertyWithSemantic_(v594, v595, 2);
                v596 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v597) = 1063675494;
                objc_msgSend_setFloatValue_(v596, v598, v599, v597);
                objc_msgSend_propertyWithSemantic_(v594, v600, 6);
                v601 = (void *)objc_claimAutoreleasedReturnValue();

                LODWORD(v602) = 1058642330;
                objc_msgSend_setFloatValue_(v601, v603, v604, v602);
                objc_msgSend_propertyWithSemantic_(v594, v605, 0);
                v606 = (void *)objc_claimAutoreleasedReturnValue();

                v607 = [MDLSubmesh alloc];
                v609 = (void *)objc_msgSend_initWithIndexBuffer_indexCount_indexType_geometryType_material_(v607, v608, (uint64_t)v585, ((char *)v979 - (char *)v978) >> 1, 16, v967, v594);

                goto LABEL_1382;
              }
              continue;
            }
          }
        }
      }
    }
  }
  v978 = 0;
  v979 = 0;
  v980 = 0;
  sub_1DCB01460((void **)&v978, v322);
  v612 = 0;
  v613 = v979;
  do
  {
    v614 = v612 + 1;
    v615 = (v612 + 1) % v968;
    v616 = v980;
    if (v967 == 2)
    {
      if (v613 >= (unsigned int *)v980)
      {
        v619 = v978;
        v620 = v613 - v978;
        v621 = v620 + 1;
        if ((unint64_t)(v620 + 1) >> 62)
          goto LABEL_1393;
        v622 = v980 - (char *)v978;
        if ((v980 - (char *)v978) >> 1 > v621)
          v621 = v622 >> 1;
        if ((unint64_t)v622 >= 0x7FFFFFFFFFFFFFFCLL)
          v610 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v610 = v621;
        if (v610)
        {
          v623 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
          v619 = v978;
          v613 = v979;
        }
        else
        {
          v623 = 0;
        }
        v629 = &v623[4 * v620];
        *(_DWORD *)v629 = v970;
        v617 = (unsigned int *)(v629 + 4);
        while (v613 != v619)
        {
          v630 = *--v613;
          *((_DWORD *)v629 - 1) = v630;
          v629 -= 4;
        }
        v616 = &v623[4 * v610];
        v978 = (unsigned int *)v629;
        v979 = v617;
        v980 = v616;
        if (v619)
        {
          operator delete(v619);
          v616 = v980;
        }
      }
      else
      {
        *v613 = v970;
        v617 = v613 + 1;
      }
      v979 = v617;
      if (v617 >= (unsigned int *)v616)
      {
        v632 = v978;
        v633 = v617 - v978;
        v634 = v633 + 1;
        if ((unint64_t)(v633 + 1) >> 62)
          goto LABEL_1393;
        v635 = v616 - (char *)v978;
        if (v635 >> 1 > v634)
          v634 = v635 >> 1;
        if ((unint64_t)v635 >= 0x7FFFFFFFFFFFFFFCLL)
          v610 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v610 = v634;
        if (v610)
        {
          v636 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
          v632 = v978;
          v617 = v979;
        }
        else
        {
          v636 = 0;
        }
        v645 = (unsigned int *)&v636[4 * v633];
        *v645 = v612;
        v631 = v645 + 1;
        while (v617 != v632)
        {
          v646 = *--v617;
          *--v645 = v646;
        }
        v616 = &v636[4 * v610];
        v978 = v645;
        v979 = v631;
        v980 = v616;
        if (v632)
        {
          operator delete(v632);
          v616 = v980;
        }
      }
      else
      {
        *v617 = v612;
        v631 = v617 + 1;
      }
      v979 = v631;
      if (v631 < (unsigned int *)v616)
        goto LABEL_1019;
      v647 = v978;
      v648 = v631 - v978;
      v649 = v648 + 1;
      if ((unint64_t)(v648 + 1) >> 62)
        goto LABEL_1393;
      v650 = v616 - (char *)v978;
      if (v650 >> 1 > v649)
        v649 = v650 >> 1;
      if ((unint64_t)v650 >= 0x7FFFFFFFFFFFFFFCLL)
        v610 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v610 = v649;
      if (v610)
      {
        v651 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
        v647 = v978;
        v631 = v979;
      }
      else
      {
        v651 = 0;
      }
      v659 = (unsigned int *)&v651[4 * v648];
      *v659 = v615;
      v613 = v659 + 1;
      while (v631 != v647)
      {
        v660 = *--v631;
        *--v659 = v660;
      }
    }
    else
    {
      if (v613 >= (unsigned int *)v980)
      {
        v624 = v978;
        v625 = v613 - v978;
        v626 = v625 + 1;
        if ((unint64_t)(v625 + 1) >> 62)
          goto LABEL_1393;
        v627 = v980 - (char *)v978;
        if ((v980 - (char *)v978) >> 1 > v626)
          v626 = v627 >> 1;
        if ((unint64_t)v627 >= 0x7FFFFFFFFFFFFFFCLL)
          v610 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v610 = v626;
        if (v610)
        {
          v628 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
          v624 = v978;
          v613 = v979;
        }
        else
        {
          v628 = 0;
        }
        v637 = &v628[4 * v625];
        *(_DWORD *)v637 = v970;
        v618 = (unsigned int *)(v637 + 4);
        while (v613 != v624)
        {
          v638 = *--v613;
          *((_DWORD *)v637 - 1) = v638;
          v637 -= 4;
        }
        v616 = &v628[4 * v610];
        v978 = (unsigned int *)v637;
        v979 = v618;
        v980 = v616;
        if (v624)
        {
          operator delete(v624);
          v616 = v980;
        }
      }
      else
      {
        *v613 = v970;
        v618 = v613 + 1;
      }
      v979 = v618;
      if (v618 >= (unsigned int *)v616)
      {
        v640 = v978;
        v641 = v618 - v978;
        v642 = v641 + 1;
        if ((unint64_t)(v641 + 1) >> 62)
          goto LABEL_1393;
        v643 = v616 - (char *)v978;
        if (v643 >> 1 > v642)
          v642 = v643 >> 1;
        if ((unint64_t)v643 >= 0x7FFFFFFFFFFFFFFCLL)
          v610 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v610 = v642;
        if (v610)
        {
          v644 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
          v640 = v978;
          v618 = v979;
        }
        else
        {
          v644 = 0;
        }
        v652 = &v644[4 * v641];
        *(_DWORD *)v652 = v612;
        v639 = (unsigned int *)(v652 + 4);
        while (v618 != v640)
        {
          v653 = *--v618;
          *((_DWORD *)v652 - 1) = v653;
          v652 -= 4;
        }
        v616 = &v644[4 * v610];
        v978 = (unsigned int *)v652;
        v979 = v639;
        v980 = v616;
        if (v640)
        {
          operator delete(v640);
          v616 = v980;
        }
      }
      else
      {
        *v618 = v612;
        v639 = v618 + 1;
      }
      v979 = v639;
      if (v639 >= (unsigned int *)v616)
      {
        v654 = v978;
        v655 = v639 - v978;
        v656 = v655 + 1;
        if ((unint64_t)(v655 + 1) >> 62)
          goto LABEL_1393;
        v657 = v616 - (char *)v978;
        if (v657 >> 1 > v656)
          v656 = v657 >> 1;
        if ((unint64_t)v657 >= 0x7FFFFFFFFFFFFFFCLL)
          v610 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v610 = v656;
        if (v610)
        {
          v658 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
          v654 = v978;
          v639 = v979;
        }
        else
        {
          v658 = 0;
        }
        v661 = (unsigned int *)&v658[4 * v655];
        *v661 = v612;
        v631 = v661 + 1;
        while (v639 != v654)
        {
          v662 = *--v639;
          *--v661 = v662;
        }
        v616 = &v658[4 * v610];
        v978 = v661;
        v979 = v631;
        v980 = v616;
        if (v654)
        {
          operator delete(v654);
          v616 = v980;
        }
      }
      else
      {
        *v639 = v612;
        v631 = v639 + 1;
      }
      v979 = v631;
      if (v631 < (unsigned int *)v616)
      {
LABEL_1019:
        *v631 = v615;
        v613 = v631 + 1;
        goto LABEL_1034;
      }
      v647 = v978;
      v663 = v631 - v978;
      v664 = v663 + 1;
      if ((unint64_t)(v663 + 1) >> 62)
LABEL_1393:
        sub_1DCAE4C44();
      v665 = v616 - (char *)v978;
      if (v665 >> 1 > v664)
        v664 = v665 >> 1;
      if ((unint64_t)v665 >= 0x7FFFFFFFFFFFFFFCLL)
        v610 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v610 = v664;
      if (v610)
      {
        v651 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
        v647 = v978;
        v631 = v979;
      }
      else
      {
        v651 = 0;
      }
      v659 = (unsigned int *)&v651[4 * v663];
      *v659 = v615;
      v613 = v659 + 1;
      while (v631 != v647)
      {
        v666 = *--v631;
        *--v659 = v666;
      }
    }
    v978 = v659;
    v979 = v613;
    v980 = &v651[4 * v610];
    if (v647)
      operator delete(v647);
LABEL_1034:
    v979 = v613;
    v612 = v614;
  }
  while (v614 <= v971);
  if (HIDWORD(v972) + 2 * (_DWORD)v947 == 2)
    goto LABEL_1264;
  v667 = 0;
  while (2)
  {
    v668 = 0;
    v669 = v667 * v968;
    v966 = v667 + 1;
    v670 = (v667 + 1) * v968;
    while (2)
    {
      v671 = v668 + v669;
      v672 = v668 + v670;
      v673 = ++v668 % v968 + v669;
      v674 = v668 % v968 + v670;
      v675 = v980;
      if (v967 == 2)
      {
        if (v613 >= (unsigned int *)v980)
        {
          v678 = v978;
          v679 = v613 - v978;
          v680 = v679 + 1;
          if ((unint64_t)(v679 + 1) >> 62)
            goto LABEL_1393;
          v681 = v980 - (char *)v978;
          if ((v980 - (char *)v978) >> 1 > v680)
            v680 = v681 >> 1;
          if ((unint64_t)v681 >= 0x7FFFFFFFFFFFFFFCLL)
            v610 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v610 = v680;
          if (v610)
          {
            v682 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
            v678 = v978;
            v613 = v979;
          }
          else
          {
            v682 = 0;
          }
          v688 = &v682[4 * v679];
          *(_DWORD *)v688 = v671;
          v676 = v688 + 4;
          while (v613 != v678)
          {
            v689 = *--v613;
            *((_DWORD *)v688 - 1) = v689;
            v688 -= 4;
          }
          v675 = &v682[4 * v610];
          v978 = (unsigned int *)v688;
          v979 = (unsigned int *)v676;
          v980 = v675;
          if (v678)
          {
            operator delete(v678);
            v675 = v980;
          }
        }
        else
        {
          *v613 = v671;
          v676 = (char *)(v613 + 1);
        }
        v979 = (unsigned int *)v676;
        if (v676 >= v675)
        {
          v691 = v978;
          v692 = (v676 - (char *)v978) >> 2;
          v693 = v692 + 1;
          if ((unint64_t)(v692 + 1) >> 62)
            goto LABEL_1393;
          v694 = v675 - (char *)v978;
          if (v694 >> 1 > v693)
            v693 = v694 >> 1;
          if ((unint64_t)v694 >= 0x7FFFFFFFFFFFFFFCLL)
            v610 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v610 = v693;
          if (v610)
          {
            v695 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
            v691 = v978;
            v676 = (char *)v979;
          }
          else
          {
            v695 = 0;
          }
          v704 = &v695[4 * v692];
          *(_DWORD *)v704 = v672;
          v690 = (int *)(v704 + 4);
          while (v676 != (char *)v691)
          {
            v705 = *((_DWORD *)v676 - 1);
            v676 -= 4;
            *((_DWORD *)v704 - 1) = v705;
            v704 -= 4;
          }
          v675 = &v695[4 * v610];
          v978 = (unsigned int *)v704;
          v979 = (unsigned int *)v690;
          v980 = v675;
          if (v691)
          {
            operator delete(v691);
            v675 = v980;
          }
        }
        else
        {
          *(_DWORD *)v676 = v672;
          v690 = (int *)(v676 + 4);
        }
        v979 = (unsigned int *)v690;
        if (v690 >= (int *)v675)
        {
          v707 = (int *)v978;
          v708 = ((char *)v690 - (char *)v978) >> 2;
          v709 = v708 + 1;
          if ((unint64_t)(v708 + 1) >> 62)
            goto LABEL_1393;
          v710 = v675 - (char *)v978;
          if (v710 >> 1 > v709)
            v709 = v710 >> 1;
          if ((unint64_t)v710 >= 0x7FFFFFFFFFFFFFFCLL)
            v610 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v610 = v709;
          if (v610)
          {
            v711 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
            v707 = (int *)v978;
            v690 = (int *)v979;
          }
          else
          {
            v711 = 0;
          }
          v720 = (int *)&v711[4 * v708];
          *v720 = v674;
          v706 = v720 + 1;
          while (v690 != v707)
          {
            v721 = *--v690;
            *--v720 = v721;
          }
          v675 = &v711[4 * v610];
          v978 = (unsigned int *)v720;
          v979 = (unsigned int *)v706;
          v980 = v675;
          if (v707)
          {
            operator delete(v707);
            v675 = v980;
          }
        }
        else
        {
          *v690 = v674;
          v706 = v690 + 1;
        }
        v979 = (unsigned int *)v706;
        if (v706 >= (int *)v675)
        {
          v723 = (int *)v978;
          v724 = ((char *)v706 - (char *)v978) >> 2;
          v725 = v724 + 1;
          if ((unint64_t)(v724 + 1) >> 62)
            goto LABEL_1393;
          v726 = v675 - (char *)v978;
          if (v726 >> 1 > v725)
            v725 = v726 >> 1;
          if ((unint64_t)v726 >= 0x7FFFFFFFFFFFFFFCLL)
            v610 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v610 = v725;
          if (v610)
          {
            v727 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
            v723 = (int *)v978;
            v706 = (int *)v979;
          }
          else
          {
            v727 = 0;
          }
          v736 = (int *)&v727[4 * v724];
          *v736 = v673;
          v722 = (char *)(v736 + 1);
          while (v706 != v723)
          {
            v737 = *--v706;
            *--v736 = v737;
          }
          v675 = &v727[4 * v610];
          v978 = (unsigned int *)v736;
          v979 = (unsigned int *)v722;
          v980 = v675;
          if (v723)
          {
            operator delete(v723);
            v675 = v980;
          }
        }
        else
        {
          *v706 = v673;
          v722 = (char *)(v706 + 1);
        }
        v979 = (unsigned int *)v722;
        if (v722 >= v675)
        {
          v739 = v978;
          v740 = (v722 - (char *)v978) >> 2;
          v741 = v740 + 1;
          if ((unint64_t)(v740 + 1) >> 62)
            goto LABEL_1393;
          v742 = v675 - (char *)v978;
          if (v742 >> 1 > v741)
            v741 = v742 >> 1;
          if ((unint64_t)v742 >= 0x7FFFFFFFFFFFFFFCLL)
            v610 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v610 = v741;
          if (v610)
          {
            v743 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
            v739 = v978;
            v722 = (char *)v979;
          }
          else
          {
            v743 = 0;
          }
          v752 = &v743[4 * v740];
          *(_DWORD *)v752 = v671;
          v738 = (int *)(v752 + 4);
          while (v722 != (char *)v739)
          {
            v753 = *((_DWORD *)v722 - 1);
            v722 -= 4;
            *((_DWORD *)v752 - 1) = v753;
            v752 -= 4;
          }
          v675 = &v743[4 * v610];
          v978 = (unsigned int *)v752;
          v979 = (unsigned int *)v738;
          v980 = v675;
          if (v739)
          {
            operator delete(v739);
            v675 = v980;
          }
        }
        else
        {
          *(_DWORD *)v722 = v671;
          v738 = (int *)(v722 + 4);
        }
        v979 = (unsigned int *)v738;
        if (v738 < (int *)v675)
        {
          *v738 = v674;
          v754 = (unsigned int *)(v738 + 1);
          goto LABEL_1247;
        }
        v755 = (int *)v978;
        v756 = ((char *)v738 - (char *)v978) >> 2;
        v757 = v756 + 1;
        if ((unint64_t)(v756 + 1) >> 62)
          goto LABEL_1393;
        v758 = v675 - (char *)v978;
        if (v758 >> 1 > v757)
          v757 = v758 >> 1;
        if ((unint64_t)v758 >= 0x7FFFFFFFFFFFFFFCLL)
          v610 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v610 = v757;
        if (v610)
        {
          v759 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
          v755 = (int *)v978;
          v738 = (int *)v979;
        }
        else
        {
          v759 = 0;
        }
        v768 = &v759[4 * v756];
        *(_DWORD *)v768 = v674;
        v613 = (unsigned int *)(v768 + 4);
        while (v738 != v755)
        {
          v769 = *--v738;
          *((_DWORD *)v768 - 1) = v769;
          v768 -= 4;
        }
LABEL_1260:
        v978 = (unsigned int *)v768;
        v979 = v613;
        v980 = &v759[4 * v610];
        if (v755)
          operator delete(v755);
      }
      else
      {
        if (v613 >= (unsigned int *)v980)
        {
          v683 = v978;
          v684 = v613 - v978;
          v685 = v684 + 1;
          if ((unint64_t)(v684 + 1) >> 62)
            goto LABEL_1393;
          v686 = v980 - (char *)v978;
          if ((v980 - (char *)v978) >> 1 > v685)
            v685 = v686 >> 1;
          if ((unint64_t)v686 >= 0x7FFFFFFFFFFFFFFCLL)
            v610 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v610 = v685;
          if (v610)
          {
            v687 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
            v683 = v978;
            v613 = v979;
          }
          else
          {
            v687 = 0;
          }
          v696 = &v687[4 * v684];
          *(_DWORD *)v696 = v671;
          v677 = (int *)(v696 + 4);
          while (v613 != v683)
          {
            v697 = *--v613;
            *((_DWORD *)v696 - 1) = v697;
            v696 -= 4;
          }
          v675 = &v687[4 * v610];
          v978 = (unsigned int *)v696;
          v979 = (unsigned int *)v677;
          v980 = v675;
          if (v683)
          {
            operator delete(v683);
            v675 = v980;
          }
        }
        else
        {
          *v613 = v671;
          v677 = (int *)(v613 + 1);
        }
        v979 = (unsigned int *)v677;
        if (v677 >= (int *)v675)
        {
          v699 = (int *)v978;
          v700 = ((char *)v677 - (char *)v978) >> 2;
          v701 = v700 + 1;
          if ((unint64_t)(v700 + 1) >> 62)
            goto LABEL_1393;
          v702 = v675 - (char *)v978;
          if (v702 >> 1 > v701)
            v701 = v702 >> 1;
          if ((unint64_t)v702 >= 0x7FFFFFFFFFFFFFFCLL)
            v610 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v610 = v701;
          if (v610)
          {
            v703 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
            v699 = (int *)v978;
            v677 = (int *)v979;
          }
          else
          {
            v703 = 0;
          }
          v712 = (int *)&v703[4 * v700];
          *v712 = v673;
          v698 = v712 + 1;
          while (v677 != v699)
          {
            v713 = *--v677;
            *--v712 = v713;
          }
          v675 = &v703[4 * v610];
          v978 = (unsigned int *)v712;
          v979 = (unsigned int *)v698;
          v980 = v675;
          if (v699)
          {
            operator delete(v699);
            v675 = v980;
          }
        }
        else
        {
          *v677 = v673;
          v698 = v677 + 1;
        }
        v979 = (unsigned int *)v698;
        if (v698 >= (int *)v675)
        {
          v715 = (int *)v978;
          v716 = ((char *)v698 - (char *)v978) >> 2;
          v717 = v716 + 1;
          if ((unint64_t)(v716 + 1) >> 62)
            goto LABEL_1393;
          v718 = v675 - (char *)v978;
          if (v718 >> 1 > v717)
            v717 = v718 >> 1;
          if ((unint64_t)v718 >= 0x7FFFFFFFFFFFFFFCLL)
            v610 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v610 = v717;
          if (v610)
          {
            v719 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
            v715 = (int *)v978;
            v698 = (int *)v979;
          }
          else
          {
            v719 = 0;
          }
          v728 = (int *)&v719[4 * v716];
          *v728 = v673;
          v714 = v728 + 1;
          while (v698 != v715)
          {
            v729 = *--v698;
            *--v728 = v729;
          }
          v675 = &v719[4 * v610];
          v978 = (unsigned int *)v728;
          v979 = (unsigned int *)v714;
          v980 = v675;
          if (v715)
          {
            operator delete(v715);
            v675 = v980;
          }
        }
        else
        {
          *v698 = v673;
          v714 = v698 + 1;
        }
        v979 = (unsigned int *)v714;
        if (v714 >= (int *)v675)
        {
          v731 = (int *)v978;
          v732 = ((char *)v714 - (char *)v978) >> 2;
          v733 = v732 + 1;
          if ((unint64_t)(v732 + 1) >> 62)
            goto LABEL_1393;
          v734 = v675 - (char *)v978;
          if (v734 >> 1 > v733)
            v733 = v734 >> 1;
          if ((unint64_t)v734 >= 0x7FFFFFFFFFFFFFFCLL)
            v610 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v610 = v733;
          if (v610)
          {
            v735 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
            v731 = (int *)v978;
            v714 = (int *)v979;
          }
          else
          {
            v735 = 0;
          }
          v744 = (int *)&v735[4 * v732];
          *v744 = v674;
          v730 = v744 + 1;
          while (v714 != v731)
          {
            v745 = *--v714;
            *--v744 = v745;
          }
          v675 = &v735[4 * v610];
          v978 = (unsigned int *)v744;
          v979 = (unsigned int *)v730;
          v980 = v675;
          if (v731)
          {
            operator delete(v731);
            v675 = v980;
          }
        }
        else
        {
          *v714 = v674;
          v730 = v714 + 1;
        }
        v979 = (unsigned int *)v730;
        if (v730 >= (int *)v675)
        {
          v747 = (int *)v978;
          v748 = ((char *)v730 - (char *)v978) >> 2;
          v749 = v748 + 1;
          if ((unint64_t)(v748 + 1) >> 62)
            goto LABEL_1393;
          v750 = v675 - (char *)v978;
          if (v750 >> 1 > v749)
            v749 = v750 >> 1;
          if ((unint64_t)v750 >= 0x7FFFFFFFFFFFFFFCLL)
            v610 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v610 = v749;
          if (v610)
          {
            v751 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
            v747 = (int *)v978;
            v730 = (int *)v979;
          }
          else
          {
            v751 = 0;
          }
          v760 = (int *)&v751[4 * v748];
          *v760 = v674;
          v746 = (unsigned int *)(v760 + 1);
          while (v730 != v747)
          {
            v761 = *--v730;
            *--v760 = v761;
          }
          v675 = &v751[4 * v610];
          v978 = (unsigned int *)v760;
          v979 = v746;
          v980 = v675;
          if (v747)
          {
            operator delete(v747);
            v675 = v980;
          }
        }
        else
        {
          *v730 = v674;
          v746 = (unsigned int *)(v730 + 1);
        }
        v979 = v746;
        if (v746 >= (unsigned int *)v675)
        {
          v763 = v978;
          v764 = v746 - v978;
          v765 = v764 + 1;
          if ((unint64_t)(v764 + 1) >> 62)
            goto LABEL_1393;
          v766 = v675 - (char *)v978;
          if (v766 >> 1 > v765)
            v765 = v766 >> 1;
          if ((unint64_t)v766 >= 0x7FFFFFFFFFFFFFFCLL)
            v610 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v610 = v765;
          if (v610)
          {
            v767 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
            v763 = v978;
            v746 = v979;
          }
          else
          {
            v767 = 0;
          }
          v770 = &v767[4 * v764];
          *(_DWORD *)v770 = v672;
          v762 = (unsigned int *)(v770 + 4);
          while (v746 != v763)
          {
            v771 = *--v746;
            *((_DWORD *)v770 - 1) = v771;
            v770 -= 4;
          }
          v675 = &v767[4 * v610];
          v978 = (unsigned int *)v770;
          v979 = v762;
          v980 = v675;
          if (v763)
          {
            operator delete(v763);
            v675 = v980;
          }
        }
        else
        {
          *v746 = v672;
          v762 = v746 + 1;
        }
        v979 = v762;
        if (v762 >= (unsigned int *)v675)
        {
          v773 = v978;
          v774 = v762 - v978;
          v775 = v774 + 1;
          if ((unint64_t)(v774 + 1) >> 62)
            goto LABEL_1393;
          v776 = v675 - (char *)v978;
          if (v776 >> 1 > v775)
            v775 = v776 >> 1;
          if ((unint64_t)v776 >= 0x7FFFFFFFFFFFFFFCLL)
            v610 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v610 = v775;
          if (v610)
          {
            v777 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
            v773 = v978;
            v762 = v979;
          }
          else
          {
            v777 = 0;
          }
          v778 = &v777[4 * v774];
          *(_DWORD *)v778 = v672;
          v772 = (unsigned int *)(v778 + 4);
          while (v762 != v773)
          {
            v779 = *--v762;
            *((_DWORD *)v778 - 1) = v779;
            v778 -= 4;
          }
          v675 = &v777[4 * v610];
          v978 = (unsigned int *)v778;
          v979 = v772;
          v980 = v675;
          if (v773)
          {
            operator delete(v773);
            v675 = v980;
          }
        }
        else
        {
          *v762 = v672;
          v772 = v762 + 1;
        }
        v979 = v772;
        if (v772 >= (unsigned int *)v675)
        {
          v755 = (int *)v978;
          v780 = v772 - v978;
          v781 = v780 + 1;
          if ((unint64_t)(v780 + 1) >> 62)
            goto LABEL_1393;
          v782 = v675 - (char *)v978;
          if (v782 >> 1 > v781)
            v781 = v782 >> 1;
          if ((unint64_t)v782 >= 0x7FFFFFFFFFFFFFFCLL)
            v610 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v610 = v781;
          if (v610)
          {
            v759 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
            v755 = (int *)v978;
            v772 = v979;
          }
          else
          {
            v759 = 0;
          }
          v768 = &v759[4 * v780];
          *(_DWORD *)v768 = v671;
          v613 = (unsigned int *)(v768 + 4);
          while (v772 != (unsigned int *)v755)
          {
            v783 = *--v772;
            *((_DWORD *)v768 - 1) = v783;
            v768 -= 4;
          }
          goto LABEL_1260;
        }
        *v772 = v671;
        v754 = v772 + 1;
LABEL_1247:
        v613 = v754;
      }
      v979 = v613;
      if (v668 <= v971)
        continue;
      break;
    }
    v667 = v966;
    if (v966 != HIDWORD(v972) + 2 * (_DWORD)v947 - 2)
      continue;
    break;
  }
LABEL_1264:
  v784 = 0;
  v785 = v970 + ~v971;
  while (2)
  {
    v786 = v784 + 1;
    v787 = (v784 + 1) % v968;
    v788 = v980;
    if (v967 == 2)
    {
      if (v613 >= (unsigned int *)v980)
      {
        v791 = v978;
        v792 = v613 - v978;
        v793 = v792 + 1;
        if ((unint64_t)(v792 + 1) >> 62)
          goto LABEL_1393;
        v794 = v980 - (char *)v978;
        if ((v980 - (char *)v978) >> 1 > v793)
          v793 = v794 >> 1;
        if ((unint64_t)v794 >= 0x7FFFFFFFFFFFFFFCLL)
          v610 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v610 = v793;
        if (v610)
        {
          v795 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
          v791 = v978;
          v613 = v979;
        }
        else
        {
          v795 = 0;
        }
        v801 = &v795[4 * v792];
        *(_DWORD *)v801 = v974;
        v789 = (unsigned int *)(v801 + 4);
        while (v613 != v791)
        {
          v802 = *--v613;
          *((_DWORD *)v801 - 1) = v802;
          v801 -= 4;
        }
        v788 = &v795[4 * v610];
        v978 = (unsigned int *)v801;
        v979 = v789;
        v980 = v788;
        if (v791)
        {
          operator delete(v791);
          v788 = v980;
        }
      }
      else
      {
        *v613 = v974;
        v789 = v613 + 1;
      }
      v979 = v789;
      v803 = v787 + v785;
      if (v789 >= (unsigned int *)v788)
      {
        v805 = v978;
        v806 = v789 - v978;
        v807 = v806 + 1;
        if ((unint64_t)(v806 + 1) >> 62)
          goto LABEL_1393;
        v808 = v788 - (char *)v978;
        if (v808 >> 1 > v807)
          v807 = v808 >> 1;
        if ((unint64_t)v808 >= 0x7FFFFFFFFFFFFFFCLL)
          v610 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v610 = v807;
        if (v610)
        {
          v809 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
          v805 = v978;
          v789 = v979;
        }
        else
        {
          v809 = 0;
        }
        v819 = &v809[4 * v806];
        *(_DWORD *)v819 = v803;
        v804 = (unsigned int *)(v819 + 4);
        while (v789 != v805)
        {
          v820 = *--v789;
          *((_DWORD *)v819 - 1) = v820;
          v819 -= 4;
        }
        v788 = &v809[4 * v610];
        v978 = (unsigned int *)v819;
        v979 = v804;
        v980 = v788;
        if (v805)
        {
          operator delete(v805);
          v788 = v980;
        }
      }
      else
      {
        *v789 = v803;
        v804 = v789 + 1;
      }
      v979 = v804;
      v821 = v784 + v785;
      if (v804 < (unsigned int *)v788)
      {
        *v804 = v821;
        v613 = v804 + 1;
        goto LABEL_1376;
      }
      v822 = v978;
      v823 = v804 - v978;
      v824 = v823 + 1;
      if ((unint64_t)(v823 + 1) >> 62)
        goto LABEL_1393;
      v825 = v788 - (char *)v978;
      if (v825 >> 1 > v824)
        v824 = v825 >> 1;
      if ((unint64_t)v825 >= 0x7FFFFFFFFFFFFFFCLL)
        v610 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v610 = v824;
      if (v610)
      {
        v826 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
        v822 = v978;
        v804 = v979;
      }
      else
      {
        v826 = 0;
      }
      v835 = &v826[4 * v823];
      *(_DWORD *)v835 = v821;
      v613 = (unsigned int *)(v835 + 4);
      while (v804 != v822)
      {
        v836 = *--v804;
        *((_DWORD *)v835 - 1) = v836;
        v835 -= 4;
      }
LABEL_1374:
      v978 = (unsigned int *)v835;
      v979 = v613;
      v980 = &v826[4 * v610];
      if (v822)
        operator delete(v822);
    }
    else
    {
      if (v613 >= (unsigned int *)v980)
      {
        v796 = v978;
        v797 = v613 - v978;
        v798 = v797 + 1;
        if ((unint64_t)(v797 + 1) >> 62)
          goto LABEL_1393;
        v799 = v980 - (char *)v978;
        if ((v980 - (char *)v978) >> 1 > v798)
          v798 = v799 >> 1;
        if ((unint64_t)v799 >= 0x7FFFFFFFFFFFFFFCLL)
          v610 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v610 = v798;
        if (v610)
        {
          v800 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
          v796 = v978;
          v613 = v979;
        }
        else
        {
          v800 = 0;
        }
        v810 = &v800[4 * v797];
        *(_DWORD *)v810 = v974;
        v790 = (unsigned int *)(v810 + 4);
        while (v613 != v796)
        {
          v811 = *--v613;
          *((_DWORD *)v810 - 1) = v811;
          v810 -= 4;
        }
        v788 = &v800[4 * v610];
        v978 = (unsigned int *)v810;
        v979 = v790;
        v980 = v788;
        if (v796)
        {
          operator delete(v796);
          v788 = v980;
        }
      }
      else
      {
        *v613 = v974;
        v790 = v613 + 1;
      }
      v979 = v790;
      v812 = v784 + v785;
      if (v790 >= (unsigned int *)v788)
      {
        v814 = v978;
        v815 = v790 - v978;
        v816 = v815 + 1;
        if ((unint64_t)(v815 + 1) >> 62)
          goto LABEL_1393;
        v817 = v788 - (char *)v978;
        if (v817 >> 1 > v816)
          v816 = v817 >> 1;
        if ((unint64_t)v817 >= 0x7FFFFFFFFFFFFFFCLL)
          v610 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v610 = v816;
        if (v610)
        {
          v818 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
          v814 = v978;
          v790 = v979;
        }
        else
        {
          v818 = 0;
        }
        v827 = &v818[4 * v815];
        *(_DWORD *)v827 = v812;
        v813 = (unsigned int *)(v827 + 4);
        while (v790 != v814)
        {
          v828 = *--v790;
          *((_DWORD *)v827 - 1) = v828;
          v827 -= 4;
        }
        v788 = &v818[4 * v610];
        v978 = (unsigned int *)v827;
        v979 = v813;
        v980 = v788;
        if (v814)
        {
          operator delete(v814);
          v788 = v980;
        }
      }
      else
      {
        *v790 = v812;
        v813 = v790 + 1;
      }
      v979 = v813;
      if (v813 >= (unsigned int *)v788)
      {
        v830 = v978;
        v831 = v813 - v978;
        v832 = v831 + 1;
        if ((unint64_t)(v831 + 1) >> 62)
          goto LABEL_1393;
        v833 = v788 - (char *)v978;
        if (v833 >> 1 > v832)
          v832 = v833 >> 1;
        if ((unint64_t)v833 >= 0x7FFFFFFFFFFFFFFCLL)
          v610 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v610 = v832;
        if (v610)
        {
          v834 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
          v830 = v978;
          v813 = v979;
        }
        else
        {
          v834 = 0;
        }
        v837 = &v834[4 * v831];
        *(_DWORD *)v837 = v812;
        v829 = (unsigned int *)(v837 + 4);
        while (v813 != v830)
        {
          v838 = *--v813;
          *((_DWORD *)v837 - 1) = v838;
          v837 -= 4;
        }
        v788 = &v834[4 * v610];
        v978 = (unsigned int *)v837;
        v979 = v829;
        v980 = v788;
        if (v830)
        {
          operator delete(v830);
          v788 = v980;
        }
      }
      else
      {
        *v813 = v812;
        v829 = v813 + 1;
      }
      v979 = v829;
      v839 = v787 + v785;
      if (v829 >= (unsigned int *)v788)
      {
        v822 = v978;
        v840 = v829 - v978;
        v841 = v840 + 1;
        if ((unint64_t)(v840 + 1) >> 62)
          goto LABEL_1393;
        v842 = v788 - (char *)v978;
        if (v842 >> 1 > v841)
          v841 = v842 >> 1;
        if ((unint64_t)v842 >= 0x7FFFFFFFFFFFFFFCLL)
          v610 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v610 = v841;
        if (v610)
        {
          v826 = (char *)sub_1DCAE4D04((uint64_t)&v980, v610);
          v822 = v978;
          v829 = v979;
        }
        else
        {
          v826 = 0;
        }
        v835 = &v826[4 * v840];
        *(_DWORD *)v835 = v839;
        v613 = (unsigned int *)(v835 + 4);
        while (v829 != v822)
        {
          v843 = *--v829;
          *((_DWORD *)v835 - 1) = v843;
          v835 -= 4;
        }
        goto LABEL_1374;
      }
      *v829 = v839;
      v613 = v829 + 1;
    }
LABEL_1376:
    v979 = v613;
    v784 = v786;
    if (v786 <= v971)
      continue;
    break;
  }
  objc_msgSend_name(v958, (const char *)v610, v611);
  v579 = (id)objc_claimAutoreleasedReturnValue();
  v580 = v949;
  if (!v580)
    v580 = objc_alloc_init(MDLMeshBufferDataAllocator);
  v844 = objc_alloc(MEMORY[0x1E0C99D50]);
  v583 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v844, v845, (uint64_t)v978, (char *)v979 - (char *)v978, 0);
  v585 = (void *)objc_msgSend_newBufferWithData_type_(v580, v846, (uint64_t)v583, 2);
  if (objc_msgSend_conformsToProtocol_(v585, v847, (uint64_t)&unk_1F03B6D88))
  {
    v848 = v585;
    objc_msgSend_stringByAppendingString_(v579, v849, (uint64_t)CFSTR("-Indices"));
    v850 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v848, v851, (uint64_t)v850);

  }
  v852 = [MDLMaterial alloc];
  v853 = (void *)objc_opt_new();
  v594 = (void *)objc_msgSend_initWithName_scatteringFunction_(v852, v854, (uint64_t)CFSTR("material"), v853);

  objc_msgSend_propertyWithSemantic_(v594, v855, 2);
  v856 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v857) = 1063675494;
  objc_msgSend_setFloatValue_(v856, v858, v859, v857);
  objc_msgSend_propertyWithSemantic_(v594, v860, 6);
  v861 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v862) = 1058642330;
  objc_msgSend_setFloatValue_(v861, v863, v864, v862);
  objc_msgSend_propertyWithSemantic_(v594, v865, 0);
  v866 = (void *)objc_claimAutoreleasedReturnValue();

  v867 = [MDLSubmesh alloc];
  v609 = (void *)objc_msgSend_initWithIndexBuffer_indexCount_indexType_geometryType_material_(v867, v868, (uint64_t)v585, v979 - v978, 32, v967, v594);

LABEL_1382:
  if (v978)
  {
    v979 = v978;
    operator delete(v978);
  }
  objc_msgSend_setVertexCount_(v958, v869, (v988 - v987) / 3uLL);
  v870 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend_setSubmeshes_(v958, v871, (uint64_t)v870);

  objc_msgSend_submeshes(v958, v872, v873);
  v874 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v874, v875, (uint64_t)v609);

  v876 = objc_alloc_init(MDLVertexDescriptor);
  objc_msgSend_attributes(v876, v877, v878);
  v879 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v879, v880, 0);
  v881 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v881, v882, (uint64_t)CFSTR("position"));

  objc_msgSend_attributes(v876, v883, v884);
  v885 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v885, v886, 0);
  v887 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFormat_(v887, v888, 786435);

  objc_msgSend_attributes(v876, v889, v890);
  v891 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v891, v892, 0);
  v893 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBufferIndex_(v893, v894, 0);

  objc_msgSend_attributes(v876, v895, v896);
  v897 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v897, v898, 1);
  v899 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v899, v900, (uint64_t)CFSTR("normal"));

  objc_msgSend_attributes(v876, v901, v902);
  v903 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v903, v904, 1);
  v905 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFormat_(v905, v906, 786435);

  objc_msgSend_attributes(v876, v907, v908);
  v909 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v909, v910, 1);
  v911 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBufferIndex_(v911, v912, 0);

  objc_msgSend_attributes(v876, v913, v914);
  v915 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v915, v916, 2);
  v917 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v917, v918, (uint64_t)CFSTR("textureCoordinate"));

  objc_msgSend_attributes(v876, v919, v920);
  v921 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v921, v922, 2);
  v923 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFormat_(v923, v924, 786434);

  objc_msgSend_attributes(v876, v925, v926);
  v927 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v927, v928, 2);
  v929 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBufferIndex_(v929, v930, 0);

  objc_msgSend_setPackedOffsets(v876, v931, v932);
  objc_msgSend_setPackedStrides(v876, v933, v934);
  v935 = [MDLAsset alloc];
  objc_msgSend_vertexDescriptor(v958, v936, v937);
  v938 = (void *)objc_claimAutoreleasedReturnValue();
  v940 = (void *)objc_msgSend_initWithURL_vertexDescriptor_bufferAllocator_(v935, v939, 0, v938, v949);

  objc_msgSend_addObject_(v940, v941, (uint64_t)v958);
  objc_msgSend__conformVertexBuffers_error_(v940, v942, (uint64_t)v876, 0);
  objc_msgSend_removeObject_(v940, v943, (uint64_t)v958);

  if (v981)
  {
    v982 = v981;
    operator delete(v981);
  }
  if (v984)
  {
    v985 = v984;
    operator delete(v984);
  }
  if (v987)
  {
    v988 = v987;
    operator delete(v987);
  }
  objc_autoreleasePoolPop(context);
  inited = v958;

  v15 = v949;
LABEL_1391:

  return inited;
}

+ (MDLMesh)newCapsuleWithHeight:(float)height radii:(vector_float2)radii radialSegments:(NSUInteger)radialSegments verticalSegments:(NSUInteger)verticalSegments hemisphereSegments:(NSUInteger)hemisphereSegments geometryType:(MDLGeometryType)geometryType inwardNormals:(BOOL)inwardNormals allocator:(id)allocator
{
  _BOOL8 v10;
  unsigned int v13;
  unsigned int v14;
  id v15;
  MDLMesh *v16;
  const char *v17;
  MDLMesh *inited;
  __int32 v21;

  v10 = inwardNormals;
  v13 = verticalSegments;
  v14 = radialSegments;
  v21 = radii.i32[0];
  v15 = allocator;
  v16 = [MDLMesh alloc];
  inited = (MDLMesh *)objc_msgSend_initCapsuleWithExtent_cylinderSegments_hemisphereSegments_inwardNormals_geometryType_allocator_(v16, v17, hemisphereSegments, v10, geometryType, v15, COERCE_DOUBLE(__PAIR64__(LODWORD(height), v21)), COERCE_DOUBLE(__PAIR64__(v13, v14)));

  return inited;
}

- (MDLMesh)initPlaneWithExtent:(vector_float3)extent segments:(vector_uint2)segments geometryType:(MDLGeometryType)geometryType allocator:(id)allocator
{
  int32x2_t v6;
  uint64_t v7;
  int32x2_t v8;
  const char *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  const char *v17;
  MDLMesh *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int32x2_t v25;
  float v26;
  void *v27;
  int32x2_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  int v32;
  float32x4_t v33;
  int32x4_t v34;
  __int32 v35;
  __int32 v36;
  uint64_t v37;
  float v38;
  int v39;
  float v40;
  float v41;
  float32x4_t v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  int v52;
  __int32 v53;
  char *v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  char *v59;
  __int32 *v60;
  __int32 v61;
  char *v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  int v69;
  float v70;
  float *v71;
  float *v72;
  float *v73;
  float *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  char *v78;
  float *v79;
  int v80;
  float *v81;
  float *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  char *v86;
  float *v87;
  int v88;
  char *v89;
  char *v90;
  char *v91;
  char *v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  char *v96;
  __int32 *v97;
  __int32 v98;
  char *v99;
  char *v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;
  int v106;
  char *v107;
  char *v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  int v114;
  BOOL v115;
  void *v116;
  void *v117;
  const char *v118;
  void *v119;
  id v120;
  const char *v121;
  void *v122;
  const char *v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  void *v129;
  id v130;
  const char *v131;
  void *v132;
  const char *v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  void *v139;
  id v140;
  const char *v141;
  void *v142;
  const char *v143;
  char *v144;
  int v145;
  int v146;
  char *v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  char *v154;
  __int16 v155;
  int v156;
  int v157;
  __int16 v158;
  __int16 v159;
  char *v160;
  __int16 v161;
  char *v162;
  char *v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  char *v170;
  __int16 v171;
  __int16 v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  unint64_t v177;
  uint64_t v178;
  char *v179;
  char *v180;
  __int16 v181;
  __int16 v182;
  char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  char *v188;
  char *v189;
  __int16 v190;
  int v191;
  int v192;
  __int16 v193;
  __int16 v194;
  __int16 v195;
  char *v196;
  char *v197;
  char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  char *v203;
  char *v204;
  __int16 v205;
  char *v206;
  char *v207;
  uint64_t v208;
  uint64_t v209;
  unint64_t v210;
  unint64_t v211;
  uint64_t v212;
  char *v213;
  char *v214;
  __int16 v215;
  char *v216;
  char *v217;
  uint64_t v218;
  uint64_t v219;
  unint64_t v220;
  unint64_t v221;
  uint64_t v222;
  char *v223;
  char *v224;
  __int16 v225;
  __int16 v226;
  char *v227;
  uint64_t v228;
  uint64_t v229;
  unint64_t v230;
  unint64_t v231;
  uint64_t v232;
  char *v233;
  char *v234;
  __int16 v235;
  int v236;
  __int16 v237;
  char *v238;
  char *v239;
  char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  char *v245;
  char *v246;
  __int16 v247;
  __int16 v248;
  char *v249;
  uint64_t v250;
  uint64_t v251;
  unint64_t v252;
  unint64_t v253;
  uint64_t v254;
  char *v255;
  char *v256;
  __int16 v257;
  int v258;
  __int16 v259;
  char *v260;
  char *v261;
  char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  char *v267;
  char *v268;
  __int16 v269;
  __int16 v270;
  char *v271;
  uint64_t v272;
  uint64_t v273;
  unint64_t v274;
  unint64_t v275;
  uint64_t v276;
  char *v277;
  char *v278;
  __int16 v279;
  int v280;
  int v281;
  __int16 v282;
  __int16 v283;
  char *v284;
  char *v285;
  char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  char *v291;
  char *v292;
  __int16 v293;
  __int16 v294;
  char *v295;
  char *v296;
  uint64_t v297;
  uint64_t v298;
  unint64_t v299;
  unint64_t v300;
  uint64_t v301;
  char *v302;
  char *v303;
  __int16 v304;
  __int16 v305;
  __int16 v306;
  char *v307;
  char *v308;
  uint64_t v309;
  uint64_t v310;
  unint64_t v311;
  unint64_t v312;
  uint64_t v313;
  char *v314;
  char *v315;
  __int16 v316;
  char *v317;
  uint64_t v318;
  uint64_t v319;
  unint64_t v320;
  unint64_t v321;
  uint64_t v322;
  char *v323;
  char *v324;
  __int16 v325;
  int v326;
  int v327;
  __int16 v328;
  __int16 v329;
  char *v330;
  char *v331;
  char *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  char *v337;
  char *v338;
  __int16 v339;
  char *v340;
  char *v341;
  uint64_t v342;
  uint64_t v343;
  unint64_t v344;
  unint64_t v345;
  uint64_t v346;
  char *v347;
  char *v348;
  __int16 v349;
  __int16 v350;
  __int16 v351;
  char *v352;
  char *v353;
  uint64_t v354;
  uint64_t v355;
  unint64_t v356;
  unint64_t v357;
  uint64_t v358;
  char *v359;
  char *v360;
  __int16 v361;
  char *v362;
  char *v363;
  uint64_t v364;
  uint64_t v365;
  unint64_t v366;
  unint64_t v367;
  uint64_t v368;
  char *v369;
  char *v370;
  __int16 v371;
  char *v372;
  char *v373;
  uint64_t v374;
  uint64_t v375;
  unint64_t v376;
  unint64_t v377;
  uint64_t v378;
  char *v379;
  char *v380;
  __int16 v381;
  __int16 v382;
  char *v383;
  uint64_t v384;
  uint64_t v385;
  unint64_t v386;
  unint64_t v387;
  uint64_t v388;
  char *v389;
  char *v390;
  __int16 v391;
  id v392;
  const char *v393;
  void *v394;
  const char *v395;
  void *v396;
  const char *v397;
  id v398;
  const char *v399;
  uint64_t v400;
  void *v401;
  const char *v402;
  void *v403;
  const char *v404;
  MDLMaterial *v405;
  const char *v406;
  uint64_t v407;
  void *v408;
  const char *v409;
  void *v410;
  void *v411;
  const char *v412;
  void *v413;
  MDLSubmesh *v414;
  const char *v415;
  void *v416;
  const char *v417;
  id v418;
  const char *v419;
  const char *v420;
  MDLVertexDescriptor *v421;
  const char *v422;
  uint64_t v423;
  void *v424;
  const char *v425;
  void *v426;
  const char *v427;
  const char *v428;
  uint64_t v429;
  void *v430;
  const char *v431;
  void *v432;
  const char *v433;
  const char *v434;
  uint64_t v435;
  void *v436;
  const char *v437;
  void *v438;
  const char *v439;
  const char *v440;
  uint64_t v441;
  void *v442;
  const char *v443;
  void *v444;
  const char *v445;
  const char *v446;
  uint64_t v447;
  void *v448;
  const char *v449;
  void *v450;
  const char *v451;
  const char *v452;
  uint64_t v453;
  void *v454;
  const char *v455;
  void *v456;
  const char *v457;
  const char *v458;
  uint64_t v459;
  void *v460;
  const char *v461;
  void *v462;
  const char *v463;
  const char *v464;
  uint64_t v465;
  void *v466;
  const char *v467;
  void *v468;
  const char *v469;
  const char *v470;
  uint64_t v471;
  void *v472;
  const char *v473;
  void *v474;
  const char *v475;
  const char *v476;
  uint64_t v477;
  const char *v478;
  uint64_t v479;
  MDLAsset *v480;
  const char *v481;
  uint64_t v482;
  void *v483;
  const char *v484;
  void *v485;
  const char *v486;
  const char *v487;
  const char *v488;
  MDLMesh *v489;
  unsigned int v491;
  void *context;
  uint64_t v493;
  void *v494;
  MDLMesh *v495;
  float v496;
  float v497;
  float32x4_t v498;
  __int16 v499;
  int32x4_t v500;
  __int32 v501;
  int32x4_t v502;
  __int128 v503;
  float32x4_t v504;
  int v505;
  float32x4_t v506;
  float32x4_t v507;
  int v508;
  int v509;
  int v510;
  __int16 v511;
  char *__p;
  char *v513;
  char *v514;
  float *v515;
  float *v516;
  float *v517;
  char *v518;
  char *v519;
  char *v520;
  char *v521;
  char *v522;
  _QWORD v523[2];

  v7 = extent.i64[0];
  v8 = v6;
  v503 = *(_OWORD *)segments.i8;
  v12 = (id)extent.i64[1];
  if (v7 >= 5)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v13, v17, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: invalid geometryType requested"), v15, v16);

  }
  v18 = (MDLMesh *)(id)objc_msgSend_initWithBufferAllocator_(self, v11, (uint64_t)v12);

  if (!v18)
  {
    v27 = v12;
    goto LABEL_564;
  }
  v495 = v18;
  objc_msgSend_allocator(v18, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend_setName_(v495, v22, (uint64_t)CFSTR("plane"));
  v494 = (void *)v21;
  v24 = MEMORY[0x1DF0D25C8](v23);
  v25 = vmax_s32(v8, (int32x2_t)0x100000001);
  v26 = *((float *)&v503 + 1);
  v500 = (int32x4_t)xmmword_1DCC58380;
  v502 = (int32x4_t)xmmword_1DCC56FD0;
  if (*((float *)&v503 + 1) >= *(float *)&v503 || *((float *)&v503 + 1) >= *((float *)&v503 + 2))
  {
    if (*((float *)&v503 + 2) < *(float *)&v503 && *((float *)&v503 + 2) < *((float *)&v503 + 1))
    {
      v500 = (int32x4_t)xmmword_1DCC583A0;
      goto LABEL_12;
    }
    v502 = (int32x4_t)xmmword_1DCC583A0;
    LODWORD(v503) = DWORD1(v503);
  }
  v26 = *((float *)&v503 + 2);
LABEL_12:
  *(int32x2_t *)v506.f32 = v25;
  v28 = vadd_s32(v25, (int32x2_t)0x100000001);
  v499 = v28.i16[0];
  v29 = (v28.i32[1] * v28.i32[0]);
  v521 = 0;
  v522 = 0;
  v523[0] = 0;
  sub_1DCB0BBF4((void **)&v521, 3 * v29);
  v518 = 0;
  v519 = 0;
  v520 = 0;
  sub_1DCB0BBF4((void **)&v518, 3 * v29);
  context = (void *)v24;
  v493 = v7;
  v491 = v29;
  v515 = 0;
  v516 = 0;
  v517 = 0;
  sub_1DCB0BBF4((void **)&v515, 2 * v29);
  v32 = 0;
  v33 = vmlaq_f32(vnegq_f32(vmulq_f32((float32x4_t)v500, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v502, v502), (int8x16_t)v502, 0xCuLL))), (float32x4_t)v502, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v500, v500), (int8x16_t)v500, 0xCuLL));
  v34 = (int32x4_t)vmulq_f32(v33, (float32x4_t)0);
  v35 = v506.i32[0];
  v498 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v34, v34), (int8x16_t)v34, 0xCuLL);
  v501 = v506.i32[1];
  v36 = v33.i32[2];
  v37 = v33.i64[0];
  v496 = 1.0 / (float)v506.i32[1];
  v497 = v26 * 0.5;
  v38 = 1.0 / (float)v506.i32[0];
  do
  {
    v39 = 0;
    v40 = v26;
    v504 = vmlaq_n_f32(v498, (float32x4_t)v500, -(float)(v497 - (float)((float)(v26 * (float)v32) * v496)));
    v41 = (float)v32 * v496;
    do
    {
      v42 = vmlaq_n_f32(v504, (float32x4_t)v502, -(float)((float)(*(float *)&v503 * 0.5) - (float)((float)(*(float *)&v503 * (float)v39) * v38)));
      v44 = v522;
      v43 = (char *)v523[0];
      v507 = v42;
      if ((unint64_t)v522 >= v523[0])
      {
        v46 = v521;
        v47 = (v522 - v521) >> 2;
        v48 = v47 + 1;
        if ((unint64_t)(v47 + 1) >> 62)
          sub_1DCAE4C44();
        v49 = v523[0] - (_QWORD)v521;
        if ((uint64_t)(v523[0] - (_QWORD)v521) >> 1 > v48)
          v48 = v49 >> 1;
        if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFFCLL)
          v30 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v30 = v48;
        if (v30)
        {
          v50 = (char *)sub_1DCAE4D04((uint64_t)v523, v30);
          v46 = v521;
          v44 = v522;
        }
        else
        {
          v50 = 0;
        }
        v51 = &v50[4 * v47];
        *(_DWORD *)v51 = v507.i32[0];
        v45 = v51 + 4;
        while (v44 != v46)
        {
          v52 = *((_DWORD *)v44 - 1);
          v44 -= 4;
          *((_DWORD *)v51 - 1) = v52;
          v51 -= 4;
        }
        v43 = &v50[4 * v30];
        v521 = v51;
        v522 = v45;
        v523[0] = v43;
        if (v46)
        {
          operator delete(v46);
          v43 = (char *)v523[0];
        }
        v42.i32[1] = v507.i32[1];
      }
      else
      {
        *(_DWORD *)v522 = v42.i32[0];
        v45 = v44 + 4;
      }
      v522 = v45;
      v53 = v42.i32[1];
      if (v45 >= v43)
      {
        v55 = v521;
        v56 = (v45 - v521) >> 2;
        v57 = v56 + 1;
        if ((unint64_t)(v56 + 1) >> 62)
          sub_1DCAE4C44();
        v58 = v43 - v521;
        if (v58 >> 1 > v57)
          v57 = v58 >> 1;
        if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFFCLL)
          v30 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v30 = v57;
        if (v30)
        {
          v59 = (char *)sub_1DCAE4D04((uint64_t)v523, v30);
          v55 = v521;
          v45 = v522;
        }
        else
        {
          v59 = 0;
        }
        v60 = (__int32 *)&v59[4 * v56];
        *v60 = v53;
        v54 = (char *)(v60 + 1);
        while (v45 != v55)
        {
          v61 = *((_DWORD *)v45 - 1);
          v45 -= 4;
          *--v60 = v61;
        }
        v43 = &v59[4 * v30];
        v521 = (char *)v60;
        v522 = v54;
        v523[0] = v43;
        if (v55)
        {
          operator delete(v55);
          v43 = (char *)v523[0];
        }
      }
      else
      {
        *(_DWORD *)v45 = v42.i32[1];
        v54 = v45 + 4;
      }
      v522 = v54;
      if (v54 >= v43)
      {
        v63 = v521;
        v64 = (v54 - v521) >> 2;
        v65 = v64 + 1;
        if ((unint64_t)(v64 + 1) >> 62)
          sub_1DCAE4C44();
        v66 = v43 - v521;
        if (v66 >> 1 > v65)
          v65 = v66 >> 1;
        if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFFCLL)
          v30 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v30 = v65;
        if (v30)
        {
          v67 = (char *)sub_1DCAE4D04((uint64_t)v523, v30);
          v63 = v521;
          v54 = v522;
        }
        else
        {
          v67 = 0;
        }
        v68 = &v67[4 * v64];
        *(_DWORD *)v68 = v507.i32[2];
        v62 = v68 + 4;
        while (v54 != v63)
        {
          v69 = *((_DWORD *)v54 - 1);
          v54 -= 4;
          *((_DWORD *)v68 - 1) = v69;
          v68 -= 4;
        }
        v521 = v68;
        v522 = v62;
        v523[0] = &v67[4 * v30];
        if (v63)
          operator delete(v63);
      }
      else
      {
        *(_DWORD *)v54 = v507.i32[2];
        v62 = v54 + 4;
      }
      v522 = v62;
      v70 = (float)v39 * v38;
      v72 = v516;
      v71 = v517;
      if (v516 >= v517)
      {
        v74 = v515;
        v75 = v516 - v515;
        v76 = v75 + 1;
        if ((unint64_t)(v75 + 1) >> 62)
          sub_1DCAE4C44();
        v77 = (char *)v517 - (char *)v515;
        if (((char *)v517 - (char *)v515) >> 1 > v76)
          v76 = v77 >> 1;
        if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFFCLL)
          v30 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v30 = v76;
        if (v30)
        {
          v78 = (char *)sub_1DCAE4D04((uint64_t)&v517, v30);
          v74 = v515;
          v72 = v516;
        }
        else
        {
          v78 = 0;
        }
        v79 = (float *)&v78[4 * v75];
        *v79 = v70;
        v73 = v79 + 1;
        while (v72 != v74)
        {
          v80 = *((_DWORD *)v72-- - 1);
          *((_DWORD *)v79-- - 1) = v80;
        }
        v71 = (float *)&v78[4 * v30];
        v515 = v79;
        v516 = v73;
        v517 = v71;
        if (v74)
        {
          operator delete(v74);
          v71 = v517;
        }
      }
      else
      {
        *v516 = v70;
        v73 = v72 + 1;
      }
      v516 = v73;
      if (v73 >= v71)
      {
        v82 = v515;
        v83 = v73 - v515;
        v84 = v83 + 1;
        if ((unint64_t)(v83 + 1) >> 62)
          sub_1DCAE4C44();
        v85 = (char *)v71 - (char *)v515;
        if (v85 >> 1 > v84)
          v84 = v85 >> 1;
        if ((unint64_t)v85 >= 0x7FFFFFFFFFFFFFFCLL)
          v30 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v30 = v84;
        if (v30)
        {
          v86 = (char *)sub_1DCAE4D04((uint64_t)&v517, v30);
          v82 = v515;
          v73 = v516;
        }
        else
        {
          v86 = 0;
        }
        v87 = (float *)&v86[4 * v83];
        *v87 = v41;
        v81 = v87 + 1;
        while (v73 != v82)
        {
          v88 = *((_DWORD *)v73-- - 1);
          *((_DWORD *)v87-- - 1) = v88;
        }
        v515 = v87;
        v516 = v81;
        v517 = (float *)&v86[4 * v30];
        if (v82)
          operator delete(v82);
      }
      else
      {
        *v73 = v41;
        v81 = v73 + 1;
      }
      v516 = v81;
      v90 = v519;
      v89 = v520;
      if (v519 >= v520)
      {
        v92 = v518;
        v93 = (v519 - v518) >> 2;
        v94 = v93 + 1;
        if ((unint64_t)(v93 + 1) >> 62)
          sub_1DCAE4C44();
        v95 = v520 - v518;
        if ((v520 - v518) >> 1 > v94)
          v94 = v95 >> 1;
        if ((unint64_t)v95 >= 0x7FFFFFFFFFFFFFFCLL)
          v30 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v30 = v94;
        if (v30)
        {
          v96 = (char *)sub_1DCAE4D04((uint64_t)&v520, v30);
          v92 = v518;
          v90 = v519;
        }
        else
        {
          v96 = 0;
        }
        v97 = (__int32 *)&v96[4 * v93];
        *v97 = v36;
        v91 = (char *)(v97 + 1);
        while (v90 != v92)
        {
          v98 = *((_DWORD *)v90 - 1);
          v90 -= 4;
          *--v97 = v98;
        }
        v89 = &v96[4 * v30];
        v518 = (char *)v97;
        v519 = v91;
        v520 = v89;
        if (v92)
        {
          operator delete(v92);
          v89 = v520;
        }
      }
      else
      {
        *(_DWORD *)v519 = v36;
        v91 = v90 + 4;
      }
      v519 = v91;
      if (v91 >= v89)
      {
        v100 = v518;
        v101 = (v91 - v518) >> 2;
        v102 = v101 + 1;
        if ((unint64_t)(v101 + 1) >> 62)
          sub_1DCAE4C44();
        v103 = v89 - v518;
        if (v103 >> 1 > v102)
          v102 = v103 >> 1;
        if ((unint64_t)v103 >= 0x7FFFFFFFFFFFFFFCLL)
          v30 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v30 = v102;
        if (v30)
        {
          v104 = (char *)sub_1DCAE4D04((uint64_t)&v520, v30);
          v100 = v518;
          v91 = v519;
        }
        else
        {
          v104 = 0;
        }
        v105 = &v104[4 * v101];
        *(_DWORD *)v105 = v37;
        v99 = v105 + 4;
        while (v91 != v100)
        {
          v106 = *((_DWORD *)v91 - 1);
          v91 -= 4;
          *((_DWORD *)v105 - 1) = v106;
          v105 -= 4;
        }
        v89 = &v104[4 * v30];
        v518 = v105;
        v519 = v99;
        v520 = v89;
        if (v100)
        {
          operator delete(v100);
          v89 = v520;
        }
      }
      else
      {
        *(_DWORD *)v91 = v37;
        v99 = v91 + 4;
      }
      v519 = v99;
      if (v99 >= v89)
      {
        v108 = v518;
        v109 = (v99 - v518) >> 2;
        v110 = v109 + 1;
        if ((unint64_t)(v109 + 1) >> 62)
          sub_1DCAE4C44();
        v111 = v89 - v518;
        if (v111 >> 1 > v110)
          v110 = v111 >> 1;
        if ((unint64_t)v111 >= 0x7FFFFFFFFFFFFFFCLL)
          v30 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v30 = v110;
        if (v30)
        {
          v112 = (char *)sub_1DCAE4D04((uint64_t)&v520, v30);
          v108 = v518;
          v99 = v519;
        }
        else
        {
          v112 = 0;
        }
        v113 = &v112[4 * v109];
        *(_DWORD *)v113 = HIDWORD(v37);
        v107 = v113 + 4;
        while (v99 != v108)
        {
          v114 = *((_DWORD *)v99 - 1);
          v99 -= 4;
          *((_DWORD *)v113 - 1) = v114;
          v113 -= 4;
        }
        v518 = v113;
        v519 = v107;
        v520 = &v112[4 * v30];
        if (v108)
          operator delete(v108);
      }
      else
      {
        *(_DWORD *)v99 = HIDWORD(v37);
        v107 = v99 + 4;
      }
      v519 = v107;
      v115 = v39++ == v35;
    }
    while (!v115);
    v115 = v32++ == v501;
    v26 = v40;
  }
  while (!v115);
  v116 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(v495, (const char *)v30, v31);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v116, v118, (uint64_t)CFSTR("%@-%@"), v117, CFSTR("position"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_alloc(MEMORY[0x1E0C99D50]);
  v122 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v120, v121, (uint64_t)v521, v522 - v521, 0);
  objc_msgSend_addAttributeWithName_format_type_data_stride_(v495, v123, (uint64_t)v119, 786435, CFSTR("position"), v122, 12);

  v124 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(v495, v125, v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v124, v128, (uint64_t)CFSTR("%@-%@"), v127, CFSTR("normal"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = objc_alloc(MEMORY[0x1E0C99D50]);
  v132 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v130, v131, (uint64_t)v518, v519 - v518, 0);
  objc_msgSend_addAttributeWithName_format_type_data_stride_(v495, v133, (uint64_t)v129, 786435, CFSTR("normal"), v132, 12);

  v134 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(v495, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v134, v138, (uint64_t)CFSTR("%@-%@"), v137, CFSTR("textureCoordinate"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = objc_alloc(MEMORY[0x1E0C99D50]);
  v142 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v140, v141, (uint64_t)v515, (char *)v516 - (char *)v515, 0);
  objc_msgSend_addAttributeWithName_format_type_data_stride_(v495, v143, (uint64_t)v139, 786434, CFSTR("textureCoordinate"), v142, 8);

  __p = 0;
  v513 = 0;
  v514 = 0;
  switch(v493)
  {
    case 0:
      v144 = 0;
      v145 = 0;
      if (v491 <= 1)
        v146 = 1;
      else
        v146 = v491;
      do
      {
        if (v144 >= v514)
        {
          v148 = __p;
          v149 = v144 - __p;
          if (v144 - __p <= -3)
            sub_1DCAE4C44();
          v150 = v149 >> 1;
          if (v514 - __p <= (unint64_t)((v149 >> 1) + 1))
            v151 = v150 + 1;
          else
            v151 = v514 - __p;
          if ((unint64_t)(v514 - __p) >= 0x7FFFFFFFFFFFFFFELL)
            v152 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v152 = v151;
          if (v152)
          {
            v153 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v152);
            v148 = __p;
            v144 = v513;
          }
          else
          {
            v153 = 0;
          }
          v154 = &v153[2 * v150];
          *(_WORD *)v154 = v145;
          v147 = v154 + 2;
          while (v144 != v148)
          {
            v155 = *((_WORD *)v144 - 1);
            v144 -= 2;
            *((_WORD *)v154 - 1) = v155;
            v154 -= 2;
          }
          __p = v154;
          v514 = &v153[2 * v152];
          if (v148)
            operator delete(v148);
        }
        else
        {
          *(_WORD *)v144 = v145;
          v147 = v144 + 2;
        }
        v513 = v147;
        ++v145;
        v144 = v147;
      }
      while (v145 != v146);
      break;
    case 1:
      v147 = 0;
      v191 = 0;
      do
      {
        v192 = 0;
        v509 = v191;
        v193 = v191 * v499;
        do
        {
          v194 = v192 + v193;
          v195 = v192 + v193 + 1;
          v196 = v514;
          if (v147 >= v514)
          {
            v198 = __p;
            v199 = v147 - __p;
            if (v147 - __p <= -3)
              sub_1DCAE4C44();
            v200 = v199 >> 1;
            if (v514 - __p <= (unint64_t)((v199 >> 1) + 1))
              v201 = v200 + 1;
            else
              v201 = v514 - __p;
            if ((unint64_t)(v514 - __p) >= 0x7FFFFFFFFFFFFFFELL)
              v202 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v202 = v201;
            if (v202)
            {
              v203 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v202);
              v198 = __p;
              v147 = v513;
            }
            else
            {
              v203 = 0;
            }
            v204 = &v203[2 * v200];
            *(_WORD *)v204 = v195;
            v197 = v204 + 2;
            while (v147 != v198)
            {
              v205 = *((_WORD *)v147 - 1);
              v147 -= 2;
              *((_WORD *)v204 - 1) = v205;
              v204 -= 2;
            }
            v196 = &v203[2 * v202];
            __p = v204;
            v514 = v196;
            if (v198)
            {
              operator delete(v198);
              v196 = v514;
            }
          }
          else
          {
            *(_WORD *)v147 = v195;
            v197 = v147 + 2;
          }
          if (v197 >= v196)
          {
            v207 = __p;
            v208 = v197 - __p;
            if (v197 - __p <= -3)
              sub_1DCAE4C44();
            v209 = v208 >> 1;
            v210 = v196 - __p;
            if (v210 <= (v208 >> 1) + 1)
              v211 = v209 + 1;
            else
              v211 = v210;
            if (v210 >= 0x7FFFFFFFFFFFFFFELL)
              v212 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v212 = v211;
            if (v212)
            {
              v213 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v212);
              v207 = __p;
            }
            else
            {
              v213 = 0;
            }
            v214 = &v213[2 * v209];
            *(_WORD *)v214 = v194;
            v206 = v214 + 2;
            while (v197 != v207)
            {
              v215 = *((_WORD *)v197 - 1);
              v197 -= 2;
              *((_WORD *)v214 - 1) = v215;
              v214 -= 2;
            }
            v196 = &v213[2 * v212];
            __p = v214;
            v514 = v196;
            if (v207)
            {
              operator delete(v207);
              v196 = v514;
            }
          }
          else
          {
            *(_WORD *)v197 = v194;
            v206 = v197 + 2;
          }
          if (v206 >= v196)
          {
            v217 = __p;
            v218 = v206 - __p;
            if (v206 - __p <= -3)
              sub_1DCAE4C44();
            v219 = v218 >> 1;
            v220 = v196 - __p;
            if (v220 <= (v218 >> 1) + 1)
              v221 = v219 + 1;
            else
              v221 = v220;
            if (v220 >= 0x7FFFFFFFFFFFFFFELL)
              v222 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v222 = v221;
            if (v222)
            {
              v223 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v222);
              v217 = __p;
            }
            else
            {
              v223 = 0;
            }
            v224 = &v223[2 * v219];
            *(_WORD *)v224 = v194;
            v216 = v224 + 2;
            while (v206 != v217)
            {
              v225 = *((_WORD *)v206 - 1);
              v206 -= 2;
              *((_WORD *)v224 - 1) = v225;
              v224 -= 2;
            }
            v196 = &v223[2 * v222];
            __p = v224;
            v514 = v196;
            if (v217)
            {
              operator delete(v217);
              v196 = v514;
            }
          }
          else
          {
            *(_WORD *)v206 = v194;
            v216 = v206 + 2;
          }
          v226 = v194 + v35 + 1;
          if (v216 >= v196)
          {
            v227 = __p;
            v228 = v216 - __p;
            if (v216 - __p <= -3)
              sub_1DCAE4C44();
            v229 = v228 >> 1;
            v230 = v196 - __p;
            if (v230 <= (v228 >> 1) + 1)
              v231 = v229 + 1;
            else
              v231 = v230;
            if (v230 >= 0x7FFFFFFFFFFFFFFELL)
              v232 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v232 = v231;
            if (v232)
            {
              v233 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v232);
              v227 = __p;
            }
            else
            {
              v233 = 0;
            }
            v234 = &v233[2 * v229];
            *(_WORD *)v234 = v226;
            v147 = v234 + 2;
            while (v216 != v227)
            {
              v235 = *((_WORD *)v216 - 1);
              v216 -= 2;
              *((_WORD *)v234 - 1) = v235;
              v234 -= 2;
            }
            __p = v234;
            v514 = &v233[2 * v232];
            if (v227)
              operator delete(v227);
          }
          else
          {
            *(_WORD *)v216 = v226;
            v147 = v216 + 2;
          }
          v513 = v147;
          ++v192;
        }
        while (v192 != v35);
        v191 = v509 + 1;
      }
      while (v509 + 1 != v501);
      v236 = 0;
      do
      {
        v237 = v236 + v499 * v501;
        v238 = v514;
        if (v147 >= v514)
        {
          v240 = __p;
          v241 = v147 - __p;
          if (v147 - __p <= -3)
            sub_1DCAE4C44();
          v242 = v241 >> 1;
          if (v514 - __p <= (unint64_t)((v241 >> 1) + 1))
            v243 = v242 + 1;
          else
            v243 = v514 - __p;
          if ((unint64_t)(v514 - __p) >= 0x7FFFFFFFFFFFFFFELL)
            v244 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v244 = v243;
          if (v244)
          {
            v245 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v244);
            v240 = __p;
            v147 = v513;
          }
          else
          {
            v245 = 0;
          }
          v246 = &v245[2 * v242];
          *(_WORD *)v246 = v237;
          v239 = v246 + 2;
          while (v147 != v240)
          {
            v247 = *((_WORD *)v147 - 1);
            v147 -= 2;
            *((_WORD *)v246 - 1) = v247;
            v246 -= 2;
          }
          v238 = &v245[2 * v244];
          __p = v246;
          v514 = v238;
          if (v240)
          {
            operator delete(v240);
            v238 = v514;
          }
        }
        else
        {
          *(_WORD *)v147 = v237;
          v239 = v147 + 2;
        }
        v248 = v237 + 1;
        if (v239 >= v238)
        {
          v249 = __p;
          v250 = v239 - __p;
          if (v239 - __p <= -3)
            sub_1DCAE4C44();
          v251 = v250 >> 1;
          v252 = v238 - __p;
          if (v252 <= (v250 >> 1) + 1)
            v253 = v251 + 1;
          else
            v253 = v252;
          if (v252 >= 0x7FFFFFFFFFFFFFFELL)
            v254 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v254 = v253;
          if (v254)
          {
            v255 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v254);
            v249 = __p;
          }
          else
          {
            v255 = 0;
          }
          v256 = &v255[2 * v251];
          *(_WORD *)v256 = v248;
          v147 = v256 + 2;
          while (v239 != v249)
          {
            v257 = *((_WORD *)v239 - 1);
            v239 -= 2;
            *((_WORD *)v256 - 1) = v257;
            v256 -= 2;
          }
          __p = v256;
          v514 = &v255[2 * v254];
          if (v249)
            operator delete(v249);
        }
        else
        {
          *(_WORD *)v239 = v248;
          v147 = v239 + 2;
        }
        v513 = v147;
        ++v236;
      }
      while (v236 != v35);
      v258 = 0;
      do
      {
        v259 = v35 + v258 * v499;
        v260 = v514;
        if (v147 >= v514)
        {
          v262 = __p;
          v263 = v147 - __p;
          if (v147 - __p <= -3)
            sub_1DCAE4C44();
          v264 = v263 >> 1;
          if (v514 - __p <= (unint64_t)((v263 >> 1) + 1))
            v265 = v264 + 1;
          else
            v265 = v514 - __p;
          if ((unint64_t)(v514 - __p) >= 0x7FFFFFFFFFFFFFFELL)
            v266 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v266 = v265;
          if (v266)
          {
            v267 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v266);
            v262 = __p;
            v147 = v513;
          }
          else
          {
            v267 = 0;
          }
          v268 = &v267[2 * v264];
          *(_WORD *)v268 = v259;
          v261 = v268 + 2;
          while (v147 != v262)
          {
            v269 = *((_WORD *)v147 - 1);
            v147 -= 2;
            *((_WORD *)v268 - 1) = v269;
            v268 -= 2;
          }
          v260 = &v267[2 * v266];
          __p = v268;
          v514 = v260;
          if (v262)
          {
            operator delete(v262);
            v260 = v514;
          }
        }
        else
        {
          *(_WORD *)v147 = v259;
          v261 = v147 + 2;
        }
        v270 = v259 + v35 + 1;
        if (v261 >= v260)
        {
          v271 = __p;
          v272 = v261 - __p;
          if (v261 - __p <= -3)
            sub_1DCAE4C44();
          v273 = v272 >> 1;
          v274 = v260 - __p;
          if (v274 <= (v272 >> 1) + 1)
            v275 = v273 + 1;
          else
            v275 = v274;
          if (v274 >= 0x7FFFFFFFFFFFFFFELL)
            v276 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v276 = v275;
          if (v276)
          {
            v277 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v276);
            v271 = __p;
          }
          else
          {
            v277 = 0;
          }
          v278 = &v277[2 * v273];
          *(_WORD *)v278 = v270;
          v147 = v278 + 2;
          while (v261 != v271)
          {
            v279 = *((_WORD *)v261 - 1);
            v261 -= 2;
            *((_WORD *)v278 - 1) = v279;
            v278 -= 2;
          }
          __p = v278;
          v514 = &v277[2 * v276];
          if (v271)
            operator delete(v271);
        }
        else
        {
          *(_WORD *)v261 = v270;
          v147 = v261 + 2;
        }
        v513 = v147;
        ++v258;
      }
      while (v258 != v501);
      break;
    case 3:
      v147 = 0;
      v156 = 0;
      do
      {
        v157 = 0;
        v158 = v156 * v499;
        v508 = v156 + 1;
        v159 = (v156 + 1) * v499;
        v160 = v147;
        do
        {
          v161 = v157 + v158;
          v162 = v514;
          if (v160 >= v514)
          {
            v164 = __p;
            v165 = v160 - __p;
            if (v160 - __p <= -3)
              sub_1DCAE4C44();
            v166 = v165 >> 1;
            if (v514 - __p <= (unint64_t)((v165 >> 1) + 1))
              v167 = v166 + 1;
            else
              v167 = v514 - __p;
            if ((unint64_t)(v514 - __p) >= 0x7FFFFFFFFFFFFFFELL)
              v168 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v168 = v167;
            if (v168)
            {
              v169 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v168);
              v164 = __p;
              v160 = v513;
            }
            else
            {
              v169 = 0;
            }
            v170 = &v169[2 * v166];
            *(_WORD *)v170 = v161;
            v163 = v170 + 2;
            while (v160 != v164)
            {
              v171 = *((_WORD *)v160 - 1);
              v160 -= 2;
              *((_WORD *)v170 - 1) = v171;
              v170 -= 2;
            }
            v162 = &v169[2 * v168];
            __p = v170;
            v514 = v162;
            if (v164)
            {
              operator delete(v164);
              v162 = v514;
            }
          }
          else
          {
            *(_WORD *)v160 = v161;
            v163 = v160 + 2;
          }
          v172 = v157 + v159;
          if (v163 >= v162)
          {
            v173 = __p;
            v174 = v163 - __p;
            if (v163 - __p <= -3)
              sub_1DCAE4C44();
            v175 = v174 >> 1;
            v176 = v162 - __p;
            if (v176 <= (v174 >> 1) + 1)
              v177 = v175 + 1;
            else
              v177 = v176;
            if (v176 >= 0x7FFFFFFFFFFFFFFELL)
              v178 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v178 = v177;
            if (v178)
            {
              v179 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v178);
              v173 = __p;
            }
            else
            {
              v179 = 0;
            }
            v180 = &v179[2 * v175];
            *(_WORD *)v180 = v172;
            v160 = v180 + 2;
            while (v163 != v173)
            {
              v181 = *((_WORD *)v163 - 1);
              v163 -= 2;
              *((_WORD *)v180 - 1) = v181;
              v180 -= 2;
            }
            __p = v180;
            v514 = &v179[2 * v178];
            if (v173)
              operator delete(v173);
          }
          else
          {
            *(_WORD *)v163 = v172;
            v160 = v163 + 2;
          }
          v513 = v160;
          v115 = v157++ == v35;
        }
        while (!v115);
        v182 = v159 + v35;
        if (v160 >= v514)
        {
          v183 = __p;
          v184 = v160 - __p;
          if (v160 - __p <= -3)
            sub_1DCAE4C44();
          v185 = v184 >> 1;
          if (v514 - __p <= (unint64_t)((v184 >> 1) + 1))
            v186 = v185 + 1;
          else
            v186 = v514 - __p;
          if ((unint64_t)(v514 - __p) >= 0x7FFFFFFFFFFFFFFELL)
            v187 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v187 = v186;
          if (v187)
          {
            v188 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v187);
            v183 = __p;
          }
          else
          {
            v188 = 0;
          }
          v189 = &v188[2 * v185];
          *(_WORD *)v189 = v182;
          v147 = v189 + 2;
          if (v160 == v183)
          {
            v156 = v508;
          }
          else
          {
            v156 = v508;
            do
            {
              v190 = *((_WORD *)v160 - 1);
              v160 -= 2;
              *((_WORD *)v189 - 1) = v190;
              v189 -= 2;
            }
            while (v160 != v183);
          }
          __p = v189;
          v514 = &v188[2 * v187];
          if (v183)
            operator delete(v183);
        }
        else
        {
          *(_WORD *)v160 = v182;
          v147 = v160 + 2;
          v156 = v508;
        }
        v513 = v147;
      }
      while (v156 != v501);
      break;
    case 4:
      v147 = 0;
      v280 = 0;
      do
      {
        v281 = 0;
        v510 = v280;
        v282 = v280 * v499;
        do
        {
          v283 = v281 + v282;
          v284 = v514;
          if (v147 >= v514)
          {
            v286 = __p;
            v287 = v147 - __p;
            if (v147 - __p <= -3)
              sub_1DCAE4C44();
            v288 = v287 >> 1;
            if (v514 - __p <= (unint64_t)((v287 >> 1) + 1))
              v289 = v288 + 1;
            else
              v289 = v514 - __p;
            if ((unint64_t)(v514 - __p) >= 0x7FFFFFFFFFFFFFFELL)
              v290 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v290 = v289;
            if (v290)
            {
              v291 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v290);
              v286 = __p;
              v147 = v513;
            }
            else
            {
              v291 = 0;
            }
            v292 = &v291[2 * v288];
            *(_WORD *)v292 = v283;
            v285 = v292 + 2;
            while (v147 != v286)
            {
              v293 = *((_WORD *)v147 - 1);
              v147 -= 2;
              *((_WORD *)v292 - 1) = v293;
              v292 -= 2;
            }
            v284 = &v291[2 * v290];
            __p = v292;
            v514 = v284;
            if (v286)
            {
              operator delete(v286);
              v284 = v514;
            }
          }
          else
          {
            *(_WORD *)v147 = v283;
            v285 = v147 + 2;
          }
          v294 = v283 + v35 + 1;
          if (v285 >= v284)
          {
            v296 = __p;
            v297 = v285 - __p;
            if (v285 - __p <= -3)
              sub_1DCAE4C44();
            v298 = v297 >> 1;
            v299 = v284 - __p;
            if (v299 <= (v297 >> 1) + 1)
              v300 = v298 + 1;
            else
              v300 = v299;
            if (v299 >= 0x7FFFFFFFFFFFFFFELL)
              v301 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v301 = v300;
            if (v301)
            {
              v302 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v301);
              v296 = __p;
            }
            else
            {
              v302 = 0;
            }
            v303 = &v302[2 * v298];
            *(_WORD *)v303 = v294;
            v295 = v303 + 2;
            while (v285 != v296)
            {
              v304 = *((_WORD *)v285 - 1);
              v285 -= 2;
              *((_WORD *)v303 - 1) = v304;
              v303 -= 2;
            }
            v284 = &v302[2 * v301];
            __p = v303;
            v514 = v284;
            if (v296)
            {
              operator delete(v296);
              v284 = v514;
            }
          }
          else
          {
            *(_WORD *)v285 = v294;
            v295 = v285 + 2;
          }
          v305 = v283 + 1;
          v306 = v305 + v35 + 1;
          if (v295 >= v284)
          {
            v308 = __p;
            v309 = v295 - __p;
            if (v295 - __p <= -3)
              sub_1DCAE4C44();
            v310 = v309 >> 1;
            v311 = v284 - __p;
            if (v311 <= (v309 >> 1) + 1)
              v312 = v310 + 1;
            else
              v312 = v311;
            if (v311 >= 0x7FFFFFFFFFFFFFFELL)
              v313 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v313 = v312;
            if (v313)
            {
              v314 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v313);
              v308 = __p;
            }
            else
            {
              v314 = 0;
            }
            v315 = &v314[2 * v310];
            *(_WORD *)v315 = v306;
            v307 = v315 + 2;
            while (v295 != v308)
            {
              v316 = *((_WORD *)v295 - 1);
              v295 -= 2;
              *((_WORD *)v315 - 1) = v316;
              v315 -= 2;
            }
            v284 = &v314[2 * v313];
            __p = v315;
            v514 = v284;
            if (v308)
            {
              operator delete(v308);
              v284 = v514;
            }
          }
          else
          {
            *(_WORD *)v295 = v306;
            v307 = v295 + 2;
          }
          if (v307 >= v284)
          {
            v317 = __p;
            v318 = v307 - __p;
            if (v307 - __p <= -3)
              sub_1DCAE4C44();
            v319 = v318 >> 1;
            v320 = v284 - __p;
            if (v320 <= (v318 >> 1) + 1)
              v321 = v319 + 1;
            else
              v321 = v320;
            if (v320 >= 0x7FFFFFFFFFFFFFFELL)
              v322 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v322 = v321;
            if (v322)
            {
              v323 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v322);
              v317 = __p;
            }
            else
            {
              v323 = 0;
            }
            v324 = &v323[2 * v319];
            *(_WORD *)v324 = v305;
            v147 = v324 + 2;
            while (v307 != v317)
            {
              v325 = *((_WORD *)v307 - 1);
              v307 -= 2;
              *((_WORD *)v324 - 1) = v325;
              v324 -= 2;
            }
            __p = v324;
            v514 = &v323[2 * v322];
            if (v317)
              operator delete(v317);
          }
          else
          {
            *(_WORD *)v307 = v305;
            v147 = v307 + 2;
          }
          v513 = v147;
          ++v281;
        }
        while (v281 != v35);
        v280 = v510 + 1;
      }
      while (v510 + 1 != v501);
      break;
    default:
      v147 = 0;
      v326 = 0;
      do
      {
        v327 = 0;
        v505 = v326;
        v511 = v326 * v499;
        do
        {
          v328 = v327 + v511;
          v329 = v327 + v511 + 1;
          v330 = v514;
          if (v147 >= v514)
          {
            v332 = __p;
            v333 = v147 - __p;
            if (v147 - __p <= -3)
              sub_1DCAE4C44();
            v334 = v333 >> 1;
            if (v514 - __p <= (unint64_t)((v333 >> 1) + 1))
              v335 = v334 + 1;
            else
              v335 = v514 - __p;
            if ((unint64_t)(v514 - __p) >= 0x7FFFFFFFFFFFFFFELL)
              v336 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v336 = v335;
            if (v336)
            {
              v337 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v336);
              v332 = __p;
              v147 = v513;
            }
            else
            {
              v337 = 0;
            }
            v338 = &v337[2 * v334];
            *(_WORD *)v338 = v329;
            v331 = v338 + 2;
            while (v147 != v332)
            {
              v339 = *((_WORD *)v147 - 1);
              v147 -= 2;
              *((_WORD *)v338 - 1) = v339;
              v338 -= 2;
            }
            v330 = &v337[2 * v336];
            __p = v338;
            v514 = v330;
            if (v332)
            {
              operator delete(v332);
              v330 = v514;
            }
          }
          else
          {
            *(_WORD *)v147 = v329;
            v331 = v147 + 2;
          }
          if (v331 >= v330)
          {
            v341 = __p;
            v342 = v331 - __p;
            if (v331 - __p <= -3)
              sub_1DCAE4C44();
            v343 = v342 >> 1;
            v344 = v330 - __p;
            if (v344 <= (v342 >> 1) + 1)
              v345 = v343 + 1;
            else
              v345 = v344;
            if (v344 >= 0x7FFFFFFFFFFFFFFELL)
              v346 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v346 = v345;
            if (v346)
            {
              v347 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v346);
              v341 = __p;
            }
            else
            {
              v347 = 0;
            }
            v348 = &v347[2 * v343];
            *(_WORD *)v348 = v328;
            v340 = v348 + 2;
            while (v331 != v341)
            {
              v349 = *((_WORD *)v331 - 1);
              v331 -= 2;
              *((_WORD *)v348 - 1) = v349;
              v348 -= 2;
            }
            v330 = &v347[2 * v346];
            __p = v348;
            v514 = v330;
            if (v341)
            {
              operator delete(v341);
              v330 = v514;
            }
          }
          else
          {
            *(_WORD *)v331 = v328;
            v340 = v331 + 2;
          }
          v350 = v328 + v35;
          v351 = v328 + v35 + 1;
          if (v340 >= v330)
          {
            v353 = __p;
            v354 = v340 - __p;
            if (v340 - __p <= -3)
              sub_1DCAE4C44();
            v355 = v354 >> 1;
            v356 = v330 - __p;
            if (v356 <= (v354 >> 1) + 1)
              v357 = v355 + 1;
            else
              v357 = v356;
            if (v356 >= 0x7FFFFFFFFFFFFFFELL)
              v358 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v358 = v357;
            if (v358)
            {
              v359 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v358);
              v353 = __p;
            }
            else
            {
              v359 = 0;
            }
            v360 = &v359[2 * v355];
            *(_WORD *)v360 = v351;
            v352 = v360 + 2;
            while (v340 != v353)
            {
              v361 = *((_WORD *)v340 - 1);
              v340 -= 2;
              *((_WORD *)v360 - 1) = v361;
              v360 -= 2;
            }
            v330 = &v359[2 * v358];
            __p = v360;
            v514 = v330;
            if (v353)
            {
              operator delete(v353);
              v330 = v514;
            }
          }
          else
          {
            *(_WORD *)v340 = v351;
            v352 = v340 + 2;
          }
          if (v352 >= v330)
          {
            v363 = __p;
            v364 = v352 - __p;
            if (v352 - __p <= -3)
              sub_1DCAE4C44();
            v365 = v364 >> 1;
            v366 = v330 - __p;
            if (v366 <= (v364 >> 1) + 1)
              v367 = v365 + 1;
            else
              v367 = v366;
            if (v366 >= 0x7FFFFFFFFFFFFFFELL)
              v368 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v368 = v367;
            if (v368)
            {
              v369 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v368);
              v363 = __p;
            }
            else
            {
              v369 = 0;
            }
            v370 = &v369[2 * v365];
            *(_WORD *)v370 = v329;
            v362 = v370 + 2;
            while (v352 != v363)
            {
              v371 = *((_WORD *)v352 - 1);
              v352 -= 2;
              *((_WORD *)v370 - 1) = v371;
              v370 -= 2;
            }
            v330 = &v369[2 * v368];
            __p = v370;
            v514 = v330;
            if (v363)
            {
              operator delete(v363);
              v330 = v514;
            }
          }
          else
          {
            *(_WORD *)v352 = v329;
            v362 = v352 + 2;
          }
          if (v362 >= v330)
          {
            v373 = __p;
            v374 = v362 - __p;
            if (v362 - __p <= -3)
              sub_1DCAE4C44();
            v375 = v374 >> 1;
            v376 = v330 - __p;
            if (v376 <= (v374 >> 1) + 1)
              v377 = v375 + 1;
            else
              v377 = v376;
            if (v376 >= 0x7FFFFFFFFFFFFFFELL)
              v378 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v378 = v377;
            if (v378)
            {
              v379 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v378);
              v373 = __p;
            }
            else
            {
              v379 = 0;
            }
            v380 = &v379[2 * v375];
            *(_WORD *)v380 = v351;
            v372 = v380 + 2;
            while (v362 != v373)
            {
              v381 = *((_WORD *)v362 - 1);
              v362 -= 2;
              *((_WORD *)v380 - 1) = v381;
              v380 -= 2;
            }
            v330 = &v379[2 * v378];
            __p = v380;
            v514 = v330;
            if (v373)
            {
              operator delete(v373);
              v330 = v514;
            }
          }
          else
          {
            *(_WORD *)v362 = v351;
            v372 = v362 + 2;
          }
          v382 = v350 + 2;
          if (v372 >= v330)
          {
            v383 = __p;
            v384 = v372 - __p;
            if (v372 - __p <= -3)
              sub_1DCAE4C44();
            v385 = v384 >> 1;
            v386 = v330 - __p;
            if (v386 <= (v384 >> 1) + 1)
              v387 = v385 + 1;
            else
              v387 = v386;
            if (v386 >= 0x7FFFFFFFFFFFFFFELL)
              v388 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v388 = v387;
            if (v388)
            {
              v389 = (char *)sub_1DCB0DAEC((uint64_t)&v514, v388);
              v383 = __p;
            }
            else
            {
              v389 = 0;
            }
            v390 = &v389[2 * v385];
            *(_WORD *)v390 = v382;
            v147 = v390 + 2;
            while (v372 != v383)
            {
              v391 = *((_WORD *)v372 - 1);
              v372 -= 2;
              *((_WORD *)v390 - 1) = v391;
              v390 -= 2;
            }
            __p = v390;
            v514 = &v389[2 * v388];
            if (v383)
              operator delete(v383);
          }
          else
          {
            *(_WORD *)v372 = v382;
            v147 = v372 + 2;
          }
          v513 = v147;
          ++v327;
        }
        while (v327 != v35);
        v326 = v505 + 1;
      }
      while (v505 + 1 != v501);
      break;
  }
  v392 = objc_alloc(MEMORY[0x1E0C99D50]);
  v394 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v392, v393, (uint64_t)__p, v147 - __p, 0);
  v396 = (void *)objc_msgSend_newBufferWithData_type_(v494, v395, (uint64_t)v394, 2);
  if (objc_msgSend_conformsToProtocol_(v396, v397, (uint64_t)&unk_1F03B6D88))
  {
    v398 = v396;
    objc_msgSend_name(v495, v399, v400);
    v401 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(v401, v402, (uint64_t)CFSTR("-Indices"));
    v403 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v398, v404, (uint64_t)v403);

  }
  v405 = [MDLMaterial alloc];
  objc_msgSend_name(v495, v406, v407);
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v408, v409, (uint64_t)CFSTR("-Material"));
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  v411 = (void *)objc_opt_new();
  v413 = (void *)objc_msgSend_initWithName_scatteringFunction_(v405, v412, (uint64_t)v410, v411);

  v414 = [MDLSubmesh alloc];
  v416 = (void *)objc_msgSend_initWithName_indexBuffer_indexCount_indexType_geometryType_material_topology_(v414, v415, (uint64_t)CFSTR("submesh"), v396, (v513 - __p) >> 1, 16, v493, v413, 0);
  objc_msgSend_setVertexCount_(v495, v417, ((v522 - v521) >> 2) / 3uLL);
  v418 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend_addObject_(v418, v419, (uint64_t)v416);
  objc_msgSend_setSubmeshes_(v495, v420, (uint64_t)v418);
  v421 = objc_alloc_init(MDLVertexDescriptor);
  objc_msgSend_attributes(v421, v422, v423);
  v424 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v424, v425, 0);
  v426 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v426, v427, (uint64_t)CFSTR("position"));

  objc_msgSend_attributes(v421, v428, v429);
  v430 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v430, v431, 0);
  v432 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFormat_(v432, v433, 786435);

  objc_msgSend_attributes(v421, v434, v435);
  v436 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v436, v437, 0);
  v438 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBufferIndex_(v438, v439, 0);

  objc_msgSend_attributes(v421, v440, v441);
  v442 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v442, v443, 1);
  v444 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v444, v445, (uint64_t)CFSTR("normal"));

  objc_msgSend_attributes(v421, v446, v447);
  v448 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v448, v449, 1);
  v450 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFormat_(v450, v451, 786435);

  objc_msgSend_attributes(v421, v452, v453);
  v454 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v454, v455, 1);
  v456 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBufferIndex_(v456, v457, 0);

  objc_msgSend_attributes(v421, v458, v459);
  v460 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v460, v461, 2);
  v462 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v462, v463, (uint64_t)CFSTR("textureCoordinate"));

  objc_msgSend_attributes(v421, v464, v465);
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v466, v467, 2);
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFormat_(v468, v469, 786434);

  objc_msgSend_attributes(v421, v470, v471);
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v472, v473, 2);
  v474 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBufferIndex_(v474, v475, 0);

  objc_msgSend_setPackedOffsets(v421, v476, v477);
  objc_msgSend_setPackedStrides(v421, v478, v479);
  v480 = [MDLAsset alloc];
  objc_msgSend_vertexDescriptor(v495, v481, v482);
  v483 = (void *)objc_claimAutoreleasedReturnValue();
  v485 = (void *)objc_msgSend_initWithURL_vertexDescriptor_bufferAllocator_(v480, v484, 0, v483, v494);

  objc_msgSend_addObject_(v485, v486, (uint64_t)v495);
  objc_msgSend__conformVertexBuffers_error_(v485, v487, (uint64_t)v421, 0);
  objc_msgSend_removeObject_(v485, v488, (uint64_t)v495);

  if (__p)
    operator delete(__p);
  if (v515)
  {
    v516 = v515;
    operator delete(v515);
  }
  if (v518)
  {
    v519 = v518;
    operator delete(v518);
  }
  if (v521)
  {
    v522 = v521;
    operator delete(v521);
  }
  v27 = v494;
  objc_autoreleasePoolPop(context);
  v18 = v495;
  v489 = v495;
LABEL_564:

  return v18;
}

+ (MDLMesh)newPlaneWithDimensions:(vector_float2)dimensions segments:(vector_uint2)segments geometryType:(MDLGeometryType)geometryType allocator:(id)allocator
{
  id v8;
  MDLMesh *v9;
  const char *v10;
  MDLMesh *inited;
  int32x4_t v13;

  v13 = *(int32x4_t *)dimensions.f32;
  v8 = allocator;
  v9 = [MDLMesh alloc];
  inited = (MDLMesh *)objc_msgSend_initPlaneWithExtent_segments_geometryType_allocator_(v9, v10, geometryType, v8, *(double *)vextq_s8((int8x16_t)vzip1q_s32((int32x4_t)0, v13), (int8x16_t)0, 4uLL).i64, *(double *)&segments);

  return inited;
}

- (void)setVertexBuffers:(NSArray *)vertexBuffers
{
  id v4;
  const char *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSArray *v8;

  v8 = vertexBuffers;
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v6 = (NSMutableArray *)objc_msgSend_initWithArray_(v4, v5, (uint64_t)v8);
  v7 = self->_vertexBuffers;
  self->_vertexBuffers = v6;

}

- (void)debugPrintToFile:(__sFILE *)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  id v35;
  const char *v36;
  const char *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  unint64_t v51;
  unsigned int *v52;
  const char *v53;
  uint64_t v54;
  unsigned __int8 v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  int8x8_t v65;
  uint64x2_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  unint64_t v72;
  const char *v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  id obj;
  uint64_t v79;
  uint64_t v80;
  float64x2_t v81;
  float64x2_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  double v91;
  float64x2_t v92;
  double v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  objc_msgSend_name(self, a2, (uint64_t)a3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend_cStringUsingEncoding_(v4, v5, 4);
  fprintf(a3, "Mesh:%s vertexCount %llu\n", v6, self->_vertexCount);

  objc_msgSend_debugPrintToFile_(self->_vertexDescriptor, v7, (uint64_t)a3);
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  objc_msgSend_attributes(self->_vertexDescriptor, v8, v9);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v87, v94, 16);
  if (v11)
  {
    v83 = 0;
    v79 = *(_QWORD *)v88;
    __asm { FMOV            V0.2D, #-1.0 }
    v81 = _Q0;
    v82 = (float64x2_t)vdupq_n_s64(0x3F60080402010080uLL);
    do
    {
      v84 = 0;
      v80 = v11;
      do
      {
        if (*(_QWORD *)v88 != v79)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v84);
        objc_msgSend_null(MEMORY[0x1E0C99E38], v12, v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v19, v21, (uint64_t)v20) & 1) != 0)
        {

        }
        else
        {
          v24 = objc_msgSend_format(v19, v22, v23) == 0;

          if (!v24)
          {
            v25 = objc_msgSend_bufferIndex(v19, v12, v13);
            objc_msgSend_layouts(self->_vertexDescriptor, v26, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v28, v29, v25);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = objc_msgSend_stride(v30, v31, v32);

            objc_msgSend_name(v19, v33, v34);
            v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v37 = (const char *)objc_msgSend_cStringUsingEncoding_(v35, v36, 4);
            fprintf(a3, "%llu %s:\n", v83, v37);

            objc_msgSend_objectAtIndexedSubscript_(self->_vertexBuffers, v38, v25);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_map(v39, v40, v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend_bytes(v42, v43, v44);
            v48 = objc_msgSend_offset(v19, v46, v47);

            if (self->_vertexCount)
            {
              v51 = 0;
              v52 = (unsigned int *)(v45 + v48);
              do
              {
                if ((unint64_t)objc_msgSend_format(v19, v49, v50) <= 0x10000)
                {
                  fputc(40, a3);
                  v62 = objc_msgSend_format(v19, v60, v61);
                  if (v62 == 593924)
                  {
                    fprintf(a3, "%f %f %f %f", (double)(*v52 >> 22) * 0.000977517107, (double)((*v52 >> 12) & 0x3FF) * 0.000977517107, (double)((*v52 >> 2) & 0x3FF) * 0.000977517107, (double)(*v52 & 3) * 0.333333333);
                  }
                  else if (v62 == 659460)
                  {
                    v63 = 0;
                    v64 = *v52;
                    v91 = (double)(*v52 >> 22) * 0.00195694716;
                    v65 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v64), (uint32x2_t)0xFFFFFFFEFFFFFFF4), (int8x8_t)0x300000003);
                    v66.i64[0] = v65.u32[0];
                    v66.i64[1] = v65.u32[1];
                    v92 = vmulq_f64(vcvtq_f64_u64(v66), v82);
                    v93 = (double)(v64 & 3);
                    do
                    {
                      *(int8x16_t *)((char *)&v91 + v63) = vbslq_s8((int8x16_t)vcgtq_f64(v81, *(float64x2_t *)((char *)&v91 + v63)), (int8x16_t)v81, *(int8x16_t *)((char *)&v91 + v63));
                      v63 += 16;
                    }
                    while (v63 != 32);
                    fprintf(a3, "%f %f %f %f", v91, v92.f64[0], v92.f64[1], v93);
                  }
                }
                else
                {
                  v55 = objc_msgSend_format(v19, v53, v54);
                  fputc(40, a3);
                  if (v55)
                  {
                    v58 = 0;
                    for (i = 0; i != v55; ++i)
                    {
                      switch(((objc_msgSend_format(v19, v56, v57) & 0xFFFF0000uLL) - 0x10000) >> 16)
                      {
                        case 0uLL:
                        case 1uLL:
                        case 4uLL:
                        case 5uLL:
                        case 8uLL:
                        case 9uLL:
                          fprintf(a3, "%d");
                          break;
                        case 2uLL:
                        case 3uLL:
                        case 6uLL:
                        case 7uLL:
                        case 0xBuLL:
                          goto LABEL_17;
                        case 0xAuLL:
                          sub_1DCC1EDA0(*((unsigned __int16 *)v52 + i));
LABEL_17:
                          fprintf(a3, "%f");
                          break;
                        default:
                          break;
                      }
                      if (v55 - 1 != (_DWORD)i)
                        fputc(32, a3);
                      v58 += 4;
                    }
                  }
                }
                fwrite(") ", 2uLL, 1uLL, a3);
                v52 = (unsigned int *)((char *)v52 + v85);
                ++v51;
                fputc(10, a3);
              }
              while (v51 < self->_vertexCount);
            }
            fputc(10, a3);
          }
        }
        ++v83;
        ++v84;
      }
      while (v84 != v80);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v87, v94, 16);
    }
    while (v11);
  }

  v69 = objc_msgSend_count(self->_submeshes, v67, v68);
  fprintf(a3, "submeshes:%llu\n", v69);
  if (objc_msgSend_count(self->_submeshes, v70, v71))
  {
    v72 = 0;
    do
    {
      fprintf(a3, "submesh #%llu\n", v72);
      objc_msgSend_objectAtIndexedSubscript_(self->_submeshes, v73, v72);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_debugPrintToFile_(v74, v75, (uint64_t)a3);

      ++v72;
    }
    while (v72 < objc_msgSend_count(self->_submeshes, v76, v77));
  }
}

- (void)setVertexDescriptor:(MDLVertexDescriptor *)vertexDescriptor
{
  NSMutableArray *v4;
  NSMutableArray *vertexBuffers;
  MDLVertexDescriptor *v6;
  const char *v7;
  MDLVertexDescriptor *v8;
  MDLVertexDescriptor *v9;
  MDLVertexDescriptor *v10;

  v10 = vertexDescriptor;
  sub_1DCC0BC5C(self->_vertexBuffers, self->_vertexCount, self->_vertexDescriptor, v10, 0, 1);
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  vertexBuffers = self->_vertexBuffers;
  self->_vertexBuffers = v4;

  v6 = [MDLVertexDescriptor alloc];
  v8 = (MDLVertexDescriptor *)objc_msgSend_initWithVertexDescriptor_(v6, v7, (uint64_t)v10);
  v9 = self->_vertexDescriptor;
  self->_vertexDescriptor = v8;

}

- (void)setSubmeshes:(NSMutableArray *)submeshes
{
  id v4;
  const char *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;

  v8 = submeshes;
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v6 = (NSMutableArray *)objc_msgSend_initWithArray_(v4, v5, (uint64_t)v8);
  v7 = self->_submeshes;
  self->_submeshes = v6;

}

- (MDLAxisAlignedBoundingBox)boundingBox
{
  float32x4_t *anon_50;
  NSMutableArray *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  float32x4_t v18;
  MDLAxisAlignedBoundingBox *result;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  float32x4_t v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  anon_50 = (float32x4_t *)self->_anon_50;
  __asm { FMOV            V1.4S, #-1.0 }
  *(_OWORD *)self->_anon_50 = _Q1;
  *(_OWORD *)&self->_anon_50[16] = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = self->_submeshes;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v20, v26, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v16)
        {
          objc_msgSend_boundingBoxForMesh_(v16, v12, (uint64_t)self, (_QWORD)v20);
          v18 = v24;
          v17 = v25;
        }
        else
        {
          v17 = 0uLL;
          v18 = 0uLL;
        }
        v24 = v18;
        v25 = v17;
        sub_1DCB22B5C(anon_50, &v24);
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v20, v26, 16);
    }
    while (v13);
  }

  return result;
}

- (MDLMesh)initWithBufferAllocator:(id)bufferAllocator
{
  MDLMeshBufferDataAllocator *v4;
  MDLMesh *v5;
  MDLMeshBufferDataAllocator *v6;
  NSMutableArray *v12;
  NSMutableArray *vertexBuffers;
  MDLVertexDescriptor *v14;
  MDLVertexDescriptor *vertexDescriptor;
  NSMutableArray *v16;
  NSMutableArray *submeshes;
  MDLMesh *v18;
  objc_super v20;

  v4 = (MDLMeshBufferDataAllocator *)bufferAllocator;
  v20.receiver = self;
  v20.super_class = (Class)MDLMesh;
  v5 = -[MDLObject init](&v20, sel_init);
  if (v5)
  {
    v6 = v4;
    if (!v4)
      v6 = objc_alloc_init(MDLMeshBufferDataAllocator);
    objc_storeStrong((id *)&v5->_allocator, v6);
    if (!v4)

    __asm { FMOV            V1.4S, #-1.0 }
    *(_OWORD *)v5->_anon_50 = _Q1;
    *(_OWORD *)&v5->_anon_50[16] = 0u;
    v5->_vertexCount = 0;
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    vertexBuffers = v5->_vertexBuffers;
    v5->_vertexBuffers = v12;

    v14 = objc_alloc_init(MDLVertexDescriptor);
    vertexDescriptor = v5->_vertexDescriptor;
    v5->_vertexDescriptor = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    submeshes = v5->_submeshes;
    v5->_submeshes = v16;

    v18 = v5;
  }

  return v5;
}

- (void)_createWithVertexBuffer:(id)a3 vertexCount:(unint64_t)a4 descriptor:(id)a5 submeshes:(id)a6
{
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  objc_class *v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  MDLMeshBufferAllocator *v37;
  MDLMeshBufferAllocator *allocator;
  NSMutableArray *v44;
  NSMutableArray *vertexBuffers;
  const char *v46;
  id v47;
  const char *v48;
  NSMutableArray *v49;
  NSMutableArray *submeshes;
  uint64_t v51;
  const char *v52;
  MDLVertexDescriptor *v53;
  MDLVertexDescriptor *vertexDescriptor;
  id v56;
  void *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v58 = a5;
  v56 = a6;
  v57 = v9;
  NSStringFromSelector(sel_initWithVertexBuffer_vertexCount_descriptor_submeshes_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(v9, v11, v12) != 1)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v15, v18, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: vertexBuffer.type must be MDLMeshBufferTypeVertex"), v17, v10);

  }
  v19 = v58;
  if (!v58)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v20, v23, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: No descriptor supplied"), v22, v10);

    v19 = 0;
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  objc_msgSend_attributes(v19, v13, v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v59, v63, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v60;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v60 != v29)
          objc_enumerationMutation(v24);
        if (objc_msgSend_bufferIndex(*(void **)(*((_QWORD *)&v59 + 1) + 8 * v30), v26, v27))
        {
          v31 = (void *)MEMORY[0x1E0C99DA0];
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_raise_format_(v31, v34, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Buffer index out of range"), v33, v10);

        }
        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v59, v63, 16);
    }
    while (v28);
  }

  objc_msgSend_allocator(v57, v35, v36);
  v37 = (MDLMeshBufferAllocator *)objc_claimAutoreleasedReturnValue();
  allocator = self->_allocator;
  self->_allocator = v37;

  __asm { FMOV            V1.4S, #-1.0 }
  *(_OWORD *)self->_anon_50 = _Q1;
  *(_OWORD *)&self->_anon_50[16] = 0u;
  v44 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  vertexBuffers = self->_vertexBuffers;
  self->_vertexBuffers = v44;

  objc_msgSend_addObject_(self->_vertexBuffers, v46, (uint64_t)v57);
  v47 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v49 = (NSMutableArray *)objc_msgSend_initWithArray_(v47, v48, (uint64_t)v56);
  submeshes = self->_submeshes;
  self->_submeshes = v49;

  self->_vertexCount = a4;
  v51 = MEMORY[0x1DF0D0AF8]();
  v53 = (MDLVertexDescriptor *)objc_msgSend_copyWithZone_(v58, v52, v51);
  vertexDescriptor = self->_vertexDescriptor;
  self->_vertexDescriptor = v53;

}

- (MDLMesh)initWithVertexBuffer:(id)vertexBuffer vertexCount:(NSUInteger)vertexCount descriptor:(MDLVertexDescriptor *)descriptor submeshes:(NSArray *)submeshes
{
  id v10;
  MDLVertexDescriptor *v11;
  NSArray *v12;
  MDLMesh *v13;
  const char *v14;
  MDLMesh *v15;
  MDLMesh *v16;
  objc_super v18;

  v10 = vertexBuffer;
  v11 = descriptor;
  v12 = submeshes;
  v18.receiver = self;
  v18.super_class = (Class)MDLMesh;
  v13 = -[MDLObject init](&v18, sel_init);
  v15 = v13;
  if (v13)
  {
    objc_msgSend__createWithVertexBuffer_vertexCount_descriptor_submeshes_(v13, v14, (uint64_t)v10, vertexCount, v11, v12);
    v16 = v15;
  }

  return v15;
}

- (MDLVertexAttributeData)vertexAttributeDataForAttributeNamed:(NSString *)name
{
  NSString *v4;
  const char *v5;
  void *v6;
  MDLVertexAttributeData *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  MDLMeshBufferMap *map;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;

  v4 = name;
  objc_msgSend_attributeNamed_(self->_vertexDescriptor, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(MDLVertexAttributeData);
    v10 = objc_msgSend_bufferIndex(v6, v8, v9);
    objc_msgSend_objectAtIndexedSubscript_(self->_vertexBuffers, v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_map(v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    map = v7->_map;
    v7->_map = (MDLMeshBufferMap *)v15;

    objc_msgSend_layouts(self->_vertexDescriptor, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v19, v20, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_stride = objc_msgSend_stride(v21, v22, v23);

    objc_msgSend_map(v7, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_bytes(v26, v27, v28);
    v7->_dataStart = (void *)(v29 + objc_msgSend_offset(v6, v30, v31));

    v7->_format = objc_msgSend_format(v6, v32, v33);
    objc_msgSend_objectAtIndexedSubscript_(self->_vertexBuffers, v34, v10);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_bufferSize = objc_msgSend_length(v35, v36, v37);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)createSourceDataVector:(void *)a3 attr:(id)a4 srcElementCount:(int)a5 dstElementCount:(int)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  float v28;
  uint64_t v29;
  unint64_t v30;
  float *v31;
  float v32;
  float *v33;
  float *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  float *v39;
  float v40;
  uint64_t v41;
  float *v42;
  float *v43;
  float *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  int v50;
  unint64_t v51;
  int v52;
  int v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  float *v63;
  float v64;
  float *v65;
  float *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  char *v70;
  float *v71;
  int v72;
  uint64_t v73;
  float *v74;
  float *v75;
  float *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  int v82;
  unint64_t v83;
  int v84;
  int v85;
  uint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  float *v95;
  float v96;
  float *v97;
  float *v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  char *v102;
  float *v103;
  int v104;
  uint64_t v105;
  float *v106;
  float *v107;
  float *v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  int v114;
  unint64_t v115;
  int v116;
  int v117;
  uint64_t v118;
  _QWORD *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  float *v127;
  int v128;
  float *v129;
  float *v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  char *v134;
  char *v135;
  int v136;
  uint64_t v137;
  float *v138;
  float *v139;
  float *v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  char *v144;
  char *v145;
  int v146;
  unint64_t v147;
  int v148;
  int v149;
  uint64_t v150;
  _QWORD *v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  unsigned int v157;
  uint64_t v158;
  unint64_t v159;
  float *v160;
  float v161;
  float *v162;
  float *v163;
  uint64_t v164;
  unint64_t v165;
  uint64_t v166;
  char *v167;
  float *v168;
  unsigned int v169;
  uint64_t v170;
  float *v171;
  float *v172;
  float *v173;
  uint64_t v174;
  unint64_t v175;
  uint64_t v176;
  char *v177;
  char *v178;
  int v179;
  unint64_t v180;
  int v181;
  int v182;
  uint64_t v183;
  _QWORD *v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  float v190;
  uint64_t v191;
  unint64_t v192;
  float *v193;
  float v194;
  float *v195;
  float *v196;
  uint64_t v197;
  unint64_t v198;
  uint64_t v199;
  char *v200;
  float *v201;
  int v202;
  uint64_t v203;
  float *v204;
  float *v205;
  float *v206;
  uint64_t v207;
  unint64_t v208;
  uint64_t v209;
  char *v210;
  char *v211;
  int v212;
  unint64_t v213;
  int v214;
  int v215;
  uint64_t v216;
  _QWORD *v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  unint64_t v224;
  float *v225;
  float v226;
  float *v227;
  float *v228;
  uint64_t v229;
  unint64_t v230;
  uint64_t v231;
  char *v232;
  float *v233;
  int v234;
  uint64_t v235;
  float *v236;
  float *v237;
  float *v238;
  uint64_t v239;
  unint64_t v240;
  uint64_t v241;
  char *v242;
  char *v243;
  int v244;
  unint64_t v245;
  int v246;
  int v247;
  uint64_t v248;
  _QWORD *v249;
  uint64_t v250;
  uint64_t v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  unint64_t v256;
  float *v257;
  float v258;
  float *v259;
  float *v260;
  uint64_t v261;
  unint64_t v262;
  uint64_t v263;
  char *v264;
  float *v265;
  int v266;
  uint64_t v267;
  float *v268;
  float *v269;
  float *v270;
  uint64_t v271;
  unint64_t v272;
  uint64_t v273;
  char *v274;
  char *v275;
  int v276;
  unint64_t v277;
  int v278;
  int v279;
  uint64_t v280;
  _QWORD *v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  unint64_t v288;
  float *v289;
  float v290;
  float *v291;
  float *v292;
  uint64_t v293;
  unint64_t v294;
  uint64_t v295;
  char *v296;
  float *v297;
  int v298;
  uint64_t v299;
  float *v300;
  float *v301;
  float *v302;
  uint64_t v303;
  unint64_t v304;
  uint64_t v305;
  char *v306;
  char *v307;
  int v308;
  unint64_t v309;
  int v310;
  int v311;
  uint64_t v312;
  _QWORD *v313;
  uint64_t v314;
  uint64_t v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  unint64_t v320;
  float *v321;
  float v322;
  float *v323;
  float *v324;
  uint64_t v325;
  unint64_t v326;
  uint64_t v327;
  char *v328;
  float *v329;
  int v330;
  uint64_t v331;
  float *v332;
  float *v333;
  float *v334;
  uint64_t v335;
  unint64_t v336;
  uint64_t v337;
  char *v338;
  char *v339;
  int v340;
  unint64_t v341;
  int v342;
  int v343;
  uint64_t v344;
  _QWORD *v345;
  uint64_t v346;
  uint64_t v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  unsigned int v351;
  uint64_t v352;
  unint64_t v353;
  float *v354;
  float v355;
  float *v356;
  float *v357;
  uint64_t v358;
  unint64_t v359;
  uint64_t v360;
  char *v361;
  float *v362;
  int v363;
  uint64_t v364;
  float *v365;
  float *v366;
  float *v367;
  uint64_t v368;
  unint64_t v369;
  uint64_t v370;
  char *v371;
  char *v372;
  int v373;
  unint64_t v374;
  int v375;
  int v376;
  uint64_t v377;
  _QWORD *v378;
  uint64_t v379;
  uint64_t v380;
  const char *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  unint64_t v385;
  float v386;
  float v387;
  unint64_t v388;
  float *v389;
  float *v390;
  float *v391;
  uint64_t v392;
  unint64_t v393;
  uint64_t v394;
  char *v395;
  float *v396;
  int v397;
  uint64_t v398;
  float *v399;
  float *v400;
  float *v401;
  uint64_t v402;
  unint64_t v403;
  uint64_t v404;
  char *v405;
  char *v406;
  int v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  MDLMesh *v420;
  uint64_t v421;
  id v422;

  v10 = a4;
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
  v422 = v10;
  sub_1DCB0BBF4((void **)a3, self->_vertexCount * a6);
  v421 = objc_msgSend_dataStart(v422, v11, v12);
  v15 = objc_msgSend_format(v422, v13, v14);
  v420 = self;
  if (v15 > 458752)
  {
    if (v15 > 655360)
    {
      if ((unint64_t)(v15 - 655361) < 4)
      {
        if (self->_vertexCount)
        {
          v245 = 0;
          v246 = a6 - a5;
          if (a6 >= a5)
            v247 = a5;
          else
            v247 = a6;
          v415 = 4 * (v247 - 1);
          v248 = v247;
          v249 = (char *)a3 + 16;
          v250 = v246;
          do
          {
            v251 = objc_msgSend_stride(v422, (const char *)v16, v17);
            if (v415 + v251 * v245 < objc_msgSend_bufferSize(v422, v252, v253))
            {
              v254 = objc_msgSend_stride(v422, (const char *)v16, v17);
              if ((int)v248 < 1)
              {
                v267 = 0;
              }
              else
              {
                v255 = 0;
                v256 = v421 + v254 * v245;
                v257 = (float *)*((_QWORD *)a3 + 1);
                do
                {
                  v258 = (float)*(int *)(v256 + 4 * v255);
                  if ((unint64_t)v257 >= *v249)
                  {
                    v260 = *(float **)a3;
                    v261 = ((uint64_t)v257 - *(_QWORD *)a3) >> 2;
                    v262 = v261 + 1;
                    if ((unint64_t)(v261 + 1) >> 62)
                      sub_1DCAE4C44();
                    v263 = *v249 - (_QWORD)v260;
                    if (v263 >> 1 > v262)
                      v262 = v263 >> 1;
                    if ((unint64_t)v263 >= 0x7FFFFFFFFFFFFFFCLL)
                      v16 = 0x3FFFFFFFFFFFFFFFLL;
                    else
                      v16 = v262;
                    if (v16)
                    {
                      v264 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                      v260 = *(float **)a3;
                      v257 = (float *)*((_QWORD *)a3 + 1);
                    }
                    else
                    {
                      v264 = 0;
                    }
                    v265 = (float *)&v264[4 * v261];
                    *v265 = v258;
                    v259 = v265 + 1;
                    while (v257 != v260)
                    {
                      v266 = *((_DWORD *)v257-- - 1);
                      *((_DWORD *)v265-- - 1) = v266;
                    }
                    *(_QWORD *)a3 = v265;
                    *((_QWORD *)a3 + 1) = v259;
                    *((_QWORD *)a3 + 2) = &v264[4 * v16];
                    if (v260)
                      operator delete(v260);
                  }
                  else
                  {
                    *v257 = v258;
                    v259 = v257 + 1;
                  }
                  *((_QWORD *)a3 + 1) = v259;
                  ++v255;
                  v257 = v259;
                }
                while (v255 != v248);
                v267 = v248;
                self = v420;
              }
              if (v267 < v250)
              {
                v268 = (float *)*((_QWORD *)a3 + 1);
                do
                {
                  if ((unint64_t)v268 >= *v249)
                  {
                    v270 = *(float **)a3;
                    v271 = ((uint64_t)v268 - *(_QWORD *)a3) >> 2;
                    v272 = v271 + 1;
                    if ((unint64_t)(v271 + 1) >> 62)
                      sub_1DCAE4C44();
                    v273 = *v249 - (_QWORD)v270;
                    if (v273 >> 1 > v272)
                      v272 = v273 >> 1;
                    if ((unint64_t)v273 >= 0x7FFFFFFFFFFFFFFCLL)
                      v16 = 0x3FFFFFFFFFFFFFFFLL;
                    else
                      v16 = v272;
                    if (v16)
                    {
                      v274 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                      v270 = *(float **)a3;
                      v268 = (float *)*((_QWORD *)a3 + 1);
                    }
                    else
                    {
                      v274 = 0;
                    }
                    v275 = &v274[4 * v271];
                    *(_DWORD *)v275 = 0;
                    v269 = (float *)(v275 + 4);
                    while (v268 != v270)
                    {
                      v276 = *((_DWORD *)v268-- - 1);
                      *((_DWORD *)v275 - 1) = v276;
                      v275 -= 4;
                    }
                    *(_QWORD *)a3 = v275;
                    *((_QWORD *)a3 + 1) = v269;
                    *((_QWORD *)a3 + 2) = &v274[4 * v16];
                    if (v270)
                      operator delete(v270);
                  }
                  else
                  {
                    *v268 = 0.0;
                    v269 = v268 + 1;
                  }
                  *((_QWORD *)a3 + 1) = v269;
                  ++v267;
                  v268 = v269;
                }
                while (v267 < v250);
              }
            }
            ++v245;
          }
          while (v245 < self->_vertexCount);
        }
      }
      else if ((unint64_t)(v15 - 720897) < 4)
      {
        if (self->_vertexCount)
        {
          v374 = 0;
          v375 = a6 - a5;
          if (a6 >= a5)
            v376 = a5;
          else
            v376 = a6;
          v419 = 2 * (v376 - 1);
          v377 = v376;
          v378 = (char *)a3 + 16;
          v379 = v375;
          do
          {
            v380 = objc_msgSend_stride(v422, (const char *)v16, v17);
            if (v419 + v380 * v374 < objc_msgSend_bufferSize(v422, v381, v382))
            {
              v383 = objc_msgSend_stride(v422, (const char *)v16, v17);
              if ((int)v377 < 1)
              {
                v398 = 0;
              }
              else
              {
                v384 = 0;
                v385 = v421 + v383 * v374;
                do
                {
                  v386 = sub_1DCC1EDA0(*(unsigned __int16 *)(v385 + 2 * v384));
                  v387 = v386;
                  v389 = (float *)*((_QWORD *)a3 + 1);
                  v388 = *((_QWORD *)a3 + 2);
                  if ((unint64_t)v389 >= v388)
                  {
                    v391 = *(float **)a3;
                    v392 = ((uint64_t)v389 - *(_QWORD *)a3) >> 2;
                    v393 = v392 + 1;
                    if ((unint64_t)(v392 + 1) >> 62)
                      sub_1DCAE4C44();
                    v394 = v388 - (_QWORD)v391;
                    if (v394 >> 1 > v393)
                      v393 = v394 >> 1;
                    if ((unint64_t)v394 >= 0x7FFFFFFFFFFFFFFCLL)
                      v16 = 0x3FFFFFFFFFFFFFFFLL;
                    else
                      v16 = v393;
                    if (v16)
                    {
                      v395 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                      v391 = *(float **)a3;
                      v389 = (float *)*((_QWORD *)a3 + 1);
                    }
                    else
                    {
                      v395 = 0;
                    }
                    v396 = (float *)&v395[4 * v392];
                    *v396 = v387;
                    v390 = v396 + 1;
                    while (v389 != v391)
                    {
                      v397 = *((_DWORD *)v389-- - 1);
                      *((_DWORD *)v396-- - 1) = v397;
                    }
                    *(_QWORD *)a3 = v396;
                    *((_QWORD *)a3 + 1) = v390;
                    *((_QWORD *)a3 + 2) = &v395[4 * v16];
                    if (v391)
                      operator delete(v391);
                  }
                  else
                  {
                    *v389 = v386;
                    v390 = v389 + 1;
                  }
                  *((_QWORD *)a3 + 1) = v390;
                  ++v384;
                }
                while (v384 != v377);
                v398 = v377;
                self = v420;
              }
              if (v398 < v379)
              {
                v399 = (float *)*((_QWORD *)a3 + 1);
                do
                {
                  if ((unint64_t)v399 >= *v378)
                  {
                    v401 = *(float **)a3;
                    v402 = ((uint64_t)v399 - *(_QWORD *)a3) >> 2;
                    v403 = v402 + 1;
                    if ((unint64_t)(v402 + 1) >> 62)
                      sub_1DCAE4C44();
                    v404 = *v378 - (_QWORD)v401;
                    if (v404 >> 1 > v403)
                      v403 = v404 >> 1;
                    if ((unint64_t)v404 >= 0x7FFFFFFFFFFFFFFCLL)
                      v16 = 0x3FFFFFFFFFFFFFFFLL;
                    else
                      v16 = v403;
                    if (v16)
                    {
                      v405 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                      v401 = *(float **)a3;
                      v399 = (float *)*((_QWORD *)a3 + 1);
                    }
                    else
                    {
                      v405 = 0;
                    }
                    v406 = &v405[4 * v402];
                    *(_DWORD *)v406 = 0;
                    v400 = (float *)(v406 + 4);
                    while (v399 != v401)
                    {
                      v407 = *((_DWORD *)v399-- - 1);
                      *((_DWORD *)v406 - 1) = v407;
                      v406 -= 4;
                    }
                    *(_QWORD *)a3 = v406;
                    *((_QWORD *)a3 + 1) = v400;
                    *((_QWORD *)a3 + 2) = &v405[4 * v16];
                    if (v401)
                      operator delete(v401);
                  }
                  else
                  {
                    *v399 = 0.0;
                    v400 = v399 + 1;
                  }
                  *((_QWORD *)a3 + 1) = v400;
                  ++v398;
                  v399 = v400;
                }
                while (v398 < v379);
              }
            }
            ++v374;
          }
          while (v374 < self->_vertexCount);
        }
      }
      else if ((unint64_t)(v15 - 786433) < 4 && self->_vertexCount)
      {
        v115 = 0;
        v116 = a6 - a5;
        if (a6 >= a5)
          v117 = a5;
        else
          v117 = a6;
        v411 = 4 * (v117 - 1);
        v118 = v117;
        v119 = (char *)a3 + 16;
        v120 = v116;
        do
        {
          v121 = objc_msgSend_stride(v422, (const char *)v16, v17);
          if (v411 + v121 * v115 < objc_msgSend_bufferSize(v422, v122, v123))
          {
            v124 = objc_msgSend_stride(v422, (const char *)v16, v17);
            if ((int)v118 < 1)
            {
              v137 = 0;
            }
            else
            {
              v125 = 0;
              v126 = v421 + v124 * v115;
              v127 = (float *)*((_QWORD *)a3 + 1);
              do
              {
                v128 = *(_DWORD *)(v126 + 4 * v125);
                if ((unint64_t)v127 >= *v119)
                {
                  v130 = *(float **)a3;
                  v131 = ((uint64_t)v127 - *(_QWORD *)a3) >> 2;
                  v132 = v131 + 1;
                  if ((unint64_t)(v131 + 1) >> 62)
                    sub_1DCAE4C44();
                  v133 = *v119 - (_QWORD)v130;
                  if (v133 >> 1 > v132)
                    v132 = v133 >> 1;
                  if ((unint64_t)v133 >= 0x7FFFFFFFFFFFFFFCLL)
                    v16 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v16 = v132;
                  if (v16)
                  {
                    v134 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                    v130 = *(float **)a3;
                    v127 = (float *)*((_QWORD *)a3 + 1);
                  }
                  else
                  {
                    v134 = 0;
                  }
                  v135 = &v134[4 * v131];
                  *(_DWORD *)v135 = v128;
                  v129 = (float *)(v135 + 4);
                  while (v127 != v130)
                  {
                    v136 = *((_DWORD *)v127-- - 1);
                    *((_DWORD *)v135 - 1) = v136;
                    v135 -= 4;
                  }
                  *(_QWORD *)a3 = v135;
                  *((_QWORD *)a3 + 1) = v129;
                  *((_QWORD *)a3 + 2) = &v134[4 * v16];
                  if (v130)
                    operator delete(v130);
                }
                else
                {
                  *(_DWORD *)v127 = v128;
                  v129 = v127 + 1;
                }
                *((_QWORD *)a3 + 1) = v129;
                ++v125;
                v127 = v129;
              }
              while (v125 != v118);
              v137 = v118;
              self = v420;
            }
            if (v137 < v120)
            {
              v138 = (float *)*((_QWORD *)a3 + 1);
              do
              {
                if ((unint64_t)v138 >= *v119)
                {
                  v140 = *(float **)a3;
                  v141 = ((uint64_t)v138 - *(_QWORD *)a3) >> 2;
                  v142 = v141 + 1;
                  if ((unint64_t)(v141 + 1) >> 62)
                    sub_1DCAE4C44();
                  v143 = *v119 - (_QWORD)v140;
                  if (v143 >> 1 > v142)
                    v142 = v143 >> 1;
                  if ((unint64_t)v143 >= 0x7FFFFFFFFFFFFFFCLL)
                    v16 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v16 = v142;
                  if (v16)
                  {
                    v144 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                    v140 = *(float **)a3;
                    v138 = (float *)*((_QWORD *)a3 + 1);
                  }
                  else
                  {
                    v144 = 0;
                  }
                  v145 = &v144[4 * v141];
                  *(_DWORD *)v145 = 0;
                  v139 = (float *)(v145 + 4);
                  while (v138 != v140)
                  {
                    v146 = *((_DWORD *)v138-- - 1);
                    *((_DWORD *)v145 - 1) = v146;
                    v145 -= 4;
                  }
                  *(_QWORD *)a3 = v145;
                  *((_QWORD *)a3 + 1) = v139;
                  *((_QWORD *)a3 + 2) = &v144[4 * v16];
                  if (v140)
                    operator delete(v140);
                }
                else
                {
                  *v138 = 0.0;
                  v139 = v138 + 1;
                }
                *((_QWORD *)a3 + 1) = v139;
                ++v137;
                v138 = v139;
              }
              while (v137 < v120);
            }
          }
          ++v115;
        }
        while (v115 < self->_vertexCount);
      }
    }
    else if ((unint64_t)(v15 - 458753) < 4)
    {
      if (self->_vertexCount)
      {
        v180 = 0;
        v181 = a6 - a5;
        if (a6 >= a5)
          v182 = a5;
        else
          v182 = a6;
        v413 = 2 * (v182 - 1);
        v183 = v182;
        v184 = (char *)a3 + 16;
        v185 = v181;
        do
        {
          v186 = objc_msgSend_stride(v422, (const char *)v16, v17);
          if (v413 + v186 * v180 < objc_msgSend_bufferSize(v422, v187, v188))
          {
            v189 = objc_msgSend_stride(v422, (const char *)v16, v17);
            if ((int)v183 < 1)
            {
              v203 = 0;
            }
            else
            {
              v191 = 0;
              v192 = v421 + v189 * v180;
              v193 = (float *)*((_QWORD *)a3 + 1);
              do
              {
                LOWORD(v190) = *(_WORD *)(v192 + 2 * v191);
                v190 = (float)LODWORD(v190);
                v194 = v190 * 0.000015259;
                if ((unint64_t)v193 >= *v184)
                {
                  v196 = *(float **)a3;
                  v197 = ((uint64_t)v193 - *(_QWORD *)a3) >> 2;
                  v198 = v197 + 1;
                  if ((unint64_t)(v197 + 1) >> 62)
                    sub_1DCAE4C44();
                  v199 = *v184 - (_QWORD)v196;
                  if (v199 >> 1 > v198)
                    v198 = v199 >> 1;
                  if ((unint64_t)v199 >= 0x7FFFFFFFFFFFFFFCLL)
                    v16 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v16 = v198;
                  if (v16)
                  {
                    v200 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                    v196 = *(float **)a3;
                    v193 = (float *)*((_QWORD *)a3 + 1);
                  }
                  else
                  {
                    v200 = 0;
                  }
                  v201 = (float *)&v200[4 * v197];
                  *v201 = v194;
                  v195 = v201 + 1;
                  while (v193 != v196)
                  {
                    v202 = *((_DWORD *)v193-- - 1);
                    HIWORD(v190) = HIWORD(v202);
                    *((_DWORD *)v201-- - 1) = v202;
                  }
                  *(_QWORD *)a3 = v201;
                  *((_QWORD *)a3 + 1) = v195;
                  *((_QWORD *)a3 + 2) = &v200[4 * v16];
                  if (v196)
                    operator delete(v196);
                }
                else
                {
                  *v193 = v194;
                  v195 = v193 + 1;
                }
                *((_QWORD *)a3 + 1) = v195;
                ++v191;
                v193 = v195;
              }
              while (v191 != v183);
              v203 = v183;
              self = v420;
            }
            if (v203 < v185)
            {
              v204 = (float *)*((_QWORD *)a3 + 1);
              do
              {
                if ((unint64_t)v204 >= *v184)
                {
                  v206 = *(float **)a3;
                  v207 = ((uint64_t)v204 - *(_QWORD *)a3) >> 2;
                  v208 = v207 + 1;
                  if ((unint64_t)(v207 + 1) >> 62)
                    sub_1DCAE4C44();
                  v209 = *v184 - (_QWORD)v206;
                  if (v209 >> 1 > v208)
                    v208 = v209 >> 1;
                  if ((unint64_t)v209 >= 0x7FFFFFFFFFFFFFFCLL)
                    v16 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v16 = v208;
                  if (v16)
                  {
                    v210 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                    v206 = *(float **)a3;
                    v204 = (float *)*((_QWORD *)a3 + 1);
                  }
                  else
                  {
                    v210 = 0;
                  }
                  v211 = &v210[4 * v207];
                  *(_DWORD *)v211 = 0;
                  v205 = (float *)(v211 + 4);
                  while (v204 != v206)
                  {
                    v212 = *((_DWORD *)v204-- - 1);
                    *((_DWORD *)v211 - 1) = v212;
                    v211 -= 4;
                  }
                  *(_QWORD *)a3 = v211;
                  *((_QWORD *)a3 + 1) = v205;
                  *((_QWORD *)a3 + 2) = &v210[4 * v16];
                  if (v206)
                    operator delete(v206);
                }
                else
                {
                  *v204 = 0.0;
                  v205 = v204 + 1;
                }
                *((_QWORD *)a3 + 1) = v205;
                ++v203;
                v204 = v205;
              }
              while (v203 < v185);
            }
          }
          ++v180;
        }
        while (v180 < self->_vertexCount);
      }
    }
    else if ((unint64_t)(v15 - 524289) < 4)
    {
      if (self->_vertexCount)
      {
        v309 = 0;
        v310 = a6 - a5;
        if (a6 >= a5)
          v311 = a5;
        else
          v311 = a6;
        v417 = 2 * (v311 - 1);
        v312 = v311;
        v313 = (char *)a3 + 16;
        v314 = v310;
        do
        {
          v315 = objc_msgSend_stride(v422, (const char *)v16, v17);
          if (v417 + v315 * v309 < objc_msgSend_bufferSize(v422, v316, v317))
          {
            v318 = objc_msgSend_stride(v422, (const char *)v16, v17);
            if ((int)v312 < 1)
            {
              v331 = 0;
            }
            else
            {
              v319 = 0;
              v320 = v421 + v318 * v309;
              v321 = (float *)*((_QWORD *)a3 + 1);
              do
              {
                v322 = (float)*(__int16 *)(v320 + 2 * v319) * 0.000030519;
                if ((unint64_t)v321 >= *v313)
                {
                  v324 = *(float **)a3;
                  v325 = ((uint64_t)v321 - *(_QWORD *)a3) >> 2;
                  v326 = v325 + 1;
                  if ((unint64_t)(v325 + 1) >> 62)
                    sub_1DCAE4C44();
                  v327 = *v313 - (_QWORD)v324;
                  if (v327 >> 1 > v326)
                    v326 = v327 >> 1;
                  if ((unint64_t)v327 >= 0x7FFFFFFFFFFFFFFCLL)
                    v16 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v16 = v326;
                  if (v16)
                  {
                    v328 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                    v324 = *(float **)a3;
                    v321 = (float *)*((_QWORD *)a3 + 1);
                  }
                  else
                  {
                    v328 = 0;
                  }
                  v329 = (float *)&v328[4 * v325];
                  *v329 = v322;
                  v323 = v329 + 1;
                  while (v321 != v324)
                  {
                    v330 = *((_DWORD *)v321-- - 1);
                    *((_DWORD *)v329-- - 1) = v330;
                  }
                  *(_QWORD *)a3 = v329;
                  *((_QWORD *)a3 + 1) = v323;
                  *((_QWORD *)a3 + 2) = &v328[4 * v16];
                  if (v324)
                    operator delete(v324);
                }
                else
                {
                  *v321 = v322;
                  v323 = v321 + 1;
                }
                *((_QWORD *)a3 + 1) = v323;
                ++v319;
                v321 = v323;
              }
              while (v319 != v312);
              v331 = v312;
              self = v420;
            }
            if (v331 < v314)
            {
              v332 = (float *)*((_QWORD *)a3 + 1);
              do
              {
                if ((unint64_t)v332 >= *v313)
                {
                  v334 = *(float **)a3;
                  v335 = ((uint64_t)v332 - *(_QWORD *)a3) >> 2;
                  v336 = v335 + 1;
                  if ((unint64_t)(v335 + 1) >> 62)
                    sub_1DCAE4C44();
                  v337 = *v313 - (_QWORD)v334;
                  if (v337 >> 1 > v336)
                    v336 = v337 >> 1;
                  if ((unint64_t)v337 >= 0x7FFFFFFFFFFFFFFCLL)
                    v16 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v16 = v336;
                  if (v16)
                  {
                    v338 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                    v334 = *(float **)a3;
                    v332 = (float *)*((_QWORD *)a3 + 1);
                  }
                  else
                  {
                    v338 = 0;
                  }
                  v339 = &v338[4 * v335];
                  *(_DWORD *)v339 = 0;
                  v333 = (float *)(v339 + 4);
                  while (v332 != v334)
                  {
                    v340 = *((_DWORD *)v332-- - 1);
                    *((_DWORD *)v339 - 1) = v340;
                    v339 -= 4;
                  }
                  *(_QWORD *)a3 = v339;
                  *((_QWORD *)a3 + 1) = v333;
                  *((_QWORD *)a3 + 2) = &v338[4 * v16];
                  if (v334)
                    operator delete(v334);
                }
                else
                {
                  *v332 = 0.0;
                  v333 = v332 + 1;
                }
                *((_QWORD *)a3 + 1) = v333;
                ++v331;
                v332 = v333;
              }
              while (v331 < v314);
            }
          }
          ++v309;
        }
        while (v309 < self->_vertexCount);
      }
    }
    else if ((unint64_t)(v15 - 589825) < 4 && self->_vertexCount)
    {
      v51 = 0;
      v52 = a6 - a5;
      if (a6 >= a5)
        v53 = a5;
      else
        v53 = a6;
      v409 = 4 * (v53 - 1);
      v54 = v53;
      v55 = (char *)a3 + 16;
      v56 = v52;
      do
      {
        v57 = objc_msgSend_stride(v422, (const char *)v16, v17);
        if (v409 + v57 * v51 < objc_msgSend_bufferSize(v422, v58, v59))
        {
          v60 = objc_msgSend_stride(v422, (const char *)v16, v17);
          if ((int)v54 < 1)
          {
            v73 = 0;
          }
          else
          {
            v61 = 0;
            v62 = v421 + v60 * v51;
            v63 = (float *)*((_QWORD *)a3 + 1);
            do
            {
              v64 = (float)*(unsigned int *)(v62 + 4 * v61);
              if ((unint64_t)v63 >= *v55)
              {
                v66 = *(float **)a3;
                v67 = ((uint64_t)v63 - *(_QWORD *)a3) >> 2;
                v68 = v67 + 1;
                if ((unint64_t)(v67 + 1) >> 62)
                  sub_1DCAE4C44();
                v69 = *v55 - (_QWORD)v66;
                if (v69 >> 1 > v68)
                  v68 = v69 >> 1;
                if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFFCLL)
                  v16 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v16 = v68;
                if (v16)
                {
                  v70 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                  v66 = *(float **)a3;
                  v63 = (float *)*((_QWORD *)a3 + 1);
                }
                else
                {
                  v70 = 0;
                }
                v71 = (float *)&v70[4 * v67];
                *v71 = v64;
                v65 = v71 + 1;
                while (v63 != v66)
                {
                  v72 = *((_DWORD *)v63-- - 1);
                  *((_DWORD *)v71-- - 1) = v72;
                }
                *(_QWORD *)a3 = v71;
                *((_QWORD *)a3 + 1) = v65;
                *((_QWORD *)a3 + 2) = &v70[4 * v16];
                if (v66)
                  operator delete(v66);
              }
              else
              {
                *v63 = v64;
                v65 = v63 + 1;
              }
              *((_QWORD *)a3 + 1) = v65;
              ++v61;
              v63 = v65;
            }
            while (v61 != v54);
            v73 = v54;
            self = v420;
          }
          if (v73 < v56)
          {
            v74 = (float *)*((_QWORD *)a3 + 1);
            do
            {
              if ((unint64_t)v74 >= *v55)
              {
                v76 = *(float **)a3;
                v77 = ((uint64_t)v74 - *(_QWORD *)a3) >> 2;
                v78 = v77 + 1;
                if ((unint64_t)(v77 + 1) >> 62)
                  sub_1DCAE4C44();
                v79 = *v55 - (_QWORD)v76;
                if (v79 >> 1 > v78)
                  v78 = v79 >> 1;
                if ((unint64_t)v79 >= 0x7FFFFFFFFFFFFFFCLL)
                  v16 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v16 = v78;
                if (v16)
                {
                  v80 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                  v76 = *(float **)a3;
                  v74 = (float *)*((_QWORD *)a3 + 1);
                }
                else
                {
                  v80 = 0;
                }
                v81 = &v80[4 * v77];
                *(_DWORD *)v81 = 0;
                v75 = (float *)(v81 + 4);
                while (v74 != v76)
                {
                  v82 = *((_DWORD *)v74-- - 1);
                  *((_DWORD *)v81 - 1) = v82;
                  v81 -= 4;
                }
                *(_QWORD *)a3 = v81;
                *((_QWORD *)a3 + 1) = v75;
                *((_QWORD *)a3 + 2) = &v80[4 * v16];
                if (v76)
                  operator delete(v76);
              }
              else
              {
                *v74 = 0.0;
                v75 = v74 + 1;
              }
              *((_QWORD *)a3 + 1) = v75;
              ++v73;
              v74 = v75;
            }
            while (v73 < v56);
          }
        }
        ++v51;
      }
      while (v51 < self->_vertexCount);
    }
  }
  else if (v15 > 0x40000)
  {
    if ((unint64_t)(v15 - 262145) < 4)
    {
      if (self->_vertexCount)
      {
        v213 = 0;
        v214 = a6 - a5;
        if (a6 >= a5)
          v215 = a5;
        else
          v215 = a6;
        v414 = v215 - 1;
        v216 = v215;
        v217 = (char *)a3 + 16;
        v218 = v214;
        do
        {
          v219 = objc_msgSend_stride(v422, (const char *)v16, v17);
          if (v414 + v219 * v213 < objc_msgSend_bufferSize(v422, v220, v221))
          {
            v222 = objc_msgSend_stride(v422, (const char *)v16, v17);
            if ((int)v216 < 1)
            {
              v235 = 0;
            }
            else
            {
              v223 = 0;
              v224 = v421 + v222 * v213;
              v225 = (float *)*((_QWORD *)a3 + 1);
              do
              {
                v226 = (float)*(char *)(v224 + v223) * 0.007874;
                if ((unint64_t)v225 >= *v217)
                {
                  v228 = *(float **)a3;
                  v229 = ((uint64_t)v225 - *(_QWORD *)a3) >> 2;
                  v230 = v229 + 1;
                  if ((unint64_t)(v229 + 1) >> 62)
                    sub_1DCAE4C44();
                  v231 = *v217 - (_QWORD)v228;
                  if (v231 >> 1 > v230)
                    v230 = v231 >> 1;
                  if ((unint64_t)v231 >= 0x7FFFFFFFFFFFFFFCLL)
                    v16 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v16 = v230;
                  if (v16)
                  {
                    v232 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                    v228 = *(float **)a3;
                    v225 = (float *)*((_QWORD *)a3 + 1);
                  }
                  else
                  {
                    v232 = 0;
                  }
                  v233 = (float *)&v232[4 * v229];
                  *v233 = v226;
                  v227 = v233 + 1;
                  while (v225 != v228)
                  {
                    v234 = *((_DWORD *)v225-- - 1);
                    *((_DWORD *)v233-- - 1) = v234;
                  }
                  *(_QWORD *)a3 = v233;
                  *((_QWORD *)a3 + 1) = v227;
                  *((_QWORD *)a3 + 2) = &v232[4 * v16];
                  if (v228)
                    operator delete(v228);
                }
                else
                {
                  *v225 = v226;
                  v227 = v225 + 1;
                }
                *((_QWORD *)a3 + 1) = v227;
                ++v223;
                v225 = v227;
              }
              while (v223 != v216);
              v235 = v216;
              self = v420;
            }
            if (v235 < v218)
            {
              v236 = (float *)*((_QWORD *)a3 + 1);
              do
              {
                if ((unint64_t)v236 >= *v217)
                {
                  v238 = *(float **)a3;
                  v239 = ((uint64_t)v236 - *(_QWORD *)a3) >> 2;
                  v240 = v239 + 1;
                  if ((unint64_t)(v239 + 1) >> 62)
                    sub_1DCAE4C44();
                  v241 = *v217 - (_QWORD)v238;
                  if (v241 >> 1 > v240)
                    v240 = v241 >> 1;
                  if ((unint64_t)v241 >= 0x7FFFFFFFFFFFFFFCLL)
                    v16 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v16 = v240;
                  if (v16)
                  {
                    v242 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                    v238 = *(float **)a3;
                    v236 = (float *)*((_QWORD *)a3 + 1);
                  }
                  else
                  {
                    v242 = 0;
                  }
                  v243 = &v242[4 * v239];
                  *(_DWORD *)v243 = 0;
                  v237 = (float *)(v243 + 4);
                  while (v236 != v238)
                  {
                    v244 = *((_DWORD *)v236-- - 1);
                    *((_DWORD *)v243 - 1) = v244;
                    v243 -= 4;
                  }
                  *(_QWORD *)a3 = v243;
                  *((_QWORD *)a3 + 1) = v237;
                  *((_QWORD *)a3 + 2) = &v242[4 * v16];
                  if (v238)
                    operator delete(v238);
                }
                else
                {
                  *v236 = 0.0;
                  v237 = v236 + 1;
                }
                *((_QWORD *)a3 + 1) = v237;
                ++v235;
                v236 = v237;
              }
              while (v235 < v218);
            }
          }
          ++v213;
        }
        while (v213 < self->_vertexCount);
      }
    }
    else if ((unint64_t)(v15 - 327681) < 4)
    {
      if (self->_vertexCount)
      {
        v341 = 0;
        v342 = a6 - a5;
        if (a6 >= a5)
          v343 = a5;
        else
          v343 = a6;
        v418 = 2 * (v343 - 1);
        v344 = v343;
        v345 = (char *)a3 + 16;
        v346 = v342;
        do
        {
          v347 = objc_msgSend_stride(v422, (const char *)v16, v17);
          if (v418 + v347 * v341 < objc_msgSend_bufferSize(v422, v348, v349))
          {
            v350 = objc_msgSend_stride(v422, (const char *)v16, v17);
            if ((int)v344 < 1)
            {
              v364 = 0;
            }
            else
            {
              v352 = 0;
              v353 = v421 + v350 * v341;
              v354 = (float *)*((_QWORD *)a3 + 1);
              do
              {
                LOWORD(v351) = *(_WORD *)(v353 + 2 * v352);
                v355 = (float)v351;
                if ((unint64_t)v354 >= *v345)
                {
                  v357 = *(float **)a3;
                  v358 = ((uint64_t)v354 - *(_QWORD *)a3) >> 2;
                  v359 = v358 + 1;
                  if ((unint64_t)(v358 + 1) >> 62)
                    sub_1DCAE4C44();
                  v360 = *v345 - (_QWORD)v357;
                  if (v360 >> 1 > v359)
                    v359 = v360 >> 1;
                  if ((unint64_t)v360 >= 0x7FFFFFFFFFFFFFFCLL)
                    v16 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v16 = v359;
                  if (v16)
                  {
                    v361 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                    v357 = *(float **)a3;
                    v354 = (float *)*((_QWORD *)a3 + 1);
                  }
                  else
                  {
                    v361 = 0;
                  }
                  v362 = (float *)&v361[4 * v358];
                  *v362 = v355;
                  v356 = v362 + 1;
                  while (v354 != v357)
                  {
                    v363 = *((_DWORD *)v354-- - 1);
                    HIWORD(v351) = HIWORD(v363);
                    *((_DWORD *)v362-- - 1) = v363;
                  }
                  *(_QWORD *)a3 = v362;
                  *((_QWORD *)a3 + 1) = v356;
                  *((_QWORD *)a3 + 2) = &v361[4 * v16];
                  if (v357)
                    operator delete(v357);
                }
                else
                {
                  *v354 = v355;
                  v356 = v354 + 1;
                }
                *((_QWORD *)a3 + 1) = v356;
                ++v352;
                v354 = v356;
              }
              while (v352 != v344);
              v364 = v344;
              self = v420;
            }
            if (v364 < v346)
            {
              v365 = (float *)*((_QWORD *)a3 + 1);
              do
              {
                if ((unint64_t)v365 >= *v345)
                {
                  v367 = *(float **)a3;
                  v368 = ((uint64_t)v365 - *(_QWORD *)a3) >> 2;
                  v369 = v368 + 1;
                  if ((unint64_t)(v368 + 1) >> 62)
                    sub_1DCAE4C44();
                  v370 = *v345 - (_QWORD)v367;
                  if (v370 >> 1 > v369)
                    v369 = v370 >> 1;
                  if ((unint64_t)v370 >= 0x7FFFFFFFFFFFFFFCLL)
                    v16 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v16 = v369;
                  if (v16)
                  {
                    v371 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                    v367 = *(float **)a3;
                    v365 = (float *)*((_QWORD *)a3 + 1);
                  }
                  else
                  {
                    v371 = 0;
                  }
                  v372 = &v371[4 * v368];
                  *(_DWORD *)v372 = 0;
                  v366 = (float *)(v372 + 4);
                  while (v365 != v367)
                  {
                    v373 = *((_DWORD *)v365-- - 1);
                    *((_DWORD *)v372 - 1) = v373;
                    v372 -= 4;
                  }
                  *(_QWORD *)a3 = v372;
                  *((_QWORD *)a3 + 1) = v366;
                  *((_QWORD *)a3 + 2) = &v371[4 * v16];
                  if (v367)
                    operator delete(v367);
                }
                else
                {
                  *v365 = 0.0;
                  v366 = v365 + 1;
                }
                *((_QWORD *)a3 + 1) = v366;
                ++v364;
                v365 = v366;
              }
              while (v364 < v346);
            }
          }
          ++v341;
        }
        while (v341 < self->_vertexCount);
      }
    }
    else if ((unint64_t)(v15 - 393217) < 4 && self->_vertexCount)
    {
      v83 = 0;
      v84 = a6 - a5;
      if (a6 >= a5)
        v85 = a5;
      else
        v85 = a6;
      v410 = 2 * (v85 - 1);
      v86 = v85;
      v87 = (char *)a3 + 16;
      v88 = v84;
      do
      {
        v89 = objc_msgSend_stride(v422, (const char *)v16, v17);
        if (v410 + v89 * v83 < objc_msgSend_bufferSize(v422, v90, v91))
        {
          v92 = objc_msgSend_stride(v422, (const char *)v16, v17);
          if ((int)v86 < 1)
          {
            v105 = 0;
          }
          else
          {
            v93 = 0;
            v94 = v421 + v92 * v83;
            v95 = (float *)*((_QWORD *)a3 + 1);
            do
            {
              v96 = (float)*(__int16 *)(v94 + 2 * v93);
              if ((unint64_t)v95 >= *v87)
              {
                v98 = *(float **)a3;
                v99 = ((uint64_t)v95 - *(_QWORD *)a3) >> 2;
                v100 = v99 + 1;
                if ((unint64_t)(v99 + 1) >> 62)
                  sub_1DCAE4C44();
                v101 = *v87 - (_QWORD)v98;
                if (v101 >> 1 > v100)
                  v100 = v101 >> 1;
                if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFFCLL)
                  v16 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v16 = v100;
                if (v16)
                {
                  v102 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                  v98 = *(float **)a3;
                  v95 = (float *)*((_QWORD *)a3 + 1);
                }
                else
                {
                  v102 = 0;
                }
                v103 = (float *)&v102[4 * v99];
                *v103 = v96;
                v97 = v103 + 1;
                while (v95 != v98)
                {
                  v104 = *((_DWORD *)v95-- - 1);
                  *((_DWORD *)v103-- - 1) = v104;
                }
                *(_QWORD *)a3 = v103;
                *((_QWORD *)a3 + 1) = v97;
                *((_QWORD *)a3 + 2) = &v102[4 * v16];
                if (v98)
                  operator delete(v98);
              }
              else
              {
                *v95 = v96;
                v97 = v95 + 1;
              }
              *((_QWORD *)a3 + 1) = v97;
              ++v93;
              v95 = v97;
            }
            while (v93 != v86);
            v105 = v86;
            self = v420;
          }
          if (v105 < v88)
          {
            v106 = (float *)*((_QWORD *)a3 + 1);
            do
            {
              if ((unint64_t)v106 >= *v87)
              {
                v108 = *(float **)a3;
                v109 = ((uint64_t)v106 - *(_QWORD *)a3) >> 2;
                v110 = v109 + 1;
                if ((unint64_t)(v109 + 1) >> 62)
                  sub_1DCAE4C44();
                v111 = *v87 - (_QWORD)v108;
                if (v111 >> 1 > v110)
                  v110 = v111 >> 1;
                if ((unint64_t)v111 >= 0x7FFFFFFFFFFFFFFCLL)
                  v16 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v16 = v110;
                if (v16)
                {
                  v112 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                  v108 = *(float **)a3;
                  v106 = (float *)*((_QWORD *)a3 + 1);
                }
                else
                {
                  v112 = 0;
                }
                v113 = &v112[4 * v109];
                *(_DWORD *)v113 = 0;
                v107 = (float *)(v113 + 4);
                while (v106 != v108)
                {
                  v114 = *((_DWORD *)v106-- - 1);
                  *((_DWORD *)v113 - 1) = v114;
                  v113 -= 4;
                }
                *(_QWORD *)a3 = v113;
                *((_QWORD *)a3 + 1) = v107;
                *((_QWORD *)a3 + 2) = &v112[4 * v16];
                if (v108)
                  operator delete(v108);
              }
              else
              {
                *v106 = 0.0;
                v107 = v106 + 1;
              }
              *((_QWORD *)a3 + 1) = v107;
              ++v105;
              v106 = v107;
            }
            while (v105 < v88);
          }
        }
        ++v83;
      }
      while (v83 < self->_vertexCount);
    }
  }
  else if ((unint64_t)(v15 - 65537) < 4)
  {
    if (self->_vertexCount)
    {
      v147 = 0;
      v148 = a6 - a5;
      if (a6 >= a5)
        v149 = a5;
      else
        v149 = a6;
      v412 = v149 - 1;
      v150 = v149;
      v151 = (char *)a3 + 16;
      v152 = v148;
      do
      {
        v153 = objc_msgSend_stride(v422, (const char *)v16, v17);
        if (v412 + v153 * v147 < objc_msgSend_bufferSize(v422, v154, v155))
        {
          v156 = objc_msgSend_stride(v422, (const char *)v16, v17);
          if ((int)v150 < 1)
          {
            v170 = 0;
          }
          else
          {
            v158 = 0;
            v159 = v421 + v156 * v147;
            v160 = (float *)*((_QWORD *)a3 + 1);
            do
            {
              LOBYTE(v157) = *(_BYTE *)(v159 + v158);
              v161 = (float)v157;
              if ((unint64_t)v160 >= *v151)
              {
                v163 = *(float **)a3;
                v164 = ((uint64_t)v160 - *(_QWORD *)a3) >> 2;
                v165 = v164 + 1;
                if ((unint64_t)(v164 + 1) >> 62)
                  sub_1DCAE4C44();
                v166 = *v151 - (_QWORD)v163;
                if (v166 >> 1 > v165)
                  v165 = v166 >> 1;
                if ((unint64_t)v166 >= 0x7FFFFFFFFFFFFFFCLL)
                  v16 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v16 = v165;
                if (v16)
                {
                  v167 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                  v163 = *(float **)a3;
                  v160 = (float *)*((_QWORD *)a3 + 1);
                }
                else
                {
                  v167 = 0;
                }
                v168 = (float *)&v167[4 * v164];
                *v168 = v161;
                v162 = v168 + 1;
                while (v160 != v163)
                {
                  v169 = *((_DWORD *)v160-- - 1);
                  v157 = v169;
                  *((_DWORD *)v168-- - 1) = v169;
                }
                *(_QWORD *)a3 = v168;
                *((_QWORD *)a3 + 1) = v162;
                *((_QWORD *)a3 + 2) = &v167[4 * v16];
                if (v163)
                  operator delete(v163);
              }
              else
              {
                *v160 = v161;
                v162 = v160 + 1;
              }
              *((_QWORD *)a3 + 1) = v162;
              ++v158;
              v160 = v162;
            }
            while (v158 != v150);
            v170 = v150;
            self = v420;
          }
          if (v170 < v152)
          {
            v171 = (float *)*((_QWORD *)a3 + 1);
            do
            {
              if ((unint64_t)v171 >= *v151)
              {
                v173 = *(float **)a3;
                v174 = ((uint64_t)v171 - *(_QWORD *)a3) >> 2;
                v175 = v174 + 1;
                if ((unint64_t)(v174 + 1) >> 62)
                  sub_1DCAE4C44();
                v176 = *v151 - (_QWORD)v173;
                if (v176 >> 1 > v175)
                  v175 = v176 >> 1;
                if ((unint64_t)v176 >= 0x7FFFFFFFFFFFFFFCLL)
                  v16 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v16 = v175;
                if (v16)
                {
                  v177 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                  v173 = *(float **)a3;
                  v171 = (float *)*((_QWORD *)a3 + 1);
                }
                else
                {
                  v177 = 0;
                }
                v178 = &v177[4 * v174];
                *(_DWORD *)v178 = 0;
                v172 = (float *)(v178 + 4);
                while (v171 != v173)
                {
                  v179 = *((_DWORD *)v171-- - 1);
                  *((_DWORD *)v178 - 1) = v179;
                  v178 -= 4;
                }
                *(_QWORD *)a3 = v178;
                *((_QWORD *)a3 + 1) = v172;
                *((_QWORD *)a3 + 2) = &v177[4 * v16];
                if (v173)
                  operator delete(v173);
              }
              else
              {
                *v171 = 0.0;
                v172 = v171 + 1;
              }
              *((_QWORD *)a3 + 1) = v172;
              ++v170;
              v171 = v172;
            }
            while (v170 < v152);
          }
        }
        ++v147;
      }
      while (v147 < self->_vertexCount);
    }
  }
  else if ((unint64_t)(v15 - 131073) < 4)
  {
    if (self->_vertexCount)
    {
      v277 = 0;
      v278 = a6 - a5;
      if (a6 >= a5)
        v279 = a5;
      else
        v279 = a6;
      v416 = v279 - 1;
      v280 = v279;
      v281 = (char *)a3 + 16;
      v282 = v278;
      do
      {
        v283 = objc_msgSend_stride(v422, (const char *)v16, v17);
        if (v416 + v283 * v277 < objc_msgSend_bufferSize(v422, v284, v285))
        {
          v286 = objc_msgSend_stride(v422, (const char *)v16, v17);
          if ((int)v280 < 1)
          {
            v299 = 0;
          }
          else
          {
            v287 = 0;
            v288 = v421 + v286 * v277;
            v289 = (float *)*((_QWORD *)a3 + 1);
            do
            {
              v290 = (float)*(char *)(v288 + v287);
              if ((unint64_t)v289 >= *v281)
              {
                v292 = *(float **)a3;
                v293 = ((uint64_t)v289 - *(_QWORD *)a3) >> 2;
                v294 = v293 + 1;
                if ((unint64_t)(v293 + 1) >> 62)
                  sub_1DCAE4C44();
                v295 = *v281 - (_QWORD)v292;
                if (v295 >> 1 > v294)
                  v294 = v295 >> 1;
                if ((unint64_t)v295 >= 0x7FFFFFFFFFFFFFFCLL)
                  v16 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v16 = v294;
                if (v16)
                {
                  v296 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                  v292 = *(float **)a3;
                  v289 = (float *)*((_QWORD *)a3 + 1);
                }
                else
                {
                  v296 = 0;
                }
                v297 = (float *)&v296[4 * v293];
                *v297 = v290;
                v291 = v297 + 1;
                while (v289 != v292)
                {
                  v298 = *((_DWORD *)v289-- - 1);
                  *((_DWORD *)v297-- - 1) = v298;
                }
                *(_QWORD *)a3 = v297;
                *((_QWORD *)a3 + 1) = v291;
                *((_QWORD *)a3 + 2) = &v296[4 * v16];
                if (v292)
                  operator delete(v292);
              }
              else
              {
                *v289 = v290;
                v291 = v289 + 1;
              }
              *((_QWORD *)a3 + 1) = v291;
              ++v287;
              v289 = v291;
            }
            while (v287 != v280);
            v299 = v280;
            self = v420;
          }
          if (v299 < v282)
          {
            v300 = (float *)*((_QWORD *)a3 + 1);
            do
            {
              if ((unint64_t)v300 >= *v281)
              {
                v302 = *(float **)a3;
                v303 = ((uint64_t)v300 - *(_QWORD *)a3) >> 2;
                v304 = v303 + 1;
                if ((unint64_t)(v303 + 1) >> 62)
                  sub_1DCAE4C44();
                v305 = *v281 - (_QWORD)v302;
                if (v305 >> 1 > v304)
                  v304 = v305 >> 1;
                if ((unint64_t)v305 >= 0x7FFFFFFFFFFFFFFCLL)
                  v16 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v16 = v304;
                if (v16)
                {
                  v306 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                  v302 = *(float **)a3;
                  v300 = (float *)*((_QWORD *)a3 + 1);
                }
                else
                {
                  v306 = 0;
                }
                v307 = &v306[4 * v303];
                *(_DWORD *)v307 = 0;
                v301 = (float *)(v307 + 4);
                while (v300 != v302)
                {
                  v308 = *((_DWORD *)v300-- - 1);
                  *((_DWORD *)v307 - 1) = v308;
                  v307 -= 4;
                }
                *(_QWORD *)a3 = v307;
                *((_QWORD *)a3 + 1) = v301;
                *((_QWORD *)a3 + 2) = &v306[4 * v16];
                if (v302)
                  operator delete(v302);
              }
              else
              {
                *v300 = 0.0;
                v301 = v300 + 1;
              }
              *((_QWORD *)a3 + 1) = v301;
              ++v299;
              v300 = v301;
            }
            while (v299 < v282);
          }
        }
        ++v277;
      }
      while (v277 < self->_vertexCount);
    }
  }
  else if ((unint64_t)(v15 - 196609) < 4 && self->_vertexCount)
  {
    v18 = 0;
    v19 = a6 - a5;
    if (a6 >= a5)
      v20 = a5;
    else
      v20 = a6;
    v408 = v20 - 1;
    v21 = v20;
    v22 = (char *)a3 + 16;
    v23 = v19;
    do
    {
      v24 = objc_msgSend_stride(v422, (const char *)v16, v17);
      if (v408 + v24 * v18 < objc_msgSend_bufferSize(v422, v25, v26))
      {
        v27 = objc_msgSend_stride(v422, (const char *)v16, v17);
        if ((int)v21 < 1)
        {
          v41 = 0;
        }
        else
        {
          v29 = 0;
          v30 = v421 + v27 * v18;
          v31 = (float *)*((_QWORD *)a3 + 1);
          do
          {
            LOBYTE(v28) = *(_BYTE *)(v30 + v29);
            v28 = (float)LODWORD(v28);
            v32 = v28 * 0.0039216;
            if ((unint64_t)v31 >= *v22)
            {
              v34 = *(float **)a3;
              v35 = ((uint64_t)v31 - *(_QWORD *)a3) >> 2;
              v36 = v35 + 1;
              if ((unint64_t)(v35 + 1) >> 62)
                sub_1DCAE4C44();
              v37 = *v22 - (_QWORD)v34;
              if (v37 >> 1 > v36)
                v36 = v37 >> 1;
              if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL)
                v16 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v16 = v36;
              if (v16)
              {
                v38 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                v34 = *(float **)a3;
                v31 = (float *)*((_QWORD *)a3 + 1);
              }
              else
              {
                v38 = 0;
              }
              v39 = (float *)&v38[4 * v35];
              *v39 = v32;
              v33 = v39 + 1;
              while (v31 != v34)
              {
                v40 = *--v31;
                v28 = v40;
                *--v39 = v40;
              }
              *(_QWORD *)a3 = v39;
              *((_QWORD *)a3 + 1) = v33;
              *((_QWORD *)a3 + 2) = &v38[4 * v16];
              if (v34)
                operator delete(v34);
            }
            else
            {
              *v31 = v32;
              v33 = v31 + 1;
            }
            *((_QWORD *)a3 + 1) = v33;
            ++v29;
            v31 = v33;
          }
          while (v29 != v21);
          v41 = v21;
          self = v420;
        }
        if (v41 < v23)
        {
          v42 = (float *)*((_QWORD *)a3 + 1);
          do
          {
            if ((unint64_t)v42 >= *v22)
            {
              v44 = *(float **)a3;
              v45 = ((uint64_t)v42 - *(_QWORD *)a3) >> 2;
              v46 = v45 + 1;
              if ((unint64_t)(v45 + 1) >> 62)
                sub_1DCAE4C44();
              v47 = *v22 - (_QWORD)v44;
              if (v47 >> 1 > v46)
                v46 = v47 >> 1;
              if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFFCLL)
                v16 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v16 = v46;
              if (v16)
              {
                v48 = (char *)sub_1DCAE4D04((uint64_t)a3 + 16, v16);
                v44 = *(float **)a3;
                v42 = (float *)*((_QWORD *)a3 + 1);
              }
              else
              {
                v48 = 0;
              }
              v49 = &v48[4 * v45];
              *(_DWORD *)v49 = 0;
              v43 = (float *)(v49 + 4);
              while (v42 != v44)
              {
                v50 = *((_DWORD *)v42-- - 1);
                *((_DWORD *)v49 - 1) = v50;
                v49 -= 4;
              }
              *(_QWORD *)a3 = v49;
              *((_QWORD *)a3 + 1) = v43;
              *((_QWORD *)a3 + 2) = &v48[4 * v16];
              if (v44)
                operator delete(v44);
            }
            else
            {
              *v42 = 0.0;
              v43 = v42 + 1;
            }
            *((_QWORD *)a3 + 1) = v43;
            ++v41;
            v42 = v43;
          }
          while (v41 < v23);
        }
      }
      ++v18;
    }
    while (v18 < self->_vertexCount);
  }

}

- (void)copyDataVector:(void *)a3 toAttr:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  char v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  _DWORD *v25;
  int *v26;
  unint64_t v27;
  int v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  _WORD *v42;
  uint64_t v43;
  unint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE *v62;
  uint64_t v63;
  unint64_t v64;
  float v65;
  float v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE *v78;
  uint64_t v79;
  unint64_t v80;
  float v81;
  float v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  _BYTE *v94;
  uint64_t v95;
  unint64_t v96;
  float v97;
  float v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  _WORD *v114;
  float *v115;
  unint64_t v116;
  float v117;
  uint64_t v118;
  unint64_t v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  _BYTE *v129;
  uint64_t v130;
  unint64_t v131;
  float v132;
  float v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  _WORD *v147;
  float *v148;
  unint64_t v149;
  float v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  unint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  _WORD *v164;
  float *v165;
  unint64_t v166;
  float v167;
  float v168;
  float v169;
  float v170;
  const char *v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  unint64_t v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  _DWORD *v186;
  float *v187;
  unint64_t v188;
  float v189;
  uint64_t v190;
  unint64_t v191;
  unint64_t v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  _WORD *v201;
  float *v202;
  unint64_t v203;
  float v204;
  float v205;
  float v206;
  float v207;
  const char *v208;
  uint64_t v209;
  unsigned int v210;
  uint64_t v211;
  unint64_t v212;
  uint64_t v213;
  unint64_t v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  _DWORD *v222;
  float *v223;
  unint64_t v224;
  float v225;
  unint64_t v226;
  id v227;

  v5 = a4;
  if (a3 && v5)
  {
    v227 = v5;
    v8 = objc_msgSend_format(v5, v6, v7);
    v13 = v8 & 0xF;
    v226 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
    if ((~objc_msgSend_format(v227, v9, v10) & 0xC0000) != 0)
    {
      if ((~objc_msgSend_format(v227, v11, v12) & 0xB0000) != 0)
      {
        if ((objc_msgSend_format(v227, v29, v30) & 0x10000) != 0)
        {
          v5 = v227;
          if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
          {
            v67 = 0;
            v68 = 0;
            v69 = v8 & 0xF;
            v70 = v13 - 1;
            do
            {
              v71 = objc_msgSend_stride(v5, v45, v46, v226);
              if (v70 + v71 * (v68 / v69) < objc_msgSend_bufferSize(v227, v72, v73) && v226 > 4 * (v68 + v70))
              {
                v74 = objc_msgSend_dataStart(v227, v45, v46);
                v77 = objc_msgSend_stride(v227, v75, v76);
                if (v69)
                {
                  v78 = (_BYTE *)(v74 + v77 * (v68 / v69));
                  v79 = v67;
                  v80 = v69;
                  do
                  {
                    v81 = *(float *)(*(_QWORD *)a3 + v79);
                    v82 = 0.0;
                    if (v81 >= 0.0)
                    {
                      v82 = 255.0;
                      if (v81 <= 255.0)
                        v82 = *(float *)(*(_QWORD *)a3 + v79);
                    }
                    *v78++ = (int)v82;
                    v79 += 4;
                    --v80;
                  }
                  while (v80);
                }
              }
              v68 += v69;
              v67 += 4 * v69;
              v5 = v227;
            }
            while (v68 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
          }
        }
        else if ((objc_msgSend_format(v227, v45, v46) & 0x20000) != 0)
        {
          v5 = v227;
          if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
          {
            v83 = 0;
            v84 = 0;
            v85 = v8 & 0xF;
            v86 = v13 - 1;
            do
            {
              v87 = objc_msgSend_stride(v5, v47, v48, v226);
              if (v86 + v87 * (v84 / v85) < objc_msgSend_bufferSize(v227, v88, v89) && v226 > 4 * (v84 + v86))
              {
                v90 = objc_msgSend_dataStart(v227, v47, v48);
                v93 = objc_msgSend_stride(v227, v91, v92);
                if (v85)
                {
                  v94 = (_BYTE *)(v90 + v93 * (v84 / v85));
                  v95 = v83;
                  v96 = v85;
                  do
                  {
                    v97 = *(float *)(*(_QWORD *)a3 + v95);
                    v98 = -127.0;
                    if (v97 >= -127.0)
                    {
                      v98 = 127.0;
                      if (v97 <= 127.0)
                        v98 = *(float *)(*(_QWORD *)a3 + v95);
                    }
                    *v94++ = (int)v98;
                    v95 += 4;
                    --v96;
                  }
                  while (v96);
                }
              }
              v84 += v85;
              v83 += 4 * v85;
              v5 = v227;
            }
            while (v84 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
          }
        }
        else if ((~objc_msgSend_format(v227, v47, v48) & 0x30000) != 0)
        {
          if ((objc_msgSend_format(v227, v49, v50) & 0x40000) != 0)
          {
            v5 = v227;
            if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
            {
              v118 = 0;
              v119 = 0;
              v120 = v8 & 0xF;
              v121 = v13 - 1;
              do
              {
                v122 = objc_msgSend_stride(v5, v99, v100, v226);
                if (v121 + v122 * (v119 / v120) < objc_msgSend_bufferSize(v227, v123, v124) && v226 > 4 * (v119 + v121))
                {
                  v125 = objc_msgSend_dataStart(v227, v99, v100);
                  v128 = objc_msgSend_stride(v227, v126, v127);
                  if (v120)
                  {
                    v129 = (_BYTE *)(v125 + v128 * (v119 / v120));
                    v130 = v118;
                    v131 = v120;
                    do
                    {
                      v132 = *(float *)(*(_QWORD *)a3 + v130);
                      v133 = -1.0;
                      if (v132 >= -1.0)
                      {
                        v133 = 1.0;
                        if (v132 <= 1.0)
                          v133 = *(float *)(*(_QWORD *)a3 + v130);
                      }
                      *v129++ = (int)(float)(v133 * 127.0);
                      v130 += 4;
                      --v131;
                    }
                    while (v131);
                  }
                }
                v119 += v120;
                v118 += 4 * v120;
                v5 = v227;
              }
              while (v119 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
            }
          }
          else if ((~objc_msgSend_format(v227, v99, v100) & 0x50000) != 0)
          {
            if ((~objc_msgSend_format(v227, v101, v102) & 0x60000) != 0)
            {
              if ((~objc_msgSend_format(v227, v134, v135) & 0x70000) != 0)
              {
                if ((objc_msgSend_format(v227, v151, v152) & 0x80000) != 0)
                {
                  v5 = v227;
                  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
                  {
                    v190 = 0;
                    v191 = 0;
                    v192 = v8 & 0xF;
                    v193 = v13 - 1;
                    do
                    {
                      v194 = objc_msgSend_stride(v5, v171, v172, v226);
                      if (2 * v193 + v194 * (v191 / v192) < objc_msgSend_bufferSize(v227, v195, v196)
                        && v226 > 4 * (v191 + v193))
                      {
                        v197 = objc_msgSend_dataStart(v227, v171, v172);
                        v200 = objc_msgSend_stride(v227, v198, v199);
                        if (v192)
                        {
                          v201 = (_WORD *)(v197 + v200 * (v191 / v192));
                          v202 = (float *)(*(_QWORD *)a3 + v190);
                          v203 = v192;
                          do
                          {
                            v204 = *v202++;
                            v205 = v204;
                            if (v204 <= 1.0)
                              v206 = v205;
                            else
                              v206 = 1.0;
                            if (v205 >= -1.0)
                              v207 = v206;
                            else
                              v207 = -1.0;
                            *v201++ = (int)(float)(v207 * 32767.0);
                            --v203;
                          }
                          while (v203);
                        }
                      }
                      v191 += v192;
                      v190 += 4 * v192;
                      v5 = v227;
                    }
                    while (v191 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
                  }
                }
                else if ((~objc_msgSend_format(v227, v171, v172) & 0x90000) != 0)
                {
                  v210 = ~objc_msgSend_format(v227, v173, v174);
                  v5 = v227;
                  if ((*(_QWORD *)&v210 & 0xA0000) == 0 && *((_QWORD *)a3 + 1) != *(_QWORD *)a3)
                  {
                    v211 = 0;
                    v212 = 0;
                    v213 = v13 - 1;
                    v214 = v8 & 0xF;
                    do
                    {
                      v215 = objc_msgSend_stride(v5, v208, v209, v226);
                      if (4 * v213 + v215 * (v212 / v214) < objc_msgSend_bufferSize(v227, v216, v217)
                        && v226 > 4 * (v212 + v213))
                      {
                        v218 = objc_msgSend_dataStart(v227, v208, v209);
                        v221 = objc_msgSend_stride(v227, v219, v220);
                        if (v214)
                        {
                          v222 = (_DWORD *)(v218 + v221 * (v212 / v214));
                          v223 = (float *)(*(_QWORD *)a3 + v211);
                          v224 = v214;
                          do
                          {
                            v225 = *v223++;
                            *v222++ = (int)v225;
                            --v224;
                          }
                          while (v224);
                        }
                      }
                      v212 += v214;
                      v211 += 4 * v214;
                      v5 = v227;
                    }
                    while (v212 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
                  }
                }
                else
                {
                  v5 = v227;
                  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
                  {
                    v175 = 0;
                    v176 = 0;
                    v177 = v8 & 0xF;
                    v178 = v13 - 1;
                    do
                    {
                      v179 = objc_msgSend_stride(v5, v173, v174, v226);
                      if (4 * v178 + v179 * (v176 / v177) < objc_msgSend_bufferSize(v227, v180, v181)
                        && v226 > 4 * (v176 + v178))
                      {
                        v182 = objc_msgSend_dataStart(v227, v173, v174);
                        v185 = objc_msgSend_stride(v227, v183, v184);
                        if (v177)
                        {
                          v186 = (_DWORD *)(v182 + v185 * (v176 / v177));
                          v187 = (float *)(*(_QWORD *)a3 + v175);
                          v188 = v177;
                          do
                          {
                            v189 = *v187++;
                            *v186++ = fmaxf(v189, 0.0);
                            --v188;
                          }
                          while (v188);
                        }
                      }
                      v176 += v177;
                      v175 += 4 * v177;
                      v5 = v227;
                    }
                    while (v176 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
                  }
                }
              }
              else
              {
                v5 = v227;
                if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
                {
                  v153 = 0;
                  v154 = 0;
                  v155 = v8 & 0xF;
                  v156 = v13 - 1;
                  do
                  {
                    v157 = objc_msgSend_stride(v5, v151, v152, v226);
                    if (2 * v156 + v157 * (v154 / v155) < objc_msgSend_bufferSize(v227, v158, v159)
                      && v226 > 4 * (v154 + v156))
                    {
                      v160 = objc_msgSend_dataStart(v227, v151, v152);
                      v163 = objc_msgSend_stride(v227, v161, v162);
                      if (v155)
                      {
                        v164 = (_WORD *)(v160 + v163 * (v154 / v155));
                        v165 = (float *)(*(_QWORD *)a3 + v153);
                        v166 = v155;
                        do
                        {
                          v167 = *v165++;
                          v168 = v167;
                          if (v167 <= 1.0)
                            v169 = v168;
                          else
                            v169 = 1.0;
                          if (v168 >= 0.0)
                            v170 = v169;
                          else
                            v170 = 0.0;
                          *v164++ = (int)(float)(v170 * 65535.0);
                          --v166;
                        }
                        while (v166);
                      }
                    }
                    v154 += v155;
                    v153 += 4 * v155;
                    v5 = v227;
                  }
                  while (v154 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
                }
              }
            }
            else
            {
              v5 = v227;
              if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
              {
                v136 = 0;
                v137 = 0;
                v138 = v8 & 0xF;
                v139 = v13 - 1;
                do
                {
                  v140 = objc_msgSend_stride(v5, v134, v135, v226);
                  if (2 * v139 + v140 * (v137 / v138) < objc_msgSend_bufferSize(v227, v141, v142)
                    && v226 > 4 * (v137 + v139))
                  {
                    v143 = objc_msgSend_dataStart(v227, v134, v135);
                    v146 = objc_msgSend_stride(v227, v144, v145);
                    if (v138)
                    {
                      v147 = (_WORD *)(v143 + v146 * (v137 / v138));
                      v148 = (float *)(*(_QWORD *)a3 + v136);
                      v149 = v138;
                      do
                      {
                        v150 = 0.0;
                        if (*v148 >= 0.0)
                        {
                          v150 = 32767.0;
                          if (*v148 <= 32767.0)
                            v150 = *v148;
                        }
                        *v147++ = (int)v150;
                        ++v148;
                        --v149;
                      }
                      while (v149);
                    }
                  }
                  v137 += v138;
                  v136 += 4 * v138;
                  v5 = v227;
                }
                while (v137 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
              }
            }
          }
          else
          {
            v5 = v227;
            if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
            {
              v103 = 0;
              v104 = 0;
              v105 = v8 & 0xF;
              v106 = v13 - 1;
              do
              {
                v107 = objc_msgSend_stride(v5, v101, v102, v226);
                if (2 * v106 + v107 * (v104 / v105) < objc_msgSend_bufferSize(v227, v108, v109)
                  && v226 > 4 * (v104 + v106))
                {
                  v110 = objc_msgSend_dataStart(v227, v101, v102);
                  v113 = objc_msgSend_stride(v227, v111, v112);
                  if (v105)
                  {
                    v114 = (_WORD *)(v110 + v113 * (v104 / v105));
                    v115 = (float *)(*(_QWORD *)a3 + v103);
                    v116 = v105;
                    do
                    {
                      v117 = 0.0;
                      if (*v115 >= 0.0)
                      {
                        v117 = 65535.0;
                        if (*v115 <= 65535.0)
                          v117 = *v115;
                      }
                      *v114++ = (int)v117;
                      ++v115;
                      --v116;
                    }
                    while (v116);
                  }
                }
                v104 += v105;
                v103 += 4 * v105;
                v5 = v227;
              }
              while (v104 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
            }
          }
        }
        else
        {
          v5 = v227;
          if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
          {
            v51 = 0;
            v52 = 0;
            v53 = v8 & 0xF;
            v54 = v13 - 1;
            do
            {
              v55 = objc_msgSend_stride(v5, v49, v50, v226);
              if (v54 + v55 * (v52 / v53) < objc_msgSend_bufferSize(v227, v56, v57) && v226 > 4 * (v52 + v54))
              {
                v58 = objc_msgSend_dataStart(v227, v49, v50);
                v61 = objc_msgSend_stride(v227, v59, v60);
                if (v53)
                {
                  v62 = (_BYTE *)(v58 + v61 * (v52 / v53));
                  v63 = v51;
                  v64 = v53;
                  do
                  {
                    v65 = *(float *)(*(_QWORD *)a3 + v63);
                    v66 = 0.0;
                    if (v65 >= 0.0)
                    {
                      v66 = 1.0;
                      if (v65 <= 1.0)
                        v66 = *(float *)(*(_QWORD *)a3 + v63);
                    }
                    *v62++ = (int)(float)(v66 * 255.0);
                    v63 += 4;
                    --v64;
                  }
                  while (v64);
                }
              }
              v52 += v53;
              v51 += 4 * v53;
              v5 = v227;
            }
            while (v52 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
          }
        }
      }
      else
      {
        v5 = v227;
        if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
        {
          v31 = 0;
          v32 = 0;
          v33 = v13 - 1;
          v34 = v8 & 0xF;
          do
          {
            v35 = objc_msgSend_stride(v5, v29, v30, v226);
            if (2 * v33 + v35 * (v32 / v34) < objc_msgSend_bufferSize(v227, v36, v37) && v226 > 4 * (v32 + v33))
            {
              v38 = objc_msgSend_dataStart(v227, v29, v30);
              v41 = objc_msgSend_stride(v227, v39, v40);
              if (v34)
              {
                v42 = (_WORD *)(v38 + v41 * (v32 / v34));
                v43 = v31;
                v44 = v34;
                do
                {
                  *v42++ = sub_1DCC1EE14(*(float *)(*(_QWORD *)a3 + v43));
                  v43 += 4;
                  --v44;
                }
                while (v44);
              }
            }
            v32 += v34;
            v31 += 4 * v34;
            v5 = v227;
          }
          while (v32 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
        }
      }
    }
    else
    {
      v5 = v227;
      if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
      {
        v14 = 0;
        v15 = 0;
        v16 = v13 - 1;
        v17 = v8 & 0xF;
        do
        {
          v18 = objc_msgSend_stride(v5, v11, v12, v226);
          if (4 * v16 + v18 * (v15 / v17) < objc_msgSend_bufferSize(v227, v19, v20) && v226 > 4 * (v15 + v16))
          {
            v21 = objc_msgSend_dataStart(v227, v11, v12);
            v24 = objc_msgSend_stride(v227, v22, v23);
            if (v17)
            {
              v25 = (_DWORD *)(v21 + v24 * (v15 / v17));
              v26 = (int *)(*(_QWORD *)a3 + v14);
              v27 = v17;
              do
              {
                v28 = *v26++;
                *v25++ = v28;
                --v27;
              }
              while (v27);
            }
          }
          v15 += v17;
          v14 += 4 * v17;
          v5 = v227;
        }
        while (v15 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
      }
    }
  }

}

- (MDLVertexAttributeData)vertexAttributeDataForAttributeNamed:(NSString *)name asFormat:(MDLVertexFormat)format
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  size_t v19;
  MDLMeshBufferMap *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  float v35;
  float v36;
  uint64_t v37;
  float v38;
  float v39;
  uint64_t v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  uint64_t v48;
  float v49;
  float v50;
  uint64_t v51;
  int v52;
  void *v54;
  uint64_t v55;
  _QWORD v56[5];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  void *v60;
  void *__p;
  _BYTE *v62;
  uint64_t v63;

  objc_msgSend_vertexAttributeDataForAttributeNamed_(self, a2, (uint64_t)name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (!v6)
  {
    v12 = 0;
    goto LABEL_102;
  }
  if (objc_msgSend_format(v6, v7, v8) == format)
  {
    v12 = v9;
    goto LABEL_102;
  }
  v14 = objc_msgSend_format(v9, v10, v11) & 0xF;
  if ((~(_DWORD)format & 0xB0000) != 0)
    v15 = 4;
  else
    v15 = 2;
  if (format >= (MDLVertexFormatShort4Normalized|0x1))
    v16 = v15;
  else
    v16 = 2;
  if (format >= (MDLVertexFormatChar4Normalized|0x1))
    v17 = v16;
  else
    v17 = 1;
  __p = 0;
  v62 = 0;
  v63 = 0;
  objc_msgSend_createSourceDataVector_attr_srcElementCount_dstElementCount_(self, v13, (uint64_t)&__p, v9, v14, format & 0xF);
  v55 = objc_opt_new();
  v18 = v17 * (format & 0xF);
  v19 = self->_vertexCount * v18;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v60 = malloc_type_malloc(v19, 0x92981FAEuLL);
  v20 = [MDLMeshBufferMap alloc];
  v21 = v58[3];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = sub_1DCBF020C;
  v56[3] = &unk_1EA5771B0;
  v56[4] = &v57;
  v23 = (void *)objc_msgSend_initWithBytes_deallocator_(v20, v22, v21, v56);
  objc_storeStrong((id *)(v55 + 8), v23);
  *(_QWORD *)(v55 + 24) = v18;
  objc_msgSend_map((void *)v55, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v55 + 16) = objc_msgSend_bytes(v26, v27, v28);

  *(_QWORD *)(v55 + 32) = format;
  *(_QWORD *)(v55 + 40) = v19;
  if (v62 == __p)
  {
LABEL_99:
    v12 = (id)v55;
    goto LABEL_100;
  }
  v12 = 0;
  if ((uint64_t)format <= (uint64_t)MDLVertexFormatUShortNormalizedBits)
  {
    if ((uint64_t)format <= (uint64_t)MDLVertexFormatCharNormalizedBits)
    {
      if (format - 65537 >= 4 && format - 131073 >= 4)
      {
        v31 = format - 196608;
        goto LABEL_27;
      }
LABEL_32:
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v54 = v23;
      while (1)
      {
        if ((uint64_t)format <= (uint64_t)MDLVertexFormatShortBits)
        {
          if ((uint64_t)format <= (uint64_t)MDLVertexFormatUCharNormalizedBits)
          {
            if (format - 65537 < 4)
            {
              if (v34 < objc_msgSend_bufferSize((void *)v55, v29, v30))
              {
                v41 = *((float *)__p + v34);
                v42 = 0.0;
                if (v41 >= 0.0)
                {
                  v43 = 255.0;
                  goto LABEL_91;
                }
LABEL_93:
                v48 = v58[3];
LABEL_94:
                *(_BYTE *)(v48 + v34) = (int)v42;
              }
            }
            else
            {
              if (format - 131073 >= 4)
                goto LABEL_97;
              if (v34 < objc_msgSend_bufferSize((void *)v55, v29, v30))
              {
                v41 = *((float *)__p + v34);
                v42 = -127.0;
                if (v41 >= -127.0)
                {
                  v43 = 127.0;
LABEL_91:
                  v42 = v43;
                  if (v41 <= v43)
                    v42 = v41;
                }
                goto LABEL_93;
              }
            }
          }
          else if (format - 196609 < 4)
          {
            if (v34 < objc_msgSend_bufferSize((void *)v55, v29, v30))
            {
              v46 = *((float *)__p + v34);
              v47 = 0.0;
              if (v46 >= 0.0)
              {
                v47 = 1.0;
                if (v46 <= 1.0)
                  v47 = *((float *)__p + v34);
              }
              v48 = v58[3];
              v49 = 255.0;
              goto LABEL_82;
            }
          }
          else if (format - 262145 < 4)
          {
            if (v34 < objc_msgSend_bufferSize((void *)v55, v29, v30))
            {
              v50 = *((float *)__p + v34);
              v47 = -1.0;
              if (v50 >= -1.0)
              {
                v47 = 1.0;
                if (v50 <= 1.0)
                  v47 = *((float *)__p + v34);
              }
              v48 = v58[3];
              v49 = 127.0;
LABEL_82:
              v42 = v47 * v49;
              goto LABEL_94;
            }
          }
          else
          {
            if (format - 327681 >= 4)
              goto LABEL_97;
            if (v32 < objc_msgSend_bufferSize((void *)v55, v29, v30))
            {
              v39 = *((float *)__p + v34);
              v38 = 0.0;
              if (v39 < 0.0 || (v38 = 65535.0, v39 > 65535.0))
              {
LABEL_65:
                v37 = v58[3];
LABEL_71:
                *(_WORD *)(v37 + 2 * v34) = (int)v38;
                goto LABEL_95;
              }
LABEL_64:
              v38 = v39;
              goto LABEL_65;
            }
          }
        }
        else if ((uint64_t)format > (uint64_t)MDLVertexFormatUIntBits)
        {
          if (format - 589825 < 4)
          {
            if (v33 < objc_msgSend_bufferSize((void *)v55, v29, v30))
            {
              v51 = v58[3];
              v52 = fmaxf(*((float *)__p + v34), 0.0);
LABEL_87:
              *(_DWORD *)(v51 + 4 * v34) = v52;
            }
          }
          else
          {
            if (format - 655361 >= 4)
            {
              if (format - 720897 < 4)
              {
                if (v32 < objc_msgSend_bufferSize((void *)v55, v29, v30))
                {
                  v40 = v58[3];
                  *(_WORD *)(v40 + 2 * v34) = sub_1DCC1EE14(*((float *)__p + v34));
                  v23 = v54;
                }
                goto LABEL_95;
              }
LABEL_97:
              if (v33 < objc_msgSend_bufferSize((void *)v55, v29, v30, v54))
                *(_DWORD *)(v58[3] + 4 * v34) = *((_DWORD *)__p + v34);
              goto LABEL_95;
            }
            if (v33 < objc_msgSend_bufferSize((void *)v55, v29, v30))
            {
              v51 = v58[3];
              v52 = (int)*((float *)__p + v34);
              goto LABEL_87;
            }
          }
        }
        else if (format - 393217 < 4)
        {
          if (v32 < objc_msgSend_bufferSize((void *)v55, v29, v30))
          {
            v39 = *((float *)__p + v34);
            v38 = -32767.0;
            if (v39 < -32767.0)
              goto LABEL_65;
            v38 = 32767.0;
            if (v39 > 32767.0)
              goto LABEL_65;
            goto LABEL_64;
          }
        }
        else if (format - 458753 < 4)
        {
          if (v32 < objc_msgSend_bufferSize((void *)v55, v29, v30))
          {
            v44 = *((float *)__p + v34);
            v45 = 0.0;
            if (v44 >= 0.0)
            {
              v45 = 1.0;
              if (v44 <= 1.0)
                v45 = *((float *)__p + v34);
            }
            v37 = v58[3];
            v38 = v45 * 65535.0;
            goto LABEL_71;
          }
        }
        else
        {
          if (format - 524289 >= 4)
            goto LABEL_97;
          if (v32 < objc_msgSend_bufferSize((void *)v55, v29, v30))
          {
            v35 = *((float *)__p + v34);
            v36 = 0.0;
            if (v35 >= 0.0)
            {
              v36 = 1.0;
              if (v35 <= 1.0)
                v36 = *((float *)__p + v34);
            }
            v37 = v58[3];
            v38 = v36 * 32767.0;
            goto LABEL_71;
          }
        }
LABEL_95:
        ++v34;
        v33 += 4;
        v32 += 2;
        if (v34 >= (v62 - (_BYTE *)__p) >> 2)
          goto LABEL_99;
      }
    }
    if (format - 262145 < 4 || format - 327681 < 4)
      goto LABEL_32;
    v31 = format - 393216;
LABEL_27:
    if (v31 - 1 >= 4)
      goto LABEL_100;
    goto LABEL_32;
  }
  if ((uint64_t)format <= (uint64_t)MDLVertexFormatIntBits)
  {
    if (format - 458753 < 4 || format - 524289 < 4)
      goto LABEL_32;
    v31 = format - 589824;
    goto LABEL_27;
  }
  if (format - 655361 < 4 || format - 786433 < 4 || format - 720897 <= 3)
    goto LABEL_32;
LABEL_100:

  _Block_object_dispose(&v57, 8);
  if (__p)
  {
    v62 = __p;
    operator delete(__p);
  }
LABEL_102:

  return (MDLVertexAttributeData *)v12;
}

- (id)allocator
{
  return self->_allocator;
}

- (NSUInteger)vertexCount
{
  return self->_vertexCount;
}

- (void)setVertexCount:(NSUInteger)vertexCount
{
  self->_vertexCount = vertexCount;
}

- (unint64_t)subdivisionScheme
{
  return self->_subdivisionScheme;
}

- (void)replaceAttributeNamed:(NSString *)name withData:(MDLVertexAttributeData *)newData
{
  MDLVertexAttributeData *v6;
  const char *v7;
  uint64_t v8;
  MDLVertexAttributeData *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t vertexCount;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  size_t v34;
  unint64_t v35;
  uint64_t i;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  size_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const void *v65;
  NSString *v66;

  v66 = name;
  v6 = newData;
  v9 = v6;
  if (v6 && objc_msgSend_format(v6, v7, v8))
  {
    objc_msgSend_vertexAttributeDataForAttributeNamed_(self, v10, (uint64_t)v66);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_format(v9, v12, v13);
    if (v14 != objc_msgSend_format(v11, v15, v16))
    {
      objc_msgSend_removeAttributeNamed_(self, v17, (uint64_t)v66);
      v21 = objc_msgSend_format(v9, v19, v20);
      objc_msgSend_addAttributeWithName_format_(self, v22, (uint64_t)v66, v21);
      objc_msgSend_vertexAttributeDataForAttributeNamed_(self, v23, (uint64_t)v66);
      v24 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v24;
    }
    v25 = objc_msgSend_stride(v11, v17, v18);
    vertexCount = self->_vertexCount;
    v29 = objc_msgSend_stride(v9, v27, v28);
    if (v29 == objc_msgSend_stride(v11, v30, v31)
      && (v34 = vertexCount * v25, v34 <= objc_msgSend_bufferSize(v11, v32, v33))
      && v34 <= objc_msgSend_bufferSize(v9, v32, v33))
    {
      v62 = (void *)objc_msgSend_dataStart(v11, v32, v33);
      v65 = (const void *)objc_msgSend_dataStart(v9, v63, v64);
      memcpy(v62, v65, v34);
    }
    else
    {
      v35 = self->_vertexCount;
      if (v35)
      {
        for (i = 0; i != v35; ++i)
        {
          v37 = objc_msgSend_stride(v9, v32, v33);
          v40 = objc_msgSend_stride(v11, v38, v39);
          if (v40 + v37 * i <= (unint64_t)objc_msgSend_bufferSize(v9, v41, v42))
          {
            v43 = objc_msgSend_stride(v11, v32, v33);
            v46 = objc_msgSend_stride(v11, v44, v45);
            if (v46 + v43 * i <= (unint64_t)objc_msgSend_bufferSize(v11, v47, v48))
            {
              v49 = objc_msgSend_dataStart(v9, v32, v33);
              v52 = objc_msgSend_stride(v9, v50, v51);
              v55 = objc_msgSend_dataStart(v11, v53, v54);
              v58 = objc_msgSend_stride(v11, v56, v57);
              v61 = objc_msgSend_stride(v11, v59, v60);
              memcpy((void *)(v55 + v58 * i), (const void *)(v49 + v52 * i), v61);
            }
          }
        }
      }
    }

  }
}

- (void)updateAttributeNamed:(NSString *)name withData:(MDLVertexAttributeData *)newData
{
  NSString *v6;
  MDLVertexAttributeData *v7;
  const char *v8;
  uint64_t v9;
  MDLVertexAttributeData *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t vertexCount;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  size_t v30;
  char v31;
  const char *v32;
  uint64_t v33;
  char v34;
  const char *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const void *v40;
  void *__p;
  void *v42;
  uint64_t v43;

  v6 = name;
  v7 = newData;
  v10 = v7;
  if (v7 && objc_msgSend_format(v7, v8, v9))
  {
    objc_msgSend_vertexAttributeDataForAttributeNamed_(self, v11, (uint64_t)v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    if (v12 && objc_msgSend_format(v12, v13, v14))
    {
      v18 = objc_msgSend_stride(v15, v16, v17);
      vertexCount = self->_vertexCount;
      v22 = objc_msgSend_stride(v10, v20, v21);
      if (v22 == objc_msgSend_stride(v15, v23, v24)
        && (v27 = objc_msgSend_format(v10, v25, v26), v27 == objc_msgSend_format(v15, v28, v29))
        && (v30 = vertexCount * v18, v30 <= objc_msgSend_bufferSize(v15, v25, v26))
        && v30 <= objc_msgSend_bufferSize(v10, v25, v26))
      {
        v37 = (void *)objc_msgSend_dataStart(v15, v25, v26);
        v40 = (const void *)objc_msgSend_dataStart(v10, v38, v39);
        memcpy(v37, v40, v30);
      }
      else
      {
        __p = 0;
        v42 = 0;
        v43 = 0;
        v31 = objc_msgSend_format(v10, v25, v26);
        v34 = objc_msgSend_format(v15, v32, v33);
        objc_msgSend_createSourceDataVector_attr_srcElementCount_dstElementCount_(self, v35, (uint64_t)&__p, v10, v31 & 0xF, v34 & 0xF);
        objc_msgSend_copyDataVector_toAttr_(self, v36, (uint64_t)&__p, v15);
        if (__p)
        {
          v42 = __p;
          operator delete(__p);
        }
      }
    }

  }
}

- (void)removeAttributeNamed:(NSString *)name
{
  NSString *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = name;
  objc_msgSend_attributeNamed_(self->_vertexDescriptor, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (v6)
  {
    v10 = objc_msgSend_bufferIndex(v6, v7, v8);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend_attributes(self->_vertexDescriptor, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v42, v47, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v43;
LABEL_4:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v43 != v18)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v19);
        if (v20 != v9 && objc_msgSend_bufferIndex(v20, v15, v16) == v10)
          break;
        if (v17 == ++v19)
        {
          v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v42, v47, 16);
          if (v17)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:

      objc_msgSend_removeObjectAtIndex_(self->_vertexBuffers, v21, v10);
      objc_msgSend_layouts(self->_vertexDescriptor, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObjectAtIndex_(v24, v25, v10);

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend_attributes(self->_vertexDescriptor, v26, v27, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v28, (uint64_t)&v38, v46, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v39 != v32)
              objc_enumerationMutation(v13);
            v34 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            if (objc_msgSend_bufferIndex(v34, v29, v30) > v10)
            {
              v35 = objc_msgSend_bufferIndex(v34, v29, v30);
              objc_msgSend_setBufferIndex_(v34, v36, v35 - 1);
            }
          }
          v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v29, (uint64_t)&v38, v46, 16);
        }
        while (v31);
      }
    }

    objc_msgSend_removeAttributeNamed_(self->_vertexDescriptor, v37, (uint64_t)v4);
  }

}

- (int64_t)addVertexBuffer:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  const char *v16;
  int64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = self->_vertexBuffers;
  v23 = (uint64_t)v4;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v24, v28, 16);
  if (v9)
  {
    v10 = 0;
    v11 = *(_QWORD *)v25;
LABEL_3:
    v12 = 0;
    v22 = v10 + v9;
    while (1)
    {
      if (*(_QWORD *)v25 != v11)
        objc_enumerationMutation(v5);
      v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
      objc_msgSend_null(MEMORY[0x1E0C99E38], v7, v8, v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = objc_msgSend_isEqual_(v13, v15, (uint64_t)v14);

      if ((v13 & 1) != 0)
        break;
      if (v9 == ++v12)
      {
        v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v24, v28, 16);
        v10 = v22;
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }

    v17 = v10 + v12;
    if (v10 + v12 < 0)
      goto LABEL_12;
    v18 = (void *)v23;
    objc_msgSend_setObject_atIndexedSubscript_(self->_vertexBuffers, v16, v23, v17);
  }
  else
  {
LABEL_9:

LABEL_12:
    v18 = (void *)v23;
    objc_msgSend_addObject_(self->_vertexBuffers, v16, v23);
    v17 = objc_msgSend_count(self->_vertexBuffers, v19, v20) - 1;
  }

  return v17;
}

- (void)addAttributeWithName:(NSString *)name format:(MDLVertexFormat)format
{
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  MDLMeshBufferDataAllocator *v13;
  MDLMeshBufferAllocator *allocator;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  NSMutableArray *v20;
  NSMutableArray *vertexBuffers;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  MDLVertexDescriptor *vertexDescriptor;
  MDLVertexDescriptor *v26;
  MDLVertexDescriptor *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  MDLVertexAttribute *v32;
  const char *v33;
  void *v34;
  const char *v35;
  NSString *v36;

  v36 = name;
  objc_msgSend_attributeNamed_(self->_vertexDescriptor, v6, (uint64_t)v36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (v7)
  {
    if (objc_msgSend_format(v7, v8, v9) == format)
      goto LABEL_14;
    v11 = (void *)MEMORY[0x1DF0D25C8]();
    objc_msgSend_removeAttributeNamed_(self, v12, (uint64_t)v36);
  }
  else
  {
    v11 = (void *)MEMORY[0x1DF0D25C8]();
  }
  if (!self->_allocator)
  {
    v13 = objc_alloc_init(MDLMeshBufferDataAllocator);
    allocator = self->_allocator;
    self->_allocator = (MDLMeshBufferAllocator *)v13;

  }
  v15 = sub_1DCACC518(format);
  v17 = (void *)objc_msgSend_newBuffer_type_(self->_allocator, v16, self->_vertexCount * v15, 1);
  if (objc_msgSend_conformsToProtocol_(v17, v18, (uint64_t)&unk_1F03B6D88))
    objc_msgSend_setName_(v17, v19, (uint64_t)v36);
  if (!self->_vertexBuffers)
  {
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    vertexBuffers = self->_vertexBuffers;
    self->_vertexBuffers = v20;

  }
  v24 = objc_msgSend_addVertexBuffer_(self, v19, (uint64_t)v17);
  vertexDescriptor = self->_vertexDescriptor;
  if (!vertexDescriptor)
  {
    v26 = objc_alloc_init(MDLVertexDescriptor);
    v27 = self->_vertexDescriptor;
    self->_vertexDescriptor = v26;

    vertexDescriptor = self->_vertexDescriptor;
  }
  objc_msgSend_layouts(vertexDescriptor, v22, v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v28, v29, v24);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStride_(v30, v31, v15);

  v32 = [MDLVertexAttribute alloc];
  v34 = (void *)objc_msgSend_initWithName_format_offset_bufferIndex_(v32, v33, (uint64_t)v36, format, 0, v24);
  objc_msgSend_addOrReplaceAttribute_(self->_vertexDescriptor, v35, (uint64_t)v34);

  objc_autoreleasePoolPop(v11);
LABEL_14:

}

- (void)addAttributeWithName:(NSString *)name format:(MDLVertexFormat)format type:(NSString *)type data:(NSData *)data stride:(NSInteger)stride
{
  NSString *v12;
  const char *v13;
  NSData *v14;
  MDLMeshBufferAllocator *allocator;
  MDLMeshBufferDataAllocator *v16;
  MDLMeshBufferAllocator *v17;
  const char *v18;
  void *v19;
  NSMutableArray *v20;
  NSMutableArray *vertexBuffers;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  MDLVertexDescriptor *vertexDescriptor;
  MDLVertexDescriptor *v26;
  MDLVertexDescriptor *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  MDLVertexAttribute *v34;
  const char *v35;
  void *v36;
  const char *v37;
  NSString *v38;

  v38 = name;
  v12 = type;
  v14 = data;
  allocator = self->_allocator;
  if (!allocator)
  {
    v16 = objc_alloc_init(MDLMeshBufferDataAllocator);
    v17 = self->_allocator;
    self->_allocator = (MDLMeshBufferAllocator *)v16;

    allocator = self->_allocator;
  }
  v19 = (void *)objc_msgSend_newBufferWithData_type_(allocator, v13, (uint64_t)v14, 1);
  if (v19)
  {
    if (!self->_vertexBuffers)
    {
      v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      vertexBuffers = self->_vertexBuffers;
      self->_vertexBuffers = v20;

    }
    v24 = objc_msgSend_addVertexBuffer_(self, v18, (uint64_t)v19);
    vertexDescriptor = self->_vertexDescriptor;
    if (!vertexDescriptor)
    {
      v26 = objc_alloc_init(MDLVertexDescriptor);
      v27 = self->_vertexDescriptor;
      self->_vertexDescriptor = v26;

      vertexDescriptor = self->_vertexDescriptor;
    }
    objc_msgSend_layouts(vertexDescriptor, v22, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v28, v29, v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStride_(v30, v31, stride);

    if (objc_msgSend_conformsToProtocol_(v19, v32, (uint64_t)&unk_1F03B6D88))
      objc_msgSend_setName_(v19, v33, (uint64_t)v38);
    v34 = [MDLVertexAttribute alloc];
    v36 = (void *)objc_msgSend_initWithName_format_offset_bufferIndex_(v34, v35, (uint64_t)v12, format, 0, v24);
    objc_msgSend_addOrReplaceAttribute_(self->_vertexDescriptor, v37, (uint64_t)v36);

  }
}

- (void)addAttributeWithName:(NSString *)name format:(MDLVertexFormat)format type:(NSString *)type data:(NSData *)data stride:(NSInteger)stride time:(NSTimeInterval)time
{
  NSString *v14;
  const char *v15;
  NSData *v16;
  MDLMeshBufferAllocator *allocator;
  MDLMeshBufferDataAllocator *v18;
  MDLMeshBufferAllocator *v19;
  const char *v20;
  void *v21;
  NSMutableArray *v22;
  NSMutableArray *vertexBuffers;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  MDLVertexDescriptor *vertexDescriptor;
  MDLVertexDescriptor *v28;
  MDLVertexDescriptor *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  MDLVertexAttribute *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  NSString *v44;

  v44 = name;
  v14 = type;
  v16 = data;
  allocator = self->_allocator;
  if (!allocator)
  {
    v18 = objc_alloc_init(MDLMeshBufferDataAllocator);
    v19 = self->_allocator;
    self->_allocator = (MDLMeshBufferAllocator *)v18;

    allocator = self->_allocator;
  }
  v21 = (void *)objc_msgSend_newBufferWithData_type_(allocator, v15, (uint64_t)v16, 1);
  if (v21)
  {
    if (!self->_vertexBuffers)
    {
      v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      vertexBuffers = self->_vertexBuffers;
      self->_vertexBuffers = v22;

    }
    v26 = objc_msgSend_addVertexBuffer_(self, v20, (uint64_t)v21);
    vertexDescriptor = self->_vertexDescriptor;
    if (!vertexDescriptor)
    {
      v28 = objc_alloc_init(MDLVertexDescriptor);
      v29 = self->_vertexDescriptor;
      self->_vertexDescriptor = v28;

      vertexDescriptor = self->_vertexDescriptor;
    }
    objc_msgSend_layouts(vertexDescriptor, v24, v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v30, v31, v26);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStride_(v32, v33, stride);

    if (objc_msgSend_conformsToProtocol_(v21, v34, (uint64_t)&unk_1F03B6D88))
      objc_msgSend_setName_(v21, v35, (uint64_t)v44);
    v37 = objc_msgSend_count(self->_vertexBuffers, v35, v36);
    v38 = [MDLVertexAttribute alloc];
    v40 = (void *)objc_msgSend_initWithName_format_offset_bufferIndex_(v38, v39, (uint64_t)v14, format, 0, v37 - 1);
    objc_msgSend_setTime_(v40, v41, v42, time);
    objc_msgSend_addOrReplaceAttribute_(self->_vertexDescriptor, v43, (uint64_t)v40);

  }
}

- (void)_calculateTangentBasisFromPositions:(float *)a3 positionStride:(int64_t)a4 positionsBufferSize:(unint64_t)a5 normals:(float *)a6 normalStride:(int64_t)a7 normalsBufferSize:(unint64_t)a8 uvs:(float *)a9 uvStride:(int64_t)a10 uvsBufferSize:(unint64_t)a11 tangents:(float *)a12 tangentsStride:(int64_t)a13 tangentsBufferSize:(unint64_t)a14 bitagents:(float *)a15 bitangentStride:(int64_t)a16 bitangentsBufferSize:(unint64_t)a17 tangentFormat:(unint64_t)a18 selector:(SEL)a19
{
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  unint64_t v38;
  double v39;
  double v40;
  double v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  unint64_t v45;
  double v46;
  double v47;
  double v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  unint64_t v52;
  double v53;
  double v54;
  double v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  NSMutableArray *obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = self->_submeshes;
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v66, v70, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v67 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend_indexBuffer(v25, v20, v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_map(v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = objc_msgSend_bytes(v29, v30, v31);
        v35 = objc_msgSend_indexType(v25, v33, v34);
        switch(v35)
        {
          case 8:
            v52 = objc_msgSend_indexCount(v25, v36, v37);
            sub_1DCBF1410(v32, v52, (uint64_t)a3, a4, a5, (uint64_t)a6, a7, a8, v53, v54, v55, v56, v57, v58, (uint64_t)a9, a10, a11, (uint64_t)a12, a13,
              a14,
              (uint64_t)a15,
              a16,
              a17,
              a18,
              a19);
            break;
          case 16:
            v45 = objc_msgSend_indexCount(v25, v36, v37);
            sub_1DCBF1AD8(v32, v45, (uint64_t)a3, a4, a5, (uint64_t)a6, a7, a8, v46, v47, v48, v49, v50, v51, (uint64_t)a9, a10, a11, (uint64_t)a12, a13,
              a14,
              (uint64_t)a15,
              a16,
              a17,
              a18,
              a19);
            break;
          case 32:
            v38 = objc_msgSend_indexCount(v25, v36, v37);
            sub_1DCBF21A0(v32, v38, (uint64_t)a3, a4, a5, (uint64_t)a6, a7, a8, v39, v40, v41, v42, v43, v44, (uint64_t)a9, a10, a11, (uint64_t)a12, a13,
              a14,
              (uint64_t)a15,
              a16,
              a17,
              a18,
              a19);
            break;
        }

      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v66, v70, 16);
    }
    while (v22);
  }

}

- (void)addTangentBasisForTextureCoordinateAttributeNamed:(NSString *)textureCoordinateAttributeName tangentAttributeNamed:(NSString *)tangentAttributeName bitangentAttributeNamed:(NSString *)bitangentAttributeName
{
  NSString *v9;
  const char *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  SEL aSelector;
  void *v93;
  NSString *v94;
  NSString *v95;
  void *v96;
  NSString *v97;

  v95 = textureCoordinateAttributeName;
  v9 = tangentAttributeName;
  v97 = bitangentAttributeName;
  v94 = v9;
  if (!v95 || !v9 || !v97)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v11, v15, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Must provide texture coordinates, a tangent, and bitangent attribute"), v13, v14);

  }
  objc_msgSend_vertexAttributeDataForAttributeNamed_asFormat_(self, v10, (uint64_t)CFSTR("position"), 786435);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v96)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v17, v21, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Must provide position data"), v19, v20);

  }
  objc_msgSend_vertexAttributeDataForAttributeNamed_asFormat_(self, v16, (uint64_t)v95, 786434);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v22;
  if (!v22)
  {
    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v25, v29, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Must provide texture coordinates"), v27, v28);

    v22 = 0;
  }
  v30 = v22;
  v31 = objc_msgSend_dataStart(v22, v23, v24);
  v91 = objc_msgSend_stride(v30, v32, v33);
  objc_msgSend_vertexAttributeDataForAttributeNamed_asFormat_(self, v34, (uint64_t)v9, 786435);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v37
    && (objc_msgSend_addAttributeWithName_format_(self, v35, (uint64_t)v9, 786435),
        objc_msgSend_vertexAttributeDataForAttributeNamed_(self, v38, (uint64_t)v9),
        (v37 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    || objc_msgSend_format(v37, v35, v36) != 786435)
  {
    v40 = (void *)MEMORY[0x1E0C99DA0];
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v40, v44, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Tangent data in float3 format not supplied or could not be created"), v42, v43);

  }
  v90 = v31;
  aSelector = a2;
  objc_msgSend_vertexAttributeDataForAttributeNamed_asFormat_(self, v39, (uint64_t)v97, 786435);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v47
    && (objc_msgSend_addAttributeWithName_format_(self, v45, (uint64_t)v97, 786435),
        objc_msgSend_vertexAttributeDataForAttributeNamed_(self, v48, (uint64_t)v97),
        (v47 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    || objc_msgSend_format(v47, v45, v46) != 786435)
  {
    v51 = (void *)MEMORY[0x1E0C99DA0];
    v52 = (objc_class *)objc_opt_class();
    NSStringFromClass(v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v51, v55, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Bitangent data in float3 format not supplied or could not be created"), v53, v54);

  }
  v89 = objc_msgSend_dataStart(v96, v49, v50);
  v88 = objc_msgSend_stride(v96, v56, v57);
  v87 = objc_msgSend_bufferSize(v96, v58, v59);
  v62 = objc_msgSend_bufferSize(v93, v60, v61);
  v65 = objc_msgSend_dataStart(v37, v63, v64);
  v68 = objc_msgSend_stride(v37, v66, v67);
  v71 = objc_msgSend_bufferSize(v37, v69, v70);
  v74 = objc_msgSend_dataStart(v47, v72, v73);
  v77 = objc_msgSend_stride(v47, v75, v76);
  v80 = objc_msgSend_bufferSize(v47, v78, v79);
  v83 = objc_msgSend_format(v37, v81, v82);
  objc_msgSend__calculateTangentBasisFromPositions_positionStride_positionsBufferSize_normals_normalStride_normalsBufferSize_uvs_uvStride_uvsBufferSize_tangents_tangentsStride_tangentsBufferSize_bitagents_bitangentStride_bitangentsBufferSize_tangentFormat_selector_(self, v84, v89, v88, v87, 0, 0, 0, v90, v91, v62, v65, v68, v71, v74, v77, v80, v83, aSelector);
  objc_msgSend_replaceAttributeNamed_withData_(self, v85, (uint64_t)v94, v37);
  objc_msgSend_replaceAttributeNamed_withData_(self, v86, (uint64_t)v97, v47);

}

- (void)addTangentBasisForTextureCoordinateAttributeNamed:(NSString *)textureCoordinateAttributeName normalAttributeNamed:(NSString *)normalAttributeName tangentAttributeNamed:(NSString *)tangentAttributeName
{
  NSString *v9;
  const char *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  SEL aSelector;
  void *v86;
  NSString *v87;
  NSString *v88;
  void *v89;
  void *v90;
  NSString *v91;

  v88 = textureCoordinateAttributeName;
  v9 = normalAttributeName;
  v91 = tangentAttributeName;
  v87 = v9;
  if (!v9 || !v88 || !v91)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v11, v15, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Must provide texture coordinates, a tangent, and bitangent attribute"), v13, v14);

  }
  objc_msgSend_vertexAttributeDataForAttributeNamed_asFormat_(self, v10, (uint64_t)CFSTR("position"), 786435);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v17;
  if (!v17)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v18, v22, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Must provide position data"), v20, v21);

  }
  objc_msgSend_vertexAttributeDataForAttributeNamed_asFormat_(self, v16, (uint64_t)v88, 786434);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v25;
  if (!v25)
  {
    v26 = (void *)MEMORY[0x1E0C99DA0];
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v26, v30, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Must provide texture coordinates"), v28, v29);

  }
  v31 = objc_msgSend_dataStart(v25, v23, v24);
  v84 = objc_msgSend_stride(v25, v32, v33);
  objc_msgSend_vertexAttributeDataForAttributeNamed_asFormat_(self, v34, (uint64_t)v87, 786435);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v90)
  {
    v36 = (void *)MEMORY[0x1E0C99DA0];
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v36, v40, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Must provide normals"), v38, v39);

  }
  v83 = v31;
  aSelector = a2;
  objc_msgSend_vertexAttributeDataForAttributeNamed_asFormat_(self, v35, (uint64_t)v91, 786435);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v43)
  {
    objc_msgSend_addAttributeWithName_format_(self, v41, (uint64_t)v91, 786435);
    objc_msgSend_vertexAttributeDataForAttributeNamed_(self, v44, (uint64_t)v91);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v43)
    {
      v45 = (void *)MEMORY[0x1E0C99DA0];
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_raise_format_(v45, v49, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Tangent data not supplied or could not be created"), v47, v48);

      v43 = 0;
    }
  }
  v82 = objc_msgSend_dataStart(v17, v41, v42);
  v81 = objc_msgSend_stride(v17, v50, v51);
  v54 = objc_msgSend_bufferSize(v17, v52, v53);
  v57 = objc_msgSend_dataStart(v90, v55, v56);
  v60 = objc_msgSend_stride(v90, v58, v59);
  v63 = objc_msgSend_bufferSize(v90, v61, v62);
  v66 = objc_msgSend_bufferSize(v25, v64, v65);
  v69 = objc_msgSend_dataStart(v43, v67, v68);
  v72 = objc_msgSend_stride(v43, v70, v71);
  v75 = objc_msgSend_bufferSize(v43, v73, v74);
  v78 = objc_msgSend_format(v43, v76, v77);
  objc_msgSend__calculateTangentBasisFromPositions_positionStride_positionsBufferSize_normals_normalStride_normalsBufferSize_uvs_uvStride_uvsBufferSize_tangents_tangentsStride_tangentsBufferSize_bitagents_bitangentStride_bitangentsBufferSize_tangentFormat_selector_(self, v79, v82, v81, v54, v57, v60, v63, v83, v84, v66, v69, v72, v75, 0, 0, 0, v78, aSelector);
  objc_msgSend_replaceAttributeNamed_withData_(self, v80, (uint64_t)v91, v43);

}

- (void)addOrthTanBasisForTextureCoordinateAttributeNamed:(NSString *)textureCoordinateAttributeName normalAttributeNamed:(NSString *)normalAttributeName tangentAttributeNamed:(NSString *)tangentAttributeName
{
  NSString *v9;
  const char *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  SEL aSelector;
  void *v86;
  NSString *v87;
  NSString *v88;
  void *v89;
  void *v90;
  NSString *v91;

  v88 = textureCoordinateAttributeName;
  v9 = normalAttributeName;
  v91 = tangentAttributeName;
  v87 = v9;
  if (!v9 || !v88 || !v91)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v11, v15, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Must provide texture coordinates, a tangent, and bitangent attribute"), v13, v14);

  }
  objc_msgSend_vertexAttributeDataForAttributeNamed_asFormat_(self, v10, (uint64_t)CFSTR("position"), 786435);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v17;
  if (!v17)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v18, v22, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Must provide position data"), v20, v21);

  }
  objc_msgSend_vertexAttributeDataForAttributeNamed_asFormat_(self, v16, (uint64_t)v88, 786434);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v25;
  if (!v25)
  {
    v26 = (void *)MEMORY[0x1E0C99DA0];
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v26, v30, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Must provide texture coordinates"), v28, v29);

  }
  v31 = objc_msgSend_dataStart(v25, v23, v24);
  v84 = objc_msgSend_stride(v25, v32, v33);
  objc_msgSend_vertexAttributeDataForAttributeNamed_asFormat_(self, v34, (uint64_t)v87, 786435);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v90)
  {
    v36 = (void *)MEMORY[0x1E0C99DA0];
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v36, v40, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Must provide normals"), v38, v39);

  }
  v83 = v31;
  aSelector = a2;
  objc_msgSend_vertexAttributeDataForAttributeNamed_asFormat_(self, v35, (uint64_t)v91, 786436);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v43)
  {
    objc_msgSend_addAttributeWithName_format_(self, v41, (uint64_t)v91, 786436);
    objc_msgSend_vertexAttributeDataForAttributeNamed_(self, v44, (uint64_t)v91);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v43)
    {
      v45 = (void *)MEMORY[0x1E0C99DA0];
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_raise_format_(v45, v49, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Tangent data not supplied or could not be created"), v47, v48);

      v43 = 0;
    }
  }
  v82 = objc_msgSend_dataStart(v17, v41, v42);
  v81 = objc_msgSend_stride(v17, v50, v51);
  v54 = objc_msgSend_bufferSize(v17, v52, v53);
  v57 = objc_msgSend_dataStart(v90, v55, v56);
  v60 = objc_msgSend_stride(v90, v58, v59);
  v63 = objc_msgSend_bufferSize(v90, v61, v62);
  v66 = objc_msgSend_bufferSize(v25, v64, v65);
  v69 = objc_msgSend_dataStart(v43, v67, v68);
  v72 = objc_msgSend_stride(v43, v70, v71);
  v75 = objc_msgSend_bufferSize(v43, v73, v74);
  v78 = objc_msgSend_format(v43, v76, v77);
  objc_msgSend__calculateTangentBasisFromPositions_positionStride_positionsBufferSize_normals_normalStride_normalsBufferSize_uvs_uvStride_uvsBufferSize_tangents_tangentsStride_tangentsBufferSize_bitagents_bitangentStride_bitangentsBufferSize_tangentFormat_selector_(self, v79, v82, v81, v54, v57, v60, v63, v83, v84, v66, v69, v72, v75, 0, 0, 0, v78, aSelector);
  objc_msgSend_replaceAttributeNamed_withData_(self, v80, (uint64_t)v91, v43);

}

- (void)_calculateFaceNormalsFromPositions:(float *)a3 positionStride:(int64_t)a4 normals:(float *)a5 normalStride:(int64_t)a6 creaseThreshold:(float)a7
{
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  unint64_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  __n128 v35;
  unint64_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  __n128 v40;
  unint64_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  __n128 v45;
  NSMutableArray *obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = self->_submeshes;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v47, v51, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v48 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend_indexBuffer(v18, v13, v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_map(v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = objc_msgSend_bytes(v22, v23, v24);
        v28 = objc_msgSend_indexType(v18, v26, v27);
        switch(v28)
        {
          case 8:
            v41 = objc_msgSend_indexCount(v18, v29, v30);
            v42.f32[0] = a7;
            sub_1DCBF4F18(v25, v41, (uint64_t)a3, a4, (uint64_t)a5, a6, v42, v43, v44, v45);
            break;
          case 16:
            v36 = objc_msgSend_indexCount(v18, v29, v30);
            v37.f32[0] = a7;
            sub_1DCBF52F4(v25, v36, (uint64_t)a3, a4, (uint64_t)a5, a6, v37, v38, v39, v40);
            break;
          case 32:
            v31 = objc_msgSend_indexCount(v18, v29, v30);
            v32.f32[0] = a7;
            sub_1DCBF56D0(v25, v31, (uint64_t)a3, a4, (uint64_t)a5, a6, v32, v33, v34, v35);
            break;
        }

      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v47, v51, 16);
    }
    while (v15);
  }

}

- (BOOL)triangulate
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  void *v72;
  MDLSubmeshTopology *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  unint64_t v77;
  id v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  void *v87;
  const char *v88;
  const char *v89;
  id v90;
  const char *v91;
  MDLSubmesh *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  _BYTE *v96;
  _BYTE *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  void *v105;
  const char *v106;
  const char *v107;
  MDLMesh *v109;
  id obj;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  char v118;
  void *__p;
  char *v120;
  uint64_t v121;
  void *v122;
  _BYTE *v123;
  uint64_t v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v109 = self;
  objc_msgSend_submeshes(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8);
  v112 = (void *)objc_msgSend_initWithCapacity_(v3, v10, v9);

  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  objc_msgSend_submeshes(v109, v11, v12);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v125, v129, 16);
  if (v14)
  {
    v111 = *(_QWORD *)v126;
    do
    {
      v113 = v14;
      for (i = 0; i != v113; ++i)
      {
        if (*(_QWORD *)v126 != v111)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
        v122 = 0;
        v123 = 0;
        v124 = 0;
        if (objc_msgSend_geometryType(v18, v15, v16) == 2)
        {
          objc_msgSend_addObject_(v112, v19, (uint64_t)v18);
        }
        else
        {
          objc_msgSend_topology(v18, v19, v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend_topology(v18, v21, v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_faceTopology(v24, v25, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27 == 0;

            if (v28)
            {
              v117 = 0;
              v37 = 0;
              v23 = 0;
            }
            else
            {
              objc_msgSend_topology(v18, v21, v22);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_faceTopology(v29, v30, v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_map(v32, v33, v34);
              v117 = (void *)objc_claimAutoreleasedReturnValue();

              if (v117)
                v37 = objc_msgSend_bytes(v117, v35, v36);
              else
                v37 = 0;
              objc_msgSend_topology(v18, v35, v36);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (void *)objc_msgSend_faceCount(v38, v39, v40);

            }
          }
          else
          {
            v117 = 0;
            v37 = 0;
          }
          objc_msgSend_indexBuffer(v18, v21, v22);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_map(v41, v42, v43);
          v116 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = objc_msgSend_bytes(v116, v44, v45);
          v49 = objc_msgSend_indexCount(v18, v47, v48);
          v52 = objc_msgSend_indexType(v18, v50, v51);
          v55 = objc_msgSend_geometryType(v18, v53, v54);
          sub_1DCC1903C(&v122, v46, v49, v37, v23, v52, v55, 2);
          v58 = objc_msgSend_indexType(v18, v56, v57);
          if (v58)
          {
            if (v58 == 8)
            {
              v61 = 1;
            }
            else if (v58 == 16)
            {
              v61 = 2;
            }
            else
            {
              v61 = 4;
            }
          }
          else
          {
            objc_msgSend_name(v18, v59, v60);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("Index bitdepth invalid for submesh:%@ setting default to 32bit"), v62);

            v61 = 4;
          }
          v63 = objc_alloc(MEMORY[0x1E0C99D50]);
          v115 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v63, v64, (uint64_t)v122, ((v123 - (_BYTE *)v122) >> 2) * v61, 0);
          objc_msgSend_indexBuffer(v18, v65, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_allocator(v67, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = (void *)objc_msgSend_newBufferWithData_type_(v70, v71, (uint64_t)v115, 2);

          v73 = objc_alloc_init(MDLSubmeshTopology);
          objc_msgSend_setFaceCount_(v73, v74, ((v123 - (_BYTE *)v122) >> 2) / 3uLL);
          __p = 0;
          v120 = 0;
          v121 = 0;
          v77 = objc_msgSend_faceCount(v73, v75, v76);
          v118 = 3;
          if (v77 <= v120 - (_BYTE *)__p)
          {
            if (v77 < v120 - (_BYTE *)__p)
              v120 = (char *)__p + v77;
          }
          else
          {
            sub_1DCBA8BF0(&__p, v77 - (v120 - (_BYTE *)__p), &v118);
          }
          v78 = objc_alloc(MEMORY[0x1E0C99D50]);
          v114 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v78, v79, (uint64_t)__p, v120 - (_BYTE *)__p, 0);
          objc_msgSend_indexBuffer(v18, v80, v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_allocator(v82, v83, v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = (void *)objc_msgSend_newBufferWithData_type_(v85, v86, (uint64_t)v114, 2);

          if (objc_msgSend_conformsToProtocol_(v87, v88, (uint64_t)&unk_1F03B6D88))
          {
            v90 = v87;
            objc_msgSend_setName_(v90, v91, (uint64_t)CFSTR("faceVertexCounts"));

          }
          objc_msgSend_setFaceTopology_(v73, v89, (uint64_t)v87);
          v92 = [MDLSubmesh alloc];
          objc_msgSend_name(v18, v93, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = v122;
          v97 = v123;
          v100 = objc_msgSend_indexType(v18, v98, v99);
          objc_msgSend_material(v18, v101, v102);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = (void *)objc_msgSend_initWithName_indexBuffer_indexCount_indexType_geometryType_material_topology_(v92, v104, (uint64_t)v95, v72, (v97 - v96) >> 2, v100, 2, v103, v73);
          objc_msgSend_addObject_(v112, v106, (uint64_t)v105);

          if (__p)
          {
            v120 = (char *)__p;
            operator delete(__p);
          }

        }
        if (v122)
        {
          v123 = v122;
          operator delete(v122);
        }
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v125, v129, 16);
    }
    while (v14);
  }

  objc_msgSend_setSubmeshes_(v109, v107, (uint64_t)v112);
  return 1;
}

- (void)addNormalsWithAttributeNamed:(NSString *)attributeName creaseThreshold:(float)creaseThreshold
{
  const char *v7;
  NSString *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  const char *v13;
  NSMutableArray *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  const char *v54;
  const char *v55;
  void *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  const char *v68;
  unint64_t v69;
  unint64_t v70;
  _DWORD *v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  int v81;
  char *v82;
  char *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  int v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  int v96;
  int v97;
  char *v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  char *v104;
  int v105;
  void *v106;
  char *v107;
  NSString *v108;
  MDLMesh *v109;
  void *v110;
  void *__p;
  char *v112;
  char *v113;
  void *v114;
  void *v115;
  char *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v8 = attributeName;
  if (!v8)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v9, v13, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Must provide attribute name"), v11, v12);

  }
  if ((objc_msgSend_makeVerticesUniqueAndReturnError_(self, v7, 0) & 1) != 0)
  {
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v14 = self->_submeshes;
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v117, v121, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v118;
LABEL_6:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v118 != v19)
          objc_enumerationMutation(v14);
        if (objc_msgSend_geometryType(*(void **)(*((_QWORD *)&v117 + 1) + 8 * v20), v16, v17) != 2)
          break;
        if (v18 == ++v20)
        {
          v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v117, v121, 16);
          if (v18)
            goto LABEL_6;
          goto LABEL_12;
        }
      }

      if ((objc_msgSend_triangulate(self, v22, v23) & 1) == 0)
        goto LABEL_103;
    }
    else
    {
LABEL_12:

    }
    objc_msgSend_vertexAttributeDataForAttributeNamed_asFormat_(self, v21, (uint64_t)CFSTR("position"), 786435);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      v26 = (void *)MEMORY[0x1E0C99DA0];
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_raise_format_(v26, v30, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Position data not found"), v28, v29);

    }
    objc_msgSend_attributeNamed_(self->_vertexDescriptor, v24, (uint64_t)v8);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_format(v31, v32, v33);
    if (v31 && v34 && (v34 & 7u) >= 3uLL)
    {
      objc_msgSend_vertexAttributeDataForAttributeNamed_(self, v35, (uint64_t)v8);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend_format(v31, v37, v38);
      v42 = v39;
      if (v39 != 786435)
      {
        v114 = 0;
        v115 = 0;
        v116 = 0;
        v110 = v36;
        sub_1DCBF6AAC((uint64_t)&v114, 3 * self->_vertexCount);
        v63 = objc_msgSend_dataStart(v25, v61, v62);
        v66 = objc_msgSend_stride(v25, v64, v65);
        *(float *)&v67 = creaseThreshold;
        objc_msgSend__calculateFaceNormalsFromPositions_positionStride_normals_normalStride_creaseThreshold_(self, v68, v63, v66, v114, 12, v67);
        if ((v42 & 7u) >= 4)
        {
          __p = 0;
          v112 = 0;
          v113 = 0;
          v108 = v8;
          sub_1DCB0BBF4(&__p, self->_vertexCount * (v42 & 7));
          v109 = self;
          if (self->_vertexCount)
          {
            v70 = 0;
            v71 = v114;
            v72 = v112;
            do
            {
              v73 = v113;
              if (v72 >= v113)
              {
                v75 = (char *)__p;
                v76 = (v72 - (_BYTE *)__p) >> 2;
                v77 = v76 + 1;
                if ((unint64_t)(v76 + 1) >> 62)
                  sub_1DCAE4C44();
                v78 = v113 - (_BYTE *)__p;
                if ((v113 - (_BYTE *)__p) >> 1 > v77)
                  v77 = v78 >> 1;
                if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFFCLL)
                  v69 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v69 = v77;
                if (v69)
                {
                  v79 = (char *)sub_1DCAE4D04((uint64_t)&v113, v69);
                  v75 = (char *)__p;
                  v72 = v112;
                }
                else
                {
                  v79 = 0;
                }
                v80 = &v79[4 * v76];
                *(_DWORD *)v80 = *v71;
                v74 = v80 + 4;
                while (v72 != v75)
                {
                  v81 = *((_DWORD *)v72 - 1);
                  v72 -= 4;
                  *((_DWORD *)v80 - 1) = v81;
                  v80 -= 4;
                }
                v73 = &v79[4 * v69];
                __p = v80;
                v112 = v74;
                v113 = v73;
                if (v75)
                {
                  operator delete(v75);
                  v73 = v113;
                }
              }
              else
              {
                *(_DWORD *)v72 = *v71;
                v74 = v72 + 4;
              }
              v112 = v74;
              if (v74 >= v73)
              {
                v83 = (char *)__p;
                v84 = (v74 - (_BYTE *)__p) >> 2;
                v85 = v84 + 1;
                if ((unint64_t)(v84 + 1) >> 62)
                  sub_1DCAE4C44();
                v86 = v73 - (_BYTE *)__p;
                if (v86 >> 1 > v85)
                  v85 = v86 >> 1;
                if ((unint64_t)v86 >= 0x7FFFFFFFFFFFFFFCLL)
                  v69 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v69 = v85;
                if (v69)
                {
                  v87 = (char *)sub_1DCAE4D04((uint64_t)&v113, v69);
                  v83 = (char *)__p;
                  v74 = v112;
                }
                else
                {
                  v87 = 0;
                }
                v88 = &v87[4 * v84];
                *(_DWORD *)v88 = v71[1];
                v82 = v88 + 4;
                while (v74 != v83)
                {
                  v89 = *((_DWORD *)v74 - 1);
                  v74 -= 4;
                  *((_DWORD *)v88 - 1) = v89;
                  v88 -= 4;
                }
                v73 = &v87[4 * v69];
                __p = v88;
                v112 = v82;
                v113 = v73;
                if (v83)
                {
                  operator delete(v83);
                  v73 = v113;
                }
              }
              else
              {
                *(_DWORD *)v74 = v71[1];
                v82 = v74 + 4;
              }
              v112 = v82;
              if (v82 >= v73)
              {
                v90 = (char *)__p;
                v91 = (v82 - (_BYTE *)__p) >> 2;
                v92 = v91 + 1;
                if ((unint64_t)(v91 + 1) >> 62)
                  sub_1DCAE4C44();
                v93 = v73 - (_BYTE *)__p;
                if (v93 >> 1 > v92)
                  v92 = v93 >> 1;
                if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFFCLL)
                  v69 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v69 = v92;
                if (v69)
                {
                  v94 = (char *)sub_1DCAE4D04((uint64_t)&v113, v69);
                  v90 = (char *)__p;
                  v82 = v112;
                }
                else
                {
                  v94 = 0;
                }
                v95 = &v94[4 * v91];
                *(_DWORD *)v95 = v71[2];
                v72 = v95 + 4;
                while (v82 != v90)
                {
                  v96 = *((_DWORD *)v82 - 1);
                  v82 -= 4;
                  *((_DWORD *)v95 - 1) = v96;
                  v95 -= 4;
                }
                __p = v95;
                v112 = v72;
                v113 = &v94[4 * v69];
                if (v90)
                  operator delete(v90);
              }
              else
              {
                *(_DWORD *)v82 = v71[2];
                v72 = v82 + 4;
              }
              v71 += 3;
              v112 = v72;
              v97 = 3;
              do
              {
                if (v72 >= v113)
                {
                  v98 = (char *)__p;
                  v99 = (v72 - (_BYTE *)__p) >> 2;
                  v100 = v99 + 1;
                  if ((unint64_t)(v99 + 1) >> 62)
                    sub_1DCAE4C44();
                  v101 = v113 - (_BYTE *)__p;
                  if ((v113 - (_BYTE *)__p) >> 1 > v100)
                    v100 = v101 >> 1;
                  if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFFCLL)
                    v69 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v69 = v100;
                  if (v69)
                  {
                    v102 = (char *)sub_1DCAE4D04((uint64_t)&v113, v69);
                    v98 = (char *)__p;
                    v72 = v112;
                  }
                  else
                  {
                    v102 = 0;
                  }
                  v103 = &v102[4 * v99];
                  *(_DWORD *)v103 = 1065353216;
                  v104 = v103 + 4;
                  while (v72 != v98)
                  {
                    v105 = *((_DWORD *)v72 - 1);
                    v72 -= 4;
                    *((_DWORD *)v103 - 1) = v105;
                    v103 -= 4;
                  }
                  __p = v103;
                  v112 = v104;
                  v113 = &v102[4 * v69];
                  if (v98)
                    operator delete(v98);
                  v72 = v104;
                }
                else
                {
                  *(_DWORD *)v72 = 1065353216;
                  v72 += 4;
                }
                v112 = v72;
                ++v97;
              }
              while (v97 != (v42 & 7));
              ++v70;
              v36 = v110;
            }
            while (v70 < v109->_vertexCount);
          }
          else
          {
            v72 = v112;
          }
          v107 = v113;
          v106 = v114;
          v114 = __p;
          v115 = v72;
          __p = v106;
          v113 = v116;
          v116 = v107;
          if (v106)
          {
            v112 = (char *)v106;
            operator delete(v106);
          }
          v8 = v108;
          self = v109;
        }
        objc_msgSend_copyDataVector_toAttr_(self, (const char *)v69, (uint64_t)&v114, v36);
        if (v114)
        {
          v115 = v114;
          operator delete(v114);
        }
        goto LABEL_102;
      }
    }
    else
    {
      objc_msgSend_addAttributeWithName_format_(self, v35, (uint64_t)v8, 786435);
      objc_msgSend_vertexAttributeDataForAttributeNamed_(self, v55, (uint64_t)v8);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36)
      {
        v56 = (void *)MEMORY[0x1E0C99DA0];
        v57 = (objc_class *)objc_opt_class();
        NSStringFromClass(v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_raise_format_(v56, v60, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Could not create normals attribute"), v58, v59);

      }
    }
    v43 = objc_msgSend_dataStart(v25, v40, v41);
    v46 = objc_msgSend_stride(v25, v44, v45);
    v49 = objc_msgSend_dataStart(v36, v47, v48);
    v52 = objc_msgSend_stride(v36, v50, v51);
    *(float *)&v53 = creaseThreshold;
    objc_msgSend__calculateFaceNormalsFromPositions_positionStride_normals_normalStride_creaseThreshold_(self, v54, v43, v46, v49, v52, v53);
LABEL_102:

  }
LABEL_103:

}

- (void)addUnwrappedTextureCoordinatesForAttributeNamed:(NSString *)textureCoordinateAttributeName
{
  const char *v5;
  NSString *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  const char *v24;
  void *__p[2];
  __int128 v26;
  _OWORD v27[9];
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v6 = textureCoordinateAttributeName;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v7, v11, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Must provide name"), v9, v10);

  }
  objc_msgSend_vertexAttributeDataForAttributeNamed_(self, v5, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend_addAttributeWithName_format_(self, v12, (uint64_t)v6, 786434);
    objc_msgSend_vertexAttributeDataForAttributeNamed_(self, v14, (uint64_t)v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v15 = (void *)MEMORY[0x1E0C99DA0];
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_raise_format_(v15, v19, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Texture coordinate data of format float2 not created"), v17, v18);

      v13 = 0;
    }
  }
  v28 = 0u;
  memset(v27, 0, sizeof(v27));
  DWORD2(v28) = 1065353216;
  v30 = 0;
  v31 = 0;
  v29 = 0;
  *(_OWORD *)__p = 0u;
  v26 = 0u;
  sub_1DCBA37C4(v27, self, v6, (uint64_t)__p);
  if (!LOBYTE(__p[0]))
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v20, v24, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Texture coordinate data of format float2 not created"), v22, v23);

  }
  if (SHIBYTE(v26) < 0)
    operator delete(__p[1]);
  sub_1DCBF92A8((uint64_t)v27);

}

- (void)flipTextureCoordinatesInAttributeNamed:(NSString *)textureCoordinateAttributeName
{
  const char *v5;
  NSString *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  float *v27;
  float *v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  float *v34;
  int v35;
  float v36;
  float *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  float *v42;
  int v43;
  void *v44;
  const char *v45;
  void *v46;
  NSString *v47;
  void *__p;
  char *v49;
  char *v50;

  v6 = textureCoordinateAttributeName;
  v47 = v6;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v7, v11, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Must provide name"), v9, v10);

  }
  objc_msgSend_vertexAttributeDataForAttributeNamed_asFormat_(self, v5, (uint64_t)v6, 786434);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v14;
  if (!v14)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v15, v19, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Texture coordinate data of format float2 not created"), v17, v18);

  }
  v20 = objc_msgSend_dataStart(v14, v12, v13);
  v23 = objc_msgSend_stride(v14, v21, v22);
  __p = 0;
  v49 = 0;
  v50 = 0;
  sub_1DCB0BBF4(&__p, 2 * self->_vertexCount);
  if (self->_vertexCount)
  {
    v25 = 0;
    v26 = v49;
    do
    {
      v27 = (float *)v50;
      if (v26 >= v50)
      {
        v29 = (char *)__p;
        v30 = (v26 - (_BYTE *)__p) >> 2;
        v31 = v30 + 1;
        if ((unint64_t)(v30 + 1) >> 62)
          sub_1DCAE4C44();
        v32 = v50 - (_BYTE *)__p;
        if ((v50 - (_BYTE *)__p) >> 1 > v31)
          v31 = v32 >> 1;
        if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL)
          v24 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v24 = v31;
        if (v24)
        {
          v33 = (char *)sub_1DCAE4D04((uint64_t)&v50, v24);
          v29 = (char *)__p;
          v26 = v49;
        }
        else
        {
          v33 = 0;
        }
        v34 = (float *)&v33[4 * v30];
        *v34 = *(float *)v20;
        v28 = v34 + 1;
        while (v26 != v29)
        {
          v35 = *((_DWORD *)v26 - 1);
          v26 -= 4;
          *((_DWORD *)v34-- - 1) = v35;
        }
        v27 = (float *)&v33[4 * v24];
        __p = v34;
        v49 = (char *)v28;
        v50 = (char *)v27;
        if (v29)
        {
          operator delete(v29);
          v27 = (float *)v50;
        }
      }
      else
      {
        *(_DWORD *)v26 = *(_DWORD *)v20;
        v28 = (float *)(v26 + 4);
      }
      v49 = (char *)v28;
      v36 = 1.0 - *(float *)(v20 + 4);
      if (v28 >= v27)
      {
        v37 = (float *)__p;
        v38 = ((char *)v28 - (_BYTE *)__p) >> 2;
        v39 = v38 + 1;
        if ((unint64_t)(v38 + 1) >> 62)
          sub_1DCAE4C44();
        v40 = (char *)v27 - (_BYTE *)__p;
        if (v40 >> 1 > v39)
          v39 = v40 >> 1;
        if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFFCLL)
          v24 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v24 = v39;
        if (v24)
        {
          v41 = (char *)sub_1DCAE4D04((uint64_t)&v50, v24);
          v37 = (float *)__p;
          v28 = (float *)v49;
        }
        else
        {
          v41 = 0;
        }
        v42 = (float *)&v41[4 * v38];
        *v42 = v36;
        v26 = (char *)(v42 + 1);
        while (v28 != v37)
        {
          v43 = *((_DWORD *)v28-- - 1);
          *((_DWORD *)v42-- - 1) = v43;
        }
        __p = v42;
        v49 = v26;
        v50 = &v41[4 * v24];
        if (v37)
          operator delete(v37);
      }
      else
      {
        *v28 = v36;
        v26 = (char *)(v28 + 1);
      }
      v49 = v26;
      v20 += v23;
      ++v25;
    }
    while (v25 < self->_vertexCount);
  }
  objc_msgSend_vertexAttributeDataForAttributeNamed_(self, (const char *)v24, (uint64_t)v47);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_copyDataVector_toAttr_(self, v45, (uint64_t)&__p, v44);

  if (__p)
  {
    v49 = (char *)__p;
    operator delete(__p);
  }

}

- (id)description
{
  id v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  unint64_t vertexCount;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  MDLMesh *v15;

  v15 = self;
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  objc_msgSend_name(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  vertexCount = self->_vertexCount;
  v11 = objc_msgSend_count(self->_vertexBuffers, v9, v10);
  v13 = (void *)objc_msgSend_initWithFormat_(v3, v12, (uint64_t)CFSTR("<<%@: 0x%lx>, Name: %@, VertexCount: %d, VertexBufferCount: %d>"), v4, &v15, v7, vertexCount, v11);

  return v13;
}

- (BOOL)makeVerticesUniqueAndReturnError:(NSError *)error
{
  NSMutableArray *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *v24;
  const char *v25;
  unint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  BOOL v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  int isEqual;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  unint64_t v47;
  unint64_t vertexCount;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  unint64_t v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  BOOL v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  unsigned int v75;
  const char *v76;
  uint64_t v77;
  unint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  size_t v82;
  const char *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  unint64_t v95;
  const char *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  unint64_t v100;
  const char *v101;
  uint64_t v102;
  unint64_t v103;
  BOOL v104;
  size_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  _DWORD *v112;
  unsigned int v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  unint64_t v120;
  int v121;
  const char *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  unsigned int v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  unint64_t v138;
  MDLMeshBufferData *v139;
  const char *v140;
  void *v141;
  MDLSubmesh *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  void *v153;
  const char *v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  const char *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  _BYTE *v170;
  uint64_t v171;
  _WORD *v172;
  uint64_t v173;
  _DWORD *v174;
  uint64_t v175;
  NSError *v176;
  void *v177;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  void *v183;
  void **location;
  NSMutableArray *obj;
  id obja;
  id v188;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  void *__p;
  _BYTE *v207;
  uint64_t v208;
  _QWORD **v209;
  _QWORD *v210;
  uint64_t v211;
  _BYTE v212[128];
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  uint64_t v216;

  v216 = *MEMORY[0x1E0C80C00];
  v210 = 0;
  v211 = 0;
  v208 = 0;
  v209 = &v210;
  __p = 0;
  v207 = 0;
  v202 = 0u;
  v203 = 0u;
  v204 = 0u;
  v205 = 0u;
  v3 = self->_submeshes;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v202, v215, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v203;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v203 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * i);
        v11 = objc_msgSend_indexCount(v10, v5, v6);
        objc_msgSend_indexBuffer(v10, v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_map(v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = objc_msgSend_bytes(v17, v18, v19);
        v23 = objc_msgSend_indexType(v10, v21, v22);
        switch(v23)
        {
          case 8:
            sub_1DCBF7DD0((uint64_t)&v209, (uint64_t)&__p, v20, v11);
            break;
          case 16:
            sub_1DCBF7F68((uint64_t)&v209, (uint64_t)&__p, v20, v11);
            break;
          case 32:
            sub_1DCBF8100((uint64_t)&v209, (uint64_t)&__p, v20, v11);
            break;
        }

      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v202, v215, 16);
    }
    while (v7);
  }

  v200 = 0u;
  v201 = 0u;
  v198 = 0u;
  v199 = 0u;
  v24 = self->_submeshes;
  v26 = 0;
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v198, v214, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v199;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v199 != v30)
          objc_enumerationMutation(v24);
        v26 += objc_msgSend_indexCount(*(void **)(*((_QWORD *)&v198 + 1) + 8 * j), v27, v28);
      }
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v198, v214, 16);
    }
    while (v29);
  }

  if (v211 == v26)
  {
    v32 = 1;
  }
  else
  {
    v188 = (id)objc_opt_new();
    v196 = 0u;
    v197 = 0u;
    v194 = 0u;
    v195 = 0u;
    location = (void **)&self->_vertexBuffers;
    obj = self->_vertexBuffers;
    v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v194, v213, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v195;
LABEL_25:
      v38 = 0;
      while (1)
      {
        if (*(_QWORD *)v195 != v37)
          objc_enumerationMutation(obj);
        v39 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * v38);
        objc_msgSend_null(MEMORY[0x1E0C99E38], v34, v35);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v39, v41, (uint64_t)v40);

        if (isEqual)
        {
          objc_msgSend_null(MEMORY[0x1E0C99E38], v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v188, v46, (uint64_t)v45);
        }
        else
        {
          v47 = objc_msgSend_length(v39, v43, v44);
          vertexCount = self->_vertexCount;
          objc_msgSend_allocator(v39, v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)objc_msgSend_newBuffer_type_(v51, v52, v47 / vertexCount * v26, 1);

          if (!v45)
          {
            if (!error)
              goto LABEL_82;
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v53, (uint64_t)CFSTR("MDLErrorDomain"), 0, &unk_1EA585988);
            v176 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
LABEL_77:
            *error = v176;
LABEL_82:

            v32 = 0;
            goto LABEL_83;
          }
          objc_msgSend_addObject_(v188, v53, (uint64_t)v45);
        }

        if (v36 == ++v38)
        {
          v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v194, v213, 16);
          if (v36)
            goto LABEL_25;
          break;
        }
      }
    }

    v192 = 0u;
    v193 = 0u;
    v190 = 0u;
    v191 = 0u;
    v54 = 72;
    objc_msgSend_attributes(self->_vertexDescriptor, v55, v56);
    obj = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v57, (uint64_t)&v190, v212, 16);
    if (v179)
    {
      v180 = *(_QWORD *)v191;
LABEL_36:
      v181 = 0;
      while (1)
      {
        if (*(_QWORD *)v191 != v180)
          objc_enumerationMutation(obj);
        v60 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * v181);
        v61 = objc_msgSend_bufferIndex(v60, v58, v59);
        objc_msgSend_layouts(*(void **)((char *)&self->super.super.isa + v54), v62, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v61 < objc_msgSend_count(v64, v65, v66);

        if (!v67)
          break;
        objc_msgSend_layouts(*(void **)((char *)&self->super.super.isa + v54), v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v70, v71, v61);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend_stride(v72, v73, v74);

        v78 = objc_msgSend_offset(v60, v76, v77);
        v81 = objc_msgSend_format(v60, v79, v80);
        v82 = sub_1DCACC518(v81);
        objc_msgSend_objectAtIndexedSubscript_(*location, v83, v61);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_map(v84, v85, v86);
        v183 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectAtIndexedSubscript_(v188, v87, v61);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_map(v88, v89, v90);
        v182 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectAtIndexedSubscript_(*location, v91, v61);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend_length(v92, v93, v94);

        objc_msgSend_objectAtIndexedSubscript_(v188, v96, v61);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend_length(v97, v98, v99);

        v103 = v95 - v78;
        if (v95 <= v78 || (v104 = v100 > v78, v105 = v100 - v78, !v104))
        {
          if (error)
          {
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v101, (uint64_t)CFSTR("MDLErrorDomain"), 0, &unk_1EA5859D8);
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_80;
          }
          goto LABEL_81;
        }
        v106 = objc_msgSend_bytes(v183, v101, v102);
        v107 = v54;
        v110 = objc_msgSend_bytes(v182, v108, v109);
        v112 = __p;
        if (v207 != __p)
        {
          if (v82 + (((v207 - (_BYTE *)__p) >> 2) - 1) * v75 > v105)
          {
            if (error)
            {
              objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v111, (uint64_t)CFSTR("MDLErrorDomain"), 0, &unk_1EA585A00);
              v177 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_80:
              *error = (NSError *)v177;
            }
          }
          else
          {
            v113 = 0;
            v114 = 0;
            v115 = v106 + v78;
            v116 = v110 + v78;
            while (1)
            {
              v117 = v112[v114] * v75;
              if (v82 + v117 > v103)
                break;
              memcpy((void *)(v116 + v113), (const void *)(v115 + v117), v82);
              ++v114;
              v112 = __p;
              v113 += v75;
              if (v114 >= (v207 - (_BYTE *)__p) >> 2)
                goto LABEL_48;
            }
            if (error)
            {
              objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v111, (uint64_t)CFSTR("MDLErrorDomain"), 0, &unk_1EA585A28);
              v177 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_80;
            }
          }
LABEL_81:

          goto LABEL_82;
        }
LABEL_48:

        v54 = v107;
        if (++v181 == v179)
        {
          v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v58, (uint64_t)&v190, v212, 16);
          if (v179)
            goto LABEL_36;
          goto LABEL_50;
        }
      }
      if (!error)
        goto LABEL_82;
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v68, (uint64_t)CFSTR("MDLErrorDomain"), 0, &unk_1EA5859B0);
      v176 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_77;
    }
LABEL_50:

    objc_storeStrong(location, v188);
    v120 = 0;
    v121 = 0;
    self->_vertexCount = v26;
    while (objc_msgSend_count(self->_submeshes, v118, v119) > v120)
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_submeshes, v122, v120);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_indexBuffer(v123, v124, v125);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_map(v126, v127, v128);
      obja = (id)objc_claimAutoreleasedReturnValue();

      v131 = objc_msgSend_indexCount(v123, v129, v130);
      if (objc_msgSend_indexType(v123, v132, v133) == 8 && v131 > 0xFF
        || objc_msgSend_indexType(v123, v134, v135) == 16 && v131 >= 0x10000)
      {
        if (v131 >= 0x10000)
          v138 = 32;
        else
          v138 = 16;
        v139 = [MDLMeshBufferData alloc];
        v141 = (void *)objc_msgSend_initWithType_length_(v139, v140, 2, (v138 >> 3) * (unint64_t)v131);
        v142 = [MDLSubmesh alloc];
        v145 = objc_msgSend_indexCount(v123, v143, v144);
        v148 = objc_msgSend_geometryType(v123, v146, v147);
        objc_msgSend_material(v123, v149, v150);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        v153 = (void *)objc_msgSend_initWithIndexBuffer_indexCount_indexType_geometryType_material_(v142, v152, (uint64_t)v141, v145, v138, v148, v151);

        objc_msgSend_objectAtIndexedSubscript_(self->_submeshes, v154, v120);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v155, v156, v157);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setName_(v153, v159, (uint64_t)v158);

        objc_msgSend_setObject_atIndexedSubscript_(self->_submeshes, v160, (uint64_t)v153, v120);
        objc_msgSend_indexBuffer(v153, v161, v162);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_map(v163, v164, v165);
        v166 = objc_claimAutoreleasedReturnValue();

        v123 = v153;
        obja = (id)v166;
      }
      v167 = objc_msgSend_indexType(v123, v136, v137);
      switch(v167)
      {
        case 32:
          v174 = (_DWORD *)objc_msgSend_bytes(obja, v168, v169);
          if (v131)
          {
            v175 = v131;
            do
            {
              *v174++ = v121++;
              --v175;
            }
            while (v175);
          }
          break;
        case 16:
          v172 = (_WORD *)objc_msgSend_bytes(obja, v168, v169);
          if (v131)
          {
            v173 = v131;
            do
            {
              *v172++ = v121++;
              --v173;
            }
            while (v173);
          }
          break;
        case 8:
          v170 = (_BYTE *)objc_msgSend_bytes(obja, v168, v169);
          if (v131)
          {
            v171 = v131;
            do
            {
              *v170++ = v121++;
              --v171;
            }
            while (v171);
          }
          break;
      }

      ++v120;
    }
    v32 = 1;
LABEL_83:

  }
  if (__p)
  {
    v207 = __p;
    operator delete(__p);
  }
  sub_1DCAE4E44((uint64_t)&v209, v210);
  return v32;
}

- (int)submeshCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_submeshes, a2, v2);
}

- (void)_enumerateSubmeshesUsingBlock:(id)a3 stopPointer:(BOOL *)a4
{
  void (**v6)(id, _QWORD, BOOL *);
  NSMutableArray *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, BOOL *))a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_submeshes;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v10)
        objc_enumerationMutation(v7);
      v6[2](v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), a4);
      if (*a4)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v12, (uint64_t)&v13, v17, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateSubmeshesUsingBlock:(id)a3
{
  char v3;

  v3 = 0;
  objc_msgSend__enumerateSubmeshesUsingBlock_stopPointer_(self, a2, (uint64_t)a3, &v3);
}

- (id)controlNodeForINdex:(unint64_t)a3
{
  return 0;
}

- (__n128)inverseBasePoseForIndex:(uint64_t)a3
{
  void *v3;

  v3 = *(void **)(a1 + 112);
  if (v3)
    objc_msgSend_count(v3, a2, a3);
  return *(__n128 *)MEMORY[0x1E0C83FF0];
}

- (BOOL)generateAmbientOcclusionTextureWithSize:(vector_int2)textureSize raysPerSample:(NSInteger)raysPerSample attenuationFactor:(float)attenuationFactor objectsToConsider:(NSArray *)objectsToConsider vertexAttributeNamed:(NSString *)vertexAttributeName materialPropertyNamed:(NSString *)materialPropertyName
{
  int v8;
  void *__p[2];
  __int128 v11;
  _OWORD v12[9];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0u;
  memset(v12, 0, sizeof(v12));
  DWORD2(v13) = 1065353216;
  v15 = 0;
  v16 = 0;
  v14 = 0;
  *(_OWORD *)__p = 0u;
  v11 = 0u;
  sub_1DCBA25C8((uint64_t)v12, objectsToConsider, self, vertexAttributeName, materialPropertyName, raysPerSample, textureSize.i32[0], 6u, (uint64_t)__p, attenuationFactor);
  v8 = LOBYTE(__p[0]);
  if (SHIBYTE(v11) < 0)
    operator delete(__p[1]);
  sub_1DCBF92A8((uint64_t)v12);
  return v8 != 0;
}

- (BOOL)generateAmbientOcclusionTextureWithQuality:(float)bakeQuality attenuationFactor:(float)attenuationFactor objectsToConsider:(NSArray *)objectsToConsider vertexAttributeNamed:(NSString *)vertexAttributeName materialPropertyNamed:(NSString *)materialPropertyName
{
  double v7;
  const float *v8;

  v7 = bakeQuality;
  v8 = (const float *)((char *)&unk_1DCC5AB9C + 4 * (int)(v7 * 5.0));
  vld1_dup_f32(v8);
  return MEMORY[0x1E0DE7D20](self, sel_generateAmbientOcclusionTextureWithSize_raysPerSample_attenuationFactor_objectsToConsider_vertexAttributeNamed_materialPropertyNamed_, dword_1DCC5ABB4[vcvtd_n_s64_f64(v7, 3uLL)]);
}

- (BOOL)generateAmbientOcclusionVertexColorsWithRaysPerSample:(NSInteger)raysPerSample attenuationFactor:(float)attenuationFactor objectsToConsider:(NSArray *)objectsToConsider vertexAttributeNamed:(NSString *)vertexAttributeName
{
  int v6;
  void *__p[2];
  __int128 v9;
  _OWORD v10[9];
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0u;
  memset(v10, 0, sizeof(v10));
  DWORD2(v11) = 1065353216;
  v13 = 0;
  v14 = 0;
  v12 = 0;
  *(_OWORD *)__p = 0u;
  v9 = 0u;
  sub_1DCBA3B5C((uint64_t)v10, objectsToConsider, self, vertexAttributeName, raysPerSample, (uint64_t)__p, attenuationFactor);
  v6 = LOBYTE(__p[0]);
  if (SHIBYTE(v9) < 0)
    operator delete(__p[1]);
  sub_1DCBF92A8((uint64_t)v10);
  return v6 != 0;
}

- (BOOL)generateAmbientOcclusionVertexColorsWithQuality:(float)bakeQuality attenuationFactor:(float)attenuationFactor objectsToConsider:(NSArray *)objectsToConsider vertexAttributeNamed:(NSString *)vertexAttributeName
{
  return MEMORY[0x1E0DE7D20](self, sel_generateAmbientOcclusionVertexColorsWithRaysPerSample_attenuationFactor_objectsToConsider_vertexAttributeNamed_, dword_1DCC5ABB4[vcvtd_n_s64_f64(bakeQuality, 3uLL)]);
}

- (BOOL)generateLightMapTextureWithTextureSize:(vector_int2)textureSize lightsToConsider:(NSArray *)lightsToConsider objectsToConsider:(NSArray *)objectsToConsider vertexAttributeNamed:(NSString *)vertexAttributeName materialPropertyNamed:(NSString *)materialPropertyName
{
  NSArray *v11;
  NSString *v12;
  NSString *v13;
  int v14;
  int v16;
  void *__p[2];
  __int128 v18;
  _OWORD v19[9];
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v16 = textureSize.i32[0];
  v11 = objectsToConsider;
  v12 = vertexAttributeName;
  v13 = materialPropertyName;
  v20 = 0u;
  memset(v19, 0, sizeof(v19));
  DWORD2(v20) = 1065353216;
  v22 = 0;
  v23 = 0;
  v21 = 0;
  sub_1DCBA458C((char **)v19, lightsToConsider);
  *(_OWORD *)__p = 0u;
  v18 = 0u;
  sub_1DCBA25C8((uint64_t)v19, v11, self, v12, v13, 0, v16, 6u, (uint64_t)__p, 0.0);
  v14 = LOBYTE(__p[0]);
  if (SHIBYTE(v18) < 0)
    operator delete(__p[1]);
  sub_1DCBF92A8((uint64_t)v19);

  return v14 != 0;
}

- (BOOL)generateLightMapTextureWithQuality:(float)bakeQuality lightsToConsider:(NSArray *)lightsToConsider objectsToConsider:(NSArray *)objectsToConsider vertexAttributeNamed:(NSString *)vertexAttributeName materialPropertyNamed:(NSString *)materialPropertyName
{
  const float *v7;

  v7 = (const float *)((char *)&unk_1DCC5AB9C + 4 * (int)(bakeQuality * 5.0));
  vld1_dup_f32(v7);
  return MEMORY[0x1E0DE7D20](self, sel_generateLightMapTextureWithTextureSize_lightsToConsider_objectsToConsider_vertexAttributeNamed_materialPropertyNamed_, lightsToConsider);
}

- (BOOL)generateLightMapVertexColorsWithLightsToConsider:(NSArray *)lightsToConsider objectsToConsider:(NSArray *)objectsToConsider vertexAttributeNamed:(NSString *)vertexAttributeName
{
  NSArray *v8;
  NSString *v9;
  int v10;
  void *__p[2];
  __int128 v13;
  _OWORD v14[9];
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v8 = objectsToConsider;
  v9 = vertexAttributeName;
  v15 = 0u;
  memset(v14, 0, sizeof(v14));
  DWORD2(v15) = 1065353216;
  v17 = 0;
  v18 = 0;
  v16 = 0;
  sub_1DCBA458C((char **)v14, lightsToConsider);
  *(_OWORD *)__p = 0u;
  v13 = 0u;
  sub_1DCBA3B5C((uint64_t)v14, v8, self, v9, 121, (uint64_t)__p, 0.1);
  v10 = LOBYTE(__p[0]);
  if (SHIBYTE(v13) < 0)
    operator delete(__p[1]);
  sub_1DCBF92A8((uint64_t)v14);

  return v10 != 0;
}

- (MDLMesh)initCylinderWithExtent:(vector_float3)extent segments:(vector_uint2)segments inwardNormals:(BOOL)inwardNormals topCap:(BOOL)topCap bottomCap:(BOOL)bottomCap geometryType:(MDLGeometryType)geometryType allocator:(id)allocator
{
  uint32x2_t v9;
  _BOOL8 v10;
  __int32 v11;
  uint32x2_t v12;
  const char *v15;
  id v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  const char *v21;
  MDLMesh *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  int32x2_t v28;
  uint64_t v29;
  float32x4_t v30;
  float v31;
  float v32;
  float v33;
  unsigned int v34;
  unsigned int v35;
  float v36;
  float v37;
  float v38;
  uint64_t v39;
  __float2 v40;
  __float2 v41;
  char *v42;
  float *v43;
  float *v44;
  float *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  float *v50;
  int v51;
  float *v52;
  float *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char *v57;
  float *v58;
  int v59;
  float v60;
  float *v61;
  float v62;
  float *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  char *v67;
  float *v68;
  int v69;
  float32x4_t v70;
  int32x4_t v71;
  float32x2_t v72;
  float32x2_t v73;
  float32x4_t v74;
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  char *v82;
  char *v83;
  int v84;
  __int32 v85;
  char *v86;
  char *v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  char *v91;
  __int32 *v92;
  __int32 v93;
  char *v94;
  char *v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  int v101;
  float v102;
  float *v103;
  float *v104;
  float *v105;
  float *v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  char *v110;
  float *v111;
  int v112;
  float *v113;
  float *v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  char *v118;
  float *v119;
  int v120;
  uint64_t v121;
  uint64_t v122;
  float *v123;
  float *v124;
  char *v125;
  float *v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  unint64_t v130;
  char *v131;
  float *v132;
  float *v133;
  int v134;
  uint64_t v135;
  float *v136;
  float *v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  unint64_t v141;
  char *v142;
  float *v143;
  float *v144;
  int v145;
  uint64_t v146;
  float *v147;
  float *v148;
  uint64_t v149;
  unint64_t v150;
  uint64_t v151;
  unint64_t v152;
  char *v153;
  float *v154;
  float *v155;
  int v156;
  uint64_t v157;
  float *v158;
  float *v159;
  float *v160;
  float *v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  unint64_t v165;
  char *v166;
  float *v167;
  float *v168;
  int v169;
  uint64_t v170;
  float *v171;
  uint64_t v172;
  unint64_t v173;
  unint64_t v174;
  unint64_t v175;
  unint64_t v176;
  char *v177;
  float *v178;
  float *v179;
  int v180;
  float v181;
  __float2 v182;
  char *v183;
  char *v184;
  char *v185;
  char *v186;
  uint64_t v187;
  unint64_t v188;
  uint64_t v189;
  char *v190;
  char *v191;
  char *v192;
  int v193;
  char *v194;
  uint64_t v195;
  unint64_t v196;
  uint64_t v197;
  char *v198;
  char *v199;
  char *v200;
  int v201;
  char *v202;
  uint64_t v203;
  unint64_t v204;
  uint64_t v205;
  char *v206;
  char *v207;
  char *v208;
  int v209;
  uint64_t v210;
  int v211;
  int v212;
  uint64_t v213;
  float *v214;
  float *v215;
  char *v216;
  float *v217;
  uint64_t v218;
  unint64_t v219;
  uint64_t v220;
  unint64_t v221;
  char *v222;
  float *v223;
  float *v224;
  int v225;
  uint64_t v226;
  float *v227;
  float *v228;
  uint64_t v229;
  unint64_t v230;
  uint64_t v231;
  unint64_t v232;
  char *v233;
  float *v234;
  float *v235;
  int v236;
  uint64_t v237;
  float *v238;
  float *v239;
  uint64_t v240;
  unint64_t v241;
  uint64_t v242;
  unint64_t v243;
  char *v244;
  float *v245;
  float *v246;
  int v247;
  float v248;
  float v249;
  float *v250;
  float *v251;
  float *v252;
  float *v253;
  uint64_t v254;
  unint64_t v255;
  unint64_t v256;
  char *v257;
  float *v258;
  int v259;
  float v260;
  float *v261;
  float *v262;
  uint64_t v263;
  unint64_t v264;
  char *v265;
  float *v266;
  int v267;
  char *v268;
  char *v269;
  char *v270;
  char *v271;
  uint64_t v272;
  unint64_t v273;
  uint64_t v274;
  char *v275;
  char *v276;
  int v277;
  char *v278;
  char *v279;
  uint64_t v280;
  unint64_t v281;
  uint64_t v282;
  char *v283;
  char *v284;
  int v285;
  char *v286;
  char *v287;
  uint64_t v288;
  unint64_t v289;
  uint64_t v290;
  char *v291;
  char *v292;
  int v293;
  char *v294;
  float *v295;
  float *v296;
  void *v297;
  float *v298;
  uint64_t v299;
  unint64_t v300;
  uint64_t v301;
  char *v302;
  float *v303;
  int v304;
  float v305;
  float *v306;
  float *v307;
  uint64_t v308;
  unint64_t v309;
  uint64_t v310;
  char *v311;
  float *v312;
  int v313;
  float *v314;
  float *v315;
  uint64_t v316;
  unint64_t v317;
  uint64_t v318;
  char *v319;
  float *v320;
  char *v321;
  int v322;
  float *v323;
  float *v324;
  float *v325;
  float *v326;
  uint64_t v327;
  unint64_t v328;
  uint64_t v329;
  char *v330;
  float *v331;
  int v332;
  float *v333;
  float *v334;
  uint64_t v335;
  unint64_t v336;
  uint64_t v337;
  char *v338;
  float *v339;
  char *v340;
  int v341;
  char *v342;
  char *v343;
  char *v344;
  char *v345;
  uint64_t v346;
  unint64_t v347;
  uint64_t v348;
  char *v349;
  char *v350;
  int v351;
  char *v352;
  char *v353;
  uint64_t v354;
  unint64_t v355;
  uint64_t v356;
  char *v357;
  char *v358;
  int v359;
  char *v360;
  char *v361;
  uint64_t v362;
  unint64_t v363;
  uint64_t v364;
  char *v365;
  char *v366;
  char *v367;
  int v368;
  char *v369;
  float *v370;
  float *v371;
  float *v372;
  uint64_t v373;
  unint64_t v374;
  uint64_t v375;
  char *v376;
  float *v377;
  int v378;
  float *v379;
  float *v380;
  uint64_t v381;
  unint64_t v382;
  uint64_t v383;
  char *v384;
  float *v385;
  int v386;
  float *v387;
  float *v388;
  uint64_t v389;
  unint64_t v390;
  uint64_t v391;
  char *v392;
  float *v393;
  char *v394;
  int v395;
  float *v396;
  float *v397;
  float *v398;
  float *v399;
  uint64_t v400;
  unint64_t v401;
  uint64_t v402;
  char *v403;
  float *v404;
  int v405;
  float *v406;
  float *v407;
  uint64_t v408;
  unint64_t v409;
  uint64_t v410;
  char *v411;
  float *v412;
  char *v413;
  int v414;
  char *v415;
  char *v416;
  char *v417;
  char *v418;
  uint64_t v419;
  unint64_t v420;
  uint64_t v421;
  char *v422;
  char *v423;
  int v424;
  char *v425;
  char *v426;
  uint64_t v427;
  unint64_t v428;
  uint64_t v429;
  char *v430;
  char *v431;
  int v432;
  char *v433;
  char *v434;
  uint64_t v435;
  unint64_t v436;
  uint64_t v437;
  char *v438;
  char *v439;
  char *v440;
  int v441;
  void *v442;
  void *v443;
  const char *v444;
  void *v445;
  id v446;
  const char *v447;
  void *v448;
  const char *v449;
  void *v450;
  const char *v451;
  uint64_t v452;
  void *v453;
  const char *v454;
  void *v455;
  id v456;
  const char *v457;
  void *v458;
  const char *v459;
  void *v460;
  const char *v461;
  uint64_t v462;
  void *v463;
  const char *v464;
  void *v465;
  id v466;
  const char *v467;
  void *v468;
  const char *v469;
  int v470;
  unint64_t v471;
  int v472;
  unint64_t v473;
  uint64_t v474;
  uint64_t v475;
  int v476;
  char *v477;
  unsigned int v478;
  unsigned int v479;
  char *v480;
  char *v481;
  char *v482;
  char *v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  char *v487;
  char *v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  char *v492;
  char *v493;
  __int16 v494;
  char *v495;
  char *v496;
  uint64_t v497;
  uint64_t v498;
  unint64_t v499;
  unint64_t v500;
  char *v501;
  char *v502;
  __int16 v503;
  char *v504;
  char *v505;
  uint64_t v506;
  uint64_t v507;
  unint64_t v508;
  unint64_t v509;
  char *v510;
  char *v511;
  __int16 v512;
  char *v513;
  uint64_t v514;
  uint64_t v515;
  unint64_t v516;
  unint64_t v517;
  char *v518;
  char *v519;
  __int16 v520;
  char *v521;
  uint64_t v522;
  uint64_t v523;
  unint64_t v524;
  unint64_t v525;
  char *v526;
  char *v527;
  __int16 v528;
  char *v529;
  __int16 v530;
  uint64_t v531;
  uint64_t v532;
  unint64_t v533;
  unint64_t v534;
  __int16 v535;
  unint64_t v536;
  uint64_t v537;
  unsigned int v538;
  char *v539;
  unsigned int v540;
  unsigned int v541;
  char *v542;
  char *v543;
  char *v544;
  char *v545;
  uint64_t v546;
  unint64_t v547;
  uint64_t v548;
  char *v549;
  char *v550;
  uint64_t v551;
  unint64_t v552;
  uint64_t v553;
  char *v554;
  char *v555;
  int v556;
  unsigned int *v557;
  char *v558;
  uint64_t v559;
  unint64_t v560;
  uint64_t v561;
  char *v562;
  char *v563;
  int v564;
  char *v565;
  char *v566;
  uint64_t v567;
  unint64_t v568;
  uint64_t v569;
  char *v570;
  unsigned int *v571;
  unsigned int v572;
  unsigned int *v573;
  uint64_t v574;
  unint64_t v575;
  uint64_t v576;
  char *v577;
  char *v578;
  int v579;
  char *v580;
  uint64_t v581;
  unint64_t v582;
  uint64_t v583;
  char *v584;
  unsigned int *v585;
  unsigned int v586;
  unsigned int *v587;
  unsigned int v588;
  uint64_t v589;
  unint64_t v590;
  uint64_t v591;
  unsigned int v592;
  int v593;
  unsigned int v594;
  __int16 v595;
  __int16 v596;
  __int16 v597;
  __int16 v598;
  int v599;
  __int16 v600;
  __int16 v601;
  __int16 v602;
  char *v603;
  char *v604;
  char *v605;
  char *v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  char *v610;
  char *v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  char *v615;
  char *v616;
  __int16 v617;
  char *v618;
  char *v619;
  uint64_t v620;
  uint64_t v621;
  unint64_t v622;
  unint64_t v623;
  char *v624;
  char *v625;
  __int16 v626;
  char *v627;
  char *v628;
  uint64_t v629;
  uint64_t v630;
  unint64_t v631;
  unint64_t v632;
  char *v633;
  char *v634;
  __int16 v635;
  char *v636;
  char *v637;
  uint64_t v638;
  uint64_t v639;
  unint64_t v640;
  unint64_t v641;
  char *v642;
  char *v643;
  __int16 v644;
  char *v645;
  char *v646;
  uint64_t v647;
  uint64_t v648;
  unint64_t v649;
  unint64_t v650;
  char *v651;
  char *v652;
  __int16 v653;
  char *v654;
  char *v655;
  uint64_t v656;
  uint64_t v657;
  unint64_t v658;
  unint64_t v659;
  char *v660;
  char *v661;
  __int16 v662;
  char *v663;
  char *v664;
  uint64_t v665;
  uint64_t v666;
  unint64_t v667;
  unint64_t v668;
  char *v669;
  char *v670;
  __int16 v671;
  char *v672;
  char *v673;
  uint64_t v674;
  uint64_t v675;
  unint64_t v676;
  unint64_t v677;
  char *v678;
  char *v679;
  __int16 v680;
  char *v681;
  char *v682;
  uint64_t v683;
  uint64_t v684;
  unint64_t v685;
  unint64_t v686;
  char *v687;
  char *v688;
  __int16 v689;
  char *v690;
  char *v691;
  uint64_t v692;
  uint64_t v693;
  unint64_t v694;
  unint64_t v695;
  char *v696;
  char *v697;
  __int16 v698;
  char *v699;
  char *v700;
  uint64_t v701;
  uint64_t v702;
  unint64_t v703;
  unint64_t v704;
  char *v705;
  char *v706;
  __int16 v707;
  char *v708;
  __int16 v709;
  char *v710;
  char *v711;
  uint64_t v712;
  uint64_t v713;
  unint64_t v714;
  unint64_t v715;
  char *v716;
  char *v717;
  __int16 v718;
  uint64_t v719;
  uint64_t v720;
  unint64_t v721;
  unint64_t v722;
  __int16 v723;
  unsigned int v724;
  __int16 v725;
  unsigned int v726;
  unsigned int v727;
  char *v728;
  char *v729;
  char *v730;
  char *v731;
  uint64_t v732;
  uint64_t v733;
  uint64_t v734;
  char *v735;
  char *v736;
  uint64_t v737;
  uint64_t v738;
  uint64_t v739;
  char *v740;
  char *v741;
  __int16 v742;
  __int16 v743;
  char *v744;
  char *v745;
  uint64_t v746;
  uint64_t v747;
  unint64_t v748;
  unint64_t v749;
  char *v750;
  char *v751;
  __int16 v752;
  __int16 v753;
  char *v754;
  char *v755;
  uint64_t v756;
  uint64_t v757;
  unint64_t v758;
  unint64_t v759;
  char *v760;
  char *v761;
  __int16 v762;
  __int16 v763;
  char *v764;
  uint64_t v765;
  uint64_t v766;
  unint64_t v767;
  unint64_t v768;
  char *v769;
  char *v770;
  __int16 v771;
  char *v772;
  char *v773;
  uint64_t v774;
  uint64_t v775;
  unint64_t v776;
  unint64_t v777;
  char *v778;
  char *v779;
  __int16 v780;
  char *v781;
  __int16 v782;
  __int16 v783;
  uint64_t v784;
  uint64_t v785;
  unint64_t v786;
  unint64_t v787;
  __int16 v788;
  id v789;
  MDLMeshBufferDataAllocator *v790;
  id v791;
  const char *v792;
  void *v793;
  const char *v794;
  void *v795;
  const char *v796;
  id v797;
  const char *v798;
  void *v799;
  const char *v800;
  MDLMaterial *v801;
  void *v802;
  const char *v803;
  void *v804;
  const char *v805;
  void *v806;
  double v807;
  const char *v808;
  uint64_t v809;
  const char *v810;
  void *v811;
  double v812;
  const char *v813;
  uint64_t v814;
  const char *v815;
  void *v816;
  MDLSubmesh *v817;
  const char *v818;
  void *v819;
  int v820;
  unsigned int v821;
  int v822;
  int v823;
  int v824;
  int v825;
  int v826;
  int v827;
  int v828;
  int v829;
  char *v830;
  char *v831;
  char *v832;
  char *v833;
  uint64_t v834;
  unint64_t v835;
  uint64_t v836;
  char *v837;
  char *v838;
  uint64_t v839;
  unint64_t v840;
  uint64_t v841;
  char *v842;
  char *v843;
  int v844;
  char *v845;
  char *v846;
  uint64_t v847;
  unint64_t v848;
  uint64_t v849;
  char *v850;
  char *v851;
  int v852;
  char *v853;
  char *v854;
  uint64_t v855;
  unint64_t v856;
  uint64_t v857;
  char *v858;
  char *v859;
  int v860;
  char *v861;
  char *v862;
  uint64_t v863;
  unint64_t v864;
  uint64_t v865;
  char *v866;
  char *v867;
  int v868;
  char *v869;
  char *v870;
  uint64_t v871;
  unint64_t v872;
  uint64_t v873;
  char *v874;
  char *v875;
  int v876;
  char *v877;
  char *v878;
  uint64_t v879;
  unint64_t v880;
  uint64_t v881;
  char *v882;
  char *v883;
  int v884;
  char *v885;
  char *v886;
  uint64_t v887;
  unint64_t v888;
  uint64_t v889;
  char *v890;
  char *v891;
  int v892;
  char *v893;
  char *v894;
  uint64_t v895;
  unint64_t v896;
  uint64_t v897;
  char *v898;
  char *v899;
  int v900;
  char *v901;
  char *v902;
  uint64_t v903;
  unint64_t v904;
  uint64_t v905;
  char *v906;
  char *v907;
  int v908;
  char *v909;
  char *v910;
  uint64_t v911;
  unint64_t v912;
  uint64_t v913;
  char *v914;
  char *v915;
  int v916;
  char *v917;
  char *v918;
  uint64_t v919;
  unint64_t v920;
  uint64_t v921;
  char *v922;
  char *v923;
  int v924;
  char *v925;
  int v926;
  char *v927;
  char *v928;
  uint64_t v929;
  unint64_t v930;
  uint64_t v931;
  char *v932;
  char *v933;
  int v934;
  uint64_t v935;
  unint64_t v936;
  uint64_t v937;
  int v938;
  unsigned int v939;
  int v940;
  unsigned int v941;
  unsigned int v942;
  char *v943;
  char *v944;
  char *v945;
  char *v946;
  uint64_t v947;
  unint64_t v948;
  uint64_t v949;
  char *v950;
  char *v951;
  uint64_t v952;
  unint64_t v953;
  uint64_t v954;
  char *v955;
  char *v956;
  int v957;
  int v958;
  char *v959;
  char *v960;
  uint64_t v961;
  unint64_t v962;
  uint64_t v963;
  char *v964;
  char *v965;
  int v966;
  int v967;
  char *v968;
  char *v969;
  uint64_t v970;
  unint64_t v971;
  uint64_t v972;
  char *v973;
  char *v974;
  int v975;
  int v976;
  char *v977;
  uint64_t v978;
  unint64_t v979;
  uint64_t v980;
  char *v981;
  char *v982;
  int v983;
  char *v984;
  char *v985;
  uint64_t v986;
  unint64_t v987;
  uint64_t v988;
  char *v989;
  char *v990;
  int v991;
  char *v992;
  int v993;
  int v994;
  uint64_t v995;
  unint64_t v996;
  uint64_t v997;
  int v998;
  id v999;
  const char *v1000;
  const char *v1001;
  const char *v1002;
  id v1003;
  const char *v1004;
  void *v1005;
  const char *v1006;
  MDLMaterial *v1007;
  void *v1008;
  const char *v1009;
  const char *v1010;
  void *v1011;
  double v1012;
  const char *v1013;
  uint64_t v1014;
  const char *v1015;
  void *v1016;
  double v1017;
  const char *v1018;
  uint64_t v1019;
  const char *v1020;
  void *v1021;
  MDLSubmesh *v1022;
  const char *v1023;
  const char *v1024;
  id v1025;
  const char *v1026;
  const char *v1027;
  uint64_t v1028;
  void *v1029;
  const char *v1030;
  MDLVertexDescriptor *v1031;
  const char *v1032;
  uint64_t v1033;
  void *v1034;
  const char *v1035;
  void *v1036;
  const char *v1037;
  const char *v1038;
  uint64_t v1039;
  void *v1040;
  const char *v1041;
  void *v1042;
  const char *v1043;
  const char *v1044;
  uint64_t v1045;
  void *v1046;
  const char *v1047;
  void *v1048;
  const char *v1049;
  const char *v1050;
  uint64_t v1051;
  void *v1052;
  const char *v1053;
  void *v1054;
  const char *v1055;
  const char *v1056;
  uint64_t v1057;
  void *v1058;
  const char *v1059;
  void *v1060;
  const char *v1061;
  const char *v1062;
  uint64_t v1063;
  void *v1064;
  const char *v1065;
  void *v1066;
  const char *v1067;
  const char *v1068;
  uint64_t v1069;
  void *v1070;
  const char *v1071;
  void *v1072;
  const char *v1073;
  const char *v1074;
  uint64_t v1075;
  void *v1076;
  const char *v1077;
  void *v1078;
  const char *v1079;
  const char *v1080;
  uint64_t v1081;
  void *v1082;
  const char *v1083;
  void *v1084;
  const char *v1085;
  const char *v1086;
  uint64_t v1087;
  const char *v1088;
  uint64_t v1089;
  MDLAsset *v1090;
  const char *v1091;
  uint64_t v1092;
  void *v1093;
  const char *v1094;
  void *v1095;
  const char *v1096;
  const char *v1097;
  const char *v1098;
  MDLMesh *v1099;
  __int32 v1101;
  void *context;
  unsigned int v1103;
  void *v1104;
  MDLMesh *v1105;
  __int32 v1106;
  _BOOL4 v1107;
  int v1108;
  float v1109;
  float v1110;
  float v1111;
  unsigned int v1112;
  unsigned int v1113;
  float32x4_t v1114;
  uint64_t v1115;
  int v1116;
  float32x4_t v1117;
  int v1118;
  int v1119;
  int v1120;
  unsigned int v1121;
  uint64_t v1122;
  float32x4_t v1123;
  float32x4_t v1124;
  int v1125;
  void *__p;
  char *v1127;
  char *v1128;
  float *v1129;
  float *v1130;
  char *v1131;
  char *v1132;
  char *v1133;
  char *v1134;
  float *v1135;
  float *v1136;
  _QWORD v1137[2];

  v10 = topCap;
  v1106 = extent.i32[2];
  v1107 = inwardNormals;
  v11 = extent.i32[0];
  v12 = v9;
  v1114 = *(float32x4_t *)segments.i8;
  v16 = (id)bottomCap;
  v1115 = v10;
  if ((unint64_t)(v10 - 1) >= 2)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v17, v21, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: geometryType for Cylinder must be MDLGeometryTypeTriangles or MDLGeometryTypeLines"), v19, v20);

  }
  v22 = (MDLMesh *)(id)objc_msgSend_initWithBufferAllocator_(self, v15, (uint64_t)v16);

  if (!v22)
  {
    v297 = v16;
    goto LABEL_1639;
  }
  v1105 = v22;
  objc_msgSend_allocator(v22, v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend_setName_(v1105, v26, (uint64_t)CFSTR("cylinder"));
  v1104 = (void *)v25;
  context = (void *)MEMORY[0x1DF0D25C8](v27);
  *(uint32x2_t *)v1123.f32 = vmax_u32(v12, (uint32x2_t)0x100000003);
  v28 = vadd_s32(*(int32x2_t *)v1123.f32, (int32x2_t)0x100000001);
  v1122 = v28.u32[0];
  v1101 = v28.i32[0] * v28.i32[1];
  v29 = (v28.i32[0] * v28.i32[1] + 2);
  v1135 = 0;
  v1136 = 0;
  v1137[0] = 0;
  sub_1DCB0BBF4((void **)&v1135, 3 * v29);
  v1132 = 0;
  v1133 = 0;
  v1134 = 0;
  sub_1DCB0BBF4((void **)&v1132, 3 * v29);
  v1103 = v29;
  v1129 = 0;
  v1130 = 0;
  v1131 = 0;
  sub_1DCB0BBF4((void **)&v1129, 2 * v29);
  v1112 = v1123.u32[1];
  v30 = v1114;
  v31 = 6.28318531 / (double)v1123.u32[0];
  v1111 = vmuls_lane_f32(0.5, *(float32x2_t *)v1114.f32, 1);
  v1121 = v1123.i32[0];
  if (v11)
    v30.f32[0] = -1.0;
  else
    v30.f32[0] = 1.0;
  v1117 = v30;
  v1108 = ~v1123.i32[0];
  if (v11)
    v32 = 1.0;
  else
    v32 = -1.0;
  v1110 = 1.0 / (float)v1123.u32[1];
  v33 = 1.0 / (float)v1123.u32[0];
  v34 = 0;
  v1109 = v32;
  do
  {
    v35 = 0;
    v1113 = v34;
    v36 = -(float)(v1111 - (float)((float)(v1114.f32[1] * (float)v34) * v1110));
    v37 = (float)((float)((float)v34 * -0.33333) * v1110) + 0.66667;
    do
    {
      v38 = (float)((float)v35 * v31) + 1.57079633;
      v41 = __sincosf_stret(v38);
      v43 = v1136;
      v42 = (char *)v1137[0];
      if ((unint64_t)v1136 >= v1137[0])
      {
        v45 = v1135;
        v46 = v1136 - v1135;
        v47 = v46 + 1;
        if ((unint64_t)(v46 + 1) >> 62)
          goto LABEL_1640;
        v48 = v1137[0] - (_QWORD)v1135;
        if ((uint64_t)(v1137[0] - (_QWORD)v1135) >> 1 > v47)
          v47 = v48 >> 1;
        if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFFCLL)
          v39 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v39 = v47;
        if (v39)
        {
          v49 = (char *)sub_1DCAE4D04((uint64_t)v1137, v39);
          v45 = v1135;
          v43 = v1136;
        }
        else
        {
          v49 = 0;
        }
        v50 = (float *)&v49[4 * v46];
        *v50 = v41.__cosval * v1114.f32[0];
        v44 = v50 + 1;
        while (v43 != v45)
        {
          v51 = *((_DWORD *)v43-- - 1);
          *((_DWORD *)v50-- - 1) = v51;
        }
        v42 = &v49[4 * v39];
        v1135 = v50;
        v1136 = v44;
        v1137[0] = v42;
        if (v45)
        {
          operator delete(v45);
          v42 = (char *)v1137[0];
        }
      }
      else
      {
        *v1136 = v41.__cosval * v1114.f32[0];
        v44 = v43 + 1;
      }
      v1136 = v44;
      if (v44 >= (float *)v42)
      {
        v53 = v1135;
        v54 = v44 - v1135;
        v55 = v54 + 1;
        if ((unint64_t)(v54 + 1) >> 62)
          goto LABEL_1640;
        v56 = v42 - (char *)v1135;
        if (v56 >> 1 > v55)
          v55 = v56 >> 1;
        if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL)
          v39 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v39 = v55;
        if (v39)
        {
          v57 = (char *)sub_1DCAE4D04((uint64_t)v1137, v39);
          v53 = v1135;
          v44 = v1136;
        }
        else
        {
          v57 = 0;
        }
        v58 = (float *)&v57[4 * v54];
        *v58 = v36;
        v52 = v58 + 1;
        while (v44 != v53)
        {
          v59 = *((_DWORD *)v44-- - 1);
          *((_DWORD *)v58-- - 1) = v59;
        }
        v42 = &v57[4 * v39];
        v1135 = v58;
        v1136 = v52;
        v1137[0] = v42;
        if (v53)
        {
          operator delete(v53);
          v42 = (char *)v1137[0];
        }
      }
      else
      {
        *v44 = v36;
        v52 = v44 + 1;
      }
      v60 = v41.__sinval * v1114.f32[2];
      v1136 = v52;
      if (v52 >= (float *)v42)
      {
        v63 = v1135;
        v64 = v52 - v1135;
        v65 = v64 + 1;
        if ((unint64_t)(v64 + 1) >> 62)
          goto LABEL_1640;
        v66 = v42 - (char *)v1135;
        if (v66 >> 1 > v65)
          v65 = v66 >> 1;
        if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFFCLL)
          v39 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v39 = v65;
        if (v39)
        {
          v67 = (char *)sub_1DCAE4D04((uint64_t)v1137, v39);
          v63 = v1135;
          v52 = v1136;
        }
        else
        {
          v67 = 0;
        }
        v68 = (float *)&v67[4 * v64];
        *v68 = v41.__sinval * v1114.f32[2];
        v61 = v68 + 1;
        while (v52 != v63)
        {
          v69 = *((_DWORD *)v52-- - 1);
          *((_DWORD *)v68-- - 1) = v69;
        }
        v1135 = v68;
        v1136 = v61;
        v1137[0] = &v67[4 * v39];
        if (v63)
          operator delete(v63);
        v62 = v41.__cosval * v1114.f32[0];
        v60 = v41.__sinval * v1114.f32[2];
      }
      else
      {
        *v52 = v60;
        v61 = v52 + 1;
        v62 = v41.__cosval * v1114.f32[0];
      }
      v70.i64[0] = LODWORD(v62);
      v1136 = v61;
      v70.i64[1] = LODWORD(v60);
      v71 = (int32x4_t)vmulq_f32(v70, v70);
      v71.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v71.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v71.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v71, 2)).u32[0];
      v72 = vrsqrte_f32((float32x2_t)v71.u32[0]);
      v73 = vmul_f32(vrsqrts_f32((float32x2_t)v71.u32[0], vmul_f32(v72, v72)), v72);
      *(float32x2_t *)v71.i8 = vmul_f32(v73, vrsqrts_f32((float32x2_t)v71.u32[0], vmul_f32(v73, v73)));
      v74 = vmulq_n_f32(v70, vmulq_f32((float32x4_t)v71, v1117).f32[0]);
      v76 = v1133;
      v75 = v1134;
      v1124 = v74;
      if (v1133 >= v1134)
      {
        v78 = v1132;
        v79 = (v1133 - v1132) >> 2;
        v80 = v79 + 1;
        if ((unint64_t)(v79 + 1) >> 62)
          goto LABEL_1640;
        v81 = v1134 - v1132;
        if ((v1134 - v1132) >> 1 > v80)
          v80 = v81 >> 1;
        if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFFCLL)
          v39 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v39 = v80;
        if (v39)
        {
          v82 = (char *)sub_1DCAE4D04((uint64_t)&v1134, v39);
          v78 = v1132;
          v76 = v1133;
        }
        else
        {
          v82 = 0;
        }
        v83 = &v82[4 * v79];
        *(_DWORD *)v83 = v1124.i32[0];
        v77 = v83 + 4;
        while (v76 != v78)
        {
          v84 = *((_DWORD *)v76 - 1);
          v76 -= 4;
          *((_DWORD *)v83 - 1) = v84;
          v83 -= 4;
        }
        v75 = &v82[4 * v39];
        v1132 = v83;
        v1133 = v77;
        v1134 = v75;
        if (v78)
        {
          operator delete(v78);
          v75 = v1134;
        }
        v74.i32[1] = v1124.i32[1];
      }
      else
      {
        *(_DWORD *)v1133 = v74.i32[0];
        v77 = v76 + 4;
      }
      v1133 = v77;
      v85 = v74.i32[1];
      if (v77 >= v75)
      {
        v87 = v1132;
        v88 = (v77 - v1132) >> 2;
        v89 = v88 + 1;
        if ((unint64_t)(v88 + 1) >> 62)
          goto LABEL_1640;
        v90 = v75 - v1132;
        if (v90 >> 1 > v89)
          v89 = v90 >> 1;
        if ((unint64_t)v90 >= 0x7FFFFFFFFFFFFFFCLL)
          v39 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v39 = v89;
        if (v39)
        {
          v91 = (char *)sub_1DCAE4D04((uint64_t)&v1134, v39);
          v87 = v1132;
          v77 = v1133;
        }
        else
        {
          v91 = 0;
        }
        v92 = (__int32 *)&v91[4 * v88];
        *v92 = v85;
        v86 = (char *)(v92 + 1);
        while (v77 != v87)
        {
          v93 = *((_DWORD *)v77 - 1);
          v77 -= 4;
          *--v92 = v93;
        }
        v75 = &v91[4 * v39];
        v1132 = (char *)v92;
        v1133 = v86;
        v1134 = v75;
        if (v87)
        {
          operator delete(v87);
          v75 = v1134;
        }
      }
      else
      {
        *(_DWORD *)v77 = v74.i32[1];
        v86 = v77 + 4;
      }
      v1133 = v86;
      if (v86 >= v75)
      {
        v95 = v1132;
        v96 = (v86 - v1132) >> 2;
        v97 = v96 + 1;
        if ((unint64_t)(v96 + 1) >> 62)
          goto LABEL_1640;
        v98 = v75 - v1132;
        if (v98 >> 1 > v97)
          v97 = v98 >> 1;
        if ((unint64_t)v98 >= 0x7FFFFFFFFFFFFFFCLL)
          v39 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v39 = v97;
        if (v39)
        {
          v99 = (char *)sub_1DCAE4D04((uint64_t)&v1134, v39);
          v95 = v1132;
          v86 = v1133;
        }
        else
        {
          v99 = 0;
        }
        v100 = &v99[4 * v96];
        *(_DWORD *)v100 = v1124.i32[2];
        v94 = v100 + 4;
        while (v86 != v95)
        {
          v101 = *((_DWORD *)v86 - 1);
          v86 -= 4;
          *((_DWORD *)v100 - 1) = v101;
          v100 -= 4;
        }
        v1132 = v100;
        v1133 = v94;
        v1134 = &v99[4 * v39];
        if (v95)
          operator delete(v95);
      }
      else
      {
        *(_DWORD *)v86 = v1124.i32[2];
        v94 = v86 + 4;
      }
      v1133 = v94;
      v102 = (float)v35 * v33;
      v104 = v1130;
      v103 = (float *)v1131;
      if (v1130 >= (float *)v1131)
      {
        v106 = v1129;
        v107 = v1130 - v1129;
        v108 = v107 + 1;
        if ((unint64_t)(v107 + 1) >> 62)
          goto LABEL_1640;
        v109 = v1131 - (char *)v1129;
        if ((v1131 - (char *)v1129) >> 1 > v108)
          v108 = v109 >> 1;
        if ((unint64_t)v109 >= 0x7FFFFFFFFFFFFFFCLL)
          v39 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v39 = v108;
        if (v39)
        {
          v110 = (char *)sub_1DCAE4D04((uint64_t)&v1131, v39);
          v106 = v1129;
          v104 = v1130;
        }
        else
        {
          v110 = 0;
        }
        v111 = (float *)&v110[4 * v107];
        *v111 = v102;
        v105 = v111 + 1;
        while (v104 != v106)
        {
          v112 = *((_DWORD *)v104-- - 1);
          *((_DWORD *)v111-- - 1) = v112;
        }
        v103 = (float *)&v110[4 * v39];
        v1129 = v111;
        v1130 = v105;
        v1131 = (char *)v103;
        if (v106)
        {
          operator delete(v106);
          v103 = (float *)v1131;
        }
      }
      else
      {
        *v1130 = v102;
        v105 = v104 + 1;
      }
      v1130 = v105;
      if (v105 >= v103)
      {
        v114 = v1129;
        v115 = v105 - v1129;
        v116 = v115 + 1;
        if ((unint64_t)(v115 + 1) >> 62)
          goto LABEL_1640;
        v117 = (char *)v103 - (char *)v1129;
        if (v117 >> 1 > v116)
          v116 = v117 >> 1;
        if ((unint64_t)v117 >= 0x7FFFFFFFFFFFFFFCLL)
          v39 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v39 = v116;
        if (v39)
        {
          v118 = (char *)sub_1DCAE4D04((uint64_t)&v1131, v39);
          v114 = v1129;
          v105 = v1130;
        }
        else
        {
          v118 = 0;
        }
        v119 = (float *)&v118[4 * v115];
        *v119 = v37;
        v113 = v119 + 1;
        while (v105 != v114)
        {
          v120 = *((_DWORD *)v105-- - 1);
          *((_DWORD *)v119-- - 1) = v120;
        }
        v1129 = v119;
        v1130 = v113;
        v1131 = &v118[4 * v39];
        if (v114)
          operator delete(v114);
      }
      else
      {
        *v105 = v37;
        v113 = v105 + 1;
      }
      v1130 = v113;
      ++v35;
    }
    while (v35 <= v1121);
    if (!v1113 && v1107)
    {
      v121 = 0;
      v1125 = (v1136 - v1135) / 3uLL + v1108;
      do
      {
        v122 = 3 * ((int)v121 + v1125);
        v124 = v1135;
        v123 = v1136;
        v125 = (char *)v1137[0];
        if ((unint64_t)v1136 >= v1137[0])
        {
          v127 = v1136 - v1135;
          v128 = v127 + 1;
          if ((unint64_t)(v127 + 1) >> 62)
            goto LABEL_1640;
          v129 = v1137[0] - (_QWORD)v1135;
          if ((uint64_t)(v1137[0] - (_QWORD)v1135) >> 1 > v128)
            v128 = v129 >> 1;
          if ((unint64_t)v129 >= 0x7FFFFFFFFFFFFFFCLL)
            v130 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v130 = v128;
          if (v130)
          {
            v131 = (char *)sub_1DCAE4D04((uint64_t)v1137, v130);
            v132 = v1135;
            v123 = v1136;
          }
          else
          {
            v131 = 0;
            v132 = v1135;
          }
          v133 = (float *)&v131[4 * v127];
          *v133 = v124[v122];
          v126 = v133 + 1;
          while (v123 != v132)
          {
            v134 = *((_DWORD *)v123-- - 1);
            *((_DWORD *)v133-- - 1) = v134;
          }
          v125 = &v131[4 * v130];
          v1135 = v133;
          v1136 = v126;
          v1137[0] = v125;
          if (v132)
          {
            operator delete(v132);
            v125 = (char *)v1137[0];
          }
        }
        else
        {
          *v1136 = v1135[v122];
          v126 = v123 + 1;
        }
        v1136 = v126;
        v135 = v122 + 1;
        v136 = v1135;
        if (v126 >= (float *)v125)
        {
          v138 = v126 - v1135;
          v139 = v138 + 1;
          if ((unint64_t)(v138 + 1) >> 62)
            goto LABEL_1640;
          v140 = v125 - (char *)v1135;
          if (v140 >> 1 > v139)
            v139 = v140 >> 1;
          if ((unint64_t)v140 >= 0x7FFFFFFFFFFFFFFCLL)
            v141 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v141 = v139;
          if (v141)
          {
            v142 = (char *)sub_1DCAE4D04((uint64_t)v1137, v141);
            v143 = v1135;
            v126 = v1136;
          }
          else
          {
            v142 = 0;
            v143 = v1135;
          }
          v144 = (float *)&v142[4 * v138];
          *v144 = v136[v135];
          v137 = v144 + 1;
          while (v126 != v143)
          {
            v145 = *((_DWORD *)v126-- - 1);
            *((_DWORD *)v144-- - 1) = v145;
          }
          v125 = &v142[4 * v141];
          v1135 = v144;
          v1136 = v137;
          v1137[0] = v125;
          if (v143)
          {
            operator delete(v143);
            v125 = (char *)v1137[0];
          }
        }
        else
        {
          *v126 = v1135[v135];
          v137 = v126 + 1;
        }
        v1136 = v137;
        v146 = (int)v122 + 2;
        v147 = v1135;
        if (v137 >= (float *)v125)
        {
          v149 = v137 - v1135;
          v150 = v149 + 1;
          if ((unint64_t)(v149 + 1) >> 62)
            goto LABEL_1640;
          v151 = v125 - (char *)v1135;
          if (v151 >> 1 > v150)
            v150 = v151 >> 1;
          if ((unint64_t)v151 >= 0x7FFFFFFFFFFFFFFCLL)
            v152 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v152 = v150;
          if (v152)
          {
            v153 = (char *)sub_1DCAE4D04((uint64_t)v1137, v152);
            v154 = v1135;
            v137 = v1136;
          }
          else
          {
            v153 = 0;
            v154 = v1135;
          }
          v155 = (float *)&v153[4 * v149];
          *v155 = v147[v146];
          v148 = v155 + 1;
          while (v137 != v154)
          {
            v156 = *((_DWORD *)v137-- - 1);
            *((_DWORD *)v155-- - 1) = v156;
          }
          v1135 = v155;
          v1136 = v148;
          v1137[0] = &v153[4 * v152];
          if (v154)
            operator delete(v154);
        }
        else
        {
          *v137 = v1135[v146];
          v148 = v137 + 1;
        }
        v1136 = v148;
        v157 = 2 * ((int)v121 + v1125);
        v159 = v1129;
        v158 = v1130;
        v160 = (float *)v1131;
        if (v1130 >= (float *)v1131)
        {
          v162 = v1130 - v1129;
          v163 = v162 + 1;
          if ((unint64_t)(v162 + 1) >> 62)
            goto LABEL_1640;
          v164 = v1131 - (char *)v1129;
          if ((v1131 - (char *)v1129) >> 1 > v163)
            v163 = v164 >> 1;
          if ((unint64_t)v164 >= 0x7FFFFFFFFFFFFFFCLL)
            v165 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v165 = v163;
          if (v165)
          {
            v166 = (char *)sub_1DCAE4D04((uint64_t)&v1131, v165);
            v167 = v1129;
            v158 = v1130;
          }
          else
          {
            v166 = 0;
            v167 = v1129;
          }
          v168 = (float *)&v166[4 * v162];
          *v168 = v159[v157];
          v161 = v168 + 1;
          while (v158 != v167)
          {
            v169 = *((_DWORD *)v158-- - 1);
            *((_DWORD *)v168-- - 1) = v169;
          }
          v160 = (float *)&v166[4 * v165];
          v1129 = v168;
          v1130 = v161;
          v1131 = (char *)v160;
          if (v167)
          {
            operator delete(v167);
            v159 = v1129;
            v160 = (float *)v1131;
          }
          else
          {
            v159 = v168;
          }
        }
        else
        {
          *v1130 = v1129[v157];
          v161 = v158 + 1;
        }
        v1130 = v161;
        v170 = (int)(v157 | 1);
        if (v161 >= v160)
        {
          v172 = v161 - v159;
          v173 = v172 + 1;
          if ((unint64_t)(v172 + 1) >> 62)
            goto LABEL_1640;
          v174 = (char *)v160 - (char *)v159;
          v175 = ((char *)v160 - (char *)v159) >> 1;
          if (v175 > v173)
            v173 = v175;
          if (v174 >= 0x7FFFFFFFFFFFFFFCLL)
            v176 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v176 = v173;
          if (v176)
          {
            v177 = (char *)sub_1DCAE4D04((uint64_t)&v1131, v176);
            v178 = v1129;
            v161 = v1130;
          }
          else
          {
            v177 = 0;
            v178 = v159;
          }
          v179 = (float *)&v177[4 * v172];
          *v179 = v159[v170];
          v171 = v179 + 1;
          while (v161 != v178)
          {
            v180 = *((_DWORD *)v161-- - 1);
            *((_DWORD *)v179-- - 1) = v180;
          }
          v1129 = v179;
          v1130 = v171;
          v1131 = &v177[4 * v176];
          if (v178)
          {
            operator delete(v178);
            v159 = v1129;
          }
          else
          {
            v159 = v179;
          }
        }
        else
        {
          *v161 = v159[(int)(v157 | 1)];
          v171 = v161 + 1;
        }
        v1130 = v171;
        v181 = (float)((float)(int)v121 * v31) + -1.57079633;
        v182 = __sincosf_stret(v181);
        v159[v157] = (float)(v182.__cosval * 0.5) + 0.5;
        v159[v170] = (float)(v182.__sinval * -0.16667) + 0.83333;
        v184 = v1132;
        v183 = v1133;
        v185 = v1134;
        if (v1133 >= v1134)
        {
          v187 = (v1133 - v1132) >> 2;
          v188 = v187 + 1;
          if ((unint64_t)(v187 + 1) >> 62)
            goto LABEL_1640;
          v189 = v1134 - v1132;
          if ((v1134 - v1132) >> 1 > v188)
            v188 = v189 >> 1;
          if ((unint64_t)v189 >= 0x7FFFFFFFFFFFFFFCLL)
            v39 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v39 = v188;
          if (v39)
          {
            v190 = (char *)sub_1DCAE4D04((uint64_t)&v1134, v39);
            v191 = v1132;
            v183 = v1133;
          }
          else
          {
            v190 = 0;
            v191 = v1132;
          }
          v192 = &v190[4 * v187];
          *(_DWORD *)v192 = *(_DWORD *)&v184[4 * v122];
          v186 = v192 + 4;
          while (v183 != v191)
          {
            v193 = *((_DWORD *)v183 - 1);
            v183 -= 4;
            *((_DWORD *)v192 - 1) = v193;
            v192 -= 4;
          }
          v185 = &v190[4 * v39];
          v1132 = v192;
          v1133 = v186;
          v1134 = v185;
          if (v191)
          {
            operator delete(v191);
            v184 = v1132;
            v185 = v1134;
          }
          else
          {
            v184 = v192;
          }
        }
        else
        {
          *(_DWORD *)v1133 = *(_DWORD *)&v1132[4 * v122];
          v186 = v183 + 4;
        }
        v1133 = v186;
        if (v186 >= v185)
        {
          v195 = (v186 - v184) >> 2;
          v196 = v195 + 1;
          if ((unint64_t)(v195 + 1) >> 62)
            goto LABEL_1640;
          v197 = v185 - v184;
          if (v197 >> 1 > v196)
            v196 = v197 >> 1;
          if ((unint64_t)v197 >= 0x7FFFFFFFFFFFFFFCLL)
            v39 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v39 = v196;
          if (v39)
          {
            v198 = (char *)sub_1DCAE4D04((uint64_t)&v1134, v39);
            v199 = v1132;
            v186 = v1133;
          }
          else
          {
            v198 = 0;
            v199 = v184;
          }
          v200 = &v198[4 * v195];
          *(_DWORD *)v200 = *(_DWORD *)&v184[4 * v135];
          v194 = v200 + 4;
          while (v186 != v199)
          {
            v201 = *((_DWORD *)v186 - 1);
            v186 -= 4;
            *((_DWORD *)v200 - 1) = v201;
            v200 -= 4;
          }
          v185 = &v198[4 * v39];
          v1132 = v200;
          v1133 = v194;
          v1134 = v185;
          if (v199)
          {
            operator delete(v199);
            v184 = v1132;
            v185 = v1134;
          }
          else
          {
            v184 = v200;
          }
        }
        else
        {
          *(_DWORD *)v186 = *(_DWORD *)&v184[4 * v135];
          v194 = v186 + 4;
        }
        v1133 = v194;
        if (v194 >= v185)
        {
          v203 = (v194 - v184) >> 2;
          v204 = v203 + 1;
          if ((unint64_t)(v203 + 1) >> 62)
            goto LABEL_1640;
          v205 = v185 - v184;
          if (v205 >> 1 > v204)
            v204 = v205 >> 1;
          if ((unint64_t)v205 >= 0x7FFFFFFFFFFFFFFCLL)
            v39 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v39 = v204;
          if (v39)
          {
            v206 = (char *)sub_1DCAE4D04((uint64_t)&v1134, v39);
            v207 = v1132;
            v194 = v1133;
          }
          else
          {
            v206 = 0;
            v207 = v184;
          }
          v208 = &v206[4 * v203];
          *(_DWORD *)v208 = *(_DWORD *)&v184[4 * v146];
          v202 = v208 + 4;
          while (v194 != v207)
          {
            v209 = *((_DWORD *)v194 - 1);
            v194 -= 4;
            *((_DWORD *)v208 - 1) = v209;
            v208 -= 4;
          }
          v1132 = v208;
          v1133 = v202;
          v1134 = &v206[4 * v39];
          if (v207)
          {
            operator delete(v207);
            v184 = v1132;
          }
          else
          {
            v184 = v208;
          }
        }
        else
        {
          *(_DWORD *)v194 = *(_DWORD *)&v184[4 * v146];
          v202 = v194 + 4;
        }
        v1133 = v202;
        *(_DWORD *)&v184[4 * v122] = 0;
        *(float *)&v184[4 * v135] = v1109;
        *(_DWORD *)&v184[4 * v146] = 0;
        ++v121;
      }
      while (v121 != v1122);
    }
    if (v1113 == v1112 && v1106)
    {
      v210 = 0;
      v211 = (v1136 - v1135) / 3uLL + v1108;
      do
      {
        v212 = 3 * (v210 + v211);
        v213 = v212;
        v215 = v1135;
        v214 = v1136;
        v216 = (char *)v1137[0];
        if ((unint64_t)v1136 >= v1137[0])
        {
          v218 = v1136 - v1135;
          v219 = v218 + 1;
          if ((unint64_t)(v218 + 1) >> 62)
            goto LABEL_1640;
          v220 = v1137[0] - (_QWORD)v1135;
          if ((uint64_t)(v1137[0] - (_QWORD)v1135) >> 1 > v219)
            v219 = v220 >> 1;
          if ((unint64_t)v220 >= 0x7FFFFFFFFFFFFFFCLL)
            v221 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v221 = v219;
          if (v221)
          {
            v222 = (char *)sub_1DCAE4D04((uint64_t)v1137, v221);
            v223 = v1135;
            v214 = v1136;
          }
          else
          {
            v222 = 0;
            v223 = v1135;
          }
          v224 = (float *)&v222[4 * v218];
          *v224 = v215[v213];
          v217 = v224 + 1;
          while (v214 != v223)
          {
            v225 = *((_DWORD *)v214-- - 1);
            *((_DWORD *)v224-- - 1) = v225;
          }
          v216 = &v222[4 * v221];
          v1135 = v224;
          v1136 = v217;
          v1137[0] = v216;
          if (v223)
          {
            operator delete(v223);
            v216 = (char *)v1137[0];
          }
        }
        else
        {
          *v1136 = v1135[v212];
          v217 = v214 + 1;
        }
        v1136 = v217;
        v226 = v213 + 1;
        v227 = v1135;
        if (v217 >= (float *)v216)
        {
          v229 = v217 - v1135;
          v230 = v229 + 1;
          if ((unint64_t)(v229 + 1) >> 62)
            goto LABEL_1640;
          v231 = v216 - (char *)v1135;
          if (v231 >> 1 > v230)
            v230 = v231 >> 1;
          if ((unint64_t)v231 >= 0x7FFFFFFFFFFFFFFCLL)
            v232 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v232 = v230;
          if (v232)
          {
            v233 = (char *)sub_1DCAE4D04((uint64_t)v1137, v232);
            v234 = v1135;
            v217 = v1136;
          }
          else
          {
            v233 = 0;
            v234 = v1135;
          }
          v235 = (float *)&v233[4 * v229];
          *v235 = v227[v226];
          v228 = v235 + 1;
          while (v217 != v234)
          {
            v236 = *((_DWORD *)v217-- - 1);
            *((_DWORD *)v235-- - 1) = v236;
          }
          v216 = &v233[4 * v232];
          v1135 = v235;
          v1136 = v228;
          v1137[0] = v216;
          if (v234)
          {
            operator delete(v234);
            v216 = (char *)v1137[0];
          }
        }
        else
        {
          *v217 = v1135[v226];
          v228 = v217 + 1;
        }
        v1136 = v228;
        v237 = v213 + 2;
        v238 = v1135;
        if (v228 >= (float *)v216)
        {
          v240 = v228 - v1135;
          v241 = v240 + 1;
          if ((unint64_t)(v240 + 1) >> 62)
            goto LABEL_1640;
          v242 = v216 - (char *)v1135;
          if (v242 >> 1 > v241)
            v241 = v242 >> 1;
          if ((unint64_t)v242 >= 0x7FFFFFFFFFFFFFFCLL)
            v243 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v243 = v241;
          if (v243)
          {
            v244 = (char *)sub_1DCAE4D04((uint64_t)v1137, v243);
            v245 = v1135;
            v228 = v1136;
          }
          else
          {
            v244 = 0;
            v245 = v1135;
          }
          v246 = (float *)&v244[4 * v240];
          *v246 = v238[v237];
          v239 = v246 + 1;
          while (v228 != v245)
          {
            v247 = *((_DWORD *)v228-- - 1);
            *((_DWORD *)v246-- - 1) = v247;
          }
          v1135 = v246;
          v1136 = v239;
          v1137[0] = &v244[4 * v243];
          if (v245)
            operator delete(v245);
        }
        else
        {
          *v228 = v1135[v237];
          v239 = v228 + 1;
        }
        v1136 = v239;
        v248 = (float)((float)(int)v210 * v31) + -1.57079633;
        v249 = (float)(cosf(v248) * 0.5) + 0.5;
        v250 = v1130;
        v251 = (float *)v1131;
        if (v1130 >= (float *)v1131)
        {
          v253 = v1129;
          v254 = v1130 - v1129;
          v255 = v254 + 1;
          if ((unint64_t)(v254 + 1) >> 62)
            goto LABEL_1640;
          if ((v1131 - (char *)v1129) >> 1 > v255)
            v255 = (v1131 - (char *)v1129) >> 1;
          if ((unint64_t)(v1131 - (char *)v1129) >= 0x7FFFFFFFFFFFFFFCLL)
            v256 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v256 = v255;
          if (v256)
          {
            v257 = (char *)sub_1DCAE4D04((uint64_t)&v1131, v256);
            v253 = v1129;
            v250 = v1130;
          }
          else
          {
            v257 = 0;
          }
          v258 = (float *)&v257[4 * v254];
          *v258 = v249;
          v252 = v258 + 1;
          while (v250 != v253)
          {
            v259 = *((_DWORD *)v250-- - 1);
            *((_DWORD *)v258-- - 1) = v259;
          }
          v251 = (float *)&v257[4 * v256];
          v1129 = v258;
          v1130 = v252;
          v1131 = (char *)v251;
          if (v253)
          {
            operator delete(v253);
            v251 = (float *)v1131;
          }
        }
        else
        {
          *v1130 = v249;
          v252 = v250 + 1;
        }
        v1130 = v252;
        v260 = (float)(sinf(v248) * 0.16667) + 0.16667;
        if (v252 >= v251)
        {
          v262 = v1129;
          v263 = v252 - v1129;
          v264 = v263 + 1;
          if ((unint64_t)(v263 + 1) >> 62)
            goto LABEL_1640;
          if (((char *)v251 - (char *)v1129) >> 1 > v264)
            v264 = ((char *)v251 - (char *)v1129) >> 1;
          if ((unint64_t)((char *)v251 - (char *)v1129) >= 0x7FFFFFFFFFFFFFFCLL)
            v39 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v39 = v264;
          if (v39)
          {
            v265 = (char *)sub_1DCAE4D04((uint64_t)&v1131, v39);
            v262 = v1129;
            v252 = v1130;
          }
          else
          {
            v265 = 0;
          }
          v266 = (float *)&v265[4 * v263];
          *v266 = v260;
          v261 = v266 + 1;
          while (v252 != v262)
          {
            v267 = *((_DWORD *)v252-- - 1);
            *((_DWORD *)v266-- - 1) = v267;
          }
          v1129 = v266;
          v1130 = v261;
          v1131 = &v265[4 * v39];
          if (v262)
            operator delete(v262);
        }
        else
        {
          *v252 = v260;
          v261 = v252 + 1;
        }
        v1130 = v261;
        v269 = v1133;
        v268 = v1134;
        if (v1133 >= v1134)
        {
          v271 = v1132;
          v272 = (v1133 - v1132) >> 2;
          v273 = v272 + 1;
          if ((unint64_t)(v272 + 1) >> 62)
            goto LABEL_1640;
          v274 = v1134 - v1132;
          if ((v1134 - v1132) >> 1 > v273)
            v273 = v274 >> 1;
          if ((unint64_t)v274 >= 0x7FFFFFFFFFFFFFFCLL)
            v39 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v39 = v273;
          if (v39)
          {
            v275 = (char *)sub_1DCAE4D04((uint64_t)&v1134, v39);
            v271 = v1132;
            v269 = v1133;
          }
          else
          {
            v275 = 0;
          }
          v276 = &v275[4 * v272];
          *(_DWORD *)v276 = 0;
          v270 = v276 + 4;
          while (v269 != v271)
          {
            v277 = *((_DWORD *)v269 - 1);
            v269 -= 4;
            *((_DWORD *)v276 - 1) = v277;
            v276 -= 4;
          }
          v268 = &v275[4 * v39];
          v1132 = v276;
          v1133 = v270;
          v1134 = v268;
          if (v271)
          {
            operator delete(v271);
            v268 = v1134;
          }
        }
        else
        {
          *(_DWORD *)v1133 = 0;
          v270 = v269 + 4;
        }
        v1133 = v270;
        if (v270 >= v268)
        {
          v279 = v1132;
          v280 = (v270 - v1132) >> 2;
          v281 = v280 + 1;
          if ((unint64_t)(v280 + 1) >> 62)
            goto LABEL_1640;
          v282 = v268 - v1132;
          if (v282 >> 1 > v281)
            v281 = v282 >> 1;
          if ((unint64_t)v282 >= 0x7FFFFFFFFFFFFFFCLL)
            v39 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v39 = v281;
          if (v39)
          {
            v283 = (char *)sub_1DCAE4D04((uint64_t)&v1134, v39);
            v279 = v1132;
            v270 = v1133;
          }
          else
          {
            v283 = 0;
          }
          v284 = &v283[4 * v280];
          *(_DWORD *)v284 = v1117.i32[0];
          v278 = v284 + 4;
          while (v270 != v279)
          {
            v285 = *((_DWORD *)v270 - 1);
            v270 -= 4;
            *((_DWORD *)v284 - 1) = v285;
            v284 -= 4;
          }
          v268 = &v283[4 * v39];
          v1132 = v284;
          v1133 = v278;
          v1134 = v268;
          if (v279)
          {
            operator delete(v279);
            v268 = v1134;
          }
        }
        else
        {
          *(_DWORD *)v270 = v1117.i32[0];
          v278 = v270 + 4;
        }
        v1133 = v278;
        if (v278 >= v268)
        {
          v287 = v1132;
          v288 = (v278 - v1132) >> 2;
          v289 = v288 + 1;
          if ((unint64_t)(v288 + 1) >> 62)
            goto LABEL_1640;
          v290 = v268 - v1132;
          if (v290 >> 1 > v289)
            v289 = v290 >> 1;
          if ((unint64_t)v290 >= 0x7FFFFFFFFFFFFFFCLL)
            v39 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v39 = v289;
          if (v39)
          {
            v291 = (char *)sub_1DCAE4D04((uint64_t)&v1134, v39);
            v287 = v1132;
            v278 = v1133;
          }
          else
          {
            v291 = 0;
          }
          v292 = &v291[4 * v288];
          *(_DWORD *)v292 = 0;
          v286 = v292 + 4;
          while (v278 != v287)
          {
            v293 = *((_DWORD *)v278 - 1);
            v278 -= 4;
            *((_DWORD *)v292 - 1) = v293;
            v292 -= 4;
          }
          v1132 = v292;
          v1133 = v286;
          v1134 = &v291[4 * v39];
          if (v287)
            operator delete(v287);
        }
        else
        {
          *(_DWORD *)v278 = 0;
          v286 = v278 + 4;
        }
        v1133 = v286;
        ++v210;
      }
      while (v210 != v1122);
    }
    v34 = v1113 + 1;
  }
  while (v1113 + 1 <= v1112);
  if (v1107)
  {
    v295 = v1136;
    v294 = (char *)v1137[0];
    if ((unint64_t)v1136 >= v1137[0])
    {
      v298 = v1135;
      v299 = v1136 - v1135;
      v300 = v299 + 1;
      if ((unint64_t)(v299 + 1) >> 62)
        goto LABEL_1640;
      v301 = v1137[0] - (_QWORD)v1135;
      if ((uint64_t)(v1137[0] - (_QWORD)v1135) >> 1 > v300)
        v300 = v301 >> 1;
      if ((unint64_t)v301 >= 0x7FFFFFFFFFFFFFFCLL)
        v39 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v39 = v300;
      if (v39)
      {
        v302 = (char *)sub_1DCAE4D04((uint64_t)v1137, v39);
        v298 = v1135;
        v295 = v1136;
      }
      else
      {
        v302 = 0;
      }
      v303 = (float *)&v302[4 * v299];
      v294 = &v302[4 * v39];
      *v303 = 0.0;
      v296 = v303 + 1;
      while (v295 != v298)
      {
        v304 = *((_DWORD *)v295-- - 1);
        *((_DWORD *)v303-- - 1) = v304;
      }
      v1135 = v303;
      v1136 = v296;
      v1137[0] = v294;
      if (v298)
      {
        operator delete(v298);
        v294 = (char *)v1137[0];
      }
    }
    else
    {
      *v1136 = 0.0;
      v296 = v295 + 1;
    }
    v1136 = v296;
    v305 = v1114.f32[1] * -0.5;
    if (v296 >= (float *)v294)
    {
      v307 = v1135;
      v308 = v296 - v1135;
      v309 = v308 + 1;
      if ((unint64_t)(v308 + 1) >> 62)
        goto LABEL_1640;
      v310 = v294 - (char *)v1135;
      if (v310 >> 1 > v309)
        v309 = v310 >> 1;
      if ((unint64_t)v310 >= 0x7FFFFFFFFFFFFFFCLL)
        v39 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v39 = v309;
      if (v39)
      {
        v311 = (char *)sub_1DCAE4D04((uint64_t)v1137, v39);
        v307 = v1135;
        v296 = v1136;
      }
      else
      {
        v311 = 0;
      }
      v312 = (float *)&v311[4 * v308];
      v294 = &v311[4 * v39];
      *v312 = v305;
      v306 = v312 + 1;
      while (v296 != v307)
      {
        v313 = *((_DWORD *)v296-- - 1);
        *((_DWORD *)v312-- - 1) = v313;
      }
      v1135 = v312;
      v1136 = v306;
      v1137[0] = v294;
      if (v307)
      {
        operator delete(v307);
        v294 = (char *)v1137[0];
      }
    }
    else
    {
      *v296 = v305;
      v306 = v296 + 1;
    }
    v1136 = v306;
    if (v306 >= (float *)v294)
    {
      v315 = v1135;
      v316 = v306 - v1135;
      v317 = v316 + 1;
      if ((unint64_t)(v316 + 1) >> 62)
        goto LABEL_1640;
      v318 = v294 - (char *)v1135;
      if (v318 >> 1 > v317)
        v317 = v318 >> 1;
      if ((unint64_t)v318 >= 0x7FFFFFFFFFFFFFFCLL)
        v39 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v39 = v317;
      if (v39)
      {
        v319 = (char *)sub_1DCAE4D04((uint64_t)v1137, v39);
        v315 = v1135;
        v306 = v1136;
      }
      else
      {
        v319 = 0;
      }
      v320 = (float *)&v319[4 * v316];
      v321 = &v319[4 * v39];
      *v320 = 0.0;
      v314 = v320 + 1;
      while (v306 != v315)
      {
        v322 = *((_DWORD *)v306-- - 1);
        *((_DWORD *)v320-- - 1) = v322;
      }
      v1135 = v320;
      v1136 = v314;
      v1137[0] = v321;
      if (v315)
        operator delete(v315);
    }
    else
    {
      *v306 = 0.0;
      v314 = v306 + 1;
    }
    v1136 = v314;
    v324 = v1130;
    v323 = (float *)v1131;
    if (v1130 >= (float *)v1131)
    {
      v326 = v1129;
      v327 = v1130 - v1129;
      v328 = v327 + 1;
      if ((unint64_t)(v327 + 1) >> 62)
        goto LABEL_1640;
      v329 = v1131 - (char *)v1129;
      if ((v1131 - (char *)v1129) >> 1 > v328)
        v328 = v329 >> 1;
      if ((unint64_t)v329 >= 0x7FFFFFFFFFFFFFFCLL)
        v39 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v39 = v328;
      if (v39)
      {
        v330 = (char *)sub_1DCAE4D04((uint64_t)&v1131, v39);
        v326 = v1129;
        v324 = v1130;
      }
      else
      {
        v330 = 0;
      }
      v331 = (float *)&v330[4 * v327];
      v323 = (float *)&v330[4 * v39];
      *v331 = 0.5;
      v325 = v331 + 1;
      while (v324 != v326)
      {
        v332 = *((_DWORD *)v324-- - 1);
        *((_DWORD *)v331-- - 1) = v332;
      }
      v1129 = v331;
      v1130 = v325;
      v1131 = (char *)v323;
      if (v326)
      {
        operator delete(v326);
        v323 = (float *)v1131;
      }
    }
    else
    {
      *v1130 = 0.5;
      v325 = v324 + 1;
    }
    v1130 = v325;
    if (v325 >= v323)
    {
      v334 = v1129;
      v335 = v325 - v1129;
      v336 = v335 + 1;
      if ((unint64_t)(v335 + 1) >> 62)
        goto LABEL_1640;
      v337 = (char *)v323 - (char *)v1129;
      if (v337 >> 1 > v336)
        v336 = v337 >> 1;
      if ((unint64_t)v337 >= 0x7FFFFFFFFFFFFFFCLL)
        v39 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v39 = v336;
      if (v39)
      {
        v338 = (char *)sub_1DCAE4D04((uint64_t)&v1131, v39);
        v334 = v1129;
        v325 = v1130;
      }
      else
      {
        v338 = 0;
      }
      v339 = (float *)&v338[4 * v335];
      v340 = &v338[4 * v39];
      *v339 = 0.83333;
      v333 = v339 + 1;
      while (v325 != v334)
      {
        v341 = *((_DWORD *)v325-- - 1);
        *((_DWORD *)v339-- - 1) = v341;
      }
      v1129 = v339;
      v1130 = v333;
      v1131 = v340;
      if (v334)
        operator delete(v334);
    }
    else
    {
      *v325 = 0.83333;
      v333 = v325 + 1;
    }
    v1130 = v333;
    v343 = v1133;
    v342 = v1134;
    if (v1133 >= v1134)
    {
      v345 = v1132;
      v346 = (v1133 - v1132) >> 2;
      v347 = v346 + 1;
      if ((unint64_t)(v346 + 1) >> 62)
        goto LABEL_1640;
      v348 = v1134 - v1132;
      if ((v1134 - v1132) >> 1 > v347)
        v347 = v348 >> 1;
      if ((unint64_t)v348 >= 0x7FFFFFFFFFFFFFFCLL)
        v39 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v39 = v347;
      if (v39)
      {
        v349 = (char *)sub_1DCAE4D04((uint64_t)&v1134, v39);
        v345 = v1132;
        v343 = v1133;
      }
      else
      {
        v349 = 0;
      }
      v350 = &v349[4 * v346];
      v342 = &v349[4 * v39];
      *(_DWORD *)v350 = 0;
      v344 = v350 + 4;
      while (v343 != v345)
      {
        v351 = *((_DWORD *)v343 - 1);
        v343 -= 4;
        *((_DWORD *)v350 - 1) = v351;
        v350 -= 4;
      }
      v1132 = v350;
      v1133 = v344;
      v1134 = v342;
      if (v345)
      {
        operator delete(v345);
        v342 = v1134;
      }
    }
    else
    {
      *(_DWORD *)v1133 = 0;
      v344 = v343 + 4;
    }
    v1133 = v344;
    if (v344 >= v342)
    {
      v353 = v1132;
      v354 = (v344 - v1132) >> 2;
      v355 = v354 + 1;
      if ((unint64_t)(v354 + 1) >> 62)
        goto LABEL_1640;
      v356 = v342 - v1132;
      if (v356 >> 1 > v355)
        v355 = v356 >> 1;
      if ((unint64_t)v356 >= 0x7FFFFFFFFFFFFFFCLL)
        v39 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v39 = v355;
      if (v39)
      {
        v357 = (char *)sub_1DCAE4D04((uint64_t)&v1134, v39);
        v353 = v1132;
        v344 = v1133;
      }
      else
      {
        v357 = 0;
      }
      v358 = &v357[4 * v354];
      v342 = &v357[4 * v39];
      *(float *)v358 = v1109;
      v352 = v358 + 4;
      while (v344 != v353)
      {
        v359 = *((_DWORD *)v344 - 1);
        v344 -= 4;
        *((_DWORD *)v358 - 1) = v359;
        v358 -= 4;
      }
      v1132 = v358;
      v1133 = v352;
      v1134 = v342;
      if (v353)
      {
        operator delete(v353);
        v342 = v1134;
      }
    }
    else
    {
      *(float *)v344 = v1109;
      v352 = v344 + 4;
    }
    v1133 = v352;
    if (v352 >= v342)
    {
      v361 = v1132;
      v362 = (v352 - v1132) >> 2;
      v363 = v362 + 1;
      if ((unint64_t)(v362 + 1) >> 62)
        goto LABEL_1640;
      v364 = v342 - v1132;
      if (v364 >> 1 > v363)
        v363 = v364 >> 1;
      if ((unint64_t)v364 >= 0x7FFFFFFFFFFFFFFCLL)
        v39 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v39 = v363;
      if (v39)
      {
        v365 = (char *)sub_1DCAE4D04((uint64_t)&v1134, v39);
        v361 = v1132;
        v352 = v1133;
      }
      else
      {
        v365 = 0;
      }
      v366 = &v365[4 * v362];
      v367 = &v365[4 * v39];
      *(_DWORD *)v366 = 0;
      v360 = v366 + 4;
      while (v352 != v361)
      {
        v368 = *((_DWORD *)v352 - 1);
        v352 -= 4;
        *((_DWORD *)v366 - 1) = v368;
        v366 -= 4;
      }
      v1132 = v366;
      v1133 = v360;
      v1134 = v367;
      if (v361)
        operator delete(v361);
    }
    else
    {
      *(_DWORD *)v352 = 0;
      v360 = v352 + 4;
    }
    v1133 = v360;
  }
  if (!v1106)
    goto LABEL_674;
  v370 = v1136;
  v369 = (char *)v1137[0];
  if ((unint64_t)v1136 >= v1137[0])
  {
    v372 = v1135;
    v373 = v1136 - v1135;
    v374 = v373 + 1;
    if ((unint64_t)(v373 + 1) >> 62)
      goto LABEL_1640;
    v375 = v1137[0] - (_QWORD)v1135;
    if ((uint64_t)(v1137[0] - (_QWORD)v1135) >> 1 > v374)
      v374 = v375 >> 1;
    if ((unint64_t)v375 >= 0x7FFFFFFFFFFFFFFCLL)
      v39 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v39 = v374;
    if (v39)
    {
      v376 = (char *)sub_1DCAE4D04((uint64_t)v1137, v39);
      v372 = v1135;
      v370 = v1136;
    }
    else
    {
      v376 = 0;
    }
    v377 = (float *)&v376[4 * v373];
    v369 = &v376[4 * v39];
    *v377 = 0.0;
    v371 = v377 + 1;
    while (v370 != v372)
    {
      v378 = *((_DWORD *)v370-- - 1);
      *((_DWORD *)v377-- - 1) = v378;
    }
    v1135 = v377;
    v1136 = v371;
    v1137[0] = v369;
    if (v372)
    {
      operator delete(v372);
      v369 = (char *)v1137[0];
    }
  }
  else
  {
    *v1136 = 0.0;
    v371 = v370 + 1;
  }
  v1136 = v371;
  if (v371 >= (float *)v369)
  {
    v380 = v1135;
    v381 = v371 - v1135;
    v382 = v381 + 1;
    if ((unint64_t)(v381 + 1) >> 62)
      goto LABEL_1640;
    v383 = v369 - (char *)v1135;
    if (v383 >> 1 > v382)
      v382 = v383 >> 1;
    if ((unint64_t)v383 >= 0x7FFFFFFFFFFFFFFCLL)
      v39 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v39 = v382;
    if (v39)
    {
      v384 = (char *)sub_1DCAE4D04((uint64_t)v1137, v39);
      v380 = v1135;
      v371 = v1136;
    }
    else
    {
      v384 = 0;
    }
    v385 = (float *)&v384[4 * v381];
    v369 = &v384[4 * v39];
    *v385 = v1111;
    v379 = v385 + 1;
    while (v371 != v380)
    {
      v386 = *((_DWORD *)v371-- - 1);
      *((_DWORD *)v385-- - 1) = v386;
    }
    v1135 = v385;
    v1136 = v379;
    v1137[0] = v369;
    if (v380)
    {
      operator delete(v380);
      v369 = (char *)v1137[0];
    }
  }
  else
  {
    *v371 = v1111;
    v379 = v371 + 1;
  }
  v1136 = v379;
  if (v379 >= (float *)v369)
  {
    v388 = v1135;
    v389 = v379 - v1135;
    v390 = v389 + 1;
    if ((unint64_t)(v389 + 1) >> 62)
      goto LABEL_1640;
    v391 = v369 - (char *)v1135;
    if (v391 >> 1 > v390)
      v390 = v391 >> 1;
    if ((unint64_t)v391 >= 0x7FFFFFFFFFFFFFFCLL)
      v39 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v39 = v390;
    if (v39)
    {
      v392 = (char *)sub_1DCAE4D04((uint64_t)v1137, v39);
      v388 = v1135;
      v379 = v1136;
    }
    else
    {
      v392 = 0;
    }
    v393 = (float *)&v392[4 * v389];
    v394 = &v392[4 * v39];
    *v393 = 0.0;
    v387 = v393 + 1;
    while (v379 != v388)
    {
      v395 = *((_DWORD *)v379-- - 1);
      *((_DWORD *)v393-- - 1) = v395;
    }
    v1135 = v393;
    v1136 = v387;
    v1137[0] = v394;
    if (v388)
      operator delete(v388);
  }
  else
  {
    *v379 = 0.0;
    v387 = v379 + 1;
  }
  v1136 = v387;
  v397 = v1130;
  v396 = (float *)v1131;
  if (v1130 >= (float *)v1131)
  {
    v399 = v1129;
    v400 = v1130 - v1129;
    v401 = v400 + 1;
    if ((unint64_t)(v400 + 1) >> 62)
      goto LABEL_1640;
    v402 = v1131 - (char *)v1129;
    if ((v1131 - (char *)v1129) >> 1 > v401)
      v401 = v402 >> 1;
    if ((unint64_t)v402 >= 0x7FFFFFFFFFFFFFFCLL)
      v39 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v39 = v401;
    if (v39)
    {
      v403 = (char *)sub_1DCAE4D04((uint64_t)&v1131, v39);
      v399 = v1129;
      v397 = v1130;
    }
    else
    {
      v403 = 0;
    }
    v404 = (float *)&v403[4 * v400];
    v396 = (float *)&v403[4 * v39];
    *v404 = 0.5;
    v398 = v404 + 1;
    while (v397 != v399)
    {
      v405 = *((_DWORD *)v397-- - 1);
      *((_DWORD *)v404-- - 1) = v405;
    }
    v1129 = v404;
    v1130 = v398;
    v1131 = (char *)v396;
    if (v399)
    {
      operator delete(v399);
      v396 = (float *)v1131;
    }
  }
  else
  {
    *v1130 = 0.5;
    v398 = v397 + 1;
  }
  v1130 = v398;
  if (v398 >= v396)
  {
    v407 = v1129;
    v408 = v398 - v1129;
    v409 = v408 + 1;
    if ((unint64_t)(v408 + 1) >> 62)
      goto LABEL_1640;
    v410 = (char *)v396 - (char *)v1129;
    if (v410 >> 1 > v409)
      v409 = v410 >> 1;
    if ((unint64_t)v410 >= 0x7FFFFFFFFFFFFFFCLL)
      v39 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v39 = v409;
    if (v39)
    {
      v411 = (char *)sub_1DCAE4D04((uint64_t)&v1131, v39);
      v407 = v1129;
      v398 = v1130;
    }
    else
    {
      v411 = 0;
    }
    v412 = (float *)&v411[4 * v408];
    v413 = &v411[4 * v39];
    *v412 = 0.16667;
    v406 = v412 + 1;
    while (v398 != v407)
    {
      v414 = *((_DWORD *)v398-- - 1);
      *((_DWORD *)v412-- - 1) = v414;
    }
    v1129 = v412;
    v1130 = v406;
    v1131 = v413;
    if (v407)
      operator delete(v407);
  }
  else
  {
    *v398 = 0.16667;
    v406 = v398 + 1;
  }
  v1130 = v406;
  v416 = v1133;
  v415 = v1134;
  if (v1133 >= v1134)
  {
    v418 = v1132;
    v419 = (v1133 - v1132) >> 2;
    v420 = v419 + 1;
    if ((unint64_t)(v419 + 1) >> 62)
      goto LABEL_1640;
    v421 = v1134 - v1132;
    if ((v1134 - v1132) >> 1 > v420)
      v420 = v421 >> 1;
    if ((unint64_t)v421 >= 0x7FFFFFFFFFFFFFFCLL)
      v39 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v39 = v420;
    if (v39)
    {
      v422 = (char *)sub_1DCAE4D04((uint64_t)&v1134, v39);
      v418 = v1132;
      v416 = v1133;
    }
    else
    {
      v422 = 0;
    }
    v423 = &v422[4 * v419];
    v415 = &v422[4 * v39];
    *(_DWORD *)v423 = 0;
    v417 = v423 + 4;
    while (v416 != v418)
    {
      v424 = *((_DWORD *)v416 - 1);
      v416 -= 4;
      *((_DWORD *)v423 - 1) = v424;
      v423 -= 4;
    }
    v1132 = v423;
    v1133 = v417;
    v1134 = v415;
    if (v418)
    {
      operator delete(v418);
      v415 = v1134;
    }
  }
  else
  {
    *(_DWORD *)v1133 = 0;
    v417 = v416 + 4;
  }
  v1133 = v417;
  if (v417 >= v415)
  {
    v426 = v1132;
    v427 = (v417 - v1132) >> 2;
    v428 = v427 + 1;
    if ((unint64_t)(v427 + 1) >> 62)
      goto LABEL_1640;
    v429 = v415 - v1132;
    if (v429 >> 1 > v428)
      v428 = v429 >> 1;
    if ((unint64_t)v429 >= 0x7FFFFFFFFFFFFFFCLL)
      v39 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v39 = v428;
    if (v39)
    {
      v430 = (char *)sub_1DCAE4D04((uint64_t)&v1134, v39);
      v426 = v1132;
      v417 = v1133;
    }
    else
    {
      v430 = 0;
    }
    v431 = &v430[4 * v427];
    v415 = &v430[4 * v39];
    *(_DWORD *)v431 = v1117.i32[0];
    v425 = v431 + 4;
    while (v417 != v426)
    {
      v432 = *((_DWORD *)v417 - 1);
      v417 -= 4;
      *((_DWORD *)v431 - 1) = v432;
      v431 -= 4;
    }
    v1132 = v431;
    v1133 = v425;
    v1134 = v415;
    if (v426)
    {
      operator delete(v426);
      v415 = v1134;
    }
  }
  else
  {
    *(_DWORD *)v417 = v1117.i32[0];
    v425 = v417 + 4;
  }
  v1133 = v425;
  if (v425 >= v415)
  {
    v434 = v1132;
    v435 = (v425 - v1132) >> 2;
    v436 = v435 + 1;
    if (!((unint64_t)(v435 + 1) >> 62))
    {
      v437 = v415 - v1132;
      if (v437 >> 1 > v436)
        v436 = v437 >> 1;
      if ((unint64_t)v437 >= 0x7FFFFFFFFFFFFFFCLL)
        v39 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v39 = v436;
      if (v39)
      {
        v438 = (char *)sub_1DCAE4D04((uint64_t)&v1134, v39);
        v434 = v1132;
        v425 = v1133;
      }
      else
      {
        v438 = 0;
      }
      v439 = &v438[4 * v435];
      v440 = &v438[4 * v39];
      *(_DWORD *)v439 = 0;
      v433 = v439 + 4;
      while (v425 != v434)
      {
        v441 = *((_DWORD *)v425 - 1);
        v425 -= 4;
        *((_DWORD *)v439 - 1) = v441;
        v439 -= 4;
      }
      v1132 = v439;
      v1133 = v433;
      v1134 = v440;
      if (v434)
        operator delete(v434);
      goto LABEL_673;
    }
LABEL_1640:
    sub_1DCAE4C44();
  }
  *(_DWORD *)v425 = 0;
  v433 = v425 + 4;
LABEL_673:
  v1133 = v433;
LABEL_674:
  v442 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(v1105, (const char *)v39, *(_QWORD *)&v40);
  v443 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v442, v444, (uint64_t)CFSTR("%@-%@"), v443, CFSTR("position"));
  v445 = (void *)objc_claimAutoreleasedReturnValue();
  v446 = objc_alloc(MEMORY[0x1E0C99D50]);
  v448 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v446, v447, (uint64_t)v1135, (char *)v1136 - (char *)v1135, 0);
  objc_msgSend_addAttributeWithName_format_type_data_stride_(v1105, v449, (uint64_t)v445, 786435, CFSTR("position"), v448, 12);

  v450 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(v1105, v451, v452);
  v453 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v450, v454, (uint64_t)CFSTR("%@-%@"), v453, CFSTR("normal"));
  v455 = (void *)objc_claimAutoreleasedReturnValue();
  v456 = objc_alloc(MEMORY[0x1E0C99D50]);
  v458 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v456, v457, (uint64_t)v1132, v1133 - v1132, 0);
  objc_msgSend_addAttributeWithName_format_type_data_stride_(v1105, v459, (uint64_t)v455, 786435, CFSTR("normal"), v458, 12);

  v460 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(v1105, v461, v462);
  v463 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v460, v464, (uint64_t)CFSTR("%@-%@"), v463, CFSTR("textureCoordinate"));
  v465 = (void *)objc_claimAutoreleasedReturnValue();
  v466 = objc_alloc(MEMORY[0x1E0C99D50]);
  v468 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v466, v467, (uint64_t)v1129, (char *)v1130 - (char *)v1129, 0);
  objc_msgSend_addAttributeWithName_format_type_data_stride_(v1105, v469, (uint64_t)v465, 786434, CFSTR("textureCoordinate"), v468, 8);

  if (v1107)
    v470 = v1122;
  else
    v470 = 0;
  v1120 = v470;
  v471 = (v1136 - v1135) / 3uLL;
  v472 = v471 - 2;
  v1116 = v471 - 1;
  v473 = v1122 * (v1112 + 3);
  if (v1103 > 0xFFFE)
  {
    __p = 0;
    v1127 = 0;
    v1128 = 0;
    sub_1DCB01460(&__p, v473);
    if (v1107)
    {
      v538 = 0;
      v539 = v1127;
      while (1)
      {
        v540 = v538 + 1;
        v541 = (v538 + 1) % v1122;
        v542 = v1128;
        if (v1115 == 2)
        {
          if (v539 >= v1128)
          {
            v545 = (char *)__p;
            v546 = (v539 - (_BYTE *)__p) >> 2;
            v547 = v546 + 1;
            if ((unint64_t)(v546 + 1) >> 62)
              goto LABEL_1642;
            v548 = v1128 - (_BYTE *)__p;
            if ((v1128 - (_BYTE *)__p) >> 1 > v547)
              v547 = v548 >> 1;
            if ((unint64_t)v548 >= 0x7FFFFFFFFFFFFFFCLL)
              v536 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v536 = v547;
            if (v536)
            {
              v549 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
              v545 = (char *)__p;
              v539 = v1127;
            }
            else
            {
              v549 = 0;
            }
            v555 = &v549[4 * v546];
            *(_DWORD *)v555 = v472;
            v543 = v555 + 4;
            while (v539 != v545)
            {
              v556 = *((_DWORD *)v539 - 1);
              v539 -= 4;
              *((_DWORD *)v555 - 1) = v556;
              v555 -= 4;
            }
            v542 = &v549[4 * v536];
            __p = v555;
            v1127 = v543;
            v1128 = v542;
            if (v545)
            {
              operator delete(v545);
              v542 = v1128;
            }
          }
          else
          {
            *(_DWORD *)v539 = v472;
            v543 = v539 + 4;
          }
          v1127 = v543;
          if (v543 >= v542)
          {
            v558 = (char *)__p;
            v559 = (v543 - (_BYTE *)__p) >> 2;
            v560 = v559 + 1;
            if ((unint64_t)(v559 + 1) >> 62)
              goto LABEL_1642;
            v561 = v542 - (_BYTE *)__p;
            if (v561 >> 1 > v560)
              v560 = v561 >> 1;
            if ((unint64_t)v561 >= 0x7FFFFFFFFFFFFFFCLL)
              v536 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v536 = v560;
            if (v536)
            {
              v562 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
              v558 = (char *)__p;
              v543 = v1127;
            }
            else
            {
              v562 = 0;
            }
            v571 = (unsigned int *)&v562[4 * v559];
            *v571 = v538;
            v557 = v571 + 1;
            while (v543 != v558)
            {
              v572 = *((_DWORD *)v543 - 1);
              v543 -= 4;
              *--v571 = v572;
            }
            v542 = &v562[4 * v536];
            __p = v571;
            v1127 = (char *)v557;
            v1128 = v542;
            if (v558)
            {
              operator delete(v558);
              v542 = v1128;
            }
          }
          else
          {
            *(_DWORD *)v543 = v538;
            v557 = (unsigned int *)(v543 + 4);
          }
          v1127 = (char *)v557;
          if (v557 >= (unsigned int *)v542)
          {
            v573 = (unsigned int *)__p;
            v574 = ((char *)v557 - (_BYTE *)__p) >> 2;
            v575 = v574 + 1;
            if ((unint64_t)(v574 + 1) >> 62)
              goto LABEL_1642;
            v576 = v542 - (_BYTE *)__p;
            if (v576 >> 1 > v575)
              v575 = v576 >> 1;
            if ((unint64_t)v576 >= 0x7FFFFFFFFFFFFFFCLL)
              v536 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v536 = v575;
            if (v536)
            {
              v577 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
              v573 = (unsigned int *)__p;
              v557 = (unsigned int *)v1127;
            }
            else
            {
              v577 = 0;
            }
            v585 = (unsigned int *)&v577[4 * v574];
            *v585 = v541;
            v539 = (char *)(v585 + 1);
            while (v557 != v573)
            {
              v586 = *--v557;
              *--v585 = v586;
            }
LABEL_909:
            __p = v585;
            v1127 = v539;
            v1128 = &v577[4 * v536];
            if (v573)
              operator delete(v573);
            goto LABEL_911;
          }
        }
        else
        {
          if (v539 >= v1128)
          {
            v550 = (char *)__p;
            v551 = (v539 - (_BYTE *)__p) >> 2;
            v552 = v551 + 1;
            if ((unint64_t)(v551 + 1) >> 62)
              goto LABEL_1642;
            v553 = v1128 - (_BYTE *)__p;
            if ((v1128 - (_BYTE *)__p) >> 1 > v552)
              v552 = v553 >> 1;
            if ((unint64_t)v553 >= 0x7FFFFFFFFFFFFFFCLL)
              v536 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v536 = v552;
            if (v536)
            {
              v554 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
              v550 = (char *)__p;
              v539 = v1127;
            }
            else
            {
              v554 = 0;
            }
            v563 = &v554[4 * v551];
            *(_DWORD *)v563 = v472;
            v544 = v563 + 4;
            while (v539 != v550)
            {
              v564 = *((_DWORD *)v539 - 1);
              v539 -= 4;
              *((_DWORD *)v563 - 1) = v564;
              v563 -= 4;
            }
            v542 = &v554[4 * v536];
            __p = v563;
            v1127 = v544;
            v1128 = v542;
            if (v550)
            {
              operator delete(v550);
              v542 = v1128;
            }
          }
          else
          {
            *(_DWORD *)v539 = v472;
            v544 = v539 + 4;
          }
          v1127 = v544;
          if (v544 >= v542)
          {
            v566 = (char *)__p;
            v567 = (v544 - (_BYTE *)__p) >> 2;
            v568 = v567 + 1;
            if ((unint64_t)(v567 + 1) >> 62)
              goto LABEL_1642;
            v569 = v542 - (_BYTE *)__p;
            if (v569 >> 1 > v568)
              v568 = v569 >> 1;
            if ((unint64_t)v569 >= 0x7FFFFFFFFFFFFFFCLL)
              v536 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v536 = v568;
            if (v536)
            {
              v570 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
              v566 = (char *)__p;
              v544 = v1127;
            }
            else
            {
              v570 = 0;
            }
            v578 = &v570[4 * v567];
            *(_DWORD *)v578 = v538;
            v565 = v578 + 4;
            while (v544 != v566)
            {
              v579 = *((_DWORD *)v544 - 1);
              v544 -= 4;
              *((_DWORD *)v578 - 1) = v579;
              v578 -= 4;
            }
            v542 = &v570[4 * v536];
            __p = v578;
            v1127 = v565;
            v1128 = v542;
            if (v566)
            {
              operator delete(v566);
              v542 = v1128;
            }
          }
          else
          {
            *(_DWORD *)v544 = v538;
            v565 = v544 + 4;
          }
          v1127 = v565;
          if (v565 >= v542)
          {
            v580 = (char *)__p;
            v581 = (v565 - (_BYTE *)__p) >> 2;
            v582 = v581 + 1;
            if ((unint64_t)(v581 + 1) >> 62)
              goto LABEL_1642;
            v583 = v542 - (_BYTE *)__p;
            if (v583 >> 1 > v582)
              v582 = v583 >> 1;
            if ((unint64_t)v583 >= 0x7FFFFFFFFFFFFFFCLL)
              v536 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v536 = v582;
            if (v536)
            {
              v584 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
              v580 = (char *)__p;
              v565 = v1127;
            }
            else
            {
              v584 = 0;
            }
            v587 = (unsigned int *)&v584[4 * v581];
            *v587 = v538;
            v557 = v587 + 1;
            while (v565 != v580)
            {
              v588 = *((_DWORD *)v565 - 1);
              v565 -= 4;
              *--v587 = v588;
            }
            v542 = &v584[4 * v536];
            __p = v587;
            v1127 = (char *)v557;
            v1128 = v542;
            if (v580)
            {
              operator delete(v580);
              v542 = v1128;
            }
          }
          else
          {
            *(_DWORD *)v565 = v538;
            v557 = (unsigned int *)(v565 + 4);
          }
          v1127 = (char *)v557;
          if (v557 >= (unsigned int *)v542)
          {
            v573 = (unsigned int *)__p;
            v589 = ((char *)v557 - (_BYTE *)__p) >> 2;
            v590 = v589 + 1;
            if ((unint64_t)(v589 + 1) >> 62)
LABEL_1642:
              sub_1DCAE4C44();
            v591 = v542 - (_BYTE *)__p;
            if (v591 >> 1 > v590)
              v590 = v591 >> 1;
            if ((unint64_t)v591 >= 0x7FFFFFFFFFFFFFFCLL)
              v536 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v536 = v590;
            if (v536)
            {
              v577 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
              v573 = (unsigned int *)__p;
              v557 = (unsigned int *)v1127;
            }
            else
            {
              v577 = 0;
            }
            v585 = (unsigned int *)&v577[4 * v589];
            *v585 = v541;
            v539 = (char *)(v585 + 1);
            while (v557 != v573)
            {
              v592 = *--v557;
              *--v585 = v592;
            }
            goto LABEL_909;
          }
        }
        *v557 = v541;
        v539 = (char *)(v557 + 1);
LABEL_911:
        v1127 = v539;
        ++v538;
        if (v540 > v1121)
          goto LABEL_1283;
      }
    }
    v539 = v1127;
LABEL_1283:
    v820 = 0;
LABEL_1284:
    v821 = 0;
    v822 = v820 * v1122;
    v1119 = v820 + 1;
    v823 = (v820 + 1) * v1122;
    while (1)
    {
      v824 = v821 + v1120;
      ++v821;
      v825 = v824 + v822;
      v826 = v821 % v1122 + v1120;
      v827 = v826 + v822;
      v828 = v824 + v823;
      v829 = v826 + v823;
      v830 = v1128;
      if (v1115 == 2)
      {
        if (v539 >= v1128)
        {
          v833 = (char *)__p;
          v834 = (v539 - (_BYTE *)__p) >> 2;
          v835 = v834 + 1;
          if ((unint64_t)(v834 + 1) >> 62)
            goto LABEL_1642;
          v836 = v1128 - (_BYTE *)__p;
          if ((v1128 - (_BYTE *)__p) >> 1 > v835)
            v835 = v836 >> 1;
          if ((unint64_t)v836 >= 0x7FFFFFFFFFFFFFFCLL)
            v536 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v536 = v835;
          if (v536)
          {
            v837 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
            v833 = (char *)__p;
            v539 = v1127;
          }
          else
          {
            v837 = 0;
          }
          v843 = &v837[4 * v834];
          *(_DWORD *)v843 = v825;
          v831 = v843 + 4;
          while (v539 != v833)
          {
            v844 = *((_DWORD *)v539 - 1);
            v539 -= 4;
            *((_DWORD *)v843 - 1) = v844;
            v843 -= 4;
          }
          v830 = &v837[4 * v536];
          __p = v843;
          v1127 = v831;
          v1128 = v830;
          if (v833)
          {
            operator delete(v833);
            v830 = v1128;
          }
        }
        else
        {
          *(_DWORD *)v539 = v825;
          v831 = v539 + 4;
        }
        v1127 = v831;
        if (v831 >= v830)
        {
          v846 = (char *)__p;
          v847 = (v831 - (_BYTE *)__p) >> 2;
          v848 = v847 + 1;
          if ((unint64_t)(v847 + 1) >> 62)
            goto LABEL_1642;
          v849 = v830 - (_BYTE *)__p;
          if (v849 >> 1 > v848)
            v848 = v849 >> 1;
          if ((unint64_t)v849 >= 0x7FFFFFFFFFFFFFFCLL)
            v536 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v536 = v848;
          if (v536)
          {
            v850 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
            v846 = (char *)__p;
            v831 = v1127;
          }
          else
          {
            v850 = 0;
          }
          v859 = &v850[4 * v847];
          *(_DWORD *)v859 = v828;
          v845 = v859 + 4;
          while (v831 != v846)
          {
            v860 = *((_DWORD *)v831 - 1);
            v831 -= 4;
            *((_DWORD *)v859 - 1) = v860;
            v859 -= 4;
          }
          v830 = &v850[4 * v536];
          __p = v859;
          v1127 = v845;
          v1128 = v830;
          if (v846)
          {
            operator delete(v846);
            v830 = v1128;
          }
        }
        else
        {
          *(_DWORD *)v831 = v828;
          v845 = v831 + 4;
        }
        v1127 = v845;
        if (v845 >= v830)
        {
          v862 = (char *)__p;
          v863 = (v845 - (_BYTE *)__p) >> 2;
          v864 = v863 + 1;
          if ((unint64_t)(v863 + 1) >> 62)
            goto LABEL_1642;
          v865 = v830 - (_BYTE *)__p;
          if (v865 >> 1 > v864)
            v864 = v865 >> 1;
          if ((unint64_t)v865 >= 0x7FFFFFFFFFFFFFFCLL)
            v536 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v536 = v864;
          if (v536)
          {
            v866 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
            v862 = (char *)__p;
            v845 = v1127;
          }
          else
          {
            v866 = 0;
          }
          v875 = &v866[4 * v863];
          *(_DWORD *)v875 = v829;
          v861 = v875 + 4;
          while (v845 != v862)
          {
            v876 = *((_DWORD *)v845 - 1);
            v845 -= 4;
            *((_DWORD *)v875 - 1) = v876;
            v875 -= 4;
          }
          v830 = &v866[4 * v536];
          __p = v875;
          v1127 = v861;
          v1128 = v830;
          if (v862)
          {
            operator delete(v862);
            v830 = v1128;
          }
        }
        else
        {
          *(_DWORD *)v845 = v829;
          v861 = v845 + 4;
        }
        v1127 = v861;
        if (v861 >= v830)
        {
          v878 = (char *)__p;
          v879 = (v861 - (_BYTE *)__p) >> 2;
          v880 = v879 + 1;
          if ((unint64_t)(v879 + 1) >> 62)
            goto LABEL_1642;
          v881 = v830 - (_BYTE *)__p;
          if (v881 >> 1 > v880)
            v880 = v881 >> 1;
          if ((unint64_t)v881 >= 0x7FFFFFFFFFFFFFFCLL)
            v536 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v536 = v880;
          if (v536)
          {
            v882 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
            v878 = (char *)__p;
            v861 = v1127;
          }
          else
          {
            v882 = 0;
          }
          v891 = &v882[4 * v879];
          *(_DWORD *)v891 = v827;
          v877 = v891 + 4;
          while (v861 != v878)
          {
            v892 = *((_DWORD *)v861 - 1);
            v861 -= 4;
            *((_DWORD *)v891 - 1) = v892;
            v891 -= 4;
          }
          v830 = &v882[4 * v536];
          __p = v891;
          v1127 = v877;
          v1128 = v830;
          if (v878)
          {
            operator delete(v878);
            v830 = v1128;
          }
        }
        else
        {
          *(_DWORD *)v861 = v827;
          v877 = v861 + 4;
        }
        v1127 = v877;
        if (v877 >= v830)
        {
          v894 = (char *)__p;
          v895 = (v877 - (_BYTE *)__p) >> 2;
          v896 = v895 + 1;
          if ((unint64_t)(v895 + 1) >> 62)
            goto LABEL_1642;
          v897 = v830 - (_BYTE *)__p;
          if (v897 >> 1 > v896)
            v896 = v897 >> 1;
          if ((unint64_t)v897 >= 0x7FFFFFFFFFFFFFFCLL)
            v536 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v536 = v896;
          if (v536)
          {
            v898 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
            v894 = (char *)__p;
            v877 = v1127;
          }
          else
          {
            v898 = 0;
          }
          v907 = &v898[4 * v895];
          *(_DWORD *)v907 = v825;
          v893 = v907 + 4;
          while (v877 != v894)
          {
            v908 = *((_DWORD *)v877 - 1);
            v877 -= 4;
            *((_DWORD *)v907 - 1) = v908;
            v907 -= 4;
          }
          v830 = &v898[4 * v536];
          __p = v907;
          v1127 = v893;
          v1128 = v830;
          if (v894)
          {
            operator delete(v894);
            v830 = v1128;
          }
        }
        else
        {
          *(_DWORD *)v877 = v825;
          v893 = v877 + 4;
        }
        v1127 = v893;
        if (v893 >= v830)
        {
          v910 = (char *)__p;
          v911 = (v893 - (_BYTE *)__p) >> 2;
          v912 = v911 + 1;
          if ((unint64_t)(v911 + 1) >> 62)
            goto LABEL_1642;
          v913 = v830 - (_BYTE *)__p;
          if (v913 >> 1 > v912)
            v912 = v913 >> 1;
          if ((unint64_t)v913 >= 0x7FFFFFFFFFFFFFFCLL)
            v536 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v536 = v912;
          if (v536)
          {
            v914 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
            v910 = (char *)__p;
            v893 = v1127;
          }
          else
          {
            v914 = 0;
          }
          v923 = &v914[4 * v911];
          *(_DWORD *)v923 = v829;
          v539 = v923 + 4;
          while (v893 != v910)
          {
            v924 = *((_DWORD *)v893 - 1);
            v893 -= 4;
            *((_DWORD *)v923 - 1) = v924;
            v923 -= 4;
          }
LABEL_1507:
          __p = v923;
          v1127 = v539;
          v1128 = &v914[4 * v536];
          if (v910)
            operator delete(v910);
          goto LABEL_1509;
        }
        *(_DWORD *)v893 = v829;
        v909 = v893 + 4;
      }
      else
      {
        if (v539 >= v1128)
        {
          v838 = (char *)__p;
          v839 = (v539 - (_BYTE *)__p) >> 2;
          v840 = v839 + 1;
          if ((unint64_t)(v839 + 1) >> 62)
            goto LABEL_1642;
          v841 = v1128 - (_BYTE *)__p;
          if ((v1128 - (_BYTE *)__p) >> 1 > v840)
            v840 = v841 >> 1;
          if ((unint64_t)v841 >= 0x7FFFFFFFFFFFFFFCLL)
            v536 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v536 = v840;
          if (v536)
          {
            v842 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
            v838 = (char *)__p;
            v539 = v1127;
          }
          else
          {
            v842 = 0;
          }
          v851 = &v842[4 * v839];
          *(_DWORD *)v851 = v825;
          v832 = v851 + 4;
          while (v539 != v838)
          {
            v852 = *((_DWORD *)v539 - 1);
            v539 -= 4;
            *((_DWORD *)v851 - 1) = v852;
            v851 -= 4;
          }
          v830 = &v842[4 * v536];
          __p = v851;
          v1127 = v832;
          v1128 = v830;
          if (v838)
          {
            operator delete(v838);
            v830 = v1128;
          }
        }
        else
        {
          *(_DWORD *)v539 = v825;
          v832 = v539 + 4;
        }
        v1127 = v832;
        if (v832 >= v830)
        {
          v854 = (char *)__p;
          v855 = (v832 - (_BYTE *)__p) >> 2;
          v856 = v855 + 1;
          if ((unint64_t)(v855 + 1) >> 62)
            goto LABEL_1642;
          v857 = v830 - (_BYTE *)__p;
          if (v857 >> 1 > v856)
            v856 = v857 >> 1;
          if ((unint64_t)v857 >= 0x7FFFFFFFFFFFFFFCLL)
            v536 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v536 = v856;
          if (v536)
          {
            v858 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
            v854 = (char *)__p;
            v832 = v1127;
          }
          else
          {
            v858 = 0;
          }
          v867 = &v858[4 * v855];
          *(_DWORD *)v867 = v827;
          v853 = v867 + 4;
          while (v832 != v854)
          {
            v868 = *((_DWORD *)v832 - 1);
            v832 -= 4;
            *((_DWORD *)v867 - 1) = v868;
            v867 -= 4;
          }
          v830 = &v858[4 * v536];
          __p = v867;
          v1127 = v853;
          v1128 = v830;
          if (v854)
          {
            operator delete(v854);
            v830 = v1128;
          }
        }
        else
        {
          *(_DWORD *)v832 = v827;
          v853 = v832 + 4;
        }
        v1127 = v853;
        if (v853 >= v830)
        {
          v870 = (char *)__p;
          v871 = (v853 - (_BYTE *)__p) >> 2;
          v872 = v871 + 1;
          if ((unint64_t)(v871 + 1) >> 62)
            goto LABEL_1642;
          v873 = v830 - (_BYTE *)__p;
          if (v873 >> 1 > v872)
            v872 = v873 >> 1;
          if ((unint64_t)v873 >= 0x7FFFFFFFFFFFFFFCLL)
            v536 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v536 = v872;
          if (v536)
          {
            v874 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
            v870 = (char *)__p;
            v853 = v1127;
          }
          else
          {
            v874 = 0;
          }
          v883 = &v874[4 * v871];
          *(_DWORD *)v883 = v827;
          v869 = v883 + 4;
          while (v853 != v870)
          {
            v884 = *((_DWORD *)v853 - 1);
            v853 -= 4;
            *((_DWORD *)v883 - 1) = v884;
            v883 -= 4;
          }
          v830 = &v874[4 * v536];
          __p = v883;
          v1127 = v869;
          v1128 = v830;
          if (v870)
          {
            operator delete(v870);
            v830 = v1128;
          }
        }
        else
        {
          *(_DWORD *)v853 = v827;
          v869 = v853 + 4;
        }
        v1127 = v869;
        if (v869 >= v830)
        {
          v886 = (char *)__p;
          v887 = (v869 - (_BYTE *)__p) >> 2;
          v888 = v887 + 1;
          if ((unint64_t)(v887 + 1) >> 62)
            goto LABEL_1642;
          v889 = v830 - (_BYTE *)__p;
          if (v889 >> 1 > v888)
            v888 = v889 >> 1;
          if ((unint64_t)v889 >= 0x7FFFFFFFFFFFFFFCLL)
            v536 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v536 = v888;
          if (v536)
          {
            v890 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
            v886 = (char *)__p;
            v869 = v1127;
          }
          else
          {
            v890 = 0;
          }
          v899 = &v890[4 * v887];
          *(_DWORD *)v899 = v829;
          v885 = v899 + 4;
          while (v869 != v886)
          {
            v900 = *((_DWORD *)v869 - 1);
            v869 -= 4;
            *((_DWORD *)v899 - 1) = v900;
            v899 -= 4;
          }
          v830 = &v890[4 * v536];
          __p = v899;
          v1127 = v885;
          v1128 = v830;
          if (v886)
          {
            operator delete(v886);
            v830 = v1128;
          }
        }
        else
        {
          *(_DWORD *)v869 = v829;
          v885 = v869 + 4;
        }
        v1127 = v885;
        if (v885 >= v830)
        {
          v902 = (char *)__p;
          v903 = (v885 - (_BYTE *)__p) >> 2;
          v904 = v903 + 1;
          if ((unint64_t)(v903 + 1) >> 62)
            goto LABEL_1642;
          v905 = v830 - (_BYTE *)__p;
          if (v905 >> 1 > v904)
            v904 = v905 >> 1;
          if ((unint64_t)v905 >= 0x7FFFFFFFFFFFFFFCLL)
            v536 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v536 = v904;
          if (v536)
          {
            v906 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
            v902 = (char *)__p;
            v885 = v1127;
          }
          else
          {
            v906 = 0;
          }
          v915 = &v906[4 * v903];
          *(_DWORD *)v915 = v829;
          v901 = v915 + 4;
          while (v885 != v902)
          {
            v916 = *((_DWORD *)v885 - 1);
            v885 -= 4;
            *((_DWORD *)v915 - 1) = v916;
            v915 -= 4;
          }
          v830 = &v906[4 * v536];
          __p = v915;
          v1127 = v901;
          v1128 = v830;
          if (v902)
          {
            operator delete(v902);
            v830 = v1128;
          }
        }
        else
        {
          *(_DWORD *)v885 = v829;
          v901 = v885 + 4;
        }
        v1127 = v901;
        if (v901 >= v830)
        {
          v918 = (char *)__p;
          v919 = (v901 - (_BYTE *)__p) >> 2;
          v920 = v919 + 1;
          if ((unint64_t)(v919 + 1) >> 62)
            goto LABEL_1642;
          v921 = v830 - (_BYTE *)__p;
          if (v921 >> 1 > v920)
            v920 = v921 >> 1;
          if ((unint64_t)v921 >= 0x7FFFFFFFFFFFFFFCLL)
            v536 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v536 = v920;
          if (v536)
          {
            v922 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
            v918 = (char *)__p;
            v901 = v1127;
          }
          else
          {
            v922 = 0;
          }
          v925 = &v922[4 * v919];
          *(_DWORD *)v925 = v828;
          v917 = v925 + 4;
          while (v901 != v918)
          {
            v926 = *((_DWORD *)v901 - 1);
            v901 -= 4;
            *((_DWORD *)v925 - 1) = v926;
            v925 -= 4;
          }
          v830 = &v922[4 * v536];
          __p = v925;
          v1127 = v917;
          v1128 = v830;
          if (v918)
          {
            operator delete(v918);
            v830 = v1128;
          }
        }
        else
        {
          *(_DWORD *)v901 = v828;
          v917 = v901 + 4;
        }
        v1127 = v917;
        if (v917 >= v830)
        {
          v928 = (char *)__p;
          v929 = (v917 - (_BYTE *)__p) >> 2;
          v930 = v929 + 1;
          if ((unint64_t)(v929 + 1) >> 62)
            goto LABEL_1642;
          v931 = v830 - (_BYTE *)__p;
          if (v931 >> 1 > v930)
            v930 = v931 >> 1;
          if ((unint64_t)v931 >= 0x7FFFFFFFFFFFFFFCLL)
            v536 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v536 = v930;
          if (v536)
          {
            v932 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
            v928 = (char *)__p;
            v917 = v1127;
          }
          else
          {
            v932 = 0;
          }
          v933 = &v932[4 * v929];
          *(_DWORD *)v933 = v828;
          v927 = v933 + 4;
          while (v917 != v928)
          {
            v934 = *((_DWORD *)v917 - 1);
            v917 -= 4;
            *((_DWORD *)v933 - 1) = v934;
            v933 -= 4;
          }
          v830 = &v932[4 * v536];
          __p = v933;
          v1127 = v927;
          v1128 = v830;
          if (v928)
          {
            operator delete(v928);
            v830 = v1128;
          }
        }
        else
        {
          *(_DWORD *)v917 = v828;
          v927 = v917 + 4;
        }
        v1127 = v927;
        if (v927 >= v830)
        {
          v910 = (char *)__p;
          v935 = (v927 - (_BYTE *)__p) >> 2;
          v936 = v935 + 1;
          if ((unint64_t)(v935 + 1) >> 62)
            goto LABEL_1642;
          v937 = v830 - (_BYTE *)__p;
          if (v937 >> 1 > v936)
            v936 = v937 >> 1;
          if ((unint64_t)v937 >= 0x7FFFFFFFFFFFFFFCLL)
            v536 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v536 = v936;
          if (v536)
          {
            v914 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
            v910 = (char *)__p;
            v927 = v1127;
          }
          else
          {
            v914 = 0;
          }
          v923 = &v914[4 * v935];
          *(_DWORD *)v923 = v825;
          v539 = v923 + 4;
          while (v927 != v910)
          {
            v938 = *((_DWORD *)v927 - 1);
            v927 -= 4;
            *((_DWORD *)v923 - 1) = v938;
            v923 -= 4;
          }
          goto LABEL_1507;
        }
        *(_DWORD *)v927 = v825;
        v909 = v927 + 4;
      }
      v539 = v909;
LABEL_1509:
      v1127 = v539;
      if (v821 > v1121)
      {
        v820 = v1119;
        if (v1119 == v1112)
        {
          if ((v1106 & 1) == 0)
          {
LABEL_1625:
            objc_msgSend_name(v1105, (const char *)v536, v537);
            v789 = (id)objc_claimAutoreleasedReturnValue();
            v790 = v1104;
            if (!v790)
              v790 = objc_alloc_init(MDLMeshBufferDataAllocator);
            v999 = objc_alloc(MEMORY[0x1E0C99D50]);
            v793 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v999, v1000, (uint64_t)__p, v1127 - (_BYTE *)__p, 0);
            v795 = (void *)objc_msgSend_newBufferWithData_type_(v790, v1001, (uint64_t)v793, 2);
            if (objc_msgSend_conformsToProtocol_(v795, v1002, (uint64_t)&unk_1F03B6D88))
            {
              v1003 = v795;
              objc_msgSend_stringByAppendingString_(v789, v1004, (uint64_t)CFSTR("-Indices"));
              v1005 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setName_(v1003, v1006, (uint64_t)v1005);

            }
            v1007 = [MDLMaterial alloc];
            v1008 = (void *)objc_opt_new();
            v804 = (void *)objc_msgSend_initWithName_scatteringFunction_(v1007, v1009, (uint64_t)CFSTR("material"), v1008);

            objc_msgSend_propertyWithSemantic_(v804, v1010, 2);
            v1011 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v1012) = 1063675494;
            objc_msgSend_setFloatValue_(v1011, v1013, v1014, v1012);
            objc_msgSend_propertyWithSemantic_(v804, v1015, 6);
            v1016 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v1017) = 1058642330;
            objc_msgSend_setFloatValue_(v1016, v1018, v1019, v1017);
            objc_msgSend_propertyWithSemantic_(v804, v1020, 0);
            v1021 = (void *)objc_claimAutoreleasedReturnValue();

            v1022 = [MDLSubmesh alloc];
            v819 = (void *)objc_msgSend_initWithIndexBuffer_indexCount_indexType_geometryType_material_(v1022, v1023, (uint64_t)v795, (v1127 - (_BYTE *)__p) >> 2, 32, v1115, v804);

            goto LABEL_1630;
          }
          v939 = 0;
          v940 = v1101 + v1120;
          while (2)
          {
            v941 = v939 + 1;
            v942 = (v939 + 1) % v1122;
            v943 = v1128;
            if (v1115 == 2)
            {
              if (v539 >= v1128)
              {
                v946 = (char *)__p;
                v947 = (v539 - (_BYTE *)__p) >> 2;
                v948 = v947 + 1;
                if ((unint64_t)(v947 + 1) >> 62)
                  goto LABEL_1642;
                v949 = v1128 - (_BYTE *)__p;
                if ((v1128 - (_BYTE *)__p) >> 1 > v948)
                  v948 = v949 >> 1;
                if ((unint64_t)v949 >= 0x7FFFFFFFFFFFFFFCLL)
                  v536 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v536 = v948;
                if (v536)
                {
                  v950 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
                  v946 = (char *)__p;
                  v539 = v1127;
                }
                else
                {
                  v950 = 0;
                }
                v956 = &v950[4 * v947];
                *(_DWORD *)v956 = v1116;
                v944 = v956 + 4;
                while (v539 != v946)
                {
                  v957 = *((_DWORD *)v539 - 1);
                  v539 -= 4;
                  *((_DWORD *)v956 - 1) = v957;
                  v956 -= 4;
                }
                v943 = &v950[4 * v536];
                __p = v956;
                v1127 = v944;
                v1128 = v943;
                if (v946)
                {
                  operator delete(v946);
                  v943 = v1128;
                }
              }
              else
              {
                *(_DWORD *)v539 = v1116;
                v944 = v539 + 4;
              }
              v1127 = v944;
              v958 = v942 + v940;
              if (v944 >= v943)
              {
                v960 = (char *)__p;
                v961 = (v944 - (_BYTE *)__p) >> 2;
                v962 = v961 + 1;
                if ((unint64_t)(v961 + 1) >> 62)
                  goto LABEL_1642;
                v963 = v943 - (_BYTE *)__p;
                if (v963 >> 1 > v962)
                  v962 = v963 >> 1;
                if ((unint64_t)v963 >= 0x7FFFFFFFFFFFFFFCLL)
                  v536 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v536 = v962;
                if (v536)
                {
                  v964 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
                  v960 = (char *)__p;
                  v944 = v1127;
                }
                else
                {
                  v964 = 0;
                }
                v974 = &v964[4 * v961];
                *(_DWORD *)v974 = v958;
                v959 = v974 + 4;
                while (v944 != v960)
                {
                  v975 = *((_DWORD *)v944 - 1);
                  v944 -= 4;
                  *((_DWORD *)v974 - 1) = v975;
                  v974 -= 4;
                }
                v943 = &v964[4 * v536];
                __p = v974;
                v1127 = v959;
                v1128 = v943;
                if (v960)
                {
                  operator delete(v960);
                  v943 = v1128;
                }
              }
              else
              {
                *(_DWORD *)v944 = v958;
                v959 = v944 + 4;
              }
              v1127 = v959;
              v976 = v939 + v940;
              if (v959 < v943)
              {
                *(_DWORD *)v959 = v976;
                v539 = v959 + 4;
                goto LABEL_1624;
              }
              v977 = (char *)__p;
              v978 = (v959 - (_BYTE *)__p) >> 2;
              v979 = v978 + 1;
              if ((unint64_t)(v978 + 1) >> 62)
                goto LABEL_1642;
              v980 = v943 - (_BYTE *)__p;
              if (v980 >> 1 > v979)
                v979 = v980 >> 1;
              if ((unint64_t)v980 >= 0x7FFFFFFFFFFFFFFCLL)
                v536 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v536 = v979;
              if (v536)
              {
                v981 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
                v977 = (char *)__p;
                v959 = v1127;
              }
              else
              {
                v981 = 0;
              }
              v990 = &v981[4 * v978];
              *(_DWORD *)v990 = v976;
              v539 = v990 + 4;
              while (v959 != v977)
              {
                v991 = *((_DWORD *)v959 - 1);
                v959 -= 4;
                *((_DWORD *)v990 - 1) = v991;
                v990 -= 4;
              }
LABEL_1622:
              __p = v990;
              v1127 = v539;
              v1128 = &v981[4 * v536];
              if (v977)
                operator delete(v977);
            }
            else
            {
              if (v539 >= v1128)
              {
                v951 = (char *)__p;
                v952 = (v539 - (_BYTE *)__p) >> 2;
                v953 = v952 + 1;
                if ((unint64_t)(v952 + 1) >> 62)
                  goto LABEL_1642;
                v954 = v1128 - (_BYTE *)__p;
                if ((v1128 - (_BYTE *)__p) >> 1 > v953)
                  v953 = v954 >> 1;
                if ((unint64_t)v954 >= 0x7FFFFFFFFFFFFFFCLL)
                  v536 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v536 = v953;
                if (v536)
                {
                  v955 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
                  v951 = (char *)__p;
                  v539 = v1127;
                }
                else
                {
                  v955 = 0;
                }
                v965 = &v955[4 * v952];
                *(_DWORD *)v965 = v1116;
                v945 = v965 + 4;
                while (v539 != v951)
                {
                  v966 = *((_DWORD *)v539 - 1);
                  v539 -= 4;
                  *((_DWORD *)v965 - 1) = v966;
                  v965 -= 4;
                }
                v943 = &v955[4 * v536];
                __p = v965;
                v1127 = v945;
                v1128 = v943;
                if (v951)
                {
                  operator delete(v951);
                  v943 = v1128;
                }
              }
              else
              {
                *(_DWORD *)v539 = v1116;
                v945 = v539 + 4;
              }
              v1127 = v945;
              v967 = v939 + v940;
              if (v945 >= v943)
              {
                v969 = (char *)__p;
                v970 = (v945 - (_BYTE *)__p) >> 2;
                v971 = v970 + 1;
                if ((unint64_t)(v970 + 1) >> 62)
                  goto LABEL_1642;
                v972 = v943 - (_BYTE *)__p;
                if (v972 >> 1 > v971)
                  v971 = v972 >> 1;
                if ((unint64_t)v972 >= 0x7FFFFFFFFFFFFFFCLL)
                  v536 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v536 = v971;
                if (v536)
                {
                  v973 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
                  v969 = (char *)__p;
                  v945 = v1127;
                }
                else
                {
                  v973 = 0;
                }
                v982 = &v973[4 * v970];
                *(_DWORD *)v982 = v967;
                v968 = v982 + 4;
                while (v945 != v969)
                {
                  v983 = *((_DWORD *)v945 - 1);
                  v945 -= 4;
                  *((_DWORD *)v982 - 1) = v983;
                  v982 -= 4;
                }
                v943 = &v973[4 * v536];
                __p = v982;
                v1127 = v968;
                v1128 = v943;
                if (v969)
                {
                  operator delete(v969);
                  v943 = v1128;
                }
              }
              else
              {
                *(_DWORD *)v945 = v967;
                v968 = v945 + 4;
              }
              v1127 = v968;
              if (v968 >= v943)
              {
                v985 = (char *)__p;
                v986 = (v968 - (_BYTE *)__p) >> 2;
                v987 = v986 + 1;
                if ((unint64_t)(v986 + 1) >> 62)
                  goto LABEL_1642;
                v988 = v943 - (_BYTE *)__p;
                if (v988 >> 1 > v987)
                  v987 = v988 >> 1;
                if ((unint64_t)v988 >= 0x7FFFFFFFFFFFFFFCLL)
                  v536 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v536 = v987;
                if (v536)
                {
                  v989 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
                  v985 = (char *)__p;
                  v968 = v1127;
                }
                else
                {
                  v989 = 0;
                }
                v992 = &v989[4 * v986];
                *(_DWORD *)v992 = v967;
                v984 = v992 + 4;
                while (v968 != v985)
                {
                  v993 = *((_DWORD *)v968 - 1);
                  v968 -= 4;
                  *((_DWORD *)v992 - 1) = v993;
                  v992 -= 4;
                }
                v943 = &v989[4 * v536];
                __p = v992;
                v1127 = v984;
                v1128 = v943;
                if (v985)
                {
                  operator delete(v985);
                  v943 = v1128;
                }
              }
              else
              {
                *(_DWORD *)v968 = v967;
                v984 = v968 + 4;
              }
              v1127 = v984;
              v994 = v942 + v940;
              if (v984 >= v943)
              {
                v977 = (char *)__p;
                v995 = (v984 - (_BYTE *)__p) >> 2;
                v996 = v995 + 1;
                if ((unint64_t)(v995 + 1) >> 62)
                  goto LABEL_1642;
                v997 = v943 - (_BYTE *)__p;
                if (v997 >> 1 > v996)
                  v996 = v997 >> 1;
                if ((unint64_t)v997 >= 0x7FFFFFFFFFFFFFFCLL)
                  v536 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v536 = v996;
                if (v536)
                {
                  v981 = (char *)sub_1DCAE4D04((uint64_t)&v1128, v536);
                  v977 = (char *)__p;
                  v984 = v1127;
                }
                else
                {
                  v981 = 0;
                }
                v990 = &v981[4 * v995];
                *(_DWORD *)v990 = v994;
                v539 = v990 + 4;
                while (v984 != v977)
                {
                  v998 = *((_DWORD *)v984 - 1);
                  v984 -= 4;
                  *((_DWORD *)v990 - 1) = v998;
                  v990 -= 4;
                }
                goto LABEL_1622;
              }
              *(_DWORD *)v984 = v994;
              v539 = v984 + 4;
            }
LABEL_1624:
            v1127 = v539;
            v939 = v941;
            if (v941 > v1121)
              goto LABEL_1625;
            continue;
          }
        }
        goto LABEL_1284;
      }
    }
  }
  __p = 0;
  v1127 = 0;
  v1128 = 0;
  sub_1DCB0DA5C(&__p, v473);
  if (v1107)
  {
    v476 = 0;
    v477 = v1127;
    while (1)
    {
      v478 = v476 + 1;
      v479 = (v476 + 1) % v1122;
      v480 = v1128;
      if (v1115 == 2)
      {
        if (v477 >= v1128)
        {
          v483 = (char *)__p;
          v484 = v477 - (_BYTE *)__p;
          if (v477 - (_BYTE *)__p <= -3)
            goto LABEL_1641;
          v485 = v484 >> 1;
          if (v1128 - (_BYTE *)__p <= (unint64_t)((v484 >> 1) + 1))
            v486 = v485 + 1;
          else
            v486 = v1128 - (_BYTE *)__p;
          if ((unint64_t)(v1128 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v486;
          if (v474)
          {
            v487 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v483 = (char *)__p;
            v477 = v1127;
          }
          else
          {
            v487 = 0;
          }
          v493 = &v487[2 * v485];
          *(_WORD *)v493 = v472;
          v481 = v493 + 2;
          while (v477 != v483)
          {
            v494 = *((_WORD *)v477 - 1);
            v477 -= 2;
            *((_WORD *)v493 - 1) = v494;
            v493 -= 2;
          }
          v480 = &v487[2 * v474];
          __p = v493;
          v1127 = v481;
          v1128 = v480;
          if (v483)
          {
            operator delete(v483);
            v480 = v1128;
          }
        }
        else
        {
          *(_WORD *)v477 = v472;
          v481 = v477 + 2;
        }
        v1127 = v481;
        if (v481 >= v480)
        {
          v496 = (char *)__p;
          v497 = v481 - (_BYTE *)__p;
          if (v481 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v498 = v497 >> 1;
          v499 = v480 - (_BYTE *)__p;
          if (v499 <= (v497 >> 1) + 1)
            v500 = v498 + 1;
          else
            v500 = v499;
          if (v499 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v500;
          if (v474)
          {
            v501 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v496 = (char *)__p;
            v481 = v1127;
          }
          else
          {
            v501 = 0;
          }
          v511 = &v501[2 * v498];
          *(_WORD *)v511 = v476;
          v495 = v511 + 2;
          while (v481 != v496)
          {
            v512 = *((_WORD *)v481 - 1);
            v481 -= 2;
            *((_WORD *)v511 - 1) = v512;
            v511 -= 2;
          }
          v480 = &v501[2 * v474];
          __p = v511;
          v1127 = v495;
          v1128 = v480;
          if (v496)
          {
            operator delete(v496);
            v480 = v1128;
          }
        }
        else
        {
          *(_WORD *)v481 = v476;
          v495 = v481 + 2;
        }
        v1127 = v495;
        if (v495 >= v480)
        {
          v513 = (char *)__p;
          v514 = v495 - (_BYTE *)__p;
          if (v495 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v515 = v514 >> 1;
          v516 = v480 - (_BYTE *)__p;
          if (v516 <= (v514 >> 1) + 1)
            v517 = v515 + 1;
          else
            v517 = v516;
          if (v516 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v517;
          if (v474)
          {
            v518 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v513 = (char *)__p;
            v495 = v1127;
          }
          else
          {
            v518 = 0;
          }
          v527 = &v518[2 * v515];
          *(_WORD *)v527 = v479;
          v477 = v527 + 2;
          while (v495 != v513)
          {
            v528 = *((_WORD *)v495 - 1);
            v495 -= 2;
            *((_WORD *)v527 - 1) = v528;
            v527 -= 2;
          }
LABEL_795:
          __p = v527;
          v1127 = v477;
          v1128 = &v518[2 * v474];
          if (v513)
            operator delete(v513);
          goto LABEL_797;
        }
      }
      else
      {
        if (v477 >= v1128)
        {
          v488 = (char *)__p;
          v489 = v477 - (_BYTE *)__p;
          if (v477 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v490 = v489 >> 1;
          if (v1128 - (_BYTE *)__p <= (unint64_t)((v489 >> 1) + 1))
            v491 = v490 + 1;
          else
            v491 = v1128 - (_BYTE *)__p;
          if ((unint64_t)(v1128 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v491;
          if (v474)
          {
            v492 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v488 = (char *)__p;
            v477 = v1127;
          }
          else
          {
            v492 = 0;
          }
          v502 = &v492[2 * v490];
          *(_WORD *)v502 = v472;
          v482 = v502 + 2;
          while (v477 != v488)
          {
            v503 = *((_WORD *)v477 - 1);
            v477 -= 2;
            *((_WORD *)v502 - 1) = v503;
            v502 -= 2;
          }
          v480 = &v492[2 * v474];
          __p = v502;
          v1127 = v482;
          v1128 = v480;
          if (v488)
          {
            operator delete(v488);
            v480 = v1128;
          }
        }
        else
        {
          *(_WORD *)v477 = v472;
          v482 = v477 + 2;
        }
        v1127 = v482;
        if (v482 >= v480)
        {
          v505 = (char *)__p;
          v506 = v482 - (_BYTE *)__p;
          if (v482 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v507 = v506 >> 1;
          v508 = v480 - (_BYTE *)__p;
          if (v508 <= (v506 >> 1) + 1)
            v509 = v507 + 1;
          else
            v509 = v508;
          if (v508 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v509;
          if (v474)
          {
            v510 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v505 = (char *)__p;
            v482 = v1127;
          }
          else
          {
            v510 = 0;
          }
          v519 = &v510[2 * v507];
          *(_WORD *)v519 = v476;
          v504 = v519 + 2;
          while (v482 != v505)
          {
            v520 = *((_WORD *)v482 - 1);
            v482 -= 2;
            *((_WORD *)v519 - 1) = v520;
            v519 -= 2;
          }
          v480 = &v510[2 * v474];
          __p = v519;
          v1127 = v504;
          v1128 = v480;
          if (v505)
          {
            operator delete(v505);
            v480 = v1128;
          }
        }
        else
        {
          *(_WORD *)v482 = v476;
          v504 = v482 + 2;
        }
        v1127 = v504;
        if (v504 >= v480)
        {
          v521 = (char *)__p;
          v522 = v504 - (_BYTE *)__p;
          if (v504 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v523 = v522 >> 1;
          v524 = v480 - (_BYTE *)__p;
          if (v524 <= (v522 >> 1) + 1)
            v525 = v523 + 1;
          else
            v525 = v524;
          if (v524 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v525;
          if (v474)
          {
            v526 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v521 = (char *)__p;
            v504 = v1127;
          }
          else
          {
            v526 = 0;
          }
          v529 = &v526[2 * v523];
          *(_WORD *)v529 = v476;
          v495 = v529 + 2;
          while (v504 != v521)
          {
            v530 = *((_WORD *)v504 - 1);
            v504 -= 2;
            *((_WORD *)v529 - 1) = v530;
            v529 -= 2;
          }
          v480 = &v526[2 * v474];
          __p = v529;
          v1127 = v495;
          v1128 = v480;
          if (v521)
          {
            operator delete(v521);
            v480 = v1128;
          }
        }
        else
        {
          *(_WORD *)v504 = v476;
          v495 = v504 + 2;
        }
        v1127 = v495;
        if (v495 >= v480)
        {
          v513 = (char *)__p;
          v531 = v495 - (_BYTE *)__p;
          if (v495 - (_BYTE *)__p < -2)
LABEL_1641:
            sub_1DCAE4C44();
          v532 = v531 >> 1;
          v533 = v480 - (_BYTE *)__p;
          if (v533 <= (v531 >> 1) + 1)
            v534 = v532 + 1;
          else
            v534 = v533;
          if (v533 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v534;
          if (v474)
          {
            v518 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v513 = (char *)__p;
            v495 = v1127;
          }
          else
          {
            v518 = 0;
          }
          v527 = &v518[2 * v532];
          *(_WORD *)v527 = v479;
          v477 = v527 + 2;
          while (v495 != v513)
          {
            v535 = *((_WORD *)v495 - 1);
            v495 -= 2;
            *((_WORD *)v527 - 1) = v535;
            v527 -= 2;
          }
          goto LABEL_795;
        }
      }
      *(_WORD *)v495 = v479;
      v477 = v495 + 2;
LABEL_797:
      v1127 = v477;
      ++v476;
      if (v478 > v1121)
        goto LABEL_914;
    }
  }
  v477 = v1127;
LABEL_914:
  v593 = 0;
  do
  {
    v594 = 0;
    v595 = v593 * v1122;
    v1118 = v593 + 1;
    v596 = (v593 + 1) * v1122;
    do
    {
      v597 = v594++ + v1120;
      v598 = v597 + v595;
      v599 = v594 % v1122 + v1120;
      v600 = v599 + v595;
      v601 = v597 + v596;
      v602 = v599 + v596;
      v603 = v1128;
      if (v1115 == 2)
      {
        if (v477 >= v1128)
        {
          v606 = (char *)__p;
          v607 = v477 - (_BYTE *)__p;
          if (v477 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v608 = v607 >> 1;
          if (v1128 - (_BYTE *)__p <= (unint64_t)((v607 >> 1) + 1))
            v609 = v608 + 1;
          else
            v609 = v1128 - (_BYTE *)__p;
          if ((unint64_t)(v1128 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v609;
          if (v474)
          {
            v610 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v606 = (char *)__p;
            v477 = v1127;
          }
          else
          {
            v610 = 0;
          }
          v616 = &v610[2 * v608];
          *(_WORD *)v616 = v598;
          v604 = v616 + 2;
          while (v477 != v606)
          {
            v617 = *((_WORD *)v477 - 1);
            v477 -= 2;
            *((_WORD *)v616 - 1) = v617;
            v616 -= 2;
          }
          v603 = &v610[2 * v474];
          __p = v616;
          v1127 = v604;
          v1128 = v603;
          if (v606)
          {
            operator delete(v606);
            v603 = v1128;
          }
        }
        else
        {
          *(_WORD *)v477 = v598;
          v604 = v477 + 2;
        }
        v1127 = v604;
        if (v604 >= v603)
        {
          v619 = (char *)__p;
          v620 = v604 - (_BYTE *)__p;
          if (v604 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v621 = v620 >> 1;
          v622 = v603 - (_BYTE *)__p;
          if (v622 <= (v620 >> 1) + 1)
            v623 = v621 + 1;
          else
            v623 = v622;
          if (v622 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v623;
          if (v474)
          {
            v624 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v619 = (char *)__p;
            v604 = v1127;
          }
          else
          {
            v624 = 0;
          }
          v634 = &v624[2 * v621];
          *(_WORD *)v634 = v601;
          v618 = v634 + 2;
          while (v604 != v619)
          {
            v635 = *((_WORD *)v604 - 1);
            v604 -= 2;
            *((_WORD *)v634 - 1) = v635;
            v634 -= 2;
          }
          v603 = &v624[2 * v474];
          __p = v634;
          v1127 = v618;
          v1128 = v603;
          if (v619)
          {
            operator delete(v619);
            v603 = v1128;
          }
        }
        else
        {
          *(_WORD *)v604 = v601;
          v618 = v604 + 2;
        }
        v1127 = v618;
        if (v618 >= v603)
        {
          v637 = (char *)__p;
          v638 = v618 - (_BYTE *)__p;
          if (v618 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v639 = v638 >> 1;
          v640 = v603 - (_BYTE *)__p;
          if (v640 <= (v638 >> 1) + 1)
            v641 = v639 + 1;
          else
            v641 = v640;
          if (v640 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v641;
          if (v474)
          {
            v642 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v637 = (char *)__p;
            v618 = v1127;
          }
          else
          {
            v642 = 0;
          }
          v652 = &v642[2 * v639];
          *(_WORD *)v652 = v602;
          v636 = v652 + 2;
          while (v618 != v637)
          {
            v653 = *((_WORD *)v618 - 1);
            v618 -= 2;
            *((_WORD *)v652 - 1) = v653;
            v652 -= 2;
          }
          v603 = &v642[2 * v474];
          __p = v652;
          v1127 = v636;
          v1128 = v603;
          if (v637)
          {
            operator delete(v637);
            v603 = v1128;
          }
        }
        else
        {
          *(_WORD *)v618 = v602;
          v636 = v618 + 2;
        }
        v1127 = v636;
        if (v636 >= v603)
        {
          v655 = (char *)__p;
          v656 = v636 - (_BYTE *)__p;
          if (v636 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v657 = v656 >> 1;
          v658 = v603 - (_BYTE *)__p;
          if (v658 <= (v656 >> 1) + 1)
            v659 = v657 + 1;
          else
            v659 = v658;
          if (v658 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v659;
          if (v474)
          {
            v660 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v655 = (char *)__p;
            v636 = v1127;
          }
          else
          {
            v660 = 0;
          }
          v670 = &v660[2 * v657];
          *(_WORD *)v670 = v600;
          v654 = v670 + 2;
          while (v636 != v655)
          {
            v671 = *((_WORD *)v636 - 1);
            v636 -= 2;
            *((_WORD *)v670 - 1) = v671;
            v670 -= 2;
          }
          v603 = &v660[2 * v474];
          __p = v670;
          v1127 = v654;
          v1128 = v603;
          if (v655)
          {
            operator delete(v655);
            v603 = v1128;
          }
        }
        else
        {
          *(_WORD *)v636 = v600;
          v654 = v636 + 2;
        }
        v1127 = v654;
        if (v654 >= v603)
        {
          v673 = (char *)__p;
          v674 = v654 - (_BYTE *)__p;
          if (v654 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v675 = v674 >> 1;
          v676 = v603 - (_BYTE *)__p;
          if (v676 <= (v674 >> 1) + 1)
            v677 = v675 + 1;
          else
            v677 = v676;
          if (v676 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v677;
          if (v474)
          {
            v678 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v673 = (char *)__p;
            v654 = v1127;
          }
          else
          {
            v678 = 0;
          }
          v688 = &v678[2 * v675];
          *(_WORD *)v688 = v598;
          v672 = v688 + 2;
          while (v654 != v673)
          {
            v689 = *((_WORD *)v654 - 1);
            v654 -= 2;
            *((_WORD *)v688 - 1) = v689;
            v688 -= 2;
          }
          v603 = &v678[2 * v474];
          __p = v688;
          v1127 = v672;
          v1128 = v603;
          if (v673)
          {
            operator delete(v673);
            v603 = v1128;
          }
        }
        else
        {
          *(_WORD *)v654 = v598;
          v672 = v654 + 2;
        }
        v1127 = v672;
        if (v672 < v603)
        {
          *(_WORD *)v672 = v602;
          v690 = v672 + 2;
LABEL_1138:
          v477 = v690;
          goto LABEL_1154;
        }
        v691 = (char *)__p;
        v692 = v672 - (_BYTE *)__p;
        if (v672 - (_BYTE *)__p < -2)
          goto LABEL_1641;
        v693 = v692 >> 1;
        v694 = v603 - (_BYTE *)__p;
        if (v694 <= (v692 >> 1) + 1)
          v695 = v693 + 1;
        else
          v695 = v694;
        if (v694 >= 0x7FFFFFFFFFFFFFFELL)
          v474 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v474 = v695;
        if (v474)
        {
          v696 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
          v691 = (char *)__p;
          v672 = v1127;
        }
        else
        {
          v696 = 0;
        }
        v706 = &v696[2 * v693];
        *(_WORD *)v706 = v602;
        v477 = v706 + 2;
        while (v672 != v691)
        {
          v707 = *((_WORD *)v672 - 1);
          v672 -= 2;
          *((_WORD *)v706 - 1) = v707;
          v706 -= 2;
        }
      }
      else
      {
        if (v477 >= v1128)
        {
          v611 = (char *)__p;
          v612 = v477 - (_BYTE *)__p;
          if (v477 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v613 = v612 >> 1;
          if (v1128 - (_BYTE *)__p <= (unint64_t)((v612 >> 1) + 1))
            v614 = v613 + 1;
          else
            v614 = v1128 - (_BYTE *)__p;
          if ((unint64_t)(v1128 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v614;
          if (v474)
          {
            v615 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v611 = (char *)__p;
            v477 = v1127;
          }
          else
          {
            v615 = 0;
          }
          v625 = &v615[2 * v613];
          *(_WORD *)v625 = v598;
          v605 = v625 + 2;
          while (v477 != v611)
          {
            v626 = *((_WORD *)v477 - 1);
            v477 -= 2;
            *((_WORD *)v625 - 1) = v626;
            v625 -= 2;
          }
          v603 = &v615[2 * v474];
          __p = v625;
          v1127 = v605;
          v1128 = v603;
          if (v611)
          {
            operator delete(v611);
            v603 = v1128;
          }
        }
        else
        {
          *(_WORD *)v477 = v598;
          v605 = v477 + 2;
        }
        v1127 = v605;
        if (v605 >= v603)
        {
          v628 = (char *)__p;
          v629 = v605 - (_BYTE *)__p;
          if (v605 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v630 = v629 >> 1;
          v631 = v603 - (_BYTE *)__p;
          if (v631 <= (v629 >> 1) + 1)
            v632 = v630 + 1;
          else
            v632 = v631;
          if (v631 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v632;
          if (v474)
          {
            v633 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v628 = (char *)__p;
            v605 = v1127;
          }
          else
          {
            v633 = 0;
          }
          v643 = &v633[2 * v630];
          *(_WORD *)v643 = v600;
          v627 = v643 + 2;
          while (v605 != v628)
          {
            v644 = *((_WORD *)v605 - 1);
            v605 -= 2;
            *((_WORD *)v643 - 1) = v644;
            v643 -= 2;
          }
          v603 = &v633[2 * v474];
          __p = v643;
          v1127 = v627;
          v1128 = v603;
          if (v628)
          {
            operator delete(v628);
            v603 = v1128;
          }
        }
        else
        {
          *(_WORD *)v605 = v600;
          v627 = v605 + 2;
        }
        v1127 = v627;
        if (v627 >= v603)
        {
          v646 = (char *)__p;
          v647 = v627 - (_BYTE *)__p;
          if (v627 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v648 = v647 >> 1;
          v649 = v603 - (_BYTE *)__p;
          if (v649 <= (v647 >> 1) + 1)
            v650 = v648 + 1;
          else
            v650 = v649;
          if (v649 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v650;
          if (v474)
          {
            v651 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v646 = (char *)__p;
            v627 = v1127;
          }
          else
          {
            v651 = 0;
          }
          v661 = &v651[2 * v648];
          *(_WORD *)v661 = v600;
          v645 = v661 + 2;
          while (v627 != v646)
          {
            v662 = *((_WORD *)v627 - 1);
            v627 -= 2;
            *((_WORD *)v661 - 1) = v662;
            v661 -= 2;
          }
          v603 = &v651[2 * v474];
          __p = v661;
          v1127 = v645;
          v1128 = v603;
          if (v646)
          {
            operator delete(v646);
            v603 = v1128;
          }
        }
        else
        {
          *(_WORD *)v627 = v600;
          v645 = v627 + 2;
        }
        v1127 = v645;
        if (v645 >= v603)
        {
          v664 = (char *)__p;
          v665 = v645 - (_BYTE *)__p;
          if (v645 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v666 = v665 >> 1;
          v667 = v603 - (_BYTE *)__p;
          if (v667 <= (v665 >> 1) + 1)
            v668 = v666 + 1;
          else
            v668 = v667;
          if (v667 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v668;
          if (v474)
          {
            v669 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v664 = (char *)__p;
            v645 = v1127;
          }
          else
          {
            v669 = 0;
          }
          v679 = &v669[2 * v666];
          *(_WORD *)v679 = v602;
          v663 = v679 + 2;
          while (v645 != v664)
          {
            v680 = *((_WORD *)v645 - 1);
            v645 -= 2;
            *((_WORD *)v679 - 1) = v680;
            v679 -= 2;
          }
          v603 = &v669[2 * v474];
          __p = v679;
          v1127 = v663;
          v1128 = v603;
          if (v664)
          {
            operator delete(v664);
            v603 = v1128;
          }
        }
        else
        {
          *(_WORD *)v645 = v602;
          v663 = v645 + 2;
        }
        v1127 = v663;
        if (v663 >= v603)
        {
          v682 = (char *)__p;
          v683 = v663 - (_BYTE *)__p;
          if (v663 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v684 = v683 >> 1;
          v685 = v603 - (_BYTE *)__p;
          if (v685 <= (v683 >> 1) + 1)
            v686 = v684 + 1;
          else
            v686 = v685;
          if (v685 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v686;
          if (v474)
          {
            v687 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v682 = (char *)__p;
            v663 = v1127;
          }
          else
          {
            v687 = 0;
          }
          v697 = &v687[2 * v684];
          *(_WORD *)v697 = v602;
          v681 = v697 + 2;
          while (v663 != v682)
          {
            v698 = *((_WORD *)v663 - 1);
            v663 -= 2;
            *((_WORD *)v697 - 1) = v698;
            v697 -= 2;
          }
          v603 = &v687[2 * v474];
          __p = v697;
          v1127 = v681;
          v1128 = v603;
          if (v682)
          {
            operator delete(v682);
            v603 = v1128;
          }
        }
        else
        {
          *(_WORD *)v663 = v602;
          v681 = v663 + 2;
        }
        v1127 = v681;
        if (v681 >= v603)
        {
          v700 = (char *)__p;
          v701 = v681 - (_BYTE *)__p;
          if (v681 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v702 = v701 >> 1;
          v703 = v603 - (_BYTE *)__p;
          if (v703 <= (v701 >> 1) + 1)
            v704 = v702 + 1;
          else
            v704 = v703;
          if (v703 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v704;
          if (v474)
          {
            v705 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v700 = (char *)__p;
            v681 = v1127;
          }
          else
          {
            v705 = 0;
          }
          v708 = &v705[2 * v702];
          *(_WORD *)v708 = v601;
          v699 = v708 + 2;
          while (v681 != v700)
          {
            v709 = *((_WORD *)v681 - 1);
            v681 -= 2;
            *((_WORD *)v708 - 1) = v709;
            v708 -= 2;
          }
          v603 = &v705[2 * v474];
          __p = v708;
          v1127 = v699;
          v1128 = v603;
          if (v700)
          {
            operator delete(v700);
            v603 = v1128;
          }
        }
        else
        {
          *(_WORD *)v681 = v601;
          v699 = v681 + 2;
        }
        v1127 = v699;
        if (v699 >= v603)
        {
          v711 = (char *)__p;
          v712 = v699 - (_BYTE *)__p;
          if (v699 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v713 = v712 >> 1;
          v714 = v603 - (_BYTE *)__p;
          if (v714 <= (v712 >> 1) + 1)
            v715 = v713 + 1;
          else
            v715 = v714;
          if (v714 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v715;
          if (v474)
          {
            v716 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v711 = (char *)__p;
            v699 = v1127;
          }
          else
          {
            v716 = 0;
          }
          v717 = &v716[2 * v713];
          *(_WORD *)v717 = v601;
          v710 = v717 + 2;
          while (v699 != v711)
          {
            v718 = *((_WORD *)v699 - 1);
            v699 -= 2;
            *((_WORD *)v717 - 1) = v718;
            v717 -= 2;
          }
          v603 = &v716[2 * v474];
          __p = v717;
          v1127 = v710;
          v1128 = v603;
          if (v711)
          {
            operator delete(v711);
            v603 = v1128;
          }
        }
        else
        {
          *(_WORD *)v699 = v601;
          v710 = v699 + 2;
        }
        v1127 = v710;
        if (v710 < v603)
        {
          *(_WORD *)v710 = v598;
          v690 = v710 + 2;
          goto LABEL_1138;
        }
        v691 = (char *)__p;
        v719 = v710 - (_BYTE *)__p;
        if (v710 - (_BYTE *)__p < -2)
          goto LABEL_1641;
        v720 = v719 >> 1;
        v721 = v603 - (_BYTE *)__p;
        if (v721 <= (v719 >> 1) + 1)
          v722 = v720 + 1;
        else
          v722 = v721;
        if (v721 >= 0x7FFFFFFFFFFFFFFELL)
          v474 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v474 = v722;
        if (v474)
        {
          v696 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
          v691 = (char *)__p;
          v710 = v1127;
        }
        else
        {
          v696 = 0;
        }
        v706 = &v696[2 * v720];
        *(_WORD *)v706 = v598;
        v477 = v706 + 2;
        while (v710 != v691)
        {
          v723 = *((_WORD *)v710 - 1);
          v710 -= 2;
          *((_WORD *)v706 - 1) = v723;
          v706 -= 2;
        }
      }
      __p = v706;
      v1127 = v477;
      v1128 = &v696[2 * v474];
      if (v691)
        operator delete(v691);
LABEL_1154:
      v1127 = v477;
    }
    while (v594 <= v1121);
    v593 = v1118;
  }
  while (v1118 != v1112);
  if ((v1106 & 1) != 0)
  {
    v724 = 0;
    v725 = v1101 + v1120;
    do
    {
      v726 = v724 + 1;
      v727 = (v724 + 1) % v1122;
      v728 = v1128;
      if (v1115 == 2)
      {
        if (v477 >= v1128)
        {
          v731 = (char *)__p;
          v732 = v477 - (_BYTE *)__p;
          if (v477 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v733 = v732 >> 1;
          if (v1128 - (_BYTE *)__p <= (unint64_t)((v732 >> 1) + 1))
            v734 = v733 + 1;
          else
            v734 = v1128 - (_BYTE *)__p;
          if ((unint64_t)(v1128 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v734;
          if (v474)
          {
            v735 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v731 = (char *)__p;
            v477 = v1127;
          }
          else
          {
            v735 = 0;
          }
          v741 = &v735[2 * v733];
          *(_WORD *)v741 = v1116;
          v729 = v741 + 2;
          while (v477 != v731)
          {
            v742 = *((_WORD *)v477 - 1);
            v477 -= 2;
            *((_WORD *)v741 - 1) = v742;
            v741 -= 2;
          }
          v728 = &v735[2 * v474];
          __p = v741;
          v1127 = v729;
          v1128 = v728;
          if (v731)
          {
            operator delete(v731);
            v728 = v1128;
          }
        }
        else
        {
          *(_WORD *)v477 = v1116;
          v729 = v477 + 2;
        }
        v1127 = v729;
        v743 = v727 + v725;
        if (v729 >= v728)
        {
          v745 = (char *)__p;
          v746 = v729 - (_BYTE *)__p;
          if (v729 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v747 = v746 >> 1;
          v748 = v728 - (_BYTE *)__p;
          if (v748 <= (v746 >> 1) + 1)
            v749 = v747 + 1;
          else
            v749 = v748;
          if (v748 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v749;
          if (v474)
          {
            v750 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v745 = (char *)__p;
            v729 = v1127;
          }
          else
          {
            v750 = 0;
          }
          v761 = &v750[2 * v747];
          *(_WORD *)v761 = v743;
          v744 = v761 + 2;
          while (v729 != v745)
          {
            v762 = *((_WORD *)v729 - 1);
            v729 -= 2;
            *((_WORD *)v761 - 1) = v762;
            v761 -= 2;
          }
          v728 = &v750[2 * v474];
          __p = v761;
          v1127 = v744;
          v1128 = v728;
          if (v745)
          {
            operator delete(v745);
            v728 = v1128;
          }
        }
        else
        {
          *(_WORD *)v729 = v743;
          v744 = v729 + 2;
        }
        v1127 = v744;
        v763 = v724 + v725;
        if (v744 >= v728)
        {
          v764 = (char *)__p;
          v765 = v744 - (_BYTE *)__p;
          if (v744 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v766 = v765 >> 1;
          v767 = v728 - (_BYTE *)__p;
          if (v767 <= (v765 >> 1) + 1)
            v768 = v766 + 1;
          else
            v768 = v767;
          if (v767 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v768;
          if (v474)
          {
            v769 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v764 = (char *)__p;
            v744 = v1127;
          }
          else
          {
            v769 = 0;
          }
          v779 = &v769[2 * v766];
          *(_WORD *)v779 = v763;
          v477 = v779 + 2;
          while (v744 != v764)
          {
            v780 = *((_WORD *)v744 - 1);
            v744 -= 2;
            *((_WORD *)v779 - 1) = v780;
            v779 -= 2;
          }
LABEL_1274:
          __p = v779;
          v1127 = v477;
          v1128 = &v769[2 * v474];
          if (v764)
            operator delete(v764);
          goto LABEL_1276;
        }
        *(_WORD *)v744 = v763;
        v477 = v744 + 2;
      }
      else
      {
        if (v477 >= v1128)
        {
          v736 = (char *)__p;
          v737 = v477 - (_BYTE *)__p;
          if (v477 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v738 = v737 >> 1;
          if (v1128 - (_BYTE *)__p <= (unint64_t)((v737 >> 1) + 1))
            v739 = v738 + 1;
          else
            v739 = v1128 - (_BYTE *)__p;
          if ((unint64_t)(v1128 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v739;
          if (v474)
          {
            v740 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v736 = (char *)__p;
            v477 = v1127;
          }
          else
          {
            v740 = 0;
          }
          v751 = &v740[2 * v738];
          *(_WORD *)v751 = v1116;
          v730 = v751 + 2;
          while (v477 != v736)
          {
            v752 = *((_WORD *)v477 - 1);
            v477 -= 2;
            *((_WORD *)v751 - 1) = v752;
            v751 -= 2;
          }
          v728 = &v740[2 * v474];
          __p = v751;
          v1127 = v730;
          v1128 = v728;
          if (v736)
          {
            operator delete(v736);
            v728 = v1128;
          }
        }
        else
        {
          *(_WORD *)v477 = v1116;
          v730 = v477 + 2;
        }
        v1127 = v730;
        v753 = v724 + v725;
        if (v730 >= v728)
        {
          v755 = (char *)__p;
          v756 = v730 - (_BYTE *)__p;
          if (v730 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v757 = v756 >> 1;
          v758 = v728 - (_BYTE *)__p;
          if (v758 <= (v756 >> 1) + 1)
            v759 = v757 + 1;
          else
            v759 = v758;
          if (v758 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v759;
          if (v474)
          {
            v760 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v755 = (char *)__p;
            v730 = v1127;
          }
          else
          {
            v760 = 0;
          }
          v770 = &v760[2 * v757];
          *(_WORD *)v770 = v753;
          v754 = v770 + 2;
          while (v730 != v755)
          {
            v771 = *((_WORD *)v730 - 1);
            v730 -= 2;
            *((_WORD *)v770 - 1) = v771;
            v770 -= 2;
          }
          v728 = &v760[2 * v474];
          __p = v770;
          v1127 = v754;
          v1128 = v728;
          if (v755)
          {
            operator delete(v755);
            v728 = v1128;
          }
        }
        else
        {
          *(_WORD *)v730 = v753;
          v754 = v730 + 2;
        }
        v1127 = v754;
        if (v754 >= v728)
        {
          v773 = (char *)__p;
          v774 = v754 - (_BYTE *)__p;
          if (v754 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v775 = v774 >> 1;
          v776 = v728 - (_BYTE *)__p;
          if (v776 <= (v774 >> 1) + 1)
            v777 = v775 + 1;
          else
            v777 = v776;
          if (v776 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v777;
          if (v474)
          {
            v778 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v773 = (char *)__p;
            v754 = v1127;
          }
          else
          {
            v778 = 0;
          }
          v781 = &v778[2 * v775];
          *(_WORD *)v781 = v753;
          v772 = v781 + 2;
          while (v754 != v773)
          {
            v782 = *((_WORD *)v754 - 1);
            v754 -= 2;
            *((_WORD *)v781 - 1) = v782;
            v781 -= 2;
          }
          v728 = &v778[2 * v474];
          __p = v781;
          v1127 = v772;
          v1128 = v728;
          if (v773)
          {
            operator delete(v773);
            v728 = v1128;
          }
        }
        else
        {
          *(_WORD *)v754 = v753;
          v772 = v754 + 2;
        }
        v1127 = v772;
        v783 = v727 + v725;
        if (v772 >= v728)
        {
          v764 = (char *)__p;
          v784 = v772 - (_BYTE *)__p;
          if (v772 - (_BYTE *)__p < -2)
            goto LABEL_1641;
          v785 = v784 >> 1;
          v786 = v728 - (_BYTE *)__p;
          if (v786 <= (v784 >> 1) + 1)
            v787 = v785 + 1;
          else
            v787 = v786;
          if (v786 >= 0x7FFFFFFFFFFFFFFELL)
            v474 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v474 = v787;
          if (v474)
          {
            v769 = (char *)sub_1DCB0DAEC((uint64_t)&v1128, v474);
            v764 = (char *)__p;
            v772 = v1127;
          }
          else
          {
            v769 = 0;
          }
          v779 = &v769[2 * v785];
          *(_WORD *)v779 = v783;
          v477 = v779 + 2;
          while (v772 != v764)
          {
            v788 = *((_WORD *)v772 - 1);
            v772 -= 2;
            *((_WORD *)v779 - 1) = v788;
            v779 -= 2;
          }
          goto LABEL_1274;
        }
        *(_WORD *)v772 = v783;
        v477 = v772 + 2;
      }
LABEL_1276:
      v1127 = v477;
      v724 = v726;
    }
    while (v726 <= v1121);
  }
  objc_msgSend_name(v1105, (const char *)v474, v475);
  v789 = (id)objc_claimAutoreleasedReturnValue();
  v790 = v1104;
  if (!v790)
    v790 = objc_alloc_init(MDLMeshBufferDataAllocator);
  v791 = objc_alloc(MEMORY[0x1E0C99D50]);
  v793 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v791, v792, (uint64_t)__p, v1127 - (_BYTE *)__p, 0);
  v795 = (void *)objc_msgSend_newBufferWithData_type_(v790, v794, (uint64_t)v793, 2);
  if (objc_msgSend_conformsToProtocol_(v795, v796, (uint64_t)&unk_1F03B6D88))
  {
    v797 = v795;
    objc_msgSend_stringByAppendingString_(v789, v798, (uint64_t)CFSTR("-Indices"));
    v799 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v797, v800, (uint64_t)v799);

  }
  v801 = [MDLMaterial alloc];
  v802 = (void *)objc_opt_new();
  v804 = (void *)objc_msgSend_initWithName_scatteringFunction_(v801, v803, (uint64_t)CFSTR("material"), v802);

  objc_msgSend_propertyWithSemantic_(v804, v805, 2);
  v806 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v807) = 1063675494;
  objc_msgSend_setFloatValue_(v806, v808, v809, v807);
  objc_msgSend_propertyWithSemantic_(v804, v810, 6);
  v811 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v812) = 1058642330;
  objc_msgSend_setFloatValue_(v811, v813, v814, v812);
  objc_msgSend_propertyWithSemantic_(v804, v815, 0);
  v816 = (void *)objc_claimAutoreleasedReturnValue();

  v817 = [MDLSubmesh alloc];
  v819 = (void *)objc_msgSend_initWithIndexBuffer_indexCount_indexType_geometryType_material_(v817, v818, (uint64_t)v795, (v1127 - (_BYTE *)__p) >> 1, 16, v1115, v804);

LABEL_1630:
  if (__p)
  {
    v1127 = (char *)__p;
    operator delete(__p);
  }
  objc_msgSend_setVertexCount_(v1105, v1024, (v1136 - v1135) / 3uLL);
  v1025 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend_setSubmeshes_(v1105, v1026, (uint64_t)v1025);

  objc_msgSend_submeshes(v1105, v1027, v1028);
  v1029 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v1029, v1030, (uint64_t)v819);

  v1031 = objc_alloc_init(MDLVertexDescriptor);
  objc_msgSend_attributes(v1031, v1032, v1033);
  v1034 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v1034, v1035, 0);
  v1036 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v1036, v1037, (uint64_t)CFSTR("position"));

  objc_msgSend_attributes(v1031, v1038, v1039);
  v1040 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v1040, v1041, 0);
  v1042 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFormat_(v1042, v1043, 786435);

  objc_msgSend_attributes(v1031, v1044, v1045);
  v1046 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v1046, v1047, 0);
  v1048 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBufferIndex_(v1048, v1049, 0);

  objc_msgSend_attributes(v1031, v1050, v1051);
  v1052 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v1052, v1053, 1);
  v1054 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v1054, v1055, (uint64_t)CFSTR("normal"));

  objc_msgSend_attributes(v1031, v1056, v1057);
  v1058 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v1058, v1059, 1);
  v1060 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFormat_(v1060, v1061, 786435);

  objc_msgSend_attributes(v1031, v1062, v1063);
  v1064 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v1064, v1065, 1);
  v1066 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBufferIndex_(v1066, v1067, 0);

  objc_msgSend_attributes(v1031, v1068, v1069);
  v1070 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v1070, v1071, 2);
  v1072 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v1072, v1073, (uint64_t)CFSTR("textureCoordinate"));

  objc_msgSend_attributes(v1031, v1074, v1075);
  v1076 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v1076, v1077, 2);
  v1078 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFormat_(v1078, v1079, 786434);

  objc_msgSend_attributes(v1031, v1080, v1081);
  v1082 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v1082, v1083, 2);
  v1084 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBufferIndex_(v1084, v1085, 0);

  objc_msgSend_setPackedOffsets(v1031, v1086, v1087);
  objc_msgSend_setPackedStrides(v1031, v1088, v1089);
  v1090 = [MDLAsset alloc];
  objc_msgSend_vertexDescriptor(v1105, v1091, v1092);
  v1093 = (void *)objc_claimAutoreleasedReturnValue();
  v1095 = (void *)objc_msgSend_initWithURL_vertexDescriptor_bufferAllocator_(v1090, v1094, 0, v1093, v1104);

  objc_msgSend_addObject_(v1095, v1096, (uint64_t)v1105);
  objc_msgSend__conformVertexBuffers_error_(v1095, v1097, (uint64_t)v1031, 0);
  objc_msgSend_removeObject_(v1095, v1098, (uint64_t)v1105);

  if (v1129)
  {
    v1130 = v1129;
    operator delete(v1129);
  }
  if (v1132)
  {
    v1133 = v1132;
    operator delete(v1132);
  }
  if (v1135)
  {
    v1136 = v1135;
    operator delete(v1135);
  }
  v297 = v1104;
  objc_autoreleasePoolPop(context);
  v22 = v1105;
  v1099 = v1105;
LABEL_1639:

  return v22;
}

+ (MDLMesh)newCylinderWithHeight:(float)height radii:(vector_float2)radii radialSegments:(NSUInteger)radialSegments verticalSegments:(NSUInteger)verticalSegments geometryType:(MDLGeometryType)geometryType inwardNormals:(BOOL)inwardNormals allocator:(id)allocator
{
  _BOOL8 v9;
  unsigned int v11;
  unsigned int v12;
  id v13;
  MDLMesh *v14;
  const char *v15;
  MDLMesh *inited;
  __int32 v19;

  v9 = inwardNormals;
  v11 = verticalSegments;
  v12 = radialSegments;
  v19 = radii.i32[0];
  v13 = allocator;
  v14 = [MDLMesh alloc];
  inited = (MDLMesh *)objc_msgSend_initCylinderWithExtent_segments_inwardNormals_topCap_bottomCap_geometryType_allocator_(v14, v15, v9, 1, 1, geometryType, v13, COERCE_DOUBLE(__PAIR64__(LODWORD(height), v19)), COERCE_DOUBLE(__PAIR64__(v11, v12)));

  return inited;
}

@end
