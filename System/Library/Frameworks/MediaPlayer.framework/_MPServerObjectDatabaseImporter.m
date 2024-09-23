@implementation _MPServerObjectDatabaseImporter

- (_QWORD)initWithDatabase:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  NSObject *v45;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  objc_super v56;
  uint8_t buf[4];
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v56.receiver = a1;
    v56.super_class = (Class)_MPServerObjectDatabaseImporter;
    a1 = objc_msgSendSuper2(&v56, sel_init);
    if (a1)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUIDString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("MPServerObjectDatabaseImport-"), "stringByAppendingString:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "transactionWithName:error:", v6, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)a1[1];
      a1[1] = v7;

      v9 = (void *)a1[1];
      v55 = 0;
      objc_msgSend(v9, "statementWithString:error:", CFSTR("SELECT payload FROM objects WHERE source = @source AND identifier = @identifier AND person_id = @personID LIMIT 1"), &v55);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v55;
      v12 = (void *)a1[2];
      a1[2] = v10;

      v13 = (void *)a1[1];
      v54 = v11;
      objc_msgSend(v13, "statementWithString:error:", CFSTR("INSERT OR REPLACE INTO objects (identifier, person_id, source, expiration_date, type, payload) VALUES (@identifier, @personID, @source, @expirationDate, @type, @payload)"), &v54);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v54;

      v16 = (void *)a1[3];
      a1[3] = v14;

      v17 = (void *)a1[1];
      v53 = v15;
      objc_msgSend(v17, "statementWithString:error:", CFSTR("INSERT OR REPLACE INTO assets (identifier, hashed_person_id, flavor, url, url_expiration_date) VALUES (@identifier, @hashedPersonID, @flavor, @url, @urlExpirationDate)"), &v53);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v53;

      v20 = (void *)a1[5];
      a1[5] = v18;

      v21 = (void *)a1[1];
      v52 = v19;
      objc_msgSend(v21, "statementWithString:error:", CFSTR("INSERT OR REPLACE INTO hls_assets (identifier, hashed_person_id, url_expiration_date, playlist_url, key_certificate_url, key_server_url, key_server_adam_id, key_server_protocol_type, is_itunes_store_stream) VALUES (@identifier, @hashedPersonID, @urlExpirationDate, @playlistURL, @keyCertificateURL, @keyServerURL, @keyServerAdamID, @keyServerProtocolType, @isiTunesStoreStream)"), &v52);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v52;

      v24 = (void *)a1[6];
      a1[6] = v22;

      v25 = (void *)a1[1];
      v51 = v23;
      objc_msgSend(v25, "statementWithString:error:", CFSTR("INSERT OR REPLACE INTO object_relationships (parent_identifier, child_identifier, person_id, child_key, suborder, parent_version_hash) VALUES (@parentIdentifier, @childIdentifier, @personID, @childKey, @suborder, @parentVersionHash)"), &v51);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v51;

      v28 = (void *)a1[4];
      a1[4] = v26;

      v29 = (void *)a1[1];
      v50 = v27;
      objc_msgSend(v29, "statementWithString:error:", CFSTR("DELETE FROM object_relationships WHERE parent_identifier = @parentIdentifier AND person_id = @personID AND child_key = @childKey"), &v50);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v50;

      v32 = (void *)a1[7];
      a1[7] = v30;

      v33 = (void *)a1[1];
      v49 = v31;
      objc_msgSend(v33, "statementWithString:error:", CFSTR("UPDATE assets SET mini_sinf = @miniSINF WHERE identifier = @identifier AND hashed_person_id = @hashedPersonID AND flavor = @flavor"), &v49);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v49;

      v36 = (void *)a1[8];
      a1[8] = v34;

      v37 = (void *)a1[1];
      v48 = v35;
      objc_msgSend(v37, "statementWithString:error:", CFSTR("UPDATE assets SET sinfs = @sinfs WHERE identifier = @identifier AND hashed_person_id = @hashedPersonID AND flavor = @flavor"), &v48);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v48;

      v40 = (void *)a1[9];
      a1[9] = v38;

      v41 = (void *)a1[1];
      v47 = v39;
      objc_msgSend(v41, "statementWithString:error:", CFSTR("UPDATE assets SET url = @url, url_expiration_date = @urlExpirationDate WHERE identifier = @identifier AND hashed_person_id = @hashedPersonID AND flavor = @flavor"), &v47);
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v47;

      v44 = (void *)a1[10];
      a1[10] = v42;

      if (v43)
      {
        v45 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
        if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          v58 = v43;
          _os_log_impl(&dword_193B9B000, v45, OS_LOG_TYPE_FAULT, "SOD: Unable to create statements. error: %{public}@", buf, 0xCu);
        }

        a1 = 0;
      }
    }
  }

  return a1;
}

- (void)dealloc
{
  objc_super v3;

  -[MSVSQLStatement invalidate](self->_selectExistingObjectStatement, "invalidate");
  -[MSVSQLStatement invalidate](self->_insertObjectStatement, "invalidate");
  -[MSVSQLStatement invalidate](self->_insertObjectRelationshipStatement, "invalidate");
  -[MSVSQLStatement invalidate](self->_insertAssetURLStatement, "invalidate");
  -[MSVSQLStatement invalidate](self->_insertHLSAssetURLStatement, "invalidate");
  -[MSVSQLStatement invalidate](self->_removeRelationshipsStatement, "invalidate");
  -[MSVSQLStatement invalidate](self->_updateMiniSINFStatement, "invalidate");
  -[MSVSQLStatement invalidate](self->_updateAssetURLStatement, "invalidate");
  -[MSVSQLStatement invalidate](self->_updateSINFStatement, "invalidate");
  -[MSVSQLDatabaseTransaction commit](self->_transaction, "commit");
  v3.receiver = self;
  v3.super_class = (Class)_MPServerObjectDatabaseImporter;
  -[_MPServerObjectDatabaseImporter dealloc](&v3, sel_dealloc);
}

- (BOOL)importObject:(id)a3 type:(id)a4 identifiers:(id)a5 source:(int64_t)a6 expiration:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  MSVSQLStatement *insertObjectStatement;
  double v33;
  MSVSQLStatement *v34;
  __CFString *v35;
  NSObject *v36;
  BOOL v37;
  unint64_t v38;
  MSVSQLDatabaseTransaction *transaction;
  MSVSQLStatement *v40;
  __CFString *v41;
  NSObject *v42;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint32_t v47;
  const __CFString *v48;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  __CFString *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint8_t buf[4];
  const __CFString *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabase.m"), 958, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type"));

  }
  objc_msgSend(v15, "personalizedStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "personID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabase.m"), 960, CFSTR("Cannot import an object without a personID"));

  }
  objc_msgSend(v15, "preferredStoreStringIdentifierForPersonID:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[MSVSQLStatement bindInt64Value:toParameterNamed:](self->_selectExistingObjectStatement, "bindInt64Value:toParameterNamed:", a6, CFSTR("@source"));
    -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_selectExistingObjectStatement, "bindStringValue:toParameterNamed:", v19, CFSTR("@identifier"));
    -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_selectExistingObjectStatement, "bindStringValue:toParameterNamed:", v18, CFSTR("@personID"));
    -[MSVSQLDatabaseTransaction resultsForStatement:](self->_transaction, "resultsForStatement:", self->_selectExistingObjectStatement);
    v64 = 0;
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "nextObjectWithError:", &v64);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (__CFString *)v64;
    if (v60)
    {
      v21 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v66 = v60;
        _os_log_impl(&dword_193B9B000, v21, OS_LOG_TYPE_FAULT, "SOD: importObject: stepError: %{public}@", buf, 0xCu);
      }

    }
    v56 = v13;
    v22 = v13;
    v23 = v22;
    v57 = v14;
    if (v20)
    {
      v63 = 0;
      objc_msgSend(v20, "jsonValueAtColumnIndex:error:", 0, &v63);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v63;
      objc_msgSend(v53, "mp_deepMerge:", v22);
      v58 = v18;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("_MPSOD_mergeCount"));
      v26 = v22;
      v27 = a6;
      v28 = v16;
      v29 = v15;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v30, "integerValue") + 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v31, CFSTR("_MPSOD_mergeCount"));

      v15 = v29;
      v16 = v28;
      a6 = v27;
      v22 = v26;
      v23 = (void *)objc_msgSend(v24, "copy");

      v14 = v57;
      v18 = v58;

    }
    v54 = v20;
    -[MSVSQLStatement reset](self->_selectExistingObjectStatement, "reset");
    v59 = v19;
    -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_insertObjectStatement, "bindStringValue:toParameterNamed:", v19, CFSTR("@identifier"));
    -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_insertObjectStatement, "bindStringValue:toParameterNamed:", v18, CFSTR("@personID"));
    -[MSVSQLStatement bindInt64Value:toParameterNamed:](self->_insertObjectStatement, "bindInt64Value:toParameterNamed:", a6, CFSTR("@source"));
    -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_insertObjectStatement, "bindStringValue:toParameterNamed:", v14, CFSTR("@type"));
    insertObjectStatement = self->_insertObjectStatement;
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    -[MSVSQLStatement bindInt64Value:toParameterNamed:](insertObjectStatement, "bindInt64Value:toParameterNamed:", (uint64_t)v33, CFSTR("@expirationDate"));
    v34 = self->_insertObjectStatement;
    v62 = 0;
    -[MSVSQLStatement bindJSONValue:toParameterNamed:error:](v34, "bindJSONValue:toParameterNamed:error:", v23, CFSTR("@payload"), &v62);
    v35 = (__CFString *)v62;
    if (v35)
    {
      v36 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        v66 = v35;
        v67 = 2114;
        v68 = v22;
        _os_log_impl(&dword_193B9B000, v36, OS_LOG_TYPE_FAULT, "SOD: importObject: jsonError: %{public}@ payload=%{public}@", buf, 0x16u);
      }

      -[MSVSQLStatement reset](self->_insertObjectStatement, "reset");
      v37 = 0;
      goto LABEL_27;
    }
    v38 = a6;
    transaction = self->_transaction;
    v40 = self->_insertObjectStatement;
    v61 = 0;
    -[MSVSQLDatabaseTransaction executeStatement:error:](transaction, "executeStatement:error:", v40, &v61);
    v41 = (__CFString *)v61;
    v37 = v41 == 0;
    v42 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    v43 = v42;
    if (v41)
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v66 = v41;
        v44 = "SOD: insertObjectError: %{public}@";
        v45 = v43;
        v46 = OS_LOG_TYPE_FAULT;
        v47 = 12;
LABEL_25:
        _os_log_impl(&dword_193B9B000, v45, v46, v44, buf, v47);
      }
    }
    else if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      if (v38 > 2)
        v48 = CFSTR("UNDEF");
      else
        v48 = off_1E315C6B8[v38];
      *(_DWORD *)buf = 138543874;
      v66 = v48;
      v67 = 2114;
      v68 = v59;
      v69 = 2114;
      v70 = v57;
      v44 = "SOD: importObject: imported object [success] source=%{public}@ identifier=%{public}@ type=%{public}@";
      v45 = v43;
      v46 = OS_LOG_TYPE_INFO;
      v47 = 32;
      goto LABEL_25;
    }

    -[MSVSQLStatement reset](self->_insertObjectStatement, "reset");
    v14 = v57;
LABEL_27:
    v19 = v59;

    v13 = v56;
    goto LABEL_28;
  }
  v37 = 0;
LABEL_28:

  return v37;
}

- (BOOL)importAssetURL:(id)a3 forIdentifiers:(id)a4 flavor:(int64_t)a5 expirationDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  const UInt8 *v21;
  ldiv_t v22;
  uint64_t v23;
  CFStringRef v24;
  unsigned __int8 *v25;
  char *v26;
  char *v27;
  uint64_t m;
  unsigned int v29;
  char *v30;
  id v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  _BYTE *v36;
  unint64_t v37;
  unsigned __int8 *v38;
  char *v39;
  char *v40;
  uint64_t j;
  unsigned int v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t quot;
  lldiv_t v47;
  uint64_t v48;
  const UInt8 *v49;
  __CFString *v50;
  unsigned __int8 *v51;
  char *v52;
  char *v53;
  uint64_t k;
  unsigned int v55;
  char *v56;
  char *v57;
  uint64_t v58;
  _BYTE *v59;
  unint64_t v60;
  unsigned __int8 *v61;
  char *v62;
  char *v63;
  uint64_t i;
  unsigned int v65;
  char *v66;
  void *v67;
  MSVSQLStatement *v68;
  int64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  char v80;
  NSObject *v81;
  _BOOL4 v82;
  const __CFString *v83;
  const __CFString *v84;
  void *v85;
  double v86;
  MSVSQLDatabaseTransaction *transaction;
  NSObject *v88;
  void *v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  void *v98;
  id v101;
  _BYTE buf[40];
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[72];
  _OWORD v115[4];
  uint64_t v116;
  _QWORD v117[3];
  _QWORD v118[3];

  v118[0] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v10, "personalizedStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredStoreStringIdentifierForPersonID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v96 = v10;
    v97 = v11;
    objc_msgSend(v10, "personalizedStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "personID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabase.m"), 1019, CFSTR("Cannot import an asset without a personID"));

    }
    v17 = v16;
    v113 = 0u;
    v112 = 0u;
    v111 = 0u;
    v110 = 0u;
    v109 = 0u;
    v108 = 0u;
    v107 = 0u;
    v106 = 0u;
    v105 = 0u;
    v104 = 0u;
    v103 = 0u;
    memset(&buf[8], 0, 32);
    *(_QWORD *)buf = 4001;
    CC_SHA1_Init((CC_SHA1_CTX *)&buf[8]);
    v18 = objc_retainAutorelease(v17);
    CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], (const void *)objc_msgSend(v18, "UTF8String"), objc_msgSend(v18, "length"));

    memset(&v114[8], 0, 64);
    *(_QWORD *)v114 = 4001;
    CC_SHA1_Final(&v114[8], (CC_SHA1_CTX *)&buf[8]);
    v115[0] = *(_OWORD *)v114;
    v115[1] = *(_OWORD *)&v114[16];
    v115[2] = *(_OWORD *)&v114[32];
    v115[3] = *(_OWORD *)&v114[48];
    v116 = *(_QWORD *)&v114[64];
    if (*(uint64_t *)v114 > 3999)
    {
      if (*(uint64_t *)v114 > 4255)
      {
        if (*(_QWORD *)v114 == 4256)
        {
          v61 = (unsigned __int8 *)v115 + 8;
          v62 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
          v63 = v62;
          for (i = 0; i != 64; i += 2)
          {
            v65 = *v61++;
            v66 = &v62[i];
            *v66 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v65 >> 4];
            v66[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v65 & 0xF];
          }
          v31 = objc_alloc(MEMORY[0x1E0CB3940]);
          v32 = v63;
          v33 = 64;
        }
        else
        {
          if (*(_QWORD *)v114 != 4512)
            goto LABEL_71;
          v38 = (unsigned __int8 *)v115 + 8;
          v39 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
          v40 = v39;
          for (j = 0; j != 128; j += 2)
          {
            v42 = *v38++;
            v43 = &v39[j];
            *v43 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v42 >> 4];
            v43[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v42 & 0xF];
          }
          v31 = objc_alloc(MEMORY[0x1E0CB3940]);
          v32 = v40;
          v33 = 128;
        }
      }
      else if (*(_QWORD *)v114 == 4000)
      {
        v51 = (unsigned __int8 *)v115 + 8;
        v52 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
        v53 = v52;
        for (k = 0; k != 32; k += 2)
        {
          v55 = *v51++;
          v56 = &v52[k];
          *v56 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v55 >> 4];
          v56[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v55 & 0xF];
        }
        v31 = objc_alloc(MEMORY[0x1E0CB3940]);
        v32 = v53;
        v33 = 32;
      }
      else
      {
        if (*(_QWORD *)v114 != 4001)
          goto LABEL_71;
        v25 = (unsigned __int8 *)v115 + 8;
        v26 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
        v27 = v26;
        for (m = 0; m != 40; m += 2)
        {
          v29 = *v25++;
          v30 = &v26[m];
          *v30 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v29 >> 4];
          v30[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v29 & 0xF];
        }
        v31 = objc_alloc(MEMORY[0x1E0CB3940]);
        v32 = v27;
        v33 = 40;
      }
    }
    else
    {
      if (*(uint64_t *)v114 <= 2999)
      {
        if (*(_QWORD *)v114 == 1000)
        {
          v44 = *((_QWORD *)&v115[0] + 1);
          v45 = (char *)v118 + 1;
          quot = *((_QWORD *)&v115[0] + 1);
          do
          {
            v47 = lldiv(quot, 10);
            quot = v47.quot;
            if (v47.rem >= 0)
              LOBYTE(v48) = v47.rem;
            else
              v48 = -v47.rem;
            *(v45 - 2) = v48 + 48;
            v49 = (const UInt8 *)(v45 - 2);
            --v45;
          }
          while (v47.quot);
          if (v44 < 0)
          {
            *(v45 - 2) = 45;
            v49 = (const UInt8 *)(v45 - 2);
          }
          v50 = (__CFString *)CFStringCreateWithBytes(0, v49, (char *)v118 - (char *)v49, 0x8000100u, 0);
          v11 = v97;
LABEL_51:

          -[__CFString substringToIndex:](v50, "substringToIndex:", 7);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          v68 = self->_insertAssetURLStatement;
          v69 = a5;
          -[_MPServerObjectDatabaseImporter _existingAssetMatchingIdentifier:hashedPersonID:flavor:](self, "_existingAssetMatchingIdentifier:hashedPersonID:flavor:", v14, v67, a5);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = v14;
          if (v70)
          {
            objc_msgSend(v9, "host");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "url");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "host");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v71, "isEqual:", v73) & 1) != 0)
            {
              v94 = v67;
              v95 = v18;
              objc_msgSend(v9, "path");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "url");
              v75 = v9;
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "path");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v78 = objc_msgSend(v74, "isEqual:", v77);

              if (!v78)
              {
                v9 = v75;
                v11 = v97;
                v14 = v98;
                v67 = v94;
                v18 = v95;
                v69 = a5;
                goto LABEL_61;
              }
              objc_msgSend(v70, "url");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = objc_msgSend(v79, "isEqual:", v75);

              v81 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
              v82 = os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG);
              v9 = v75;
              if ((v80 & 1) != 0)
              {
                v10 = v96;
                v67 = v94;
                if (v82)
                {
                  v11 = v97;
                  v18 = v95;
                  if ((unint64_t)(a5 - 1) > 3)
                    v83 = CFSTR("unknown");
                  else
                    v83 = off_1E315C6D0[a5 - 1];
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v98;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v83;
                  _os_log_impl(&dword_193B9B000, v81, OS_LOG_TYPE_DEBUG, "SOD: importAssetURL: skipping [existing asset already in database] id=%{public}@ / flavor=%{public}@", buf, 0x16u);
                  v19 = 1;
                }
                else
                {
                  v19 = 1;
                  v11 = v97;
                  v18 = v95;
                }
LABEL_69:

                v14 = v98;
                goto LABEL_70;
              }
              v69 = a5;
              v67 = v94;
              if (v82)
              {
                if ((unint64_t)(a5 - 1) > 3)
                  v92 = CFSTR("unknown");
                else
                  v92 = off_1E315C6D0[a5 - 1];
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v98;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v92;
                _os_log_impl(&dword_193B9B000, v81, OS_LOG_TYPE_DEBUG, "SOD: importAssetURL: updating URL [existing asset already in database] id=%{public}@ / flavor=%{public}@", buf, 0x16u);
              }

              v71 = v68;
              v68 = self->_updateAssetURLStatement;
              v11 = v97;
              v18 = v95;
            }
            else
            {

            }
            v14 = v98;
          }
LABEL_61:
          -[MSVSQLStatement bindStringValue:toParameterNamed:](v68, "bindStringValue:toParameterNamed:", v14, CFSTR("@identifier"));
          -[MSVSQLStatement bindStringValue:toParameterNamed:](v68, "bindStringValue:toParameterNamed:", v67, CFSTR("@hashedPersonID"));
          if ((unint64_t)(v69 - 1) > 3)
            v84 = CFSTR("unknown");
          else
            v84 = off_1E315C6F0[v69 - 1];
          -[MSVSQLStatement bindStringValue:toParameterNamed:](v68, "bindStringValue:toParameterNamed:", v84, CFSTR("@flavor"));
          objc_msgSend(v9, "absoluteString");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSVSQLStatement bindStringValue:toParameterNamed:](v68, "bindStringValue:toParameterNamed:", v85, CFSTR("@url"));

          objc_msgSend(v11, "timeIntervalSinceReferenceDate");
          -[MSVSQLStatement bindInt64Value:toParameterNamed:](v68, "bindInt64Value:toParameterNamed:", (uint64_t)v86, CFSTR("@urlExpirationDate"));
          transaction = self->_transaction;
          v101 = 0;
          -[MSVSQLDatabaseTransaction executeStatement:error:](transaction, "executeStatement:error:", v68, &v101);
          v81 = v101;
          v19 = v81 == 0;
          v10 = v96;
          if (v81)
          {
            v88 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
            if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v81;
              _os_log_impl(&dword_193B9B000, v88, OS_LOG_TYPE_FAULT, "SOD: importAssetURL: failed [SQL error] upsertAssetError=%{public}@", buf, 0xCu);
            }

          }
          -[MSVSQLStatement reset](v68, "reset");
          goto LABEL_69;
        }
        if (*(_QWORD *)v114 == 2000)
        {
          v20 = DWORD2(v115[0]);
          v21 = (const UInt8 *)v118;
          do
          {
            v22 = ldiv(v20, 10);
            v20 = v22.quot;
            if (v22.rem >= 0)
              LOBYTE(v23) = v22.rem;
            else
              v23 = -v22.rem;
            *--v21 = v23 + 48;
          }
          while (v22.quot);
          v24 = CFStringCreateWithBytes(0, v21, (char *)v118 - (char *)v21, 0x8000100u, 0);
          goto LABEL_50;
        }
LABEL_71:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "handleFailureInFunction:file:lineNumber:description:", v91, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

        v50 = &stru_1E3163D10;
        goto LABEL_51;
      }
      if (*(_QWORD *)v114 == 3000)
      {
        LODWORD(v117[0]) = bswap32(DWORD2(v115[0]));
        v57 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
        v58 = 0;
        v59 = v57 + 1;
        do
        {
          v60 = *((unsigned __int8 *)v117 + v58);
          *(v59 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v60 >> 4];
          *v59 = MSVFastHexStringFromBytes_hexCharacters_47995[v60 & 0xF];
          v59 += 2;
          ++v58;
        }
        while (v58 != 4);
        v31 = objc_alloc(MEMORY[0x1E0CB3940]);
        v32 = v57;
        v33 = 8;
      }
      else
      {
        if (*(_QWORD *)v114 != 3001)
          goto LABEL_71;
        v117[0] = bswap64(*((unint64_t *)&v115[0] + 1));
        v34 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
        v35 = 0;
        v36 = v34 + 1;
        do
        {
          v37 = *((unsigned __int8 *)v117 + v35);
          *(v36 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v37 >> 4];
          *v36 = MSVFastHexStringFromBytes_hexCharacters_47995[v37 & 0xF];
          v36 += 2;
          ++v35;
        }
        while (v35 != 8);
        v31 = objc_alloc(MEMORY[0x1E0CB3940]);
        v32 = v34;
        v33 = 16;
      }
    }
    v24 = (CFStringRef)objc_msgSend(v31, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v32, v33, 4, 1);
LABEL_50:
    v50 = (__CFString *)v24;
    goto LABEL_51;
  }
  v19 = 0;
LABEL_70:

  return v19;
}

- (BOOL)importHLSAssetURL:(id)a3 keyCertificateURL:(id)a4 keyServerURL:(id)a5 redeliveryId:(int64_t)a6 protocolType:(id)a7 isiTunesStoreStream:(BOOL)a8 forIdentifiers:(id)a9 expirationDate:(id)a10
{
  id v14;
  _BYTE *v15;
  _BYTE *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int64_t v24;
  void *v25;
  void *v26;
  _BYTE *v27;
  id v28;
  id v29;
  _BYTE *v30;
  uint64_t v31;
  _BYTE *v32;
  BOOL v33;
  NSObject *v34;
  const char *v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
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
  int v68;
  void *v69;
  int v70;
  unsigned int v71;
  unsigned __int8 *v72;
  unint64_t v73;
  int v74;
  unint64_t v75;
  int v76;
  unint64_t v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  uint64_t v82;
  const UInt8 *v83;
  ldiv_t v84;
  uint64_t v85;
  CFStringRef v86;
  char *v87;
  char *v88;
  uint64_t m;
  unsigned int v90;
  char *v91;
  id v92;
  char *v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  _BYTE *v97;
  unint64_t v98;
  char *v99;
  char *v100;
  uint64_t j;
  unsigned int v102;
  char *v103;
  uint64_t v104;
  uint64_t quot;
  lldiv_t v106;
  uint64_t v107;
  const UInt8 *v108;
  __CFString *v109;
  char *v110;
  char *v111;
  uint64_t k;
  unsigned int v113;
  char *v114;
  char *v115;
  uint64_t v116;
  _BYTE *v117;
  unint64_t v118;
  char *v119;
  char *v120;
  uint64_t i;
  unsigned int v122;
  char *v123;
  MSVSQLStatement *v124;
  void *v125;
  id v126;
  void *v127;
  int v128;
  _BYTE *v129;
  char v130;
  _BYTE *v131;
  int v132;
  int v133;
  void *v134;
  id v135;
  void *v136;
  void *v137;
  NSObject *v138;
  double v139;
  void *v140;
  uint64_t v141;
  void *v142;
  const __CFString *v143;
  uint64_t v144;
  void *v145;
  const __CFString *v146;
  MSVSQLDatabaseTransaction *transaction;
  NSObject *v148;
  NSObject *v149;
  const char *v150;
  NSObject *v151;
  os_log_type_t v152;
  uint32_t v153;
  id v155;
  int64_t v156;
  id v157;
  int64_t v158;
  void *v159;
  id v160;
  _BYTE *v161;
  _BYTE *v162;
  void *v163;
  _BOOL4 v164;
  id v166;
  _BYTE buf[40];
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _BYTE v179[72];
  _OWORD v180[4];
  uint64_t v181;
  _QWORD v182[3];
  _QWORD v183[3];

  v164 = a8;
  v183[0] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a9;
  v19 = a10;
  objc_msgSend(v18, "personalizedStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "personID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v18, "preferredStoreStringIdentifierForPersonID:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (!v22)
    {
      v33 = 0;
LABEL_173:

      goto LABEL_174;
    }
    v24 = a6;
    v163 = (void *)v22;
    if (a6)
      goto LABEL_9;
    objc_msgSend(v18, "universalStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v25, "subscriptionAdamID");

    v23 = v163;
    if (v24
      || (objc_msgSend(v18, "universalStore"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v24 = objc_msgSend(v26, "adamID"),
          v26,
          v23 = v163,
          v24))
    {
LABEL_9:
      if (v15 && v16 || v164 && (objc_msgSend(v17, "isEqualToString:", CFSTR("simplified")) & 1) != 0)
      {
        v158 = v24;
        v159 = v19;
        v156 = a6;
        v160 = v17;
        v161 = v15;
        v162 = v16;
        v27 = buf;
        v28 = v21;
        v178 = 0u;
        v177 = 0u;
        v176 = 0u;
        v175 = 0u;
        v174 = 0u;
        v173 = 0u;
        v172 = 0u;
        v171 = 0u;
        v170 = 0u;
        v169 = 0u;
        v168 = 0u;
        memset(&buf[8], 0, 32);
        *(_QWORD *)buf = 4001;
        CC_SHA1_Init((CC_SHA1_CTX *)&buf[8]);
        v29 = objc_retainAutorelease(v28);
        v30 = (_BYTE *)objc_msgSend(v29, "UTF8String");
        v31 = objc_msgSend(v29, "length");
        if (*(uint64_t *)buf > 3999)
        {
          if (*(uint64_t *)buf > 4255)
          {
            if (*(_QWORD *)buf == 4256)
            {
              CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v30, v31);
            }
            else if (*(_QWORD *)buf == 4512)
            {
              CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v30, v31);
            }
          }
          else if (*(_QWORD *)buf == 4000)
          {
            CC_MD5_Update((CC_MD5_CTX *)&buf[8], v30, v31);
          }
          else if (*(_QWORD *)buf == 4001)
          {
            CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v30, v31);
          }
        }
        else if (*(uint64_t *)buf > 2999)
        {
          if (*(_QWORD *)buf == 3000)
          {
            _MSV_XXH_XXH32_update_10929(&buf[8], v30, v31);
          }
          else if (*(_QWORD *)buf == 3001)
          {
            _MSV_XXH_XXH64_update_10930(&buf[8], v30, v31);
          }
        }
        else if (*(_QWORD *)buf)
        {
          if (*(_QWORD *)buf == 2000)
          {
            v32 = &buf[buf[19] + 16];
            switch((((_BYTE)v31 + buf[19]) & 3) - buf[19])
            {
              case 0:
                break;
              case 1:
                *v32 = *v30;
                break;
              case 2:
                v37 = *(_WORD *)v30;
                goto LABEL_41;
              case 3:
                v37 = *(_WORD *)v30;
                buf[buf[19] + 18] = v30[2];
LABEL_41:
                *(_WORD *)v32 = v37;
                break;
              default:
                memcpy(v32, v30, (((v31 + buf[19]) & 3) - buf[19]));
                break;
            }
            *(_DWORD *)&buf[12] += v31;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
          v27 = (_BYTE *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("MSVHasher+Algorithms.h"), 262, CFSTR("Cannot append to unknown hasher algorithm"));

        }
        memset(&v179[8], 0, 64);
        *(_QWORD *)v179 = *(_QWORD *)buf;
        if (*(uint64_t *)buf > 3000)
        {
          if (*(uint64_t *)buf <= 4000)
          {
            if (*(_QWORD *)buf == 3001)
            {
              *(_QWORD *)&v179[8] = _MSV_XXH_XXH64_digest(&buf[8]);
            }
            else if (*(_QWORD *)buf == 4000)
            {
              CC_MD5_Final(&v179[8], (CC_MD5_CTX *)&buf[8]);
            }
          }
          else
          {
            switch(*(_QWORD *)buf)
            {
              case 0xFA1:
                CC_SHA1_Final(&v179[8], (CC_SHA1_CTX *)&buf[8]);
                break;
              case 0x10A0:
                CC_SHA256_Final(&v179[8], (CC_SHA256_CTX *)&buf[8]);
                break;
              case 0x11A0:
                CC_SHA512_Final(&v179[8], (CC_SHA512_CTX *)&buf[8]);
                break;
            }
          }
          goto LABEL_80;
        }
        if (*(uint64_t *)buf <= 1999)
        {
          if (*(_QWORD *)buf)
          {
            if (*(_QWORD *)buf == 1000)
            {
              v38 = (*(_QWORD *)&buf[8] + *(_QWORD *)&buf[16]) ^ __ROR8__(*(_QWORD *)&buf[16], 51);
              v39 = *(_QWORD *)&buf[24] + (*(_QWORD *)&buf[32] ^ v168);
              v40 = __ROR8__(*(_QWORD *)&buf[32] ^ v168, 48);
              v41 = (v39 ^ v40) + __ROR8__(*(_QWORD *)&buf[8] + *(_QWORD *)&buf[16], 32);
              v42 = v41 ^ __ROR8__(v39 ^ v40, 43);
              v43 = v39 + v38;
              v44 = v43 ^ __ROR8__(v38, 47);
              v45 = (v41 ^ v168) + v44;
              v46 = v45 ^ __ROR8__(v44, 51);
              v47 = (__ROR8__(v43, 32) ^ 0xFFLL) + v42;
              v48 = __ROR8__(v42, 48);
              v49 = __ROR8__(v45, 32) + (v47 ^ v48);
              v50 = v49 ^ __ROR8__(v47 ^ v48, 43);
              v51 = v46 + v47;
              v52 = v51 ^ __ROR8__(v46, 47);
              v53 = v52 + v49;
              v54 = v53 ^ __ROR8__(v52, 51);
              v55 = __ROR8__(v51, 32) + v50;
              v56 = __ROR8__(v50, 48);
              v57 = __ROR8__(v53, 32) + (v55 ^ v56);
              v58 = v57 ^ __ROR8__(v55 ^ v56, 43);
              v59 = v54 + v55;
              v60 = v59 ^ __ROR8__(v54, 47);
              v61 = v60 + v57;
              v62 = v61 ^ __ROR8__(v60, 51);
              v63 = __ROR8__(v59, 32) + v58;
              v64 = __ROR8__(v58, 48);
              v65 = __ROR8__(v61, 32) + (v63 ^ v64);
              v66 = v65 ^ __ROR8__(v63 ^ v64, 43);
              v67 = v62 + v63;
              *(_QWORD *)&buf[8] = v65;
              *(_QWORD *)&buf[16] = v67 ^ __ROR8__(v62, 47);
              *(_QWORD *)&buf[24] = __ROR8__(v67, 32);
              *(_QWORD *)&buf[32] = v66;
              *(_QWORD *)&v179[8] = *(_QWORD *)&buf[16] ^ v65 ^ *(_QWORD *)&buf[24] ^ v66;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
            v27 = (_BYTE *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

          }
LABEL_80:
          v180[0] = *(_OWORD *)v179;
          v180[1] = *(_OWORD *)&v179[16];
          v180[2] = *(_OWORD *)&v179[32];
          v180[3] = *(_OWORD *)&v179[48];
          v181 = *(_QWORD *)&v179[64];
          if (*(uint64_t *)v179 > 3999)
          {
            if (*(uint64_t *)v179 > 4255)
            {
              if (*(_QWORD *)v179 == 4256)
              {
                v27 = (char *)v180 + 8;
                v119 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
                v120 = v119;
                for (i = 0; i != 64; i += 2)
                {
                  v122 = *v27++;
                  v123 = &v119[i];
                  *v123 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v122 >> 4];
                  v123[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v122 & 0xF];
                }
                v92 = objc_alloc(MEMORY[0x1E0CB3940]);
                v93 = v120;
                v94 = 64;
              }
              else
              {
                if (*(_QWORD *)v179 != 4512)
                  goto LABEL_146;
                v27 = (char *)v180 + 8;
                v99 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
                v100 = v99;
                for (j = 0; j != 128; j += 2)
                {
                  v102 = *v27++;
                  v103 = &v99[j];
                  *v103 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v102 >> 4];
                  v103[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v102 & 0xF];
                }
                v92 = objc_alloc(MEMORY[0x1E0CB3940]);
                v93 = v100;
                v94 = 128;
              }
            }
            else if (*(_QWORD *)v179 == 4000)
            {
              v27 = (char *)v180 + 8;
              v110 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
              v111 = v110;
              for (k = 0; k != 32; k += 2)
              {
                v113 = *v27++;
                v114 = &v110[k];
                *v114 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v113 >> 4];
                v114[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v113 & 0xF];
              }
              v92 = objc_alloc(MEMORY[0x1E0CB3940]);
              v93 = v111;
              v94 = 32;
            }
            else
            {
              if (*(_QWORD *)v179 != 4001)
                goto LABEL_146;
              v27 = (char *)v180 + 8;
              v87 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
              v88 = v87;
              for (m = 0; m != 40; m += 2)
              {
                v90 = *v27++;
                v91 = &v87[m];
                *v91 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v90 >> 4];
                v91[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v90 & 0xF];
              }
              v92 = objc_alloc(MEMORY[0x1E0CB3940]);
              v93 = v88;
              v94 = 40;
            }
          }
          else
          {
            if (*(uint64_t *)v179 <= 2999)
            {
              if (*(_QWORD *)v179 == 1000)
              {
                v104 = *((_QWORD *)&v180[0] + 1);
                v27 = (char *)v183 + 1;
                quot = *((_QWORD *)&v180[0] + 1);
                do
                {
                  v106 = lldiv(quot, 10);
                  quot = v106.quot;
                  if (v106.rem >= 0)
                    LOBYTE(v107) = v106.rem;
                  else
                    v107 = -v106.rem;
                  *(v27 - 2) = v107 + 48;
                  v108 = v27 - 2;
                  --v27;
                }
                while (v106.quot);
                if (v104 < 0)
                {
                  *(v27 - 2) = 45;
                  v27 -= 2;
                  v108 = v27;
                }
                v109 = (__CFString *)CFStringCreateWithBytes(0, v108, (char *)v183 - (char *)v108, 0x8000100u, 0);
                v15 = v161;
LABEL_125:

                -[__CFString substringToIndex:](v109, "substringToIndex:", 7);
                v34 = objc_claimAutoreleasedReturnValue();

                v124 = self->_insertHLSAssetURLStatement;
                -[_MPServerObjectDatabaseImporter _existingHLSAssetMatchingIdentifier:hashedPersonID:](self, "_existingHLSAssetMatchingIdentifier:hashedPersonID:", v163, v34);
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v125, "playlistURL");
                v126 = (id)objc_claimAutoreleasedReturnValue();
                v127 = v126;
                v157 = v18;
                if (v126 == v14)
                {

                  if (!v15)
                    goto LABEL_135;
                }
                else
                {
                  v128 = objc_msgSend(v126, "isEqual:", v14);

                  if (!v128)
                  {
LABEL_131:

                    v23 = v163;
                    goto LABEL_158;
                  }
                  if (!v15)
                  {
LABEL_135:
                    if (v162)
                    {
                      objc_msgSend(v125, "keyServerURL");
                      v131 = (id)objc_claimAutoreleasedReturnValue();
                      if (v131 == v162)
                      {

                        v15 = v162;
                      }
                      else
                      {
                        v15 = v131;
                        v132 = objc_msgSend(v131, "isEqual:", v162);

                        if (!v132)
                        {
                          v133 = 0;
LABEL_151:

LABEL_152:
                          v15 = v161;
                          v23 = v163;
                          if (v161)
                          {

                            if ((v133 & 1) != 0)
                            {
LABEL_154:
                              v138 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
                              if (os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
                              {
                                *(_DWORD *)buf = 138543362;
                                *(_QWORD *)&buf[4] = v163;
                                _os_log_impl(&dword_193B9B000, v138, OS_LOG_TYPE_DEBUG, "SOD: importHLSAssetURL: skipping [existing asset already in database] id=%{public}@", buf, 0xCu);
                              }
                              v33 = 1;
                              v18 = v157;
                              goto LABEL_171;
                            }
                          }
                          else
                          {

                            if (v133)
                              goto LABEL_154;
                          }
LABEL_158:
                          -[MSVSQLStatement bindStringValue:toParameterNamed:](v124, "bindStringValue:toParameterNamed:", v23, CFSTR("@identifier"));
                          -[MSVSQLStatement bindStringValue:toParameterNamed:](v124, "bindStringValue:toParameterNamed:", v34, CFSTR("@hashedPersonID"));
                          objc_msgSend(v159, "timeIntervalSinceReferenceDate");
                          -[MSVSQLStatement bindInt64Value:toParameterNamed:](v124, "bindInt64Value:toParameterNamed:", (uint64_t)v139, CFSTR("@urlExpirationDate"));
                          objc_msgSend(v14, "absoluteString");
                          v140 = (void *)objc_claimAutoreleasedReturnValue();
                          -[MSVSQLStatement bindStringValue:toParameterNamed:](v124, "bindStringValue:toParameterNamed:", v140, CFSTR("@playlistURL"));

                          objc_msgSend(v15, "absoluteString");
                          v141 = objc_claimAutoreleasedReturnValue();
                          v142 = (void *)v141;
                          if (v141)
                            v143 = (const __CFString *)v141;
                          else
                            v143 = &stru_1E3163D10;
                          -[MSVSQLStatement bindStringValue:toParameterNamed:](v124, "bindStringValue:toParameterNamed:", v143, CFSTR("@keyCertificateURL"));

                          objc_msgSend(v162, "absoluteString");
                          v144 = objc_claimAutoreleasedReturnValue();
                          v145 = (void *)v144;
                          if (v144)
                            v146 = (const __CFString *)v144;
                          else
                            v146 = &stru_1E3163D10;
                          -[MSVSQLStatement bindStringValue:toParameterNamed:](v124, "bindStringValue:toParameterNamed:", v146, CFSTR("@keyServerURL"));

                          -[MSVSQLStatement bindInt64Value:toParameterNamed:](v124, "bindInt64Value:toParameterNamed:", v158, CFSTR("@keyServerAdamID"));
                          -[MSVSQLStatement bindStringValue:toParameterNamed:](v124, "bindStringValue:toParameterNamed:", v160, CFSTR("@keyServerProtocolType"));
                          -[MSVSQLStatement bindBoolValue:toParameterNamed:](v124, "bindBoolValue:toParameterNamed:", v164, CFSTR("@isiTunesStoreStream"));
                          transaction = self->_transaction;
                          v166 = 0;
                          -[MSVSQLDatabaseTransaction executeStatement:error:](transaction, "executeStatement:error:", v124, &v166);
                          v138 = v166;
                          v33 = v138 == 0;
                          v148 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
                          v149 = v148;
                          if (v138)
                          {
                            v18 = v157;
                            v23 = v163;
                            if (os_log_type_enabled(v148, OS_LOG_TYPE_FAULT))
                            {
                              *(_DWORD *)buf = 138543362;
                              *(_QWORD *)&buf[4] = v138;
                              v150 = "SOD: importHLSAssetURL: failed [SQL error] upsertAssetError=%{public}@";
                              v151 = v149;
                              v152 = OS_LOG_TYPE_FAULT;
                              v153 = 12;
LABEL_169:
                              _os_log_impl(&dword_193B9B000, v151, v152, v150, buf, v153);
                            }
                          }
                          else
                          {
                            v18 = v157;
                            v23 = v163;
                            if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138543618;
                              *(_QWORD *)&buf[4] = v163;
                              *(_WORD *)&buf[12] = 2050;
                              *(_QWORD *)&buf[14] = v156;
                              v150 = "SOD: importHLSAssetURL: succeeded id=%{public}@ redeliveryId=%{public}lld";
                              v151 = v149;
                              v152 = OS_LOG_TYPE_DEFAULT;
                              v153 = 22;
                              goto LABEL_169;
                            }
                          }

                          -[MSVSQLStatement reset](v124, "reset");
                          v15 = v161;
LABEL_171:

                          v16 = v162;
                          v19 = v159;
                          v17 = v160;
                          goto LABEL_172;
                        }
                      }
                    }
                    objc_msgSend(v125, "keyServerAdamID");
                    v134 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v134, "longLongValue") != v158)
                    {

                      v133 = 0;
                      goto LABEL_150;
                    }
                    v155 = v14;
                    objc_msgSend(v125, "keyServerProtocolType");
                    v135 = (id)objc_claimAutoreleasedReturnValue();
                    v136 = v135;
                    if (v135 == v160)
                    {

                    }
                    else
                    {
                      v133 = objc_msgSend(v135, "isEqual:");

                      if (!v133)
                        goto LABEL_149;
                    }
                    v133 = objc_msgSend(v125, "isiTunesStoreStream") ^ v164 ^ 1;
LABEL_149:

                    v14 = v155;
LABEL_150:
                    if (!v162)
                      goto LABEL_152;
                    goto LABEL_151;
                  }
                }
                objc_msgSend(v125, "keyCertificateURL");
                v129 = (id)objc_claimAutoreleasedReturnValue();
                if (v129 == v15)
                {

                  v27 = v15;
                }
                else
                {
                  v27 = v129;
                  v130 = objc_msgSend(v129, "isEqual:", v15);

                  if ((v130 & 1) == 0)
                  {

                    goto LABEL_131;
                  }
                }
                goto LABEL_135;
              }
              if (*(_QWORD *)v179 == 2000)
              {
                v82 = DWORD2(v180[0]);
                v27 = v183;
                v83 = (const UInt8 *)v183;
                do
                {
                  v84 = ldiv(v82, 10);
                  v82 = v84.quot;
                  if (v84.rem >= 0)
                    LOBYTE(v85) = v84.rem;
                  else
                    v85 = -v84.rem;
                  *--v83 = v85 + 48;
                }
                while (v84.quot);
                v86 = CFStringCreateWithBytes(0, v83, (char *)v183 - (char *)v83, 0x8000100u, 0);
                goto LABEL_124;
              }
LABEL_146:
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
              v27 = (_BYTE *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v137, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

              v109 = &stru_1E3163D10;
              goto LABEL_125;
            }
            if (*(_QWORD *)v179 == 3000)
            {
              LODWORD(v182[0]) = bswap32(DWORD2(v180[0]));
              v115 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
              v116 = 0;
              v117 = v115 + 1;
              do
              {
                v118 = *((unsigned __int8 *)v182 + v116);
                *(v117 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v118 >> 4];
                *v117 = MSVFastHexStringFromBytes_hexCharacters_47995[v118 & 0xF];
                v117 += 2;
                ++v116;
              }
              while (v116 != 4);
              v92 = objc_alloc(MEMORY[0x1E0CB3940]);
              v93 = v115;
              v94 = 8;
            }
            else
            {
              if (*(_QWORD *)v179 != 3001)
                goto LABEL_146;
              v182[0] = bswap64(*((unint64_t *)&v180[0] + 1));
              v95 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
              v96 = 0;
              v97 = v95 + 1;
              do
              {
                v98 = *((unsigned __int8 *)v182 + v96);
                *(v97 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v98 >> 4];
                *v97 = MSVFastHexStringFromBytes_hexCharacters_47995[v98 & 0xF];
                v97 += 2;
                ++v96;
              }
              while (v96 != 8);
              v92 = objc_alloc(MEMORY[0x1E0CB3940]);
              v93 = v95;
              v94 = 16;
            }
          }
          v86 = (CFStringRef)objc_msgSend(v92, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v93, v94, 4, 1);
LABEL_124:
          v109 = (__CFString *)v86;
          goto LABEL_125;
        }
        if (*(_QWORD *)buf != 2000)
        {
          if (*(_QWORD *)buf != 3000)
            goto LABEL_80;
          if (*(_DWORD *)&buf[12])
            v68 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_193F0CA90), (int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_193F0CA80)));
          else
            v68 = *(_DWORD *)&buf[24] + 374761393;
          v71 = *(_DWORD *)&buf[8] + v68;
          v72 = &buf[32];
          v73 = BYTE8(v168) & 0xF;
          if (v73 >= 4)
          {
            do
            {
              v74 = *(_DWORD *)v72;
              v72 += 4;
              HIDWORD(v75) = v71 - 1028477379 * v74;
              LODWORD(v75) = HIDWORD(v75);
              v71 = 668265263 * (v75 >> 15);
              v73 -= 4;
            }
            while (v73 > 3);
          }
          for (; v73; --v73)
          {
            v76 = *v72++;
            HIDWORD(v77) = v71 + 374761393 * v76;
            LODWORD(v77) = HIDWORD(v77);
            v71 = -1640531535 * (v77 >> 21);
          }
          v78 = (-2048144777 * (v71 ^ (v71 >> 15))) ^ ((-2048144777 * (v71 ^ (v71 >> 15))) >> 13);
          v79 = (-1028477379 * v78) ^ ((-1028477379 * v78) >> 16);
          goto LABEL_79;
        }
        switch(buf[19])
        {
          case 1:
            v70 = buf[16];
            break;
          case 2:
            v70 = *(unsigned __int16 *)&buf[16];
            break;
          case 3:
            v70 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
            break;
          default:
            v80 = *(_DWORD *)&buf[8];
            goto LABEL_78;
        }
        v80 = (461845907 * ((380141568 * v70) | ((-862048943 * v70) >> 17))) ^ *(_DWORD *)&buf[8];
LABEL_78:
        v81 = -2048144789 * (v80 ^ *(_DWORD *)&buf[12] ^ ((v80 ^ *(_DWORD *)&buf[12]) >> 16));
        v79 = (-1028477387 * (v81 ^ (v81 >> 13))) ^ ((-1028477387 * (v81 ^ (v81 >> 13))) >> 16);
        *(_DWORD *)&buf[8] = v79;
LABEL_79:
        *(_DWORD *)&v179[8] = v79;
        goto LABEL_80;
      }
      v34 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
LABEL_21:
        v33 = 0;
LABEL_172:

        goto LABEL_173;
      }
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v23;
      v35 = "SOD: importHLSAssetURL: skipping [no key server URLs for non-store stream] id=%{public}@";
    }
    else
    {
      v34 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v163;
      v35 = "SOD: importHLSAssetURL: skipping [no keyServerAdamID (redeliveryId or adamID)] id=%{public}@";
    }
    _os_log_impl(&dword_193B9B000, v34, OS_LOG_TYPE_DEBUG, v35, buf, 0xCu);
    goto LABEL_21;
  }
  v33 = 0;
LABEL_174:

  return v33;
}

- (BOOL)importAssetSinf:(id)a3 type:(int64_t)a4 forIdentifier:(id)a5 hashedPersonID:(id)a6 flavor:(int64_t)a7 sinfPayload:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  char v23;
  NSObject *v24;
  const __CFString *v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint32_t v29;
  void *v30;
  char v31;
  const __CFString *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  __int16 v40;
  _WORD v41[9];

  *(_QWORD *)&v41[5] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (!objc_msgSend(v17, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabase.m"), 1116, CFSTR("Cannot import an asset without personID"));

  }
  if (!objc_msgSend(v16, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabase.m"), 1117, CFSTR("Cannot import an asset without identifier"));

  }
  if (objc_msgSend(v15, "length"))
  {
    if (a4)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabase.m"), 1118, CFSTR("Cannot import an asset without sinfData"));

    if (a4)
      goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabase.m"), 1119, CFSTR("Cannot import sinf with invalid type"));

LABEL_7:
  -[_MPServerObjectDatabaseImporter _existingAssetMatchingIdentifier:hashedPersonID:flavor:](self, "_existingAssetMatchingIdentifier:hashedPersonID:flavor:", v16, v17, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = v19 != 0;
  if (!v19)
  {
    v24 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      v38 = 138543874;
      v39 = v16;
      v40 = 1024;
      *(_DWORD *)v41 = a7;
      v41[2] = 1024;
      *(_DWORD *)&v41[3] = a4;
      v26 = "SOD: importAssetSinf: skipping [asset does not exist] identifiers=%{public}@ flavor=%d sinfType=%d";
      v27 = v24;
      v28 = OS_LOG_TYPE_FAULT;
      v29 = 24;
LABEL_34:
      _os_log_impl(&dword_193B9B000, v27, v28, v26, (uint8_t *)&v38, v29);
      goto LABEL_35;
    }
    goto LABEL_35;
  }
  if (a4 == 1)
  {
    objc_msgSend(v19, "sinfs");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v18, "isEqualToArray:", v30);

    if ((v31 & 1) != 0)
    {
      v24 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        if ((unint64_t)(a7 - 1) > 3)
          v32 = CFSTR("unknown");
        else
          v32 = off_1E315C6D0[a7 - 1];
        v38 = 138543618;
        v39 = v16;
        v40 = 2114;
        *(_QWORD *)v41 = v32;
        v26 = "SOD: importAssetSinf: skipping [existing fullSinf already in database] id=%{public}@ / flavor=%{public}@";
        goto LABEL_32;
      }
LABEL_35:

      goto LABEL_36;
    }
    if (-[_MPServerObjectDatabaseImporter _importAssetFullSINF:forIdentifier:hashedPersonID:flavor:](self, "_importAssetFullSINF:forIdentifier:hashedPersonID:flavor:", v15, v16, v17, a7))
    {
      v24 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        goto LABEL_35;
      v38 = 138543618;
      v39 = v16;
      v40 = 2114;
      *(_QWORD *)v41 = v17;
      v26 = "SOD: importAssetSinf: [success] type=fullSinf identifier=%{public}@ person=%{public}@";
      goto LABEL_26;
    }
  }
  else if (a4 == 2)
  {
    objc_msgSend(v19, "miniSINF");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v15, "isEqualToData:", v22);

    if ((v23 & 1) != 0)
    {
      v24 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        if ((unint64_t)(a7 - 1) > 3)
          v25 = CFSTR("unknown");
        else
          v25 = off_1E315C6D0[a7 - 1];
        v38 = 138543618;
        v39 = v16;
        v40 = 2114;
        *(_QWORD *)v41 = v25;
        v26 = "SOD: importAssetSinf: skipping [existing miniSinf already in database] id=%{public}@ / flavor=%{public}@";
LABEL_32:
        v27 = v24;
        v28 = OS_LOG_TYPE_DEBUG;
        goto LABEL_33;
      }
      goto LABEL_35;
    }
    if (-[_MPServerObjectDatabaseImporter _importAssetMiniSINF:forIdentifier:hashedPersonID:flavor:](self, "_importAssetMiniSINF:forIdentifier:hashedPersonID:flavor:", v15, v16, v17, a7))
    {
      v24 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        goto LABEL_35;
      v38 = 138543618;
      v39 = v16;
      v40 = 2114;
      *(_QWORD *)v41 = v17;
      v26 = "SOD: importAssetSinf: [success] type=miniSinf identifier=%{public}@ person=%{public}@";
LABEL_26:
      v27 = v24;
      v28 = OS_LOG_TYPE_INFO;
LABEL_33:
      v29 = 22;
      goto LABEL_34;
    }
  }
  v21 = 0;
LABEL_36:

  return v21;
}

- (BOOL)relateIdentifiers:(id)a3 toParentIdentifiers:(id)a4 parentVersionHash:(id)a5 childKey:(id)a6 order:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MSVSQLDatabaseTransaction *transaction;
  MSVSQLStatement *insertObjectRelationshipStatement;
  id v27;
  BOOL v28;
  NSObject *v29;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabase.m"), 1160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("childKey"));

  }
  objc_msgSend(v14, "personalizedStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "personID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredStoreStringIdentifierForPersonID:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v33 = v15;
    objc_msgSend(v13, "personalizedStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "personID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredStoreStringIdentifierForPersonID:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v13, "personalizedStore");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "personID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabase.m"), 1166, CFSTR("Cannot relate without a personID"));

      }
      -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_insertObjectRelationshipStatement, "bindStringValue:toParameterNamed:", v19, CFSTR("@parentIdentifier"));
      -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_insertObjectRelationshipStatement, "bindStringValue:toParameterNamed:", v22, CFSTR("@childIdentifier"));
      -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_insertObjectRelationshipStatement, "bindStringValue:toParameterNamed:", v24, CFSTR("@personID"));
      -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_insertObjectRelationshipStatement, "bindStringValue:toParameterNamed:", v16, CFSTR("@childKey"));
      -[MSVSQLStatement bindInt64Value:toParameterNamed:](self->_insertObjectRelationshipStatement, "bindInt64Value:toParameterNamed:", a7, CFSTR("@suborder"));
      -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_insertObjectRelationshipStatement, "bindStringValue:toParameterNamed:", v33, CFSTR("@parentVersionHash"));
      transaction = self->_transaction;
      insertObjectRelationshipStatement = self->_insertObjectRelationshipStatement;
      v34 = 0;
      -[MSVSQLDatabaseTransaction executeStatement:error:](transaction, "executeStatement:error:", insertObjectRelationshipStatement, &v34);
      v27 = v34;
      v28 = v27 == 0;
      if (v27)
      {
        v29 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          v36 = v27;
          _os_log_impl(&dword_193B9B000, v29, OS_LOG_TYPE_FAULT, "SOD: relateIdentifiers:toParentIdentifiers:order: %{public}@", buf, 0xCu);
        }

      }
      -[MSVSQLStatement reset](self->_insertObjectRelationshipStatement, "reset");

    }
    else
    {
      v28 = 0;
    }

    v15 = v33;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (BOOL)removeRelationshipsForParentIdentifiers:(id)a3 childKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MSVSQLDatabaseTransaction *transaction;
  MSVSQLStatement *removeRelationshipsStatement;
  id v16;
  BOOL v17;
  NSObject *v18;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabase.m"), 1186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("childKey"));

  }
  objc_msgSend(v7, "personalizedStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredStoreStringIdentifierForPersonID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v7, "personalizedStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "personID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabase.m"), 1190, CFSTR("Cannot remove relationships without a personID"));

    }
    -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_removeRelationshipsStatement, "bindStringValue:toParameterNamed:", v11, CFSTR("@parentIdentifier"));
    -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_removeRelationshipsStatement, "bindStringValue:toParameterNamed:", v13, CFSTR("@personID"));
    -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_removeRelationshipsStatement, "bindStringValue:toParameterNamed:", v8, CFSTR("@childKey"));
    transaction = self->_transaction;
    removeRelationshipsStatement = self->_removeRelationshipsStatement;
    v22 = 0;
    -[MSVSQLDatabaseTransaction executeStatement:error:](transaction, "executeStatement:error:", removeRelationshipsStatement, &v22);
    v16 = v22;
    v17 = v16 == 0;
    if (v16)
    {
      v18 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v16;
        _os_log_impl(&dword_193B9B000, v18, OS_LOG_TYPE_FAULT, "SOD: removeRelationshipsForParentIdentifiersError: %{public}@", buf, 0xCu);
      }

    }
    -[MSVSQLStatement reset](self->_removeRelationshipsStatement, "reset");

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_importAssetMiniSINF:(id)a3 forIdentifier:(id)a4 hashedPersonID:(id)a5 flavor:(int64_t)a6
{
  MSVSQLStatement *updateMiniSINFStatement;
  id v11;
  id v12;
  const __CFString *v13;
  MSVSQLDatabaseTransaction *transaction;
  MSVSQLStatement *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  updateMiniSINFStatement = self->_updateMiniSINFStatement;
  v11 = a5;
  v12 = a4;
  -[MSVSQLStatement bindDataValue:toParameterNamed:](updateMiniSINFStatement, "bindDataValue:toParameterNamed:", a3, CFSTR("@miniSINF"));
  -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_updateMiniSINFStatement, "bindStringValue:toParameterNamed:", v12, CFSTR("@identifier"));

  -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_updateMiniSINFStatement, "bindStringValue:toParameterNamed:", v11, CFSTR("@hashedPersonID"));
  if ((unint64_t)(a6 - 1) > 3)
    v13 = CFSTR("unknown");
  else
    v13 = off_1E315C6F0[a6 - 1];
  -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_updateMiniSINFStatement, "bindStringValue:toParameterNamed:", v13, CFSTR("@flavor"));
  transaction = self->_transaction;
  v15 = self->_updateMiniSINFStatement;
  v19 = 0;
  -[MSVSQLDatabaseTransaction executeStatement:error:](transaction, "executeStatement:error:", v15, &v19);
  v16 = v19;
  if (v16)
  {
    v17 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_FAULT, "SOD: importAssetMiniSINF: update failed error=%{public}@", buf, 0xCu);
    }

  }
  -[MSVSQLStatement reset](self->_updateMiniSINFStatement, "reset");

  return v16 == 0;
}

- (BOOL)_importAssetFullSINF:(id)a3 forIdentifier:(id)a4 hashedPersonID:(id)a5 flavor:(int64_t)a6
{
  MSVSQLStatement *updateSINFStatement;
  id v11;
  id v12;
  const __CFString *v13;
  MSVSQLDatabaseTransaction *transaction;
  MSVSQLStatement *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  updateSINFStatement = self->_updateSINFStatement;
  v11 = a5;
  v12 = a4;
  -[MSVSQLStatement bindDataValue:toParameterNamed:](updateSINFStatement, "bindDataValue:toParameterNamed:", a3, CFSTR("@sinfs"));
  -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_updateSINFStatement, "bindStringValue:toParameterNamed:", v12, CFSTR("@identifier"));

  -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_updateSINFStatement, "bindStringValue:toParameterNamed:", v11, CFSTR("@hashedPersonID"));
  if ((unint64_t)(a6 - 1) > 3)
    v13 = CFSTR("unknown");
  else
    v13 = off_1E315C6F0[a6 - 1];
  -[MSVSQLStatement bindStringValue:toParameterNamed:](self->_updateSINFStatement, "bindStringValue:toParameterNamed:", v13, CFSTR("@flavor"));
  transaction = self->_transaction;
  v15 = self->_updateSINFStatement;
  v19 = 0;
  -[MSVSQLDatabaseTransaction executeStatement:error:](transaction, "executeStatement:error:", v15, &v19);
  v16 = v19;
  if (v16)
  {
    v17 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_FAULT, "SOD: importAssetFullSINF: update failed error=%{public}@", buf, 0xCu);
    }

  }
  -[MSVSQLStatement reset](self->_updateSINFStatement, "reset");

  return v16 == 0;
}

- (id)_existingAssetMatchingIdentifier:(id)a3 hashedPersonID:(id)a4 flavor:(int64_t)a5
{
  MSVSQLDatabaseTransaction *transaction;
  id v9;
  id v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  MPServerObjectDatabaseAsset *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  transaction = self->_transaction;
  v9 = a4;
  v10 = a3;
  -[MSVSQLDatabaseTransaction statementWithString:error:](transaction, "statementWithString:error:", CFSTR("SELECT identifier, hashed_person_id, flavor, url, mini_sinf, sinfs FROM assets WHERE identifier = @identifier AND hashed_person_id = @hashedPersonID AND flavor = @flavor"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bindStringValue:toParameterNamed:", v10, CFSTR("@identifier"));

  objc_msgSend(v11, "bindStringValue:toParameterNamed:", v9, CFSTR("@hashedPersonID"));
  if ((unint64_t)(a5 - 1) > 3)
    v12 = CFSTR("unknown");
  else
    v12 = off_1E315C6F0[a5 - 1];
  objc_msgSend(v11, "bindStringValue:toParameterNamed:", v12, CFSTR("@flavor"));
  -[MSVSQLDatabaseTransaction resultsForStatement:](self->_transaction, "resultsForStatement:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v13, "nextObjectWithError:", &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;
  if (v15)
  {
    v16 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v15;
      _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_FAULT, "SOD: _existingAssetMatchingIdentifier stepError: %{public}@", buf, 0xCu);
    }

  }
  if (v14)
    v17 = -[MPServerObjectDatabaseAsset initWithSQLRowResult:]([MPServerObjectDatabaseAsset alloc], "initWithSQLRowResult:", v14);
  else
    v17 = 0;
  objc_msgSend(v11, "invalidate");

  return v17;
}

- (id)_existingHLSAssetMatchingIdentifier:(id)a3 hashedPersonID:(id)a4
{
  MSVSQLDatabaseTransaction *transaction;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  MPServerObjectDatabaseHLSAsset *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  transaction = self->_transaction;
  v7 = a4;
  v8 = a3;
  -[MSVSQLDatabaseTransaction statementWithString:error:](transaction, "statementWithString:error:", CFSTR("SELECT identifier, hashed_person_id, playlist_url, key_certificate_url, key_server_url, key_server_adam_id, key_server_protocol_type, is_itunes_store_stream FROM hls_assets WHERE identifier = @identifier AND hashed_person_id = @hashedPersonID"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindStringValue:toParameterNamed:", v8, CFSTR("@identifier"));

  objc_msgSend(v9, "bindStringValue:toParameterNamed:", v7, CFSTR("@hashedPersonID"));
  -[MSVSQLDatabaseTransaction resultsForStatement:](self->_transaction, "resultsForStatement:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v10, "nextObjectWithError:", &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  if (v12)
  {
    v13 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_FAULT, "SOD: _existingHLSAssetMatchingIdentifier stepError: %{public}@", buf, 0xCu);
    }

  }
  if (v11)
    v14 = -[MPServerObjectDatabaseHLSAsset initWithSQLRowResult:]([MPServerObjectDatabaseHLSAsset alloc], "initWithSQLRowResult:", v11);
  else
    v14 = 0;
  objc_msgSend(v9, "invalidate");

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateAssetURLStatement, 0);
  objc_storeStrong((id *)&self->_updateSINFStatement, 0);
  objc_storeStrong((id *)&self->_updateMiniSINFStatement, 0);
  objc_storeStrong((id *)&self->_removeRelationshipsStatement, 0);
  objc_storeStrong((id *)&self->_insertHLSAssetURLStatement, 0);
  objc_storeStrong((id *)&self->_insertAssetURLStatement, 0);
  objc_storeStrong((id *)&self->_insertObjectRelationshipStatement, 0);
  objc_storeStrong((id *)&self->_insertObjectStatement, 0);
  objc_storeStrong((id *)&self->_selectExistingObjectStatement, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
