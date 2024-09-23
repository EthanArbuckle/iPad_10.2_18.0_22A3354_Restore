@implementation MPServerObjectDatabaseMediaKitImportRequest

- (MPServerObjectDatabaseMediaKitImportRequest)initWithPayload:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPServerObjectDatabaseMediaKitImportRequest;
  return (MPServerObjectDatabaseMediaKitImportRequest *)-[MPServerObjectDatabaseImportRequest _initWithPayload:](&v4, sel__initWithPayload_, a3);
}

- (id)performWithDatabaseOperations:(id)a3 augmentingPayload:(id *)a4
{
  id v6;
  MPMediaKitEntityTranslatorContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MPMediaKitEntityTranslatorContext *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  id v25;
  MPServerObjectDatabaseImportResult *v26;
  MPServerObjectDatabaseImportResult *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  uint64_t *v34;
  _QWORD v35[5];
  MPMediaKitEntityTranslatorContext *v36;
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MPMediaKitEntityTranslatorContext);
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPServerObjectDatabaseImportRequest userIdentity](self, "userIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "DSIDForUserIdentity:outError:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaKitEntityTranslatorContext setPersonID:](v7, "setPersonID:", v11);

  -[MPMediaKitEntityTranslatorContext personID](v7, "personID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (!v13)
    -[MPMediaKitEntityTranslatorContext setPersonID:](v7, "setPersonID:", *MEMORY[0x1E0DDBEC8]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__8917;
  v45 = __Block_byref_object_dispose__8918;
  v46 = 0;
  -[MPServerObjectDatabaseImportRequest payload](self, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __95__MPServerObjectDatabaseMediaKitImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke;
  v35[3] = &unk_1E3154870;
  v35[4] = self;
  v18 = v7;
  v36 = v18;
  v40 = &v41;
  v19 = v6;
  v37 = v19;
  v20 = v15;
  v38 = v20;
  v21 = v14;
  v39 = v21;
  _MPServerObjectDatabaseMetadataImportEnumerateObjects(v16, a4, CFSTR("type"), 0, 0, 0, 0, v35);

  v22 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_msgSend(v20, "count");
    v24 = v42[5];
    *(_DWORD *)buf = 67109378;
    v48 = v23;
    v49 = 2114;
    v50 = v24;
    _os_log_impl(&dword_193B9B000, v22, OS_LOG_TYPE_DEFAULT, "SOD performWithDatabaseOperations: importing [Media API payload] childRelationsCount=%d collectionVersionHash=%{public}@", buf, 0x12u);
  }

  v29 = v17;
  v30 = 3221225472;
  v31 = __95__MPServerObjectDatabaseMediaKitImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_161;
  v32 = &unk_1E3154898;
  v25 = v19;
  v33 = v25;
  v34 = &v41;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", &v29);
  v26 = [MPServerObjectDatabaseImportResult alloc];
  v27 = -[MPServerObjectDatabaseImportResult initWithAnnotatedPayload:playableAssetIdentifiers:error:](v26, "initWithAnnotatedPayload:playableAssetIdentifiers:error:", a4, v21, 0, v29, v30, v31, v32);

  _Block_object_dispose(&v41, 8);
  return v27;
}

- (int64_t)_sinfTypeFromPayload:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (_NSIsNSString() && (objc_msgSend(v3, "isEqualToString:", CFSTR("miniSinf")) & 1) != 0)
      v4 = 2;
    else
      v4 = 0;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)_sinfDataFromSinfType:(int64_t)a3 payload:(id)a4
{
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v14;
  id v15;
  uint8_t buf[4];
  NSObject *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabaseImportRequest.m"), 379, CFSTR("Cannot extract sinfData from invalid synfType"));

  }
  if (!-[NSObject count](v7, "count"))
  {
    v10 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_FAULT, "No valid sinfs in payload", buf, 2u);
    }
    v8 = 0;
    goto LABEL_20;
  }
  if (a3 == 2)
  {
    -[NSObject firstObject](v7, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject valueForKey:](v10, "valueForKey:", CFSTR("sinf2"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v11, 0);
    }
    else
    {
      v12 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects_Oversize");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v10;
        _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "Missing miniSinf from sinfDictionary=%{public}@", buf, 0xCu);
      }

      v8 = 0;
    }
    goto LABEL_19;
  }
  if (a3 == 1)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    v10 = v9;
    if (v8 && !v9)
      goto LABEL_20;
    v11 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects_Oversize");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v7;
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEFAULT, "Could not serialize sinfs from payload=%{public}@, error=%{public}@", buf, 0x16u);
    }
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  v8 = 0;
LABEL_21:

  return v8;
}

BOOL __95__MPServerObjectDatabaseMediaKitImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, _QWORD *a8)
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL8 v24;
  MPServerObjectDatabaseMediaAPIImportChildRelation *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _BYTE *v46;
  unint64_t v47;
  int v48;
  int v49;
  _BYTE *v50;
  int v51;
  void *v52;
  void *v53;
  _BOOL4 v55;
  int v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  _BYTE *v62;
  unint64_t v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  unint64_t v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  int v102;
  void *v103;
  void *v104;
  uint64_t v105;
  int v106;
  unint64_t v107;
  uint64_t *v108;
  unint64_t v109;
  uint64_t v110;
  unsigned int v111;
  unsigned int v112;
  unint64_t v113;
  unsigned int v114;
  unsigned __int8 *v115;
  unint64_t v116;
  int v117;
  unint64_t v118;
  int v119;
  unint64_t v120;
  unsigned int v121;
  unsigned int v122;
  unsigned int v123;
  unsigned int v124;
  uint64_t v125;
  const UInt8 *v126;
  ldiv_t v127;
  uint64_t v128;
  CFStringRef v129;
  char *v130;
  char *v131;
  uint64_t v132;
  unsigned __int8 *v133;
  unsigned int v134;
  char *v135;
  id v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  _BYTE *v140;
  unint64_t v141;
  char *v142;
  uint64_t v143;
  unsigned __int8 *v144;
  unsigned int v145;
  char *v146;
  uint64_t v147;
  char *v148;
  uint64_t quot;
  lldiv_t v150;
  uint64_t v151;
  const UInt8 *v152;
  char *v153;
  uint64_t v154;
  unsigned __int8 *v155;
  unsigned int v156;
  char *v157;
  char *v158;
  uint64_t v159;
  _BYTE *v160;
  unint64_t v161;
  char *v162;
  uint64_t v163;
  unsigned __int8 *v164;
  unsigned int v165;
  char *v166;
  __CFString *v167;
  void *v168;
  id v169;
  id v170;
  id v171;
  void *v173;
  void *v174;
  _BYTE *v175;
  _BYTE *v176;
  uint64_t v177;
  void *v178;
  id v179;
  id v180;
  void *v181;
  id v182;
  id v183;
  _QWORD v184[5];
  id v185;
  id v186;
  id v187;
  id v188;
  uint64_t *v189;
  _QWORD v190[4];
  id v191;
  id v192;
  uint64_t v193;
  id v194;
  uint64_t v195;
  uint64_t *v196;
  uint64_t v197;
  char v198;
  _BYTE buf[40];
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  _BYTE v211[72];
  _OWORD v212[4];
  uint64_t v213;
  _QWORD v214[3];
  _QWORD v215[3];

  v215[0] = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v16 = a3;
  v182 = a4;
  v183 = a5;
  v17 = a6;
  +[MPMediaKitEntityTranslator translatorForType:](MPMediaKitEntityTranslator, "translatorForType:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "identifiersForPayload:context:", v16, *(_QWORD *)(a1 + 40));
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a8 = v20;
    if (v20)
    {
      if (v17)
      {
        objc_msgSend((id)objc_opt_class(), "_childKeyForParentType:type:", v183, v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21 && objc_msgSend(v182, "containsObject:", CFSTR("relationships")))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          if (v22)
          {
            if (!a7)
            {
              objc_msgSend(*(id *)(a1 + 48), "removeRelationshipsForParentIdentifiers:childKey:", v17, v21);
              v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
            }
            objc_msgSend(*(id *)(a1 + 48), "relateIdentifiers:toParentIdentifiers:parentVersionHash:childKey:order:", v20, v17, v22, v21, a7);
          }
          else
          {
            v25 = -[MPServerObjectDatabaseMediaAPIImportChildRelation initWithItemIdentifiers:parentIdentifiers:childKey:relativeOrder:]([MPServerObjectDatabaseMediaAPIImportChildRelation alloc], "initWithItemIdentifiers:parentIdentifiers:childKey:relativeOrder:", v20, v17, v21, a7);
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v25);

          }
        }

      }
      v195 = 0;
      v196 = &v195;
      v197 = 0x2020000000;
      v198 = 0;
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("attributes"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26 == 0;

      if (v27)
        goto LABEL_176;
      v28 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "expirationDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "importObject:type:identifiers:source:expiration:", v16, v15, v20, 1, v29);
      *((_BYTE *)v196 + 24) = v30;

      objc_msgSend(v16, "valueForKeyPath:", CFSTR("attributes.playParams"));
      v181 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("playlists")) & 1) != 0
        || objc_msgSend(v15, "isEqualToString:", CFSTR("albums")))
      {
        objc_msgSend(v16, "valueForKeyPath:", CFSTR("attributes.versionHash"));
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v33 = *(void **)(v32 + 40);
        *(_QWORD *)(v32 + 40) = v31;

        if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "length"))
        {
          v34 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v35;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v15;
            _os_log_impl(&dword_193B9B000, v34, OS_LOG_TYPE_DEFAULT, "SOD performWithDatabaseOperations: Media API payload contains collectionPlaylistVersionHash=%{public}@ for type=%{public}@", buf, 0x16u);
          }

        }
      }
      objc_msgSend(v16, "valueForKeyPath:", CFSTR("attributes.extendedAssetUrls"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v36)
      {
        v179 = v36;
      }
      else
      {
        objc_msgSend(v16, "valueForKeyPath:", CFSTR("attributes.assetUrls"));
        v179 = (id)objc_claimAutoreleasedReturnValue();
      }

      v190[0] = MEMORY[0x1E0C809B0];
      v190[1] = 3221225472;
      v190[2] = __95__MPServerObjectDatabaseMediaKitImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_139;
      v190[3] = &unk_1E3154820;
      v191 = *(id *)(a1 + 48);
      v38 = v20;
      v39 = *(_QWORD *)(a1 + 32);
      v180 = v38;
      v192 = v38;
      v193 = v39;
      v40 = v16;
      v194 = v40;
      objc_msgSend(v179, "enumerateKeysAndObjectsUsingBlock:", v190);
      objc_msgSend(v40, "valueForKeyPath:", CFSTR("attributes.assets"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v177 = objc_msgSend(v41, "count");
      v178 = v41;
      objc_msgSend(v180, "personalizedStore");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "personID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = v43;
      v210 = 0u;
      v209 = 0u;
      v208 = 0u;
      v207 = 0u;
      v206 = 0u;
      v205 = 0u;
      v204 = 0u;
      v203 = 0u;
      v202 = 0u;
      v201 = 0u;
      v200 = 0u;
      memset(&buf[8], 0, 32);
      *(_QWORD *)buf = 4001;
      CC_SHA1_Init((CC_SHA1_CTX *)&buf[8]);
      v45 = objc_retainAutorelease(v44);
      v46 = (_BYTE *)objc_msgSend(v45, "UTF8String");
      v47 = objc_msgSend(v45, "length");
      v48 = v47;
      if (*(uint64_t *)buf > 3999)
      {
        if (*(uint64_t *)buf > 4255)
        {
          if (*(_QWORD *)buf == 4256)
          {
            CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v46, v47);
          }
          else if (*(_QWORD *)buf == 4512)
          {
            CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v46, v47);
          }
        }
        else if (*(_QWORD *)buf == 4000)
        {
          CC_MD5_Update((CC_MD5_CTX *)&buf[8], v46, v47);
        }
        else if (*(_QWORD *)buf == 4001)
        {
          CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v46, v47);
        }
      }
      else
      {
        if (*(uint64_t *)buf <= 2999)
        {
          if (*(_QWORD *)buf)
          {
            if (*(_QWORD *)buf == 2000)
            {
              v49 = (((v47 + buf[19]) & 3) - buf[19]);
              v50 = &buf[buf[19] + 16];
              switch(v49)
              {
                case 0:
                  break;
                case 1:
                  *v50 = *v46;
                  break;
                case 2:
                  v70 = *(_WORD *)v46;
                  goto LABEL_78;
                case 3:
                  v70 = *(_WORD *)v46;
                  buf[buf[19] + 18] = v46[2];
LABEL_78:
                  *(_WORD *)v50 = v70;
                  break;
                default:
                  memcpy(v50, v46, (((v48 + buf[19]) & 3) - buf[19]));
                  break;
              }
              *(_DWORD *)&buf[12] += v48;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("MSVHasher+Algorithms.h"), 262, CFSTR("Cannot append to unknown hasher algorithm"));

          }
          goto LABEL_80;
        }
        if (*(_QWORD *)buf == 3000)
        {
          if (!v46)
            goto LABEL_80;
          v55 = v47 > 0xF || (*(_DWORD *)&buf[8] + v47) > 0xF;
          *(_DWORD *)&buf[8] += v47;
          *(_DWORD *)&buf[12] |= v55;
          if (v47 + DWORD2(v200) > 0xF)
          {
            v62 = &v46[v47];
            if (DWORD2(v200))
            {
              v176 = &v46[v47];
              memcpy(&buf[DWORD2(v200) + 32], v46, (16 - DWORD2(v200)));
              v62 = v176;
              HIDWORD(v63) = *(_DWORD *)&buf[16] - 2048144777 * *(_DWORD *)&buf[32];
              LODWORD(v63) = HIDWORD(v63);
              v64 = -1640531535 * (v63 >> 19);
              HIDWORD(v63) = *(_DWORD *)&buf[20] - 2048144777 * *(_DWORD *)&buf[36];
              LODWORD(v63) = HIDWORD(v63);
              *(_DWORD *)&buf[16] = v64;
              *(_DWORD *)&buf[20] = -1640531535 * (v63 >> 19);
              HIDWORD(v63) = *(_DWORD *)&buf[24] - 2048144777 * v200;
              LODWORD(v63) = HIDWORD(v63);
              *(_DWORD *)&buf[24] = -1640531535 * (v63 >> 19);
              HIDWORD(v63) = *(_DWORD *)&buf[28] - 2048144777 * DWORD1(v200);
              LODWORD(v63) = HIDWORD(v63);
              v46 += (16 - DWORD2(v200));
              *(_DWORD *)&buf[28] = -1640531535 * (v63 >> 19);
              DWORD2(v200) = 0;
            }
            if (v46 <= v62 - 16)
            {
              v65 = *(_DWORD *)&buf[16];
              v66 = *(_DWORD *)&buf[20];
              v67 = *(_DWORD *)&buf[24];
              v68 = *(_DWORD *)&buf[28];
              do
              {
                HIDWORD(v69) = v65 - 2048144777 * *(_DWORD *)v46;
                LODWORD(v69) = HIDWORD(v69);
                v65 = -1640531535 * (v69 >> 19);
                HIDWORD(v69) = v66 - 2048144777 * *((_DWORD *)v46 + 1);
                LODWORD(v69) = HIDWORD(v69);
                v66 = -1640531535 * (v69 >> 19);
                HIDWORD(v69) = v67 - 2048144777 * *((_DWORD *)v46 + 2);
                LODWORD(v69) = HIDWORD(v69);
                v67 = -1640531535 * (v69 >> 19);
                HIDWORD(v69) = v68 - 2048144777 * *((_DWORD *)v46 + 3);
                LODWORD(v69) = HIDWORD(v69);
                v68 = -1640531535 * (v69 >> 19);
                v46 += 16;
              }
              while (v46 <= v62 - 16);
              *(_DWORD *)&buf[16] = v65;
              *(_DWORD *)&buf[20] = v66;
              *(_DWORD *)&buf[24] = v67;
              *(_DWORD *)&buf[28] = v68;
            }
            if (v46 >= v62)
              goto LABEL_80;
            v56 = (_DWORD)v62 - (_DWORD)v46;
            __memcpy_chk();
          }
          else
          {
            memcpy(&buf[DWORD2(v200) + 32], v46, v47);
            v56 = DWORD2(v200) + v48;
          }
          DWORD2(v200) = v56;
          goto LABEL_80;
        }
        if (*(_QWORD *)buf != 3001 || !v46)
          goto LABEL_80;
        *(_QWORD *)&buf[8] += v47;
        if (v47 + DWORD2(v202) <= 0x1F)
        {
          memcpy((char *)&v200 + DWORD2(v202) + 8, v46, v47);
          v51 = DWORD2(v202) + v48;
LABEL_65:
          DWORD2(v202) = v51;
          goto LABEL_80;
        }
        v57 = (unint64_t)&v46[v47];
        if (DWORD2(v202))
        {
          v175 = &v46[v47];
          memcpy((char *)&v200 + DWORD2(v202) + 8, v46, (32 - DWORD2(v202)));
          v57 = (unint64_t)v175;
          *(_QWORD *)&buf[16] = 0x9E3779B185EBCA87
                              * __ROR8__(*(_QWORD *)&buf[16] - 0x3D4D51C2D82B14B1 * *((_QWORD *)&v200 + 1), 33);
          *(_QWORD *)&buf[24] = 0x9E3779B185EBCA87 * __ROR8__(*(_QWORD *)&buf[24] - 0x3D4D51C2D82B14B1 * v201, 33);
          *(_QWORD *)&buf[32] = 0x9E3779B185EBCA87
                              * __ROR8__(*(_QWORD *)&buf[32] - 0x3D4D51C2D82B14B1 * *((_QWORD *)&v201 + 1), 33);
          *(_QWORD *)&v200 = 0x9E3779B185EBCA87 * __ROR8__(v200 - 0x3D4D51C2D82B14B1 * v202, 33);
          v46 += (32 - DWORD2(v202));
          DWORD2(v202) = 0;
        }
        if ((unint64_t)(v46 + 32) <= v57)
        {
          v59 = *(_QWORD *)&buf[24];
          v58 = *(_QWORD *)&buf[16];
          v61 = *(_QWORD *)&buf[32];
          v60 = v200;
          do
          {
            v58 = 0x9E3779B185EBCA87 * __ROR8__(v58 - 0x3D4D51C2D82B14B1 * *(_QWORD *)v46, 33);
            v59 = 0x9E3779B185EBCA87 * __ROR8__(v59 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v46 + 1), 33);
            v61 = 0x9E3779B185EBCA87 * __ROR8__(v61 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v46 + 2), 33);
            v60 = 0x9E3779B185EBCA87 * __ROR8__(v60 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v46 + 3), 33);
            v46 += 32;
          }
          while ((unint64_t)v46 <= v57 - 32);
          *(_QWORD *)&buf[16] = v58;
          *(_QWORD *)&buf[24] = v59;
          *(_QWORD *)&buf[32] = v61;
          *(_QWORD *)&v200 = v60;
        }
        if ((unint64_t)v46 < v57)
        {
          v51 = v57 - (_DWORD)v46;
          __memcpy_chk();
          goto LABEL_65;
        }
      }
LABEL_80:

      memset(&v211[8], 0, 64);
      *(_QWORD *)v211 = *(_QWORD *)buf;
      if (*(uint64_t *)buf > 3000)
      {
        if (*(uint64_t *)buf > 4000)
        {
          switch(*(_QWORD *)buf)
          {
            case 0xFA1:
              CC_SHA1_Final(&v211[8], (CC_SHA1_CTX *)&buf[8]);
              break;
            case 0x10A0:
              CC_SHA256_Final(&v211[8], (CC_SHA256_CTX *)&buf[8]);
              break;
            case 0x11A0:
              CC_SHA512_Final(&v211[8], (CC_SHA512_CTX *)&buf[8]);
              break;
          }
          goto LABEL_127;
        }
        if (*(_QWORD *)buf != 3001)
        {
          if (*(_QWORD *)buf == 4000)
            CC_MD5_Final(&v211[8], (CC_MD5_CTX *)&buf[8]);
LABEL_127:
          v212[0] = *(_OWORD *)v211;
          v212[1] = *(_OWORD *)&v211[16];
          v212[2] = *(_OWORD *)&v211[32];
          v212[3] = *(_OWORD *)&v211[48];
          v213 = *(_QWORD *)&v211[64];
          if (*(uint64_t *)v211 > 3999)
          {
            if (*(uint64_t *)v211 > 4255)
            {
              if (*(_QWORD *)v211 == 4256)
              {
                v162 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
                v131 = v162;
                v163 = 0;
                v164 = (unsigned __int8 *)v212 + 8;
                do
                {
                  v165 = *v164++;
                  v166 = &v162[v163];
                  *v166 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v165 >> 4];
                  v166[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v165 & 0xF];
                  v163 += 2;
                }
                while (v163 != 64);
                v136 = objc_alloc(MEMORY[0x1E0CB3940]);
                v137 = 64;
              }
              else
              {
                if (*(_QWORD *)v211 != 4512)
                  goto LABEL_178;
                v142 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
                v131 = v142;
                v143 = 0;
                v144 = (unsigned __int8 *)v212 + 8;
                do
                {
                  v145 = *v144++;
                  v146 = &v142[v143];
                  *v146 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v145 >> 4];
                  v146[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v145 & 0xF];
                  v143 += 2;
                }
                while (v143 != 128);
                v136 = objc_alloc(MEMORY[0x1E0CB3940]);
                v137 = 128;
              }
            }
            else if (*(_QWORD *)v211 == 4000)
            {
              v153 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
              v131 = v153;
              v154 = 0;
              v155 = (unsigned __int8 *)v212 + 8;
              do
              {
                v156 = *v155++;
                v157 = &v153[v154];
                *v157 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v156 >> 4];
                v157[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v156 & 0xF];
                v154 += 2;
              }
              while (v154 != 32);
              v136 = objc_alloc(MEMORY[0x1E0CB3940]);
              v137 = 32;
            }
            else
            {
              if (*(_QWORD *)v211 != 4001)
                goto LABEL_178;
              v130 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
              v131 = v130;
              v132 = 0;
              v133 = (unsigned __int8 *)v212 + 8;
              do
              {
                v134 = *v133++;
                v135 = &v130[v132];
                *v135 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v134 >> 4];
                v135[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v134 & 0xF];
                v132 += 2;
              }
              while (v132 != 40);
              v136 = objc_alloc(MEMORY[0x1E0CB3940]);
              v137 = 40;
            }
            v129 = (CFStringRef)objc_msgSend(v136, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v131, v137, 4, 1);
          }
          else
          {
            if (*(uint64_t *)v211 <= 2999)
            {
              if (*(_QWORD *)v211 == 1000)
              {
                v147 = *((_QWORD *)&v212[0] + 1);
                v148 = (char *)v215 + 1;
                quot = *((_QWORD *)&v212[0] + 1);
                do
                {
                  v150 = lldiv(quot, 10);
                  quot = v150.quot;
                  if (v150.rem >= 0)
                    LOBYTE(v151) = v150.rem;
                  else
                    v151 = -v150.rem;
                  *(v148 - 2) = v151 + 48;
                  v152 = (const UInt8 *)(v148 - 2);
                  --v148;
                }
                while (v150.quot);
                if (v147 < 0)
                {
                  *(v148 - 2) = 45;
                  v152 = (const UInt8 *)(v148 - 2);
                }
                v129 = CFStringCreateWithBytes(0, v152, (char *)v215 - (char *)v152, 0x8000100u, 0);
                goto LABEL_171;
              }
              if (*(_QWORD *)v211 == 2000)
              {
                v125 = DWORD2(v212[0]);
                v126 = (const UInt8 *)v215;
                do
                {
                  v127 = ldiv(v125, 10);
                  v125 = v127.quot;
                  if (v127.rem >= 0)
                    LOBYTE(v128) = v127.rem;
                  else
                    v128 = -v127.rem;
                  *--v126 = v128 + 48;
                }
                while (v127.quot);
                v129 = CFStringCreateWithBytes(0, v126, (char *)v215 - (char *)v126, 0x8000100u, 0);
                goto LABEL_171;
              }
LABEL_178:
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v173 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v173, "handleFailureInFunction:file:lineNumber:description:", v174, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

              v167 = &stru_1E3163D10;
LABEL_172:

              -[__CFString substringToIndex:](v167, "substringToIndex:", 7);
              v168 = (void *)objc_claimAutoreleasedReturnValue();

              v184[0] = MEMORY[0x1E0C809B0];
              v184[1] = 3221225472;
              v184[2] = __95__MPServerObjectDatabaseMediaKitImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_150;
              v184[3] = &unk_1E3154848;
              v184[4] = *(_QWORD *)(a1 + 32);
              v189 = &v195;
              v185 = *(id *)(a1 + 48);
              v169 = v180;
              v186 = v169;
              v170 = v45;
              v187 = v170;
              v171 = v168;
              v188 = v171;
              objc_msgSend(v178, "enumerateObjectsUsingBlock:", v184);
              if (v181 && v177)
                objc_msgSend(*(id *)(a1 + 64), "addObject:", v169);

LABEL_176:
              v24 = *((_BYTE *)v196 + 24) != 0;
              _Block_object_dispose(&v195, 8);
              goto LABEL_177;
            }
            if (*(_QWORD *)v211 == 3000)
            {
              LODWORD(v214[0]) = bswap32(DWORD2(v212[0]));
              v158 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
              v159 = 0;
              v160 = v158 + 1;
              do
              {
                v161 = *((unsigned __int8 *)v214 + v159);
                *(v160 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v161 >> 4];
                *v160 = MSVFastHexStringFromBytes_hexCharacters_47995[v161 & 0xF];
                v160 += 2;
                ++v159;
              }
              while (v159 != 4);
              v129 = (CFStringRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v158, 8, 4, 1);
            }
            else
            {
              if (*(_QWORD *)v211 != 3001)
                goto LABEL_178;
              v214[0] = bswap64(*((unint64_t *)&v212[0] + 1));
              v138 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
              v139 = 0;
              v140 = v138 + 1;
              do
              {
                v141 = *((unsigned __int8 *)v214 + v139);
                *(v140 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v141 >> 4];
                *v140 = MSVFastHexStringFromBytes_hexCharacters_47995[v141 & 0xF];
                v140 += 2;
                ++v139;
              }
              while (v139 != 8);
              v129 = (CFStringRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v138, 16, 4, 1);
            }
          }
LABEL_171:
          v167 = (__CFString *)v129;
          goto LABEL_172;
        }
        if (*(_QWORD *)&buf[8] < 0x20uLL)
          v105 = *(_QWORD *)&buf[32] + 0x27D4EB2F165667C5;
        else
          v105 = 0x9E3779B185EBCA87
               * ((0x9E3779B185EBCA87
                 * ((0x9E3779B185EBCA87
                   * ((0x9E3779B185EBCA87
                     * ((__ROR8__(*(_QWORD *)&buf[24], 57)
                       + __ROR8__(*(_QWORD *)&buf[16], 63)
                       + __ROR8__(*(_QWORD *)&buf[32], 52)
                       + __ROR8__(v200, 46)) ^ (0x9E3779B185EBCA87
                                              * __ROR8__(0xC2B2AE3D27D4EB4FLL * *(_QWORD *)&buf[16], 33)))
                     - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                              * __ROR8__(0xC2B2AE3D27D4EB4FLL * *(_QWORD *)&buf[24], 33)))
                   - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                            * __ROR8__(0xC2B2AE3D27D4EB4FLL * *(_QWORD *)&buf[32], 33)))
                 - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v200, 33)))
               - 0x7A1435883D4D519DLL;
        v107 = v105 + *(_QWORD *)&buf[8];
        v108 = (uint64_t *)&v200 + 1;
        v109 = buf[8] & 0x1F;
        if (v109 >= 8)
        {
          do
          {
            v110 = *v108++;
            v107 = 0x85EBCA77C2B2AE63
                 - 0x61C8864E7A143579
                 * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v110, 33)) ^ v107, 37);
            v109 -= 8;
          }
          while (v109 > 7);
        }
        if (v109 >= 4)
        {
          v111 = *(_DWORD *)v108;
          v108 = (uint64_t *)((char *)v108 + 4);
          v107 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v111) ^ v107, 41);
          v109 -= 4;
        }
        for (; v109; --v109)
        {
          v112 = *(unsigned __int8 *)v108;
          v108 = (uint64_t *)((char *)v108 + 1);
          v107 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v112) ^ v107, 53);
        }
        v113 = 0x165667B19E3779F9
             * ((0xC2B2AE3D27D4EB4FLL * (v107 ^ (v107 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v107 ^ (v107 >> 33))) >> 29));
        v101 = v113 ^ HIDWORD(v113);
LABEL_114:
        *(_QWORD *)&v211[8] = v101;
        goto LABEL_127;
      }
      if (*(uint64_t *)buf <= 1999)
      {
        if (!*(_QWORD *)buf)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "handleFailureInFunction:file:lineNumber:description:", v104, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

          goto LABEL_127;
        }
        if (*(_QWORD *)buf != 1000)
          goto LABEL_127;
        v71 = (*(_QWORD *)&buf[8] + *(_QWORD *)&buf[16]) ^ __ROR8__(*(_QWORD *)&buf[16], 51);
        v72 = *(_QWORD *)&buf[24] + (*(_QWORD *)&buf[32] ^ v200);
        v73 = __ROR8__(*(_QWORD *)&buf[32] ^ v200, 48);
        v74 = (v72 ^ v73) + __ROR8__(*(_QWORD *)&buf[8] + *(_QWORD *)&buf[16], 32);
        v75 = v74 ^ __ROR8__(v72 ^ v73, 43);
        v76 = v72 + v71;
        v77 = v76 ^ __ROR8__(v71, 47);
        v78 = (v74 ^ v200) + v77;
        v79 = v78 ^ __ROR8__(v77, 51);
        v80 = (__ROR8__(v76, 32) ^ 0xFFLL) + v75;
        v81 = __ROR8__(v75, 48);
        v82 = __ROR8__(v78, 32) + (v80 ^ v81);
        v83 = v82 ^ __ROR8__(v80 ^ v81, 43);
        v84 = v79 + v80;
        v85 = v84 ^ __ROR8__(v79, 47);
        v86 = v85 + v82;
        v87 = v86 ^ __ROR8__(v85, 51);
        v88 = __ROR8__(v84, 32) + v83;
        v89 = __ROR8__(v83, 48);
        v90 = __ROR8__(v86, 32) + (v88 ^ v89);
        v91 = v90 ^ __ROR8__(v88 ^ v89, 43);
        v92 = v87 + v88;
        v93 = v92 ^ __ROR8__(v87, 47);
        v94 = v93 + v90;
        v95 = v94 ^ __ROR8__(v93, 51);
        v96 = __ROR8__(v92, 32) + v91;
        v97 = __ROR8__(v91, 48);
        v98 = __ROR8__(v94, 32) + (v96 ^ v97);
        v99 = v98 ^ __ROR8__(v96 ^ v97, 43);
        v100 = v95 + v96;
        *(_QWORD *)&buf[8] = v98;
        *(_QWORD *)&buf[16] = v100 ^ __ROR8__(v95, 47);
        *(_QWORD *)&buf[24] = __ROR8__(v100, 32);
        *(_QWORD *)&buf[32] = v99;
        v101 = *(_QWORD *)&buf[16] ^ v98 ^ *(_QWORD *)&buf[24] ^ v99;
        goto LABEL_114;
      }
      if (*(_QWORD *)buf != 2000)
      {
        if (*(_QWORD *)buf != 3000)
          goto LABEL_127;
        if (*(_DWORD *)&buf[12])
          v102 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_193F0CA90), (int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_193F0CA80)));
        else
          v102 = *(_DWORD *)&buf[24] + 374761393;
        v114 = *(_DWORD *)&buf[8] + v102;
        v115 = &buf[32];
        v116 = BYTE8(v200) & 0xF;
        if (v116 >= 4)
        {
          do
          {
            v117 = *(_DWORD *)v115;
            v115 += 4;
            HIDWORD(v118) = v114 - 1028477379 * v117;
            LODWORD(v118) = HIDWORD(v118);
            v114 = 668265263 * (v118 >> 15);
            v116 -= 4;
          }
          while (v116 > 3);
        }
        for (; v116; --v116)
        {
          v119 = *v115++;
          HIDWORD(v120) = v114 + 374761393 * v119;
          LODWORD(v120) = HIDWORD(v120);
          v114 = -1640531535 * (v120 >> 21);
        }
        v121 = (-2048144777 * (v114 ^ (v114 >> 15))) ^ ((-2048144777 * (v114 ^ (v114 >> 15))) >> 13);
        v122 = (-1028477379 * v121) ^ ((-1028477379 * v121) >> 16);
        goto LABEL_126;
      }
      switch(buf[19])
      {
        case 1:
          v106 = buf[16];
          break;
        case 2:
          v106 = *(unsigned __int16 *)&buf[16];
          break;
        case 3:
          v106 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
          break;
        default:
          v123 = *(_DWORD *)&buf[8];
          goto LABEL_125;
      }
      v123 = (461845907 * ((380141568 * v106) | ((-862048943 * v106) >> 17))) ^ *(_DWORD *)&buf[8];
LABEL_125:
      v124 = -2048144789 * (v123 ^ *(_DWORD *)&buf[12] ^ ((v123 ^ *(_DWORD *)&buf[12]) >> 16));
      v122 = (-1028477387 * (v124 ^ (v124 >> 13))) ^ ((-1028477387 * (v124 ^ (v124 >> 13))) >> 16);
      *(_DWORD *)&buf[8] = v122;
LABEL_126:
      *(_DWORD *)&v211[8] = v122;
      goto LABEL_127;
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_unsupportedMediaKitTypes");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "containsObject:", v15) & 1) == 0)
    {
      objc_msgSend(v20, "addObject:", v15);
      v23 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v15;
        _os_log_impl(&dword_193B9B000, v23, OS_LOG_TYPE_FAULT, "Encountered unsupported MediaKit type: %@", buf, 0xCu);
      }

    }
  }
  v24 = 0;
LABEL_177:

  return v24;
}

void __95__MPServerObjectDatabaseMediaKitImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_161(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (!objc_msgSend(v11, "relativeOrder"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v11, "parentIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "childKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeRelationshipsForParentIdentifiers:childKey:", v4, v5);

  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v11, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "parentIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    v9 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  else
    v9 = &stru_1E3163D10;
  objc_msgSend(v11, "childKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relateIdentifiers:toParentIdentifiers:parentVersionHash:childKey:order:", v7, v8, v9, v10, objc_msgSend(v11, "relativeOrder"));

}

void __95__MPServerObjectDatabaseMediaKitImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_139(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (_NSIsNSString() && _NSIsNSString())
  {
    v7 = v5;
    if ((objc_msgSend(&unk_1E31E58D8, "containsObject:", v7) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(&unk_1E31E58F0, "containsObject:", v7) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(&unk_1E31E5908, "containsObject:", v7) & 1) != 0)
    {
      v8 = 3;
    }
    else if (objc_msgSend(&unk_1E31E5920, "containsObject:", v7))
    {
      v8 = 4;
    }
    else
    {
      v8 = 0;
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v8 && v13)
    {
      v15 = *(void **)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "assetURLExpirationDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "importAssetURL:forIdentifiers:flavor:expirationDate:", v14, v16, v8, v17);
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("enhancedHls")) || !v14)
        goto LABEL_29;
      objc_msgSend(*(id *)(a1 + 56), "valueForKeyPath:", CFSTR("meta.redeliveryId"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = objc_msgSend(v17, "longLongValue");
      else
        v18 = 0;
      v19 = *MEMORY[0x1E0DDBDD8];
      v20 = *(void **)(a1 + 32);
      v21 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "assetURLExpirationDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "importHLSAssetURL:keyCertificateURL:keyServerURL:redeliveryId:protocolType:isiTunesStoreStream:forIdentifiers:expirationDate:", v14, 0, 0, v18, v19, 1, v21, v22);

    }
LABEL_29:

    goto LABEL_30;
  }
  if (v5 || !_NSIsNSString())
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      *(_DWORD *)buf = 138544130;
      v24 = v10;
      v25 = 2114;
      v26 = (id)objc_opt_class();
      v27 = 2114;
      v28 = v5;
      v29 = 2114;
      v30 = v6;
      v12 = v26;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_FAULT, "Encountered unsupported data type in assetURLs [MediaKit]: flavorStringType=%{public}@ urlStringType=%{public}@ flavorString=%{public}@ urlString=%{public}@", buf, 0x2Au);

    }
  }
  else
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v6;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "May have found Stereo HLS in assets but ignored [MediaKit]: urlString=%{public}@", buf, 0xCu);
    }
  }

LABEL_30:
}

void __95__MPServerObjectDatabaseMediaKitImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_150(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  NSObject *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  NSObject *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "valueForKey:", CFSTR("flavor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("sinfs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("url"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString() && _NSIsNSString() && _NSIsNSArray())
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("kind"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v4;
    if ((objc_msgSend(&unk_1E31E58D8, "containsObject:", v8) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(&unk_1E31E58F0, "containsObject:", v8) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(&unk_1E31E5908, "containsObject:", v8) & 1) != 0)
    {
      v9 = 3;
    }
    else
    {
      v15 = objc_msgSend(&unk_1E31E5920, "containsObject:", v8);
      v9 = 4;
      if (!v15)
        v9 = 0;
    }
    v24 = v9;

    v16 = objc_msgSend(*(id *)(a1 + 32), "_sinfTypeFromPayload:", v7);
    if (v16)
    {
      v23 = v16;
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 40);
      v18 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "assetURLExpirationDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v19, "importAssetURL:forIdentifiers:flavor:expirationDate:", v17, v18, v24, v20);

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      {
        objc_msgSend(*(id *)(a1 + 32), "_sinfDataFromSinfType:payload:", v23, v5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "preferredStoreStringIdentifierForPersonID:", *(_QWORD *)(a1 + 56));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "importAssetSinf:type:forIdentifier:hashedPersonID:flavor:sinfPayload:", v21, v23, v22, *(_QWORD *)(a1 + 64), v24, v5);

      }
      goto LABEL_13;
    }
    v11 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v7;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_FAULT, "Encountered unsupported sinfKind in assets [MediaKit]: sinfKind=%{public}@", buf, 0xCu);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v4 || !_NSIsNSString())
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      goto LABEL_13;
    v10 = objc_opt_class();
    v11 = v10;
    v12 = (void *)objc_opt_class();
    v13 = v12;
    *(_DWORD *)buf = 138544386;
    v26 = v10;
    v27 = 2114;
    v28 = v12;
    v29 = 2114;
    v30 = (id)objc_opt_class();
    v31 = 2114;
    v32 = v4;
    v33 = 2114;
    v34 = v6;
    v14 = v30;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_FAULT, "Encountered unsupported data type in assets [MediaKit]: flavorStringType=%{public}@ urlStringType=%{public}@ sinfsType=%{public}@ flavorString=%{public}@ urlString=%{public}@", buf, 0x34u);

    goto LABEL_12;
  }
  v7 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v6;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "May have found Stereo HLS in assets but ignored [MediaKit]: urlString=%{public}@", buf, 0xCu);
  }
LABEL_13:

}

+ (id)_unsupportedMediaKitTypes
{
  if (_unsupportedMediaKitTypes_onceToken != -1)
    dispatch_once(&_unsupportedMediaKitTypes_onceToken, &__block_literal_global_9044);
  return (id)_unsupportedMediaKitTypes_unsupportedKinds;
}

+ (id)_unsupportedParentChildRelationships
{
  if (_unsupportedParentChildRelationships_onceToken != -1)
    dispatch_once(&_unsupportedParentChildRelationships_onceToken, &__block_literal_global_200);
  return (id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships;
}

+ (id)_childKeyForParentType:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("songs")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("music-videos")))
  {
    if (objc_msgSend(&unk_1E31E5800, "containsObject:", v7))
    {
      v8 = CFSTR("MPModelChildSongAlbum");
LABEL_28:
      v9 = v8;
      goto LABEL_29;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("artists")))
    {
      v8 = CFSTR("MPModelChildSongArtists");
      goto LABEL_28;
    }
  }
  if (objc_msgSend(&unk_1E31E5818, "containsObject:", v6))
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("songs")) & 1) != 0
      || objc_msgSend(v7, "isEqualToString:", CFSTR("music-videos")))
    {
      v8 = CFSTR("MPModelChildAlbumSongs");
      goto LABEL_28;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("artists")))
    {
      v8 = CFSTR("MPModelChildAlbumArtists");
      goto LABEL_28;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("record-labels")))
    {
      v8 = CFSTR("MPModelChildAlbumRecordLabels");
      goto LABEL_28;
    }
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("credit-artists"))
    && objc_msgSend(v7, "isEqualToString:", CFSTR("artists")))
  {
    v8 = CFSTR("MPModelChildCreditsArtistRelatedArtist");
    goto LABEL_28;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("artists"))
    && objc_msgSend(&unk_1E31E5830, "containsObject:", v7))
  {
    v8 = CFSTR("MPModelChildArtistAlbums");
    goto LABEL_28;
  }
  if (objc_msgSend(&unk_1E31E5848, "containsObject:", v6)
    && ((objc_msgSend(v7, "isEqualToString:", CFSTR("songs")) & 1) != 0
     || objc_msgSend(v7, "isEqualToString:", CFSTR("music-videos"))))
  {
    v8 = CFSTR("MPModelChildPlaylistEntries");
    goto LABEL_28;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("stations"))
    && objc_msgSend(v7, "isEqualToString:", CFSTR("station-events")))
  {
    v8 = CFSTR("MPModelChildRadioStationEvents");
    goto LABEL_28;
  }
  objc_msgSend(a1, "_unsupportedParentChildRelationships");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  v19[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR("|"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "containsObject:", v13) & 1) == 0)
  {
    objc_msgSend(v11, "addObject:", v13);
    v14 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_ERROR, "Encountered unexpected media kit relationship parent=%@ type=%@", (uint8_t *)&v15, 0x16u);
    }

  }
  v8 = 0;
LABEL_29:

  return v8;
}

+ (id)_entityTypeForObject:(id)a3
{
  void *v3;
  void *v4;
  __CFString **v5;
  __CFString *v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v7 = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("songs")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("music-videos")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("uploaded-audios")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("uploaded-videos")) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericSong;
  }
  else if ((objc_msgSend(&unk_1E31E5860, "containsObject:", v4) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericPlaylist;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("artists")) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericArtist;
  }
  else if ((objc_msgSend(&unk_1E31E5878, "containsObject:", v4) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericAlbum;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("stations")) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericRadioStation;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("station-events")) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericRadioStationEvent;
  }
  else if ((objc_msgSend(&unk_1E31E5890, "containsObject:", v4) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericCurator;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("tv-episodes")) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericTVEpisode;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("tv-shows")) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericTVShow;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("music-movies")) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericMovie;
  }
  else if ((objc_msgSend(&unk_1E31E58A8, "containsObject:", v4) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericSocialPerson;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("record-labels")) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericRecordLabel;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("credit-artists")))
    {
      v6 = 0;
      goto LABEL_8;
    }
    v5 = MPModelRelationshipGenericCreditsArtist;
  }
  v6 = *v5;
LABEL_8:
  +[MPServerObjectDatabaseEntityType entityTypeWithServerEntityType:genericObjectRelationshipKey:](MPServerObjectDatabaseEntityType, "entityTypeWithServerEntityType:genericObjectRelationshipKey:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v7;
}

uint64_t __83__MPServerObjectDatabaseMediaKitImportRequest__unsupportedParentChildRelationships__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)_unsupportedParentChildRelationships_unsupportedParentChildRelationships;
  _unsupportedParentChildRelationships_unsupportedParentChildRelationships = (uint64_t)v0;

  objc_msgSend((id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships, "addObject:", CFSTR("playlists|apple-curators"));
  objc_msgSend((id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships, "addObject:", CFSTR("apple-curators|playlists"));
  objc_msgSend((id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships, "addObject:", CFSTR("artists|stations"));
  objc_msgSend((id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships, "addObject:", CFSTR("artists|songs"));
  objc_msgSend((id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships, "addObject:", CFSTR("artists|playlists"));
  objc_msgSend((id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships, "addObject:", CFSTR("station-events|apple-curators"));
  objc_msgSend((id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships, "addObject:", CFSTR("albums|albums"));
  return objc_msgSend((id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships, "addObject:", CFSTR("albums|playlists"));
}

uint64_t __72__MPServerObjectDatabaseMediaKitImportRequest__unsupportedMediaKitTypes__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)_unsupportedMediaKitTypes_unsupportedKinds;
  _unsupportedMediaKitTypes_unsupportedKinds = (uint64_t)v0;

  objc_msgSend((id)_unsupportedMediaKitTypes_unsupportedKinds, "addObject:", CFSTR("personal-recommendation"));
  objc_msgSend((id)_unsupportedMediaKitTypes_unsupportedKinds, "addObject:", CFSTR("marketing-items"));
  objc_msgSend((id)_unsupportedMediaKitTypes_unsupportedKinds, "addObject:", CFSTR("buy"));
  objc_msgSend((id)_unsupportedMediaKitTypes_unsupportedKinds, "addObject:", CFSTR("subscription"));
  objc_msgSend((id)_unsupportedMediaKitTypes_unsupportedKinds, "addObject:", CFSTR("preorder"));
  objc_msgSend((id)_unsupportedMediaKitTypes_unsupportedKinds, "addObject:", CFSTR("groupings"));
  objc_msgSend((id)_unsupportedMediaKitTypes_unsupportedKinds, "addObject:", CFSTR("editorial-elements"));
  objc_msgSend((id)_unsupportedMediaKitTypes_unsupportedKinds, "addObject:", CFSTR("rooms"));
  objc_msgSend((id)_unsupportedMediaKitTypes_unsupportedKinds, "addObject:", CFSTR("targetedRadio"));
  objc_msgSend((id)_unsupportedMediaKitTypes_unsupportedKinds, "addObject:", CFSTR("multirooms"));
  objc_msgSend((id)_unsupportedMediaKitTypes_unsupportedKinds, "addObject:", CFSTR("normal"));
  return objc_msgSend((id)_unsupportedMediaKitTypes_unsupportedKinds, "addObject:", CFSTR("social-upsells"));
}

@end
