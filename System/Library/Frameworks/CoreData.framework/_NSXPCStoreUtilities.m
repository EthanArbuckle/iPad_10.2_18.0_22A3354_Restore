@implementation _NSXPCStoreUtilities

+ (uint64_t)decodeSecureArchivedData:(uint64_t)a3 usingDelegate:(uint64_t)a4 classes:
{
  void *v7;
  uint64_t v8;

  objc_opt_self();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", a2, 0);
  objc_msgSend(v7, "setDelegate:", a3);
  v8 = objc_msgSend(v7, "decodeObjectOfClasses:forKey:", a4, CFSTR("root"));

  return v8;
}

+ (id)newSecureArchivedDataWithRootObject:(uint64_t)a1
{
  void *v3;
  id v4;

  objc_opt_self();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "setDelegate:", objc_opt_class());
  objc_msgSend(v3, "encodeObject:forKey:", a2, CFSTR("root"));
  objc_msgSend(v3, "finishEncoding");
  v4 = (id)objc_msgSend(v3, "encodedData");

  return v4;
}

+ (_PFArray)_decodeResultSetData:(NSFetchRequest *)a3 forFetchRequest:(char)a4 options:(NSPersistentStore *)a5 store:(NSManagedObjectContext *)a6 context:(_QWORD *)a7 rowCacheRows:(_QWORD *)a8 error:
{
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _PFArray *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  _PFFetchPlanHeader *Initialize;
  uint64_t v35;
  uint64_t v36;
  NSPersistentStore *v37;
  NSPersistentStore *v38;
  NSPersistentStore *v39;
  void *v40;
  NSSQLiteStatement *v41;
  NSSQLEntity *fakeEntityForFetch;
  uint64_t plan_for_entity;
  NSSQLEntity *statement_entity;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v49;
  unint64_t flags;
  _DWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int *v57;
  int v58;
  int v59;
  uint64_t v60;
  NSSQLEntity *v61;
  _PFFetchPlanHeader *v62;
  _PFFetchPlanHeader *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const __CFString *v68;
  uint64_t v69;
  _BOOL4 v70;
  int v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  size_t v78;
  unint64_t v79;
  uint64_t v80;
  char v81;
  unint64_t v82;
  uint64_t v83;
  _PFFetchPlanHeader *v84;
  void *v85;
  unint64_t v86;
  const __CFString *v87;
  uint64_t v88;
  uint64_t (*entity_for_ek_funptr)(uint64_t, char *, _QWORD);
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  _PFFetchPlanHeader *v98;
  const __CFString *v99;
  NSSQLiteStatement *v100;
  const __CFString *v101;
  NSManagedObjectContext *v102;
  int v103;
  uint64_t v104;
  unsigned int v105;
  uint64_t v106;
  unsigned int v107;
  _DWORD *v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  NSKnownKeysDictionary *v112;
  _QWORD *p_isa;
  char *v114;
  NSKnownKeysDictionary *v115;
  id v116;
  _QWORD *v117;
  _QWORD *v118;
  NSKnownKeysDictionary *v119;
  uint64_t v120;
  char *v121;
  unint64_t v122;
  int v123;
  int v124;
  CFAbsoluteTime *v125;
  char *v126;
  int v127;
  uint64_t v128;
  _BOOL4 v129;
  int v130;
  uint64_t v131;
  CFAbsoluteTime *v132;
  uint64_t v133;
  id v134;
  void *v135;
  int v136;
  int v137;
  uint64_t v138;
  uint64_t v139;
  CFStringRef v140;
  const char *v141;
  int *v142;
  char *v143;
  __CFString *v144;
  uint64_t v145;
  int v146;
  __CFString *v147;
  uint64_t *v148;
  uint64_t *v149;
  int v150;
  BOOL v151;
  CFAbsoluteTime *v152;
  CFNumberType v153;
  CFNumberRef v154;
  const char *v155;
  int *v156;
  char *v157;
  int v158;
  CFAbsoluteTime *v159;
  const __CFString *v160;
  __int16 *v161;
  __int16 *v162;
  int v163;
  BOOL v164;
  CFAbsoluteTime *v165;
  void *v166;
  BOOL v167;
  int v168;
  CFDataRef v169;
  double *v170;
  double *v171;
  uint64_t v172;
  char *v173;
  char *v174;
  Class v175;
  _QWORD *IndexedIvars;
  unsigned int v177;
  double v178;
  float v179;
  CFAbsoluteTime *v180;
  uint64_t v181;
  const __CFString *v182;
  const UInt8 *v183;
  CFIndex v184;
  int *v185;
  uint64_t v186;
  char *v187;
  CFAbsoluteTime *v188;
  int v189;
  int v190;
  const __CFData *v191;
  const UInt8 *v192;
  CFIndex v193;
  CFDataRef v194;
  int v195;
  unint64_t v196;
  int v197;
  unint64_t v198;
  uint64_t v199;
  uint64_t v200;
  id v201;
  char *v202;
  void (*v203)(id, char *, uint64_t, uint64_t);
  int *v204;
  int *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  CFAbsoluteTime *v209;
  _NSDataFileBackedFuture *v210;
  uint64_t v211;
  char *v212;
  char *v213;
  unint64_t v214;
  BOOL v215;
  CFAbsoluteTime *v216;
  uint64_t v217;
  CFAbsoluteTime *v218;
  objc_class *v219;
  __CFString *v220;
  char *v221;
  CFAbsoluteTime *v222;
  int v223;
  CFAbsoluteTime *v224;
  uint64_t v225;
  const __CFData *v226;
  uint64_t v227;
  CFAbsoluteTime *v228;
  uint64_t v229;
  char *v230;
  Class Class;
  int v232;
  NSKnownKeysDictionary *v233;
  id v234;
  char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  uint64_t v240;
  _PFFetchPlanHeader *v241;
  char *v242;
  int v243;
  uint64_t v244;
  _PFFetchPlanHeader *v245;
  uint64_t v246;
  _BOOL4 v247;
  char *v248;
  _PFFetchPlanHeader *v249;
  _QWORD *v250;
  _PFArray *v251;
  uint64_t v252;
  void **v253;
  void *v254;
  uint64_t v255;
  void **v256;
  void *v257;
  uint64_t v258;
  NSSQLiteStatement *v259;
  void *v260;
  uint64_t v261;
  void *v262;
  uint64_t v263;
  void *v264;
  uint64_t v265;
  void *v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  Class v273;
  uint64_t v274;
  NSKnownKeysDictionary *v275;
  unint64_t v276;
  uint64_t v277;
  char *v278;
  uint64_t v279;
  char *v280;
  void (*v281)(id, char *, uint64_t);
  char *v282;
  void (*v283)(id, char *, _QWORD, uint64_t);
  char *v284;
  uint64_t v285;
  _QWORD *v286;
  uint64_t v287;
  uint64_t v288;
  Class v289;
  int v290;
  NSSQLEntity *v291;
  unint64_t v292;
  NSKnownKeysMappingStrategy *propertyMapping;
  char *v294;
  id v295;
  unsigned int v296;
  _BOOL4 v297;
  char *v298;
  uint64_t (*v299)(uint64_t, char *, uint64_t);
  uint64_t *v300;
  unint64_t v301;
  char *v302;
  unint64_t v303;
  uint64_t *v304;
  uint64_t v305;
  char *v306;
  _QWORD *v307;
  _DWORD *v308;
  char *v309;
  NSSQLiteStatement *v310;
  int v311;
  char *v312;
  uint64_t v313;
  const __CFString *v314;
  _PFFetchPlanHeader *v315;
  uint64_t v316;
  NSPersistentStore *v317;
  void *v318;
  unint64_t v319;
  _BOOL4 v320;
  uint64_t v321;
  _BYTE v322[12];
  char *v323;
  NSManagedObjectContext *v324;
  char *v325;
  unint64_t v326;
  int v327;
  int v328;
  _QWORD *v329;
  uint64_t v330;
  unint64_t v331;
  int v332;
  _PFFetchPlanHeader *v333;
  char *v334;
  uint64_t v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  _QWORD v340[2];
  _QWORD v341[2];
  _BYTE v342[128];
  _QWORD v343[2];
  _QWORD v344[2];
  _QWORD v345[2];
  _QWORD v346[2];
  _QWORD v347[2];
  _QWORD v348[4];

  v348[2] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v15 = objc_msgSend(a2, "bytes");
  v16 = objc_msgSend(a2, "length");
  if (v16 <= 7)
  {
    if (!a8)
      return 0;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB28A8];
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = CFSTR("CoreData: XPC: Suspect response from server (bad size)");
    goto LABEL_11;
  }
  if (v15 >= v15 + v16)
  {
    if (!a8)
      return 0;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB28A8];
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = CFSTR("CoreData: XPC: Suspect response from server (no result)");
    goto LABEL_11;
  }
  if (*(_QWORD *)v15 != 1)
    return (_PFArray *)(id)NSArray_EmptyArray;
  if (v16 <= 0x13)
  {
    if (!a8)
      return 0;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB28A8];
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = CFSTR("CoreData: XPC: Suspect response from server (missing size)");
    goto LABEL_11;
  }
  if (!*(_DWORD *)(v15 + 16))
    return (_PFArray *)(id)NSArray_EmptyArray;
  if (v16 - 16 <= 0x6F)
  {
    if (!a8)
      return 0;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB28A8];
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = CFSTR("CoreData: XPC: Suspect response from server (not enough room for fetch results header)");
    goto LABEL_11;
  }
  *(double *)(v15 + 40) = (double)(unint64_t)*(double *)(v15 + 40);
  *(_QWORD *)(v15 + 96) = v15 + 128;
  v26 = *(unsigned int *)(v15 + 52);
  if ((uint64_t)(v16 - 128) < 8 * ((v26 + 1) + v26))
  {
    if (!a8)
      return 0;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB28A8];
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = CFSTR("CoreData: XPC: Suspect response from server (not enough room for buffers and sizes)");
LABEL_11:
    v21 = objc_msgSend(v19, "dictionaryWithObject:forKey:", v20, CFSTR("Reason"));
    v22 = v17;
    v23 = v18;
    goto LABEL_12;
  }
  v27 = v15 + 128 + 8 * v26 + 8;
  *(_QWORD *)(v15 + 104) = v27;
  if ((_DWORD)v26)
  {
    v28 = 0;
    v29 = 8 * v26;
    v30 = v27 + v29;
    do
    {
      *(_QWORD *)(*(_QWORD *)(v15 + 96) + v28) = v15 + *(_QWORD *)(v30 + v28);
      v28 += 8;
    }
    while (v29 != v28);
    v31 = **(_QWORD **)(v15 + 96);
    *(_QWORD *)(v15 + 112) = v31;
    *(_QWORD *)(v15 + 120) = v31;
  }
  v319 = v15 + v16;
  v307 = a7;
  *(_DWORD *)(v15 + 80) |= 2u;
  if (*(_DWORD *)(v15 + 36) >> 30)
    v32 = 0;
  else
    v32 = *(_DWORD *)(v15 + 36);
  v318 = PF_ALLOCATE_OBJECT_ARRAY((int)v32);
  if (v318)
    v33 = v32;
  else
    v33 = 0;
  v316 = v33;
  Initialize = fetchPlanAllocateInitialize(a3, a5, a6);
  if (-[NSFetchRequest resultType](a3, "resultType") != 2
    && (-[NSFetchRequest resultType](a3, "resultType")
     || !-[NSArray count](-[NSFetchRequest propertiesToFetch](a3, "propertiesToFetch"), "count")))
  {
    v317 = a5;
    v333 = 0;
    v328 = 0;
    propertyMapping = 0;
    plan_for_entity = 0;
    v310 = 0;
    fakeEntityForFetch = 0;
    goto LABEL_42;
  }
  v35 = objc_opt_class();
  v36 = objc_opt_class();
  v37 = a5;
  if (v35 != v36)
    v37 = (NSPersistentStore *)-[NSPersistentStore sqlCore](a5, "sqlCore");
  v38 = v37;
  if (!v38)
  {
    if (!a8)
      return 0;
    v343[0] = CFSTR("Reason");
    v343[1] = CFSTR("FetchRequest");
    v344[0] = CFSTR("CoreData: XPC: Store is missing core");
    if (a3)
      v68 = -[NSFetchRequest description](a3, "description");
    else
      v68 = CFSTR("no fetch request");
    v344[1] = v68;
    v21 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v344, v343, 2);
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB28A8];
LABEL_12:
    v24 = 0;
    *a8 = objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 134060, v21);
    return v24;
  }
  v39 = v38;
  v40 = (void *)-[NSFetchRequest copy](a3, "copy");
  objc_msgSend(v40, "setPredicate:", 0);
  v333 = (_PFFetchPlanHeader *)v39;
  v41 = -[NSSQLiteAdapter newSelectStatementWithFetchRequest:ignoreInheritance:](-[NSPersistentStore adapter](v39, "adapter"), v40, 0);
  if (!v41)
  {
    v62 = v333;
    if (a8)
    {
      v347[0] = CFSTR("Reason");
      v347[1] = CFSTR("FetchRequest");
      v348[0] = CFSTR("CoreData: XPC: Suspect fetch request failed to generate statement");
      if (v40)
        v87 = (const __CFString *)objc_msgSend(v40, "description");
      else
        v87 = CFSTR("no fetch request");
      v348[1] = v87;
      v240 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v348, v347, 2);
      *a8 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v240);
    }
    if (Initialize)

    goto LABEL_378;
  }
  fakeEntityForFetch = v41->_fakeEntityForFetch;
  if (!fakeEntityForFetch)
  {
    v62 = v333;
    if (a8)
    {
      v100 = v41;
      v345[0] = CFSTR("Reason");
      v345[1] = CFSTR("FetchRequest");
      v346[0] = CFSTR("CoreData: XPC: Suspect statement generated - entity missing");
      if (v40)
        v101 = (const __CFString *)objc_msgSend(v40, "description");
      else
        v101 = CFSTR("no fetch request");
      v346[1] = v101;
      v258 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v346, v345, 2);
      *a8 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v258);
      v41 = v100;
    }
    if (Initialize)
    {
      v259 = v41;

      v41 = v259;
    }

LABEL_378:
    goto LABEL_379;
  }
  v317 = a5;
  v310 = v41;
  Initialize->statement_entity = fakeEntityForFetch;
  *(_DWORD *)&Initialize->flags &= ~1u;
  plan_for_entity = _sql_read_only_fetch_plan_for_entity(fakeEntityForFetch);
  statement_entity = Initialize->statement_entity;
  if (statement_entity)
    propertyMapping = statement_entity->_propertyMapping;
  else
    propertyMapping = 0;

  v328 = 1;
LABEL_42:
  v330 = plan_for_entity;
  v45 = -[NSPersistentStore model](v317, "model");
  v46 = v45;
  if (v45)
    v47 = *(_DWORD *)(v45 + 68);
  else
    v47 = 0;
  v315 = Initialize;
  v48 = -[NSSQLEntity model](fakeEntityForFetch, "model");
  v324 = a6;
  if (v48)
    v49 = *(_DWORD *)(v48 + 68);
  else
    v49 = 0;
  if (v47 != v49)
  {
    v338 = 0u;
    v339 = 0u;
    v336 = 0u;
    v337 = 0u;
    v334 = (char *)-[_PFFetchPlanHeader ancillarySQLModels](v333, "ancillarySQLModels");
    v52 = objc_msgSend(v334, "countByEnumeratingWithState:objects:count:", &v336, v342, 16);
    if (!v52)
      goto LABEL_63;
    v53 = v52;
    v54 = *(_QWORD *)v337;
    while (1)
    {
      v55 = 0;
      do
      {
        if (*(_QWORD *)v337 != v54)
          objc_enumerationMutation(v334);
        v46 = objc_msgSend((id)-[_PFFetchPlanHeader ancillarySQLModels](v333, "ancillarySQLModels"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v336 + 1) + 8 * v55));
        v56 = -[NSSQLEntity model](fakeEntityForFetch, "model");
        if (v56)
        {
          v57 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
          v58 = *(_DWORD *)(v56 + 68);
          if (v46)
            goto LABEL_56;
        }
        else
        {
          v58 = 0;
          v57 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
          if (v46)
          {
LABEL_56:
            v59 = *(_DWORD *)(v46 + v57[601]);
            goto LABEL_57;
          }
        }
        v59 = 0;
LABEL_57:
        if (v58 == v59)
          goto LABEL_47;
        ++v55;
      }
      while (v53 != v55);
      v60 = objc_msgSend(v334, "countByEnumeratingWithState:objects:count:", &v336, v342, 16);
      v53 = v60;
      if (!v60)
      {
LABEL_63:
        v61 = fakeEntityForFetch;
        v62 = v315;
        v63 = v333;
        if (a8)
        {
          v341[0] = CFSTR("CoreData: XPC: Unable to find entity in model");
          v340[0] = CFSTR("Reason");
          v340[1] = CFSTR("EntityOffset");
          v64 = (void *)MEMORY[0x1E0CB37E8];
          v65 = -[NSSQLEntity model](v61, "model");
          if (v65)
            v66 = *(unsigned int *)(v65 + 68);
          else
            v66 = 0;
          v341[1] = objc_msgSend(v64, "numberWithUnsignedInt:", v66);
          v67 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v341, v340, 2);
          *a8 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v67);
        }

        if (!v62)
          return 0;
LABEL_379:

        return 0;
      }
    }
  }
LABEL_47:
  flags = v315->flags;
  v51 = **(_DWORD ***)(v15 + 96);
  if (((*(_DWORD *)&v315->flags >> 2) & 7) == 3)
    v292 = -[NSPersistentStore faultHandler]((unint64_t)v317);
  else
    v292 = 0;
  v69 = -[NSFetchRequest _disablePersistentStoreResultCaching](v315->fetch_request, "_disablePersistentStoreResultCaching");
  v305 = (flags >> 2) & 7;
  v291 = fakeEntityForFetch;
  v290 = v69;
  v70 = (a4 & 1) != 0 || (*(_BYTE *)&v315->flags & 1) == 0;
  v304 = &v271;
  v301 = flags;
  v297 = v70;
  v71 = v70 & (v328 ^ 1);
  v311 = v328 | ((flags & 2) >> 1);
  if (v71)
    v72 = (int)v316;
  else
    v72 = 0;
  MEMORY[0x1E0C80A78](v69);
  if (v72 > 0x200)
  {
    v75 = (char *)NSAllocateScannedUncollectable();
    v312 = v75;
  }
  else
  {
    v312 = (char *)&v271 - v74;
    bzero((char *)&v271 - v74, 8 * v73);
  }
  MEMORY[0x1E0C80A78](v75);
  v78 = 8 * v76;
  v303 = v79;
  if (v79 > 0x200)
  {
    v309 = (char *)NSAllocateScannedUncollectable();
    v302 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    v309 = (char *)&v271 - v77;
    bzero((char *)&v271 - v77, 8 * v76);
    MEMORY[0x1E0C80A78](v80);
    v302 = (char *)&v271 - ((v78 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v302, v78);
  }
  v81 = v71 & (v312 == 0);
  v82 = v319;
  v83 = v330;
  if ((v81 & 1) != 0 || (v311 & 1) == 0 && (!v309 || !v302))
  {
    PF_FREE_OBJECT_ARRAY(v318);
    v318 = 0;
    v316 = 0;
  }
  if ((uint64_t)(v82 - (_QWORD)v51) <= 31)
  {
    v84 = v333;
    v85 = v318;
    v86 = v303;
    if (a8)
      *a8 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("CoreData: XPC: Suspect response from server (not enough room for first row)"), CFSTR("Reason")));
    goto LABEL_402;
  }
  if ((v328 & 1) != 0)
    v289 = 0;
  else
    v289 = (Class)-[NSPersistentStore objectIDFactoryForSQLEntity:](v317, "objectIDFactoryForSQLEntity:", v315->statement_entity);
  v280 = sel_setForeignEntityKeySlot_entityKey_;
  v279 = +[NSSQLRow instanceMethodForSelector:](NSSQLRow, "instanceMethodForSelector:");
  v278 = sel_setForeignOrderKeySlot_orderKey_;
  v277 = +[NSSQLRow instanceMethodForSelector:](NSSQLRow, "instanceMethodForSelector:");
  v284 = sel_setForeignKeySlot_int64_;
  v283 = (void (*)(id, char *, _QWORD, uint64_t))+[NSSQLRow instanceMethodForSelector:](NSSQLRow, "instanceMethodForSelector:");
  v282 = sel_setOptLock_;
  v88 = +[NSSQLRow instanceMethodForSelector:](NSSQLRow, "instanceMethodForSelector:");
  v281 = (void (*)(id, char *, uint64_t))v88;
  if (v328)
  {
    entity_for_ek_funptr = (uint64_t (*)(uint64_t, char *, _QWORD))v315->entity_for_ek_funptr;
    v298 = sel_entityForID_;
    v299 = entity_for_ek_funptr;
    goto LABEL_115;
  }
  if (!v297)
  {
    v298 = 0;
    v299 = 0;
LABEL_115:
    v102 = v324;
    v103 = v316;
    if ((_DWORD)v316)
      goto LABEL_116;
    v239 = v318;
    v98 = v315;
    if (!v318)
    {
LABEL_344:
      v241 = v333;
      v242 = v312;
      if (v303 >= 0x201 && v309)
      {
        NSZoneFree(0, v309);
        NSZoneFree(0, v302);
      }
      if (v72 >= 0x201 && v242)
        NSZoneFree(0, v242);

      return (_PFArray *)(id)NSArray_EmptyArray;
    }
LABEL_343:
    PF_FREE_OBJECT_ARRAY(v239);
    goto LABEL_344;
  }
  v90 = v316;
  v88 = -[objc_class allocateBatch:count:](v289, "allocateBatch:count:", v312, v316);
  if (v90 != (_DWORD)v88)
  {
    v99 = CFSTR("Decoding failed: No oids.");
    v98 = v315;
    goto LABEL_341;
  }
  v98 = v315;
  v97 = v316;
  if ((v301 & 2) != 0 || !(_DWORD)v316)
  {
    if (!(_DWORD)v316)
      goto LABEL_342;
  }
  else
  {
    v88 = +[NSSQLRow newBatchRowAllocation:count:forSQLEntity:withOwnedObjectIDs:andTimestamp:](NSSQLRow, "newBatchRowAllocation:count:forSQLEntity:withOwnedObjectIDs:andTimestamp:", v309, v316, v315->statement_entity, v312, *(double *)(v15 + 40));
    if (v97 != (_DWORD)v88)
    {
      v99 = CFSTR("Decoding failed: No rows.");
LABEL_341:
      _NSCoreDataLog(8, (uint64_t)v99, v91, v92, v93, v94, v95, v96, v271);
LABEL_342:
      v239 = v318;
      goto LABEL_343;
    }
  }
  v298 = 0;
  v299 = 0;
  v103 = v316;
  v83 = v330;
  v102 = v324;
LABEL_116:
  v276 = v72;
  if (v103 < 1)
  {
LABEL_351:
    v243 = v311;
    if (v305 > 5)
      v244 = 10;
    else
      v244 = dword_18A509B60[v305];
    v245 = v333;
    v246 = v316;
    v24 = -[_PFArray initWithObjects:count:andFlags:andContext:]([_PFArray alloc], "initWithObjects:count:andFlags:andContext:", v318, v316, v244, v102);
    if (((v243 | v290) & 1) != 0)
    {
      v247 = 0;
      v248 = v309;
    }
    else
    {
      v249 = v245;
      v250 = v307;
      v247 = v307 != 0;
      if (v307)
      {
        v251 = [_PFArray alloc];
        *v250 = -[_PFArray initWithObjects:count:andFlags:andContext:](v251, "initWithObjects:count:andFlags:andContext:", v302, v246, 26, v102);
      }
      v248 = v309;
      v245 = v249;
      if ((int)v246 < 1)
        goto LABEL_366;
      v252 = (int)v246;
      v253 = (void **)v309;
      do
      {
        v254 = *v253++;

        --v252;
      }
      while (v252);
      v245 = v249;
    }
    if (((v243 | v247) & 1) == 0 && (int)v246 >= 1)
    {
      v255 = (int)v246;
      v256 = (void **)v302;
      do
      {
        v257 = *v256++;

        --v255;
      }
      while (v255);
    }
LABEL_366:
    if (v303 >= 0x201)
    {
      NSZoneFree(0, v248);
      NSZoneFree(0, v302);
    }
    if (v276 >= 0x201)
      NSZoneFree(0, v312);
    if (v315)

    return v24;
  }
  v104 = 0;
  v273 = 0;
  v274 = 0;
  v326 = 0;
  v286 = 0;
  v272 = 0;
  v314 = CFSTR("TOMBSTONE");
  v287 = v316;
  v288 = v46;
  while (1)
  {
    v300 = &v271;
    MEMORY[0x1E0C80A78](v88);
    v296 = v107;
    if (v107 > 0x200)
    {
      v88 = NSAllocateScannedUncollectable();
      v325 = (char *)v88;
    }
    else
    {
      v325 = (char *)&v271 - v106;
      bzero((char *)&v271 - v106, 8 * v105);
    }
    v108 = v51;
    if ((*v51 & 0x80000000) != 0)
    {
      v109 = v326;
      do
      {
        v110 = v108[1];
        if ((v110 & 0x80000000) != 0)
          v108 = 0;
        else
          v108 = (_DWORD *)(*(_QWORD *)(*(_QWORD *)(v15 + 96) + 8 * v110) + *((_QWORD *)v108 + 2));
      }
      while ((*v108 & 0x80000000) != 0);
    }
    else
    {
      v109 = v326;
    }
    v111 = v82 - (_QWORD)v108;
    if (v111 <= 31)
    {
      v84 = v333;
      v85 = v318;
      v86 = v303;
      if (a8)
      {
        v260 = (void *)MEMORY[0x1E0CB35C8];
        v261 = *MEMORY[0x1E0CB28A8];
        v262 = (void *)MEMORY[0x1E0C99D80];
        v263 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData: XPC: Suspect response from server (not enough room for row %d)"), v104);
        goto LABEL_399;
      }
      goto LABEL_401;
    }
    v308 = v108;
    if ((v328 & 1) == 0)
      break;
    v112 = 0;
    if ((v301 & 2) == 0)
    {
      v109 = 0;
      p_isa = &v291->super.super.isa;
      v295 = 0;
      v306 = 0;
      goto LABEL_151;
    }
    v330 = v83;
LABEL_145:
    v119 = 0;
    switch((int)v305)
    {
      case 0:
      case 3:
      case 5:
        v119 = (NSKnownKeysDictionary *)-[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v102, v112, v292);

        goto LABEL_326;
      case 1:
        v119 = v112;
        break;
      default:
        break;
    }
LABEL_327:
    *((_QWORD *)v318 + v104) = v119;
    v236 = v108[1];
    if ((v236 & 0x80000000) == 0)
    {
      v237 = *(_QWORD *)(*(_QWORD *)(v15 + 96) + 8 * v236);
      if (v237)
      {
        v326 = v109;
        v238 = *((_QWORD *)v108 + 2);
        if (v296 >= 0x201)
          NSZoneFree(0, v325);
        v51 = (_DWORD *)(v237 + v238);
        ++v104;
        v46 = v288;
        v82 = v319;
        v83 = v330;
        if (v104 != v287)
          continue;
      }
    }
    goto LABEL_351;
  }
  p_isa = _sqlEntityForEntityID(v46, v108[2]);
  if (p_isa != v286)
  {
    v289 = (Class)-[NSPersistentStore objectIDFactoryForSQLEntity:](v317, "objectIDFactoryForSQLEntity:", p_isa);
    v286 = p_isa;
  }
  if (!v297)
  {
    v116 = [v289 alloc];
    v88 = objc_msgSend(v116, "initWithPK64:", *((_QWORD *)v308 + 3));
    v112 = (NSKnownKeysDictionary *)v88;
    if ((v301 & 2) == 0)
    {
      v117 = p_isa;
      v118 = (_QWORD *)objc_msgSend(+[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, p_isa), "initWithSQLEntity:ownedObjectID:andTimestamp:", p_isa, v88, *(double *)(v15 + 40));
      *(_QWORD *)&v309[8 * v104] = v118;
      goto LABEL_150;
    }
    v330 = v83;
LABEL_143:
    v108 = v308;
    goto LABEL_144;
  }
  v330 = v83;
  v114 = v312;
  v112 = *(NSKnownKeysDictionary **)&v312[8 * v104];
  v88 = _PFSetPrimaryKey((unint64_t)v112, *((_QWORD *)v308 + 3));
  if (v112 == (NSKnownKeysDictionary *)v88)
  {
    v109 = v326;
    if ((v301 & 2) == 0)
      goto LABEL_149;
    goto LABEL_143;
  }
  v115 = (NSKnownKeysDictionary *)v88;
  *(_QWORD *)&v114[8 * v104] = v88;
  if ((v301 & 2) != 0)
  {
    v112 = (NSKnownKeysDictionary *)v88;
    v108 = v308;
    v109 = v326;
LABEL_144:
    v102 = v324;
    goto LABEL_145;
  }
  objc_msgSend(*(id *)&v309[8 * v104], "setObjectID:", v88);
  v112 = v115;
  v109 = v326;
LABEL_149:
  v118 = *(_QWORD **)&v309[8 * v104];
  v117 = p_isa;
LABEL_150:
  v295 = v118;
  v306 = (char *)v118[5];
  v83 = _sql_fetch_plan_for_entity(v117);
  v108 = v308;
LABEL_151:
  v275 = v112;
  if (v111 < *(int *)v83)
  {
    v84 = v333;
    v85 = v318;
    v86 = v303;
    if (a8)
    {
      v260 = (void *)MEMORY[0x1E0CB35C8];
      v261 = *MEMORY[0x1E0CB28A8];
      v262 = (void *)MEMORY[0x1E0C99D80];
      v263 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData: XPC: Suspect response from server (remaining space for %d smaller than estimated size)"), v104);
      goto LABEL_399;
    }
    goto LABEL_401;
  }
  v285 = v104;
  v120 = *(unsigned int *)(v83 + 4);
  v329 = p_isa;
  v330 = v83;
  if (!(_DWORD)v120)
  {
    v102 = v324;
LABEL_319:
    if (v328)
    {
      v233 = [NSKnownKeysDictionary alloc];
      v119 = -[NSKnownKeysDictionary initWithSearchStrategy:](v233, "initWithSearchStrategy:", propertyMapping);
      v88 = -[NSKnownKeysDictionary _setValues:retain:](v119, "_setValues:retain:", v325, 0);
      v108 = v308;
      v104 = v285;
    }
    else
    {
      v234 = v295;
      objc_msgSend(v295, "knownKeyValuesPointer");
      v104 = v285;
      *(_QWORD *)&v302[8 * v285] = v234;
      v235 = v306;
      v88 = v306;
      *(_QWORD *)&v309[8 * v104] = v88;
      if ((a4 & 1) != 0)
      {
        v88 = v235;
LABEL_325:
        v119 = (NSKnownKeysDictionary *)v88;
LABEL_326:
        v108 = v308;
      }
      else
      {
        v119 = 0;
        v108 = v308;
        switch((int)v305)
        {
          case 0:
          case 3:
          case 5:
            v88 = (uint64_t)-[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v102, v275, v292);
            goto LABEL_325;
          case 1:
            v119 = v275;
            v88 = _PFfastOidRetain(0, (unint64_t)v275);
            goto LABEL_326;
          case 2:
          case 4:
            goto LABEL_327;
          default:
            goto LABEL_326;
        }
      }
    }
    goto LABEL_327;
  }
  v121 = 0;
  v122 = 0;
  *(_DWORD *)&v322[8] = 0;
  v313 = 0;
  v123 = 0;
  v124 = 0;
  v125 = (CFAbsoluteTime *)(v108 + 8);
  *(_QWORD *)v322 = v325 != 0;
  v294 = v306 + 28;
  v321 = 24 * v120;
  while (2)
  {
    v334 = v121;
    v126 = &v121[v83];
    v127 = v121[v83 + 20];
    v327 = v124;
    if ((v127 - 2) > 6)
      v128 = 3;
    else
      v128 = qword_18A509B28[(char)(v127 - 2)];
    v125 = (CFAbsoluteTime *)(((unint64_t)v125 + v128) & ~v128);
    if ((v126[16] & 1) != 0)
    {
      v130 = *(unsigned __int8 *)v125;
      v125 = (CFAbsoluteTime *)((char *)v125 + 1);
      v129 = v130 != 0;
    }
    else
    {
      v129 = 0;
    }
    v131 = 0;
    v331 = v122;
    v332 = v123;
    if (((v122 > 6) & v123) == 1 && !v129)
    {
      v320 = v129;
      v323 = v126;
      v326 = v109;
      v132 = v125;
      v131 = *(_QWORD *)&v322[4];
      if (!*(_QWORD *)&v322[4])
      {
        v133 = -[NSPersistentStore model](v317, "model");
        v131 = v299(v133, v298, (int)v313);
      }
      v134 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]((uint64_t)_PFPersistentHistoryModel, (_QWORD *)v131);
      v135 = (void *)objc_msgSend((id)objc_msgSend(*(id *)&v334[v83 + 24], "propertyDescription"), "name");
      v136 = objc_msgSend((id)objc_msgSend(v135, "stringByReplacingOccurrencesOfString:withString:", v314, &stru_1E1EE23F0), "intValue");
      v137 = objc_msgSend(v134, "count");
      *(_QWORD *)&v322[4] = v131;
      if (v136 >= v137)
      {
        v131 = 0;
      }
      else
      {
        v138 = objc_msgSend(v134, "objectAtIndexedSubscript:", v136);
        if (v131)
          v131 = objc_msgSend(*(id *)(v131 + 40), "objectForKey:", v138);
        v127 = 17;
      }

      v125 = v132;
      v109 = v326;
      v126 = v323;
      v129 = v320;
    }
    v139 = ~v128;
    v124 = 0;
    switch(v127)
    {
      case 1:
        LODWORD(v335) = 0;
        v161 = (__int16 *)(((unint64_t)v125 + v128) & v139);
        if (!v129)
          v125 = (CFAbsoluteTime *)(v161 + 2);
        v162 = (__int16 *)&v335;
        if (!v129)
          v162 = v161;
        v163 = v334[v330 + 21];
        switch(v163)
        {
          case 10:
            if ((v328 & 1) != 0)
              goto LABEL_294;
            v199 = *((unsigned int *)v126 + 2);
            v200 = *(unsigned int *)v162;
            v201 = v295;
            v203 = (void (*)(id, char *, uint64_t, uint64_t))v277;
            v202 = v278;
            goto LABEL_288;
          case 4:
            if ((v328 & 1) == 0)
            {
              v199 = *((unsigned int *)v126 + 2);
              v200 = *(unsigned int *)v162;
              v201 = v295;
              v203 = (void (*)(id, char *, uint64_t, uint64_t))v279;
              v202 = v280;
LABEL_288:
              v180 = v125;
              v203(v201, v202, v199, v200);
              goto LABEL_293;
            }
            if (v129)
            {
              *(_QWORD *)&v325[8 * (int)v109] = 0;
            }
            else
            {
              v227 = *(int *)v161;
              v228 = v125;
              v229 = v299(v288, v298, v227);
              v125 = v228;
              *(_QWORD *)&v325[8 * (int)v109] = v229;
            }
            v124 = 1;
            break;
          case 1:
            if ((v328 & 1) != 0)
            {
              if (byte_1ECD8DE1E)
                v164 = v129;
              else
                v164 = 0;
              if (v164)
              {
LABEL_197:
                v154 = 0;
              }
              else
              {
                if (byte_1ECD8DE1E)
                  v152 = (CFAbsoluteTime *)v161;
                else
                  v152 = (CFAbsoluteTime *)v162;
                v153 = kCFNumberIntType;
LABEL_218:
                v165 = v125;
LABEL_239:
                v154 = CFNumberCreate(0, v153, v152);
LABEL_269:
                v125 = v165;
              }
              v124 = 0;
              v213 = v325;
LABEL_271:
              *(_QWORD *)&v213[8 * (int)v109] = v154;
            }
            else
            {
              v214 = *((unsigned int *)v126 + 2);
              if (v129)
              {
                v197 = 1 << (v214 & 7);
                v198 = v214 >> 3;
                goto LABEL_274;
              }
              v171 = v125;
              v230 = v126;
              Class = object_getClass(v306);
              v232 = *(char *)(*((_QWORD *)object_getIndexedIvars(Class) + 7) + v214);
              if (v232 == 115)
              {
                snapshot_set_int16(v306, *((_DWORD *)v230 + 2), *v161);
              }
              else if (v232 == 99)
              {
                snapshot_set_int8(v306, *((_DWORD *)v230 + 2), *(_BYTE *)v161);
              }
              else
              {
                snapshot_set_int32(v306, *((_DWORD *)v230 + 2), *(_DWORD *)v161);
              }
LABEL_277:
              v124 = v327;
              v125 = v171;
            }
            break;
          default:
            goto LABEL_294;
        }
        goto LABEL_295;
      case 2:
      case 3:
        v335 = 0;
        v148 = (uint64_t *)(((unint64_t)v125 + v128) & v139);
        if (!v129)
          v125 = (CFAbsoluteTime *)(v148 + 1);
        v149 = &v335;
        if (!v129)
          v149 = v148;
        v150 = v334[v330 + 21];
        if (v150 == 6)
        {
          if ((v328 & 1) != 0)
            goto LABEL_294;
          v180 = v125;
          v281(v295, v282, *v149);
          goto LABEL_293;
        }
        if (v150 == 3)
        {
          if ((v328 & 1) == 0)
          {
            v180 = v125;
            v283(v295, v284, *((unsigned int *)v126 + 2), *v149);
            goto LABEL_293;
          }
          if ((v327 & 1) != 0)
          {
            v181 = *(_QWORD *)&v325[8 * (int)v109 - 8];
            LODWORD(v109) = v109 - 1;
          }
          else
          {
            v215 = v129;
            v216 = v125;
            v217 = objc_msgSend((id)objc_msgSend(*(id *)&v334[v330 + 24], "toOneRelationship"), "destinationEntity");
            v125 = v216;
            LOBYTE(v129) = v215;
            v181 = v217;
          }
          if (v129 || !*v148)
          {
            v154 = 0;
            v213 = v325;
          }
          else
          {
            v218 = v125;
            if (v181 != v272)
            {
              v219 = (objc_class *)-[NSPersistentStore objectIDFactoryForSQLEntity:](v317, "objectIDFactoryForSQLEntity:", v181);
              v272 = v181;
              v273 = v219;
            }
            v154 = (CFNumberRef)objc_msgSend([v273 alloc], "initWithPK64:", *v148);
            v213 = v325;
            v125 = v218;
          }
          v124 = 0;
          goto LABEL_271;
        }
        if (v150 != 1)
          goto LABEL_294;
        if ((v328 & 1) == 0)
        {
          v196 = *((unsigned int *)v126 + 2);
          if (!v129)
          {
            v180 = v125;
            snapshot_set_int64(v306, v196, *v148);
            goto LABEL_293;
          }
          v197 = 1 << (v196 & 7);
          v198 = v196 >> 3;
LABEL_274:
          v294[v198] |= v197;
          goto LABEL_294;
        }
        if (byte_1ECD8DE1E)
          v151 = v129;
        else
          v151 = 0;
        if (!v151)
        {
          if (byte_1ECD8DE1E)
            v152 = (CFAbsoluteTime *)v148;
          else
            v152 = (CFAbsoluteTime *)v149;
          v153 = kCFNumberLongLongType;
          goto LABEL_218;
        }
        goto LABEL_197;
      case 4:
      case 5:
      case 6:
      case 9:
      case 12:
        if ((v328 & 1) != 0)
        {
          if (v129)
          {
            v140 = 0;
LABEL_243:
            v124 = 0;
            *(_QWORD *)&v325[8 * (int)v109] = v140;
            goto LABEL_295;
          }
          v155 = (const char *)(((unint64_t)v125 + v128) & v139);
          v156 = (int *)(v155 + 4);
          if ((uint64_t)(v319 - (_QWORD)(v155 + 4)) >= *(int *)v155)
          {
            v157 = v126;
            v140 = CFStringCreateWithCString(0, v155 + 4, 0x8000100u);
            v125 = (CFAbsoluteTime *)((char *)v156 + *(int *)v155);
            v158 = v157[20];
            if (v158 == 12)
            {
              v159 = (CFAbsoluteTime *)((char *)v156 + *(int *)v155);
              v160 = (const __CFString *)(id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v140);
            }
            else
            {
              if (v158 != 4)
                goto LABEL_243;
              v159 = (CFAbsoluteTime *)((char *)v156 + *(int *)v155);
              v160 = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithString:", v140);
            }
            v182 = v160;
            CFRelease(v140);
            v140 = v182;
            v125 = v159;
            goto LABEL_243;
          }
          v84 = v333;
          v85 = v318;
          v86 = v303;
          if (!a8)
            goto LABEL_401;
          v264 = (void *)MEMORY[0x1E0CB35C8];
          v265 = *MEMORY[0x1E0CB28A8];
          v266 = (void *)MEMORY[0x1E0C99D80];
          v267 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData: XPC: Suspect response from server (remaining space for %@ insufficient (2))"), *(_QWORD *)&v334[v330 + 24]);
LABEL_396:
          v268 = objc_msgSend(v266, "dictionaryWithObject:forKey:", v267, CFSTR("Reason"));
          v269 = v264;
          v270 = v265;
          goto LABEL_400;
        }
        if (v129)
          goto LABEL_231;
        v141 = (const char *)(((unint64_t)v125 + v128) & v139);
        v142 = (int *)(v141 + 4);
        if ((uint64_t)(v319 - (_QWORD)(v141 + 4)) < *(int *)v141)
        {
          v84 = v333;
          v85 = v318;
          v86 = v303;
          if (!a8)
            goto LABEL_401;
          v264 = (void *)MEMORY[0x1E0CB35C8];
          v265 = *MEMORY[0x1E0CB28A8];
          v266 = (void *)MEMORY[0x1E0C99D80];
          v267 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData: XPC: Suspect response from server (remaining space for %@ insufficient (1))"), *(_QWORD *)&v334[v330 + 24]);
          goto LABEL_396;
        }
        v143 = v126;
        v144 = (__CFString *)CFStringCreateWithCString(0, v141 + 4, 0x8000100u);
        v145 = *(int *)v141;
        v146 = v143[20];
        if (v146 == 12)
        {
          v147 = (__CFString *)(id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v144);
        }
        else
        {
          if (v146 != 4)
            goto LABEL_292;
          v147 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithString:", v144);
        }
        goto LABEL_291;
      case 7:
      case 8:
        if ((v328 & 1) == 0)
        {
          if (v129)
            goto LABEL_231;
          v170 = (double *)(((unint64_t)v125 + v128) & v139);
          v171 = v170 + 1;
          v172 = *((unsigned int *)v126 + 2);
          if (v126[20] == 7)
          {
            v173 = v306;
            v174 = v126;
            v175 = object_getClass(v306);
            IndexedIvars = object_getIndexedIvars(v175);
            v177 = *((_DWORD *)v174 + 2);
            v178 = *v170;
            if (*(_BYTE *)(IndexedIvars[7] + v172) == 102)
            {
              v179 = v178;
              snapshot_set_float(v173, v177, v179);
              goto LABEL_277;
            }
            v212 = v173;
          }
          else
          {
            v178 = *v170;
            v212 = v306;
            v177 = *((_DWORD *)v126 + 2);
          }
          snapshot_set_double(v212, v177, v178);
          goto LABEL_277;
        }
        if (v129)
          goto LABEL_197;
        v152 = (CFAbsoluteTime *)(((unint64_t)v125 + v128) & v139);
        v165 = v152 + 1;
        if (v126[20] == 7)
        {
          v153 = kCFNumberDoubleType;
          goto LABEL_239;
        }
        v154 = CFDateCreate(0, *v152);
        goto LABEL_269;
      case 13:
      case 14:
        goto LABEL_295;
      case 16:
        v166 = *(void **)&v334[v330 + 24];
        v323 = v126;
        v167 = v129;
        v326 = v109;
        v109 = (unint64_t)v125;
        v168 = objc_msgSend((id)objc_msgSend(v166, "propertyDescription"), "_isFileBackedFuture");
        v125 = (CFAbsoluteTime *)v109;
        LODWORD(v109) = v326;
        LOBYTE(v129) = v167;
        v126 = v323;
        if (!v168)
          goto LABEL_223;
        if (v167)
        {
          if ((v328 & 1) != 0)
          {
            v124 = 0;
            *(_QWORD *)&v325[8 * (int)v326] = 0;
            goto LABEL_295;
          }
LABEL_231:
          v294[(unint64_t)*((unsigned int *)v126 + 2) >> 3] |= 1 << (*((_DWORD *)v126 + 2) & 7);
LABEL_294:
          v124 = v327;
          goto LABEL_295;
        }
        v204 = (int *)(((unint64_t)v125 + v128) & v139);
        v205 = v204 + 1;
        if ((uint64_t)(v319 - (_QWORD)(v204 + 1)) >= *v204)
        {
          v206 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v204 + 1);
          v207 = *v204;
          v208 = v274;
          if (!v274)
            v208 = -[NSPersistentStore fileBackedFuturesDirectory](v317, "fileBackedFuturesDirectory");
          v209 = (CFAbsoluteTime *)((char *)v205 + v207);
          v210 = [_NSDataFileBackedFuture alloc];
          v274 = v208;
          v211 = -[_NSDataFileBackedFuture initWithStoreMetadata:directory:](v210, "initWithStoreMetadata:directory:", v206, objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v208, 1));
          if ((v328 & 1) != 0)
          {
            v124 = 0;
            *(_QWORD *)&v325[8 * (int)v109] = v211;
          }
          else
          {
            snapshot_set_object(v306, *((_DWORD *)v323 + 2), v211);
            v124 = v327;
          }
          v125 = v209;
LABEL_295:
          v221 = v334;
          if (v329 && v334 == (char *)72 && *((_DWORD *)v329 + 46) == 16001)
          {
            v222 = v125;
            v223 = objc_msgSend(*(id *)&v325[8 * (int)v109], "intValue");
            v125 = v222;
            v123 = (v223 == 2) | v332;
            v102 = v324;
            v83 = v330;
          }
          else
          {
            v123 = v332;
            v102 = v324;
            v83 = v330;
            if (v334 == (char *)120 && (v332 & 1) != 0)
            {
              v224 = v125;
              v225 = objc_msgSend(*(id *)&v325[8 * (int)v109], "intValue");
              v125 = v224;
              v313 = v225;
              v123 = 1;
            }
          }
          v109 = (v109 + *(_DWORD *)v322);
          v122 = v331 + 1;
          v121 = v221 + 24;
          if ((char *)v321 == v121)
            goto LABEL_319;
          continue;
        }
        v84 = v333;
        v85 = v318;
        v86 = v303;
        if (a8)
        {
          v260 = (void *)MEMORY[0x1E0CB35C8];
          v261 = *MEMORY[0x1E0CB28A8];
          v262 = (void *)MEMORY[0x1E0C99D80];
          v263 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData: XPC: Suspect response from server (remaining space for %@ insufficient (3))"), *(_QWORD *)&v334[v330 + 24]);
LABEL_399:
          v268 = objc_msgSend(v262, "dictionaryWithObject:forKey:", v263, CFSTR("Reason"));
          v269 = v260;
          v270 = v261;
LABEL_400:
          *a8 = objc_msgSend(v269, "errorWithDomain:code:userInfo:", v270, 134060, v268);
        }
LABEL_401:
        v72 = v276;
LABEL_402:
        if (v86 >= 0x201)
        {
          NSZoneFree(0, v309);
          NSZoneFree(0, v302);
        }
        if (v72 >= 0x201)
          NSZoneFree(0, v312);
        PF_FREE_OBJECT_ARRAY(v85);

        if (v315)
        return 0;
      default:
LABEL_223:
        if ((v328 & 1) != 0)
        {
          if (v129)
          {
            v169 = 0;
LABEL_310:
            v124 = 0;
            *(_QWORD *)&v325[8 * (int)v109] = v169;
            goto LABEL_295;
          }
          v323 = v126;
          v183 = (const UInt8 *)(((unint64_t)v125 + v128) & v139);
          v185 = (int *)(v183 + 4);
          v184 = *(int *)v183;
          if ((uint64_t)(v319 - (_QWORD)(v183 + 4)) < v184)
          {
            v84 = v333;
            v85 = v318;
            v86 = v303;
            if (!a8)
              goto LABEL_401;
            v264 = (void *)MEMORY[0x1E0CB35C8];
            v265 = *MEMORY[0x1E0CB28A8];
            v266 = (void *)MEMORY[0x1E0C99D80];
            v267 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData: XPC: Suspect response from server (remaining space for %@ insufficient (4))"), *(_QWORD *)&v334[v330 + 24]);
            goto LABEL_396;
          }
          v169 = CFDataCreate(0, v183 + 4, v184);
          v186 = *(int *)v183;
          v125 = (CFAbsoluteTime *)((char *)v185 + v186);
          v187 = v334;
          if (v127 == 17
            && (v188 = (CFAbsoluteTime *)((char *)v185 + v186),
                v189 = objc_msgSend((id)v131, "sqlType"),
                v125 = v188,
                v189 != 10))
          {
            objc_msgSend(*(id *)&v187[v330 + 24], "propertyDescription");
            v191 = (const __CFData *)_swizzleManifestTypeDataXPC(v169, (void *)v131);
          }
          else
          {
            v190 = v323[20];
            if (v190 == 11)
            {
              v188 = v125;
              if (-[__CFData length](v169, "length") != 16)
              {
LABEL_309:
                v125 = v188;
                goto LABEL_310;
              }
              v191 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", -[__CFData bytes](v169, "bytes"));
            }
            else
            {
              if (v190 != 15)
                goto LABEL_310;
              v188 = v125;
              v191 = (const __CFData *)+[_PFRoutines retainedDecodeValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v169, (void *)objc_msgSend(*(id *)&v187[v330 + 24], "propertyDescription"));
            }
          }
          v226 = v191;
          CFRelease(v169);
          v169 = v226;
          goto LABEL_309;
        }
        if (v129)
          goto LABEL_231;
        v192 = (const UInt8 *)(((unint64_t)v125 + v128) & v139);
        v142 = (int *)(v192 + 4);
        v193 = *(int *)v192;
        if ((uint64_t)(v319 - (_QWORD)(v192 + 4)) < v193)
        {
          v84 = v333;
          v85 = v318;
          v86 = v303;
          if (!a8)
            goto LABEL_401;
          v264 = (void *)MEMORY[0x1E0CB35C8];
          v265 = *MEMORY[0x1E0CB28A8];
          v266 = (void *)MEMORY[0x1E0C99D80];
          v267 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData: XPC: Suspect response from server (remaining space for %@ insufficient (3))"), *(_QWORD *)&v334[v330 + 24]);
          goto LABEL_396;
        }
        v143 = v126;
        v194 = CFDataCreate(0, v192 + 4, v193);
        v144 = (__CFString *)v194;
        v145 = *(int *)v192;
        v195 = v143[20];
        if (v195 == 11)
        {
          if (-[__CFData length](v194, "length") != 16)
            goto LABEL_292;
          v147 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", -[__CFString bytes](v144, "bytes"));
        }
        else
        {
          if (v195 != 15)
            goto LABEL_292;
          v147 = (__CFString *)+[_PFRoutines retainedDecodeValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v194, (void *)objc_msgSend(*(id *)&v334[v330 + 24], "propertyDescription"));
        }
LABEL_291:
        v220 = v147;
        CFRelease(v144);
        v144 = v220;
LABEL_292:
        v180 = (CFAbsoluteTime *)((char *)v142 + v145);
        snapshot_set_object(v306, *((_DWORD *)v143 + 2), (uint64_t)v144);
LABEL_293:
        v125 = v180;
        goto LABEL_294;
    }
  }
}

+ (uint64_t)classesForFetchArchive
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  Class v11;
  Class v12;
  void *v13;

  objc_opt_self();
  if (!classesForFetchArchive_archiveClasses)
  {
    v0 = objc_alloc(MEMORY[0x1E0C99E20]);
    v1 = objc_opt_class();
    v2 = objc_opt_class();
    v3 = objc_opt_class();
    v4 = objc_opt_class();
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = (void *)objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
    v11 = NSClassFromString((NSString *)CFSTR("_NSPredicateUtilities"));
    objc_msgSend(v10, "unionSet:", -[objc_class _compoundPredicateClassesForSecureCoding](NSClassFromString((NSString *)CFSTR("_NSPredicateUtilities")), "_compoundPredicateClassesForSecureCoding"));
    objc_msgSend(v10, "unionSet:", -[objc_class _extendedExpressionClassesForSecureCoding](v11, "_extendedExpressionClassesForSecureCoding"));
    objc_msgSend(v10, "unionSet:", -[objc_class _operatorClassesForSecureCoding](v11, "_operatorClassesForSecureCoding"));
    objc_msgSend(v10, "unionSet:", -[objc_class _constantValueClassesForSecureCoding](v11, "_constantValueClassesForSecureCoding"));
    objc_msgSend(v10, "addObject:", NSClassFromString((NSString *)CFSTR("NSBoundedByPredicateOperator")));
    objc_msgSend(v10, "addObjectsFromArray:", +[NSKnownKeysDictionary classesForArchiving](NSKnownKeysDictionary, "classesForArchiving"));
    v12 = NSClassFromString((NSString *)CFSTR("_NSXPCStoreObjectIDArrayConstantValueExpression"));
    if (v12)
      objc_msgSend(v10, "addObject:", v12);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", v10);

    while (!__ldaxr((unint64_t *)&classesForFetchArchive_archiveClasses))
    {
      if (!__stlxr((unint64_t)v13, (unint64_t *)&classesForFetchArchive_archiveClasses))
        return classesForFetchArchive_archiveClasses;
    }
    __clrex();

  }
  return classesForFetchArchive_archiveClasses;
}

+ (_PFResultArray)_decodeBufferResultSetData:(void *)a3 forFetchRequest:(uint64_t)a4 options:(uint64_t)a5 store:(uint64_t)a6 context:(uint64_t)a7 rowCacheRows:(uint64_t *)a8 error:
{
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _PFResultArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  size_t v40;
  char *v41;
  objc_class *v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  unint64_t v61;
  NSKnownKeysDictionary *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  int v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v12 = objc_msgSend(a2, "bytes");
  v13 = objc_msgSend(a2, "length");
  if (v13 <= 7)
  {
    v14 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("CoreData: XPC: Suspect response from server (bad size)"), CFSTR("Reason")));
    if (!v14)
    {
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m");
      v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v69 = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m";
        v70 = 1024;
        v71 = 1290;
LABEL_50:
        _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        return 0;
      }
      return 0;
    }
    goto LABEL_12;
  }
  if (v12 >= v12 + v13)
  {
    v14 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("CoreData: XPC: Suspect response from server (no result)"), CFSTR("Reason")));
    if (!v14)
    {
      v31 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v31, v32, v33, v34, v35, v36, v37, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m");
      v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v69 = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m";
        v70 = 1024;
        v71 = 1306;
        goto LABEL_50;
      }
      return 0;
    }
    goto LABEL_12;
  }
  if (*(_QWORD *)v12 == 1)
  {
    if (v13 <= 0x13)
    {
      v14 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("CoreData: XPC: Suspect response from server (missing size)"), CFSTR("Reason")));
      if (!v14)
      {
        v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m");
        v22 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v69 = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m";
          v70 = 1024;
          v71 = 1319;
          goto LABEL_50;
        }
        return 0;
      }
LABEL_12:
      if (a8)
      {
        v30 = 0;
        *a8 = v14;
        return v30;
      }
      return 0;
    }
    v39 = *(unsigned int *)(v12 + 16);
    if ((_DWORD)v39)
    {
      v40 = *(_QWORD *)(v12 + 24);
      v41 = (char *)PF_CALLOC_SCANNED_BYTES(v40);
      memcpy(v41, (const void *)(v12 + 32), v40);
      v42 = (objc_class *)objc_opt_class();
      object_setClass(v41 + 8, v42);
      v43 = bufferResultSetAllocateWithBuffer(v40, (uint64_t)v41);
      *((_DWORD *)v43 + 10) |= 2u;
      v44 = (void *)objc_msgSend(a3, "propertiesToFetch");
      if (!objc_msgSend(v44, "count"))
      {
        v45 = (void *)objc_msgSend(a3, "entity");
        v46 = v45 ? (void *)objc_msgSend((id)objc_msgSend(v45, "propertiesByName"), "allKeys") : 0;
        v44 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v46, "count"));
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v64;
          do
          {
            for (i = 0; i != v48; ++i)
            {
              if (*(_QWORD *)v64 != v49)
                objc_enumerationMutation(v46);
              v51 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
              v52 = (void *)objc_msgSend(a3, "entity");
              if (v52)
              {
                v53 = (void *)objc_msgSend((id)objc_msgSend(v52, "propertiesByName"), "objectForKey:", v51);
                if (v53)
                {
                  v54 = v53;
                  if ((objc_msgSend(v53, "isTransient") & 1) == 0 && (objc_msgSend(v54, "_isRelationship") & 1) == 0)
                    objc_msgSend(v44, "addObject:", v54);
                }
              }
            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
          }
          while (v48);
        }
      }
      v55 = -[NSKnownKeysMappingStrategy initForKeys:]([NSKnownKeysMappingStrategy alloc], "initForKeys:", objc_msgSend(v44, "valueForKey:", CFSTR("name")));
      v56 = objc_msgSend(v44, "count");
      v57 = v56;
      if (v56 <= 1)
        v58 = 1;
      else
        v58 = v56;
      if (v56 >= 0x201)
        v59 = 1;
      else
        v59 = v58;
      v60 = (char *)&v63 - ((8 * v59 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v56 > 0x200)
        v60 = (char *)NSAllocateScannedUncollectable();
      else
        bzero((char *)&v63 - ((8 * v59 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v58);
      if (objc_msgSend(v44, "count"))
      {
        v61 = 0;
        do
        {
          *(_QWORD *)&v60[8 * v61] = objc_msgSend(v44, "objectAtIndexedSubscript:", v61);
          ++v61;
        }
        while (objc_msgSend(v44, "count") > v61);
      }
      v62 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", v55);
      -[NSKnownKeysDictionary setValues:](v62, "setValues:", v60);
      if (v57 >= 0x201)
        NSZoneFree(0, v60);
      v30 = -[_PFResultArray initWithObjects:count:store:metadata:]([_PFResultArray alloc], "initWithObjects:count:store:metadata:", v43, v39, a5, v62);

      return v30;
    }
  }
  return (_PFResultArray *)(id)NSArray_EmptyArray;
}

+ (uint64_t)classesForSaveArchive
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  objc_opt_self();
  if (!classesForSaveArchive_archiveClasses)
  {
    v21 = objc_alloc(MEMORY[0x1E0C99E20]);
    v20 = objc_opt_class();
    v19 = objc_opt_class();
    v18 = objc_opt_class();
    v17 = objc_opt_class();
    v16 = objc_opt_class();
    v15 = objc_opt_class();
    v14 = objc_opt_class();
    v0 = objc_opt_class();
    v1 = objc_opt_class();
    v2 = objc_opt_class();
    v3 = objc_opt_class();
    v4 = objc_opt_class();
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = (void *)objc_msgSend(v21, "initWithObjects:", v20, v19, v18, v17, v16, v15, v14, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9,
                    objc_opt_class(),
                    0);
    objc_msgSend(v10, "addObjectsFromArray:", +[NSKnownKeysDictionary classesForArchiving](NSKnownKeysDictionary, "classesForArchiving"));
    objc_msgSend(v10, "unionSet:", -[objc_class _constantValueClassesForSecureCoding](NSClassFromString((NSString *)CFSTR("_NSPredicateUtilities")), "_constantValueClassesForSecureCoding"));
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", v10);

    while (!__ldaxr((unint64_t *)&classesForSaveArchive_archiveClasses))
    {
      if (!__stlxr((unint64_t)v11, (unint64_t *)&classesForSaveArchive_archiveClasses))
        return classesForSaveArchive_archiveClasses;
    }
    __clrex();

  }
  return classesForSaveArchive_archiveClasses;
}

+ (void)logMessage:(uint64_t)a3 forComponent:(uint64_t)a4
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  objc_opt_self();
  if (a2)
    NSLog((NSString *)CFSTR("%@"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData: XPC: %@"), a2));
  else
    _NSCoreDataLog(8, (uint64_t)CFSTR("Someone tried to log something but failed because they didn't tell me what to log."), v10, v11, v12, v13, v14, v15, a9);
}

+ (uint64_t)classesForErrorArchive
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  objc_opt_self();
  if (!classesForErrorArchive_archiveClasses)
  {
    v0 = objc_alloc(MEMORY[0x1E0C99E20]);
    v1 = objc_opt_class();
    v2 = objc_opt_class();
    v3 = (void *)objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);
    objc_msgSend(v3, "unionSet:", +[_NSXPCStoreUtilities classesForSaveArchive]());
    objc_msgSend(v3, "unionSet:", +[_NSXPCStoreUtilities classesForFetchArchive]());
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", v3);

    while (!__ldaxr((unint64_t *)&classesForErrorArchive_archiveClasses))
    {
      if (!__stlxr((unint64_t)v4, (unint64_t *)&classesForErrorArchive_archiveClasses))
        return classesForErrorArchive_archiveClasses;
    }
    __clrex();

  }
  return classesForErrorArchive_archiveClasses;
}

+ (uint64_t)newUserInfoFromException:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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

  objc_opt_self();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setValue:forKey:", objc_msgSend(a2, "name"), CFSTR("exception name"));
  objc_msgSend(v3, "setValue:forKey:", objc_msgSend(a2, "reason"), CFSTR("exception reason"));
  if (objc_msgSend((id)objc_msgSend(a2, "userInfo"), "valueForKey:", CFSTR("NSSQLiteErrorDomain")))
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend(a2, "userInfo"), "valueForKey:", CFSTR("NSSQLiteErrorDomain")), CFSTR("NSSQLiteErrorDomain"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("controlled exception"));
  _NSCoreDataLog(8, (uint64_t)CFSTR("Error: Exception raised: %@"), v4, v5, v6, v7, v8, v9, (uint64_t)a2);
  v10 = objc_msgSend(a2, "callStackSymbols");
  _NSCoreDataLog(8, (uint64_t)CFSTR("Error: Callstack: %@"), v11, v12, v13, v14, v15, v16, v10);
  v17 = objc_msgSend(a2, "userInfo");
  _NSCoreDataLog(8, (uint64_t)CFSTR("Error: UserInfo: %@"), v18, v19, v20, v21, v22, v23, v17);
  v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v3, CFSTR("exception info"), 0);

  return v24;
}

@end
