@implementation AREnvironmentProbeManager

- (AREnvironmentProbeManager)initWithMode:(int64_t)a3
{
  AREnvironmentProbeManager *v4;
  AREnvironmentProbeManager *v5;
  uint64_t v6;
  NSMutableArray *initialProbeIdentifiers;
  uint64_t v8;
  NSMutableArray *anchorsToRemove;
  uint64_t v10;
  NSMutableDictionary *probesByIdentifier;
  uint64_t v12;
  NSMutableDictionary *probeIdentifiersByPlaneIdentifier;
  uint64_t v14;
  NSMutableArray *requestedProbeIdentifiers;
  uint64_t v16;
  NSMutableArray *updatedProbeIdentifiers;
  uint64_t v18;
  NSMutableArray *directTexturingIdentifiers;
  dispatch_semaphore_t v20;
  OS_dispatch_semaphore *textureDataSemaphore;
  uint64_t v22;
  NSMutableArray *probeUpdateQueue;
  uint64_t v24;
  AREnvironmentProbeUpdate *currentProbeUpdate;
  float v26;
  dispatch_semaphore_t v27;
  OS_dispatch_semaphore *semaphore;
  uint64_t v29;
  ARCubemapGenerator *cubemapGenerator;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)AREnvironmentProbeManager;
  v4 = -[AREnvironmentProbeManager init](&v32, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    v6 = objc_opt_new();
    initialProbeIdentifiers = v5->_initialProbeIdentifiers;
    v5->_initialProbeIdentifiers = (NSMutableArray *)v6;

    v8 = objc_opt_new();
    anchorsToRemove = v5->_anchorsToRemove;
    v5->_anchorsToRemove = (NSMutableArray *)v8;

    v10 = objc_opt_new();
    probesByIdentifier = v5->_probesByIdentifier;
    v5->_probesByIdentifier = (NSMutableDictionary *)v10;

    v12 = objc_opt_new();
    probeIdentifiersByPlaneIdentifier = v5->_probeIdentifiersByPlaneIdentifier;
    v5->_probeIdentifiersByPlaneIdentifier = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    requestedProbeIdentifiers = v5->_requestedProbeIdentifiers;
    v5->_requestedProbeIdentifiers = (NSMutableArray *)v14;

    v16 = objc_opt_new();
    updatedProbeIdentifiers = v5->_updatedProbeIdentifiers;
    v5->_updatedProbeIdentifiers = (NSMutableArray *)v16;

    v18 = objc_opt_new();
    directTexturingIdentifiers = v5->_directTexturingIdentifiers;
    v5->_directTexturingIdentifiers = (NSMutableArray *)v18;

    v20 = dispatch_semaphore_create(1);
    textureDataSemaphore = v5->_textureDataSemaphore;
    v5->_textureDataSemaphore = (OS_dispatch_semaphore *)v20;

    v22 = objc_opt_new();
    probeUpdateQueue = v5->_probeUpdateQueue;
    v5->_probeUpdateQueue = (NSMutableArray *)v22;

    v24 = objc_opt_new();
    currentProbeUpdate = v5->_currentProbeUpdate;
    v5->_currentProbeUpdate = (AREnvironmentProbeUpdate *)v24;

    -[AREnvironmentProbeUpdate setManager:](v5->_currentProbeUpdate, "setManager:", v5);
    v5->_lastProbeUpdateTime = 0.0;
    +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com.apple.arkit.environmentTexturing.minimumProbeUpdateInterval"));
    v5->_minimumProbeUpdateInterval = v26;
    v27 = dispatch_semaphore_create(1);
    semaphore = v5->_semaphore;
    v5->_semaphore = (OS_dispatch_semaphore *)v27;

    v29 = objc_opt_new();
    cubemapGenerator = v5->_cubemapGenerator;
    v5->_cubemapGenerator = (ARCubemapGenerator *)v29;

  }
  return v5;
}

- (BOOL)_textureDataIsBusy
{
  intptr_t v3;

  v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_textureDataSemaphore, 0);
  if (!v3)
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_textureDataSemaphore);
  return v3 != 0;
}

- (BOOL)_isBusy
{
  intptr_t v3;

  v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0);
  if (!v3)
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  return v3 != 0;
}

- (id)_fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[AREnvironmentProbeManager description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AREnvironmentProbeManager _isBusy](self, "_isBusy"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("Status: %@\n"), v6);
  if (-[AREnvironmentProbeManager _textureDataIsBusy](self, "_textureDataIsBusy"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("TextureData Status: %@\n"), v7);
  objc_msgSend(v5, "appendFormat:", CFSTR("LastImageData: %@\n"), self->_lastImageData);
  return v5;
}

- (void)_insertIntoQueue:(id)a3
{
  uint64_t v4;
  NSMutableArray *probeUpdateQueue;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[NSMutableArray indexOfObject:](self->_probeUpdateQueue, "indexOfObject:");
  probeUpdateQueue = self->_probeUpdateQueue;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray addObject:](probeUpdateQueue, "addObject:", v10);
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](probeUpdateQueue, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastUpdateTimestamp");
    v8 = v7;

    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_probeUpdateQueue, "replaceObjectAtIndex:withObject:", v4, v10);
    -[NSMutableArray objectAtIndexedSubscript:](self->_probeUpdateQueue, "objectAtIndexedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLastUpdateTimestamp:", v8);

  }
}

- (id)updateProbesForTimestamp:(double)a3 planes:()vector<ARTexturedPlane imageData:(std:(id)a5 :(id)a6 allocator<ARTexturedPlane>> *)a4 pose:(id)a7 enableDirectTexturingForProbesWithIdentifier:
{
  id v12;
  simd_float4 v13;
  simd_float4 v14;
  simd_float4 v15;
  simd_float4 v16;
  BOOL v17;
  BOOL v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  double v27;
  double v28;
  NSMutableArray *requestedProbeIdentifiers;
  void *v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  ARTexturedPlane *begin;
  ARTexturedPlane *end;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::array<unsigned char, 16>, void *>>> *p_pair1;
  uint64_t **v41;
  uint64_t **v42;
  array<unsigned char, 16UL> var0;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  array<unsigned char, 16UL> v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  ARTexturedPlane *v52;
  ARTexturedPlane *v53;
  _QWORD **v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  _QWORD *v59;
  _QWORD **v60;
  BOOL v61;
  uint64_t *v62;
  AREnvironmentProbeAnchor *v63;
  void *v64;
  void *v65;
  AREnvironmentProbeAnchor *v66;
  id *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  AREnvironmentProbeAnchor *v74;
  NSObject *v75;
  objc_class *v76;
  id v77;
  double v78;
  void *v79;
  uint64_t *v80;
  uint64_t *v81;
  _QWORD **v82;
  AREnvironmentProbeAnchor *v83;
  void *v84;
  AREnvironmentProbeAnchor *v85;
  id *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  AREnvironmentProbeAnchor *v93;
  NSObject *v94;
  objc_class *v95;
  id v96;
  void *v97;
  _QWORD *v98;
  _QWORD **v99;
  _QWORD **v100;
  AREnvironmentProbeAnchor *v101;
  void *v102;
  AREnvironmentProbeAnchor *v103;
  NSObject *v104;
  objc_class *v105;
  id v106;
  _QWORD *v107;
  _QWORD **v108;
  void *v109;
  float32x4_t v110;
  float32x4_t v111;
  __int128 v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  size_t Width;
  size_t Height;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  double v127;
  double v128;
  double v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t k;
  void *v134;
  float v135;
  float v136;
  float v137;
  NSUUID *v138;
  NSUUID *universeProbeIdentifier;
  NSUUID *v140;
  NSUUID *v141;
  AREnvironmentProbeAnchor *v142;
  AREnvironmentProbeAnchor *v143;
  NSObject *v144;
  objc_class *v145;
  id v146;
  void *v147;
  NSMutableArray *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t m;
  void *v152;
  AREnvironmentProbeUpdate *v153;
  float32x4_t v155;
  float32x4_t v156;
  float32x4_t v157;
  float32x4_t v158;
  float32x4_t v159;
  NSObject *log;
  os_log_t loga[2];
  void *v162;
  simd_float4 v163;
  float32x4_t v164;
  simd_float4 v165;
  float32x4_t v166;
  simd_float4 v167;
  float32x4_t v168;
  simd_float4 v169;
  float32x4_t v170;
  id v172;
  id v173;
  float32x4_t v174;
  void *v175;
  float32x4_t v176;
  void *v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  uint64_t *v182;
  _QWORD *v183[2];
  _QWORD **v184;
  _QWORD *v185[2];
  _QWORD **v186;
  _QWORD *v187[2];
  _QWORD **v188;
  _QWORD *v189[2];
  uint64_t *v190;
  _QWORD *v191[2];
  _QWORD v192[3];
  uint64_t *v193;
  _QWORD *v194[2];
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
  __int128 v206;
  _BYTE v207[128];
  _OWORD v208[12];
  _QWORD *v209[3];
  id v210;
  _BYTE buf[12];
  __int16 v212;
  AREnvironmentProbeManager *v213;
  __int16 v214;
  AREnvironmentProbeAnchor *v215;
  __int16 v216;
  AREnvironmentProbeAnchor *v217;
  _OWORD v218[12];
  _QWORD *v219[3];
  id v220;
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  uint64_t v224;
  simd_float4x4 v225;
  simd_float4x4 v226;

  v224 = *MEMORY[0x1E0C80C00];
  v173 = a5;
  v12 = a6;
  v172 = a7;
  v162 = v12;
  if (v12)
  {
    objc_msgSend(v12, "cameraTransform");
    v167 = v14;
    v169 = v13;
    v163 = v16;
    v165 = v15;
  }
  else
  {
    v167 = *(simd_float4 *)(MEMORY[0x1E0C83FF0] + 16);
    v169 = *(simd_float4 *)MEMORY[0x1E0C83FF0];
    v163 = *(simd_float4 *)(MEMORY[0x1E0C83FF0] + 48);
    v165 = *(simd_float4 *)(MEMORY[0x1E0C83FF0] + 32);
  }
  v17 = v12 != 0;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_storeStrong((id *)&self->_lastImageData, a5);
  *(simd_float4 *)self->_anon_80 = v169;
  *(simd_float4 *)&self->_anon_80[16] = v167;
  *(simd_float4 *)&self->_anon_80[32] = v165;
  *(simd_float4 *)&self->_anon_80[48] = v163;
  if (v173)
    v18 = v17;
  else
    v18 = 0;
  self->_isReady = v18;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  v177 = (void *)objc_opt_new();
  v19 = (void *)objc_opt_new();
  v175 = (void *)objc_opt_new();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_textureDataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[NSMutableArray addObjectsFromArray:](self->_directTexturingIdentifiers, "addObjectsFromArray:", v172);
  objc_msgSend(v175, "addObjectsFromArray:", self->_anchorsToRemove);
  -[NSMutableArray removeAllObjects](self->_anchorsToRemove, "removeAllObjects");
  -[NSMutableDictionary allValues](self->_probeIdentifiersByPlaneIdentifier, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v205 = 0u;
  v206 = 0u;
  v203 = 0u;
  v204 = 0u;
  v21 = self->_probesByIdentifier;
  v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v203, v223, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v204;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v204 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v203 + 1) + 8 * i);
        if ((objc_msgSend(v20, "containsObject:", v25) & 1) == 0)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_probesByIdentifier, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v25, "isEqual:", self->_universeProbeIdentifier) & 1) == 0
            && (objc_msgSend(v26, "lastUpdateTimestamp"), a3 - v27 > 3.0)
            || objc_msgSend(v25, "isEqual:", self->_universeProbeIdentifier)
            && (objc_msgSend(v26, "lastUpdateTimestamp"), a3 - v28 > 15.0))
          {
            requestedProbeIdentifiers = self->_requestedProbeIdentifiers;
            objc_msgSend(v26, "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(requestedProbeIdentifiers) = -[NSMutableArray containsObject:](requestedProbeIdentifiers, "containsObject:", v30);

            if ((requestedProbeIdentifiers & 1) == 0)
            {
              v31 = (void *)objc_msgSend(v26, "copy");
              objc_msgSend(v31, "setLastUpdateTimestamp:", a3);
              -[AREnvironmentProbeManager _insertIntoQueue:](self, "_insertIntoQueue:", v31);

            }
          }

        }
      }
      v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v203, v223, 16);
    }
    while (v22);
  }

  if (-[NSMutableArray count](self->_initialProbeIdentifiers, "count") && self->_isReady)
  {
    v201 = 0u;
    v202 = 0u;
    v199 = 0u;
    v200 = 0u;
    v32 = self->_initialProbeIdentifiers;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v199, v222, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v200;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v200 != v34)
            objc_enumerationMutation(v32);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_probesByIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v199 + 1) + 8 * j));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(v36, "copy");

          objc_msgSend(v37, "setLastUpdateTimestamp:", a3);
          -[AREnvironmentProbeManager _insertIntoQueue:](self, "_insertIntoQueue:", v37);

        }
        v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v199, v222, 16);
      }
      while (v33);
    }

    -[NSMutableArray removeAllObjects](self->_initialProbeIdentifiers, "removeAllObjects");
  }
  if (self->_mode == 2)
  {
    if (!self->_universeProbeIdentifier && self->_isReady)
    {
      v197 = 0u;
      v198 = 0u;
      v195 = 0u;
      v196 = 0u;
      -[NSMutableDictionary allValues](self->_probesByIdentifier, "allValues");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v195, v221, 16);
      if (v131)
      {
        v132 = *(_QWORD *)v196;
        while (2)
        {
          for (k = 0; k != v131; ++k)
          {
            if (*(_QWORD *)v196 != v132)
              objc_enumerationMutation(v130);
            v134 = *(void **)(*((_QWORD *)&v195 + 1) + 8 * k);
            objc_msgSend(v134, "extent");
            if (fabsf(v135) != INFINITY)
            {
              objc_msgSend(v134, "extent");
              if (fabsf(v136) != INFINITY)
              {
                objc_msgSend(v134, "extent");
                if (fabsf(v137) != INFINITY)
                  continue;
              }
            }
            objc_msgSend(v134, "identifier");
            v138 = (NSUUID *)objc_claimAutoreleasedReturnValue();
            universeProbeIdentifier = self->_universeProbeIdentifier;
            self->_universeProbeIdentifier = v138;

            goto LABEL_109;
          }
          v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v195, v221, 16);
          if (v131)
            continue;
          break;
        }
      }
LABEL_109:

      if (!self->_universeProbeIdentifier)
      {
        v140 = (NSUUID *)objc_opt_new();
        v141 = self->_universeProbeIdentifier;
        self->_universeProbeIdentifier = v140;

        v142 = [AREnvironmentProbeAnchor alloc];
        v143 = -[AREnvironmentProbeAnchor initWithIdentifier:transform:](v142, "initWithIdentifier:transform:", self->_universeProbeIdentifier, *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)(MEMORY[0x1E0C83FF0] + 48));
        _ARLogGeneral();
        v144 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
        {
          v145 = (objc_class *)objc_opt_class();
          NSStringFromClass(v145);
          v146 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v146;
          v212 = 2048;
          v213 = self;
          v214 = 2114;
          v215 = v143;
          _os_log_impl(&dword_1B3A68000, v144, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Added universe probe: %{public}@", buf, 0x20u);

        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probesByIdentifier, "setObject:forKeyedSubscript:", v143, self->_universeProbeIdentifier);
        objc_msgSend(v177, "addObject:", v143);
        v147 = (void *)-[AREnvironmentProbeAnchor copy](v143, "copy");
        objc_msgSend(v147, "setLastUpdateTimestamp:", a3);
        -[AREnvironmentProbeManager _insertIntoQueue:](self, "_insertIntoQueue:", v147);

      }
    }
    v194[1] = 0;
    v194[0] = 0;
    v193 = (uint64_t *)v194;
    begin = a4->__begin_;
    end = a4->__end_;
    if (a4->__begin_ != end)
    {
      p_pair1 = &begin[3].var4.__tree_.__pair1_;
      do
      {
        *(_QWORD *)buf = begin;
        v41 = (uint64_t **)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>(&v193, (uint64_t)begin, (uint64_t)&std::piecewise_construct, (__int128 **)buf);
        v42 = v41;
        var0 = begin->var0;
        v44 = *(_OWORD *)&begin->var1;
        v45 = *(_OWORD *)&begin->var5;
        *((_OWORD *)v41 + 5) = *(_OWORD *)&begin->var4.__tree_.__pair1_.__value_.__left_;
        *((_OWORD *)v41 + 6) = v45;
        *((array<unsigned char, 16UL> *)v41 + 3) = var0;
        *((_OWORD *)v41 + 4) = v44;
        v46 = *(__int128 *)((char *)&begin[1].var0 + 8);
        v47 = *(_OWORD *)&begin[1].var4.__tree_.__begin_node_;
        v48 = begin[2].var0;
        *((_OWORD *)v41 + 9) = *(_OWORD *)&begin[1].var4.__tree_.__pair3_.__value_;
        *((array<unsigned char, 16UL> *)v41 + 10) = v48;
        *((_OWORD *)v41 + 7) = v46;
        *((_OWORD *)v41 + 8) = v47;
        v49 = *(_OWORD *)&begin[2].var1;
        v50 = *(_OWORD *)&begin[2].var4.__tree_.__pair1_.__value_.__left_;
        v51 = *(__int128 *)((char *)&begin[3].var0 + 8);
        *((_OWORD *)v41 + 13) = *(_OWORD *)&begin[2].var5;
        *((_OWORD *)v41 + 14) = v51;
        *((_OWORD *)v41 + 11) = v49;
        *((_OWORD *)v41 + 12) = v50;
        if (v41 + 6 != (uint64_t **)begin)
          std::__tree<std::array<unsigned char,16ul>>::__assign_multi<std::__tree_const_iterator<std::array<unsigned char,16ul>,std::__tree_node<std::array<unsigned char,16ul>,void *> *,long>>(v41 + 30, (_QWORD *)begin[3].var4.__tree_.__begin_node_, p_pair1);
        objc_storeStrong((id *)v42 + 33, begin[3].var5);
        p_pair1 += 28;
        begin += 4;
      }
      while (begin != end);
    }
    keys<std::array<unsigned char,16ul>,ARTexturedPlane>((char *)&v193, (uint64_t)v192);
    v191[1] = 0;
    v191[0] = 0;
    v190 = (uint64_t *)v191;
    v52 = self->_lastPlanes.__begin_;
    v53 = self->_lastPlanes.__end_;
    while (v52 != v53)
    {
      std::__tree<std::array<unsigned char,16ul>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::array<unsigned char,16ul>>(&v190, (uint64_t)v52, v52);
      v52 += 4;
    }
    notInLeftButRight<std::array<unsigned char,16ul>>((char *)&v190, v192, (uint64_t)&v188);
    notInLeftButRight<std::array<unsigned char,16ul>>((char *)v192, &v190, (uint64_t)&v186);
    intersect<std::array<unsigned char,16ul>>(&v190, (uint64_t)v192, (uint64_t)&v184);
    v183[0] = 0;
    v183[1] = 0;
    v182 = (uint64_t *)v183;
    v54 = v184;
    if (v184 != v185)
    {
      do
      {
        v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", (char *)v54 + 25);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_probeIdentifiersByPlaneIdentifier, "objectForKeyedSubscript:", v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_probesByIdentifier, "objectForKeyedSubscript:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = (char *)v54 + 25;
        if (!*((_QWORD *)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>(&v193, (uint64_t)v54 + 25, (uint64_t)&std::piecewise_construct, (__int128 **)buf)+ 8)|| (objc_msgSend(v57, "lastUpdateTimestamp"), a3 - v58 > 3.0))
        {
          std::__tree<std::array<unsigned char,16ul>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::array<unsigned char,16ul>>(&v182, (uint64_t)v54 + 25, (_QWORD **)((char *)v54 + 25));
        }

        v59 = v54[1];
        if (v59)
        {
          do
          {
            v60 = (_QWORD **)v59;
            v59 = (_QWORD *)*v59;
          }
          while (v59);
        }
        else
        {
          do
          {
            v60 = (_QWORD **)v54[2];
            v61 = *v60 == v54;
            v54 = v60;
          }
          while (!v61);
        }
        v54 = v60;
      }
      while (v60 != v185);
      v62 = v182;
      if (v182 != (uint64_t *)v183)
      {
        do
        {
          v63 = (AREnvironmentProbeAnchor *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", (char *)v62 + 25);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_probeIdentifiersByPlaneIdentifier, "objectForKeyedSubscript:", v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_probesByIdentifier, "objectForKeyedSubscript:", v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          if (v65
            && (-[NSMutableArray containsObject:](self->_requestedProbeIdentifiers, "containsObject:", v64) & 1) == 0)
          {
            v66 = [AREnvironmentProbeAnchor alloc];
            *(_QWORD *)buf = (char *)v62 + 25;
            v67 = (id *)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>(&v193, (uint64_t)v62 + 25, (uint64_t)&std::piecewise_construct, (__int128 **)buf);
            v68 = *((_OWORD *)v67 + 12);
            v218[8] = *((_OWORD *)v67 + 11);
            v218[9] = v68;
            v69 = *((_OWORD *)v67 + 14);
            v218[10] = *((_OWORD *)v67 + 13);
            v218[11] = v69;
            v70 = *((_OWORD *)v67 + 8);
            v218[4] = *((_OWORD *)v67 + 7);
            v218[5] = v70;
            v71 = *((_OWORD *)v67 + 10);
            v218[6] = *((_OWORD *)v67 + 9);
            v218[7] = v71;
            v72 = *((_OWORD *)v67 + 4);
            v218[0] = *((_OWORD *)v67 + 3);
            v218[1] = v72;
            v73 = *((_OWORD *)v67 + 6);
            v218[2] = *((_OWORD *)v67 + 5);
            v218[3] = v73;
            std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v219, (uint64_t)(v67 + 30));
            v220 = v67[33];
            v74 = -[AREnvironmentProbeAnchor initWithIdentifier:onPlane:](v66, "initWithIdentifier:onPlane:", v64, v218);

            std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v219, v219[1]);
            if (-[NSMutableArray indexOfObject:](self->_probeUpdateQueue, "indexOfObject:", v74) == 0x7FFFFFFFFFFFFFFFLL)
            {
              _ARLogGeneral();
              v75 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
              {
                log = v75;
                v76 = (objc_class *)objc_opt_class();
                NSStringFromClass(v76);
                v77 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                *(_QWORD *)&buf[4] = v77;
                v212 = 2048;
                v213 = self;
                v214 = 2114;
                v215 = v63;
                v216 = 2114;
                v217 = v74;
                _os_log_impl(&dword_1B3A68000, log, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Updating probe for plane %{public}@: %{public}@", buf, 0x2Au);

                v75 = log;
              }

            }
            *(_QWORD *)buf = (char *)v62 + 25;
            if (*((_QWORD *)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>(&v193, (uint64_t)v62 + 25, (uint64_t)&std::piecewise_construct, (__int128 **)buf)+ 8))
            {
              objc_msgSend(v65, "lastUpdateTimestamp");
              if (a3 - v78 > 3.0)
              {
                objc_msgSend(v65, "colorHistogram");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                -[AREnvironmentProbeAnchor setColorHistogram:](v74, "setColorHistogram:", v79);

                objc_msgSend(v65, "opaquePixelPercentage");
                -[AREnvironmentProbeAnchor setOpaquePixelPercentage:](v74, "setOpaquePixelPercentage:");
              }
            }
            -[ARAnchor setLastUpdateTimestamp:](v74, "setLastUpdateTimestamp:", a3);
            -[AREnvironmentProbeManager _insertIntoQueue:](self, "_insertIntoQueue:", v74);

          }
          v80 = (uint64_t *)v62[1];
          if (v80)
          {
            do
            {
              v81 = v80;
              v80 = (uint64_t *)*v80;
            }
            while (v80);
          }
          else
          {
            do
            {
              v81 = (uint64_t *)v62[2];
              v61 = *v81 == (_QWORD)v62;
              v62 = v81;
            }
            while (!v61);
          }
          v62 = v81;
        }
        while (v81 != (uint64_t *)v183);
      }
    }
    v82 = v188;
    if (v188 != v189)
    {
      do
      {
        v83 = (AREnvironmentProbeAnchor *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", (char *)v82 + 25);
        v84 = (void *)objc_opt_new();
        v85 = [AREnvironmentProbeAnchor alloc];
        *(_QWORD *)buf = (char *)v82 + 25;
        v86 = (id *)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>(&v193, (uint64_t)v82 + 25, (uint64_t)&std::piecewise_construct, (__int128 **)buf);
        v87 = *((_OWORD *)v86 + 12);
        v208[8] = *((_OWORD *)v86 + 11);
        v208[9] = v87;
        v88 = *((_OWORD *)v86 + 14);
        v208[10] = *((_OWORD *)v86 + 13);
        v208[11] = v88;
        v89 = *((_OWORD *)v86 + 8);
        v208[4] = *((_OWORD *)v86 + 7);
        v208[5] = v89;
        v90 = *((_OWORD *)v86 + 10);
        v208[6] = *((_OWORD *)v86 + 9);
        v208[7] = v90;
        v91 = *((_OWORD *)v86 + 4);
        v208[0] = *((_OWORD *)v86 + 3);
        v208[1] = v91;
        v92 = *((_OWORD *)v86 + 6);
        v208[2] = *((_OWORD *)v86 + 5);
        v208[3] = v92;
        std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v209, (uint64_t)(v86 + 30));
        v210 = v86[33];
        v93 = -[AREnvironmentProbeAnchor initWithIdentifier:onPlane:](v85, "initWithIdentifier:onPlane:", v84, v208);

        std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v209, v209[1]);
        _ARLogGeneral();
        v94 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
        {
          v95 = (objc_class *)objc_opt_class();
          NSStringFromClass(v95);
          v96 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v96;
          v212 = 2048;
          v213 = self;
          v214 = 2114;
          v215 = v83;
          v216 = 2114;
          v217 = v93;
          _os_log_impl(&dword_1B3A68000, v94, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Added probe for plane %{public}@: %{public}@", buf, 0x2Au);

        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probesByIdentifier, "setObject:forKeyedSubscript:", v93, v84);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeIdentifiersByPlaneIdentifier, "setObject:forKeyedSubscript:", v84, v83);
        objc_msgSend(v177, "addObject:", v93);
        v97 = (void *)-[AREnvironmentProbeAnchor copy](v93, "copy");
        objc_msgSend(v97, "setLastUpdateTimestamp:", a3);
        -[AREnvironmentProbeManager _insertIntoQueue:](self, "_insertIntoQueue:", v97);

        v98 = v82[1];
        if (v98)
        {
          do
          {
            v99 = (_QWORD **)v98;
            v98 = (_QWORD *)*v98;
          }
          while (v98);
        }
        else
        {
          do
          {
            v99 = (_QWORD **)v82[2];
            v61 = *v99 == v82;
            v82 = v99;
          }
          while (!v61);
        }
        v82 = v99;
      }
      while (v99 != v189);
    }
    v100 = v186;
    if (v186 != v187)
    {
      do
      {
        v101 = (AREnvironmentProbeAnchor *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", (char *)v100 + 25);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_probeIdentifiersByPlaneIdentifier, "objectForKeyedSubscript:", v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](self->_probeIdentifiersByPlaneIdentifier, "removeObjectForKey:", v101);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_probesByIdentifier, "objectForKeyedSubscript:", v102);
        v103 = (AREnvironmentProbeAnchor *)objc_claimAutoreleasedReturnValue();
        if (v103)
        {
          _ARLogGeneral();
          v104 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
          {
            v105 = (objc_class *)objc_opt_class();
            NSStringFromClass(v105);
            v106 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v106;
            v212 = 2048;
            v213 = self;
            v214 = 2114;
            v215 = v101;
            v216 = 2114;
            v217 = v103;
            _os_log_impl(&dword_1B3A68000, v104, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Removed probe for plane %{public}@: %{public}@", buf, 0x2Au);

          }
          objc_msgSend(v175, "addObject:", v103);
          -[NSMutableDictionary removeObjectForKey:](self->_probesByIdentifier, "removeObjectForKey:", v102);
          -[NSMutableArray removeObject:](self->_probeUpdateQueue, "removeObject:", v103);
        }

        v107 = v100[1];
        if (v107)
        {
          do
          {
            v108 = (_QWORD **)v107;
            v107 = (_QWORD *)*v107;
          }
          while (v107);
        }
        else
        {
          do
          {
            v108 = (_QWORD **)v100[2];
            v61 = *v108 == v100;
            v100 = v108;
          }
          while (!v61);
        }
        v100 = v108;
      }
      while (v108 != v187);
    }
    std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v182, v183[0]);
    std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v184, v185[0]);
    std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v186, v187[0]);
    std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v188, v189[0]);
    std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v190, v191[0]);
    std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v192, (_QWORD *)v192[1]);
    std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)&v193, v194[0]);
  }
  if (v173
    && objc_msgSend(v173, "pixelBuffer")
    && -[NSMutableArray count](self->_probeUpdateQueue, "count")
    && a3 - self->_lastProbeUpdateTime > self->_minimumProbeUpdateInterval)
  {
    -[NSMutableArray objectAtIndex:](self->_probeUpdateQueue, "objectAtIndex:", 0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "referenceTransform");
    v176 = v110;
    v174 = v111;
    v159 = v113;
    *(_OWORD *)loga = v112;
    objc_msgSend(v109, "extent");
    v158 = v114;
    v225.columns[1] = v167;
    v225.columns[0] = v169;
    v225.columns[3] = v163;
    v225.columns[2] = v165;
    v226 = __invert_f4(v225);
    v168 = (float32x4_t)v226.columns[2];
    v170 = (float32x4_t)v226.columns[0];
    v164 = (float32x4_t)v226.columns[3];
    v166 = (float32x4_t)v226.columns[1];
    objc_msgSend(v173, "cameraIntrinsics");
    v156 = v116;
    v157 = v115;
    v155 = v117;
    Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v173, "pixelBuffer"));
    Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v173, "pixelBuffer"));
    if (ARIsBoxInViewFrustum(v176, v174, *(float32x4_t *)loga, v159, v158, v127, v128, v129, Height, v120, v121, v122, v123, v124, v125, v126, v170, v166, v168,
                         v164,
                         v157,
                         v156,
                         v155,
                         (float)Width,
                         (float)Height))
    {
      self->_lastProbeUpdateTime = a3;
      objc_msgSend(v109, "setLastUpdateTimestamp:", a3);
      -[NSMutableArray removeObjectAtIndex:](self->_probeUpdateQueue, "removeObjectAtIndex:", 0);
      -[AREnvironmentProbeManager _requestTextureForProbe:](self, "_requestTextureForProbe:", v109);
    }
    else
    {
      -[NSMutableArray removeObjectAtIndex:](self->_probeUpdateQueue, "removeObjectAtIndex:", 0);
      -[AREnvironmentProbeManager _insertIntoQueue:](self, "_insertIntoQueue:", v109);
    }

  }
  v180 = 0u;
  v181 = 0u;
  v178 = 0u;
  v179 = 0u;
  v148 = self->_updatedProbeIdentifiers;
  v149 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v148, "countByEnumeratingWithState:objects:count:", &v178, v207, 16);
  if (v149)
  {
    v150 = *(_QWORD *)v179;
    do
    {
      for (m = 0; m != v149; ++m)
      {
        if (*(_QWORD *)v179 != v150)
          objc_enumerationMutation(v148);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_probesByIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v178 + 1) + 8 * m));
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        if (v152)
          objc_msgSend(v19, "addObject:", v152);

      }
      v149 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v148, "countByEnumeratingWithState:objects:count:", &v178, v207, 16);
    }
    while (v149);
  }

  -[NSMutableArray removeAllObjects](self->_updatedProbeIdentifiers, "removeAllObjects");
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_textureDataSemaphore);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  std::vector<ARTexturedPlane>::__vdeallocate((uint64_t *)&self->_lastPlanes);
  *(_OWORD *)&self->_lastPlanes.__begin_ = *(_OWORD *)&a4->__begin_;
  self->_lastPlanes.__end_cap_.__value_ = a4->__end_cap_.__value_;
  a4->__begin_ = 0;
  a4->__end_ = 0;
  a4->__end_cap_.__value_ = 0;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  -[AREnvironmentProbeUpdate updateAddedProbeAnchors:updatedProbeAnchors:removedProbeAnchors:](self->_currentProbeUpdate, "updateAddedProbeAnchors:updatedProbeAnchors:removedProbeAnchors:", v177, v19, v175);
  v153 = self->_currentProbeUpdate;

  return v153;
}

- (void)_updateProbesFromExistingAnchors:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *probesByIdentifier;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  NSMutableArray *directTexturingIdentifiers;
  void *v27;
  uint64_t v28;
  NSMutableArray *v29;
  void *v30;
  _BOOL4 v31;
  NSObject *v32;
  _BOOL4 v33;
  objc_class *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  void *v41;
  NSMutableDictionary *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  BOOL v48;
  NSMutableDictionary *v49;
  void *v50;
  void *v51;
  NSMutableDictionary *v52;
  void *v53;
  NSMutableArray *updatedProbeIdentifiers;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t n;
  void *v62;
  NSObject *v63;
  objc_class *v64;
  void *v65;
  NSMutableDictionary *v66;
  void *v67;
  NSMutableArray *initialProbeIdentifiers;
  void *v69;
  void *v70;
  NSUUID *universeProbeIdentifier;
  void *v72;
  id v73;
  id obj;
  void *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  uint8_t v98[128];
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  AREnvironmentProbeManager *v102;
  __int16 v103;
  void *v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_textureDataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v76 = (void *)objc_opt_new();
  v75 = (void *)objc_opt_new();
  v72 = (void *)objc_opt_new();
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v93, v107, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v94 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
        probesByIdentifier = self->_probesByIdentifier;
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](probesByIdentifier, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(probesByIdentifier) = v12 == 0;

        if ((_DWORD)probesByIdentifier)
          v13 = v76;
        else
          v13 = v75;
        objc_msgSend(v13, "addObject:", v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v93, v107, 16);
    }
    while (v6);
  }

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v14 = self->_probesByIdentifier;
  v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v89, v106, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v90;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v90 != v16)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_probesByIdentifier, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v5, "containsObject:", v19);

        if ((v20 & 1) == 0)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_probesByIdentifier, "objectForKeyedSubscript:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "addObject:", v21);

        }
      }
      v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v89, v106, 16);
    }
    while (v15);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v76;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v105, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v86;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v86 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * k);
        directTexturingIdentifiers = self->_directTexturingIdentifiers;
        objc_msgSend(v25, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[NSMutableArray containsObject:](directTexturingIdentifiers, "containsObject:", v27);

        if ((_DWORD)v28)
        {
          v29 = self->_directTexturingIdentifiers;
          objc_msgSend(v25, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray removeObject:](v29, "removeObject:", v30);

        }
        v31 = -[AREnvironmentProbeManager _addProbeWithAnchor:timestamp:textureImmediately:](self, "_addProbeWithAnchor:timestamp:textureImmediately:", v25, v28, 0.0);
        _ARLogGeneral();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
        if (v31)
        {
          if (v33)
          {
            v34 = (objc_class *)objc_opt_class();
            NSStringFromClass(v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v100 = v35;
            v101 = 2048;
            v102 = self;
            v103 = 2114;
            v104 = v25;
            _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Added probe: %{public}@", buf, 0x20u);

          }
        }
        else
        {
          if (v33)
          {
            v36 = (objc_class *)objc_opt_class();
            NSStringFromClass(v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v100 = v37;
            v101 = 2048;
            v102 = self;
            v103 = 2114;
            v104 = v25;
            _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Removed redundant probe: %{public}@", buf, 0x20u);

          }
          -[NSMutableArray addObject:](self->_anchorsToRemove, "addObject:", v25);
        }
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v105, 16);
    }
    while (v22);
  }

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v73 = v75;
  v38 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v81, v98, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v82;
    do
    {
      for (m = 0; m != v38; ++m)
      {
        if (*(_QWORD *)v82 != v39)
          objc_enumerationMutation(v73);
        v41 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * m);
        v42 = self->_probesByIdentifier;
        objc_msgSend(v41, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v42, "objectForKeyedSubscript:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "lastUpdateTimestamp");
        v46 = v45;
        objc_msgSend(v41, "lastUpdateTimestamp");
        v48 = v46 > v47;

        if (!v48)
        {
          v49 = self->_probesByIdentifier;
          objc_msgSend(v41, "identifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          v52 = self->_probesByIdentifier;
          objc_msgSend(v41, "identifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v52, "setObject:forKeyedSubscript:", v41, v53);

          updatedProbeIdentifiers = self->_updatedProbeIdentifiers;
          objc_msgSend(v41, "identifier");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(updatedProbeIdentifiers) = -[NSMutableArray containsObject:](updatedProbeIdentifiers, "containsObject:", v55);

          if ((_DWORD)updatedProbeIdentifiers)
          {
            objc_msgSend(v51, "environmentTexture");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setEnvironmentTexture:", v56);

            objc_msgSend(v51, "colorHistogram");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setColorHistogram:", v57);

            objc_msgSend(v51, "opaquePixelPercentage");
            objc_msgSend(v41, "setOpaquePixelPercentage:");
          }

        }
      }
      v38 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v81, v98, 16);
    }
    while (v38);
  }

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v58 = v72;
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v77, v97, 16);
  if (v59)
  {
    v60 = *(_QWORD *)v78;
    do
    {
      for (n = 0; n != v59; ++n)
      {
        if (*(_QWORD *)v78 != v60)
          objc_enumerationMutation(v58);
        v62 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * n);
        _ARLogGeneral();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          v64 = (objc_class *)objc_opt_class();
          NSStringFromClass(v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v100 = v65;
          v101 = 2048;
          v102 = self;
          v103 = 2114;
          v104 = v62;
          _os_log_impl(&dword_1B3A68000, v63, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Removed probe: %{public}@", buf, 0x20u);

        }
        v66 = self->_probesByIdentifier;
        objc_msgSend(v62, "identifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v66, "removeObjectForKey:", v67);

        initialProbeIdentifiers = self->_initialProbeIdentifiers;
        objc_msgSend(v62, "identifier");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray removeObject:](initialProbeIdentifiers, "removeObject:", v69);

        -[NSMutableArray removeObject:](self->_probeUpdateQueue, "removeObject:", v62);
        objc_msgSend(v62, "identifier");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(initialProbeIdentifiers) = objc_msgSend(v70, "isEqual:", self->_universeProbeIdentifier);

        if ((_DWORD)initialProbeIdentifiers)
        {
          universeProbeIdentifier = self->_universeProbeIdentifier;
          self->_universeProbeIdentifier = 0;

        }
      }
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v77, v97, 16);
    }
    while (v59);
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_textureDataSemaphore);
}

- (BOOL)_addProbeWithAnchor:(id)a3 timestamp:(double)a4 textureImmediately:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *probesByIdentifier;
  void *v15;
  float v16;
  float v17;
  float v18;
  NSMutableDictionary *v19;
  void *v20;
  NSMutableArray *initialProbeIdentifiers;

  v5 = a5;
  v8 = a3;
  v9 = v8;
  if (self->_mode != 2)
    goto LABEL_10;
  objc_msgSend(v8, "trackedPlaneIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "trackedPlaneIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_probeIdentifiersByPlaneIdentifier, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = v12 == 0;

    if (v12)
    {
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeIdentifiersByPlaneIdentifier, "setObject:forKeyedSubscript:", v13, v11);

    probesByIdentifier = self->_probesByIdentifier;
    objc_msgSend(v9, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](probesByIdentifier, "setObject:forKeyedSubscript:", v9, v15);

LABEL_15:
    LOBYTE(v5) = 1;
    goto LABEL_16;
  }
  if ((objc_msgSend(v9, "extent"), fabsf(v16) != INFINITY)
    && (objc_msgSend(v9, "extent"), fabsf(v17) != INFINITY)
    && (objc_msgSend(v9, "extent"), fabsf(v18) != INFINITY)
    || !self->_universeProbeIdentifier
    || v5)
  {
LABEL_10:
    v19 = self->_probesByIdentifier;
    objc_msgSend(v9, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v9, v20);

    dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
    LODWORD(v20) = self->_isReady;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
    if ((_DWORD)v20)
    {
      v11 = (void *)objc_msgSend(v9, "copy");
      objc_msgSend(v11, "setLastUpdateTimestamp:", a4);
      if (v5)
        -[AREnvironmentProbeManager _requestTextureForProbe:](self, "_requestTextureForProbe:", v11);
      else
        -[AREnvironmentProbeManager _insertIntoQueue:](self, "_insertIntoQueue:", v11);
    }
    else
    {
      initialProbeIdentifiers = self->_initialProbeIdentifiers;
      objc_msgSend(v9, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](initialProbeIdentifiers, "addObject:", v11);
    }
    goto LABEL_15;
  }
LABEL_17:

  return v5;
}

- (void)_requestTextureForProbe:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  NSMutableArray *requestedProbeIdentifiers;
  void *v10;
  ARImageData *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  int v16;
  ARCubemapGenerator *cubemapGenerator;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  id v46;
  _BYTE __dst[1028];
  uint8_t buf[1032];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ARLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    *(_QWORD *)&buf[24] = v8;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Requesting texture for probe %{public}@", buf, 0x20u);

  }
  requestedProbeIdentifiers = self->_requestedProbeIdentifiers;
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](requestedProbeIdentifiers, "addObject:", v10);

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  v11 = self->_lastImageData;
  v43 = *(_OWORD *)&self->_anon_80[16];
  v44 = *(_OWORD *)self->_anon_80;
  v41 = *(_OWORD *)&self->_anon_80[48];
  v42 = *(_OWORD *)&self->_anon_80[32];
  convertToMeshes((const ARTexturedPlane **)&self->_lastPlanes.__begin_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  kdebug_trace();
  memset(buf, 0, 512);
  ARLabHistogramCreate(buf);
  objc_msgSend(v4, "colorHistogram");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (!v14)
  {
    objc_msgSend(v4, "colorHistogram");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getBytes:length:", &buf[4], 1024);

    objc_msgSend(v4, "opaquePixelPercentage");
    *(_DWORD *)buf = v16;
  }
  cubemapGenerator = self->_cubemapGenerator;
  objc_msgSend(v4, "referenceTransform");
  v39 = v19;
  v40 = v18;
  v37 = v21;
  v38 = v20;
  objc_msgSend(v4, "extent");
  v36 = v22;
  memcpy(__dst, buf, sizeof(__dst));
  v23 = -[ARImageData pixelBuffer](v11, "pixelBuffer");
  -[ARImageData cameraIntrinsics](v11, "cameraIntrinsics");
  v34 = v25;
  v35 = v24;
  v33 = v26;
  -[ARImageData exposureDuration](v11, "exposureDuration");
  v28 = v27;
  -[ARImageData exposureTargetOffset](v11, "exposureTargetOffset");
  v30 = v29;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __53__AREnvironmentProbeManager__requestTextureForProbe___block_invoke;
  v45[3] = &unk_1E66756C8;
  v45[4] = self;
  v31 = v4;
  v46 = v31;
  LODWORD(v32) = v30;
  -[ARCubemapGenerator cubemapWithTransform:extent:lastHistogram:fromMeshes:cameraImage:cameraTransform:cameraIntrinsics:cameraExposure:cameraExposureOffset:completionHandler:](cubemapGenerator, "cubemapWithTransform:extent:lastHistogram:fromMeshes:cameraImage:cameraTransform:cameraIntrinsics:cameraExposure:cameraExposureOffset:completionHandler:", __dst, v12, v23, v45, v40, v39, v38, v37, v36, v44, v43, v42, v41, v35, v34, v33,
    v28,
    v32);

}

void __53__AREnvironmentProbeManager__requestTextureForProbe___block_invoke(uint64_t a1, void *a2, _DWORD *a3)
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
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
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    _ARLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543874;
      v34 = v8;
      v35 = 2048;
      v36 = v9;
      v37 = 2114;
      v38 = v10;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Received texture for probe %{public}@", (uint8_t *)&v33, 0x20u);

    }
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 88), 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(*(id *)(a1 + 40), "setEnvironmentTexture:", v5);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3 + 1, 1024);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setColorHistogram:", v11);

    LODWORD(v12) = *a3;
    objc_msgSend(*(id *)(a1 + 40), "setOpaquePixelPercentage:", v12);
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = v15 == 0;

    if ((v13 & 1) == 0)
    {
      v16 = *(void **)(a1 + 40);
      v17 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      objc_msgSend(v16, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

    }
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObject:", v20);

    v21 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v22);

  }
  else
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 88), 0xFFFFFFFFFFFFFFFFLL);
    v23 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeObject:", v24);

    objc_msgSend(*(id *)(a1 + 32), "_insertIntoQueue:", *(_QWORD *)(a1 + 40));
    v25 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(*(id *)(a1 + 40), "lastUpdateTimestamp");
      v29 = v28;
      v30 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setLastUpdateTimestamp:", v29);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 88));
  kdebug_trace();

}

- (int64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  vector<ARTexturedPlane, std::allocator<ARTexturedPlane>> *p_lastPlanes;

  objc_storeStrong((id *)&self->_cubemapGenerator, 0);
  p_lastPlanes = &self->_lastPlanes;
  std::vector<ARTexturedPlane>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_lastPlanes);
  objc_storeStrong((id *)&self->_lastImageData, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_currentProbeUpdate, 0);
  objc_storeStrong((id *)&self->_probeUpdateQueue, 0);
  objc_storeStrong((id *)&self->_textureDataSemaphore, 0);
  objc_storeStrong((id *)&self->_universeProbeIdentifier, 0);
  objc_storeStrong((id *)&self->_directTexturingIdentifiers, 0);
  objc_storeStrong((id *)&self->_updatedProbeIdentifiers, 0);
  objc_storeStrong((id *)&self->_requestedProbeIdentifiers, 0);
  objc_storeStrong((id *)&self->_probeIdentifiersByPlaneIdentifier, 0);
  objc_storeStrong((id *)&self->_probesByIdentifier, 0);
  objc_storeStrong((id *)&self->_anchorsToRemove, 0);
  objc_storeStrong((id *)&self->_initialProbeIdentifiers, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 26) = 0;
  return self;
}

@end
