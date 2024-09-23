@implementation IDSGroupEncryptionKeyManager

- (IDSGroupEncryptionKeyManager)initWithEncryptionContext:(id)a3 encryptionKeySize:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  IDSGroupEncryptionKeyManager *v9;
  double v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  NSMutableData *encryptionContext;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  NSMutableArray *previousEncryptingKeys;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  NSMutableArray *previousEncryptingKeyIndexes;
  const char *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  NSMutableArray *previousEncryptingKeySalts;
  const char *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  NSMutableDictionary *currentDecryptingKeysAndSalts;
  objc_super v38;
  uint8_t buf[4];
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)IDSGroupEncryptionKeyManager;
  v9 = -[IDSGroupEncryptionKeyManager init](&v38, sel_init);
  if (v9)
  {
    objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v7, v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v40 = a4;
      _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "IDSGroupEncryptionKeyManager created with encryptionKeySize %ld", buf, 0xCu);
    }

    v9->_lock._os_unfair_lock_opaque = 0;
    v15 = objc_msgSend_copy(v6, v12, v13, v14);
    encryptionContext = v9->_encryptionContext;
    v9->_encryptionContext = (NSMutableData *)v15;

    v9->_encryptionKeySize = a4;
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v17, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    previousEncryptingKeys = v9->_previousEncryptingKeys;
    v9->_previousEncryptingKeys = (NSMutableArray *)v20;

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    previousEncryptingKeyIndexes = v9->_previousEncryptingKeyIndexes;
    v9->_previousEncryptingKeyIndexes = (NSMutableArray *)v25;

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v27, v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    previousEncryptingKeySalts = v9->_previousEncryptingKeySalts;
    v9->_previousEncryptingKeySalts = (NSMutableArray *)v30;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v32, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    currentDecryptingKeysAndSalts = v9->_currentDecryptingKeysAndSalts;
    v9->_currentDecryptingKeysAndSalts = (NSMutableDictionary *)v35;

  }
  return v9;
}

- (BOOL)recvKeyMaterial:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  id v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  int Hkdf;
  const char *v26;
  uint64_t v27;
  double v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  id v33;
  const char *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  double v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  double v56;
  NSObject *v57;
  const char *v58;
  NSObject *v59;
  uint32_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  double v64;
  id v65;
  const char *v66;
  uint64_t v67;
  double v68;
  const char *v69;
  uint64_t v70;
  double v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  double v75;
  const char *v76;
  uint64_t v77;
  double v78;
  int v79;
  const char *v80;
  uint64_t v81;
  double v82;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  double v86;
  const char *v87;
  uint64_t v88;
  double v89;
  const char *v90;
  uint64_t v91;
  double v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  double v96;
  uint64_t v97;
  NSObject *v98;
  const char *v99;
  uint64_t v100;
  double v101;
  uint64_t v102;
  unint64_t encryptionKeySize;
  const char *v104;
  uint64_t v105;
  double v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  double v110;
  NSObject *v111;
  const char *v112;
  BOOL v113;
  NSObject *v114;
  uint32_t v115;
  const char *v116;
  uint64_t v117;
  double v118;
  uint64_t *p_currentEncryptingKey;
  const char *v120;
  double v121;
  const char *v122;
  double v123;
  const char *v124;
  uint64_t v125;
  double v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  double v130;
  NSUUID *v131;
  NSUUID *currentEncryptingKeyIndex;
  const char *v133;
  uint64_t v134;
  double v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  double v139;
  NSData *v140;
  NSData *currentEncryptingKeySalt;
  const char *v142;
  uint64_t v143;
  double v144;
  const char *v145;
  uint64_t v146;
  double v147;
  NSUUID *v148;
  unsigned int currentEncryptingKeyGeneration;
  NSMutableDictionary *currentDecryptingKeysAndSalts;
  void *v151;
  const char *v152;
  uint64_t v153;
  double v154;
  void *v155;
  const char *v156;
  double v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  double v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  double v165;
  void *v166;
  const char *v167;
  double v168;
  uint64_t v170;
  id v171;
  os_unfair_lock_t lock;
  uint8_t buf[4];
  _BYTE v174[14];
  __int16 v175;
  uint64_t v176;
  __int16 v177;
  uint64_t v178;
  __int16 v179;
  uint64_t v180;
  __int16 v181;
  unint64_t v182;
  __int16 v183;
  void *v184;
  uint64_t v185;

  v185 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_keySalt(v4, v5, v6, v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_bytes(v8, v9, v10, v11);
  objc_msgSend_keySalt(v4, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_length(v15, v16, v17, v18);
  objc_msgSend_bytes(self->_encryptionContext, v19, v20, v21);
  objc_msgSend_length(self->_encryptionContext, v22, v23, v24);
  Hkdf = CCKDFParametersCreateHkdf();

  objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v26, v27, v28);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_keySalt(v4, v30, v31, v32);
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v37 = objc_msgSend_bytes(v33, v34, v35, v36);
    objc_msgSend_keySalt(v4, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend_length(v41, v42, v43, v44);
    v49 = objc_msgSend_bytes(self->_encryptionContext, v46, v47, v48);
    v53 = objc_msgSend_length(self->_encryptionContext, v50, v51, v52);
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)v174 = Hkdf;
    *(_WORD *)&v174[4] = 2048;
    *(_QWORD *)&v174[6] = v37;
    v175 = 2048;
    v176 = v45;
    v177 = 2048;
    v178 = v49;
    v179 = 2048;
    v180 = v53;
    v181 = 2112;
    v182 = (unint64_t)v4;
    _os_log_impl(&dword_19B949000, v29, OS_LOG_TYPE_DEFAULT, "IDSGroupEncryptionKeyManager CCKDFParametersCreateHkdf returned %d with salt %p saltLength %lu context %p contextLength %lu key %@", buf, 0x3Au);

  }
  if (Hkdf != -4302)
  {
    if (Hkdf)
    {
      if (Hkdf == -4300)
      {
        objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v54, v55, v56);
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v58 = "IDSGroupEncryptionKeyManager CCKDFParametersCreateHkdf failed: bad params";
LABEL_10:
          v59 = v57;
          v60 = 2;
LABEL_20:
          _os_log_impl(&dword_19B949000, v59, OS_LOG_TYPE_DEFAULT, v58, buf, v60);
          goto LABEL_21;
        }
      }
      else
      {
        objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v54, v55, v56);
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v174 = Hkdf;
          v58 = "IDSGroupEncryptionKeyManager CCKDFParametersCreateHkdf failed: %ld";
          v59 = v57;
          v60 = 12;
          goto LABEL_20;
        }
      }
      goto LABEL_21;
    }
    objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v54, self->_encryptionKeySize, v56);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_keyMaterial(v4, v62, v63, v64);
    v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend_bytes(v65, v66, v67, v68);
    objc_msgSend_keyMaterial(v4, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_length(v72, v73, v74, v75);
    v57 = objc_retainAutorelease(v61);
    objc_msgSend_mutableBytes(v57, v76, v77, v78);
    v79 = CCDeriveKey();

    objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v80, v81, v82);
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_keyMaterial(v4, v84, v85, v86);
      v171 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v170 = objc_msgSend_bytes(v171, v87, v88, v89);
      objc_msgSend_keyMaterial(v4, v90, v91, v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = objc_msgSend_length(v93, v94, v95, v96);
      v98 = objc_retainAutorelease(v57);
      v102 = objc_msgSend_mutableBytes(v98, v99, v100, v101);
      encryptionKeySize = self->_encryptionKeySize;
      objc_msgSend_keyIndex(v4, v104, v105, v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110658;
      *(_DWORD *)v174 = v79;
      *(_WORD *)&v174[4] = 2048;
      *(_QWORD *)&v174[6] = 0;
      v175 = 2048;
      v176 = v170;
      v177 = 2048;
      v178 = v97;
      v179 = 2048;
      v180 = v102;
      v181 = 2048;
      v182 = encryptionKeySize;
      v183 = 2112;
      v184 = v107;
      _os_log_impl(&dword_19B949000, v83, OS_LOG_TYPE_DEFAULT, "IDSGroupEncryptionKeyManager CCDeriveKey returned %d with params %p key %p keyLength %lu derivedKey %p derivedKeyLength %ld keyID %@", buf, 0x44u);

    }
    CCKDFParametersDestroy();
    if (v79 <= -4301)
    {
      if (v79 == -4305)
      {
        objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v108, v109, v110);
        v111 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v112 = "IDSGroupEncryptionKeyManager CCDeriveKey failed: unimplemented";
          goto LABEL_28;
        }
        goto LABEL_41;
      }
      if (v79 == -4302)
      {
        objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v108, v109, v110);
        v111 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v112 = "IDSGroupEncryptionKeyManager CCDeriveKey failed: memory failure";
LABEL_28:
          v114 = v111;
          v115 = 2;
LABEL_39:
          _os_log_impl(&dword_19B949000, v114, OS_LOG_TYPE_DEFAULT, v112, buf, v115);
          goto LABEL_41;
        }
        goto LABEL_41;
      }
      goto LABEL_37;
    }
    if (v79)
    {
      if (v79 == -4300)
      {
        objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v108, v109, v110);
        v111 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v112 = "IDSGroupEncryptionKeyManager CCDeriveKey failed: bad params";
          goto LABEL_28;
        }
LABEL_41:
        v113 = 0;
LABEL_42:

        goto LABEL_43;
      }
LABEL_37:
      objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v108, v109, v110);
      v111 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v174 = v79;
        v112 = "IDSGroupEncryptionKeyManager CCDeriveKey failed: %ld";
        v114 = v111;
        v115 = 12;
        goto LABEL_39;
      }
      goto LABEL_41;
    }
    if (objc_msgSend_isGeneratedLocally(v4, v108, v109, v110))
    {
      p_currentEncryptingKey = (uint64_t *)&self->_currentEncryptingKey;
      if (!self->_currentEncryptingKey)
      {
LABEL_34:
        objc_storeStrong((id *)&self->_currentEncryptingKey, v57);
        objc_msgSend_keyIndex(v4, v124, v125, v126);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = (NSUUID *)objc_msgSend_copy(v127, v128, v129, v130);
        currentEncryptingKeyIndex = self->_currentEncryptingKeyIndex;
        self->_currentEncryptingKeyIndex = v131;

        objc_msgSend_keySalt(v4, v133, v134, v135);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v140 = (NSData *)objc_msgSend_copy(v136, v137, v138, v139);
        currentEncryptingKeySalt = self->_currentEncryptingKeySalt;
        self->_currentEncryptingKeySalt = v140;

        self->_currentEncryptingKeyGeneration = objc_msgSend_generationCounter(v4, v142, v143, v144);
        objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v145, v146, v147);
        v111 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          v148 = self->_currentEncryptingKeyIndex;
          currentEncryptingKeyGeneration = self->_currentEncryptingKeyGeneration;
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v174 = v148;
          *(_WORD *)&v174[8] = 1024;
          *(_DWORD *)&v174[10] = currentEncryptingKeyGeneration;
          _os_log_impl(&dword_19B949000, v111, OS_LOG_TYPE_DEFAULT, "IDSGroupEncryptionKeyManager New EncryptionKey:%@, generation counter: %u", buf, 0x12u);
        }
        v113 = 1;
        goto LABEL_42;
      }
      if (objc_msgSend_generationCounter(v4, v116, v117, v118) > self->_currentEncryptingKeyGeneration)
      {
        if (*p_currentEncryptingKey)
        {
          objc_msgSend_insertObject_atIndex_(self->_previousEncryptingKeys, v116, *p_currentEncryptingKey, v118, 0);
          objc_msgSend_insertObject_atIndex_(self->_previousEncryptingKeyIndexes, v120, (uint64_t)self->_currentEncryptingKeyIndex, v121, 0);
          objc_msgSend_insertObject_atIndex_(self->_previousEncryptingKeySalts, v122, (uint64_t)self->_currentEncryptingKeySalt, v123, 0);
        }
        goto LABEL_34;
      }
    }
    currentDecryptingKeysAndSalts = self->_currentDecryptingKeysAndSalts;
    v151 = (void *)MEMORY[0x1E0D36A98];
    objc_msgSend_keySalt(v4, v116, v117, v118);
    v111 = objc_claimAutoreleasedReturnValue();
    v155 = (void *)objc_msgSend_copy(v111, v152, v153, v154);
    objc_msgSend_pairWithFirst_second_(v151, v156, (uint64_t)v57, v157, v155);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_keyIndex(v4, v159, v160, v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = (void *)objc_msgSend_copy(v162, v163, v164, v165);
    objc_msgSend_setObject_forKey_(currentDecryptingKeysAndSalts, v167, (uint64_t)v158, v168, v166);

    goto LABEL_41;
  }
  objc_msgSend_RealTimeEncryptionController(IDSFoundationLog, v54, v55, v56);
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v58 = "IDSGroupEncryptionKeyManager CCKDFParametersCreateHkdf failed: memory failure";
    goto LABEL_10;
  }
LABEL_21:
  v113 = 0;
LABEL_43:

  os_unfair_lock_unlock(lock);
  return v113;
}

- (void)receiveMembershipChangedInformation:(unsigned __int8)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  const char *v6;
  double v7;
  NSData *currentEncryptingKey;
  NSData *v9;
  const char *v10;
  double v11;
  NSUUID *currentEncryptingKeyIndex;
  const char *v13;
  double v14;
  NSData *currentEncryptingKeySalt;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v3 != 3)
  {
    currentEncryptingKey = self->_currentEncryptingKey;
    if (currentEncryptingKey)
    {
      objc_msgSend_insertObject_atIndex_(self->_previousEncryptingKeys, v6, (uint64_t)currentEncryptingKey, v7, 0);
      v9 = self->_currentEncryptingKey;
      self->_currentEncryptingKey = 0;

      objc_msgSend_insertObject_atIndex_(self->_previousEncryptingKeyIndexes, v10, (uint64_t)self->_currentEncryptingKeyIndex, v11, 0);
      currentEncryptingKeyIndex = self->_currentEncryptingKeyIndex;
      self->_currentEncryptingKeyIndex = 0;

      objc_msgSend_insertObject_atIndex_(self->_previousEncryptingKeySalts, v13, (uint64_t)self->_currentEncryptingKeySalt, v14, 0);
      currentEncryptingKeySalt = self->_currentEncryptingKeySalt;
      self->_currentEncryptingKeySalt = 0;

      self->_currentEncryptingKeyGeneration = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)purgeOldKeyMaterial
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  uint64_t v8;
  double v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_removeAllObjects(self->_previousEncryptingKeys, v4, v5, v6);
  objc_msgSend_removeAllObjects(self->_previousEncryptingKeyIndexes, v7, v8, v9);
  os_unfair_lock_unlock(p_lock);
}

- (void)invalidateKeyMaterialByKeyIndexes:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  const char *v15;
  double v16;
  NSUUID *currentEncryptingKeyIndex;
  NSData *currentEncryptingKey;
  NSData *currentEncryptingKeySalt;
  NSMutableArray *previousEncryptingKeyIndexes;
  const char *v21;
  double v22;
  uint64_t v23;
  const char *v24;
  double v25;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v4;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v31, v7, v35, 16);
  if (v9)
  {
    v11 = *(_QWORD *)v32;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v5);
        v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend_isEqual_(self->_currentEncryptingKeyIndex, v8, v14, v10))
        {
          currentEncryptingKeyIndex = self->_currentEncryptingKeyIndex;
          self->_currentEncryptingKeyIndex = 0;

          currentEncryptingKey = self->_currentEncryptingKey;
          self->_currentEncryptingKey = 0;

          currentEncryptingKeySalt = self->_currentEncryptingKeySalt;
          self->_currentEncryptingKeySalt = 0;

          self->_currentEncryptingKeyGeneration = 0;
        }
        else
        {
          v27 = 0;
          v28 = &v27;
          v29 = 0x2020000000;
          v30 = -1;
          previousEncryptingKeyIndexes = self->_previousEncryptingKeyIndexes;
          v26[0] = v12;
          v26[1] = 3221225472;
          v26[2] = sub_19BA43BC8;
          v26[3] = &unk_1E3C20B00;
          v26[4] = v14;
          v26[5] = &v27;
          objc_msgSend_enumerateObjectsUsingBlock_(previousEncryptingKeyIndexes, v15, (uint64_t)v26, v16);
          v23 = v28[3];
          if (v23 == -1)
          {
            objc_msgSend_removeObjectForKey_(self->_currentDecryptingKeysAndSalts, v21, v14, v22);
          }
          else
          {
            objc_msgSend_removeObjectAtIndex_(self->_previousEncryptingKeyIndexes, v21, v23, v22);
            objc_msgSend_removeObjectAtIndex_(self->_previousEncryptingKeys, v24, v28[3], v25);
          }
          _Block_object_dispose(&v27, 8);
        }
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v31, v10, v35, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)useCurrentEncryptionkeyWithHandler:(id)a3
{
  void (**v4)(id, id, NSData *, NSUUID *);
  os_unfair_lock_s *p_lock;
  const char *v6;
  uint64_t v7;
  double v8;
  NSData *currentEncryptingKey;
  NSData *v10;
  NSData *v11;
  NSUUID *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  NSUUID *v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;

  v4 = (void (**)(id, id, NSData *, NSUUID *))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  currentEncryptingKey = self->_currentEncryptingKey;
  if (currentEncryptingKey)
  {
    v10 = currentEncryptingKey;
    v11 = self->_currentEncryptingKeySalt;
    v12 = self->_currentEncryptingKeyIndex;
  }
  else
  {
    objc_msgSend_firstObject(self->_previousEncryptingKeys, v6, v7, v8);
    v10 = (NSData *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(self->_previousEncryptingKeySalts, v13, v14, v15);
    v11 = (NSData *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(self->_previousEncryptingKeyIndexes, v16, v17, v18);
    v12 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  v19 = v12;
  if (v10)
    v20 = v12 == 0;
  else
    v20 = 1;
  v21 = v20 || v11 == 0;
  v22 = !v21;
  if (!v21)
    v4[2](v4, v10, v11, v12);

  os_unfair_lock_unlock(p_lock);
  return v22;
}

- (BOOL)useDecryptingKeyForKeyIndex:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *, id);
  os_unfair_lock_s *p_lock;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;

  v6 = a3;
  v7 = (void (**)(id, void *, void *, id))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_objectForKeyedSubscript_(self->_currentDecryptingKeysAndSalts, v9, (uint64_t)v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11;
  if (v11)
  {
    objc_msgSend_first(v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_second(v15, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v16, v20, v6);

  }
  os_unfair_lock_unlock(p_lock);

  return v15 != 0;
}

- (void)enumerateDecryptingKeysAndSaltsUsingBlock:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *currentDecryptingKeysAndSalts;
  const char *v7;
  double v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  currentDecryptingKeysAndSalts = self->_currentDecryptingKeysAndSalts;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19BA43E94;
  v10[3] = &unk_1E3C20B28;
  v9 = v4;
  v11 = v9;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(currentDecryptingKeysAndSalts, v7, (uint64_t)v10, v8);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDecryptingKeysAndSalts, 0);
  objc_storeStrong((id *)&self->_currentEncryptingKeySalt, 0);
  objc_storeStrong((id *)&self->_currentEncryptingKeyIndex, 0);
  objc_storeStrong((id *)&self->_currentEncryptingKey, 0);
  objc_storeStrong((id *)&self->_previousEncryptingKeySalts, 0);
  objc_storeStrong((id *)&self->_previousEncryptingKeyIndexes, 0);
  objc_storeStrong((id *)&self->_previousEncryptingKeys, 0);
  objc_storeStrong((id *)&self->_encryptionContext, 0);
}

@end
