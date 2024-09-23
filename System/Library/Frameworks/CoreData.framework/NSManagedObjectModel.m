@implementation NSManagedObjectModel

uint64_t __75__NSManagedObjectModel__NSInternalMethods___entityVersionHashesDigestFrom___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (int64_t)_modelsReferenceIDOffset
{
  return objc_msgSend(self->_additionalPrivateIvars[1], "longValue");
}

- (uint64_t)_hasEntityWithUniquenessConstraints
{
  uint64_t v1;
  unsigned int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(_DWORD *)(result + 64);
    if ((v2 & 4) != 0)
    {
      return (v2 >> 3) & 1;
    }
    else
    {
      v9 = 0u;
      v10 = 0u;
      v7 = 0u;
      v8 = 0u;
      v3 = *(void **)(result + 32);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (result)
      {
        v4 = result;
        v5 = *(_QWORD *)v8;
        while (2)
        {
          for (i = 0; i != v4; ++i)
          {
            if (*(_QWORD *)v8 != v5)
              objc_enumerationMutation(v3);
            if (-[NSEntityDescription _hasUniqueProperties](objc_msgSend(*(id *)(v1 + 32), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * i))))
              return 1;
          }
          v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
          result = 0;
          if (v4)
            continue;
          break;
        }
      }
    }
  }
  return result;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  NSArray *v9;
  NSArray *v10;

  if (!a3->var1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = -[NSManagedObjectModel entities](self, "entities");
      a3->var3[3] = 0;
      a3->var3[4] = (unint64_t)v9;
    }
  }
  v10 = (NSArray *)a3->var3[4];
  if (!v10)
    return -[NSMutableDictionary _valueCountByEnumeratingWithState:objects:count:](self->_entities, "_valueCountByEnumeratingWithState:objects:count:", a3, a4, a5);
  if (!a3->var3[3])
    v10 = -[NSManagedObjectModel entities](self, "entities");
  return -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void)_sortedEntitiesForConfiguration:(void *)result
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (result)
  {
    v2 = (void *)objc_msgSend(result, "entitiesForConfiguration:", a2);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:selector:", CFSTR("name"), 1, sel_caseInsensitiveCompare_);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v3, 0);
    v5 = objc_msgSend(v2, "sortedArrayUsingDescriptors:", v4);

    return (void *)v5;
  }
  return result;
}

- (NSArray)entities
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_entities, "allValues");
}

- (id)_entityVersionHashesByNameInStyle:(id)result
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (void *)objc_msgSend(result, "entitiesByName");
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v3);
          v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
          v10 = (void *)MEMORY[0x18D76B4E4]();
          objc_msgSend(v4, "setValue:forKey:", -[NSEntityDescription _versionHashInStyle:]((unint64_t *)objc_msgSend(v3, "objectForKey:", v9), a2), v9);
          objc_autoreleasePoolPop(v10);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    return v4;
  }
  return result;
}

- (NSDictionary)entitiesByName
{
  return &self->_entities->super;
}

- (id)_initWithEntities:(id)a3
{
  NSManagedObjectModel *v5;
  NSManagedObjectModel *v6;
  NSMutableDictionary *v7;
  id *v8;
  objc_super v10;

  objc_opt_class();
  objc_opt_class();
  v10.receiver = self;
  v10.super_class = (Class)NSManagedObjectModel;
  v5 = -[NSManagedObjectModel init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    *(_DWORD *)&v5->_managedObjectModelFlags &= 0xFFFFFFFC;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6->_configurations = 0;
    v6->_fetchRequestTemplates = 0;
    v6->_entities = v7;
    v6->_versionIdentifiers = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    v8 = (id *)PF_CALLOC_OBJECT_ARRAY(3);
    v6->_additionalPrivateIvars = v8;
    *v8 = 0;
    *((_QWORD *)v6->_additionalPrivateIvars + 1) = 0;
    *((_QWORD *)v6->_additionalPrivateIvars + 2) = 0;
    if (a3)
      -[NSManagedObjectModel setEntities:](v6, "setEntities:", a3);
  }
  return v6;
}

- (void)setEntities:(NSArray *)entities
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t j;
  id v13;

  -[NSManagedObjectModel _throwIfNotEditable](self, "_throwIfNotEditable");
  if ((+[_PFRoutines _doNameAndTypeCheck:]((uint64_t)_PFRoutines, entities) & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't add an entity to a managed object model (missing name or bad properties)."), 0));
  v5 = (void *)-[NSMutableDictionary allValues](self->_entities, "allValues");
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      v9 = (void *)objc_msgSend(v5, "objectAtIndex:", i);
      if (-[NSArray indexOfObjectIdenticalTo:](entities, "indexOfObjectIdenticalTo:", v9) == 0x7FFFFFFFFFFFFFFFLL)
        -[NSManagedObjectModel _removeEntity:]((uint64_t)self, v9);
    }
  }
  v10 = -[NSArray count](entities, "count");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
    {
      v13 = -[NSArray objectAtIndex:](entities, "objectAtIndex:", j);
      if (objc_msgSend(v5, "indexOfObjectIdenticalTo:", v13) == 0x7FFFFFFFFFFFFFFFLL)
        -[NSManagedObjectModel _addEntity:](self, "_addEntity:", v13);
    }
  }
}

- (void)_addEntity:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;

  -[NSManagedObjectModel _throwIfNotEditable](self, "_throwIfNotEditable");
  if (a3)
  {
    v5 = objc_msgSend(a3, "name");
    if (v5)
    {
      v6 = v5;
      if (!-[NSMutableDictionary objectForKey:](self->_entities, "objectForKey:", v5))
      {
        -[NSMutableDictionary setObject:forKey:](self->_entities, "setObject:forKey:", a3, v6);
        -[NSEntityDescription _setManagedObjectModel:](a3, (uint64_t)self);
        return;
      }
      v10 = (void *)MEMORY[0x1E0C99DA0];
      v11 = *MEMORY[0x1E0C99768];
      v9 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model already contains an entity named %@."), v6);
      v7 = v10;
      v8 = v11;
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99778];
      v9 = CFSTR("Can't add unnamed entity to model.");
    }
    objc_exception_throw((id)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0));
  }
}

- (void)_throwIfNotEditable
{
  if (!-[NSManagedObjectModel isEditable](self, "isEditable"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't modify an immutable model."), 0));
}

- (BOOL)isEditable
{
  return (*(_BYTE *)&self->_managedObjectModelFlags & 1) == 0;
}

- (NSManagedObjectModel)init
{
  objc_opt_class();
  objc_opt_class();
  return (NSManagedObjectModel *)-[NSManagedObjectModel _initWithEntities:](self, "_initWithEntities:", 0);
}

+ (void)_newModelFromOptimizedEncoding:(uint64_t *)a3 error:
{
  unsigned int *BytePtr;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int v12;
  char *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t *v18;
  uint64_t *v19;
  unsigned int v20;
  uint64_t *v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  unint64_t v32;
  unsigned int v33;
  unint64_t v34;
  unint64_t v35;
  unsigned int v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  unsigned int v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t **v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  const __CFString *v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  unint64_t **v60;
  uint64_t v61;
  id v62;
  void *v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unsigned int v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  void **v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unsigned int v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void **v86;
  NSMutableDictionary **v87;
  Class v88;
  uint64_t v89;
  Class v90;
  NSMutableDictionary **v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  unsigned int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  unsigned int v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t *v111;
  unsigned int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unsigned int v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t v119;
  unsigned int v120;
  uint64_t *v121;
  uint64_t v122;
  void **v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  unsigned int v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  void **v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  unsigned int v135;
  char *v136;
  uint64_t v137;
  void **v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  unsigned int v142;
  char *v143;
  uint64_t v144;
  void **v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  unsigned int v149;
  uint64_t v150;
  void **v151;
  void *v152;
  objc_class *v153;
  int v154;
  unsigned int v155;
  objc_class *v156;
  int v157;
  unsigned int v158;
  objc_class *v159;
  int v160;
  unsigned int v161;
  objc_class *v162;
  int v163;
  unsigned int v164;
  objc_class *v165;
  int v166;
  objc_class *v167;
  int v168;
  objc_class *v169;
  int v170;
  objc_class *v171;
  int v172;
  objc_class *v173;
  int v174;
  unint64_t v175;
  uint64_t v176;
  unint64_t v177;
  unsigned int v178;
  uint64_t v179;
  void **v180;
  void *v181;
  unsigned int v182;
  uint64_t v183;
  void **v184;
  void *v185;
  uint64_t v186;
  void **v187;
  void *v188;
  uint64_t v189;
  void **v190;
  void *v191;
  unsigned int v192;
  uint64_t v193;
  void **v194;
  void *v195;
  unsigned int v196;
  unsigned int v197;
  uint64_t v198;
  unint64_t v199;
  unsigned int v200;
  void *v201;
  uint64_t v202;
  void *v203;
  const __CFString *v204;
  uint64_t v205;
  unint64_t v206;
  unsigned int v207;
  uint64_t v208;
  unint64_t v209;
  unsigned int v210;
  uint64_t v211;
  unint64_t v212;
  unsigned int v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  uint64_t *v218;
  uint64_t **v219;
  id *v221;
  uint64_t *v222;
  id *v223;
  void *v224;
  uint64_t v225;
  void *v226;
  uint64_t v227;
  uint64_t v228;
  unsigned int v229;
  uint64_t v230;
  unint64_t v231;
  unint64_t v232;
  char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  unint64_t v240;
  unint64_t v241;
  unsigned int v242;
  void *v243;
  uint64_t v244;
  uint64_t *v245;
  NSMutableDictionary *v246;
  uint64_t v247;
  uint64_t v248;
  void **v249;
  void *v250;
  uint64_t v251;
  void **v252;
  void *v253;
  void *v254;
  void *v255;
  const __CFString *v256;
  NSManagedObjectModel *v257;
  uint64_t *v258;
  char *v259;
  uint64_t v260;
  void **v261;
  uint64_t v262;
  void *v263;
  void **v264;
  uint64_t v265;
  void *v266;
  _QWORD v267[2];
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  char *v275;
  char *v276;
  uint64_t *v277;
  char *v278;
  uint64_t *v279;
  void *v280;
  NSMutableDictionary **v281;
  uint64_t *v282;
  void **v283;
  void **v284;
  unint64_t **v285;
  unsigned int v286;
  unsigned int v287;
  unsigned int v288;
  unsigned int v289;
  unsigned int v290;
  unint64_t **v291;
  uint64_t v292;
  unint64_t v293;
  unint64_t v294;
  char *v295;
  uint64_t v296;
  uint64_t *v297;
  uint64_t *v298;
  uint64_t *v299;
  uint64_t *v300;
  int v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t *v304;
  char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  char *v309;
  unsigned int v310;
  uint64_t *v311;
  uint64_t v312;
  unsigned int v313;
  uint64_t v314;
  char *v315;
  uint64_t v316;
  unint64_t v317;
  unint64_t v318;
  unint64_t v319;
  uint64_t v320;
  unint64_t v321;
  unint64_t v322;
  unint64_t v323;
  uint64_t v324;
  unint64_t v325;
  unint64_t v326;
  uint64_t v327[2];

  v327[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!a2)
    return;
  objc_opt_class();
  objc_opt_class();
  v327[0] = 0;
  BytePtr = (unsigned int *)CFDataGetBytePtr(a2);
  if ((unint64_t)-[__CFData length](a2, "length") < 0x40)
    return;
  if (!memcmp("momv2$srsraori55717101jhus-[6910aathnnhi86786714[-;uadmiraenv143", BytePtr, 0x40uLL))
  {
    v10 = 13;
  }
  else
  {
    if ((unint64_t)-[__CFData length](a2, "length") < 0x40)
      return;
    if (memcmp("momv2$8129374fj;a30[5yo-]0-87ujuhok'p0907ljnlmmji870-oi43902[349", BytePtr, 0x40uLL))
    {
      if (!a3)
        return;
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0CB28A8];
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = CFSTR("Unknown archive format");
      goto LABEL_31;
    }
    v10 = 12;
  }
  v11 = -[__CFData length](a2, "length");
  if (v11 <= 0x9B)
  {
    if (!a3)
      return;
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB28A8];
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = CFSTR("Corrupted archive: malformed header");
    goto LABEL_31;
  }
  v326 = bswap32(BytePtr[16]);
  v12 = BytePtr[18];
  v13 = (char *)bswap32(v12);
  if (v13 > 0x10000)
    goto LABEL_29;
  LODWORD(v316) = BytePtr[20];
  v14 = bswap32(v316);
  if (v14 > 0x10000)
    goto LABEL_29;
  v15 = BytePtr[21];
  v16 = bswap32(v15);
  if (v16 > 0x10000)
    goto LABEL_29;
  v17 = BytePtr[22];
  v18 = (uint64_t *)bswap32(v17);
  if (v18 > 0x10000)
    goto LABEL_29;
  LODWORD(v315) = BytePtr[23];
  v19 = (uint64_t *)bswap32(v315);
  if (v19 > 0x10000)
    goto LABEL_29;
  v20 = BytePtr[24];
  v21 = (uint64_t *)bswap32(v20);
  if (v21 > 0x10000)
    goto LABEL_29;
  LODWORD(v314) = BytePtr[25];
  v22 = (uint64_t *)bswap32(v314);
  if (v22 > 0x10000)
    goto LABEL_29;
  v23 = v11;
  v24 = BytePtr[27];
  v25 = bswap32(v24);
  if (v25 > 0x10000)
    goto LABEL_29;
  v26 = BytePtr[29];
  v27 = bswap32(v26);
  if (v27 > 0x10000)
    goto LABEL_29;
  v28 = BytePtr[31];
  v29 = bswap32(v28);
  if (v29 > 0x10000
    || (v30 = BytePtr[33], bswap32(v30) > 0x10000)
    || (v31 = BytePtr[35], v32 = bswap32(v31), v32 > 0x10000)
    || (v313 = BytePtr[36], v33 = bswap32(v313), v33 > 0x10000)
    || (v34 = bswap32(BytePtr[37]), v34 > 0x10000)
    || (v35 = bswap32(BytePtr[38]), v35 > 0x10000)
    || (unint64_t)v22 + v33 > v32)
  {
LABEL_29:
    if (!a3)
      return;
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB28A8];
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = CFSTR("Malformed archive: skipping");
LABEL_31:
    *a3 = objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 134060, objc_msgSend(v8, "dictionaryWithObject:forKey:", v9, CFSTR("Root cause")));
    return;
  }
  v290 = v20;
  v291 = (unint64_t **)v10;
  v287 = v31;
  v288 = v12;
  v306 = v27;
  v294 = v34;
  v293 = v35;
  v295 = v13;
  v297 = v22;
  v296 = v32;
  v301 = v24;
  v307 = v25;
  v298 = v21;
  v299 = v19;
  v303 = v14;
  v300 = v18;
  v302 = v16;
  v310 = v28;
  v308 = v29;
  v311 = &v268;
  v289 = BytePtr[17];
  LODWORD(v292) = BytePtr[19];
  LODWORD(v304) = BytePtr[26];
  LODWORD(v305) = BytePtr[28];
  v36 = BytePtr[30];
  v37 = bswap32(BytePtr[32]);
  v286 = BytePtr[34];
  MEMORY[0x1E0C80A78](v24);
  v312 = v40;
  if (v40 > 0x200)
  {
    v41 = (char *)NSAllocateScannedUncollectable();
    v309 = v41;
  }
  else
  {
    v309 = (char *)&v268 - v39;
    bzero((char *)&v268 - v39, 8 * v38);
  }
  v325 = v37;
  v42 = (v37 + 3) & 0x1FFFFFFFCLL;
  v43 = v42 + 4;
  if (v42 + 4 <= v23)
  {
    v44 = bswap32(*(unsigned int *)((char *)BytePtr + v42));
    v325 = v43;
  }
  else
  {
    v44 = 0;
  }
  if (v44 != (_DWORD)v312)
  {
    if (!a3)
      return;
    v53 = (void *)MEMORY[0x1E0CB35C8];
    v54 = *MEMORY[0x1E0CB28A8];
    v55 = (void *)MEMORY[0x1E0C99D80];
    v56 = CFSTR("Corrupted archive: Mismatched entity count");
    goto LABEL_99;
  }
  if (v30)
  {
    v45 = v309;
    v46 = v312;
    while (1)
    {
      v41 = (char *)_readPFEncodedStringFromData((uint64_t)a2, (uint64_t)BytePtr, &v325, v23);
      if (!v41)
        break;
      *v45++ = v41;
      if (!--v46)
        goto LABEL_44;
    }
    if (!a3)
      return;
    v53 = (void *)MEMORY[0x1E0CB35C8];
    v54 = *MEMORY[0x1E0CB28A8];
    v55 = (void *)MEMORY[0x1E0C99D80];
    v56 = CFSTR("Corrupted archive: failed to read property name");
LABEL_99:
    *a3 = objc_msgSend(v53, "errorWithDomain:code:userInfo:", v54, 134060, objc_msgSend(v55, "dictionaryWithObject:forKey:", v56, CFSTR("Root cause")));
    return;
  }
LABEL_44:
  v47 = bswap32(v36);
  v48 = v308;
  MEMORY[0x1E0C80A78](v41);
  v51 = (unint64_t **)((char *)&v268 - v50);
  if (v48 > 0x200)
  {
    v52 = NSAllocateScannedUncollectable();
    v51 = (unint64_t **)v52;
  }
  else
  {
    bzero((char *)&v268 - v50, 8 * v49);
  }
  v324 = v47;
  v57 = (v47 + 3) & 0x1FFFFFFFCLL;
  v58 = v57 + 4;
  if (v57 + 4 <= v23)
  {
    v59 = bswap32(*(unsigned int *)((char *)BytePtr + v57));
    v324 = v58;
  }
  else
  {
    v59 = 0;
  }
  if (v59 != v48)
  {
    if (!a3)
      return;
    v53 = (void *)MEMORY[0x1E0CB35C8];
    v54 = *MEMORY[0x1E0CB28A8];
    v55 = (void *)MEMORY[0x1E0C99D80];
    v56 = CFSTR("Corrupted archive: Mismatched string count");
    goto LABEL_99;
  }
  v285 = v51;
  if (v310)
  {
    v60 = v285;
    v61 = v308;
    while (1)
    {
      v62 = _newReadStringFromBytes((uint64_t)BytePtr, &v324, v23);
      if (!v62)
        break;
      v63 = v62;
      *v60++ = (unint64_t *)objc_msgSend(v62, "mutableCopy");

      if (!--v61)
        goto LABEL_57;
    }
    if (!a3)
      return;
    v53 = (void *)MEMORY[0x1E0CB35C8];
    v54 = *MEMORY[0x1E0CB28A8];
    v55 = (void *)MEMORY[0x1E0C99D80];
    v56 = CFSTR("Corrupted archive: failed to read entity name or warning string");
    goto LABEL_99;
  }
LABEL_57:
  v64 = bswap32(v305);
  v65 = v306;
  MEMORY[0x1E0C80A78](v52);
  if (v65 > 0x200)
  {
    v68 = (char *)NSAllocateScannedUncollectable();
    v305 = v68;
  }
  else
  {
    v305 = (char *)&v268 - v67;
    bzero((char *)&v268 - v67, 8 * v66);
  }
  v69 = v307;
  v323 = v64;
  v70 = (v64 + 3) & 0x1FFFFFFFCLL;
  v71 = v70 + 4;
  if (v70 + 4 <= v23)
  {
    v72 = bswap32(*(unsigned int *)((char *)BytePtr + v70));
    v323 = v71;
  }
  else
  {
    v72 = 0;
  }
  if (v72 != (_DWORD)v65)
  {
    if (!a3)
      return;
    v53 = (void *)MEMORY[0x1E0CB35C8];
    v54 = *MEMORY[0x1E0CB28A8];
    v55 = (void *)MEMORY[0x1E0C99D80];
    v56 = CFSTR("Corrupted archive: Mismatched data count");
    goto LABEL_99;
  }
  if (v26)
  {
    v73 = v305;
    v74 = v65;
    while (1)
    {
      v68 = (char *)_readPFEncodedDataFromData((uint64_t)a2, (uint64_t)BytePtr, &v323, v23);
      if (!v68)
        break;
      *v73++ = v68;
      if (!--v74)
        goto LABEL_72;
    }
    if (!a3)
      return;
    v53 = (void *)MEMORY[0x1E0CB35C8];
    v54 = *MEMORY[0x1E0CB28A8];
    v55 = (void *)MEMORY[0x1E0C99D80];
    v56 = CFSTR("Corrupted archive: failed to read data");
    goto LABEL_99;
  }
LABEL_72:
  v75 = MEMORY[0x1E0C80A78](v68);
  v77 = (void **)((char *)&v268 - (((unint64_t)v76 + 15) & 0xFFFFFFFF0));
  v322 = v78;
  v79 = (v78 + 3) & 0x1FFFFFFFCLL;
  v80 = v79 + 4;
  if (v79 + 4 <= v23)
  {
    v81 = bswap32(*(unsigned int *)((char *)BytePtr + v79));
    v322 = v80;
  }
  else
  {
    v81 = 0;
  }
  if (v81 != (_DWORD)v69)
  {
    if (!a3)
      return;
    v53 = (void *)MEMORY[0x1E0CB35C8];
    v54 = *MEMORY[0x1E0CB28A8];
    v55 = (void *)MEMORY[0x1E0C99D80];
    v56 = CFSTR("Corrupted archive: Mismatched strategy count");
    goto LABEL_99;
  }
  if (!v301)
  {
    MEMORY[0x1E0C80A78](v75);
    v91 = (NSMutableDictionary **)((char *)&v268 - ((v92 + 15) & 0xFFFFFFFF0));
    v90 = NSClassFromString((NSString *)CFSTR("NSKnownKeysDictionary2"));
    goto LABEL_92;
  }
  v304 = v76;
  v82 = (uint64_t *)((char *)&v268 - (((unint64_t)v76 + 15) & 0xFFFFFFFF0));
  v83 = v69;
  do
  {
    v84 = _newReadKKDMappingStrategyFromByes((uint64_t)a2, (uint64_t)BytePtr, &v322, v23, (uint64_t)v309);
    if (!v84)
    {
      if (!a3)
        return;
      v53 = (void *)MEMORY[0x1E0CB35C8];
      v54 = *MEMORY[0x1E0CB28A8];
      v55 = (void *)MEMORY[0x1E0C99D80];
      v56 = CFSTR("Corrupted archive: failed to read kkd strategy");
      goto LABEL_99;
    }
    *v82++ = v84;
    --v83;
  }
  while (v83);
  MEMORY[0x1E0C80A78](v84);
  v86 = v77;
  v87 = (NSMutableDictionary **)((char *)&v268 - ((v85 + 15) & 0xFFFFFFFF0));
  v88 = NSClassFromString((NSString *)CFSTR("NSKnownKeysDictionary2"));
  v89 = 0;
  do
  {
    v90 = (Class)-[objc_class newInstanceWithSearchStrategy:inData:](v88, "newInstanceWithSearchStrategy:inData:", v86[v89], a2);
    v87[v89++] = (NSMutableDictionary *)v90;
  }
  while (v307 != v89);
  v91 = v87;
  v77 = v86;
LABEL_92:
  MEMORY[0x1E0C80A78](v90);
  v95 = (char *)&v268 - v94;
  v284 = v77;
  if (v96 >= 0x1FF)
  {
    v97 = NSAllocateScannedUncollectable();
    v95 = (char *)v97;
    if (!v97)
    {
      if (a3)
        *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to allocate properties buffer"), CFSTR("Root cause")));
      if (v310)
      {
        v122 = v308;
        v123 = (void **)v285;
        do
        {
          v124 = *v123++;

          --v122;
        }
        while (v122);
      }
      return;
    }
  }
  else
  {
    bzero((char *)&v268 - v94, 8 * v93);
  }
  MEMORY[0x1E0C80A78](v97);
  v100 = (uint64_t *)((char *)&v268 - v99);
  if (v101 > 0x1FE)
  {
    v102 = NSAllocateScannedUncollectable();
    v100 = (uint64_t *)v102;
    if (!v102)
    {
      if (a3)
        *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to allocate attributes buffer"), CFSTR("Root cause")));
      if (v303 >= 0x1FF)
        NSZoneFree(0, v95);
      if (v310)
      {
        v130 = v308;
        v131 = (void **)v285;
        do
        {
          v132 = *v131++;

          --v130;
        }
        while (v130);
      }
      return;
    }
  }
  else
  {
    bzero((char *)&v268 - v99, 8 * v98);
  }
  v103 = MEMORY[0x1E0C80A78](v102);
  v283 = (void **)v267;
  v267[0] = 0;
  v267[1] = 0;
  MEMORY[0x1E0C80A78](v103);
  v106 = (char *)&v268 - v105;
  v281 = v91;
  if (v107 > 0x1FE)
  {
    v108 = NSAllocateScannedUncollectable();
    v106 = (char *)v108;
    if (!v108)
    {
      if (a3)
        *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to allocate derived attributes buffer"), CFSTR("Root cause")));
      if (v302 >= 0x1FF)
        NSZoneFree(0, v100);
      if (v303 >= 0x1FF)
        NSZoneFree(0, v95);
      if (v310)
      {
        v137 = v308;
        v138 = (void **)v285;
        do
        {
          v139 = *v138++;

          --v137;
        }
        while (v137);
      }
      return;
    }
  }
  else
  {
    bzero((char *)&v268 - v105, 8 * v104);
  }
  MEMORY[0x1E0C80A78](v108);
  v111 = (uint64_t *)((char *)&v268 - v110);
  if (v112 > 0x1FE)
  {
    v113 = NSAllocateScannedUncollectable();
    v111 = (uint64_t *)v113;
    if (!v113)
    {
      if (a3)
        *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to allocate relationships buffer"), CFSTR("Root cause")));
      if (v300 >= 0x1FF)
        NSZoneFree(0, v106);
      if (v302 >= 0x1FF)
        NSZoneFree(0, v100);
      if (v303 >= 0x1FF)
        NSZoneFree(0, v95);
      if (v310)
      {
        v144 = v308;
        v145 = (void **)v285;
        do
        {
          v146 = *v145++;

          --v144;
        }
        while (v144);
      }
      return;
    }
  }
  else
  {
    bzero((char *)&v268 - v110, 8 * v109);
  }
  v282 = v111;
  v304 = (uint64_t *)v106;
  v280 = v95;
  MEMORY[0x1E0C80A78](v113);
  if (v116 > 0x1FE)
  {
    v117 = (uint64_t *)NSAllocateScannedUncollectable();
    v279 = v117;
    if (!v117)
    {
      if (a3)
        *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to allocate expressions buffer"), CFSTR("Root cause")));
      if (v299 >= 0x1FF)
        NSZoneFree(0, v282);
      if (v300 >= 0x1FF)
        NSZoneFree(0, v304);
      if (v302 >= 0x1FF)
        NSZoneFree(0, v100);
      if (v303 >= 0x1FF)
        NSZoneFree(0, v280);
      if (v310)
      {
        v150 = v308;
        v151 = (void **)v285;
        do
        {
          v152 = *v151++;

          --v150;
        }
        while (v150);
      }
      return;
    }
  }
  else
  {
    v279 = (uint64_t *)((char *)&v268 - v115);
    bzero((char *)&v268 - v115, 8 * v114);
  }
  MEMORY[0x1E0C80A78](v117);
  if (v120 > 0x1FE)
  {
    v121 = (uint64_t *)NSAllocateScannedUncollectable();
    v277 = v121;
    if (!v121)
    {
      if (a3)
        *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to allocate fetched properties buffer"), CFSTR("Root cause")));
      if (v298 >= 0x1FF)
        NSZoneFree(0, v279);
      if (v299 >= 0x1FF)
        NSZoneFree(0, v282);
      if (v300 >= 0x1FF)
        NSZoneFree(0, v304);
      if (v302 >= 0x1FF)
        NSZoneFree(0, v100);
      if (v303 >= 0x1FF)
        NSZoneFree(0, v280);
      if (v310)
      {
        v179 = v308;
        v180 = (void **)v285;
        do
        {
          v181 = *v180++;

          --v179;
        }
        while (v179);
      }
      return;
    }
  }
  else
  {
    v277 = (uint64_t *)((char *)&v268 - v119);
    bzero((char *)&v268 - v119, 8 * v118);
  }
  MEMORY[0x1E0C80A78](v121);
  if (v127 > 0x1FE)
  {
    v129 = NSAllocateScannedUncollectable();
    v128 = (char *)v129;
    if (!v129)
    {
      if (a3)
        *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to allocate fetch requests buffer"), CFSTR("Root cause")));
      if (v297 >= 0x1FF)
        NSZoneFree(0, v277);
      if (v298 >= 0x1FF)
        NSZoneFree(0, v279);
      if (v299 >= 0x1FF)
        NSZoneFree(0, v282);
      if (v300 >= 0x1FF)
        NSZoneFree(0, v304);
      if (v302 >= 0x1FF)
        NSZoneFree(0, v100);
      if (v303 >= 0x1FF)
        NSZoneFree(0, v280);
      if (v310)
      {
        v183 = v308;
        v184 = (void **)v285;
        do
        {
          v185 = *v184++;

          --v183;
        }
        while (v183);
      }
      return;
    }
  }
  else
  {
    v128 = (char *)&v268 - v126;
    bzero((char *)&v268 - v126, 8 * v125);
  }
  MEMORY[0x1E0C80A78](v129);
  v278 = (char *)&v268 - v134;
  if (v135 > 0x1FE)
  {
    v136 = (char *)NSAllocateScannedUncollectable();
    v278 = v136;
    if (!v136)
    {
      if (a3)
        *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to allocate entities buffer"), CFSTR("Root cause")));
      if (v296 >= 0x1FF)
        NSZoneFree(0, v128);
      if (v297 >= 0x1FF)
        NSZoneFree(0, v277);
      if (v298 >= 0x1FF)
        NSZoneFree(0, v279);
      if (v299 >= 0x1FF)
        NSZoneFree(0, v282);
      if (v300 >= 0x1FF)
        NSZoneFree(0, v304);
      if (v302 >= 0x1FF)
        NSZoneFree(0, v100);
      if (v303 >= 0x1FF)
        NSZoneFree(0, v280);
      if (v310)
      {
        v186 = v308;
        v187 = (void **)v285;
        do
        {
          v188 = *v187++;

          --v186;
        }
        while (v186);
      }
      return;
    }
  }
  else
  {
    bzero(v278, 8 * v133);
  }
  MEMORY[0x1E0C80A78](v136);
  v276 = (char *)&v268 - v141;
  if (v142 > 0x1FE)
  {
    v143 = (char *)NSAllocateScannedUncollectable();
    v276 = v143;
    if (!v143)
    {
      if (a3)
        *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to allocate fetchIndexes buffer"), CFSTR("Root cause")));
      if (v295 >= 0x1FF)
        NSZoneFree(0, v278);
      if (v296 >= 0x1FF)
        NSZoneFree(0, v128);
      if (v297 >= 0x1FF)
        NSZoneFree(0, v277);
      if (v298 >= 0x1FF)
        NSZoneFree(0, v279);
      if (v299 >= 0x1FF)
        NSZoneFree(0, v282);
      if (v300 >= 0x1FF)
        NSZoneFree(0, v304);
      if (v302 >= 0x1FF)
        NSZoneFree(0, v100);
      if (v303 >= 0x1FF)
        NSZoneFree(0, v280);
      if (v310)
      {
        v189 = v308;
        v190 = (void **)v285;
        do
        {
          v191 = *v190++;

          --v189;
        }
        while (v189);
      }
      return;
    }
  }
  else
  {
    bzero(v276, 8 * v140);
  }
  MEMORY[0x1E0C80A78](v143);
  v275 = (char *)&v268 - v148;
  if (v149 > 0x1FE)
  {
    v275 = (char *)NSAllocateScannedUncollectable();
    if (!v275)
    {
      if (a3)
        *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to allocate entities buffer"), CFSTR("Root cause")));
      if (v294 >= 0x1FF)
        NSZoneFree(0, v276);
      if (v295 >= 0x1FF)
        NSZoneFree(0, v278);
      if (v296 >= 0x1FF)
        NSZoneFree(0, v128);
      if (v297 >= 0x1FF)
        NSZoneFree(0, v277);
      if (v298 >= 0x1FF)
        NSZoneFree(0, v279);
      if (v299 >= 0x1FF)
        NSZoneFree(0, v282);
      if (v300 >= 0x1FF)
        NSZoneFree(0, v304);
      if (v302 >= 0x1FF)
        NSZoneFree(0, v100);
      if (v303 >= 0x1FF)
        NSZoneFree(0, v280);
      if (v310)
      {
        v193 = v308;
        v194 = (void **)v285;
        do
        {
          v195 = *v194++;

          --v193;
        }
        while (v193);
      }
      return;
    }
  }
  else
  {
    bzero(v275, 8 * v147);
  }
  v153 = (objc_class *)objc_opt_class();
  v154 = v302;
  v155 = _PFAllocateObjects(v153, (void **)v100, v302, 0);
  if (v155 != v154)
  {
    v182 = v155;
    if (a3)
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to create attributes"), CFSTR("Root cause")));
    goto LABEL_451;
  }
  objc_opt_class();
  v156 = (objc_class *)objc_opt_class();
  v157 = (int)v300;
  v158 = _PFAllocateObjects(v156, (void **)v304, v300, 0);
  if (v158 != v157)
  {
    v192 = v158;
    if (a3)
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to create derived attributes"), CFSTR("Root cause")));
    goto LABEL_448;
  }
  v159 = (objc_class *)objc_opt_class();
  v160 = (int)v299;
  v161 = _PFAllocateObjects(v159, (void **)v282, v299, 0);
  if (v161 != v160)
  {
    v196 = v161;
    if (a3)
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to create relationships"), CFSTR("Root cause")));
    goto LABEL_445;
  }
  v162 = (objc_class *)objc_opt_class();
  v163 = (int)v298;
  v164 = _PFAllocateObjects(v162, (void **)v279, v298, 0);
  if (v164 != v163)
  {
    v197 = v164;
    if (a3)
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to create expressions"), CFSTR("Root cause")));
    goto LABEL_442;
  }
  v165 = (objc_class *)objc_opt_class();
  v166 = (int)v297;
  LODWORD(v274) = _PFAllocateObjects(v165, (void **)v277, v297, 0);
  if ((_DWORD)v274 != v166)
  {
    if (a3)
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to create fetched properties"), CFSTR("Root cause")));
    goto LABEL_439;
  }
  v167 = (objc_class *)objc_opt_class();
  v168 = v296;
  LODWORD(v274) = _PFAllocateObjects(v167, (void **)v128, v296, 0);
  if ((_DWORD)v274 != v168)
  {
    if (a3)
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to create fetch requests"), CFSTR("Root cause")));
    goto LABEL_436;
  }
  v169 = (objc_class *)objc_opt_class();
  v170 = (int)v295;
  LODWORD(v274) = _PFAllocateObjects(v169, (void **)v278, v295, 0);
  if ((_DWORD)v274 != v170)
  {
    if (a3)
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to create entities"), CFSTR("Root cause")));
    goto LABEL_433;
  }
  v171 = (objc_class *)objc_opt_class();
  v172 = v294;
  LODWORD(v274) = _PFAllocateObjects(v171, (void **)v276, v294, 0);
  if ((_DWORD)v274 != v172)
  {
    if (a3)
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to create fetchIndexDescriptions"), CFSTR("Root cause")));
    goto LABEL_430;
  }
  v173 = (objc_class *)objc_opt_class();
  v174 = v293;
  LODWORD(v274) = _PFAllocateObjects(v173, (void **)v275, v293, 0);
  if ((_DWORD)v274 != v174)
  {
    if (a3)
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Allocation failure: unable to create fetchIndexElementDescriptions"), CFSTR("Root cause")));
    goto LABEL_427;
  }
  v175 = bswap32(v292);
  v321 = v175;
  v176 = (v175 + 3) & 0x1FFFFFFFCLL;
  v177 = v176 + 4;
  if (v176 + 4 <= v23)
  {
    v178 = bswap32(*(unsigned int *)((char *)BytePtr + v176));
    v321 = v177;
    v175 = v177;
  }
  else
  {
    v178 = 0;
  }
  if (v178 != (_DWORD)v302)
  {
    if (a3)
    {
      v201 = (void *)MEMORY[0x1E0CB35C8];
      v202 = *MEMORY[0x1E0CB28A8];
      v203 = (void *)MEMORY[0x1E0C99D80];
      v204 = CFSTR("Corrupt archive: mismatch between header and contents for attribute count");
      goto LABEL_422;
    }
    goto LABEL_424;
  }
  v198 = (v175 + 3) & 0x7FFFFFFFCLL;
  v199 = v198 + 4;
  if (v198 + 4 <= v23)
  {
    v200 = bswap32(*(unsigned int *)((char *)BytePtr + v198));
    v321 = v199;
    v175 = v199;
  }
  else
  {
    v200 = 0;
  }
  if (v200 != (_DWORD)v300)
  {
    if (a3)
    {
      v201 = (void *)MEMORY[0x1E0CB35C8];
      v202 = *MEMORY[0x1E0CB28A8];
      v203 = (void *)MEMORY[0x1E0C99D80];
      v204 = CFSTR("Corrupt archive: mismatch between header and contents for derived attribute count");
      goto LABEL_422;
    }
    goto LABEL_424;
  }
  v205 = (v175 + 3) & 0x1FFFFFFFFCLL;
  v206 = v205 + 4;
  if (v205 + 4 <= v23)
  {
    v207 = bswap32(*(unsigned int *)((char *)BytePtr + v205));
    v321 = v206;
    v175 = v206;
  }
  else
  {
    v207 = 0;
  }
  if (v207 != (_DWORD)v299)
  {
    if (a3)
    {
      v201 = (void *)MEMORY[0x1E0CB35C8];
      v202 = *MEMORY[0x1E0CB28A8];
      v203 = (void *)MEMORY[0x1E0C99D80];
      v204 = CFSTR("Corrupt archive: mismatch between header and contents for relationship count");
      goto LABEL_422;
    }
    goto LABEL_424;
  }
  v208 = (v175 + 3) & 0x7FFFFFFFFCLL;
  v209 = v208 + 4;
  if (v208 + 4 <= v23)
  {
    v210 = bswap32(*(unsigned int *)((char *)BytePtr + v208));
    v321 = v209;
    v175 = v209;
  }
  else
  {
    v210 = 0;
  }
  if (v210 != (_DWORD)v298)
  {
    if (a3)
    {
      v201 = (void *)MEMORY[0x1E0CB35C8];
      v202 = *MEMORY[0x1E0CB28A8];
      v203 = (void *)MEMORY[0x1E0C99D80];
      v204 = CFSTR("Corrupt archive: mismatch between header and contents for expression count");
      goto LABEL_422;
    }
    goto LABEL_424;
  }
  v211 = (v175 + 3) & 0x1FFFFFFFFFCLL;
  v212 = v211 + 4;
  if (v211 + 4 <= v23)
  {
    v213 = bswap32(*(unsigned int *)((char *)BytePtr + v211));
    v321 = v212;
  }
  else
  {
    v213 = 0;
  }
  if (v213 != (_DWORD)v297)
  {
    if (a3)
    {
      v201 = (void *)MEMORY[0x1E0CB35C8];
      v202 = *MEMORY[0x1E0CB28A8];
      v203 = (void *)MEMORY[0x1E0C99D80];
      v204 = CFSTR("Corrupt archive: mismatch between header and contents for fetched properties count");
      goto LABEL_422;
    }
    goto LABEL_424;
  }
  if (v15)
    v292 = *v100;
  else
    v292 = 0;
  if (v17)
    v274 = *v304;
  else
    v274 = 0;
  if ((_DWORD)v315)
    v273 = *v282;
  else
    v273 = 0;
  if (v290)
    v272 = *v279;
  else
    v272 = 0;
  if ((_DWORD)v314)
    v314 = *v277;
  else
    v314 = 0;
  if ((_DWORD)v316)
  {
    v214 = 0;
    v268 = 0;
    v269 = 0;
    v270 = 0;
    v271 = 0;
    v316 = 0;
    v215 = 0;
    v216 = 0;
    do
    {
      v217 = (void *)_readPropertyIntoShellFromBytes((uint64_t)a2, (uint64_t)BytePtr, &v321, v23, (uint64_t)v278, (uint64_t)v280, (uint64_t)v128, v292, v274, v316, v273, v272, v314, (uint64_t)v309, (uint64_t)v285, (uint64_t)v305, (unint64_t)v291, (unint64_t *)v327);
      if (!v217)
      {
        if (!a3)
          goto LABEL_424;
        v230 = v327[0];
        if (v327[0])
          goto LABEL_386;
        v201 = (void *)MEMORY[0x1E0CB35C8];
        v202 = *MEMORY[0x1E0CB28A8];
        v254 = (void *)MEMORY[0x1E0C99D80];
        v255 = (void *)MEMORY[0x1E0CB3940];
        v267[0] = v214;
        v256 = CFSTR("Corrupt archive: unable to read property at index: %lu");
        goto LABEL_464;
      }
      *((_QWORD *)v280 + v214) = v217;
      if ((void *)v100[v216] == v217)
      {
        if (++v216 != v302)
        {
          v218 = (uint64_t *)v100[v216];
          v219 = (uint64_t **)&v324;
          goto LABEL_373;
        }
        v292 = 0;
        v216 = v302;
      }
      else
      {
        if (v283[v215] == v217)
        {
          if (__CFADD__(v215++, 1))
          {
            v215 = 0;
            v316 = 0;
          }
          else
          {
            v316 = (uint64_t)v283[v215];
          }
          goto LABEL_374;
        }
        if ((void *)v304[v271] == v217)
        {
          if ((uint64_t *)++v271 == v300)
          {
            v274 = 0;
            v218 = v300;
            v219 = (uint64_t **)&v305;
          }
          else
          {
            v218 = (uint64_t *)v304[v271];
            v219 = (uint64_t **)&v308;
          }
          goto LABEL_373;
        }
        if ((void *)v282[v270] == v217)
        {
          if ((uint64_t *)++v270 == v299)
          {
            v273 = 0;
            v218 = v299;
            v219 = &v304;
          }
          else
          {
            v218 = (uint64_t *)v282[v270];
            v219 = (uint64_t **)&v307;
          }
          goto LABEL_373;
        }
        if ((void *)v279[v269] == v217)
        {
          if ((uint64_t *)++v269 == v298)
          {
            v272 = 0;
            v218 = v298;
            v219 = (uint64_t **)&v303;
          }
          else
          {
            v218 = (uint64_t *)v279[v269];
            v219 = (uint64_t **)&v306;
          }
          goto LABEL_373;
        }
        if ((uint64_t *)++v268 == v297)
        {
          v314 = 0;
          v218 = v297;
          v219 = (uint64_t **)&v302;
LABEL_373:
          *(v219 - 32) = v218;
          goto LABEL_374;
        }
        v314 = v277[v268];
      }
LABEL_374:
      ++v214;
    }
    while (v303 != v214);
  }
  v316 = objc_opt_class();
  if (!(_DWORD)v315)
  {
LABEL_382:
    v320 = bswap32(v289);
    v227 = (v320 + 3) & 0x1FFFFFFFCLL;
    v228 = v227 + 4;
    if (v227 + 4 <= v23)
    {
      v229 = bswap32(*(unsigned int *)((char *)BytePtr + v227));
      v320 = v228;
    }
    else
    {
      v229 = 0;
    }
    if (v229 != (_DWORD)v295)
    {
      if (a3)
      {
        v201 = (void *)MEMORY[0x1E0CB35C8];
        v202 = *MEMORY[0x1E0CB28A8];
        v203 = (void *)MEMORY[0x1E0C99D80];
        v204 = CFSTR("Corrupt archive: mismatch between header and contents for entity count");
        goto LABEL_422;
      }
      goto LABEL_424;
    }
    if (v288)
    {
      v316 = 0;
      v231 = 0;
      v232 = 0;
      v233 = v275;
      v315 = v276;
      while (1)
      {
        v319 = v294 - v232;
        v318 = v293 - v231;
        if ((_readEntityIntoShellFromData(a2, (uint64_t)BytePtr, &v320, v23, *(_QWORD *)&v278[8 * v316], (uint64_t)v281, (uint64_t)v280, (uint64_t)v315, &v319, (uint64_t)v233, &v318, (uint64_t)v309, v285, (uint64_t)v305, (uint64_t)v278, (uint64_t)v284, v291, v327) & 1) == 0)break;
        v232 += v319;
        if (v232 > v294 || (v231 += v318, v231 > v293))
        {
          _NSCoreDataLog(1, (uint64_t)CFSTR("Bad: decoding optimized model smashed memory. Bailing."), v234, v235, v236, v237, v238, v239, v268);
          __break(1u);
          return;
        }
        v315 += 8 * v319;
        v233 += 8 * v318;
        if (v295 == (char *)++v316)
          goto LABEL_395;
      }
      if (!a3)
        goto LABEL_424;
      v247 = v327[0];
      if (!v327[0])
      {
        v201 = (void *)MEMORY[0x1E0CB35C8];
        v202 = *MEMORY[0x1E0CB28A8];
        v254 = (void *)MEMORY[0x1E0C99D80];
        v255 = (void *)MEMORY[0x1E0CB3940];
        v267[0] = v316;
        v256 = CFSTR("Corrupt archive: unable to read entity at index: %lu");
        goto LABEL_464;
      }
    }
    else
    {
LABEL_395:
      v317 = bswap32(v286);
      v240 = (v317 + 3) & 0x1FFFFFFFCLL;
      v241 = v240 + 4;
      if (v240 + 4 <= v23)
      {
        v242 = bswap32(*(unsigned int *)((char *)BytePtr + v240));
        v317 = v241;
      }
      else
      {
        v242 = 0;
      }
      if (v242 == (_DWORD)v296)
      {
        if (!v287)
        {
LABEL_407:
          if (v302 >= 0x1FF)
            NSZoneFree(0, v100);
          if (v299 >= 0x1FF)
            NSZoneFree(0, v282);
          if (v297 >= 0x1FF)
            NSZoneFree(0, v277);
          if (v290)
          {
            v245 = 0;
            do
            {

              v245 = (uint64_t *)((char *)v245 + 1);
            }
            while (v298 != v245);
            if (v298 >= 0x1FF)
              NSZoneFree(0, v279);
          }
          if (v313)
            v246 = v281[1];
          else
            v246 = 0;
          v257 = _newReadModelFromBytes((_PFVMData *)a2, (uint64_t)BytePtr, &v326, v23, *v281, v246, (uint64_t)v278, (uint64_t)v128, (uint64_t)v309, (uint64_t)v305);
          if (v257 && v288)
          {
            v258 = (uint64_t *)v278;
            v259 = v295;
            do
            {
              v260 = *v258++;
              *(_QWORD *)(v260 + 40) = v257;
              --v259;
            }
            while (v259);
          }
          if (v310)
          {
            v261 = (void **)v285;
            v262 = v308;
            do
            {
              v263 = *v261++;

              --v262;
            }
            while (v262);
          }
          if (v287)
          {
            v264 = (void **)v128;
            v265 = v296;
            do
            {
              v266 = *v264++;

              --v265;
            }
            while (v265);
          }
          if (v295 >= 0x1FF)
            NSZoneFree(0, v278);
          if (v303 >= 0x1FF)
            NSZoneFree(0, v280);
          if (v296 >= 0x1FF)
            NSZoneFree(0, v128);
          if (v312 >= 0x201)
            NSZoneFree(0, v309);
          if (v306 >= 0x201)
            NSZoneFree(0, v305);
          if (v308 >= 0x201)
            NSZoneFree(0, v285);
          if (v293 >= 0x1FF)
            NSZoneFree(0, v275);
          return;
        }
        v244 = 0;
        while ((_readFetchRequestIntoShellFromData(a2, (uint64_t)BytePtr, &v317, v23, *(_QWORD *)&v128[8 * v244], (uint64_t)v281, (uint64_t)v280, (uint64_t)v309, (uint64_t)v285, (uint64_t)v305, (uint64_t)v278, (uint64_t)v284, (uint64_t)v291, v327) & 1) != 0)
        {
          if (v296 == ++v244)
            goto LABEL_407;
        }
        if (!a3)
          goto LABEL_424;
        v230 = v327[0];
        if (v327[0])
        {
LABEL_386:
          *a3 = v230;
          goto LABEL_424;
        }
        v201 = (void *)MEMORY[0x1E0CB35C8];
        v202 = *MEMORY[0x1E0CB28A8];
        v254 = (void *)MEMORY[0x1E0C99D80];
        v255 = (void *)MEMORY[0x1E0CB3940];
        v267[0] = v244;
        v256 = CFSTR("Corrupt archive: unable to read fetch request at index: %lu");
LABEL_464:
        v204 = (const __CFString *)objc_msgSend(v255, "stringWithFormat:", v256, v267[0]);
        v203 = v254;
      }
      else
      {
        if (!a3)
          goto LABEL_424;
        v201 = (void *)MEMORY[0x1E0CB35C8];
        v202 = *MEMORY[0x1E0CB28A8];
        v203 = (void *)MEMORY[0x1E0C99D80];
        v204 = CFSTR("Corrupt archive: mismatch between header and contents for fetch request count");
      }
LABEL_422:
      v247 = objc_msgSend(v201, "errorWithDomain:code:userInfo:", v202, 134060, objc_msgSend(v203, "dictionaryWithObject:forKey:", v204, CFSTR("Root cause"), v268));
    }
    *a3 = v247;
    goto LABEL_424;
  }
  v221 = (id *)v282;
  v222 = v299;
  while (1)
  {
    v223 = (id *)*v221;
    v224 = (void *)objc_msgSend(*v221, "inverseRelationship", v268);
    if (v224)
      break;
LABEL_381:
    ++v221;
    v222 = (uint64_t *)((char *)v222 - 1);
    if (!v222)
      goto LABEL_382;
  }
  v225 = objc_msgSend(v224, "unsignedIntegerValue");
  v226 = (void *)*((_QWORD *)v280 + v225);
  if (objc_opt_class() == v316)
  {
    if (v223)
    {

      v223[14] = v226;
    }
    goto LABEL_381;
  }
  if (a3)
  {
    v201 = (void *)MEMORY[0x1E0CB35C8];
    v202 = *MEMORY[0x1E0CB28A8];
    v243 = (void *)MEMORY[0x1E0C99D80];
    v204 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Corrupt archive: relationship with name (%@) has bad inverse index %@"), objc_msgSend(v223, "name"), v226);
    v203 = v243;
    goto LABEL_422;
  }
LABEL_424:
  if (v303 >= 0x1FF)
    NSZoneFree(0, v280);
  LODWORD(v274) = v293;
LABEL_427:
  _PFDeallocateObjects((void **)v275, v274);
  if (v293 >= 0x1FF)
    NSZoneFree(0, v275);
  LODWORD(v274) = v294;
LABEL_430:
  _PFDeallocateObjects((void **)v276, v274);
  if (v294 >= 0x1FF)
    NSZoneFree(0, v276);
  LODWORD(v274) = (_DWORD)v295;
LABEL_433:
  _PFDeallocateObjects((void **)v278, v274);
  if (v295 >= 0x1FF)
    NSZoneFree(0, v278);
  LODWORD(v274) = v296;
LABEL_436:
  _PFDeallocateObjects((void **)v128, v274);
  if (v296 >= 0x1FF)
    NSZoneFree(0, v128);
  LODWORD(v274) = (_DWORD)v297;
LABEL_439:
  _PFDeallocateObjects((void **)v277, v274);
  if (v297 >= 0x1FF)
    NSZoneFree(0, v277);
  v197 = v298;
LABEL_442:
  _PFDeallocateObjects((void **)v279, v197);
  if (v298 >= 0x1FF)
    NSZoneFree(0, v279);
  v196 = v299;
LABEL_445:
  _PFDeallocateObjects((void **)v282, v196);
  if (v299 >= 0x1FF)
    NSZoneFree(0, v282);
  v192 = v300;
LABEL_448:
  _PFDeallocateObjects((void **)v304, v192);
  if (v300 >= 0x1FF)
    NSZoneFree(0, v304);
  _PFDeallocateObjects(v283, 0);
  v182 = v302;
LABEL_451:
  _PFDeallocateObjects((void **)v100, v182);
  if (v302 >= 0x1FF)
    NSZoneFree(0, v100);
  v248 = v308;
  v249 = (void **)v285;
  if (v310)
  {
    do
    {
      v250 = *v249++;

      --v248;
    }
    while (v248);
  }
  if (v301)
  {
    v251 = v307;
    v252 = v284;
    do
    {
      v253 = *v252++;

      --v251;
    }
    while (v251);
  }
}

- (NSString)versionChecksum
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  if (-[NSManagedObjectModel isEditable](self, "isEditable"))
  {
    _NSCoreDataLog(1, (uint64_t)CFSTR("Attempting to retrieve an NSManagedObjectModel version checksum while the model is still editable. This may result in an unstable verison checksum. Add model to NSPersistentStoreCoordinator and try again."), v3, v4, v5, v6, v7, v8, v11);
    -[NSManagedObjectModel _setIsEditable:](self, "_setIsEditable:", 0);
  }
  v9 = (void *)objc_msgSend(-[NSManagedObjectModel versionHash](self, "versionHash"), "base64EncodedStringWithOptions:", 0);
  return (NSString *)objc_msgSend(v9, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"));
}

- (id)versionHash
{
  malloc_zone_t *v3;
  unsigned __int8 *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  malloc_zone_t *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CC_SHA256_CTX c;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone)
    v3 = malloc_default_zone();
  memset(&c, 0, sizeof(c));
  v4 = (unsigned __int8 *)malloc_type_zone_malloc(v3, 0x20uLL, 0x937A7324uLL);
  CC_SHA256_Init(&c);
  v5 = (void *)objc_msgSend((id)-[NSMutableDictionary allValues](self->_entities, "allValues"), "sortedArrayUsingFunction:context:", _compareEntitiesByName, 0);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        CC_SHA256_Update(&c, (const void *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "versionHash"), "bytes"), 0x20u);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }
  CC_SHA256_Final(v4, &c);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, 32);
  v11 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone)
    v11 = malloc_default_zone();
  malloc_zone_free(v11, v4);
  return v10;
}

- (id)_entityVersionHashesDigestFrom:(id)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  const char *v12;
  CC_LONG v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CC_SHA512_CTX c;
  _BYTE v21[128];
  unsigned __int8 data[64];
  unsigned __int8 md[64];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    memset(&c, 0, sizeof(c));
    v3 = CC_SHA512_Init(&c);
    v4 = (void *)MEMORY[0x18D76B4E4](v3);
    v5 = (void *)objc_msgSend((id)objc_msgSend(a2, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_330);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v11 = (void *)objc_msgSend(a2, "objectForKey:", v10);
          v12 = (const char *)objc_msgSend(v10, "UTF8String");
          v13 = strlen(v12);
          CC_SHA512_Update(&c, v12, v13);
          LODWORD(v12) = objc_msgSend(v11, "length");
          objc_msgSend(v11, "getBytes:length:", data, v12);
          CC_SHA512_Update(&c, data, (CC_LONG)v12);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v7);
    }
    CC_SHA512_Final(md, &c);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 64);
    v15 = (id)objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);

    objc_autoreleasePoolPop(v4);
    return v15;
  }
  return result;
}

- (NSArray)entitiesForConfiguration:(NSString *)configuration
{
  NSMutableDictionary *configurations;

  if ((*(_BYTE *)&self->_managedObjectModelFlags & 2) != 0)
  {
    configurations = self->_configurations;
    return (NSArray *)-[NSMutableDictionary objectForKey:](configurations, "objectForKey:");
  }
  if (configuration)
  {
    configurations = self->_configurations;
    return (NSArray *)-[NSMutableDictionary objectForKey:](configurations, "objectForKey:");
  }
  return -[NSManagedObjectModel entities](self, "entities");
}

- (NSSet)versionIdentifiers
{
  return self->_versionIdentifiers;
}

- (NSDictionary)entityVersionHashesByName
{
  return (NSDictionary *)-[NSManagedObjectModel _entityVersionHashesByNameInStyle:](self, 0);
}

- (void)_finalizeIndexes
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v7 = 0u;
    v8 = 0u;
    v5 = 0u;
    v6 = 0u;
    result = (void *)objc_msgSend(result, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
    if (result)
    {
      v2 = result;
      v3 = *(_QWORD *)v6;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v6 != v3)
            objc_enumerationMutation(v1);
          -[NSEntityDescription _finalizeIndexes](*(_QWORD *)(*((_QWORD *)&v5 + 1) + 8 * (_QWORD)v4));
          v4 = (char *)v4 + 1;
        }
        while (v2 != v4);
        result = (void *)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
        v2 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)_removeEntity:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  _QWORD *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (objc_msgSend(a2, "managedObjectModel") != a1)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't remove entity - doesn't belong to this model."), 0));
    v4 = objc_msgSend(a2, "name");
    objc_msgSend((id)a1, "_throwIfNotEditable");
    if (v4)
    {
      v31 = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
      if (v31)
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v29 = v4;
        obj = *(id *)(a1 + 40);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v33 != v7)
                objc_enumerationMutation(obj);
              v9 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
              v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v31);
              v11 = *(void **)(a1 + 40);
              if (v11)
              {
                v12 = objc_msgSend(v11, "objectForKey:", v9);
                if (v12)
                {
                  v13 = (void *)v12;
                  if ((*(_BYTE *)(a1 + 64) & 3) != 0)
                  {
                    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_removeEntities called on immutable NSManagedObjectModel");
                    _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, v28);
                    v21 = __pflogFaultLog;
                    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl(&dword_18A253000, v21, OS_LOG_TYPE_FAULT, "CoreData: _removeEntities called on immutable NSManagedObjectModel", buf, 2u);
                    }
                  }
                  v38 = 0u;
                  v39 = 0u;
                  v36 = 0u;
                  v37 = 0u;
                  v22 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, buf, 16);
                  if (v22)
                  {
                    v23 = v22;
                    v24 = *(_QWORD *)v37;
                    do
                    {
                      for (j = 0; j != v23; ++j)
                      {
                        if (*(_QWORD *)v37 != v24)
                          objc_enumerationMutation(v10);
                        v26 = objc_msgSend(v13, "indexOfObjectIdenticalTo:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
                        if (v26 != 0x7FFFFFFFFFFFFFFFLL)
                          objc_msgSend(v13, "removeObjectAtIndex:", v26);
                      }
                      v23 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, buf, 16);
                    }
                    while (v23);
                  }
                }
              }
            }
            v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v6);
        }
        v27 = v31;
        objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v29);
        -[NSEntityDescription _setManagedObjectModel:](v31, 0);

      }
    }
  }
}

- (void)_createCachesAndOptimizeState
{
  __managedObjectModelFlags managedObjectModelFlags;
  id v4;
  NSMutableDictionary *entities;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  uint64_t v13;
  char *v14;
  id *v15;
  char *v16;
  unint64_t v17;
  NSKnownKeysDictionary *v18;
  uint64_t v19;
  NSMutableDictionary *configurations;
  __CFSet *Mutable;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _DWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  _DWORD *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  unint64_t v43;
  uint64_t k;
  _DWORD *v45;
  void *v46;
  _DWORD *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSMutableDictionary *fetchRequestTemplates;
  uint64_t v57;
  uint64_t v58;
  uint64_t m;
  void *v60;
  _QWORD v61[2];
  NSKnownKeysDictionary *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  managedObjectModelFlags = self->_managedObjectModelFlags;
  if ((*(_BYTE *)&managedObjectModelFlags & 2) == 0)
  {
    self->_managedObjectModelFlags = (__managedObjectModelFlags)(*(_DWORD *)&managedObjectModelFlags | 2);
    v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    entities = self->_entities;
    v63 = v4;
    v6 = (void *)objc_msgSend((id)-[NSMutableDictionary allValues](entities, "allValues"), "sortedArrayUsingFunction:context:", _compareEntitiesByName, 0);
    v7 = objc_msgSend(v6, "count");
    v61[1] = v61;
    v8 = MEMORY[0x1E0C80A78](v7);
    v11 = (char *)v61 - v10;
    v12 = 8 * v9;
    if (v8 >= 0x201)
    {
      v11 = (char *)NSAllocateScannedUncollectable();
      v14 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)v61 - v10, 8 * v9);
      MEMORY[0x1E0C80A78](v13);
      v14 = (char *)v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v14, v12);
    }
    objc_msgSend(v6, "getObjects:range:", v11, 0, v7);
    if (v7)
    {
      v15 = (id *)v11;
      v16 = v14;
      v17 = v7;
      do
      {
        *(_QWORD *)v16 = objc_msgSend(*v15, "name");
        v16 += 8;
        ++v15;
        --v17;
      }
      while (v17);
    }
    v18 = -[NSKnownKeysDictionary initWithObjects:forKeys:count:]([NSKnownKeysDictionary alloc], "initWithObjects:forKeys:count:", v11, v14, v7);
    if (v7 >= 0x201)
    {
      NSZoneFree(0, v11);
      NSZoneFree(0, v14);
    }

    self->_entities = &v18->super;
    v19 = -[NSKnownKeysDictionary values](v18, "values");
    configurations = self->_configurations;
    if (!configurations)
    {
      configurations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_configurations = configurations;
    }
    -[NSMutableDictionary setObject:forKey:](configurations, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, v7), CFSTR("PF_DEFAULT_CONFIGURATION_NAME"));
    Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    v62 = v18;
    v22 = -[NSKnownKeysDictionary count](v18, "count");
    if (v22)
    {
      for (i = 0; i != v22; ++i)
      {
        v24 = *(_QWORD *)(v19 + 8 * i);
        objc_msgSend((id)v24, "_flattenProperties");
        if (v24)
          *(_QWORD *)(v24 + 160) = i;
        CFSetAddValue(Mutable, (const void *)v24);
        if (v24)
        {
          v25 = *(_QWORD *)(v24 + 128);
          if (!v25 || (v26 = *(void **)(v25 + 24)) == 0)
            v26 = (void *)NSArray_EmptyArray;
        }
        else
        {
          v26 = 0;
        }
        if (objc_msgSend(v26, "count"))
        {
          *(_DWORD *)&self->_managedObjectModelFlags |= 8u;
          if (v24)
            *(_DWORD *)(v24 + 120) |= 0x800u;
        }
      }
    }
    v27 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = 0;
LABEL_27:
    if (CFSetGetCount(Mutable) >= 1)
    {
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v29 = -[__CFSet countByEnumeratingWithState:objects:count:](Mutable, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
      if (!v29)
        goto LABEL_53;
      v30 = *(_QWORD *)v73;
      while (1)
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v73 != v30)
            objc_enumerationMutation(Mutable);
          v32 = *(_DWORD **)(*((_QWORD *)&v72 + 1) + 8 * v31);
          if (v32)
          {
            v33 = -1;
            v34 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v31);
            do
            {
              v34 = *(_QWORD *)(v34 + 80);
              ++v33;
            }
            while (v34);
          }
          else
          {
            v33 = 0;
          }
          if (v28 > 0x3E7 || v33 == v28)
          {
            objc_msgSend(v27, "addObject:", v32);
            v35 = objc_msgSend(v32, "superentity");
            if (v35 && (*(_BYTE *)(v35 + 121) & 8) != 0)
            {
              if (!v32)
                goto LABEL_48;
              v36 = v32[30] | 0x800;
              v32[30] = v36;
              if ((v36 & 0x800) == 0)
                goto LABEL_48;
            }
            else if (!v32 || (v32[30] & 0x800) == 0)
            {
LABEL_48:
              objc_msgSend(v32, "_createCachesAndOptimizeState");
              goto LABEL_49;
            }
            v37 = v32;
            do
            {
              v38 = v37[30];
              if ((v38 & 0x1000) != 0)
                break;
              v37[30] = v38 | 0x1000;
              v37 = (_DWORD *)*((_QWORD *)v37 + 10);
            }
            while (v37);
            goto LABEL_48;
          }
LABEL_49:
          ++v31;
        }
        while (v31 != v29);
        v39 = -[__CFSet countByEnumeratingWithState:objects:count:](Mutable, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
        v29 = v39;
        if (!v39)
        {
LABEL_53:
          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          v40 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
          if (v40)
          {
            v41 = *(_QWORD *)v69;
            do
            {
              for (j = 0; j != v40; ++j)
              {
                if (*(_QWORD *)v69 != v41)
                  objc_enumerationMutation(v27);
                CFSetRemoveValue(Mutable, *(const void **)(*((_QWORD *)&v68 + 1) + 8 * j));
              }
              v40 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
            }
            while (v40);
          }
          ++v28;
          goto LABEL_27;
        }
      }
    }
    CFRelease(Mutable);
    objc_msgSend(v27, "removeAllObjects");
    v43 = -[NSKnownKeysDictionary count](v62, "count");
    if (v43)
    {
      for (k = 0; k != v43; ++k)
      {
        v45 = *(_DWORD **)(v19 + 8 * k);
        if (-[NSEntityDescription _hasUniqueProperties]((_BOOL8)v45))
        {
          v46 = -[NSEntityDescription _checkSelfForNonCascadeNoInverses]((uint64_t)v45);
          if (v46)
          {
            if (v45)
            {
              v47 = v45;
              do
              {
                v48 = v47[30];
                if ((v48 & 0x2000) != 0)
                  break;
                v47[30] = v48 | 0x2000;
                v47 = (_DWORD *)*((_QWORD *)v47 + 10);
              }
              while (v47);
            }
            v49 = objc_msgSend(v45, "uniquenessConstraints");
            objc_msgSend(v45, "name");
            objc_msgSend(v46, "name");
            objc_msgSend((id)objc_msgSend(v46, "inverseRelationship"), "name");
            objc_msgSend(v46, "name");
            _NSCoreDataLog(1, (uint64_t)CFSTR("Cannot use uniqueness constraints { %@ } on entity '%@' due to relationship '%@' having a mandatory to-one inverse relationship '%@' and not using a cascade delete rule on '%@'"), v50, v51, v52, v53, v54, v55, v49);
          }
        }
      }
    }
    if (BYTE6(z9dsptsiQ80etb9782fsrs98bfdle88))
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      fetchRequestTemplates = self->_fetchRequestTemplates;
      v57 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](fetchRequestTemplates, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
      if (v57)
      {
        v58 = *(_QWORD *)v65;
        do
        {
          for (m = 0; m != v57; ++m)
          {
            if (*(_QWORD *)v65 != v58)
              objc_enumerationMutation(fetchRequestTemplates);
            v60 = (void *)-[NSMutableDictionary objectForKey:](self->_fetchRequestTemplates, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * m));
            objc_msgSend(v60, "allowEvaluation");
            objc_msgSend(v60, "_incrementInUseCounter");
          }
          v57 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](fetchRequestTemplates, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
        }
        while (v57);
      }
    }
    -[NSManagedObjectModel _finalizeIndexes](self);
    if (v43 >= 6 && (int)+[_PFTask getNumActiveProcessors]() >= 2)

    objc_msgSend(v63, "drain");
  }
}

- (void)_setIsEditable:(BOOL)a3
{
  -[NSManagedObjectModel _setIsEditable:optimizationStyle:](self, "_setIsEditable:optimizationStyle:", a3, 0);
}

- (void)_setIsEditable:(BOOL)a3 optimizationStyle:(unint64_t)a4
{
  _BOOL4 v5;
  uint64_t v7;
  void *v8;
  __managedObjectModelFlags managedObjectModelFlags;
  NSMutableDictionary *fetchRequestTemplates;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unsigned int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v5 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = objc_sync_enter(self);
  v8 = (void *)MEMORY[0x18D76B4E4](v7);
  managedObjectModelFlags = self->_managedObjectModelFlags;
  if (!(*(_BYTE *)&managedObjectModelFlags & 1) == v5)
  {
    if (BYTE6(z9dsptsiQ80etb9782fsrs98bfdle88))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      fetchRequestTemplates = self->_fetchRequestTemplates;
      v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](fetchRequestTemplates, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(fetchRequestTemplates);
            v14 = (void *)-[NSMutableDictionary objectForKey:](self->_fetchRequestTemplates, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
            objc_msgSend(v14, "allowEvaluation");
            objc_msgSend(v14, "_incrementInUseCounter");
          }
          v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](fetchRequestTemplates, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v11);
      }
    }
  }
  else
  {
    if ((*(_BYTE *)&managedObjectModelFlags & 1) != 0)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Models cannot become mutable after being marked immutable."), 0));
    v15 = *(_DWORD *)&managedObjectModelFlags & 0xFFFFFFFE | !v5;
    if (a4)
      v15 |= 4u;
    self->_managedObjectModelFlags = (__managedObjectModelFlags)v15;
    -[NSManagedObjectModel _traverseTombstonesAndMark:]((uint64_t)self, 1);
    -[NSManagedObjectModel _createCachesAndOptimizeState](self, "_createCachesAndOptimizeState");
  }
  objc_autoreleasePoolPop(v8);
  objc_sync_exit(self);
}

- (void)_traverseTombstonesAndMark:(uint64_t)a1
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  _QWORD *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[2];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (a1 && (*(_BYTE *)(a1 + 64) & 0x10) == 0)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = *(id *)(a1 + 32);
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (v19)
    {
      v5 = 0;
      v18 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v39 != v18)
            objc_enumerationMutation(obj);
          v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
          v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "userInfo"), "objectForKey:", CFSTR("NSPersistentHistoryTombstoneAttributes"));
          v8 = v7;
          if (v7)
          {
            if (objc_msgSend(v7, "isNSString"))
            {
              if (objc_msgSend(v8, "length"))
              {
                v21 = (id)objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(","));
                v36 = 0u;
                v37 = 0u;
                v34 = 0u;
                v35 = 0u;
                v9 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
                if (v9)
                {
                  v10 = *(_QWORD *)v35;
                  do
                  {
                    for (j = 0; j != v9; ++j)
                    {
                      if (*(_QWORD *)v35 != v10)
                        objc_enumerationMutation(v21);
                      if (v6)
                      {
                        v12 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
                        v13 = v6;
                        do
                        {
                          if (!-[NSEntityDescription _attributeNamed:](objc_msgSend(v13, "superentity"), v12))
                          {
                            objc_msgSend(-[NSEntityDescription _attributeNamed:]((uint64_t)v13, v12), "setPreservesValueInHistoryOnDeletion:", a2);
                            v43[0] = v13;
                            v43[1] = v12;
                            objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2));
                            v13 = 0;
                            v5 = 1;
                          }
                          v13 = (void *)objc_msgSend(v13, "superentity");
                        }
                        while (v13);
                      }
                    }
                    v9 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
                  }
                  while (v9);
                }
              }
            }
          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      }
      while (v19);
      if ((v5 & 1) != 0)
      {
        v28 = 0;
        v29 = &v28;
        v30 = 0x3052000000;
        v31 = __Block_byref_object_copy__13;
        v32 = __Block_byref_object_dispose__13;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __71__NSManagedObjectModel__NSInternalMethods___traverseTombstonesAndMark___block_invoke;
        v26[3] = &unk_1E1EDE638;
        v27 = a2;
        v26[4] = &v28;
        v33 = v26;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v42, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v23;
          do
          {
            for (k = 0; k != v14; ++k)
            {
              if (*(_QWORD *)v23 != v15)
                objc_enumerationMutation(v4);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v29[5] + 16))(v29[5], objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * k), "objectAtIndexedSubscript:", 0), objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * k), "objectAtIndexedSubscript:", 1));
            }
            v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v42, 16);
          }
          while (v14);
        }
        _Block_object_dispose(&v28, 8);
      }
    }

  }
}

- (void)_setModelsReferenceIDOffset:(int64_t)a3
{
  if (a3 < 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot assign a negative reference ID offset to a managed object model."), 0));
  if (objc_msgSend(self->_additionalPrivateIvars[1], "longValue") != a3)
  {

    *((_QWORD *)self->_additionalPrivateIvars + 1) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id v5;
  NSMutableDictionary *entities;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  id v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  NSMutableDictionary *fetchRequestTemplates;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  uint64_t v30;
  void *v31;
  NSMutableDictionary *obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
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
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    objc_msgSend(v4, "_setModelsReferenceIDOffset:", -[NSManagedObjectModel _modelsReferenceIDOffset](self, "_modelsReferenceIDOffset"));
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    entities = self->_entities;
    v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](entities, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v43 != v9)
            objc_enumerationMutation(entities);
          v11 = (void *)-[NSMutableDictionary objectForKey:](self->_entities, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
          if (!objc_msgSend(v11, "superentity"))
          {
            v12 = (void *)objc_msgSend(v11, "copy");
            +[NSManagedObjectModel _deepCollectEntitiesInArray:entity:]((uint64_t)NSManagedObjectModel, v5, v12);

          }
        }
        v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](entities, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v8);
    }
    objc_msgSend(v4, "setEntities:", v5);

    v13 = *self->_additionalPrivateIvars;
    if (v13)
    {
      v14 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v4, "_setLocalizationPolicy:", v14);

    }
    obj = self->_configurations;
    if (obj)
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v39 != v17)
              objc_enumerationMutation(obj);
            v19 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
            v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v21 = -[NSManagedObjectModel entitiesForConfiguration:](self, "entitiesForConfiguration:", v19);
            v22 = -[NSArray count](v21, "count");
            if (v22)
            {
              v23 = v22;
              for (k = 0; k != v23; ++k)
                objc_msgSend(v20, "addObject:", objc_msgSend(v4[4], "objectForKey:", objc_msgSend(-[NSArray objectAtIndex:](v21, "objectAtIndex:", k), "name")));
            }
            objc_msgSend(v4, "setEntities:forConfiguration:", v20, v19);

          }
          v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        }
        while (v16);
      }
    }
    fetchRequestTemplates = self->_fetchRequestTemplates;
    if (fetchRequestTemplates)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](fetchRequestTemplates, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v35;
        do
        {
          for (m = 0; m != v27; ++m)
          {
            if (*(_QWORD *)v35 != v28)
              objc_enumerationMutation(fetchRequestTemplates);
            v30 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * m);
            v31 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_fetchRequestTemplates, "objectForKey:", v30), "copy");
            objc_msgSend(v4, "setFetchRequestTemplate:forName:", v31, v30);

          }
          v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](fetchRequestTemplates, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
        }
        while (v27);
      }
    }
    objc_msgSend(v4, "setVersionIdentifiers:", self->_versionIdentifiers);
  }
  return v4;
}

+ (uint64_t)_deepCollectEntitiesInArray:(void *)a3 entity:
{
  void *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t i;

  objc_opt_self();
  objc_msgSend(a2, "addObject:", a3);
  v5 = (void *)objc_msgSend(a3, "subentities");
  result = objc_msgSend(v5, "count");
  if (result)
  {
    v7 = result;
    for (i = 0; i != v7; ++i)
      result = +[NSManagedObjectModel _deepCollectEntitiesInArray:entity:](NSManagedObjectModel, a2, objc_msgSend(v5, "objectAtIndex:", i));
  }
  return result;
}

- (void)setEntities:(NSArray *)entities forConfiguration:(NSString *)configuration
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t i;
  id v18;
  void *v19;
  uint64_t v20;

  if ((*(_BYTE *)&self->_managedObjectModelFlags & 3) != 0)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "setEntities called on immutable NSManagedObjectModel");
    _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, v20);
    v14 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v20) = 0;
      _os_log_fault_impl(&dword_18A253000, v14, OS_LOG_TYPE_FAULT, "CoreData: setEntities called on immutable NSManagedObjectModel", (uint8_t *)&v20, 2u);
    }
  }
  v15 = -[NSArray count](entities, "count");
  if (v15)
  {
    v16 = v15;
    for (i = 0; i != v16; ++i)
    {
      v18 = -[NSArray objectAtIndex:](entities, "objectAtIndex:", i);
      if ((objc_msgSend(v18, "isEqual:", -[NSMutableDictionary objectForKey:](self->_entities, "objectForKey:", objc_msgSend(v18, "name"))) & 1) == 0)objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Entities for a configuration must already be in the model."), 0));
    }
  }
  if (!self->_configurations)
    self->_configurations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = (void *)-[NSArray mutableCopy](entities, "mutableCopy");
  -[NSMutableDictionary setObject:forKey:](self->_configurations, "setObject:forKey:", v19, configuration);

}

- (void)setVersionIdentifiers:(NSSet *)versionIdentifiers
{
  NSSet *v4;
  NSSet *v5;

  if (self->_versionIdentifiers != versionIdentifiers)
  {
    if (versionIdentifiers)
      v4 = (NSSet *)-[NSSet copy](versionIdentifiers, "copy");
    else
      v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    v5 = v4;

    self->_versionIdentifiers = v5;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSManagedObjectModel)initWithContentsOfOptimizedURL:(id)a3
{
  id v4;
  void *v5;
  _PFVMData *v6;
  char v7;
  char v8;
  NSManagedObjectModel *v9;
  int v10;
  NSManagedObjectModel *v11;
  NSValidationErrorLocalizationPolicy *v12;
  id v13;
  char v15;

  objc_opt_class();
  objc_opt_class();
  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (_PFVMData *)objc_msgSend(a3, "path");
  v15 = 0;
  v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v15);
  if (v15)
    v8 = v7;
  else
    v8 = 0;
  if ((v8 & 1) != 0)
  {
    v9 = 0;
    v6 = 0;
LABEL_6:
    v10 = 1;
    goto LABEL_13;
  }
  if (v6)
  {
    v6 = -[_PFVMData initWithContentsOfFile:options:error:]([_PFVMData alloc], "initWithContentsOfFile:options:error:", v6, 0, 0);
    if (!-[_PFVMData length](v6, "length"))
    {
      v9 = 0;
      goto LABEL_6;
    }
    +[NSManagedObjectModel _newModelFromOptimizedEncoding:error:]((uint64_t)NSManagedObjectModel, (const __CFData *)v6, 0);
    v9 = v11;
    if (v11)
    {
      v12 = -[NSValidationErrorLocalizationPolicy initWithURL:]([NSValidationErrorLocalizationPolicy alloc], "initWithURL:", a3);
      -[NSManagedObjectModel _setLocalizationPolicy:](v9, "_setLocalizationPolicy:", v12);

    }
  }
  else
  {
    v9 = 0;
  }
  v10 = 0;
LABEL_13:
  objc_msgSend(v4, "drain");
  v13 = 0;

  if (v10)
    return 0;
  else
    return v9;
}

- (id)_initWithContentsOfURL:(id)a3 options:(unint64_t)a4
{
  char v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  char v19;
  int v20;
  char v21;
  uint64_t v22;
  int v23;
  NSManagedObjectModel *v24;
  NSManagedObjectModelBundle *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSManagedObjectModelBundle *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSManagedObjectModel *v39;
  void *v40;
  NSManagedObjectModelBundle *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const __CFString *v48;
  void *v49;
  NSString *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSValidationErrorLocalizationPolicy *v71;
  uint64_t v73;
  id v74;
  uint64_t v75;
  char v76;

  v4 = a4;
  objc_opt_class();
  objc_opt_class();
  if (a3)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_msgSend(a3, "path");
    v76 = 0;
    v17 = objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v16, &v76);
    if (v17)
      v18 = v76 == 0;
    else
      v18 = 1;
    if (v18)
    {
      v19 = v17;
      v20 = objc_msgSend((id)objc_msgSend(v16, "pathExtension"), "isEqualToString:", CFSTR("omo"));
      v21 = v19 | v20;
      if (v20)
        v22 = (uint64_t)v16;
      else
        v22 = 0;
      if ((v21 & 1) != 0)
      {
        v23 = v20;
LABEL_16:

        if (v22)
        {
          v39 = [NSManagedObjectModel alloc];
          v24 = -[NSManagedObjectModel initWithContentsOfOptimizedURL:](v39, "initWithContentsOfOptimizedURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v22, 0));
          if (v24)
          {
LABEL_41:
            v71 = -[NSValidationErrorLocalizationPolicy initWithURL:]([NSValidationErrorLocalizationPolicy alloc], "initWithURL:", a3);
            -[NSManagedObjectModel _setLocalizationPolicy:](v24, "_setLocalizationPolicy:", v71);

LABEL_45:
            objc_msgSend(v14, "drain");
            return v24;
          }
          if (!PFUseToolchainBehaviors())
            _NSCoreDataLog(4, (uint64_t)CFSTR(" Failed to load optimized model at path '%@'"), v33, v34, v35, v36, v37, v38, v22);
          if (v23)
          {
            v40 = (void *)objc_msgSend(v16, "stringByDeletingLastPathComponent");
            if (objc_msgSend((id)objc_msgSend(v40, "pathExtension"), "isEqualToString:", CFSTR("momd")))
            {
              v41 = -[NSManagedObjectModelBundle initWithPath:]([NSManagedObjectModelBundle alloc], "initWithPath:", v40);
              if (v41)
              {
                v16 = (void *)objc_msgSend(-[NSManagedObjectModelBundle currentVersionURL](v41, "currentVersionURL"), "path");
                v22 = 0;
                if (!v16)
                  goto LABEL_44;
              }
              else
              {
                _NSCoreDataLog(1, (uint64_t)CFSTR(" Failed to load model bundle at path '%@'"), v42, v43, v44, v45, v46, v47, (uint64_t)v16);
                if (!v16)
                  goto LABEL_44;
              }
LABEL_29:
              if (v16 != (void *)v22)
              {
                v75 = 0;
                v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v16, 0, &v75);
                if (v75)
                {
                  v50 = NSStringFromSelector(a2);
                  _NSCoreDataLog(1, (uint64_t)CFSTR("Failed reading data in %@ from path %@, error, %@"), v51, v52, v53, v54, v55, v56, (uint64_t)v50);
                }
                v74 = 0;
                if (objc_msgSend(v49, "length"))
                {
                  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v49, &v74);
                  v64 = v63;
                  if ((v4 & 1) != 0)
                  {
                    objc_msgSend(v63, "setRequiresSecureCoding:", 1);
                    objc_msgSend(v64, "_allowDecodingCyclesInSecureMode");
                  }
                  else
                  {
                    objc_msgSend(v63, "setRequiresSecureCoding:", 0);
                  }
                  objc_msgSend(v64, "setDecodingFailurePolicy:", 1);
                  v24 = (NSManagedObjectModel *)(id)objc_msgSend(v64, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class()), CFSTR("root"));
                  if (objc_msgSend(v64, "error"))
                    v74 = (id)objc_msgSend(v64, "error");

                  if (v24)
                  {

                    goto LABEL_41;
                  }
                  _NSCoreDataLog(1, (uint64_t)CFSTR(" Failed to load keyed archive model at path '%@' with error '%@'"), v65, v66, v67, v68, v69, v70, (uint64_t)v16);
                }
                else
                {
                  _NSCoreDataLog(1, (uint64_t)CFSTR("Unable model at path (file is zero bytes) '%@'"), v57, v58, v59, v60, v61, v62, (uint64_t)v16);
                }

              }
LABEL_44:
              _NSCoreDataLog(1, (uint64_t)CFSTR(" Failed to load NSManagedObjectModel with URL '%@'"), v33, v34, v35, v36, v37, v38, (uint64_t)a3);
              v24 = 0;
              goto LABEL_45;
            }
          }
        }
LABEL_28:
        if (!v16)
          goto LABEL_44;
        goto LABEL_29;
      }
      v48 = CFSTR(" Failed to load model as no file exists at path '%@'");
    }
    else
    {
      v25 = -[NSManagedObjectModelBundle initWithPath:]([NSManagedObjectModelBundle alloc], "initWithPath:", v16);
      if (v25)
      {
        v32 = v25;
        v22 = objc_msgSend(-[NSManagedObjectModelBundle optimizedVersionURL](v25, "optimizedVersionURL"), "path");
        v16 = (void *)objc_msgSend(-[NSManagedObjectModelBundle currentVersionURL](v32, "currentVersionURL"), "path");
        v23 = 0;
        goto LABEL_16;
      }
      v48 = CFSTR(" Failed to load model bundle at path '%@'");
    }
    _NSCoreDataLog(1, (uint64_t)v48, v26, v27, v28, v29, v30, v31, (uint64_t)v16);

    v22 = 0;
    goto LABEL_28;
  }
  _NSCoreDataLog(1, (uint64_t)CFSTR(" Cannot load NSManagedObjectModel.  nil is an illegal URL parameter"), v8, v9, v10, v11, v12, v13, v73);
  if (BYTE2(dword_1ECD8DE18))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("CoreData: Cannot load NSManagedObjectModel.  nil is an illegal URL parameter"), 0));

  return 0;
}

- (void)dealloc
{
  uint64_t v3;
  NSMutableDictionary *fetchRequestTemplates;
  id *additionalPrivateIvars;
  objc_super v6;

  if (self->_optimizationHints)
  {
    v3 = -[NSMutableDictionary count](self->_entities, "count") - 1;
    if (v3 >= 0)
    {
      do

      while (v3 != -1);
    }
  }
  self->_optimizationHints = 0;
  fetchRequestTemplates = self->_fetchRequestTemplates;
  if (fetchRequestTemplates)
  {

    self->_fetchRequestTemplates = 0;
  }

  self->_configurations = 0;
  self->_entities = 0;

  self->_versionIdentifiers = 0;
  additionalPrivateIvars = self->_additionalPrivateIvars;
  if (additionalPrivateIvars)
  {

    *self->_additionalPrivateIvars = 0;
    *((_QWORD *)self->_additionalPrivateIvars + 1) = 0;

    *((_QWORD *)self->_additionalPrivateIvars + 2) = 0;
    PF_FREE_OBJECT_ARRAY(self->_additionalPrivateIvars);
    self->_additionalPrivateIvars = 0;
  }

  self->_dataForOptimization = 0;
  v6.receiver = self;
  v6.super_class = (Class)NSManagedObjectModel;
  -[NSManagedObjectModel dealloc](&v6, sel_dealloc);
}

- (void)_setLocalizationPolicy:(id)a3
{
  id v3;

  v3 = *self->_additionalPrivateIvars;
  if (v3 != a3)
  {

    *self->_additionalPrivateIvars = a3;
  }
}

- (uint64_t)_isConfiguration:(uint64_t)a3 inStyle:(void *)a4 compatibleWithStoreMetadata:
{
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v6 = (void *)result;
  v7 = (void *)objc_msgSend(a4, "objectForKey:", 0x1E1EF1490);
  v8 = objc_msgSend(v7, "intValue");
  if (objc_msgSend(v7, "intValue") > 3)
    return 0;
  result = objc_msgSend(a4, "objectForKey:", CFSTR("NSStoreModelVersionHashes"));
  if (!result)
    return result;
  v9 = (void *)result;
  v10 = objc_msgSend((id)objc_msgSend(v6, "entitiesByName"), "count");
  if (v10 != objc_msgSend(v9, "count"))
    return 0;
  v11 = -[NSManagedObjectModel _entityVersionHashesByNameInStyle:](v6, a3);
  v12 = v11;
  if (v8 < 3)
  {
    v23 = 0uLL;
    v24 = 0uLL;
    v21 = 0uLL;
    v22 = 0uLL;
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
LABEL_8:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        result = objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16));
        if (!result)
          return result;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          result = 1;
          if (v14)
            goto LABEL_8;
          return result;
        }
      }
    }
    return 1;
  }
  v27 = 0uLL;
  v28 = 0uLL;
  v25 = 0uLL;
  v26 = 0uLL;
  v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (!v17)
    return 1;
  v18 = v17;
  v19 = *(_QWORD *)v26;
LABEL_19:
  v20 = 0;
  while (1)
  {
    if (*(_QWORD *)v26 != v19)
      objc_enumerationMutation(v12);
    result = objc_msgSend((id)objc_msgSend(v12, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v20)), "isEqual:", objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v20)));
    if (!(_DWORD)result)
      return result;
    if (v18 == ++v20)
    {
      v18 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      result = 1;
      if (v18)
        goto LABEL_19;
      return result;
    }
  }
}

- (BOOL)isConfiguration:(NSString *)configuration compatibleWithStoreMetadata:(NSDictionary *)metadata
{
  return -[NSManagedObjectModel _isConfiguration:inStyle:compatibleWithStoreMetadata:]((uint64_t)self, (uint64_t)a2, 0, metadata);
}

- (uint64_t)_allowedClassesFromTransformableAttributes
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t *v11;
  id obj;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(*(_QWORD *)(result + 24) + 16);
    if (!result)
    {
      v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      obj = *(id *)(v1 + 32);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v16)
      {
        v14 = *(_QWORD *)v23;
        v15 = v1;
        do
        {
          v3 = 0;
          do
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(obj);
            v17 = v3;
            v4 = (void *)objc_msgSend(*(id *)(v1 + 32), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v3));
            v18 = 0u;
            v19 = 0u;
            v20 = 0u;
            v21 = 0u;
            v5 = (void *)objc_msgSend(v4, "attributesByName");
            v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v6)
            {
              v7 = v6;
              v8 = *(_QWORD *)v19;
              do
              {
                for (i = 0; i != v7; ++i)
                {
                  if (*(_QWORD *)v19 != v8)
                    objc_enumerationMutation(v5);
                  v10 = (void *)objc_msgSend((id)objc_msgSend(v4, "attributesByName"), "valueForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
                  if (objc_msgSend(v10, "valueTransformerName"))
                  {
                    objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", objc_msgSend(v10, "valueTransformerName"));
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)objc_opt_class(), "allowedTopLevelClasses"));
                  }
                }
                v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
              }
              while (v7);
            }
            v3 = v17 + 1;
            v1 = v15;
          }
          while (v17 + 1 != v16);
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v16);
      }
      v11 = (unint64_t *)(*(_QWORD *)(v1 + 24) + 16);
      while (!__ldaxr(v11))
      {
        if (!__stlxr((unint64_t)v2, v11))
          return *(_QWORD *)(*(_QWORD *)(v1 + 24) + 16);
      }
      __clrex();

      return *(_QWORD *)(*(_QWORD *)(v1 + 24) + 16);
    }
  }
  return result;
}

+ (NSManagedObjectModel)mergedModelFromBundles:(NSArray *)bundles
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSManagedObjectModel *v20;
  void *v21;
  id v22;
  void *context;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  v4 = objc_opt_class();
  context = (void *)MEMORY[0x18D76B4E4](v4);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = +[NSManagedObjectModel _modelPathsFromBundles:]((uint64_t)NSManagedObjectModel, bundles);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x18D76B4E4]();
        v13 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
        v20 = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", v13);
        if (v20)
          objc_msgSend(v5, "addObject:", v20);
        else
          _NSCoreDataLog(1, (uint64_t)CFSTR("+mergedModelFromBundles: Failed to load model at URL '%@'"), v14, v15, v16, v17, v18, v19, v13);

        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }
  if (objc_msgSend(v5, "count") == 1)
    v21 = (void *)objc_msgSend(v5, "objectAtIndex:", 0);
  else
    v21 = (void *)objc_msgSend(a1, "modelByMergingModels:", v5);
  v22 = v21;
  objc_autoreleasePoolPop(context);
  return (NSManagedObjectModel *)v22;
}

- (NSManagedObjectModel)initWithContentsOfURL:(NSURL *)url
{
  return (NSManagedObjectModel *)-[NSManagedObjectModel _initWithContentsOfURL:options:](self, "_initWithContentsOfURL:options:", url, byte_1ECD8DE1C);
}

+ (void)_modelPathsFromBundles:(uint64_t)a1
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (a2)
  {
    if ((unint64_t)objc_msgSend(a2, "count") >= 2)
    {
      v3 = BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88) != 0;
      goto LABEL_8;
    }
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    if (v4)
      a2 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
    else
      a2 = 0;
  }
  v3 = 0;
LABEL_8:
  if (a2)
    v5 = a2;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v5;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x18D76B4E4]();
        if (!v3
          || (v13 = (void *)objc_msgSend((id)objc_msgSend(v11, "bundlePath"), "pathComponents"),
              (unint64_t)objc_msgSend(v13, "count") < 5)
          || !objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", 1), "isEqual:", CFSTR("System"))
          || (objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", 2), "isEqual:", CFSTR("Library")) & 1) == 0)
        {
          objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v11, "pathsForResourcesOfType:inDirectory:", CFSTR("mom"), 0));
          objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v11, "pathsForResourcesOfType:inDirectory:", CFSTR("momd"), 0));
        }
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  return v6;
}

- (NSManagedObjectModel)initWithCoder:(id)a3
{
  NSManagedObjectModel *v4;
  id v5;
  const char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  id *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSMutableDictionary *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSSet *v59;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[2];
  void (*v76)(uint64_t);
  void *v77;
  id v78;
  objc_super v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  objc_opt_class();
  v79.receiver = self;
  v79.super_class = (Class)NSManagedObjectModel;
  v4 = -[NSManagedObjectModel init](&v79, sel_init);
  if (v4)
  {
    +[PFModelDecoderContext assertNoContext](PFModelDecoderContext, "assertNoContext");
    v5 = +[PFModelDecoderContext retainedContext](PFModelDecoderContext, "retainedContext");
    v7 = v5;
    if (v5)
      objc_setProperty_nonatomic(v5, v6, v4, 8);
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v76 = __38__NSManagedObjectModel_initWithCoder___block_invoke;
    v77 = &unk_1E1EDD520;
    v78 = v7;
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend((id)objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0), "setByAddingObjectsFromArray:", +[NSKnownKeysDictionary classesForArchiving](NSKnownKeysDictionary, "classesForArchiving")), CFSTR("NSEntities"));
    v4->_entities = v13;
    if (v13)
    {
      if ((-[NSMutableDictionary isNSDictionary](v13, "isNSDictionary") & 1) == 0)
      {
        objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, &unk_1E1F4A980));

        goto LABEL_60;
      }
      v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v15 = (void *)-[NSMutableDictionary allKeys](v4->_entities, "allKeys");
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v72;
        v18 = *MEMORY[0x1E0CB28A8];
LABEL_8:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v72 != v17)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v19);
          v21 = (void *)MEMORY[0x18D76B4E4]();
          v22 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](v4->_entities, "objectForKeyedSubscript:", v20);
          if (objc_msgSend(v20, "isNSString")
            && (objc_opt_class(), v23 = v22, (objc_opt_isKindOfClass() & 1) != 0))
          {
            while (1)
            {
              v23 = (void *)objc_msgSend(v23, "superentity");
              if (!v23 || (objc_msgSend(v14, "containsObject:", v23) & 1) != 0)
                break;
              v24 = objc_msgSend(v23, "name");
              if (!v24
                || (void *)-[NSMutableDictionary objectForKeyedSubscript:](v4->_entities, "objectForKeyedSubscript:", v24) != v23)
              {
                objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v18, 4866, &unk_1E1F4A9D0));

                goto LABEL_19;
              }
              objc_msgSend(v14, "addObject:", v23);
            }
            v70 = 0;
            if ((objc_msgSend(v22, "performPostDecodeValidationInModel:error:", v4, &v70) & 1) != 0)
            {
              v25 = 0;
              goto LABEL_20;
            }
            objc_msgSend(a3, "failWithError:", v70);

          }
          else
          {
            objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v18, 4866, &unk_1E1F4A9A8));

          }
LABEL_19:
          v4 = 0;
          v25 = 1;
LABEL_20:
          objc_autoreleasePoolPop(v21);
          if (v25)
            goto LABEL_60;
          if (++v19 == v16)
          {
            v26 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
            v16 = v26;
            if (v26)
              goto LABEL_8;
            break;
          }
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        v4->_entities = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v4->_entities, "mutableCopy");
    }
    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    v33 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v27, "setWithObjects:", v28, v29, v30, v31, v32, objc_opt_class(), 0), CFSTR("NSConfigurations"));
    if (v33)
    {
      v4->_configurations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v34 = (void *)MEMORY[0x18D76B4E4]();
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v67 != v36)
              objc_enumerationMutation(v33);
            v38 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
            v39 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v33, "objectForKey:", v38), "allObjects"), "mutableCopy");
            -[NSMutableDictionary setObject:forKey:](v4->_configurations, "setObject:forKey:", v39, v38);

          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
        }
        while (v35);
      }
      objc_autoreleasePoolPop(v34);
    }
    v40 = (id *)PF_CALLOC_OBJECT_ARRAY(3);
    v4->_additionalPrivateIvars = v40;
    *v40 = 0;
    *((_QWORD *)v4->_additionalPrivateIvars + 1) = 0;
    *((_QWORD *)v4->_additionalPrivateIvars + 2) = 0;
    v41 = (void *)MEMORY[0x1E0C99E60];
    v42 = objc_opt_class();
    v43 = objc_opt_class();
    v44 = objc_opt_class();
    v45 = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v41, "setWithObjects:", v42, v43, v44, objc_opt_class(), 0), CFSTR("NSFetchRequestTemplates"));
    v4->_fetchRequestTemplates = v45;
    if (!v45)
    {
LABEL_53:
      v54 = (void *)MEMORY[0x1E0C99E60];
      v55 = objc_opt_class();
      v56 = objc_opt_class();
      v57 = objc_opt_class();
      v58 = objc_opt_class();
      v59 = (NSSet *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v54, "setWithObjects:", v55, v56, v57, v58, objc_opt_class(), 0), CFSTR("NSVersionIdentifiers"));
      v4->_versionIdentifiers = v59;
      if (!v59)
        v4->_versionIdentifiers = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
      *(_DWORD *)&v4->_managedObjectModelFlags &= 0xFFFFFFFC;
      -[NSManagedObjectModel _finalizeIndexes](v4);
      goto LABEL_61;
    }
    if ((-[NSMutableDictionary isNSDictionary](v45, "isNSDictionary") & 1) != 0)
    {
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v46 = (void *)-[NSMutableDictionary allKeys](v4->_fetchRequestTemplates, "allKeys");
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v62, v80, 16);
      if (v47)
      {
        v48 = *(_QWORD *)v63;
        while (2)
        {
          for (j = 0; j != v47; ++j)
          {
            if (*(_QWORD *)v63 != v48)
              objc_enumerationMutation(v46);
            v50 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
            v51 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](v4->_fetchRequestTemplates, "objectForKeyedSubscript:", v50);
            if (!objc_msgSend(v50, "isNSString")
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, &unk_1E1F4AA20));

              goto LABEL_60;
            }
            v52 = (void *)objc_msgSend(v51, "entity");
            v53 = v52;
            if (v52
              && (!objc_msgSend(v52, "name")
               || (void *)-[NSMutableDictionary objectForKeyedSubscript:](v4->_entities, "objectForKeyedSubscript:", objc_msgSend(v53, "name")) != v53))
            {
              objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, &unk_1E1F4AA48));

              goto LABEL_60;
            }
          }
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v62, v80, 16);
          if (v47)
            continue;
          break;
        }
      }
      goto LABEL_53;
    }
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, &unk_1E1F4A9F8));

LABEL_60:
    v4 = 0;
LABEL_61:
    v76((uint64_t)v75);
  }
  return v4;
}

void __38__NSManagedObjectModel_initWithCoder___block_invoke(uint64_t a1)
{

}

+ (NSManagedObjectModel)modelByMergingModels:(NSArray *)models
{
  NSUInteger v4;
  unint64_t v5;
  NSManagedObjectModel *v6;
  char *v8;
  id *v9;
  id *v10;
  char *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id *v32;
  id v33;
  NSMergedPolicyLocalizationPolicy *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  id *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  uint64_t v50;
  id *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t n;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t ii;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t jj;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  id *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  NSMergedPolicyLocalizationPolicy *v102;
  void *v103;
  uint64_t v104;
  unint64_t v105;
  NSArray *v106;
  char *obj;
  id obja;
  void *context;
  void *contexta;
  id *v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
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
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  uint8_t v145[128];
  uint8_t buf[128];
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  objc_opt_class();
  if (!models)
    return 0;
  v4 = -[NSArray count](models, "count");
  if (v4 == 1)
  {
    v6 = (NSManagedObjectModel *)objc_msgSend(-[NSArray objectAtIndex:](models, "objectAtIndex:", 0), "copy");
    return v6;
  }
  v5 = v4;
  if (!v4)
  {
    v6 = objc_alloc_init(NSManagedObjectModel);
    return v6;
  }
  v101 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v8 = 0;
  v106 = models;
  obj = (char *)(v5 - 2);
  v105 = v5;
  do
  {
    context = (void *)MEMORY[0x18D76B4E4]();
    v9 = -[NSArray objectAtIndex:](models, "objectAtIndex:", v8);
    if ((unint64_t)(v8 + 1) >= v5)
      goto LABEL_31;
    v10 = v9;
    v11 = v8 + 1;
    do
    {
      v12 = -[NSArray objectAtIndex:](models, "objectAtIndex:", v11);
      v13 = (void *)objc_msgSend(v12, "entitiesByName");
      v132 = 0u;
      v133 = 0u;
      v134 = 0u;
      v135 = 0u;
      v14 = (void *)objc_msgSend(v13, "allValues");
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v132, v145, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v133;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v133 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
            v20 = objc_msgSend(v19, "name");
            if (v10)
            {
              v21 = v20;
              v22 = (void *)objc_msgSend(v10[4], "objectForKey:", v20);
              if (v22)
              {
                if ((objc_msgSend(v22, "isEqual:", v19) & 1) == 0)
                {
                  objc_msgSend(v101, "drain");
                  v93 = (void *)MEMORY[0x1E0C99DA0];
                  v94 = *MEMORY[0x1E0C99778];
                  v95 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't merge models with two different entities named '%@'"), v21);
                  v96 = v93;
                  v97 = v94;
                  goto LABEL_109;
                }
              }
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v132, v145, 16);
        }
        while (v16);
      }
      v23 = (void *)objc_msgSend(v12, "fetchRequestTemplatesByName");
      v128 = 0u;
      v129 = 0u;
      v130 = 0u;
      v131 = 0u;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v128, v144, 16);
      if (!v24)
        goto LABEL_30;
      v25 = v24;
      v26 = *(_QWORD *)v129;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v129 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * j);
          v29 = objc_msgSend(v12, "fetchRequestTemplateForName:", v28);
          v30 = (void *)objc_msgSend(v10, "fetchRequestTemplateForName:", v28);
          if (v30 && (objc_msgSend(v30, "isEqual:", v29) & 1) == 0)
          {
            objc_msgSend(v101, "drain");
            v98 = (void *)MEMORY[0x1E0C99DA0];
            v99 = *MEMORY[0x1E0C99778];
            v95 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't merge models with two different fetch request templates for name'%@'"), v28);
            v96 = v98;
            v97 = v99;
LABEL_109:
            objc_exception_throw((id)objc_msgSend(v96, "exceptionWithName:reason:userInfo:", v97, v95, 0));
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v128, v144, 16);
      }
      while (v25);
LABEL_30:
      ++v11;
      v5 = v105;
      models = v106;
    }
    while (v11 != (char *)v105);
LABEL_31:
    objc_autoreleasePoolPop(context);
  }
  while (v8++ != obj);
  v32 = (id *)(id)objc_msgSend(-[NSArray objectAtIndex:](models, "objectAtIndex:", 0), "copy");
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = objc_alloc_init(NSMergedPolicyLocalizationPolicy);
  if (objc_msgSend(v32, "_localizationPolicy"))
    -[NSMergedPolicyLocalizationPolicy addPolicy:](v34, "addPolicy:", objc_msgSend(v32, "_localizationPolicy"));
  v35 = objc_msgSend(v32, "_setLocalizationPolicy:", v34);
  if (v5 >= 2)
  {
    v36 = 1;
    v37 = 0x1E1EDA000uLL;
    v102 = v34;
    do
    {
      v103 = (void *)MEMORY[0x18D76B4E4](v35);
      v104 = v36;
      v38 = -[NSArray objectAtIndex:](models, "objectAtIndex:", v36);
      objc_msgSend(v33, "removeAllObjects");
      v111 = v38;
      v39 = (void *)objc_msgSend(v38, "entitiesByName");
      v124 = 0u;
      v125 = 0u;
      v126 = 0u;
      v127 = 0u;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v124, v143, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v125;
        do
        {
          for (k = 0; k != v41; ++k)
          {
            if (*(_QWORD *)v125 != v42)
              objc_enumerationMutation(v39);
            v44 = (void *)objc_msgSend(v39, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * k));
            if (!objc_msgSend(v44, "superentity"))
            {
              v45 = (void *)objc_msgSend(v44, "copy");
              +[NSManagedObjectModel _deepCollectEntitiesInArray:entity:](*(_QWORD *)(v37 + 2864), v33, v45);

            }
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v124, v143, 16);
        }
        while (v41);
      }
      v46 = objc_msgSend(v33, "count");
      if (v46)
      {
        v47 = v46;
        for (m = 0; m != v47; ++m)
        {
          v49 = (void *)objc_msgSend(v33, "objectAtIndex:", m);
          v50 = objc_msgSend(v49, "name");
          if (!v32 || !objc_msgSend(v32[4], "objectForKey:", v50))
            objc_msgSend(v32, "_addEntity:", v49);
        }
      }
      v51 = v111;
      if (objc_msgSend(v111, "_localizationPolicy"))
        -[NSMergedPolicyLocalizationPolicy addPolicy:](v34, "addPolicy:", objc_msgSend(v111, "_localizationPolicy"));
      if (objc_msgSend(v111[5], "count"))
      {
        v122 = 0u;
        v123 = 0u;
        v120 = 0u;
        v121 = 0u;
        obja = v111[5];
        v52 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v120, v142, 16);
        if (v52)
        {
          v53 = v52;
          contexta = *(void **)v121;
          do
          {
            for (n = 0; n != v53; ++n)
            {
              if (*(void **)v121 != contexta)
                objc_enumerationMutation(obja);
              v55 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * n);
              objc_msgSend(v33, "removeAllObjects");
              v56 = (void *)objc_msgSend(v51, "entitiesForConfiguration:", v55);
              v116 = 0u;
              v117 = 0u;
              v118 = 0u;
              v119 = 0u;
              v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v116, v141, 16);
              if (v57)
              {
                v58 = v57;
                v59 = *(_QWORD *)v117;
                do
                {
                  v60 = 0;
                  do
                  {
                    if (*(_QWORD *)v117 != v59)
                      objc_enumerationMutation(v56);
                    v61 = objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * v60), "name");
                    if (v32)
                      v62 = objc_msgSend(v32[4], "objectForKey:", v61);
                    else
                      v62 = 0;
                    objc_msgSend(v33, "addObject:", v62);
                    ++v60;
                  }
                  while (v58 != v60);
                  v63 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v116, v141, 16);
                  v58 = v63;
                }
                while (v63);
              }
              if (v32)
              {
                if (((_BYTE)v32[8] & 3) != 0)
                {
                  v64 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_addEntities called on immutable NSManagedObjectModel");
                  _NSCoreDataLog(17, v64, v65, v66, v67, v68, v69, v70, v100);
                  v71 = __pflogFaultLog;
                  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_fault_impl(&dword_18A253000, v71, OS_LOG_TYPE_FAULT, "CoreData: _addEntities called on immutable NSManagedObjectModel", buf, 2u);
                  }
                }
                v72 = v32[5];
                if (!v72)
                {
                  v72 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  v32[5] = v72;
                }
                v73 = objc_msgSend(v72, "objectForKey:", v55);
                if (v73)
                {
                  v74 = (void *)v73;
                  v138 = 0u;
                  v139 = 0u;
                  v136 = 0u;
                  v137 = 0u;
                  v75 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v136, buf, 16);
                  if (v75)
                  {
                    v76 = v75;
                    v77 = *(_QWORD *)v137;
                    do
                    {
                      for (ii = 0; ii != v76; ++ii)
                      {
                        if (*(_QWORD *)v137 != v77)
                          objc_enumerationMutation(v33);
                        v79 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * ii);
                        if (objc_msgSend(v74, "indexOfObjectIdenticalTo:", v79) == 0x7FFFFFFFFFFFFFFFLL)
                          objc_msgSend(v74, "addObject:", v79);
                      }
                      v76 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v136, buf, 16);
                    }
                    while (v76);
                  }
                }
                else
                {
                  v80 = (void *)objc_msgSend(v33, "mutableCopy");
                  objc_msgSend(v32[5], "setObject:forKey:", v80, v55);

                }
              }
              v51 = v111;
            }
            v53 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v120, v142, 16);
          }
          while (v53);
        }
      }
      v81 = (void *)objc_msgSend(v51, "fetchRequestTemplatesByName");
      v112 = 0u;
      v113 = 0u;
      v114 = 0u;
      v115 = 0u;
      v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v112, v140, 16);
      v37 = 0x1E1EDA000;
      if (v82)
      {
        v83 = v82;
        v84 = *(_QWORD *)v113;
        do
        {
          for (jj = 0; jj != v83; ++jj)
          {
            if (*(_QWORD *)v113 != v84)
              objc_enumerationMutation(v81);
            v86 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * jj);
            if (!objc_msgSend(v32, "fetchRequestTemplateForName:", v86))
            {
              v87 = (void *)objc_msgSend((id)objc_msgSend(v81, "objectForKey:", v86), "copy");
              objc_msgSend(v32, "setFetchRequestTemplate:forName:", v87, v86);

            }
          }
          v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v112, v140, 16);
        }
        while (v83);
      }
      v88 = objc_msgSend(v111, "versionIdentifiers");
      v34 = v102;
      if (v88 && v32)
      {
        v89 = v88;
        v90 = (void *)objc_msgSend(v32, "versionIdentifiers");
        if (v90)
        {
          v91 = (void *)objc_msgSend(v90, "mutableCopy");
          objc_msgSend(v91, "unionSet:", v89);
          objc_msgSend(v32, "setVersionIdentifiers:", (id)objc_msgSend(v91, "copy"));

        }
        else
        {
          objc_msgSend(v32, "setVersionIdentifiers:", v89);
        }
      }
      objc_autoreleasePoolPop(v103);
      v36 = v104 + 1;
      models = v106;
    }
    while (v104 + 1 != v105);
  }

  v92 = v32;
  objc_msgSend(v101, "drain");
  return (NSManagedObjectModel *)v32;
}

+ (NSManagedObjectModel)mergedModelFromBundles:(NSArray *)bundles forStoreMetadata:(NSDictionary *)metadata
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  BOOL v13;
  NSManagedObjectModel *v14;
  NSManagedObjectModel *v15;
  id v16;
  void *context;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x18D76B4E4](a1, a2);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = +[NSManagedObjectModel _modelPathsFromBundles:]((uint64_t)NSManagedObjectModel, bundles);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x18D76B4E4]();
        v21 = 0;
        if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", v11, &v21))v13 = v21 == 0;
        else
          v13 = 1;
        if (v13)
          v14 = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 0));
        else
          v14 = -[NSManagedObjectModelBundle initWithPath:]([NSManagedObjectModelBundle alloc], "initWithPath:", v11);
        v15 = v14;
        if (v15)
          objc_msgSend(v5, "addObject:", v15);
        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }
  v16 = (id)objc_msgSend(a1, "modelByMergingModels:forStoreMetadata:", v5, metadata);
  objc_autoreleasePoolPop(context);
  return (NSManagedObjectModel *)v16;
}

+ (NSManagedObjectModel)modelByMergingModels:(NSArray *)models forStoreMetadata:(NSDictionary *)metadata
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSManagedObjectModel *v20;
  NSManagedObjectModel *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v7 = (id)objc_msgSend(-[NSDictionary objectForKey:](metadata, "objectForKey:", CFSTR("NSStoreModelVersionHashes")), "mutableCopy");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](models, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(models);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x18D76B4E4]();
        v15 = objc_msgSend(v13, "_modelForVersionHashes:", v7);
        if (v15)
        {
          v16 = (void *)v15;
          if (!v10)
            v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v10, "addObject:", v16);
          objc_msgSend(v7, "removeObjectsForKeys:", objc_msgSend((id)objc_msgSend(v16, "entitiesByName"), "allKeys"));
          if (!objc_msgSend(v7, "count"))
          {
            objc_autoreleasePoolPop(v14);
            goto LABEL_15;
          }
        }
        objc_autoreleasePoolPop(v14);
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](models, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_15:
  v17 = v10;
  v18 = objc_msgSend(v10, "count");
  v19 = objc_msgSend(v7, "count");
  v20 = 0;
  if (v18 && !v19)
  {
    if (v18 == 1)
      v21 = (NSManagedObjectModel *)objc_msgSend(v10, "objectAtIndex:", 0);
    else
      v21 = +[NSManagedObjectModel modelByMergingModels:](NSManagedObjectModel, "modelByMergingModels:", v10);
    v20 = v21;
  }
  objc_msgSend(v6, "drain");
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  NSMutableDictionary *entities;
  uint64_t v8;
  void *v9;
  NSMutableDictionary *configurations;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x18D76B4E4](self, a2);
  if (self->_entities)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", self->_entities);
    entities = self->_entities;
  }
  else
  {
    entities = 0;
    v6 = 0;
  }
  objc_msgSend(a3, "encodeObject:forKey:", entities, CFSTR("NSEntities"));

  v8 = -[NSMutableDictionary count](self->_configurations, "count");
  if (v8 != (-[NSMutableDictionary objectForKey:](self->_configurations, "objectForKey:", CFSTR("PF_DEFAULT_CONFIGURATION_NAME")) != 0))
  {
    v15 = v5;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    configurations = self->_configurations;
    v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](configurations, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(configurations);
          objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[NSMutableDictionary objectForKey:](self->_configurations, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i))), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
        }
        v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](configurations, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("PF_DEFAULT_CONFIGURATION_NAME"));
    objc_msgSend(a3, "encodeObject:forKey:", v9, CFSTR("NSConfigurations"));
    v5 = v15;
  }
  objc_msgSend(a3, "encodeObject:forKey:", self->_fetchRequestTemplates, CFSTR("NSFetchRequestTemplates"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_versionIdentifiers, CFSTR("NSVersionIdentifiers"));
  objc_autoreleasePoolPop(v5);
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *v8;
  uint64_t v9;

  if (a3 == self)
    goto LABEL_13;
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  v5 = -[NSManagedObjectModel entitiesByName](self, "entitiesByName");
  v6 = objc_msgSend(a3, "entitiesByName");
  if (v5 == (NSDictionary *)v6
    || (v7 = v6, LOBYTE(v6) = 0, v5) && v7 && (LODWORD(v6) = -[NSDictionary isEqual:](v5, "isEqual:"), (_DWORD)v6))
  {
    v8 = -[NSManagedObjectModel fetchRequestTemplatesByName](self, "fetchRequestTemplatesByName");
    v6 = objc_msgSend(a3, "fetchRequestTemplatesByName");
    if (v8 != (NSDictionary *)v6)
    {
      v9 = v6;
      LOBYTE(v6) = 0;
      if (v8 && v9)
        LOBYTE(v6) = -[NSDictionary isEqual:](v8, "isEqual:");
      return v6;
    }
LABEL_13:
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSManagedObjectModel;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) isEditable %u, entities %@, fetch request templates %@"), -[NSManagedObjectModel description](&v3, sel_description), -[NSManagedObjectModel isEditable](self, "isEditable"), -[NSManagedObjectModel entitiesByName](self, "entitiesByName"), -[NSManagedObjectModel fetchRequestTemplatesByName](self, "fetchRequestTemplatesByName"));
}

- (NSArray)configurations
{
  NSMutableDictionary *configurations;

  configurations = self->_configurations;
  if (configurations)
    return (NSArray *)-[NSMutableDictionary allKeys](configurations, "allKeys");
  else
    return (NSArray *)NSArray_EmptyArray;
}

- (NSDictionary)fetchRequestTemplatesByName
{
  if (self->_fetchRequestTemplates)
    return &self->_fetchRequestTemplates->super;
  else
    return (NSDictionary *)NSDictionary_EmptyDictionary;
}

- (NSFetchRequest)fetchRequestTemplateForName:(NSString *)name
{
  NSFetchRequest *result;

  result = (NSFetchRequest *)self->_fetchRequestTemplates;
  if (result)
    return (NSFetchRequest *)-[NSFetchRequest objectForKey:](result, "objectForKey:", name);
  return result;
}

- (void)setFetchRequestTemplate:(NSFetchRequest *)fetchRequestTemplate forName:(NSString *)name
{
  NSMutableDictionary *fetchRequestTemplates;
  NSFetchRequest *v8;
  NSEntityDescription *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  fetchRequestTemplates = self->_fetchRequestTemplates;
  if (!fetchRequestTemplates)
  {
    fetchRequestTemplates = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_fetchRequestTemplates = fetchRequestTemplates;
  }
  v8 = (NSFetchRequest *)-[NSMutableDictionary objectForKey:](fetchRequestTemplates, "objectForKey:", name);
  if (v8 != fetchRequestTemplate)
  {
    if (fetchRequestTemplate)
    {
      v9 = -[NSFetchRequest entity](fetchRequestTemplate, "entity");
      v10 = -[NSMutableDictionary objectForKey:](self->_entities, "objectForKey:", -[NSEntityDescription name](v9, "name"));
      if (v10)
      {
        v11 = v10;
        if ((NSEntityDescription *)v10 == v9)
        {
          -[NSMutableDictionary setObject:forKey:](self->_fetchRequestTemplates, "setObject:forKey:", fetchRequestTemplate, name);
        }
        else
        {
          v12 = (id)-[NSFetchRequest copy](fetchRequestTemplate, "copy");
          objc_msgSend(v12, "setEntity:", v11);
          -[NSMutableDictionary setObject:forKey:](self->_fetchRequestTemplates, "setObject:forKey:", v12, name);

        }
      }
      else if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
      {
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set fetch request template.  This model does not contain entity '%@'."), -[NSEntityDescription name](v9, "name")), 0));
      }
    }
    else if (v8)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_fetchRequestTemplates, "removeObjectForKey:", name);
    }
  }
}

- (NSFetchRequest)fetchRequestFromTemplateWithName:(NSString *)name substitutionVariables:(NSDictionary *)variables
{
  NSFetchRequest *v5;
  NSFetchRequest *v6;

  v5 = -[NSManagedObjectModel fetchRequestTemplateForName:](self, "fetchRequestTemplateForName:", name);
  if (!v5)
    return 0;
  v6 = (NSFetchRequest *)(id)-[NSFetchRequest copy](v5, "copy");
  -[NSFetchRequest setPredicate:](v6, "setPredicate:", -[NSPredicate predicateWithSubstitutionVariables:](-[NSFetchRequest predicate](v6, "predicate"), "predicateWithSubstitutionVariables:", variables));
  return v6;
}

- (NSDictionary)localizationDictionary
{
  NSDictionary *result;
  NSDictionary *v3;

  result = -[NSManagedObjectModel _localizationPolicy](self, "_localizationPolicy");
  if (result)
  {
    v3 = result;
    -[NSDictionary _ensureFullLocalizationDictionaryIsLoaded](result, "_ensureFullLocalizationDictionaryIsLoaded");
    return (NSDictionary *)-[NSDictionary localizationDictionary](v3, "localizationDictionary");
  }
  return result;
}

- (void)setLocalizationDictionary:(NSDictionary *)localizationDictionary
{
  NSValidationErrorLocalizationPolicy *v5;

  v5 = -[NSManagedObjectModel _localizationPolicy](self, "_localizationPolicy");
  if (!v5)
  {
    v5 = -[NSValidationErrorLocalizationPolicy initWithURL:]([NSValidationErrorLocalizationPolicy alloc], "initWithURL:", 0);
    -[NSManagedObjectModel _setLocalizationPolicy:](self, "_setLocalizationPolicy:", v5);

  }
  -[NSValidationErrorLocalizationPolicy setLocalizationDictionary:](v5, "setLocalizationDictionary:", localizationDictionary);
}

+ (NSDictionary)checksumsForVersionedModelAtURL:(NSURL *)modelURL error:(NSError *)error
{
  id v6;
  NSManagedObjectModelBundle *v7;
  NSManagedObjectModelBundle *v8;
  id v9;
  void *v11;
  uint64_t v12;
  NSError *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v7 = -[NSManagedObjectModelBundle initWithPath:]([NSManagedObjectModelBundle alloc], "initWithPath:", -[NSURL path](modelURL, "path"));
  if (v7)
  {
    v8 = v7;
    v6 = -[NSManagedObjectModelBundle versionChecksums](v7, "versionChecksums");
    if (!v6)
      v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v9 = v6;

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB28A8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load model at URL '%@'"), modelURL);
    v13 = (NSError *)objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 258, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1));
    v14 = v6;
    if (v13)
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR("+checksumsForVersionedModelAtURL:error: Failed to load model at URL '%@' due to error %@"), v15, v16, v17, v18, v19, v20, (uint64_t)modelURL);
      if (error)
        *error = v13;
    }
  }
  return (NSDictionary *)v6;
}

+ (id)versionsHashesForModelAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSManagedObjectModel *v12;
  NSManagedObjectModel *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v7 = (void *)objc_msgSend(a3, "path");
  if (!objc_msgSend((id)objc_msgSend(v7, "pathExtension"), "isEqualToString:", CFSTR("momd"))
    || (v8 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("VersionInfo.plist")), 0), (v9 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v8, &v25)) == 0)|| (v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("NSManagedObjectModel_VersionHashes")), "objectForKey:", objc_msgSend(v9, "objectForKey:", CFSTR("NSManagedObjectModel_CurrentVersionName"))), v11 = (id)v10, !v10))
  {
    v12 = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", a3);
    v13 = v12;
    if (v12)
    {
      v10 = -[NSManagedObjectModel entityVersionHashesByName](v12, "entityVersionHashesByName");
      v14 = (id)v10;

    }
    else
    {
      v10 = 0;
    }
  }
  v15 = v25;
  v16 = (id)v10;
  objc_msgSend(v6, "drain");
  v17 = 0;
  v18 = v25;
  v19 = (id)v10;
  v20 = v25;
  if (!(v10 | (unint64_t)v25))
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v27[0] = CFSTR("Unable to model NSManagedObjectModel");
    v22 = *MEMORY[0x1E0CB2AA0];
    v26[0] = CFSTR("reason");
    v26[1] = v22;
    v27[1] = objc_msgSend(a3, "path");
    v23 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v20 = (id)objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v23);
    v25 = v20;
  }
  if (a4 && v20)
    *a4 = v20;
  return (id)v10;
}

+ (BOOL)versionHashes:(id)a3 compatibleWithStoreMetadata:(id)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", 0x1E1EF1490), "intValue") > 3)
    goto LABEL_13;
  v6 = objc_msgSend(a4, "objectForKey:", CFSTR("NSStoreModelVersionHashes"));
  if (!v6)
    return v6;
  v7 = (void *)v6;
  v8 = objc_msgSend(a3, "count");
  if (v8 != objc_msgSend(v7, "count"))
  {
LABEL_13:
    LOBYTE(v6) = 0;
    return v6;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
LABEL_6:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v11)
        objc_enumerationMutation(a3);
      LODWORD(v6) = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12)), "isEqual:", objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12)));
      if (!(_DWORD)v6)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        LOBYTE(v6) = 1;
        if (v10)
          goto LABEL_6;
        return v6;
      }
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (id)_optimizedEncoding:(id *)a3
{
  _BYTE *v3;
  uint64_t *v4;
  uint64_t *v5;
  _BYTE *v6;
  void *v7;
  void *v8;
  const CFDictionaryKeyCallBacks *v10;
  CFHashCode (__cdecl *v11)(const void *);
  const __CFAllocator *v12;
  const CFArrayCallBacks *v13;
  __CFDictionary *v14;
  const void *v15;
  CFMutableArrayRef v16;
  uint64_t v17;
  __CFDictionary *v18;
  const void *v19;
  const CFArrayCallBacks *v20;
  _BYTE *v21;
  const __CFDictionary *v22;
  uint64_t v23;
  NSKnownKeysDictionary *v24;
  uint64_t v25;
  NSKnownKeysMappingStrategy *v26;
  const void *v27;
  uint64_t v28;
  __CFArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  uint64_t v34;
  const void *v35;
  const void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  const void *v48;
  const void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  __CFDictionary *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const void *v63;
  uint64_t v64;
  const void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const void *v75;
  uint64_t v76;
  const void *v77;
  char *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const void *v84;
  const void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t m;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  void *v104;
  uint64_t v105;
  const void *v106;
  const void *v107;
  const void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  uint64_t v113;
  const void *v114;
  const void *v115;
  void *v116;
  uint64_t v117;
  const void *v118;
  const void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  id v124;
  _QWORD *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const void *v132;
  const void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  const void *v138;
  const void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  const void *v151;
  const void *v152;
  uint64_t v153;
  __CFDictionary *v154;
  uint64_t v155;
  const void *v156;
  uint64_t v157;
  const void *v158;
  uint64_t v159;
  const void *v160;
  const void *v161;
  uint64_t v162;
  const void *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t n;
  const void *v170;
  const void *v171;
  void *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  const void *v179;
  uint64_t v180;
  void *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t ii;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t *v189;
  void *v190;
  uint64_t v191;
  uint64_t v192;
  id v193;
  CFMutableArrayRef v194;
  __CFArray *v195;
  __CFArray *v196;
  __CFDictionary *v197;
  CFMutableArrayRef v198;
  CFMutableArrayRef v199;
  __CFDictionary *v200;
  NSKnownKeysDictionary *v201;
  CFDictionaryRef v202;
  uint64_t v203;
  uint64_t v204;
  __CFDictionary *v205;
  const void *v206;
  const void *v207;
  uint64_t v208;
  const void *v209;
  const void *v210;
  void *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t jj;
  void *v216;
  const void *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t kk;
  void *v228;
  const void *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t mm;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t nn;
  uint64_t v247;
  uint64_t v248;
  int v249;
  unsigned int v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t i1;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t i2;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t i3;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t i4;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t i5;
  uint64_t v271;
  uint64_t v272;
  uint64_t i6;
  uint64_t v274;
  uint64_t v275;
  uint64_t i7;
  void *v277;
  unsigned int v278;
  void *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t i8;
  unint64_t v284;
  void *v285;
  void *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t i9;
  uint64_t v291;
  void *v292;
  id *v293;
  unint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t i10;
  uint64_t v298;
  _QWORD *v299;
  _QWORD *v300;
  uint64_t v301;
  unint64_t v302;
  uint64_t v303;
  uint64_t v304;
  char *v305;
  unint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  void *v314;
  int v315;
  id *v316;
  uint64_t v317;
  id v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  objc_class *v325;
  NSKnownKeysDictionary *v326;
  NSSQLModel *v327;
  uint64_t *v328;
  id v329;
  CFMutableArrayRef v330;
  __CFDictionary *v331;
  unsigned int v332;
  __CFArray *v333;
  __CFDictionary *v334;
  id v335;
  CFMutableArrayRef v336;
  CFDictionaryRef v337;
  uint64_t v338;
  uint64_t v339;
  _BYTE *v340;
  char *v341;
  unsigned int v342;
  CFMutableArrayRef Mutable;
  __CFArray *v344;
  __CFArray *v345;
  objc_class *v346;
  __CFDictionary *v347;
  __int128 v348;
  const void *(__cdecl *v349)(CFAllocatorRef, const void *);
  __CFDictionary *v350;
  unsigned int v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  int v380;
  uint64_t v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  CFDictionaryKeyCallBacks v442;
  CFDictionaryValueCallBacks v443;
  CFDictionaryKeyCallBacks v444;
  _BYTE v445[128];
  _BYTE v446[128];
  _BYTE v447[128];
  _BYTE v448[128];
  _BYTE v449[128];
  _BYTE v450[128];
  _BYTE v451[128];
  _BYTE v452[2048];
  _BYTE v453[128];
  _BYTE v454[128];
  _BYTE v455[128];
  _BYTE v456[128];
  _BYTE v457[128];
  _BYTE v458[128];
  _BYTE v459[128];
  _BYTE v460[128];
  _BYTE v461[128];
  _BYTE v462[128];
  _BYTE v463[128];
  _BYTE v464[128];
  _BYTE v465[128];
  _BYTE v466[128];
  _BYTE v467[128];
  uint64_t v468;

  v3 = (_BYTE *)MEMORY[0x1E0C80A78](self);
  v5 = v4;
  v6 = v3;
  v468 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v3, "_setIsEditable:optimizationStyle:", 0, 1);
  if ((v6[64] & 4) == 0)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    v8 = (void *)objc_msgSend(v7, "_optimizedEncoding:", v5);

    return v8;
  }
  v328 = v5;
  v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v349 = *(const void *(__cdecl **)(CFAllocatorRef, const void *))(MEMORY[0x1E0C9B390] + 8);
  v444.version = 0;
  v444.retain = v349;
  v348 = *(_OWORD *)(MEMORY[0x1E0C9B390] + 16);
  *(_OWORD *)&v444.release = v348;
  v11 = *(CFHashCode (__cdecl **)(const void *))(MEMORY[0x1E0C9B390] + 40);
  v444.equal = 0;
  v444.hash = v11;
  v443.version = 0;
  *(_OWORD *)&v443.retain = *(_OWORD *)(MEMORY[0x1E0C9B3A0] + 8);
  v443.copyDescription = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x1E0C9B3A0] + 24);
  v443.equal = 0;
  v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v340 = v6;
  v13 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  Mutable = CFArrayCreateMutable(v12, 0, MEMORY[0x1E0C9B378]);
  v347 = CFDictionaryCreateMutable(v12, 0, &v444, &v443);
  v333 = CFArrayCreateMutable(v12, 0, v13);
  CFArrayAppendValue(v333, &stru_1E1EE23F0);
  v334 = CFDictionaryCreateMutable(v12, 0, v10, &v443);
  CFDictionarySetValue(v334, &stru_1E1EE23F0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0));
  v345 = CFArrayCreateMutable(v12, 0, v13);
  CFArrayAppendValue(v345, &stru_1E1EE23F0);
  v350 = CFDictionaryCreateMutable(v12, 0, v10, &v443);
  CFDictionarySetValue(v350, &stru_1E1EE23F0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0));
  v344 = CFArrayCreateMutable(v12, 0, v13);
  CFArrayAppendValue(v344, (const void *)objc_msgSend(MEMORY[0x1E0C99D50], "data"));
  v14 = CFDictionaryCreateMutable(v12, 0, v10, &v443);
  v15 = (const void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  CFDictionarySetValue(v14, v15, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0));
  v16 = CFArrayCreateMutable(v12, 0, v13);
  v17 = objc_msgSend(*((id *)v340 + 4), "mapping");
  v330 = v16;
  -[__CFArray addObject:](v16, "addObject:", v17);
  v18 = CFDictionaryCreateMutable(v12, 0, &v444, &v443);
  v19 = (const void *)objc_msgSend(*((id *)v340 + 4), "mapping");
  CFDictionarySetValue(v18, v19, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0));
  v20 = v13;
  v21 = v340;
  v336 = CFArrayCreateMutable(v12, 0, v20);
  v442.version = 0;
  v442.retain = v349;
  v442.release = (CFDictionaryReleaseCallBack)v348;
  v442.equal = 0;
  v442.copyDescription = 0;
  v442.hash = v11;
  v22 = CFDictionaryCreateMutable(v12, 0, &v442, &v443);
  v23 = objc_msgSend(*((id *)v340 + 6), "count");
  v331 = v18;
  v337 = v22;
  if (v23)
  {
    v24 = -[NSKnownKeysDictionary initWithDictionary:]([NSKnownKeysDictionary alloc], "initWithDictionary:", *((_QWORD *)v340 + 6));
    if (!-[__CFDictionary objectForKey:](v18, "objectForKey:", -[NSKnownKeysDictionary mapping](v24, "mapping")))
    {
      v25 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v330, "count"));
      v21 = v340;
      -[__CFArray addObject:](v330, "addObject:", -[NSKnownKeysDictionary mapping](v24, "mapping"));
      v26 = -[NSKnownKeysDictionary mapping](v24, "mapping");
      v27 = (const void *)v25;
      v22 = v337;
      CFDictionarySetValue(v18, v26, v27);
    }
    v326 = v24;
    v441 = 0u;
    v440 = 0u;
    v439 = 0u;
    v438 = 0u;
    v349 = (const void *(__cdecl *)(CFAllocatorRef, const void *))*((_QWORD *)v21 + 6);
    v28 = objc_msgSend(v349, "countByEnumeratingWithState:objects:count:", &v438, v467, 16);
    v29 = v345;
    if (v28)
    {
      v30 = v28;
      v31 = *(_QWORD *)v439;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v439 != v31)
            objc_enumerationMutation(v349);
          v33 = *(_QWORD *)(*((_QWORD *)&v438 + 1) + 8 * i);
          if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v33))
          {
            v34 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v345, "count"));
            -[__CFArray addObject:](v345, "addObject:", v33);
            -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v34, v33);
          }
          v35 = (const void *)objc_msgSend(*((id *)v340 + 6), "objectForKey:", v33);
          if (!CFDictionaryGetValue(v22, v35))
          {
            v36 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v336, "count"));
            v22 = v337;
            -[__CFArray addObject:](v336, "addObject:", v35);
            CFDictionarySetValue(v337, v35, v36);
          }
        }
        v30 = objc_msgSend(v349, "countByEnumeratingWithState:objects:count:", &v438, v467, 16);
      }
      while (v30);
    }
    v21 = v340;
  }
  else
  {
    v326 = 0;
    v29 = v345;
  }
  v325 = (objc_class *)objc_opt_class();
  v346 = (objc_class *)objc_opt_class();
  v327 = -[NSSQLModel initWithManagedObjectModel:configurationName:retainHashHack:]([NSSQLModel alloc], "initWithManagedObjectModel:configurationName:retainHashHack:", v21, 0, 1);
  if (!v327)
  {
    if (v328)
      *v328 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, 0);
LABEL_211:
    v193 = 0;
    goto LABEL_212;
  }
  v437 = 0u;
  v436 = 0u;
  v435 = 0u;
  v434 = 0u;
  v37 = (void *)*((_QWORD *)v21 + 5);
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v434, v466, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v435;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v435 != v40)
          objc_enumerationMutation(v37);
        v42 = *(_QWORD *)(*((_QWORD *)&v434 + 1) + 8 * j);
        if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v42))
        {
          v43 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
          -[__CFArray addObject:](v29, "addObject:", v42);
          -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v43, v42);
        }
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v434, v466, 16);
    }
    while (v39);
  }
  v433 = 0u;
  v432 = 0u;
  v431 = 0u;
  v430 = 0u;
  v349 = (const void *(__cdecl *)(CFAllocatorRef, const void *))*((_QWORD *)v340 + 7);
  v44 = objc_msgSend(v349, "countByEnumeratingWithState:objects:count:", &v430, v465, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v431;
    do
    {
      for (k = 0; k != v45; ++k)
      {
        if (*(_QWORD *)v431 != v46)
          objc_enumerationMutation(v349);
        v48 = *(const void **)(*((_QWORD *)&v430 + 1) + 8 * k);
        if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v48))
        {
          v49 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
          -[__CFArray addObject:](v344, "addObject:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v48, 1, 0));
          CFDictionarySetValue(v14, v48, v49);
        }
      }
      v45 = objc_msgSend(v349, "countByEnumeratingWithState:objects:count:", &v430, v465, 16);
    }
    while (v45);
  }
  v429 = 0u;
  v428 = 0u;
  v427 = 0u;
  v426 = 0u;
  v50 = (id)objc_msgSend(*((id *)v340 + 4), "allValues");
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v426, v464, 16);
  *(_QWORD *)&v348 = v14;
  if (!v51)
  {
    v342 = 0;
    v332 = 0;
    v323 = 0;
    v324 = 0;
    LODWORD(v349) = 0;
    goto LABEL_244;
  }
  v342 = 0;
  v332 = 0;
  v323 = 0;
  v324 = 0;
  LODWORD(v349) = 0;
  v52 = *(_QWORD *)v427;
  v53 = v347;
  v318 = v50;
  v320 = v52;
  do
  {
    v54 = 0;
    v319 = v51;
    do
    {
      if (*(_QWORD *)v427 != v52)
      {
        v55 = v54;
        objc_enumerationMutation(v50);
        v54 = v55;
      }
      v321 = v54;
      v56 = *(id *)(*((_QWORD *)&v426 + 1) + 8 * v54);
      v322 = objc_msgSend(v56, "name", v318);
      v329 = v56;
      if (!-[__CFDictionary objectForKey:](v350, "objectForKey:"))
      {
        v57 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
        -[__CFArray addObject:](v29, "addObject:", v322);
        v56 = v329;
        -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v57, v322);
      }
      v58 = objc_msgSend(v56, "versionHashModifier");
      if (v58)
      {
        v59 = v58;
        if (!-[__CFDictionary objectForKey:](v334, "objectForKey:", v58))
        {
          v60 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
          -[__CFArray addObject:](v333, "addObject:", v59);
          v61 = v60;
          v56 = v329;
          -[__CFDictionary setObject:forKey:](v334, "setObject:forKey:", v61, v59);
        }
      }
      v62 = objc_msgSend(v56, "versionHash");
      if (v62)
      {
        v63 = (const void *)v62;
        if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v62))
        {
          v64 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
          -[__CFArray addObject:](v344, "addObject:", v63);
          v65 = (const void *)v64;
          v56 = v329;
          CFDictionarySetValue(v14, v63, v65);
        }
      }
      v66 = objc_msgSend(v56, "managedObjectClassName");
      if (v66)
      {
        v67 = v66;
        if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v66))
        {
          v68 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
          -[__CFArray addObject:](v29, "addObject:", v67);
          v69 = v68;
          v56 = v329;
          -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v69, v67);
        }
      }
      v70 = objc_msgSend(v56, "renamingIdentifier");
      if (v70)
      {
        v71 = v70;
        if (!-[__CFDictionary objectForKey:](v334, "objectForKey:", v70))
        {
          v72 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
          -[__CFArray addObject:](v333, "addObject:", v71);
          v73 = v72;
          v56 = v329;
          -[__CFDictionary setObject:forKey:](v334, "setObject:forKey:", v73, v71);
        }
      }
      v74 = objc_msgSend(v56, "coreSpotlightDisplayNameExpression");
      if (v74)
      {
        v75 = (const void *)v74;
        if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v74))
        {
          v76 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
          -[__CFArray addObject:](v344, "addObject:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v75, 1, 0));
          v77 = (const void *)v76;
          v56 = v329;
          CFDictionarySetValue(v14, v75, v77);
        }
      }
      v424 = 0u;
      v425 = 0u;
      v422 = 0u;
      v423 = 0u;
      v335 = (id)objc_msgSend(v56, "indexes");
      v339 = objc_msgSend(v335, "countByEnumeratingWithState:objects:count:", &v422, v463, 16);
      if (v339)
      {
        v338 = *(_QWORD *)v423;
        do
        {
          v78 = 0;
          do
          {
            if (*(_QWORD *)v423 != v338)
              objc_enumerationMutation(v335);
            v341 = v78;
            v79 = *(void **)(*((_QWORD *)&v422 + 1) + 8 * (_QWORD)v78);
            v80 = objc_msgSend(v79, "name");
            if (v80)
            {
              v81 = v80;
              if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v80))
              {
                v82 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
                -[__CFArray addObject:](v29, "addObject:", v81);
                -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v82, v81);
              }
            }
            v83 = objc_msgSend(v79, "partialIndexPredicate");
            if (v83)
            {
              v84 = (const void *)v83;
              if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v83))
              {
                v85 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                -[__CFArray addObject:](v344, "addObject:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v84, 1, 0));
                CFDictionarySetValue(v14, v84, v85);
              }
            }
            v420 = 0u;
            v421 = 0u;
            v418 = 0u;
            v419 = 0u;
            v86 = (void *)objc_msgSend(v79, "elements");
            v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v418, v462, 16);
            if (v87)
            {
              v88 = v87;
              v89 = *(_QWORD *)v419;
              do
              {
                for (m = 0; m != v88; ++m)
                {
                  if (*(_QWORD *)v419 != v89)
                    objc_enumerationMutation(v86);
                  v91 = *(void **)(*((_QWORD *)&v418 + 1) + 8 * m);
                  v92 = objc_msgSend(v91, "propertyName");
                  if (v92)
                  {
                    v93 = v92;
                    if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v92))
                    {
                      v94 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v345, "count"));
                      v14 = (__CFDictionary *)v348;
                      -[__CFArray addObject:](v345, "addObject:", v93);
                      v95 = v94;
                      v53 = v347;
                      -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v95, v93);
                    }
                  }
                  v96 = (void *)objc_msgSend(v91, "property");
                  if (objc_msgSend(v96, "_propertyType") == 5)
                  {
                    if (!-[__CFDictionary objectForKey:](v53, "objectForKey:", v96))
                    {
                      v97 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](Mutable, "count"));
                      v53 = v347;
                      -[__CFArray addObject:](Mutable, "addObject:", v96);
                      CFDictionarySetValue(v347, v96, v97);
                    }
                    v98 = objc_msgSend(v96, "name");
                    if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v98))
                    {
                      v99 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v345, "count"));
                      v14 = (__CFDictionary *)v348;
                      -[__CFArray addObject:](v345, "addObject:", v98);
                      v100 = v99;
                      v53 = v347;
                      -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v100, v98);
                    }
                    LODWORD(v349) = (_DWORD)v349 + 1;
                    v101 = objc_msgSend(v96, "expression");
                    if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v101))
                    {
                      v102 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                      v14 = (__CFDictionary *)v348;
                      -[__CFArray addObject:](v344, "addObject:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v101, 1, 0));
                      objc_msgSend((id)v348, "setObject:forKey:", v102, v101);
                    }
                  }
                }
                v342 += v88;
                v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v418, v462, 16);
              }
              while (v88);
            }
            v78 = v341 + 1;
            v29 = v345;
          }
          while (v341 + 1 != (char *)v339);
          v332 += v339;
          v339 = objc_msgSend(v335, "countByEnumeratingWithState:objects:count:", &v422, v463, 16);
        }
        while (v339);
      }
      v103 = v329;
      v104 = (void *)objc_msgSend(v329, "userInfo");
      if (objc_msgSend(v104, "count") && !-[__CFDictionary objectForKey:](v14, "objectForKey:", v104))
      {
        v105 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
        -[__CFArray addObject:](v344, "addObject:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v104, 1, 0));
        v106 = (const void *)v105;
        v103 = v329;
        CFDictionarySetValue(v14, v104, v106);
      }
      if (!-[__CFDictionary objectForKey:](v331, "objectForKey:", objc_msgSend(v103, "_propertySearchMapping")))
      {
        v107 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v330, "count"));
        v103 = v329;
        -[__CFArray addObject:](v330, "addObject:", objc_msgSend(v329, "_propertySearchMapping"));
        CFDictionarySetValue(v331, (const void *)objc_msgSend(v329, "_propertySearchMapping"), v107);
      }
      if (objc_msgSend(v103, "subentitiesByName"))
      {
        if (objc_msgSend((id)objc_msgSend(v103, "subentitiesByName"), "count"))
        {
          v108 = (const void *)objc_msgSend((id)objc_msgSend(v103, "subentitiesByName"), "mapping");
          if (!-[__CFDictionary objectForKey:](v331, "objectForKey:", v108))
          {
            v109 = (void *)MEMORY[0x1E0CB37E8];
            v110 = -[__CFArray count](v330, "count");
            v111 = v109;
            v103 = v329;
            CFDictionarySetValue(v331, v108, (const void *)objc_msgSend(v111, "numberWithUnsignedInteger:", v110));
            -[__CFArray addObject:](v330, "addObject:", v108);
          }
        }
      }
      v112 = (void *)objc_msgSend(v103, "attributesByName");
      if (!-[__CFDictionary objectForKey:](v331, "objectForKey:", objc_msgSend(v112, "mapping")))
      {
        v113 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v330, "count"));
        -[__CFArray addObject:](v330, "addObject:", objc_msgSend(v112, "mapping"));
        v114 = (const void *)objc_msgSend(v112, "mapping");
        v115 = (const void *)v113;
        v103 = v329;
        CFDictionarySetValue(v331, v114, v115);
      }
      v116 = (void *)objc_msgSend(v103, "relationshipsByName");
      if (!-[__CFDictionary objectForKey:](v331, "objectForKey:", objc_msgSend(v116, "mapping")))
      {
        v117 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v330, "count"));
        -[__CFArray addObject:](v330, "addObject:", objc_msgSend(v116, "mapping"));
        v118 = (const void *)objc_msgSend(v116, "mapping");
        v119 = (const void *)v117;
        v103 = v329;
        CFDictionarySetValue(v331, v118, v119);
      }
      v416 = 0u;
      v417 = 0u;
      v414 = 0u;
      v415 = 0u;
      v120 = (void *)objc_msgSend(v103, "properties");
      v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v414, v461, 16);
      if (v121)
      {
        v122 = v121;
        v123 = *(id *)v415;
        v338 = (uint64_t)v120;
        v335 = v123;
LABEL_105:
        v124 = 0;
        v339 = v122;
        while (1)
        {
          if (*(id *)v415 != v123)
            objc_enumerationMutation(v120);
          v125 = *(_QWORD **)(*((_QWORD *)&v414 + 1) + 8 * (_QWORD)v124);
          v126 = objc_msgSend(v125, "name");
          if (object_getClass(v125) != v325)
            break;
LABEL_192:
          v124 = (char *)v124 + 1;
          if (v124 == (id)v122)
          {
            v122 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v414, v461, 16);
            v53 = v347;
            if (!v122)
              goto LABEL_194;
            goto LABEL_105;
          }
        }
        if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v126))
        {
          v127 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
          -[__CFArray addObject:](v29, "addObject:", v126);
          -[__CFDictionary setValue:forKey:](v350, "setValue:forKey:", v127, v126);
        }
        v128 = objc_msgSend(v125, "versionHashModifier");
        if (v128)
        {
          v129 = v128;
          if (!-[__CFDictionary objectForKey:](v334, "objectForKey:", v128))
          {
            v130 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
            -[__CFArray addObject:](v333, "addObject:", v129);
            -[__CFDictionary setValue:forKey:](v334, "setValue:forKey:", v130, v129);
          }
        }
        v131 = objc_msgSend(v125, "versionHash");
        if (v131)
        {
          v132 = (const void *)v131;
          if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v131))
          {
            v133 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
            -[__CFArray addObject:](v344, "addObject:", v132);
            CFDictionarySetValue(v14, v132, v133);
          }
        }
        v134 = (void *)objc_msgSend(v125, "renamingIdentifier");
        if (v134)
        {
          v135 = v134;
          if ((objc_msgSend(v134, "isEqualToString:", objc_msgSend(v125, "name")) & 1) == 0
            && !-[__CFDictionary objectForKey:](v334, "objectForKey:", v135))
          {
            v136 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
            -[__CFArray addObject:](v333, "addObject:", v135);
            -[__CFDictionary setObject:forKey:](v334, "setObject:forKey:", v136, v135);
          }
        }
        v137 = (void *)objc_msgSend(v125, "userInfo");
        if (objc_msgSend(v137, "count") && !-[__CFDictionary objectForKey:](v14, "objectForKey:", v137))
        {
          v138 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
          -[__CFArray addObject:](v344, "addObject:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v137, 1, 0));
          CFDictionarySetValue(v14, v137, v138);
        }
        v139 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](Mutable, "count"));
        -[__CFArray addObject:](Mutable, "addObject:", v125);
        CFDictionarySetValue(v347, v125, v139);
        v140 = objc_msgSend(v125, "_propertyType");
        v341 = (char *)v124;
        switch(v140)
        {
          case 2:
          case 6:
            v141 = v140;
            v142 = objc_msgSend(v125, "attributeValueClassName");
            if (v142)
            {
              v143 = v142;
              if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v142))
              {
                v144 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
                -[__CFArray addObject:](v29, "addObject:", v143);
                -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v144, v143);
              }
            }
            v145 = objc_msgSend(v125, "valueTransformerName");
            if (v145)
            {
              v146 = v145;
              if (!-[__CFDictionary objectForKey:](v334, "objectForKey:", v145))
              {
                v147 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
                -[__CFArray addObject:](v333, "addObject:", v146);
                -[__CFDictionary setObject:forKey:](v334, "setObject:forKey:", v147, v146);
              }
            }
            v148 = objc_msgSend(v125, "defaultValue");
            if (!v148)
              goto LABEL_157;
            v149 = (void *)v148;
            v150 = objc_msgSend(v125, "attributeType");
            if (v150 <= 499)
            {
              if (v150 <= 299)
              {
                if (v150 != 100 && v150 != 200)
                  goto LABEL_155;
                goto LABEL_157;
              }
              if (v150 == 300)
                goto LABEL_157;
              if (v150 != 400)
              {
LABEL_155:
                if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v149))
                {
                  v155 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v149, 1, 0);
                  v156 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                  v14 = (__CFDictionary *)v348;
                  -[__CFArray addObject:](v344, "addObject:", v155);
                  CFDictionarySetValue((CFMutableDictionaryRef)v348, v149, v156);
                }
                goto LABEL_157;
              }
              v149 = (void *)objc_msgSend(v149, "stringValue");
              if (-[__CFDictionary objectForKey:](v350, "objectForKey:", v149))
              {
LABEL_157:
                if (v141 == 6)
                {
                  v157 = objc_msgSend(v125, "derivationExpression");
                  if (v157)
                  {
                    v158 = (const void *)v157;
                    if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v157))
                    {
                      v159 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v158, 1, 0);
                      v160 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                      v14 = (__CFDictionary *)v348;
                      -[__CFArray addObject:](v344, "addObject:", v159);
                      CFDictionarySetValue((CFMutableDictionaryRef)v348, v158, v160);
                    }
                  }
                  if (v125)
                  {
                    v161 = (const void *)v125[16];
                    if (v161)
                    {
                      if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v125[16]))
                      {
                        v162 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v161, 1, 0);
                        v163 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                        v14 = (__CFDictionary *)v348;
                        -[__CFArray addObject:](v344, "addObject:", v162);
                        CFDictionarySetValue((CFMutableDictionaryRef)v348, v161, v163);
                      }
                    }
                  }
                  ++HIDWORD(v323);
                }
                else
                {
                  LODWORD(v323) = v323 + 1;
                }
                goto LABEL_167;
              }
              v153 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
              -[__CFArray addObject:](v29, "addObject:", v149);
              v154 = v350;
            }
            else
            {
              if (v150 <= 699)
              {
                if (v150 != 500 && v150 != 600)
                  goto LABEL_155;
                goto LABEL_157;
              }
              if (v150 != 700)
              {
                if (v150 != 800 && v150 != 900)
                  goto LABEL_155;
                goto LABEL_157;
              }
              if (-[__CFDictionary objectForKey:](v334, "objectForKey:", v149))
                goto LABEL_157;
              v153 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
              -[__CFArray addObject:](v333, "addObject:", v149);
              v154 = v334;
            }
            -[__CFDictionary setObject:forKey:](v154, "setObject:forKey:", v153, v149);
            goto LABEL_157;
          case 3:
            ++HIDWORD(v324);
            v151 = (const void *)objc_msgSend(v125, "fetchRequest");
            if (!CFDictionaryGetValue(v337, v151))
            {
              v152 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v336, "count"));
              -[__CFArray addObject:](v336, "addObject:", v151);
              CFDictionarySetValue(v337, v151, v152);
            }
            goto LABEL_167;
          case 4:
            LODWORD(v324) = v324 + 1;
LABEL_167:
            v412 = 0u;
            v413 = 0u;
            v410 = 0u;
            v411 = 0u;
            v164 = v125;
            v165 = (void *)objc_msgSend(v125, "_rawValidationPredicates");
            v166 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v410, v460, 16);
            if (v166)
            {
              v167 = v166;
              v168 = *(_QWORD *)v411;
              do
              {
                for (n = 0; n != v167; ++n)
                {
                  if (*(_QWORD *)v411 != v168)
                    objc_enumerationMutation(v165);
                  v170 = *(const void **)(*((_QWORD *)&v410 + 1) + 8 * n);
                  if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v170))
                  {
                    v171 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                    v14 = (__CFDictionary *)v348;
                    -[__CFArray addObject:](v344, "addObject:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v170, 1, 0));
                    CFDictionarySetValue((CFMutableDictionaryRef)v348, v170, v171);
                  }
                }
                v167 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v410, v460, 16);
              }
              while (v167);
            }
            v408 = 0u;
            v409 = 0u;
            v406 = 0u;
            v407 = 0u;
            v172 = (void *)objc_msgSend(v164, "_rawValidationWarnings");
            v173 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v406, v459, 16);
            if (!v173)
            {
              v29 = v345;
              goto LABEL_191;
            }
            v174 = v173;
            v175 = *(_QWORD *)v407;
            v29 = v345;
            while (2)
            {
              v176 = 0;
LABEL_179:
              if (*(_QWORD *)v407 != v175)
                objc_enumerationMutation(v172);
              v177 = *(void **)(*((_QWORD *)&v406 + 1) + 8 * v176);
              if (objc_msgSend(v177, "isNSString"))
              {
                if (!-[__CFDictionary objectForKey:](v334, "objectForKey:", v177))
                {
                  v178 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
                  v29 = v345;
                  -[__CFArray addObject:](v333, "addObject:", v177);
                  -[__CFDictionary setObject:forKey:](v334, "setObject:forKey:", v178, v177);
                }
                goto LABEL_187;
              }
              if (objc_msgSend(v177, "isNSNumber"))
              {
                if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v177))
                {
                  v179 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                  v14 = (__CFDictionary *)v348;
                  -[__CFArray addObject:](v344, "addObject:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v177, 1, 0));
                  CFDictionarySetValue((CFMutableDictionaryRef)v348, v177, v179);
                }
LABEL_187:
                if (v174 == ++v176)
                {
                  v174 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v406, v459, 16);
                  if (!v174)
                  {
LABEL_191:
                    v120 = (void *)v338;
                    v122 = v339;
                    v123 = v335;
                    v124 = v341;
                    goto LABEL_192;
                  }
                  continue;
                }
                goto LABEL_179;
              }
              break;
            }
            v189 = v328;
            if (!v328)
              goto LABEL_211;
            v190 = (void *)MEMORY[0x1E0CB35C8];
            v191 = *MEMORY[0x1E0CB28A8];
            v192 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Invalid value in warnings array"), CFSTR("Base error"));
LABEL_208:
            v193 = 0;
            *v189 = objc_msgSend(v190, "errorWithDomain:code:userInfo:", v191, 134060, v192);
            break;
          case 7:
            v189 = v328;
            if (!v328)
              goto LABEL_211;
            v190 = (void *)MEMORY[0x1E0CB35C8];
            v191 = *MEMORY[0x1E0CB28A8];
            v192 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Unsupported property; can't optimize composite attribute"),
                     CFSTR("Base error"),
                     v125,
                     CFSTR("Property"),
                     0);
            goto LABEL_208;
          default:
            v189 = v328;
            if (!v328)
              goto LABEL_211;
            v190 = (void *)MEMORY[0x1E0CB35C8];
            v191 = *MEMORY[0x1E0CB28A8];
            v192 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Invalid property; can't optimize"),
                     CFSTR("Base error"),
                     v125,
                     CFSTR("Property"),
                     0);
            goto LABEL_208;
        }
LABEL_212:
        v194 = Mutable;
        v195 = v344;
        v196 = v333;
        v197 = v334;
        v198 = v336;
        if (!Mutable)
          goto LABEL_214;
LABEL_213:
        CFRelease(v194);
        goto LABEL_214;
      }
LABEL_194:
      v180 = -[NSSQLModel entityNamed:](v327, "entityNamed:", v322);
      v402 = 0u;
      v403 = 0u;
      v404 = 0u;
      v405 = 0u;
      v181 = (void *)-[NSSQLEntity properties](v180);
      v182 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v402, v458, 16);
      if (v182)
      {
        v183 = v182;
        v184 = *(_QWORD *)v403;
        do
        {
          for (ii = 0; ii != v183; ++ii)
          {
            if (*(_QWORD *)v403 != v184)
              objc_enumerationMutation(v181);
            v186 = objc_msgSend(*(id *)(*((_QWORD *)&v402 + 1) + 8 * ii), "name");
            if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v186))
            {
              v187 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
              -[__CFArray addObject:](v29, "addObject:", v186);
              v188 = v187;
              v53 = v347;
              -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v188, v186);
            }
          }
          v183 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v402, v458, 16);
        }
        while (v183);
      }
      v52 = v320;
      v54 = v321 + 1;
      v50 = v318;
    }
    while (v321 + 1 != v319);
    v51 = objc_msgSend(v318, "countByEnumeratingWithState:objects:count:", &v426, v464, 16);
    v52 = v320;
  }
  while (v51);
LABEL_244:
  v400 = 0u;
  v401 = 0u;
  v398 = 0u;
  v399 = 0u;
  v338 = -[__CFArray countByEnumeratingWithState:objects:count:](v336, "countByEnumeratingWithState:objects:count:", &v398, v457, 16);
  if (v338)
  {
    v335 = *(id *)v399;
    do
    {
      v203 = 0;
      do
      {
        if (*(id *)v399 != v335)
          objc_enumerationMutation(v336);
        v339 = v203;
        v341 = *(char **)(*((_QWORD *)&v398 + 1) + 8 * v203);
        v204 = objc_msgSend(v341, "predicate");
        v205 = v347;
        if (v204)
        {
          v206 = (const void *)v204;
          if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v204))
          {
            v207 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
            -[__CFArray addObject:](v344, "addObject:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v206, 1, 0));
            CFDictionarySetValue(v14, v206, v207);
          }
        }
        v208 = objc_msgSend(v341, "havingPredicate");
        if (v208)
        {
          v209 = (const void *)v208;
          if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v208))
          {
            v210 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
            -[__CFArray addObject:](v344, "addObject:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v209, 1, 0));
            CFDictionarySetValue(v14, v209, v210);
          }
        }
        v211 = (void *)objc_msgSend(v341, "propertiesToFetch");
        v394 = 0u;
        v395 = 0u;
        v396 = 0u;
        v397 = 0u;
        v212 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v394, v456, 16);
        if (v212)
        {
          v213 = v212;
          v214 = *(_QWORD *)v395;
          do
          {
            for (jj = 0; jj != v213; ++jj)
            {
              if (*(_QWORD *)v395 != v214)
                objc_enumerationMutation(v211);
              v216 = *(void **)(*((_QWORD *)&v394 + 1) + 8 * jj);
              if (object_getClass(v216) == v346)
              {
                if (!-[__CFDictionary objectForKey:](v205, "objectForKey:", v216))
                {
                  v217 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](Mutable, "count"));
                  v205 = v347;
                  -[__CFArray addObject:](Mutable, "addObject:", v216);
                  CFDictionarySetValue(v347, v216, v217);
                }
                v218 = objc_msgSend(v216, "name");
                if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v218))
                {
                  v219 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v345, "count"));
                  v14 = (__CFDictionary *)v348;
                  -[__CFArray addObject:](v345, "addObject:", v218);
                  v220 = v219;
                  v205 = v347;
                  -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v220, v218);
                }
                LODWORD(v349) = (_DWORD)v349 + 1;
                v221 = objc_msgSend(v216, "expression");
                if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v221))
                {
                  v222 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                  v14 = (__CFDictionary *)v348;
                  -[__CFArray addObject:](v344, "addObject:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v221, 1, 0));
                  objc_msgSend((id)v348, "setObject:forKey:", v222, v221);
                }
              }
            }
            v213 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v394, v456, 16);
          }
          while (v213);
        }
        v223 = (void *)objc_msgSend(v341, "propertiesToGroupBy");
        v390 = 0u;
        v391 = 0u;
        v392 = 0u;
        v393 = 0u;
        v224 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v390, v455, 16);
        if (v224)
        {
          v225 = v224;
          v226 = *(_QWORD *)v391;
          do
          {
            for (kk = 0; kk != v225; ++kk)
            {
              if (*(_QWORD *)v391 != v226)
                objc_enumerationMutation(v223);
              v228 = *(void **)(*((_QWORD *)&v390 + 1) + 8 * kk);
              if (object_getClass(v228) == v346)
              {
                if (!-[__CFDictionary objectForKey:](v205, "objectForKey:", v228))
                {
                  v229 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](Mutable, "count"));
                  v205 = v347;
                  -[__CFArray addObject:](Mutable, "addObject:", v228);
                  CFDictionarySetValue(v347, v228, v229);
                }
                v230 = objc_msgSend(v228, "name");
                if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v230))
                {
                  v231 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v345, "count"));
                  v14 = (__CFDictionary *)v348;
                  -[__CFArray addObject:](v345, "addObject:", v230);
                  v232 = v231;
                  v205 = v347;
                  -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v232, v230);
                }
                LODWORD(v349) = (_DWORD)v349 + 1;
                v233 = objc_msgSend(v228, "expression");
                if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v233))
                {
                  v234 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                  v14 = (__CFDictionary *)v348;
                  -[__CFArray addObject:](v344, "addObject:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v233, 1, 0));
                  objc_msgSend((id)v348, "setObject:forKey:", v234, v233);
                }
              }
            }
            v225 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v390, v455, 16);
          }
          while (v225);
        }
        v235 = (void *)objc_msgSend(v341, "sortDescriptors");
        v386 = 0u;
        v387 = 0u;
        v388 = 0u;
        v389 = 0u;
        v236 = objc_msgSend(v235, "countByEnumeratingWithState:objects:count:", &v386, v454, 16);
        v29 = v345;
        if (v236)
        {
          v237 = v236;
          v238 = *(_QWORD *)v387;
          do
          {
            for (mm = 0; mm != v237; ++mm)
            {
              if (*(_QWORD *)v387 != v238)
                objc_enumerationMutation(v235);
              v240 = *(_QWORD *)(*((_QWORD *)&v386 + 1) + 8 * mm);
              if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v240))
              {
                v241 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                v14 = (__CFDictionary *)v348;
                -[__CFArray addObject:](v344, "addObject:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v240, 1, 0));
                objc_msgSend((id)v348, "setObject:forKey:", v241, v240);
              }
            }
            v237 = objc_msgSend(v235, "countByEnumeratingWithState:objects:count:", &v386, v454, 16);
          }
          while (v237);
        }
        v242 = (void *)objc_msgSend(v341, "relationshipKeyPathsForPrefetching");
        v382 = 0u;
        v383 = 0u;
        v384 = 0u;
        v385 = 0u;
        v243 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v382, v453, 16);
        if (v243)
        {
          v244 = v243;
          v245 = *(_QWORD *)v383;
          do
          {
            for (nn = 0; nn != v244; ++nn)
            {
              if (*(_QWORD *)v383 != v245)
                objc_enumerationMutation(v242);
              v247 = *(_QWORD *)(*((_QWORD *)&v382 + 1) + 8 * nn);
              if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v247))
              {
                v248 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFArray count](v345, "count"));
                -[__CFArray addObject:](v345, "addObject:", v247);
                -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v248, v247);
              }
            }
            v244 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v382, v453, 16);
          }
          while (v244);
        }
        v203 = v339 + 1;
      }
      while (v339 + 1 != v338);
      v338 = -[__CFArray countByEnumeratingWithState:objects:count:](v336, "countByEnumeratingWithState:objects:count:", &v398, v457, 16);
    }
    while (v338);
  }
  v381 = 0;
  v380 = -559038737;
  v193 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  objc_msgSend(v193, "appendBytes:length:", "momv2$srsraori55717101jhus-[6910aathnnhi86786714[-;uadmiraenv143", 64);
  v249 = objc_msgSend(v193, "length");
  v250 = (v249 + 3) & 0xFFFFFFFC;
  if (v250 != v249)
    objc_msgSend(v193, "appendBytes:length:", &v381, v250 - v249);
  v346 = (objc_class *)objc_msgSend(v193, "length");
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v381, 4);
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  v341 = (char *)objc_msgSend(v193, "length");
  _writeInt32IntoData(v193, -[__CFArray count](v333, "count"));
  v378 = 0u;
  v379 = 0u;
  v376 = 0u;
  v377 = 0u;
  v251 = -[__CFArray countByEnumeratingWithState:objects:count:](v333, "countByEnumeratingWithState:objects:count:", &v376, v451, 16);
  if (v251)
  {
    v252 = v251;
    v253 = *(_QWORD *)v377;
    do
    {
      for (i1 = 0; i1 != v252; ++i1)
      {
        if (*(_QWORD *)v377 != v253)
          objc_enumerationMutation(v333);
        _writeStringIntoData(*(void **)(*((_QWORD *)&v376 + 1) + 8 * i1), v193, v452);
      }
      v252 = -[__CFArray countByEnumeratingWithState:objects:count:](v333, "countByEnumeratingWithState:objects:count:", &v376, v451, 16);
    }
    while (v252);
  }
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  v339 = objc_msgSend(v193, "length");
  _writeInt32IntoData(v193, -[__CFArray count](v29, "count"));
  v374 = 0u;
  v375 = 0u;
  v372 = 0u;
  v373 = 0u;
  v255 = -[__CFArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v372, v450, 16);
  if (v255)
  {
    v256 = v255;
    v257 = *(_QWORD *)v373;
    do
    {
      for (i2 = 0; i2 != v256; ++i2)
      {
        if (*(_QWORD *)v373 != v257)
          objc_enumerationMutation(v29);
        _writePFEncodedStringShapeIntoData(v193, *(void **)(*((_QWORD *)&v372 + 1) + 8 * i2), v452);
      }
      v256 = -[__CFArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v372, v450, 16);
    }
    while (v256);
  }
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  v338 = objc_msgSend(v193, "length");
  _writeInt32IntoData(v193, -[__CFArray count](v344, "count"));
  v370 = 0u;
  v371 = 0u;
  v368 = 0u;
  v369 = 0u;
  v259 = -[__CFArray countByEnumeratingWithState:objects:count:](v344, "countByEnumeratingWithState:objects:count:", &v368, v449, 16);
  if (v259)
  {
    v260 = v259;
    v261 = *(_QWORD *)v369;
    do
    {
      for (i3 = 0; i3 != v260; ++i3)
      {
        if (*(_QWORD *)v369 != v261)
          objc_enumerationMutation(v344);
        _writePFEncodedDataShapeIntoData(v193, *(void **)(*((_QWORD *)&v368 + 1) + 8 * i3));
      }
      v260 = -[__CFArray countByEnumeratingWithState:objects:count:](v344, "countByEnumeratingWithState:objects:count:", &v368, v449, 16);
    }
    while (v260);
  }
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  v335 = (id)objc_msgSend(v193, "length");
  _writeInt32IntoData(v193, -[__CFArray count](v330, "count"));
  v366 = 0u;
  v367 = 0u;
  v364 = 0u;
  v365 = 0u;
  v263 = -[__CFArray countByEnumeratingWithState:objects:count:](v330, "countByEnumeratingWithState:objects:count:", &v364, v448, 16);
  if (v263)
  {
    v264 = v263;
    v265 = *(_QWORD *)v365;
    do
    {
      for (i4 = 0; i4 != v264; ++i4)
      {
        if (*(_QWORD *)v365 != v265)
          objc_enumerationMutation(v330);
        _writeKKDMappingStrategyIntoData(v193, *(_QWORD **)(*((_QWORD *)&v364 + 1) + 8 * i4), v350);
      }
      v264 = -[__CFArray countByEnumeratingWithState:objects:count:](v330, "countByEnumeratingWithState:objects:count:", &v364, v448, 16);
    }
    while (v264);
  }
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  v329 = (id)objc_msgSend(v193, "length");
  _writeInt32IntoData(v193, v323);
  _writeInt32IntoData(v193, HIDWORD(v323));
  _writeInt32IntoData(v193, v324);
  _writeInt32IntoData(v193, v349);
  _writeInt32IntoData(v193, HIDWORD(v324));
  v362 = 0u;
  v363 = 0u;
  v360 = 0u;
  v361 = 0u;
  v267 = -[__CFArray countByEnumeratingWithState:objects:count:](Mutable, "countByEnumeratingWithState:objects:count:", &v360, v447, 16);
  if (v267)
  {
    v268 = v267;
    v269 = *(_QWORD *)v361;
    do
    {
      for (i5 = 0; i5 != v268; ++i5)
      {
        if (*(_QWORD *)v361 != v269)
          objc_enumerationMutation(Mutable);
        objc_msgSend(*(id *)(*((_QWORD *)&v360 + 1) + 8 * i5), "_writeIntoData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:entitiesSlots:fetchRequests:", v193, v347, v350, v334, v14, objc_msgSend(*((id *)v340 + 4), "mapping"), v337);
      }
      v268 = -[__CFArray countByEnumeratingWithState:objects:count:](Mutable, "countByEnumeratingWithState:objects:count:", &v360, v447, 16);
    }
    while (v268);
  }
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  v322 = objc_msgSend(v193, "length");
  _writeInt32IntoData(v193, objc_msgSend(*((id *)v340 + 4), "count"));
  v271 = objc_msgSend((id)objc_msgSend(*((id *)v340 + 4), "mapping"), "length");
  if (v271)
  {
    v272 = v271;
    for (i6 = 0; i6 != v272; ++i6)
      objc_msgSend((id)objc_msgSend(*((id *)v340 + 4), "valueAtIndex:", i6), "_writeIntoData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:uniquedMappings:entities:", v193, v347, v350, v334, v14, v331, *((_QWORD *)v340 + 4));
  }
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  v325 = (objc_class *)objc_msgSend(v193, "length");
  _writeInt32IntoData(v193, -[__CFArray count](v336, "count"));
  v274 = -[__CFArray count](v336, "count");
  if (v274)
  {
    v275 = v274;
    for (i7 = 0; i7 != v275; ++i7)
      objc_msgSend((id)-[__CFArray objectAtIndex:](v336, "objectAtIndex:", i7), "_writeIntoData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:uniquedMappings:entities:", v193, v347, v350, v334, v14, v331, *((_QWORD *)v340 + 4));
  }
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  objc_msgSend(v193, "appendBytes:length:", &v380, 4);
  v321 = objc_msgSend(v193, "length");
  _writeInt32IntoData(v193, *((_DWORD *)v340 + 16));
  v277 = (void *)*((_QWORD *)v340 + 4);
  if (v277)
    v278 = objc_msgSend(v277, "count");
  else
    v278 = 0;
  _writeInt32IntoData(v193, v278);
  if (v326 && -[NSKnownKeysDictionary count](v326, "count"))
  {
    _writeInt32IntoData(v193, objc_msgSend(*((id *)v340 + 6), "count"));
    v358 = 0u;
    v359 = 0u;
    v356 = 0u;
    v357 = 0u;
    v279 = (void *)objc_msgSend(*((id *)v340 + 6), "allValues");
    v280 = objc_msgSend(v279, "countByEnumeratingWithState:objects:count:", &v356, v446, 16);
    if (v280)
    {
      v281 = v280;
      v282 = *(_QWORD *)v357;
      do
      {
        for (i8 = 0; i8 != v281; ++i8)
        {
          if (*(_QWORD *)v357 != v282)
            objc_enumerationMutation(v279);
          v284 = objc_msgSend((id)CFDictionaryGetValue(v337, *(const void **)(*((_QWORD *)&v356 + 1) + 8 * i8)), "unsignedIntegerValue");
          _writeInt64IntoData(v193, v284);
        }
        v281 = objc_msgSend(v279, "countByEnumeratingWithState:objects:count:", &v356, v446, 16);
      }
      while (v281);
    }
  }
  else
  {
    _writeInt32IntoData(v193, 0);
  }
  v285 = (void *)*((_QWORD *)v340 + 5);
  if (v285)
  {
    _writeInt32IntoData(v193, objc_msgSend(v285, "count"));
    v286 = (void *)objc_msgSend(*((id *)v340 + 4), "mapping");
    v352 = 0u;
    v353 = 0u;
    v354 = 0u;
    v355 = 0u;
    *(_QWORD *)&v348 = *((_QWORD *)v340 + 5);
    v287 = objc_msgSend((id)v348, "countByEnumeratingWithState:objects:count:", &v352, v445, 16);
    if (v287)
    {
      v288 = v287;
      v289 = *(_QWORD *)v353;
      do
      {
        for (i9 = 0; i9 != v288; ++i9)
        {
          if (*(_QWORD *)v353 != v289)
            objc_enumerationMutation((id)v348);
          v291 = *(_QWORD *)(*((_QWORD *)&v352 + 1) + 8 * i9);
          v292 = (void *)objc_msgSend(*((id *)v340 + 5), "objectForKey:", v291);
          _writeInt32IntoData(v193, objc_msgSend((id)-[__CFDictionary objectForKey:](v350, "objectForKey:", v291), "unsignedIntegerValue"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v292 = (void *)objc_msgSend(v292, "allObjects");
          _writePFEncodedArrayShapeIntoData(v193, v292, v286, 0);
        }
        v288 = objc_msgSend((id)v348, "countByEnumeratingWithState:objects:count:", &v352, v445, 16);
      }
      while (v288);
    }
  }
  else
  {
    _writeInt32IntoData(v193, 0);
  }
  v293 = (id *)v340;
  _writePFEncodedArrayShapeIntoData(v193, (void *)objc_msgSend(*((id *)v340 + 7), "allObjects"), v14, 0);
  if (objc_msgSend(*((id *)v340 + 4), "count"))
  {
    v294 = 0;
    do
    {
      _writeInt64IntoData(v193, 0);
      ++v294;
    }
    while (v294 < objc_msgSend(*((id *)v340 + 4), "count"));
  }
  *(_QWORD *)&v348 = v327->_entitiesByName;
  v295 = objc_msgSend(*((id *)v340 + 4), "count");
  v29 = v345;
  if (v295)
  {
    v296 = v295;
    for (i10 = 0; i10 != v296; ++i10)
    {
      v298 = objc_msgSend((id)objc_msgSend(v293[4], "valueAtIndex:", i10), "name");
      v299 = (_QWORD *)objc_msgSend((id)v348, "objectForKey:", v298);
      if (v299 && (v300 = (_QWORD *)v299[31]) != 0)
      {
        v301 = objc_msgSend((id)-[NSSQLEntity properties]((uint64_t)v299), "count");
        v302 = MEMORY[0x1E0C80A78](v301);
        v305 = (char *)&v318 - v304;
        v306 = v302;
        if (v302 > 0x200)
          v305 = (char *)NSAllocateScannedUncollectable();
        else
          bzero((char *)&v318 - v304, 8 * v303);
        v307 = v300[1];
        if (v307 >= 1)
        {
          v308 = 0;
          v309 = (uint64_t *)v300[9];
          do
          {
            v311 = *v309++;
            v310 = v311;
            v312 = v300[8];
            if (v312 != v311 && v310 != ~v312)
              *(_QWORD *)&v305[8 * v308++] = v310;
            --v307;
          }
          while (v307);
        }
        v314 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v305, v306);
        _writePFEncodedArrayShapeIntoData(v193, v314, v350, 0);

        if (v306 >= 0x201)
          NSZoneFree(0, v305);
        v293 = (id *)v340;
      }
      else if (v328)
      {
        v317 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find hashorder for entity '%@'"), objc_msgSend(v299, "name")), CFSTR("Base Problem")));
        *v328 = v317;

        goto LABEL_211;
      }
    }
  }
  objc_msgSend(v193, "appendBytes:length:", &v381, 8);
  v351 = bswap32(v321);
  v315 = (int)v346;
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", v346, 4, &v351);
  v351 = bswap32(v322);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 4), 4, &v351);
  v351 = bswap32(objc_msgSend(v293[4], "count"));
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 8), 4, &v351);
  v351 = bswap32(v329);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 12), 4, &v351);
  v351 = bswap32(-[__CFDictionary count](v347, "count"));
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 16), 4, &v351);
  v351 = bswap32(v323);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 20), 4, &v351);
  v351 = bswap32(HIDWORD(v323));
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 24), 4, &v351);
  v351 = bswap32(v324);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 28), 4, &v351);
  v351 = bswap32(v349);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 32), 4, &v351);
  v351 = bswap32(HIDWORD(v324));
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 36), 4, &v351);
  v351 = bswap32(v335);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 40), 4, &v351);
  v351 = bswap32(-[__CFArray count](v330, "count"));
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 44), 4, &v351);
  v351 = bswap32(v338);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 48), 4, &v351);
  v195 = v344;
  v351 = bswap32(-[__CFArray count](v344, "count"));
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 52), 4, &v351);
  v351 = bswap32(v341);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 56), 4, &v351);
  v316 = v293;
  v197 = v334;
  v351 = bswap32(-[__CFDictionary count](v334, "count"));
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 60), 4, &v351);
  v351 = bswap32(v339);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 64), 4, &v351);
  v351 = bswap32(-[__CFDictionary count](v350, "count"));
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 68), 4, &v351);
  v351 = bswap32(v325);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 72), 4, &v351);
  v198 = v336;
  v351 = bswap32(-[__CFArray count](v336, "count"));
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 76), 4, &v351);
  v351 = bswap32(objc_msgSend(v316[6], "count"));
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 80), 4, &v351);
  v351 = bswap32(v332);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 84), 4, &v351);
  v351 = bswap32(v342);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 88), 4, &v351);
  v194 = Mutable;
  v196 = v333;
  if (Mutable)
    goto LABEL_213;
LABEL_214:
  if (v347)
    CFRelease(v347);
  if (v196)
    CFRelease(v196);
  if (v197)
    CFRelease(v197);
  if (v29)
    CFRelease(v29);
  if (v350)
    CFRelease(v350);
  v199 = v330;
  v200 = v331;
  v201 = v326;
  if (v195)
    CFRelease(v195);
  if (v14)
    CFRelease(v14);
  if (v199)
    CFRelease(v199);
  if (v200)
    CFRelease(v200);
  v202 = v337;
  if (v201)

  if (v198)
    CFRelease(v198);
  if (v202)
    CFRelease(v202);
  if (v327)

  if (v193)
    return v193;
  else
    return 0;
}

- (NSManagedObjectModel)initWithContentsOfURL:(id)a3 forStoreMetadata:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSManagedObjectModelBundle *v9;
  NSManagedObjectModel *v10;
  NSManagedObjectModel *v11;
  uint64_t v12;
  char v14;

  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = objc_msgSend(a3, "path");
  v14 = 0;
  if (!objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v14))
  {
LABEL_6:
    v10 = 0;
    goto LABEL_12;
  }
  if (v14)
  {
    v9 = -[NSManagedObjectModelBundle initWithPath:]([NSManagedObjectModelBundle alloc], "initWithPath:", v8);
    if (v9)
    {
      v10 = (NSManagedObjectModel *)-[NSManagedObjectModelBundle _modelForVersionHashes:](v9, "_modelForVersionHashes:", objc_msgSend(a4, "objectForKey:", CFSTR("NSStoreModelVersionHashes")));
      if (!v10)
        goto LABEL_12;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  v11 = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", a3);
  if (!-[NSManagedObjectModel isConfiguration:compatibleWithStoreMetadata:](v11, "isConfiguration:compatibleWithStoreMetadata:", 0, a4)&& !-[NSManagedObjectModel _isConfiguration:inStyle:compatibleWithStoreMetadata:]((uint64_t)v11, v12, 1, a4))
  {
    v10 = 0;
    goto LABEL_11;
  }
  v10 = v11;
  if (v11)
  {
LABEL_10:
    v11 = -[NSValidationErrorLocalizationPolicy initWithURL:]([NSValidationErrorLocalizationPolicy alloc], "initWithURL:", a3);
    -[NSManagedObjectModel _setLocalizationPolicy:](v10, "_setLocalizationPolicy:", v11);
LABEL_11:

  }
LABEL_12:
  objc_msgSend(v6, "drain");
  return v10;
}

- (id)_modelForVersionHashes:(id)a3
{
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSMutableDictionary *fetchRequestTemplates;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = -[NSManagedObjectModel entitiesByName](self, "entitiesByName");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(a3);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v12 = -[NSDictionary objectForKey:](v5, "objectForKey:", v11);
        v13 = objc_msgSend(a3, "objectForKey:", v11);
        if (v12)
        {
          v14 = v13;
          if ((objc_msgSend((id)objc_msgSend(v12, "versionHash"), "isEqual:", v13) & 1) != 0
            || -[NSEntityDescription _hasPotentialHashSkew]((uint64_t)v12)
            && objc_msgSend((id)-[NSEntityDescription _newVersionHashInStyle:]((uint64_t)v12, 1), "isEqual:", v14))
          {
            if (!v8)
              v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v8, "addObject:", (id)objc_msgSend(v12, "copy"));
          }
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  if (!objc_msgSend(v8, "count"))
  {
    v15 = 0;
    if (!v8)
      return v15;
    goto LABEL_28;
  }
  v15 = -[NSManagedObjectModel _initWithEntities:]([NSManagedObjectModel alloc], "_initWithEntities:", v8);
  objc_msgSend(v15, "setVersionIdentifiers:", -[NSManagedObjectModel versionIdentifiers](self, "versionIdentifiers"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  fetchRequestTemplates = self->_fetchRequestTemplates;
  v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](fetchRequestTemplates, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(fetchRequestTemplates);
        v21 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
        v22 = (void *)-[NSMutableDictionary objectForKey:](self->_fetchRequestTemplates, "objectForKey:", v21);
        if (objc_msgSend(v8, "containsObject:", objc_msgSend(v22, "entity")))
          objc_msgSend(v15, "setFetchRequestTemplate:forName:", v22, v21);
      }
      v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](fetchRequestTemplates, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v18);
  }
  if (v8)
LABEL_28:

  return v15;
}

+ (int64_t)_debugOptimizedModelLayout
{
  if (qword_1ECD8DA50 != -1)
    dispatch_once(&qword_1ECD8DA50, &__block_literal_global_9);
  return _MergedGlobals_77;
}

uint64_t __70__NSManagedObjectModel__NSInternalMethods___debugOptimizedModelLayout__block_invoke()
{
  uint64_t result;

  result = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.OptimizedModelLayoutDebug"));
  _MergedGlobals_77 = result;
  return result;
}

- (id)immutableCopy
{
  void *v2;
  void *v3;

  if ((*(_BYTE *)&self->_managedObjectModelFlags & 2) != 0)
    return self;
  v2 = (void *)MEMORY[0x18D76B4E4]();
  v3 = (void *)-[NSManagedObjectModel copy](self, "copy");
  objc_msgSend(v3, "_createCachesAndOptimizeState");
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (id)_entityVersionHashesDigest
{
  void *v1;
  id v2;

  if (result)
  {
    v1 = result;
    v2 = -[NSManagedObjectModel _entityVersionHashesByNameInStyle:](result, 1);
    return -[NSManagedObjectModel _entityVersionHashesDigestFrom:](v1, v2);
  }
  return result;
}

- (void)_flattenProperties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)-[NSMutableDictionary allValues](self->_entities, "allValues", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_flattenProperties");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (uint64_t)_hasEntityWithDerivedAttribute
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v2 = *(void **)(result + 32);
    result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (result)
    {
      v3 = result;
      v4 = *(_QWORD *)v7;
      while (2)
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v2);
          if ((-[NSEntityDescription _hasDerivedAttributes](objc_msgSend(*(id *)(v1 + 32), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5))) & 1) != 0)
            return 1;
          ++v5;
        }
        while (v3 != v5);
        result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
        v3 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

uint64_t __71__NSManagedObjectModel__NSInternalMethods___traverseTombstonesAndMark___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(-[NSEntityDescription _attributeNamed:]((uint64_t)a2, a3), "setPreservesValueInHistoryOnDeletion:", *(unsigned __int8 *)(a1 + 40));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)objc_msgSend(a2, "subentities", 0);
  result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
        ++v9;
      }
      while (v7 != v9);
      result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

- (id)_localizationPolicy
{
  return *self->_additionalPrivateIvars;
}

- (id)_entitiesByVersionHash
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)objc_msgSend(result, "entities");
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v1, "count"));
    v7 = 0u;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v1);
          objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6), objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6), "versionHash"));
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }
    return v2;
  }
  return result;
}

- (void)_stripForMigration
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[NSManagedObjectModel entities](self, "entities", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_stripForMigration");
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)_restoreValidation
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[NSManagedObjectModel entities](self, "entities", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_restoreValidation");
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

@end
