@implementation MDPathFilterGenerator

- (MDPathFilterGenerator)initWithDefaultFieldsAndValues:(int *)a3 ignoreFields:(int *)a4 mappedPrefixes:(id)a5 hiddenExtensions:(id)a6 mappedExtensions:(id)a7
{
  MDPathFilterGenerator *v11;
  MDPathFilterGenerator *v12;
  unsigned int v13;
  unint64_t ignoreMask;
  int *v15;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  objc_super v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)MDPathFilterGenerator;
  v11 = -[MDPathFilterGenerator init](&v30, sel_init, a3, a4, a5, a6);
  v12 = v11;
  if (v11)
  {
    if (a4)
    {
      v13 = *a4;
      if (*a4)
      {
        ignoreMask = v11->_ignoreMask;
        v15 = a4 + 1;
        do
        {
          ignoreMask |= ~(-1 << (v13 >> 6)) << v13;
          v16 = *v15++;
          v13 = v16;
        }
        while (v16);
        v11->_ignoreMask = ignoreMask;
      }
    }
    if (a3)
    {
      v17 = *a3;
      if (*a3)
      {
        v18 = v11->_ignoreMask;
        v19 = a3 + 2;
        do
        {
          v20 = ~(-1 << (v17 >> 6));
          v21 = v20 << v17;
          if ((v18 & (v20 << v17)) == 0)
          {
            v22 = v11->_defaultMask | v21;
            v11->_defaultRule |= (*(v19 - 1) & (unint64_t)v20) << (v17 & 0x3F);
            v11->_defaultMask = v22;
            if ((v17 & 0x1000) != 0)
              v11->_inheritMask |= v21;
          }
          v23 = *v19;
          v19 += 2;
          v17 = v23;
        }
        while (v23);
      }
    }
    v11->_namedRoots = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12->_namedRootArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12->_namedRootIndexes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12->_auxValueArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12->_processExtensions = ((unint64_t)a5 | (unint64_t)a7) != 0;
    v24 = objc_alloc(MEMORY[0x1E0C99D80]);
    v25 = (void *)MEMORY[0x1E0C9AA70];
    if (a5)
      v26 = a5;
    else
      v26 = (id)MEMORY[0x1E0C9AA70];
    v12->_namedLinkPrefixesDictionary = (NSDictionary *)objc_msgSend(v24, "initWithDictionary:", v26);
    v27 = objc_alloc(MEMORY[0x1E0C99E08]);
    if (a7)
      v28 = a7;
    else
      v28 = v25;
    v12->_namedLinkExtensionsDictionary = (NSMutableDictionary *)objc_msgSend(v27, "initWithDictionary:", v28);
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)MDPathFilterGenerator;
  -[MDPathFilterGenerator dealloc](&v3, sel_dealloc);
}

- (void)addMappedExtensions:(id)a3
{
  -[NSMutableDictionary addEntriesFromDictionary:](self->_namedLinkExtensionsDictionary, "addEntriesFromDictionary:", a3);
}

- (void)setAtBundleField:(unsigned int)a3 inBundleField:(unsigned int)a4
{
  int8x8_t v4;
  int8x8_t v5;
  uint64x2_t v6;
  uint64x2_t v7;
  uint64x2_t v8;

  v4 = vand_s8((int8x8_t)__PAIR64__(a4, a3), (int8x8_t)0x3F0000003FLL);
  v5 = vand_s8((int8x8_t)vshr_n_u32((uint32x2_t)__PAIR64__(a4, a3), 6uLL), (int8x8_t)0x3F0000003FLL);
  v6.i64[0] = v5.u32[0];
  v6.i64[1] = v5.u32[1];
  v7.i64[0] = -1;
  v7.i64[1] = -1;
  v8 = (uint64x2_t)vmvnq_s8((int8x16_t)vshlq_u64(v7, v6));
  v6.i64[0] = v4.u32[0];
  v6.i64[1] = v4.u32[1];
  *(uint64x2_t *)&self->_atBundleMask = vshlq_u64(v8, v6);
}

- (void)addNamed:(id)a3 field:(int)a4 value:(int)a5 hasAuxValue:(BOOL)a6 auxValue:(unint64_t)a7 forPath:(id)a8 permitLink:(BOOL)a9 copyParentWildcardLink:(BOOL)a10
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v15;
  BOOL v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSMutableDictionary *namedRootIndexes;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSMutableDictionary *v24;
  unsigned int v25;
  uint64_t v26;
  unsigned int v27;
  _BOOL4 v28;

  v10 = a8;
  v28 = a6;
  v11 = *(_QWORD *)&a5;
  v12 = *(_QWORD *)&a4;
  if (!a4 || (self->_ignoreMask & (~(-1 << (a4 >> 6)) << a4)) == 0)
  {
    v15 = objc_msgSend(a8, "hasSuffix:", CFSTR("/*"));
    if ((_DWORD)v15)
      v10 = (id)objc_msgSend(v10, "substringToIndex:", objc_msgSend(v10, "length") - 2);
    if (objc_msgSend(v10, "hasPrefix:", CFSTR("/")))
      v10 = (id)objc_msgSend(v10, "substringFromIndex:", 1);
    v16 = a9;
    v17 = (id)-[NSMutableDictionary objectForKey:](self->_namedRoots, "objectForKey:", a3);
    if (!v17)
    {
      v17 = -[FilterElementDefinition initAsRoot:]([FilterElementDefinition alloc], "initAsRoot:", a3);
      -[NSMutableDictionary setObject:forKey:](self->_namedRoots, "setObject:forKey:", v17, a3);
      v18 = v15;
      v19 = (void *)MEMORY[0x1E0CB37E8];
      v27 = v11;
      namedRootIndexes = self->_namedRootIndexes;
      v21 = -[NSMutableArray count](self->_namedRootArray, "count");
      v22 = v19;
      v15 = v18;
      v16 = a9;
      v23 = objc_msgSend(v22, "numberWithLong:", v21);
      v24 = namedRootIndexes;
      v11 = v27;
      -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v23, a3);
      -[NSMutableArray addObject:](self->_namedRootArray, "addObject:", a3);

    }
    LOBYTE(v26) = a10;
    LOBYTE(v25) = v16;
    objc_msgSend(v17, "addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:", v12, v11, v28, a7, v15, objc_msgSend(v10, "pathComponents"), v25, 0, v26);
    if ((_DWORD)v12 != 196607 && (v12 & 0x1000) != 0)
      self->_inheritMask |= ~(-1 << (v12 >> 6)) << v12;
  }
}

- (void)addNamed:(id)a3 field:(int)a4 value:(int)a5 forPath:(id)a6 permitLink:(BOOL)a7
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  uint64_t v11;
  uint64_t v14;
  id v15;
  unsigned int v16;
  uint64_t v17;

  v7 = *(_QWORD *)&a4;
  v8 = ~(-1 << (a4 >> 6)) << a4;
  if ((self->_ignoreMask & v8) == 0)
  {
    v10 = a6;
    v11 = *(_QWORD *)&a5;
    v14 = objc_msgSend(a6, "hasSuffix:", CFSTR("/*"));
    if ((_DWORD)v14)
      v10 = (id)objc_msgSend(v10, "substringToIndex:", objc_msgSend(v10, "length") - 2);
    if (objc_msgSend(v10, "hasPrefix:", CFSTR("/")))
      v10 = (id)objc_msgSend(v10, "substringFromIndex:", 1);
    v15 = (id)-[NSMutableDictionary objectForKey:](self->_namedRoots, "objectForKey:", a3);
    if (!v15)
    {
      v15 = -[FilterElementDefinition initAsRoot:]([FilterElementDefinition alloc], "initAsRoot:", a3);
      -[NSMutableDictionary setObject:forKey:](self->_namedRoots, "setObject:forKey:", v15, a3);
      -[NSMutableDictionary setObject:forKey:](self->_namedRootIndexes, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[NSMutableArray count](self->_namedRootArray, "count")), a3);
      -[NSMutableArray addObject:](self->_namedRootArray, "addObject:", a3);

    }
    LOBYTE(v17) = 0;
    LOBYTE(v16) = a7;
    objc_msgSend(v15, "addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:", v7, v11, 0, 0, v14, objc_msgSend(v10, "pathComponents"), v16, 0, v17);
    if ((_DWORD)v7 != 196607 && (v7 & 0x1000) != 0)
      self->_inheritMask |= v8;
  }
}

- (void)addNamed:(id)a3 auxValue:(unint64_t)a4 forPath:(id)a5
{
  uint64_t v5;

  ++self->_auxValueCount;
  LOWORD(v5) = 0;
  -[MDPathFilterGenerator addNamed:field:value:hasAuxValue:auxValue:forPath:permitLink:copyParentWildcardLink:](self, "addNamed:field:value:hasAuxValue:auxValue:forPath:permitLink:copyParentWildcardLink:", a3, 0, 0, 1, a4, a5, v5);
}

- (void)addRules:(id *)a3 withPrefix:(id)a4
{
  -[MDPathFilterGenerator addRules:withPrefix:tableMapping:](self, "addRules:withPrefix:tableMapping:", a3, a4, 0);
}

- (void)addRules:(id *)a3 withPrefix:(id)a4 tableMapping:(id)a5
{
  id v6;
  $2D6478D795FC9FC696410A1A0FB14FBC *v7;
  MDPathFilterGenerator *v8;
  id v9;
  id *p_var1;
  uint64_t i;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MDPathFilterGenerator *v15;
  id v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  id var1;
  MDPathFilterGenerator *v25;
  id v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a3->var1)
  {
    v6 = a4;
    v7 = a3;
    v8 = self;
    v9 = 0;
    p_var1 = &a3->var1;
    v25 = self;
    v26 = a4;
    do
    {
      for (i = 0; ; ++i)
      {
        v12 = v7->var0[i];
        if (v12 == 0x1FFFF)
        {
          v9 = *p_var1;
          continue;
        }
        if (v12 == 196607)
        {
          if (!v9)
            -[MDPathFilterGenerator addRules:withPrefix:tableMapping:].cold.2();
          v18 = *p_var1;
          if (a5)
          {
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
            v19 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v29;
              while (2)
              {
                for (j = 0; j != v20; ++j)
                {
                  if (*(_QWORD *)v29 != v21)
                    objc_enumerationMutation(a5);
                  v23 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
                  if (objc_msgSend(v18, "containsString:", v23, v25, v26))
                  {
                    v18 = (id)objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", v23, objc_msgSend(a5, "objectForKeyedSubscript:", v23));
                    goto LABEL_22;
                  }
                }
                v20 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
                if (v20)
                  continue;
                break;
              }
LABEL_22:
              v8 = v25;
              v6 = v26;
            }
          }
          v13 = objc_msgSend(v6, "stringByAppendingPathComponent:", v18, v25, v26);
          v15 = v8;
          v16 = v9;
          v14 = 196607;
          v17 = 0;
          goto LABEL_24;
        }
        if (!v12)
          break;
        if (!v9)
          -[MDPathFilterGenerator addRules:withPrefix:tableMapping:].cold.1();
        v13 = objc_msgSend(v6, "stringByAppendingPathComponent:", *p_var1);
        v14 = HIDWORD(v12);
        v15 = v8;
        v16 = v9;
        v17 = v12;
LABEL_24:
        -[MDPathFilterGenerator addNamed:field:value:forPath:permitLink:](v15, "addNamed:field:value:forPath:permitLink:", v16, v14, v17, v13, 1, v25, v26);
      }
      p_var1 = &v7[1].var1;
      var1 = v7[1].var1;
      ++v7;
    }
    while (var1);
  }
}

- (_MDPlistContainer)copyFilterMDPlistForMountDepth:(int)a3
{
  __int16 v3;
  _MDPlistContainer *Mutable;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSMutableArray *namedRootArray;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t BytePtr;
  __int16 processExtensions;
  unint64_t defaultMask;
  int auxValueCount;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t j;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t k;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  NSDictionary *namedLinkPrefixesDictionary;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t m;
  const void *v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  __int128 v184;
  uint64_t v185;
  __int128 v186;
  uint64_t v187;
  unsigned int v188;
  unsigned __int8 v189;
  _BYTE v190[128];
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  _BYTE v195[128];
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  _BYTE v200[128];
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  _BYTE v205[128];
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  _BYTE v210[128];
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  uint64_t v215;

  v3 = a3;
  v215 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableDictionary count](self->_namedRoots, "count"))
    return 0;
  Mutable = (_MDPlistContainer *)_MDPlistContainerCreateMutable(0, 1);
  _MDPlistContainerBeginContainer((uint64_t)Mutable, 0, v6, v7, v8, v9, v10, v11);
  if (!-[NSMutableDictionary objectForKey:](self->_namedRoots, "objectForKey:", CFSTR("<ROOT>")))
    -[MDPathFilterGenerator copyFilterMDPlistForMountDepth:].cold.1();
  v12 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_namedRootIndexes, "objectForKey:", CFSTR("<ROOT>")), "intValue");
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  _MDPlistContainerBeginDictionary((uint64_t)Mutable, v14, v15, v16, v17, v18, v19, v20);
  _MDPlistContainerAddCString((uint64_t)Mutable, "ROOT_ARRAY", -1, 0, v21, v22, v23, v24);
  _MDPlistContainerBeginArray((uint64_t)Mutable, v25, v26, v27, v28, v29, v30, v31);
  v213 = 0u;
  v214 = 0u;
  v211 = 0u;
  v212 = 0u;
  namedRootArray = self->_namedRootArray;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](namedRootArray, "countByEnumeratingWithState:objects:count:", &v211, v210, 16);
  if (v33)
  {
    v40 = v33;
    v41 = *(_QWORD *)v212;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v212 != v41)
          objc_enumerationMutation(namedRootArray);
        objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_namedRoots, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v211 + 1) + 8 * i)), "encodeInto:auxArray:namedRootMap:", Mutable, v13, self->_namedRootIndexes);
      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](namedRootArray, "countByEnumeratingWithState:objects:count:", &v211, v210, 16);
    }
    while (v40);
  }
  _MDPlistContainerEndArray((uint64_t)Mutable, 0, v34, v35, v36, v37, v38, v39);
  _MDPlistContainerAddCString((uint64_t)Mutable, "COMMON", -1, 0, v43, v44, v45, v46);
  v189 = 0;
  v188 = 0;
  v47 = objc_msgSend(v13, "count");
  _MDPlistContainerAddDataValue((uint64_t)Mutable, 0, 8 * v47 + 48, (uint64_t)&v188, v48, v49, v50, v51);
  v186 = 0uLL;
  v187 = 0;
  _MDPlistReferenceToPlistObject((unint64_t)Mutable, v188 | ((unint64_t)v189 << 32), v52, v53, v54, v55, v56, &v186);
  v184 = v186;
  v185 = v187;
  BytePtr = _MDPlistDataGetBytePtr((uint64_t *)&v184, 0);
  processExtensions = self->_processExtensions;
  defaultMask = self->_defaultMask;
  auxValueCount = self->_auxValueCount;
  v61 = *(_OWORD *)&self->_inheritMask;
  v62 = *(_OWORD *)&self->_atBundleMask;
  *(_WORD *)BytePtr = v3;
  *(_WORD *)(BytePtr + 2) = processExtensions;
  *(_WORD *)(BytePtr + 4) = v12;
  *(_OWORD *)(BytePtr + 6) = v61;
  *(_QWORD *)(BytePtr + 22) = defaultMask;
  *(_OWORD *)(BytePtr + 30) = v62;
  *(_WORD *)(BytePtr + 46) = auxValueCount;
  v208 = 0u;
  v209 = 0u;
  v206 = 0u;
  v207 = 0u;
  v63 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v206, v205, 16);
  if (v63)
  {
    v68 = v63;
    v69 = 0;
    v70 = *(_QWORD *)v207;
    v71 = BytePtr + 48;
    do
    {
      v72 = 0;
      v73 = v69;
      v74 = v71 + 8 * v69;
      do
      {
        if (*(_QWORD *)v207 != v70)
          objc_enumerationMutation(v13);
        *(_QWORD *)(v74 + 8 * v72) = objc_msgSend(*(id *)(*((_QWORD *)&v206 + 1) + 8 * v72), "longLongValue");
        ++v72;
      }
      while (v68 != v72);
      v68 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v206, v205, 16);
      v69 = v73 + v72;
    }
    while (v68);
  }
  _MDPlistContainerAddCString((uint64_t)Mutable, "EXTENSIONS", -1, 0, v64, v65, v66, v67);
  _MDPlistContainerBeginDictionary((uint64_t)Mutable, v75, v76, v77, v78, v79, v80, v81);
  v203 = 0u;
  v204 = 0u;
  v201 = 0u;
  v202 = 0u;
  v82 = (void *)-[NSMutableDictionary allKeys](self->_namedLinkExtensionsDictionary, "allKeys");
  v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v201, v200, 16);
  if (v83)
  {
    v90 = v83;
    v91 = *(_QWORD *)v202;
    do
    {
      for (j = 0; j != v90; ++j)
      {
        if (*(_QWORD *)v202 != v91)
          objc_enumerationMutation(v82);
        v93 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * j);
        if (!objc_msgSend(v93, "hasPrefix:", CFSTR("."))
          || objc_msgSend(v93, "isEqualToString:", CFSTR(".*")))
        {
          v94 = -[NSMutableDictionary objectForKey:](self->_namedLinkExtensionsDictionary, "objectForKey:", v93);
          if (v94)
          {
            v95 = (void *)-[NSMutableDictionary objectForKey:](self->_namedRootIndexes, "objectForKey:", v94);
            if (!v95)
              -[MDPathFilterGenerator copyFilterMDPlistForMountDepth:].cold.4();
            v94 = (objc_msgSend(v95, "intValue") + 1) | 0x40000;
          }
          _MDPlistContainerAddObject((uint64_t)Mutable, v93, 0);
          _MDPlistContainerAddInt32Value((uint64_t)Mutable, v94, 0, v96, v97, v98, v99, v100);
        }
      }
      v90 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v201, v200, 16);
    }
    while (v90);
  }
  _MDPlistContainerEndDictionary((uint64_t)Mutable, 0, v84, v85, v86, v87, v88, v89);
  _MDPlistContainerAddCString((uint64_t)Mutable, "HIDDEN_EXTENSIONS", -1, 0, v101, v102, v103, v104);
  _MDPlistContainerBeginDictionary((uint64_t)Mutable, v105, v106, v107, v108, v109, v110, v111);
  v198 = 0u;
  v199 = 0u;
  v196 = 0u;
  v197 = 0u;
  v112 = (void *)-[NSMutableDictionary allKeys](self->_namedLinkExtensionsDictionary, "allKeys");
  v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v196, v195, 16);
  if (v113)
  {
    v120 = v113;
    v121 = *(_QWORD *)v197;
    do
    {
      for (k = 0; k != v120; ++k)
      {
        if (*(_QWORD *)v197 != v121)
          objc_enumerationMutation(v112);
        v123 = *(void **)(*((_QWORD *)&v196 + 1) + 8 * k);
        if (objc_msgSend(v123, "hasPrefix:", CFSTR("."))
          && (objc_msgSend(v123, "isEqualToString:", CFSTR(".*")) & 1) == 0)
        {
          v124 = -[NSMutableDictionary objectForKey:](self->_namedLinkExtensionsDictionary, "objectForKey:", v123);
          if (v124)
          {
            v125 = (void *)-[NSMutableDictionary objectForKey:](self->_namedRootIndexes, "objectForKey:", v124);
            if (!v125)
              -[MDPathFilterGenerator copyFilterMDPlistForMountDepth:].cold.3();
            v124 = (objc_msgSend(v125, "intValue") + 1) | 0x40000;
          }
          _MDPlistContainerAddObject((uint64_t)Mutable, (const void *)objc_msgSend(v123, "substringFromIndex:", 1), 0);
          _MDPlistContainerAddInt32Value((uint64_t)Mutable, v124, 0, v126, v127, v128, v129, v130);
        }
      }
      v120 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v196, v195, 16);
    }
    while (v120);
  }
  _MDPlistContainerEndDictionary((uint64_t)Mutable, 0, v114, v115, v116, v117, v118, v119);
  _MDPlistContainerAddCString((uint64_t)Mutable, "PREFIXES", -1, 0, v131, v132, v133, v134);
  _MDPlistContainerBeginDictionary((uint64_t)Mutable, v135, v136, v137, v138, v139, v140, v141);
  v193 = 0u;
  v194 = 0u;
  v191 = 0u;
  v192 = 0u;
  namedLinkPrefixesDictionary = self->_namedLinkPrefixesDictionary;
  v143 = -[NSDictionary countByEnumeratingWithState:objects:count:](namedLinkPrefixesDictionary, "countByEnumeratingWithState:objects:count:", &v191, v190, 16);
  if (v143)
  {
    v150 = v143;
    v151 = *(_QWORD *)v192;
    do
    {
      for (m = 0; m != v150; ++m)
      {
        if (*(_QWORD *)v192 != v151)
          objc_enumerationMutation(namedLinkPrefixesDictionary);
        v153 = *(const void **)(*((_QWORD *)&v191 + 1) + 8 * m);
        v154 = (void *)-[NSMutableDictionary objectForKey:](self->_namedRootIndexes, "objectForKey:", -[NSDictionary objectForKey:](self->_namedLinkPrefixesDictionary, "objectForKey:", v153));
        if (!v154)
          -[MDPathFilterGenerator copyFilterMDPlistForMountDepth:].cold.2();
        v155 = (objc_msgSend(v154, "intValue") + 1) | 0x40000;
        _MDPlistContainerAddObject((uint64_t)Mutable, v153, 0);
        _MDPlistContainerAddInt32Value((uint64_t)Mutable, v155, 0, v156, v157, v158, v159, v160);
      }
      v150 = -[NSDictionary countByEnumeratingWithState:objects:count:](namedLinkPrefixesDictionary, "countByEnumeratingWithState:objects:count:", &v191, v190, 16);
    }
    while (v150);
  }
  _MDPlistContainerEndDictionary((uint64_t)Mutable, 0, v144, v145, v146, v147, v148, v149);
  _MDPlistContainerAddCString((uint64_t)Mutable, "IS_DATA_ROSP", 12, 0, v161, v162, v163, v164);
  _MDPlistContainerAddInt32Value((uint64_t)Mutable, 1, 0, v165, v166, v167, v168, v169);
  _MDPlistContainerEndDictionary((uint64_t)Mutable, 0, v170, v171, v172, v173, v174, v175);
  _MDPlistContainerEndContainer((uint64_t)Mutable, v176, v177, v178, v179, v180, v181, v182);

  return Mutable;
}

- (id)filterDataForMountDepth:(int)a3
{
  uint64_t v3;
  void *v5;
  _MDPlistContainer *v6;
  _MDPlistContainer *v7;
  id v8;
  uint64_t Bytes;
  void *v10;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)MEMORY[0x1A1AFF3E0](self, a2);
  v6 = -[MDPathFilterGenerator copyFilterMDPlistForMountDepth:](self, "copyFilterMDPlistForMountDepth:", v3);
  if (v6)
  {
    v7 = v6;
    v8 = objc_alloc(MEMORY[0x1E0C99D50]);
    Bytes = _MDPlistContainerGetBytes((uint64_t)v7);
    v10 = (void *)objc_msgSend(v8, "initWithBytes:length:", Bytes, _MDPlistContainerGetLength((uint64_t)v7));
    CFRelease(v7);
  }
  else
  {
    v10 = 0;
  }
  objc_autoreleasePoolPop(v5);
  return v10;
}

- (void)dump
{
  NSMutableDictionary *namedRoots;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  namedRoots = self->_namedRoots;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](namedRoots, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(namedRoots);
        objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_namedRoots, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)), "dump:", 1);
      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](namedRoots, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v5);
  }
}

- (void)addRules:withPrefix:tableMapping:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

- (void)addRules:withPrefix:tableMapping:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

- (void)copyFilterMDPlistForMountDepth:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

- (void)copyFilterMDPlistForMountDepth:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

- (void)copyFilterMDPlistForMountDepth:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

- (void)copyFilterMDPlistForMountDepth:.cold.4()
{
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

@end
