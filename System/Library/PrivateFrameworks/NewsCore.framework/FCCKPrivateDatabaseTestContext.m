@implementation FCCKPrivateDatabaseTestContext

- (FCCKPrivateDatabaseTestContext)init
{
  FCCKPrivateDatabaseTestContext *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  TCKDatabase *v14;
  TCKDatabase *tckDatabase;
  TCKDatabase *v16;
  TCKDatabase *tckDatabaseWithZoneWidePCS;
  TCKDatabase *v18;
  TCKDatabase *tckSecureDatabase;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id *v79;
  FCCKPrivateDatabase *v80;
  CKDatabase *ckDatabase;
  CKDatabase *ckDatabaseWithZoneWidePCS;
  CKDatabase *ckSecureDatabase;
  void *v84;
  uint64_t v85;
  FCCKPrivateDatabase *database;
  FCCKPrivateDatabase *v87;
  id v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  CKRecordZoneID *clientZoneID;
  id v94;
  void *v95;
  id v96;
  uint64_t v97;
  CKRecordZoneID *clientZoneIDWithZoneWidePCS;
  id v99;
  void *v100;
  id v101;
  uint64_t v102;
  CKRecordZoneID *clientZoneIDSecure;
  uint64_t v104;
  NSArray *allClientZoneIDs;
  uint64_t v106;
  CKRecordZone *clientZone;
  uint64_t v108;
  CKRecordZone *clientZoneWithZoneWidePCS;
  uint64_t v110;
  CKRecordZone *clientZoneSecure;
  uint64_t v112;
  NSArray *allClientZones;
  uint64_t v114;
  NSDictionary *allClientZonesByID;
  uint64_t v116;
  CKRecordID *clientRecordID;
  uint64_t v118;
  CKRecordID *clientRecordIDWithZoneWidePCS;
  uint64_t v120;
  CKRecordID *clientRecordIDSecure;
  uint64_t v122;
  NSArray *allClientRecordIDs;
  id v124;
  void *v125;
  id v126;
  uint64_t v127;
  CKRecord *clientRecord;
  id v129;
  void *v130;
  id v131;
  uint64_t v132;
  CKRecord *clientRecordWithZoneWidePCS;
  id v134;
  void *v135;
  id v136;
  uint64_t v137;
  CKRecord *clientRecordSecure;
  uint64_t v139;
  NSArray *allClientRecords;
  uint64_t v141;
  NSDictionary *allClientRecordsByID;
  id v143;
  void *v144;
  id v145;
  uint64_t v146;
  CKRecordZoneID *serverZoneID;
  id v148;
  void *v149;
  id v150;
  uint64_t v151;
  CKRecordZoneID *serverZoneIDWithZoneWidePCS;
  id v153;
  void *v154;
  id v155;
  uint64_t v156;
  CKRecordZoneID *serverZoneIDSecure;
  uint64_t v158;
  NSArray *allServerZoneIDs;
  uint64_t v160;
  CKRecordZone *serverZone;
  uint64_t v162;
  CKRecordZone *serverZoneWithZoneWidePCS;
  uint64_t v164;
  CKRecordZone *serverZoneSecure;
  uint64_t v166;
  NSArray *allServerZones;
  uint64_t v168;
  CKRecordID *serverRecordID;
  uint64_t v170;
  CKRecordID *serverRecordIDWithZoneWidePCS;
  uint64_t v172;
  CKRecordID *serverRecordIDSecure;
  uint64_t v174;
  NSArray *allServerRecordIDs;
  id v176;
  void *v177;
  id v178;
  uint64_t v179;
  CKRecord *serverRecord;
  id v181;
  void *v182;
  id v183;
  uint64_t v184;
  CKRecord *serverRecordWithZoneWidePCS;
  id v186;
  void *v187;
  id v188;
  uint64_t v189;
  CKRecord *serverRecordSecure;
  uint64_t v191;
  NSArray *allServerRecords;
  id v193;
  void *v194;
  uint64_t v195;
  CKRecordID *defaultZoneClientRecordID;
  uint64_t v197;
  CKRecordID *defaultZoneClientRecordIDSecure;
  uint64_t v199;
  CKRecordID *defaultZoneServerRecordID;
  uint64_t v201;
  CKRecordID *defaultZoneServerRecordIDSecure;
  CKRecordID *v203;
  uint64_t v204;
  NSArray *allDefaultZoneClientRecordIDs;
  id v206;
  void *v207;
  id v208;
  uint64_t v209;
  CKRecord *defaultZoneClientRecord;
  id v211;
  void *v212;
  id v213;
  uint64_t v214;
  CKRecord *defaultZoneClientRecordSecure;
  id v216;
  void *v217;
  id v218;
  uint64_t v219;
  CKRecord *defaultZoneServerRecord;
  id v221;
  void *v222;
  id v223;
  uint64_t v224;
  CKRecord *defaultZoneServerRecordSecure;
  CKRecord *v226;
  uint64_t v227;
  NSArray *allDefaultZoneClientRecords;
  uint64_t v229;
  NSDictionary *allDefaultZoneClientRecordsByID;
  void *v232;
  id v233;
  void *v234;
  id v235;
  void *v236;
  id v237;
  void *v238;
  id v239;
  void *v240;
  id v241;
  void *v242;
  id v243;
  void *v244;
  id v245;
  void *v246;
  id v247;
  void *v248;
  id v249;
  void *v250;
  id v251;
  void *v252;
  void *v253;
  id v254;
  void *v255;
  id v256;
  void *v257;
  id v258;
  void *v259;
  id v260;
  void *v261;
  id v262;
  id v263;
  id v264;
  id v265;
  id v266;
  id v267;
  id v268;
  id v269;
  id v270;
  id v271;
  id v272;
  void *v273;
  id v274;
  id v275;
  id v276;
  void *v277;
  id v278;
  id v279;
  id v280;
  void *v281;
  id v282;
  id v283;
  void *v284;
  void *v285;
  _QWORD *v286;
  _QWORD *v287;
  _QWORD *v288;
  _QWORD *v289;
  _QWORD *v290;
  _QWORD *v291;
  _QWORD *v292;
  _QWORD *v293;
  _QWORD *v294;
  _QWORD *v295;
  _QWORD *v296;
  _QWORD *v297;
  _QWORD *v298;
  _QWORD *v299;
  objc_super v300;
  _QWORD v301[2];
  _QWORD v302[2];
  __int128 v303;
  CKRecord *v304;
  __int128 v305;
  CKRecordID *v306;
  __int128 v307;
  CKRecordZone *v308;
  __int128 v309;
  CKRecordZoneID *v310;
  __int128 v311;
  CKRecord *v312;
  __int128 v313;
  CKRecordID *v314;
  __int128 v315;
  CKRecordZone *v316;
  __int128 v317;
  CKRecordZoneID *v318;
  id *v319;
  _QWORD v320[2];
  _QWORD v321[12];
  _QWORD v322[2];
  _QWORD v323[2];
  _QWORD v324[2];
  _QWORD v325[6];
  _QWORD v326[6];
  _QWORD v327[5];
  const __CFString *v328;
  const __CFString *v329;
  const __CFString *v330;
  _QWORD v331[3];

  v331[1] = *MEMORY[0x1E0C80C00];
  v300.receiver = self;
  v300.super_class = (Class)FCCKPrivateDatabaseTestContext;
  v2 = -[FCCKPrivateDatabaseTestContext init](&v300, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
    +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("Record_Client"), MEMORY[0x1E0C9AA60]);
    v4 = objc_claimAutoreleasedReturnValue();
    +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("Record_Server"), v3);
    v5 = objc_claimAutoreleasedReturnValue();
    +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, CFSTR("Regular_Client"));
    v6 = objc_claimAutoreleasedReturnValue();
    +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, CFSTR("Regular_Server"));
    v299 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, CFSTR("ZoneWidePCS_Client"));
    v7 = objc_claimAutoreleasedReturnValue();
    +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("ZoneWidePCS_Server"), 2, 0);
    v298 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, CFSTR("Secure_Client"));
    v297 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("Secure_Server"), 6, 0);
    v296 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, CFSTR("SecureZoneWidePCS_Client"));
    v291 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("SecureZoneWidePCS_Server"), 6, 0);
    v290 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v331[0] = CFSTR("DefaultZoneStaticRecord_Client");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v331, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCCKZoneSchema defaultZoneWithStaticRecordNames:shouldUseSecureContainer:]((uint64_t)FCCKZoneSchema, v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v330 = CFSTR("DefaultZoneStaticRecord_Server");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v330, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCCKZoneSchema defaultZoneWithStaticRecordNames:shouldUseSecureContainer:]((uint64_t)FCCKZoneSchema, v10, 0);
    v294 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    v329 = CFSTR("DefaultZoneStaticRecordSecure_Client");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v329, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCCKZoneSchema defaultZoneWithStaticRecordNames:shouldUseSecureContainer:]((uint64_t)FCCKZoneSchema, v11, 0);
    v293 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    v328 = CFSTR("DefaultZoneStaticRecordSecure_Server");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v328, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCCKZoneSchema defaultZoneWithStaticRecordNames:shouldUseSecureContainer:]((uint64_t)FCCKZoneSchema, v12, 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc_init(TCKDatabase);
    tckDatabase = v2->_tckDatabase;
    v2->_tckDatabase = v14;

    v16 = objc_alloc_init(TCKDatabase);
    tckDatabaseWithZoneWidePCS = v2->_tckDatabaseWithZoneWidePCS;
    v2->_tckDatabaseWithZoneWidePCS = v16;

    v18 = objc_alloc_init(TCKDatabase);
    tckSecureDatabase = v2->_tckSecureDatabase;
    v2->_tckSecureDatabase = v18;

    objc_storeStrong((id *)&v2->_ckDatabase, v2->_tckDatabase);
    objc_storeStrong((id *)&v2->_ckDatabaseWithZoneWidePCS, v2->_tckDatabaseWithZoneWidePCS);
    objc_storeStrong((id *)&v2->_ckSecureDatabase, v2->_tckSecureDatabase);
    v295 = (_QWORD *)v9;
    if (v9)
      v20 = *(void **)(v9 + 16);
    else
      v20 = 0;
    v282 = v20;
    if (v4)
      v21 = *(void **)(v4 + 16);
    else
      v21 = 0;
    v262 = v21;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v282);
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    v327[0] = v261;
    if (v6)
      v22 = *(void **)(v6 + 16);
    else
      v22 = 0;
    v280 = v22;
    if (v4)
      v23 = *(void **)(v4 + 16);
    else
      v23 = 0;
    v260 = v23;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v280);
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    v327[1] = v259;
    if (v7)
      v24 = *(void **)(v7 + 16);
    else
      v24 = 0;
    v278 = v24;
    if (v4)
      v25 = *(void **)(v4 + 16);
    else
      v25 = 0;
    v258 = v25;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v278);
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    v327[2] = v257;
    if (v297)
      v26 = (void *)v297[2];
    else
      v26 = 0;
    v276 = v26;
    if (v4)
      v27 = *(void **)(v4 + 16);
    else
      v27 = 0;
    v256 = v27;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v276);
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    v327[3] = v255;
    if (v291)
      v28 = (void *)v291[2];
    else
      v28 = 0;
    v274 = v28;
    if (v4)
      v29 = *(void **)(v4 + 16);
    else
      v29 = 0;
    v254 = v29;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v274);
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    v327[4] = v253;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v327, 5);
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)v9;
    if (v9)
      v30 = *(void **)(v9 + 16);
    v272 = v30;
    if (v4)
      v31 = *(void **)(v4 + 16);
    else
      v31 = 0;
    v251 = v31;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v272);
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    v325[0] = v250;
    v32 = v294;
    if (v294)
      v32 = (void *)v294[2];
    v270 = v32;
    if (v5)
      v33 = *(void **)(v5 + 16);
    else
      v33 = 0;
    v249 = v33;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v270);
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    v326[0] = v248;
    v34 = v293;
    if (v293)
      v34 = (void *)v293[2];
    v269 = v34;
    if (v4)
      v35 = *(void **)(v4 + 16);
    else
      v35 = 0;
    v247 = v35;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v269);
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    v325[1] = v246;
    if (v13)
      v36 = *(void **)(v13 + 16);
    else
      v36 = 0;
    v268 = v36;
    if (v5)
      v37 = *(void **)(v5 + 16);
    else
      v37 = 0;
    v245 = v37;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v268);
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    v326[1] = v244;
    if (v6)
      v38 = *(void **)(v6 + 16);
    else
      v38 = 0;
    v267 = v38;
    if (v4)
      v39 = *(void **)(v4 + 16);
    else
      v39 = 0;
    v243 = v39;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v267);
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    v325[2] = v242;
    v40 = v299;
    if (v299)
      v40 = (void *)v299[2];
    v266 = v40;
    if (v5)
      v41 = *(void **)(v5 + 16);
    else
      v41 = 0;
    v241 = v41;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v266);
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    v326[2] = v240;
    if (v7)
      v42 = *(void **)(v7 + 16);
    else
      v42 = 0;
    v265 = v42;
    if (v4)
      v43 = *(void **)(v4 + 16);
    else
      v43 = 0;
    v239 = v43;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v265);
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    v325[3] = v238;
    v44 = v298;
    if (v298)
      v44 = (void *)v298[2];
    v264 = v44;
    if (v5)
      v45 = *(void **)(v5 + 16);
    else
      v45 = 0;
    v237 = v45;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v264);
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    v326[3] = v236;
    if (v297)
      v46 = (void *)v297[2];
    else
      v46 = 0;
    v47 = v46;
    if (v4)
      v48 = *(void **)(v4 + 16);
    else
      v48 = 0;
    v235 = v48;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v47);
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    v325[4] = v234;
    v49 = v296;
    if (v296)
      v49 = (void *)v296[2];
    v263 = v49;
    v289 = (_QWORD *)v4;
    v286 = (_QWORD *)v13;
    if (v5)
      v50 = *(void **)(v5 + 16);
    else
      v50 = 0;
    v233 = v50;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v263);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    v326[4] = v232;
    if (v291)
      v51 = (void *)v291[2];
    else
      v51 = 0;
    v52 = v51;
    v53 = (void *)v4;
    v292 = (_QWORD *)v7;
    if (v4)
      v53 = *(void **)(v4 + 16);
    v54 = v53;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v52, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v325[5] = v55;
    v56 = v290;
    if (v290)
      v56 = (void *)v290[2];
    v57 = v56;
    v287 = (_QWORD *)v6;
    v288 = (_QWORD *)v5;
    if (v5)
      v58 = *(void **)(v5 + 16);
    else
      v58 = 0;
    v59 = v58;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v57, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v326[5] = v60;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v326, v325, 6);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCCKPrivateDatabaseVersionMapping mappingWithBaseValues:V2Changes:V3Changes:V4Changes:](FCCKPrivateDatabaseVersionMapping, "mappingWithBaseValues:V2Changes:V3Changes:V4Changes:", v252, v61, 0, 0);
    v285 = (void *)objc_claimAutoreleasedReturnValue();

    if (v295)
      v62 = (void *)v295[2];
    else
      v62 = 0;
    v283 = v62;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:");
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    v324[0] = v281;
    if (v295)
      v63 = (void *)v295[2];
    else
      v63 = 0;
    v279 = v63;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:");
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    v324[1] = v277;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v324, 2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v295)
      v65 = (void *)v295[2];
    else
      v65 = 0;
    v275 = v65;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    v322[0] = v273;
    v66 = v294;
    if (v294)
      v66 = (void *)v294[2];
    v271 = v66;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v323[0] = v67;
    v68 = v293;
    if (v293)
      v68 = (void *)v293[2];
    v69 = v68;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v69, CFSTR("DefaultZoneStaticRecordSecure_Client"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v322[1] = v70;
    if (v286)
      v71 = (void *)v286[2];
    else
      v71 = 0;
    v72 = v71;
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v72, CFSTR("DefaultZoneStaticRecordSecure_Server"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v323[1] = v73;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v323, v322, 2);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCCKPrivateDatabaseVersionMapping mappingWithBaseValues:V2Changes:V3Changes:V4Changes:](FCCKPrivateDatabaseVersionMapping, "mappingWithBaseValues:V2Changes:V3Changes:V4Changes:", v64, v74, 0, 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    v321[0] = v287;
    v321[1] = v299;
    v321[2] = v292;
    v321[3] = v298;
    v321[4] = v297;
    v321[5] = v296;
    v321[6] = v291;
    v321[7] = v290;
    v321[8] = v295;
    v321[9] = v294;
    v321[10] = v293;
    v321[11] = v286;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v321, 12);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v320[0] = v289;
    v320[1] = v288;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v320, 2);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v284 = v75;
    +[FCCKPrivateDatabaseSchema databaseSchemaWithZones:records:recordTypeVersionMapping:recordNameVersionMapping:]((uint64_t)FCCKPrivateDatabaseSchema, v76, v77, v285, v75);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = -[FCCKDatabaseEncryptionMiddleware initWithEncryptionSchema:recordNameCipher:]((id *)[FCCKDatabaseEncryptionMiddleware alloc], v78, 0);
    v80 = [FCCKPrivateDatabase alloc];
    ckDatabase = v2->_ckDatabase;
    ckDatabaseWithZoneWidePCS = v2->_ckDatabaseWithZoneWidePCS;
    ckSecureDatabase = v2->_ckSecureDatabase;
    v319 = v79;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v319, 1);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDatabase t_initWithContainers:database:databaseWithZoneWidePCS:secureDatabase:schema:middleware:encryptionDelegate:networkBehaviorMonitor:]((id *)&v80->super.isa, 0, ckDatabase, ckDatabaseWithZoneWidePCS, ckSecureDatabase, v78, v84, 0, 0);
    v85 = objc_claimAutoreleasedReturnValue();
    database = v2->_database;
    v2->_database = (FCCKPrivateDatabase *)v85;

    v87 = v2->_database;
    if (v87)
      v87->_currentVersion = 3;
    v88 = objc_alloc(MEMORY[0x1E0C95098]);
    if (v287)
      v89 = (void *)v287[2];
    else
      v89 = 0;
    v90 = v89;
    v91 = *MEMORY[0x1E0C94730];
    v92 = objc_msgSend(v88, "initWithZoneName:ownerName:", v90, *MEMORY[0x1E0C94730]);
    clientZoneID = v2->_clientZoneID;
    v2->_clientZoneID = (CKRecordZoneID *)v92;

    v94 = objc_alloc(MEMORY[0x1E0C95098]);
    v95 = v292;
    if (v292)
      v95 = (void *)v292[2];
    v96 = v95;
    v97 = objc_msgSend(v94, "initWithZoneName:ownerName:", v96, v91);
    clientZoneIDWithZoneWidePCS = v2->_clientZoneIDWithZoneWidePCS;
    v2->_clientZoneIDWithZoneWidePCS = (CKRecordZoneID *)v97;

    v99 = objc_alloc(MEMORY[0x1E0C95098]);
    v100 = v297;
    if (v297)
      v100 = (void *)v297[2];
    v101 = v100;
    v102 = objc_msgSend(v99, "initWithZoneName:ownerName:", v101, v91);
    clientZoneIDSecure = v2->_clientZoneIDSecure;
    v2->_clientZoneIDSecure = (CKRecordZoneID *)v102;

    v317 = *(_OWORD *)&v2->_clientZoneID;
    v318 = v2->_clientZoneIDSecure;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v317, 3);
    v104 = objc_claimAutoreleasedReturnValue();
    allClientZoneIDs = v2->_allClientZoneIDs;
    v2->_allClientZoneIDs = (NSArray *)v104;

    v106 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v2->_clientZoneID);
    clientZone = v2->_clientZone;
    v2->_clientZone = (CKRecordZone *)v106;

    v108 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v2->_clientZoneIDWithZoneWidePCS);
    clientZoneWithZoneWidePCS = v2->_clientZoneWithZoneWidePCS;
    v2->_clientZoneWithZoneWidePCS = (CKRecordZone *)v108;

    v110 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v2->_clientZoneIDSecure);
    clientZoneSecure = v2->_clientZoneSecure;
    v2->_clientZoneSecure = (CKRecordZone *)v110;

    v315 = *(_OWORD *)&v2->_clientZone;
    v316 = v2->_clientZoneSecure;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v315, 3);
    v112 = objc_claimAutoreleasedReturnValue();
    allClientZones = v2->_allClientZones;
    v2->_allClientZones = (NSArray *)v112;

    -[NSArray fc_dictionaryWithKeyBlock:](v2->_allClientZones, "fc_dictionaryWithKeyBlock:", &__block_literal_global_154);
    v114 = objc_claimAutoreleasedReturnValue();
    allClientZonesByID = v2->_allClientZonesByID;
    v2->_allClientZonesByID = (NSDictionary *)v114;

    v116 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("R"), v2->_clientZoneID);
    clientRecordID = v2->_clientRecordID;
    v2->_clientRecordID = (CKRecordID *)v116;

    v118 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("R"), v2->_clientZoneIDWithZoneWidePCS);
    clientRecordIDWithZoneWidePCS = v2->_clientRecordIDWithZoneWidePCS;
    v2->_clientRecordIDWithZoneWidePCS = (CKRecordID *)v118;

    v120 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("R"), v2->_clientZoneIDSecure);
    clientRecordIDSecure = v2->_clientRecordIDSecure;
    v2->_clientRecordIDSecure = (CKRecordID *)v120;

    v313 = *(_OWORD *)&v2->_clientRecordID;
    v314 = v2->_clientRecordIDSecure;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v313, 3);
    v122 = objc_claimAutoreleasedReturnValue();
    allClientRecordIDs = v2->_allClientRecordIDs;
    v2->_allClientRecordIDs = (NSArray *)v122;

    v124 = objc_alloc(MEMORY[0x1E0C95048]);
    if (v289)
      v125 = (void *)v289[2];
    else
      v125 = 0;
    v126 = v125;
    v127 = objc_msgSend(v124, "initWithRecordType:recordID:", v126, v2->_clientRecordID);
    clientRecord = v2->_clientRecord;
    v2->_clientRecord = (CKRecord *)v127;

    v129 = objc_alloc(MEMORY[0x1E0C95048]);
    if (v289)
      v130 = (void *)v289[2];
    else
      v130 = 0;
    v131 = v130;
    v132 = objc_msgSend(v129, "initWithRecordType:recordID:", v131, v2->_clientRecordIDWithZoneWidePCS);
    clientRecordWithZoneWidePCS = v2->_clientRecordWithZoneWidePCS;
    v2->_clientRecordWithZoneWidePCS = (CKRecord *)v132;

    v134 = objc_alloc(MEMORY[0x1E0C95048]);
    if (v289)
      v135 = (void *)v289[2];
    else
      v135 = 0;
    v136 = v135;
    v137 = objc_msgSend(v134, "initWithRecordType:recordID:", v136, v2->_clientRecordIDSecure);
    clientRecordSecure = v2->_clientRecordSecure;
    v2->_clientRecordSecure = (CKRecord *)v137;

    v311 = *(_OWORD *)&v2->_clientRecord;
    v312 = v2->_clientRecordSecure;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v311, 3);
    v139 = objc_claimAutoreleasedReturnValue();
    allClientRecords = v2->_allClientRecords;
    v2->_allClientRecords = (NSArray *)v139;

    -[NSArray fc_dictionaryWithKeyBlock:](v2->_allClientRecords, "fc_dictionaryWithKeyBlock:", &__block_literal_global_44_5);
    v141 = objc_claimAutoreleasedReturnValue();
    allClientRecordsByID = v2->_allClientRecordsByID;
    v2->_allClientRecordsByID = (NSDictionary *)v141;

    v143 = objc_alloc(MEMORY[0x1E0C95098]);
    v144 = v299;
    if (v299)
      v144 = (void *)v299[2];
    v145 = v144;
    v146 = objc_msgSend(v143, "initWithZoneName:ownerName:", v145, v91);
    serverZoneID = v2->_serverZoneID;
    v2->_serverZoneID = (CKRecordZoneID *)v146;

    v148 = objc_alloc(MEMORY[0x1E0C95098]);
    v149 = v298;
    if (v298)
      v149 = (void *)v298[2];
    v150 = v149;
    v151 = objc_msgSend(v148, "initWithZoneName:ownerName:", v150, v91);
    serverZoneIDWithZoneWidePCS = v2->_serverZoneIDWithZoneWidePCS;
    v2->_serverZoneIDWithZoneWidePCS = (CKRecordZoneID *)v151;

    v153 = objc_alloc(MEMORY[0x1E0C95098]);
    v154 = v296;
    if (v296)
      v154 = (void *)v296[2];
    v155 = v154;
    v156 = objc_msgSend(v153, "initWithZoneName:ownerName:", v155, v91);
    serverZoneIDSecure = v2->_serverZoneIDSecure;
    v2->_serverZoneIDSecure = (CKRecordZoneID *)v156;

    v309 = *(_OWORD *)&v2->_serverZoneID;
    v310 = v2->_serverZoneIDSecure;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v309, 3);
    v158 = objc_claimAutoreleasedReturnValue();
    allServerZoneIDs = v2->_allServerZoneIDs;
    v2->_allServerZoneIDs = (NSArray *)v158;

    v160 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v2->_serverZoneID);
    serverZone = v2->_serverZone;
    v2->_serverZone = (CKRecordZone *)v160;

    v162 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v2->_serverZoneIDWithZoneWidePCS);
    serverZoneWithZoneWidePCS = v2->_serverZoneWithZoneWidePCS;
    v2->_serverZoneWithZoneWidePCS = (CKRecordZone *)v162;

    v164 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v2->_serverZoneIDSecure);
    serverZoneSecure = v2->_serverZoneSecure;
    v2->_serverZoneSecure = (CKRecordZone *)v164;

    v307 = *(_OWORD *)&v2->_serverZone;
    v308 = v2->_serverZoneSecure;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v307, 3);
    v166 = objc_claimAutoreleasedReturnValue();
    allServerZones = v2->_allServerZones;
    v2->_allServerZones = (NSArray *)v166;

    v168 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("R"), v2->_serverZoneID);
    serverRecordID = v2->_serverRecordID;
    v2->_serverRecordID = (CKRecordID *)v168;

    v170 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("R"), v2->_serverZoneIDWithZoneWidePCS);
    serverRecordIDWithZoneWidePCS = v2->_serverRecordIDWithZoneWidePCS;
    v2->_serverRecordIDWithZoneWidePCS = (CKRecordID *)v170;

    v172 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("R"), v2->_serverZoneIDSecure);
    serverRecordIDSecure = v2->_serverRecordIDSecure;
    v2->_serverRecordIDSecure = (CKRecordID *)v172;

    v305 = *(_OWORD *)&v2->_serverRecordID;
    v306 = v2->_serverRecordIDSecure;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v305, 3);
    v174 = objc_claimAutoreleasedReturnValue();
    allServerRecordIDs = v2->_allServerRecordIDs;
    v2->_allServerRecordIDs = (NSArray *)v174;

    v176 = objc_alloc(MEMORY[0x1E0C95048]);
    if (v288)
      v177 = (void *)v288[2];
    else
      v177 = 0;
    v178 = v177;
    v179 = objc_msgSend(v176, "initWithRecordType:recordID:", v178, v2->_serverRecordID);
    serverRecord = v2->_serverRecord;
    v2->_serverRecord = (CKRecord *)v179;

    v181 = objc_alloc(MEMORY[0x1E0C95048]);
    if (v288)
      v182 = (void *)v288[2];
    else
      v182 = 0;
    v183 = v182;
    v184 = objc_msgSend(v181, "initWithRecordType:recordID:", v183, v2->_serverRecordIDWithZoneWidePCS);
    serverRecordWithZoneWidePCS = v2->_serverRecordWithZoneWidePCS;
    v2->_serverRecordWithZoneWidePCS = (CKRecord *)v184;

    v186 = objc_alloc(MEMORY[0x1E0C95048]);
    if (v288)
      v187 = (void *)v288[2];
    else
      v187 = 0;
    v188 = v187;
    v189 = objc_msgSend(v186, "initWithRecordType:recordID:", v188, v2->_serverRecordIDSecure);
    serverRecordSecure = v2->_serverRecordSecure;
    v2->_serverRecordSecure = (CKRecord *)v189;

    v303 = *(_OWORD *)&v2->_serverRecord;
    v304 = v2->_serverRecordSecure;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v303, 3);
    v191 = objc_claimAutoreleasedReturnValue();
    allServerRecords = v2->_allServerRecords;
    v2->_allServerRecords = (NSArray *)v191;

    v193 = objc_alloc(MEMORY[0x1E0C95098]);
    v194 = (void *)objc_msgSend(v193, "initWithZoneName:ownerName:", *MEMORY[0x1E0C94A30], v91);
    v195 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("DefaultZoneStaticRecord_Client"), v194);
    defaultZoneClientRecordID = v2->_defaultZoneClientRecordID;
    v2->_defaultZoneClientRecordID = (CKRecordID *)v195;

    v197 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("DefaultZoneStaticRecordSecure_Client"), v194);
    defaultZoneClientRecordIDSecure = v2->_defaultZoneClientRecordIDSecure;
    v2->_defaultZoneClientRecordIDSecure = (CKRecordID *)v197;

    v199 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("DefaultZoneStaticRecord_Server"), v194);
    defaultZoneServerRecordID = v2->_defaultZoneServerRecordID;
    v2->_defaultZoneServerRecordID = (CKRecordID *)v199;

    v201 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("DefaultZoneStaticRecordSecure_Server"), v194);
    defaultZoneServerRecordIDSecure = v2->_defaultZoneServerRecordIDSecure;
    v2->_defaultZoneServerRecordIDSecure = (CKRecordID *)v201;

    v203 = v2->_defaultZoneClientRecordIDSecure;
    v302[0] = v2->_defaultZoneClientRecordID;
    v302[1] = v203;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v302, 2);
    v204 = objc_claimAutoreleasedReturnValue();
    allDefaultZoneClientRecordIDs = v2->_allDefaultZoneClientRecordIDs;
    v2->_allDefaultZoneClientRecordIDs = (NSArray *)v204;

    v206 = objc_alloc(MEMORY[0x1E0C95048]);
    if (v289)
      v207 = (void *)v289[2];
    else
      v207 = 0;
    v208 = v207;
    v209 = objc_msgSend(v206, "initWithRecordType:recordID:", v208, v2->_defaultZoneClientRecordID);
    defaultZoneClientRecord = v2->_defaultZoneClientRecord;
    v2->_defaultZoneClientRecord = (CKRecord *)v209;

    v211 = objc_alloc(MEMORY[0x1E0C95048]);
    if (v289)
      v212 = (void *)v289[2];
    else
      v212 = 0;
    v213 = v212;
    v214 = objc_msgSend(v211, "initWithRecordType:recordID:", v213, v2->_defaultZoneClientRecordIDSecure);
    defaultZoneClientRecordSecure = v2->_defaultZoneClientRecordSecure;
    v2->_defaultZoneClientRecordSecure = (CKRecord *)v214;

    v216 = objc_alloc(MEMORY[0x1E0C95048]);
    if (v288)
      v217 = (void *)v288[2];
    else
      v217 = 0;
    v218 = v217;
    v219 = objc_msgSend(v216, "initWithRecordType:recordID:", v218, v2->_defaultZoneServerRecordID);
    defaultZoneServerRecord = v2->_defaultZoneServerRecord;
    v2->_defaultZoneServerRecord = (CKRecord *)v219;

    v221 = objc_alloc(MEMORY[0x1E0C95048]);
    if (v288)
      v222 = (void *)v288[2];
    else
      v222 = 0;
    v223 = v222;
    v224 = objc_msgSend(v221, "initWithRecordType:recordID:", v223, v2->_defaultZoneServerRecordIDSecure);
    defaultZoneServerRecordSecure = v2->_defaultZoneServerRecordSecure;
    v2->_defaultZoneServerRecordSecure = (CKRecord *)v224;

    v226 = v2->_defaultZoneClientRecordSecure;
    v301[0] = v2->_defaultZoneClientRecord;
    v301[1] = v226;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v301, 2);
    v227 = objc_claimAutoreleasedReturnValue();
    allDefaultZoneClientRecords = v2->_allDefaultZoneClientRecords;
    v2->_allDefaultZoneClientRecords = (NSArray *)v227;

    -[NSArray fc_dictionaryWithKeyBlock:](v2->_allDefaultZoneClientRecords, "fc_dictionaryWithKeyBlock:", &__block_literal_global_45_5);
    v229 = objc_claimAutoreleasedReturnValue();
    allDefaultZoneClientRecordsByID = v2->_allDefaultZoneClientRecordsByID;
    v2->_allDefaultZoneClientRecordsByID = (NSDictionary *)v229;

  }
  return v2;
}

uint64_t __38__FCCKPrivateDatabaseTestContext_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zoneID");
}

uint64_t __38__FCCKPrivateDatabaseTestContext_init__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordID");
}

uint64_t __38__FCCKPrivateDatabaseTestContext_init__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordID");
}

- (FCCKPrivateDatabase)database
{
  return self->_database;
}

- (CKDatabase)ckDatabase
{
  return self->_ckDatabase;
}

- (CKDatabase)ckDatabaseWithZoneWidePCS
{
  return self->_ckDatabaseWithZoneWidePCS;
}

- (CKDatabase)ckSecureDatabase
{
  return self->_ckSecureDatabase;
}

- (TCKDatabase)tckDatabase
{
  return self->_tckDatabase;
}

- (TCKDatabase)tckDatabaseWithZoneWidePCS
{
  return self->_tckDatabaseWithZoneWidePCS;
}

- (TCKDatabase)tckSecureDatabase
{
  return self->_tckSecureDatabase;
}

- (CKRecordID)clientRecordID
{
  return self->_clientRecordID;
}

- (CKRecordID)clientRecordIDWithZoneWidePCS
{
  return self->_clientRecordIDWithZoneWidePCS;
}

- (CKRecordID)clientRecordIDSecure
{
  return self->_clientRecordIDSecure;
}

- (NSArray)allClientRecordIDs
{
  return self->_allClientRecordIDs;
}

- (CKRecordID)serverRecordID
{
  return self->_serverRecordID;
}

- (CKRecordID)serverRecordIDWithZoneWidePCS
{
  return self->_serverRecordIDWithZoneWidePCS;
}

- (CKRecordID)serverRecordIDSecure
{
  return self->_serverRecordIDSecure;
}

- (NSArray)allServerRecordIDs
{
  return self->_allServerRecordIDs;
}

- (CKRecord)clientRecord
{
  return self->_clientRecord;
}

- (CKRecord)clientRecordWithZoneWidePCS
{
  return self->_clientRecordWithZoneWidePCS;
}

- (CKRecord)clientRecordSecure
{
  return self->_clientRecordSecure;
}

- (NSArray)allClientRecords
{
  return self->_allClientRecords;
}

- (NSDictionary)allClientRecordsByID
{
  return self->_allClientRecordsByID;
}

- (CKRecord)serverRecord
{
  return self->_serverRecord;
}

- (CKRecord)serverRecordWithZoneWidePCS
{
  return self->_serverRecordWithZoneWidePCS;
}

- (CKRecord)serverRecordSecure
{
  return self->_serverRecordSecure;
}

- (NSArray)allServerRecords
{
  return self->_allServerRecords;
}

- (CKRecordZoneID)clientZoneID
{
  return self->_clientZoneID;
}

- (CKRecordZoneID)clientZoneIDWithZoneWidePCS
{
  return self->_clientZoneIDWithZoneWidePCS;
}

- (CKRecordZoneID)clientZoneIDSecure
{
  return self->_clientZoneIDSecure;
}

- (NSArray)allClientZoneIDs
{
  return self->_allClientZoneIDs;
}

- (CKRecordZoneID)serverZoneID
{
  return self->_serverZoneID;
}

- (CKRecordZoneID)serverZoneIDWithZoneWidePCS
{
  return self->_serverZoneIDWithZoneWidePCS;
}

- (CKRecordZoneID)serverZoneIDSecure
{
  return self->_serverZoneIDSecure;
}

- (NSArray)allServerZoneIDs
{
  return self->_allServerZoneIDs;
}

- (CKRecordZone)clientZone
{
  return self->_clientZone;
}

- (CKRecordZone)clientZoneWithZoneWidePCS
{
  return self->_clientZoneWithZoneWidePCS;
}

- (CKRecordZone)clientZoneSecure
{
  return self->_clientZoneSecure;
}

- (NSArray)allClientZones
{
  return self->_allClientZones;
}

- (NSDictionary)allClientZonesByID
{
  return self->_allClientZonesByID;
}

- (CKRecordZone)serverZone
{
  return self->_serverZone;
}

- (CKRecordZone)serverZoneWithZoneWidePCS
{
  return self->_serverZoneWithZoneWidePCS;
}

- (CKRecordZone)serverZoneSecure
{
  return self->_serverZoneSecure;
}

- (NSArray)allServerZones
{
  return self->_allServerZones;
}

- (CKRecordID)defaultZoneClientRecordID
{
  return self->_defaultZoneClientRecordID;
}

- (CKRecordID)defaultZoneClientRecordIDSecure
{
  return self->_defaultZoneClientRecordIDSecure;
}

- (NSArray)allDefaultZoneClientRecordIDs
{
  return self->_allDefaultZoneClientRecordIDs;
}

- (CKRecordID)defaultZoneServerRecordID
{
  return self->_defaultZoneServerRecordID;
}

- (CKRecordID)defaultZoneServerRecordIDSecure
{
  return self->_defaultZoneServerRecordIDSecure;
}

- (CKRecord)defaultZoneClientRecord
{
  return self->_defaultZoneClientRecord;
}

- (CKRecord)defaultZoneClientRecordSecure
{
  return self->_defaultZoneClientRecordSecure;
}

- (NSArray)allDefaultZoneClientRecords
{
  return self->_allDefaultZoneClientRecords;
}

- (NSDictionary)allDefaultZoneClientRecordsByID
{
  return self->_allDefaultZoneClientRecordsByID;
}

- (CKRecord)defaultZoneServerRecord
{
  return self->_defaultZoneServerRecord;
}

- (CKRecord)defaultZoneServerRecordSecure
{
  return self->_defaultZoneServerRecordSecure;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultZoneServerRecordSecure, 0);
  objc_storeStrong((id *)&self->_defaultZoneServerRecord, 0);
  objc_storeStrong((id *)&self->_allDefaultZoneClientRecordsByID, 0);
  objc_storeStrong((id *)&self->_allDefaultZoneClientRecords, 0);
  objc_storeStrong((id *)&self->_defaultZoneClientRecordSecure, 0);
  objc_storeStrong((id *)&self->_defaultZoneClientRecord, 0);
  objc_storeStrong((id *)&self->_defaultZoneServerRecordIDSecure, 0);
  objc_storeStrong((id *)&self->_defaultZoneServerRecordID, 0);
  objc_storeStrong((id *)&self->_allDefaultZoneClientRecordIDs, 0);
  objc_storeStrong((id *)&self->_defaultZoneClientRecordIDSecure, 0);
  objc_storeStrong((id *)&self->_defaultZoneClientRecordID, 0);
  objc_storeStrong((id *)&self->_allServerZones, 0);
  objc_storeStrong((id *)&self->_serverZoneSecure, 0);
  objc_storeStrong((id *)&self->_serverZoneWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_allClientZonesByID, 0);
  objc_storeStrong((id *)&self->_allClientZones, 0);
  objc_storeStrong((id *)&self->_clientZoneSecure, 0);
  objc_storeStrong((id *)&self->_clientZoneWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_allServerZoneIDs, 0);
  objc_storeStrong((id *)&self->_serverZoneIDSecure, 0);
  objc_storeStrong((id *)&self->_serverZoneIDWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_serverZoneID, 0);
  objc_storeStrong((id *)&self->_allClientZoneIDs, 0);
  objc_storeStrong((id *)&self->_clientZoneIDSecure, 0);
  objc_storeStrong((id *)&self->_clientZoneIDWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_clientZoneID, 0);
  objc_storeStrong((id *)&self->_allServerRecords, 0);
  objc_storeStrong((id *)&self->_serverRecordSecure, 0);
  objc_storeStrong((id *)&self->_serverRecordWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_serverRecord, 0);
  objc_storeStrong((id *)&self->_allClientRecordsByID, 0);
  objc_storeStrong((id *)&self->_allClientRecords, 0);
  objc_storeStrong((id *)&self->_clientRecordSecure, 0);
  objc_storeStrong((id *)&self->_clientRecordWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_clientRecord, 0);
  objc_storeStrong((id *)&self->_allServerRecordIDs, 0);
  objc_storeStrong((id *)&self->_serverRecordIDSecure, 0);
  objc_storeStrong((id *)&self->_serverRecordIDWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_serverRecordID, 0);
  objc_storeStrong((id *)&self->_allClientRecordIDs, 0);
  objc_storeStrong((id *)&self->_clientRecordIDSecure, 0);
  objc_storeStrong((id *)&self->_clientRecordIDWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_clientRecordID, 0);
  objc_storeStrong((id *)&self->_tckSecureDatabase, 0);
  objc_storeStrong((id *)&self->_tckDatabaseWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_tckDatabase, 0);
  objc_storeStrong((id *)&self->_ckSecureDatabase, 0);
  objc_storeStrong((id *)&self->_ckDatabaseWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_ckDatabase, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
