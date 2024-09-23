@implementation CHEncoderDecoderNetwork

- (CHEncoderDecoderNetwork)initWithModelNames:(id)a3 decoderName:(id)a4
{
  id v6;
  id v7;
  CHEncoderDecoderNetwork *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CHEncoderDecoderNetwork *v13;
  uint64_t v14;
  CHSingletonMLModel *encoderModel;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CHSingletonMLModel *decoderModel;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *codeMap;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  NSSet *activeAlphabet;
  NSSet *declaredVariables;
  __int16 v47[8];
  objc_super v48;

  v6 = a3;
  v7 = a4;
  v48.receiver = self;
  v48.super_class = (Class)CHEncoderDecoderNetwork;
  v8 = -[CHEncoderDecoderNetwork init](&v48, sel_init);
  v13 = v8;
  if (v8)
  {
    objc_msgSend_loadModel_(v8, v9, (uint64_t)v6, v10, v11, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    encoderModel = v13->_encoderModel;
    v13->_encoderModel = (CHSingletonMLModel *)v14;

    objc_msgSend_loadModel_(v13, v16, (uint64_t)v7, v17, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    decoderModel = v13->_decoderModel;
    v13->_decoderModel = (CHSingletonMLModel *)v20;

    objc_msgSend_loadCodemap_(v13, v22, (uint64_t)v6, v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    codeMap = v13->_codeMap;
    v13->_codeMap = (NSArray *)v26;

    objc_msgSend_codeMap(v13, v28, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_eosIndex = objc_msgSend_indexOfObject_(v33, v34, (uint64_t)CFSTR("<EOS>"), v35, v36, v37);

    if (v13->_eosIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v43 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      {
        v47[0] = 0;
        _os_log_impl(&dword_1BE607000, v43, OS_LOG_TYPE_FAULT, "<EOS> symbol not found in codemap", (uint8_t *)v47, 2u);
      }

    }
    *(_OWORD *)&v13->_renderSymbolSize = xmmword_1BE8E0B50;
    *(_OWORD *)&v13->_maxInputHeight = xmmword_1BE8E0B60;
    *(_OWORD *)&v13->_maxInputWidth = xmmword_1BE8E0B70;
    *(_OWORD *)&v13->_enlargeSingleDotBy = xmmword_1BE8D6A60;
    v13->_numOutputClasses = objc_msgSend_count(v13->_codeMap, v38, v39, v40, v41, v42);
    v13->_segmentationAttThreshold = 0.01;
    *(_OWORD *)&v13->_maxDecodingSteps = xmmword_1BE8E0B80;
    activeAlphabet = v13->_activeAlphabet;
    v13->_activeAlphabet = 0;

    declaredVariables = v13->_declaredVariables;
    v13->_declaredVariables = 0;

  }
  return v13;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  objc_super v34;

  objc_msgSend_encoderModel(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modelKey(v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_releaseModelWithKey_(CHSingletonMLModel, v14, (uint64_t)v13, v15, v16, v17);

  objc_msgSend_decoderModel(self, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modelKey(v23, v24, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_releaseModelWithKey_(CHSingletonMLModel, v30, (uint64_t)v29, v31, v32, v33);

  v34.receiver = self;
  v34.super_class = (Class)CHEncoderDecoderNetwork;
  -[CHEncoderDecoderNetwork dealloc](&v34, sel_dealloc);
}

- (id)loadModel:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  size_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void **v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v42;
  void *__dst[2];
  int64_t v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  char __s[1024];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  v9 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6, v7, v8);
  pathForResource(v9, 0, (UInt8 *)__s);
  v10 = strlen(__s);
  if (v10 >= 0x7FFFFFFFFFFFFFF8)
    sub_1BE61F1B4();
  v14 = (void *)v10;
  if (v10 >= 0x17)
  {
    v16 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v16 = v10 | 7;
    v17 = v16 + 1;
    v15 = (void **)operator new(v16 + 1);
    __dst[1] = v14;
    v44 = v17 | 0x8000000000000000;
    __dst[0] = v15;
    goto LABEL_8;
  }
  HIBYTE(v44) = v10;
  v15 = __dst;
  if (v10)
LABEL_8:
    memcpy(v15, __s, (size_t)v14);
  *((_BYTE *)v14 + (_QWORD)v15) = 0;
  if (v44 >= 0)
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v11, (uint64_t)__dst, 4, v12, v13);
  else
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v11, (uint64_t)__dst[0], 4, v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v19, (uint64_t)v18, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc(MEMORY[0x1E0C9E958]);
  v29 = (void *)objc_msgSend_initWithComputeUnits_(v24, v25, 0, v26, v27, v28);
  v42 = 0;
  objc_msgSend_modelWithContentsOfURL_configuration_error_(CHSingletonMLModel, v30, (uint64_t)v23, (uint64_t)v29, (uint64_t)&v42, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v42;
  if (!v32)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v34 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend_localizedDescription(v33, v35, v36, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v46 = v3;
      v47 = 2112;
      v48 = v40;
      _os_log_impl(&dword_1BE607000, v34, OS_LOG_TYPE_FAULT, "Error loading model %@: %@", buf, 0x16u);

    }
  }

  if (SHIBYTE(v44) < 0)
    operator delete(__dst[0]);

  return v32;
}

- (id)loadCodemap:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  size_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void **v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSData *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  void *v61;
  uint8_t v63[16];
  void *__dst[2];
  int64_t v65;
  char __s[1024];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  v9 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6, v7, v8);
  pathForResource(v9, 0, (UInt8 *)__s);
  v10 = strlen(__s);
  if (v10 >= 0x7FFFFFFFFFFFFFF8)
    sub_1BE61F1B4();
  v14 = (void *)v10;
  if (v10 >= 0x17)
  {
    v16 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v16 = v10 | 7;
    v17 = v16 + 1;
    v15 = (void **)operator new(v16 + 1);
    __dst[1] = v14;
    v65 = v17 | 0x8000000000000000;
    __dst[0] = v15;
    goto LABEL_8;
  }
  HIBYTE(v65) = v10;
  v15 = __dst;
  if (v10)
LABEL_8:
    memcpy(v15, __s, (size_t)v14);
  *((_BYTE *)v14 + (_QWORD)v15) = 0;
  if (v65 >= 0)
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v11, (uint64_t)__dst, 4, v12, v13);
  else
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v11, (uint64_t)__dst[0], 4, v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByDeletingLastPathComponent(v18, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v24, v25, (uint64_t)CFSTR("codemap.json.lzfse"), v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E0C99D50], v30, (uint64_t)v29, v31, v32, v33);
  v34 = (NSData *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_stringByAppendingString_(v29, v36, (uint64_t)CFSTR(".size"), v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithContentsOfFile_encoding_error_(v35, v41, (uint64_t)v40, 4, 0, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v49 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_1BE607000, v49, OS_LOG_TYPE_FAULT, "Failed to load math codemap size", v63, 2u);
    }

  }
  v50 = objc_msgSend_integerValue(v43, v44, v45, v46, v47, v48);
  uncompressLZFSEData(v34, v50);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v53)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v54 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_1BE607000, v54, OS_LOG_TYPE_FAULT, "Failed to load math codemap", v63, 2u);
    }

  }
  objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v51, (uint64_t)v53, 1, 0, v52);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v59)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v60 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_1BE607000, v60, OS_LOG_TYPE_FAULT, "Failed to parse the JSON math codemap", v63, 2u);
    }

  }
  objc_msgSend_objectForKeyedSubscript_(v59, v55, (uint64_t)CFSTR("codemap"), v56, v57, v58);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (SHIBYTE(v65) < 0)
    operator delete(__dst[0]);

  return v61;
}

- (void)setUpMathDecoder:(void *)a3 imageCompressed:(void *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v7;
  CHEncoderDecoderNetwork *v8;
  float v9;
  NSSet *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  NSSet *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  id v57;
  CHEncoderDecoderNetwork *v58;
  uint64_t *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  size_t v66;
  void *v67;
  void **v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void **v81;
  void *v82;
  void **v83;
  void *v84;
  void **v85;
  void *v86;
  void **v87;
  void **v88;
  void **v89;
  void *v90;
  void *__dst[2];
  unint64_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  void *__p[2];
  void *v98[2];
  int v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  int v110;
  __int128 v111;
  __int128 v112;
  int v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v7 = (uint64_t *)a3;
  v8 = self;
  v117 = *MEMORY[0x1E0C80C00];
  objc_msgSend_segmentationAttThreshold(self, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  sub_1BE773880(v7, (uint64_t **)a4, v9);
  v111 = 0u;
  v112 = 0u;
  v113 = 1065353216;
  v108 = 0u;
  v109 = 0u;
  v110 = 1065353216;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v10 = v8->_declaredVariables;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v104, (uint64_t)v116, 16, v12);
  if (v13)
  {
    v14 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v105 != v14)
          objc_enumerationMutation(v10);
        v16 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v104 + 1) + 8 * i));
        v22 = (const char *)objc_msgSend_UTF8String(v16, v17, v18, v19, v20, v21);
        sub_1BE89D5E4((uint64_t)&v111, v22);
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v23, (uint64_t)&v104, (uint64_t)v116, 16, v24);
    }
    while (v13);
  }

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v25 = v8->_definedMathFunctionNameSet;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v100, (uint64_t)v115, 16, v27);
  if (v28)
  {
    v29 = *(_QWORD *)v101;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v101 != v29)
          objc_enumerationMutation(v25);
        v31 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v100 + 1) + 8 * j));
        v37 = (const char *)objc_msgSend_UTF8String(v31, v32, v33, v34, v35, v36);
        sub_1BE89D5E4((uint64_t)&v108, v37);
      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v38, (uint64_t)&v100, (uint64_t)v115, 16, v39);
    }
    while (v28);
  }

  v40 = objc_alloc(MEMORY[0x1E0D09EC8]);
  v45 = (void *)objc_msgSend_initWithLocales_(v40, v41, (uint64_t)v8->_recognitionLocales, v42, v43, v44);
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v98 = 0u;
  v99 = 1065353216;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v90 = v45;
  objc_msgSend_conversionVerbs(v45, v46, v47, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v93, (uint64_t)v114, 16, v53);
  if (v54)
  {
    v55 = *(_QWORD *)v94;
    do
    {
      for (k = 0; k != v54; ++k)
      {
        if (*(_QWORD *)v94 != v55)
          objc_enumerationMutation(v51);
        v57 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v93 + 1) + 8 * k));
        v58 = v8;
        v59 = v7;
        v65 = (const char *)objc_msgSend_UTF8String(v57, v60, v61, v62, v63, v64);
        v66 = strlen(v65);
        if (v66 >= 0x7FFFFFFFFFFFFFF8)
          sub_1BE61F1B4();
        v67 = (void *)v66;
        if (v66 >= 0x17)
        {
          v69 = (v66 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v66 | 7) != 0x17)
            v69 = v66 | 7;
          v70 = v69 + 1;
          v68 = (void **)operator new(v69 + 1);
          __dst[1] = v67;
          v92 = v70 | 0x8000000000000000;
          __dst[0] = v68;
LABEL_28:
          memmove(v68, v65, (size_t)v67);
          goto LABEL_29;
        }
        HIBYTE(v92) = v66;
        v68 = __dst;
        if (v66)
          goto LABEL_28;
LABEL_29:
        *((_BYTE *)v67 + (_QWORD)v68) = 0;
        sub_1BE77F1F0((uint64_t)__p, (uint64_t)__dst, (uint64_t)__dst);
        if (SHIBYTE(v92) < 0)
          operator delete(__dst[0]);
        v7 = v59;
        v8 = v58;
      }
      v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v71, (uint64_t)&v93, (uint64_t)v114, 16, v72);
    }
    while (v54);
  }

  sub_1BE773990(v7, (uint64_t)&v111, (uint64_t)&v108, (uint64_t)__p, v90);
  objc_msgSend_setUpDecoderOutOfAlphabetAlternatives_(v8, v73, (uint64_t)v7, v74, v75, v76);
  objc_msgSend_setUpDecoderConfusableAlternatives_(v8, v77, (uint64_t)v7, v78, v79, v80);
  CoreHandwriting::CHMathBeamDecoder::setLatexSyntaxScorer((CoreHandwriting::CHMathBeamDecoder *)v7);
  v81 = (void **)v98[0];
  if (v98[0])
  {
    do
    {
      v87 = (void **)*v81;
      if (*((char *)v81 + 39) < 0)
        operator delete(v81[2]);
      operator delete(v81);
      v81 = v87;
    }
    while (v87);
  }
  v82 = __p[0];
  __p[0] = 0;
  if (v82)
    operator delete(v82);

  v83 = (void **)v109;
  if ((_QWORD)v109)
  {
    do
    {
      v88 = (void **)*v83;
      if (*((char *)v83 + 39) < 0)
        operator delete(v83[2]);
      operator delete(v83);
      v83 = v88;
    }
    while (v88);
  }
  v84 = (void *)v108;
  *(_QWORD *)&v108 = 0;
  if (v84)
    operator delete(v84);
  v85 = (void **)v112;
  if ((_QWORD)v112)
  {
    do
    {
      v89 = (void **)*v85;
      if (*((char *)v85 + 39) < 0)
        operator delete(v85[2]);
      operator delete(v85);
      v85 = v89;
    }
    while (v89);
  }
  v86 = (void *)v111;
  *(_QWORD *)&v111 = 0;
  if (v86)
    operator delete(v86);
}

- (int)getIndexInCodemap:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;

  v4 = a3;
  objc_msgSend_codeMap(self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_indexOfObject_(v10, v11, (uint64_t)v4, v12, v13, v14);

  return v15;
}

- (void)setUpDecoderOutOfAlphabetAlternatives:(void *)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  int IndexInCodemap;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _DWORD *v23;
  _DWORD *v24;
  _QWORD *v25;
  int v26;
  int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _DWORD *v37;
  _DWORD *v38;
  _QWORD *v39;
  int v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  _DWORD *v50;
  _DWORD *v51;
  _QWORD *v52;
  int v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  _DWORD *v63;
  _DWORD *v64;
  _QWORD *v65;
  int v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  _DWORD *v76;
  _DWORD *v77;
  _QWORD *v78;
  int v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  _DWORD *v99;
  _DWORD *v100;
  _QWORD *v101;
  int v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  _DWORD *v108;
  _DWORD *v109;
  _QWORD *v110;
  size_t prime;
  void *v112;
  BOOL v113;
  unint64_t v114;
  uint8x8_t v115;
  uint64_t v116;
  int *v117;
  _QWORD *v118;
  _QWORD *v119;
  void *v120;
  _QWORD *v121;
  _QWORD *v122;
  void *v123;
  _QWORD *v124;
  void *v125;
  _QWORD *v126;
  void *v127;
  void *v129[2];
  void *__p[2];
  float v131;
  int v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  size_t __n[2];
  void *v138[2];
  int v139;
  void *v140[2];
  void *v141[2];
  int v142;
  _BYTE v143[128];
  uint64_t v144;

  v144 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)v140 = 0u;
  *(_OWORD *)v141 = 0u;
  v142 = 1065353216;
  *(_OWORD *)__n = 0u;
  *(_OWORD *)v138 = 0u;
  v139 = 1065353216;
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E7828100, a2, (uint64_t)&v133, (uint64_t)v143, 16, v3);
  if (v9)
  {
    v10 = *(_QWORD *)v134;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v134 != v10)
          objc_enumerationMutation(&unk_1E7828100);
        v12 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * i);
        IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v5, (uint64_t)CFSTR("0"), v6, v7, v8);
        v132 = objc_msgSend_getIndexInCodemap_(self, v14, v12, v15, v16, v17);
        v22 = sub_1BE89DAE0((uint64_t *)v140, v132, &v132);
        v23 = (_DWORD *)v22[3];
        v24 = (_DWORD *)v22[5];
        if (v24 == v23)
        {
          if (v24)
          {
            v22[4] = v24;
            operator delete(v24);
            v22[3] = 0;
            v22[4] = 0;
            v22[5] = 0;
          }
          v23 = operator new(4uLL);
          v22[4] = v23;
          v25 = v22 + 4;
          *(v25 - 1) = v23;
          v25[1] = v23 + 1;
        }
        else
        {
          v25 = v22 + 4;
        }
        *v23 = IndexInCodemap;
        *v25 = v23 + 1;
        v26 = objc_msgSend_getIndexInCodemap_(self, v18, v12, v19, v20, v21);
        sub_1BE89DFA4((uint64_t)__n, v26, v26);
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E7828100, v5, (uint64_t)&v133, (uint64_t)v143, 16, v8);
    }
    while (v9);
  }
  v27 = objc_msgSend_getIndexInCodemap_(self, v5, (uint64_t)CFSTR("f"), v6, v7, v8);
  v132 = objc_msgSend_getIndexInCodemap_(self, v28, (uint64_t)CFSTR("\\int"), v29, v30, v31);
  v36 = sub_1BE89DAE0((uint64_t *)v140, v132, &v132);
  v37 = (_DWORD *)v36[3];
  v38 = (_DWORD *)v36[5];
  if (v38 == v37)
  {
    if (v38)
    {
      v36[4] = v38;
      operator delete(v38);
      v36[3] = 0;
      v36[4] = 0;
      v36[5] = 0;
    }
    v37 = operator new(4uLL);
    v36[4] = v37;
    v39 = v36 + 4;
    *(v39 - 1) = v37;
    v39[1] = v37 + 1;
  }
  else
  {
    v39 = v36 + 4;
  }
  *v37 = v27;
  *v39 = v37 + 1;
  v40 = objc_msgSend_getIndexInCodemap_(self, v32, (uint64_t)CFSTR("1"), v33, v34, v35);
  v132 = objc_msgSend_getIndexInCodemap_(self, v41, (uint64_t)CFSTR("\\setminus"), v42, v43, v44);
  v49 = sub_1BE89DAE0((uint64_t *)v140, v132, &v132);
  v50 = (_DWORD *)v49[3];
  v51 = (_DWORD *)v49[5];
  if (v51 == v50)
  {
    if (v51)
    {
      v49[4] = v51;
      operator delete(v51);
      v49[3] = 0;
      v49[4] = 0;
      v49[5] = 0;
    }
    v50 = operator new(4uLL);
    v49[4] = v50;
    v52 = v49 + 4;
    *(v52 - 1) = v50;
    v52[1] = v50 + 1;
  }
  else
  {
    v52 = v49 + 4;
  }
  *v50 = v40;
  *v52 = v50 + 1;
  v53 = objc_msgSend_getIndexInCodemap_(self, v45, (uint64_t)CFSTR("("), v46, v47, v48);
  v132 = objc_msgSend_getIndexInCodemap_(self, v54, (uint64_t)CFSTR("\\lbrack"), v55, v56, v57);
  v62 = sub_1BE89DAE0((uint64_t *)v140, v132, &v132);
  v63 = (_DWORD *)v62[3];
  v64 = (_DWORD *)v62[5];
  if (v64 == v63)
  {
    if (v64)
    {
      v62[4] = v64;
      operator delete(v64);
      v62[3] = 0;
      v62[4] = 0;
      v62[5] = 0;
    }
    v63 = operator new(4uLL);
    v62[4] = v63;
    v65 = v62 + 4;
    *(v65 - 1) = v63;
    v65[1] = v63 + 1;
  }
  else
  {
    v65 = v62 + 4;
  }
  *v63 = v53;
  *v65 = v63 + 1;
  v66 = objc_msgSend_getIndexInCodemap_(self, v58, (uint64_t)CFSTR(")"), v59, v60, v61);
  v132 = objc_msgSend_getIndexInCodemap_(self, v67, (uint64_t)CFSTR("\\rbrack"), v68, v69, v70);
  v75 = sub_1BE89DAE0((uint64_t *)v140, v132, &v132);
  v76 = (_DWORD *)v75[3];
  v77 = (_DWORD *)v75[5];
  if (v77 == v76)
  {
    if (v77)
    {
      v75[4] = v77;
      operator delete(v77);
      v75[3] = 0;
      v75[4] = 0;
      v75[5] = 0;
    }
    v76 = operator new(4uLL);
    v75[4] = v76;
    v78 = v75 + 4;
    *(v78 - 1) = v76;
    v78[1] = v76 + 1;
  }
  else
  {
    v78 = v75 + 4;
  }
  *v76 = v66;
  *v78 = v76 + 1;
  v79 = objc_msgSend_getIndexInCodemap_(self, v71, (uint64_t)CFSTR("\\lbrack"), v72, v73, v74);
  sub_1BE89DFA4((uint64_t)__n, v79, v79);
  v84 = objc_msgSend_getIndexInCodemap_(self, v80, (uint64_t)CFSTR("\\rbrack"), v81, v82, v83);
  sub_1BE89DFA4((uint64_t)__n, v84, v84);
  v89 = objc_msgSend_getIndexInCodemap_(self, v85, (uint64_t)CFSTR("\\sum"), v86, v87, v88);
  v132 = objc_msgSend_getIndexInCodemap_(self, v90, (uint64_t)CFSTR("\\Sigma"), v91, v92, v93);
  v98 = sub_1BE89DAE0((uint64_t *)v140, v132, &v132);
  v99 = (_DWORD *)v98[3];
  v100 = (_DWORD *)v98[5];
  if (v100 == v99)
  {
    if (v100)
    {
      v98[4] = v100;
      operator delete(v100);
      v98[3] = 0;
      v98[4] = 0;
      v98[5] = 0;
    }
    v99 = operator new(4uLL);
    v98[4] = v99;
    v101 = v98 + 4;
    *(v101 - 1) = v99;
    v101[1] = v99 + 1;
  }
  else
  {
    v101 = v98 + 4;
  }
  *v99 = v89;
  *v101 = v99 + 1;
  v102 = objc_msgSend_getIndexInCodemap_(self, v94, (uint64_t)CFSTR("\\prod"), v95, v96, v97);
  v132 = objc_msgSend_getIndexInCodemap_(self, v103, (uint64_t)CFSTR("\\Pi"), v104, v105, v106);
  v107 = sub_1BE89DAE0((uint64_t *)v140, v132, &v132);
  v108 = (_DWORD *)v107[3];
  v109 = (_DWORD *)v107[5];
  if (v109 == v108)
  {
    if (v109)
    {
      v107[4] = v109;
      operator delete(v109);
      v107[3] = 0;
      v107[4] = 0;
      v107[5] = 0;
    }
    v108 = operator new(4uLL);
    v107[4] = v108;
    v110 = v107 + 4;
    *(v110 - 1) = v108;
    v110[1] = v108 + 1;
  }
  else
  {
    v110 = v107 + 4;
  }
  *v108 = v102;
  *v110 = v108 + 1;
  *(_OWORD *)v129 = 0u;
  *(_OWORD *)__p = 0u;
  v131 = *(float *)&v139;
  prime = __n[1];
  if (__n[1] == 1)
  {
    prime = 2;
LABEL_59:
    sub_1BE61F23C((uint64_t)v129, prime);
    goto LABEL_60;
  }
  if ((__n[1] & (__n[1] - 1)) != 0)
  {
    prime = std::__next_prime(__n[1]);
    v112 = v129[1];
    v113 = (void *)prime >= v129[1];
    if ((void *)prime > v129[1])
      goto LABEL_59;
  }
  else
  {
    v112 = 0;
    v113 = 1;
    if (__n[1])
      goto LABEL_59;
  }
  if (!v113)
  {
    v114 = vcvtps_u32_f32((float)(unint64_t)__p[1] / v131);
    if ((unint64_t)v112 < 3
      || (v115 = (uint8x8_t)vcnt_s8((int8x8_t)v112), v115.i16[0] = vaddlv_u8(v115), v115.u32[0] > 1uLL))
    {
      v114 = std::__next_prime(v114);
    }
    else
    {
      v116 = 1 << -(char)__clz(v114 - 1);
      if (v114 >= 2)
        v114 = v116;
    }
    if (prime <= v114)
      prime = v114;
    if (prime < (unint64_t)v112)
      goto LABEL_59;
  }
LABEL_60:
  v117 = (int *)v138[0];
  if (v138[0])
  {
    do
    {
      sub_1BE7C9EB0((uint64_t)v129, v117 + 4, v117 + 4);
      v117 = *(int **)v117;
    }
    while (v117);
  }
  if ((char *)a3 + 560 != (char *)v140)
  {
    *((_DWORD *)a3 + 148) = v142;
    sub_1BE77F7F8((_QWORD *)a3 + 70, (_QWORD *)v141[0], 0);
  }
  if ((char *)a3 + 600 != (char *)v129)
  {
    *((float *)a3 + 158) = v131;
    sub_1BE77FFA8((_QWORD *)a3 + 75, (uint64_t *)__p[0], 0);
  }
  v118 = __p[0];
  if (__p[0])
  {
    do
    {
      v119 = (_QWORD *)*v118;
      operator delete(v118);
      v118 = v119;
    }
    while (v119);
  }
  v120 = v129[0];
  v129[0] = 0;
  if (v120)
    operator delete(v120);
  v121 = v138[0];
  if (v138[0])
  {
    do
    {
      v122 = (_QWORD *)*v121;
      operator delete(v121);
      v121 = v122;
    }
    while (v122);
  }
  v123 = (void *)__n[0];
  __n[0] = 0;
  if (v123)
    operator delete(v123);
  v124 = v141[0];
  if (v141[0])
  {
    do
    {
      v126 = (_QWORD *)*v124;
      v127 = (void *)v124[3];
      if (v127)
      {
        v124[4] = v127;
        operator delete(v127);
      }
      operator delete(v124);
      v124 = v126;
    }
    while (v126);
  }
  v125 = v140[0];
  v140[0] = 0;
  if (v125)
    operator delete(v125);
}

- (void)setUpDecoderConfusableAlternatives:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _QWORD *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int8x8_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  _QWORD *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  _QWORD *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  _QWORD *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  _QWORD *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  _QWORD *v160;
  size_t prime;
  BOOL v162;
  unint64_t v163;
  uint8x8_t v164;
  uint64_t v165;
  int *v166;
  unint64_t v167;
  int8x8_t v168;
  uint8x8_t v169;
  uint64_t **v170;
  uint64_t *v171;
  unint64_t v172;
  unint64_t v173;
  _QWORD *v174;
  int v175;
  _BYTE *v176;
  _BYTE *v177;
  uint64_t v178;
  char *v179;
  size_t v180;
  float v181;
  _BOOL8 v182;
  unint64_t v183;
  unint64_t v184;
  size_t v185;
  unint64_t v186;
  uint8x8_t v187;
  uint64_t v188;
  unint64_t v189;
  _QWORD *v190;
  _QWORD *v191;
  unint64_t v192;
  _QWORD *v193;
  void *v194;
  _QWORD *v195;
  void *v196;
  _QWORD *v197;
  void *v198;
  _QWORD *v199;
  void *v200;
  float *v201;
  void *__p[2];
  void *v203[2];
  float v204;
  int IndexInCodemap;
  size_t __n[2];
  void *v207[2];
  int v208;
  _QWORD *v209;
  void **v210;
  _DWORD v211[2];
  uint64_t v212;

  v212 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)__n = 0u;
  *(_OWORD *)v207 = 0u;
  v208 = 1065353216;
  LODWORD(v209) = objc_msgSend_getIndexInCodemap_(self, a2, (uint64_t)CFSTR("1"), v3, v4, v5);
  HIDWORD(v209) = 1028443341;
  LODWORD(v210) = objc_msgSend_getIndexInCodemap_(self, v8, (uint64_t)CFSTR("l"), v9, v10, v11);
  HIDWORD(v210) = 1008981770;
  v211[0] = objc_msgSend_getIndexInCodemap_(self, v12, (uint64_t)CFSTR("I"), v13, v14, v15);
  v211[1] = 1008981770;
  IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v16, (uint64_t)CFSTR("|"), v17, v18, v19);
  v20 = sub_1BE89E288((uint64_t)__n, IndexInCodemap, &IndexInCodemap);
  sub_1BE89E598((uint64_t)(v20 + 3), (char *)&v209, (char *)&v212, 3uLL);
  LODWORD(v209) = objc_msgSend_getIndexInCodemap_(self, v21, (uint64_t)CFSTR("|"), v22, v23, v24);
  HIDWORD(v209) = 1008981770;
  IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v25, (uint64_t)CFSTR("1"), v26, v27, v28);
  v29 = sub_1BE89E288((uint64_t)__n, IndexInCodemap, &IndexInCodemap);
  sub_1BE89E598((uint64_t)(v29 + 3), (char *)&v209, (char *)&v210, 1uLL);
  LODWORD(v209) = objc_msgSend_getIndexInCodemap_(self, v30, (uint64_t)CFSTR("1"), v31, v32, v33);
  HIDWORD(v209) = 1008981770;
  IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v34, (uint64_t)CFSTR("/"), v35, v36, v37);
  v38 = sub_1BE89E288((uint64_t)__n, IndexInCodemap, &IndexInCodemap);
  sub_1BE89E598((uint64_t)(v38 + 3), (char *)&v209, (char *)&v210, 1uLL);
  LODWORD(v209) = objc_msgSend_getIndexInCodemap_(self, v39, (uint64_t)CFSTR("."), v40, v41, v42);
  HIDWORD(v209) = 1022739087;
  IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v43, (uint64_t)CFSTR("\\cdot"), v44, v45, v46);
  v47 = sub_1BE89E288((uint64_t)__n, IndexInCodemap, &IndexInCodemap);
  sub_1BE89E598((uint64_t)(v47 + 3), (char *)&v209, (char *)&v210, 1uLL);
  LODWORD(v209) = objc_msgSend_getIndexInCodemap_(self, v48, (uint64_t)CFSTR("\\cdot"), v49, v50, v51);
  HIDWORD(v209) = 1008981770;
  IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v52, (uint64_t)CFSTR("."), v53, v54, v55);
  v56 = sub_1BE89E288((uint64_t)__n, IndexInCodemap, &IndexInCodemap);
  sub_1BE89E598((uint64_t)(v56 + 3), (char *)&v209, (char *)&v210, 1uLL);
  LODWORD(v209) = objc_msgSend_getIndexInCodemap_(self, v57, (uint64_t)CFSTR("."), v58, v59, v60);
  HIDWORD(v209) = 1022739087;
  IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v61, (uint64_t)CFSTR(","), v62, v63, v64);
  v65 = sub_1BE89E288((uint64_t)__n, IndexInCodemap, &IndexInCodemap);
  sub_1BE89E598((uint64_t)(v65 + 3), (char *)&v209, (char *)&v210, 1uLL);
  LODWORD(v209) = objc_msgSend_getIndexInCodemap_(self, v66, (uint64_t)CFSTR(","), v67, v68, v69);
  HIDWORD(v209) = 1008981770;
  IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v70, (uint64_t)CFSTR("."), v71, v72, v73);
  v74 = sub_1BE89E288((uint64_t)__n, IndexInCodemap, &IndexInCodemap);
  sub_1BE89E598((uint64_t)(v74 + 3), (char *)&v209, (char *)&v210, 1uLL);
  LODWORD(v209) = objc_msgSend_getIndexInCodemap_(self, v75, (uint64_t)CFSTR("2"), v76, v77, v78);
  HIDWORD(v209) = 1008981770;
  IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v79, (uint64_t)CFSTR("z"), v80, v81, v82);
  v83 = sub_1BE89E288((uint64_t)__n, IndexInCodemap, &IndexInCodemap);
  sub_1BE89E598((uint64_t)(v83 + 3), (char *)&v209, (char *)&v210, 1uLL);
  LODWORD(v209) = objc_msgSend_getIndexInCodemap_(self, v84, (uint64_t)CFSTR("2"), v85, v86, v87);
  HIDWORD(v209) = 1008981770;
  IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v88, (uint64_t)CFSTR("Z"), v89, v90, v91);
  v92 = sub_1BE89E288((uint64_t)__n, IndexInCodemap, &IndexInCodemap);
  sub_1BE89E598((uint64_t)(v92 + 3), (char *)&v209, (char *)&v210, 1uLL);
  LODWORD(v209) = objc_msgSend_getIndexInCodemap_(self, v93, (uint64_t)CFSTR("5"), v94, v95, v96);
  HIDWORD(v209) = 1008981770;
  IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v97, (uint64_t)CFSTR("s"), v98, v99, v100);
  v101 = sub_1BE89E288((uint64_t)__n, IndexInCodemap, &IndexInCodemap);
  sub_1BE89E598((uint64_t)(v101 + 3), (char *)&v209, (char *)&v210, 1uLL);
  LODWORD(v209) = objc_msgSend_getIndexInCodemap_(self, v102, (uint64_t)CFSTR("5"), v103, v104, v105);
  HIDWORD(v209) = 1008981770;
  IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v106, (uint64_t)CFSTR("S"), v107, v108, v109);
  v110 = sub_1BE89E288((uint64_t)__n, IndexInCodemap, &IndexInCodemap);
  sub_1BE89E598((uint64_t)(v110 + 3), (char *)&v209, (char *)&v210, 1uLL);
  v115 = (int8x8_t)1000593162;
  LODWORD(v209) = objc_msgSend_getIndexInCodemap_(self, v111, (uint64_t)CFSTR("s"), v112, v113, v114);
  HIDWORD(v209) = 1000593162;
  LODWORD(v210) = objc_msgSend_getIndexInCodemap_(self, v116, (uint64_t)CFSTR("S"), v117, v118, v119);
  HIDWORD(v210) = 1000593162;
  IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v120, (uint64_t)CFSTR("5"), v121, v122, v123);
  v124 = sub_1BE89E288((uint64_t)__n, IndexInCodemap, &IndexInCodemap);
  sub_1BE89E598((uint64_t)(v124 + 3), (char *)&v209, (char *)v211, 2uLL);
  LODWORD(v209) = objc_msgSend_getIndexInCodemap_(self, v125, (uint64_t)CFSTR("6"), v126, v127, v128);
  HIDWORD(v209) = 1022739087;
  IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v129, (uint64_t)CFSTR("b"), v130, v131, v132);
  v133 = sub_1BE89E288((uint64_t)__n, IndexInCodemap, &IndexInCodemap);
  sub_1BE89E598((uint64_t)(v133 + 3), (char *)&v209, (char *)&v210, 1uLL);
  LODWORD(v209) = objc_msgSend_getIndexInCodemap_(self, v134, (uint64_t)CFSTR("b"), v135, v136, v137);
  HIDWORD(v209) = 1000593162;
  IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v138, (uint64_t)CFSTR("6"), v139, v140, v141);
  v142 = sub_1BE89E288((uint64_t)__n, IndexInCodemap, &IndexInCodemap);
  sub_1BE89E598((uint64_t)(v142 + 3), (char *)&v209, (char *)&v210, 1uLL);
  LODWORD(v209) = objc_msgSend_getIndexInCodemap_(self, v143, (uint64_t)CFSTR("9"), v144, v145, v146);
  HIDWORD(v209) = 1008981770;
  IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v147, (uint64_t)CFSTR("g"), v148, v149, v150);
  v151 = sub_1BE89E288((uint64_t)__n, IndexInCodemap, &IndexInCodemap);
  sub_1BE89E598((uint64_t)(v151 + 3), (char *)&v209, (char *)&v210, 1uLL);
  LODWORD(v209) = objc_msgSend_getIndexInCodemap_(self, v152, (uint64_t)CFSTR("g"), v153, v154, v155);
  HIDWORD(v209) = 1000593162;
  IndexInCodemap = objc_msgSend_getIndexInCodemap_(self, v156, (uint64_t)CFSTR("9"), v157, v158, v159);
  v160 = sub_1BE89E288((uint64_t)__n, IndexInCodemap, &IndexInCodemap);
  sub_1BE89E598((uint64_t)(v160 + 3), (char *)&v209, (char *)&v210, 1uLL);
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v203 = 0u;
  v204 = *(float *)&v208;
  prime = __n[1];
  if (__n[1] == 1)
  {
    prime = 2;
LABEL_17:
    sub_1BE61F23C((uint64_t)__p, prime);
    goto LABEL_18;
  }
  if ((__n[1] & (__n[1] - 1)) != 0)
  {
    prime = std::__next_prime(__n[1]);
    v115 = (int8x8_t)__p[1];
    v162 = (void *)prime >= __p[1];
    if ((void *)prime > __p[1])
      goto LABEL_17;
  }
  else
  {
    v115 = 0;
    v162 = 1;
    if (__n[1])
      goto LABEL_17;
  }
  if (!v162)
  {
    v163 = vcvtps_u32_f32((float)(unint64_t)v203[1] / v204);
    if (*(_QWORD *)&v115 < 3uLL || (v164 = (uint8x8_t)vcnt_s8(v115), v164.i16[0] = vaddlv_u8(v164), v164.u32[0] > 1uLL))
    {
      v163 = std::__next_prime(v163);
    }
    else
    {
      v165 = 1 << -(char)__clz(v163 - 1);
      if (v163 >= 2)
        v163 = v165;
    }
    if (prime <= v163)
      prime = v163;
    if (prime < *(_QWORD *)&v115)
      goto LABEL_17;
  }
LABEL_18:
  v201 = (float *)a3;
  v166 = (int *)v207[0];
  if (v207[0])
  {
    v167 = (unint64_t)__p[1];
    while (1)
    {
      v168 = (int8x8_t)v166[4];
      if (v167)
      {
        v169 = (uint8x8_t)vcnt_s8((int8x8_t)v167);
        v169.i16[0] = vaddlv_u8(v169);
        if (v169.u32[0] > 1uLL)
        {
          v115 = (int8x8_t)v166[4];
          if (v167 <= *(_QWORD *)&v168)
            v115 = (int8x8_t)(*(_QWORD *)&v168 % v167);
        }
        else
        {
          v115 = (int8x8_t)((v167 - 1) & *(_QWORD *)&v168);
        }
        v170 = (uint64_t **)*((_QWORD *)__p[0] + *(_QWORD *)&v115);
        if (v170)
        {
          v171 = *v170;
          if (v171)
          {
            if (v169.u32[0] < 2uLL)
            {
              while (1)
              {
                v173 = v171[1];
                if (v173 == *(_QWORD *)&v168)
                {
                  if (*((_DWORD *)v171 + 4) == v168.i32[0])
                    goto LABEL_81;
                }
                else if ((v173 & (v167 - 1)) != *(_QWORD *)&v115)
                {
                  goto LABEL_40;
                }
                v171 = (uint64_t *)*v171;
                if (!v171)
                  goto LABEL_40;
              }
            }
            do
            {
              v172 = v171[1];
              if (v172 == *(_QWORD *)&v168)
              {
                if (*((_DWORD *)v171 + 4) == v168.i32[0])
                  goto LABEL_81;
              }
              else
              {
                if (v172 >= v167)
                  v172 %= v167;
                if (v172 != *(_QWORD *)&v115)
                  break;
              }
              v171 = (uint64_t *)*v171;
            }
            while (v171);
          }
        }
      }
LABEL_40:
      v174 = operator new(0x30uLL);
      v209 = v174;
      v210 = v203;
      LOBYTE(v211[0]) = 0;
      *v174 = 0;
      v174[1] = v168;
      v175 = v166[4];
      v174[3] = 0;
      *((_DWORD *)v174 + 4) = v175;
      v174[4] = 0;
      v174[5] = 0;
      v177 = (_BYTE *)*((_QWORD *)v166 + 3);
      v176 = (_BYTE *)*((_QWORD *)v166 + 4);
      v178 = v176 - v177;
      if (v176 != v177)
      {
        if (v178 < 0)
          sub_1BE61F930();
        v179 = (char *)operator new(v176 - v177);
        v174[3] = v179;
        v174[4] = v179;
        v174[5] = &v179[8 * (v178 >> 3)];
        v180 = v178 & 0xFFFFFFFFFFFFFFF8;
        memcpy(v179, v177, v180);
        v174[4] = &v179[v180];
      }
      LOBYTE(v211[0]) = 1;
      v181 = (float)((unint64_t)v203[1] + 1);
      if (v167 && (float)(v204 * (float)v167) >= v181)
        goto LABEL_71;
      v182 = (v167 & (v167 - 1)) != 0;
      if (v167 < 3)
        v182 = 1;
      v183 = v182 | (2 * v167);
      v184 = vcvtps_u32_f32(v181 / v204);
      if (v183 <= v184)
        v185 = v184;
      else
        v185 = v183;
      if (v185 == 1)
      {
        v185 = 2;
      }
      else if ((v185 & (v185 - 1)) != 0)
      {
        v185 = std::__next_prime(v185);
        v167 = (unint64_t)__p[1];
      }
      if (v185 > v167)
        goto LABEL_55;
      if (v185 < v167)
      {
        v186 = vcvtps_u32_f32((float)(unint64_t)v203[1] / v204);
        if (v167 < 3 || (v187 = (uint8x8_t)vcnt_s8((int8x8_t)v167), v187.i16[0] = vaddlv_u8(v187), v187.u32[0] > 1uLL))
        {
          v186 = std::__next_prime(v186);
        }
        else
        {
          v188 = 1 << -(char)__clz(v186 - 1);
          if (v186 >= 2)
            v186 = v188;
        }
        if (v185 <= v186)
          v185 = v186;
        if (v185 < v167)
LABEL_55:
          sub_1BE61F23C((uint64_t)__p, v185);
      }
      v167 = (unint64_t)__p[1];
      v189 = (unint64_t)__p[1] - 1;
      if (((unint64_t)__p[1] & ((unint64_t)__p[1] - 1)) == 0)
      {
        v115 = (int8x8_t)(v189 & *(_QWORD *)&v168);
        v190 = (_QWORD *)*((_QWORD *)__p[0] + (v189 & *(_QWORD *)&v168));
        v191 = v209;
        if (v190)
          goto LABEL_72;
        goto LABEL_74;
      }
      if (__p[1] > (void *)*(_QWORD *)&v168)
        break;
      v115 = (int8x8_t)(*(_QWORD *)&v168 % (unint64_t)__p[1]);
      v190 = (_QWORD *)*((_QWORD *)__p[0] + *(_QWORD *)&v168 % (unint64_t)__p[1]);
      v191 = v209;
      if (v190)
      {
LABEL_72:
        *v191 = *v190;
        *v190 = v209;
        goto LABEL_80;
      }
LABEL_74:
      *v191 = v203[0];
      v203[0] = v209;
      *((_QWORD *)__p[0] + *(_QWORD *)&v115) = v203;
      if (*v209)
      {
        v192 = *(_QWORD *)(*v209 + 8);
        if ((v167 & (v167 - 1)) != 0)
        {
          if (v192 >= v167)
            v192 %= v167;
        }
        else
        {
          v192 &= v167 - 1;
        }
        *((_QWORD *)__p[0] + v192) = v209;
      }
LABEL_80:
      ++v203[1];
LABEL_81:
      v166 = *(int **)v166;
      if (!v166)
        goto LABEL_82;
    }
    v115 = v168;
LABEL_71:
    v190 = (_QWORD *)*((_QWORD *)__p[0] + *(_QWORD *)&v115);
    v191 = v209;
    if (v190)
      goto LABEL_72;
    goto LABEL_74;
  }
LABEL_82:
  if (v201 + 160 != (float *)__p)
  {
    v201[168] = v204;
    sub_1BE7800CC((_QWORD *)v201 + 80, (char *)v203[0], 0);
  }
  v193 = v203[0];
  if (v203[0])
  {
    do
    {
      v197 = (_QWORD *)*v193;
      v198 = (void *)v193[3];
      if (v198)
      {
        v193[4] = v198;
        operator delete(v198);
      }
      operator delete(v193);
      v193 = v197;
    }
    while (v197);
  }
  v194 = __p[0];
  __p[0] = 0;
  if (v194)
    operator delete(v194);
  v195 = v207[0];
  if (v207[0])
  {
    do
    {
      v199 = (_QWORD *)*v195;
      v200 = (void *)v195[3];
      if (v200)
      {
        v195[4] = v200;
        operator delete(v200);
      }
      operator delete(v195);
      v195 = v199;
    }
    while (v199);
  }
  v196 = (void *)__n[0];
  __n[0] = 0;
  if (v196)
    operator delete(v196);
}

- (id)recognizeDrawing:(id)a3 beamSize:(int64_t)a4 shouldCancel:(id)a5
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CHEncoderDecoderNetwork *v27;
  uint64_t i;
  void *v29;
  const char *v30;
  uint64_t v31;
  void **v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  void **v41;
  size_t v42;
  size_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  size_t v51;
  size_t v52;
  char *v53;
  void **v54;
  void **v55;
  __int128 v56;
  void **v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  float v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  _QWORD *v79;
  uint64_t v80;
  void **v81;
  void **v82;
  void *v83;
  int v85;
  id v86;
  id v87;
  uint64_t (**v88)(void);
  NSArray *v89;
  void *__p;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  void *v96;
  void **v97;
  unint64_t v98;
  _QWORD v99[3];
  id v100;
  void *v101[3];
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  _QWORD v106[3];
  _QWORD *v107;
  __int128 buf;
  char *v109;
  char *v110;
  unint64_t *v111;
  _BYTE v112[128];
  uint64_t v113;

  v85 = a4;
  v113 = *MEMORY[0x1E0C80C00];
  v87 = a3;
  v88 = (uint64_t (**)(void))a5;
  v100 = 0;
  objc_msgSend__extractFeaturesFromDrawing_error_(self, v7, (uint64_t)v87, (uint64_t)&v100, v8, v9);
  v86 = v100;
  if (v86)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v14 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend_localizedDescription(v86, v15, v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v20;
      _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_FAULT, "An error occurred in the math model when extracting features: %@", (uint8_t *)&buf, 0xCu);

    }
  }
  if (v88 && (v88[2]() & 1) != 0)
  {
    v21 = 0;
    v22 = v104;
    if (v104)
      goto LABEL_74;
    goto LABEL_75;
  }
  objc_msgSend__createCompressedInputImage_(self, v10, (uint64_t)v101, v11, v12, v13);
  v96 = 0;
  v97 = 0;
  v98 = 0;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v89 = self->_codeMap;
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v23, (uint64_t)&v92, (uint64_t)v112, 16, v24);
  if (!v25)
    goto LABEL_55;
  v26 = *(_QWORD *)v93;
  v27 = self;
  do
  {
    for (i = 0; i != v25; ++i)
    {
      if (*(_QWORD *)v93 != v26)
        objc_enumerationMutation(v89);
      v33 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v92 + 1) + 8 * i));
      v39 = (const char *)objc_msgSend_UTF8String(v33, v34, v35, v36, v37, v38);
      v40 = v39;
      v41 = v97;
      if ((unint64_t)v97 < v98)
      {
        v42 = strlen(v39);
        if (v42 > 0x7FFFFFFFFFFFFFF7)
          sub_1BE61F1B4();
        v43 = v42;
        if (v42 < 0x17)
        {
          *((_BYTE *)v97 + 23) = v42;
          v29 = v41;
          if (v42)
            goto LABEL_15;
        }
        else
        {
          v44 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v42 | 7) != 0x17)
            v44 = v42 | 7;
          v45 = v44 + 1;
          v29 = operator new(v44 + 1);
          v41[1] = (void *)v43;
          v41[2] = (void *)(v45 | 0x8000000000000000);
          *v41 = v29;
LABEL_15:
          memmove(v29, v40, v43);
        }
        *((_BYTE *)v29 + v43) = 0;
        v32 = v41 + 3;
        self = v27;
        goto LABEL_17;
      }
      v46 = 0xAAAAAAAAAAAAAAABLL * (((char *)v97 - (_BYTE *)v96) >> 3);
      v47 = v46 + 1;
      if (v46 + 1 > 0xAAAAAAAAAAAAAAALL)
        sub_1BE61F930();
      if (0x5555555555555556 * ((uint64_t)(v98 - (_QWORD)v96) >> 3) > v47)
        v47 = 0x5555555555555556 * ((uint64_t)(v98 - (_QWORD)v96) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v98 - (_QWORD)v96) >> 3) >= 0x555555555555555)
        v48 = 0xAAAAAAAAAAAAAAALL;
      else
        v48 = v47;
      v111 = &v98;
      if (v48)
      {
        if (v48 > 0xAAAAAAAAAAAAAAALL)
          sub_1BE61F100();
        v49 = (char *)operator new(24 * v48);
      }
      else
      {
        v49 = 0;
      }
      v50 = &v49[24 * v46];
      *(_QWORD *)&buf = v49;
      *((_QWORD *)&buf + 1) = v50;
      v109 = v50;
      v110 = &v49[24 * v48];
      v51 = strlen(v40);
      if (v51 > 0x7FFFFFFFFFFFFFF7)
        sub_1BE61F1B4();
      v52 = v51;
      if (v51 >= 0x17)
      {
        v58 = (v51 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v51 | 7) != 0x17)
          v58 = v51 | 7;
        v59 = v58 + 1;
        v60 = (char *)operator new(v58 + 1);
        *((_QWORD *)v50 + 1) = v52;
        *((_QWORD *)v50 + 2) = v59 | 0x8000000000000000;
        *(_QWORD *)v50 = v60;
        v50 = v60;
      }
      else
      {
        v50[23] = v51;
        if (!v51)
        {
          *v50 = 0;
          v53 = (char *)*((_QWORD *)&buf + 1);
          v32 = (void **)(v109 + 24);
          v54 = (void **)v96;
          v55 = v97;
          if (v97 == v96)
            goto LABEL_51;
          goto LABEL_40;
        }
      }
      memmove(v50, v40, v52);
      v50[v52] = 0;
      v53 = (char *)*((_QWORD *)&buf + 1);
      v32 = (void **)(v109 + 24);
      v54 = (void **)v96;
      v55 = v97;
      if (v97 == v96)
      {
LABEL_51:
        v96 = v53;
        v97 = v32;
        v98 = (unint64_t)v110;
        self = v27;
        goto LABEL_52;
      }
LABEL_40:
      self = v27;
      do
      {
        v56 = *(_OWORD *)(v55 - 3);
        *((_QWORD *)v53 - 1) = *(v55 - 1);
        *(_OWORD *)(v53 - 24) = v56;
        v53 -= 24;
        *(v55 - 2) = 0;
        *(v55 - 1) = 0;
        *(v55 - 3) = 0;
        v55 -= 3;
      }
      while (v55 != v54);
      v55 = (void **)v96;
      v57 = v97;
      v96 = v53;
      v97 = v32;
      v98 = (unint64_t)v110;
      while (v57 != v55)
      {
        if (*((char *)v57 - 1) < 0)
          operator delete(*(v57 - 3));
        v57 -= 3;
      }
LABEL_52:
      if (v55)
        operator delete(v55);
LABEL_17:
      v97 = v32;
    }
    v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v30, (uint64_t)&v92, (uint64_t)v112, 16, v31);
  }
  while (v25);
LABEL_55:

  objc_msgSend_segmentationAttThreshold(self, v61, v62, v63, v64, v65);
  sub_1BE7735C4((uint64_t)&buf, (uint64_t *)&v96, v66);
  objc_msgSend_setUpMathDecoder_imageCompressed_(self, v67, (uint64_t)&buf, (uint64_t)v99, v68, v69);
  v70 = MEMORY[0x1C3B81A84](v88);
  v106[0] = &off_1E77EF9F8;
  v106[1] = v70;
  v107 = v106;
  sub_1BE775F34((uint64_t)&buf, self, (uint64_t)v101, v99, v85, (uint64_t)v106, &__p);
  objc_msgSend_filterOutAlternatives_codemap_(self, v71, (uint64_t)&__p, (uint64_t)&v96, v72, v73);
  objc_msgSend__bestPathTokensFromDecodingStates_drawing_codemap_(self, v74, (uint64_t)&__p, (uint64_t)v87, (uint64_t)&v96, v75);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = __p;
  if (__p)
  {
    v77 = (uint64_t)v91;
    v78 = __p;
    if (v91 != __p)
    {
      do
        v77 = sub_1BE77D498(v77 - 224);
      while ((void *)v77 != v76);
      v78 = __p;
    }
    v91 = v76;
    operator delete(v78);
  }
  v79 = v107;
  if (v107 == v106)
  {
    v80 = 4;
    v79 = v106;
LABEL_64:
    (*(void (**)(void))(*v79 + 8 * v80))();
  }
  else if (v107)
  {
    v80 = 5;
    goto LABEL_64;
  }
  sub_1BE89D46C((uint64_t)&buf);
  v81 = (void **)v96;
  if (v96)
  {
    v82 = v97;
    v83 = v96;
    if (v97 != v96)
    {
      do
      {
        if (*((char *)v82 - 1) < 0)
          operator delete(*(v82 - 3));
        v82 -= 3;
      }
      while (v82 != v81);
      v83 = v96;
    }
    v97 = v81;
    operator delete(v83);
  }
  *(_QWORD *)&buf = v99;
  sub_1BE89E8DC((void ***)&buf);
  v22 = v104;
  if (v104)
  {
LABEL_74:
    v105 = v22;
    operator delete(v22);
  }
LABEL_75:
  if (v102)
  {
    v103 = v102;
    operator delete(v102);
  }
  if (v101[0])
  {
    v101[1] = v101[0];
    operator delete(v101[0]);
  }

  return v21;
}

- (FeatureArray)_extractFeaturesFromDrawing:(SEL)a3 error:(id)a4
{
  CoreHandwriting *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  void *v38;
  char *v39;
  void *v40;
  void *v41;
  FeatureArray *result;
  void *v43;
  char *v44;
  void *__p;
  uint64_t (**v46)();
  char v47;
  int32x2_t v48;
  int v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;

  v7 = (CoreHandwriting *)a4;
  v13 = objc_msgSend_renderSymbolSize(self, v8, v9, v10, v11, v12);
  v19 = objc_msgSend_minInputHeight(self, v14, v15, v16, v17, v18);
  v25 = objc_msgSend_maxInputHeight(self, v20, v21, v22, v23, v24);
  v47 = 1;
  v49 = v19;
  v50 = objc_msgSend_minInputWidth(self, v26, v27, v28, v29, v30);
  v51 = v25;
  v52 = objc_msgSend_maxInputWidth(self, v31, v32, v33, v34, v35);
  v46 = &off_1E77F0D20;
  v53 = v13;
  v48 = vmovn_s64(*(int64x2_t *)&self->_padToMultipleOf);
  CoreHandwriting::drawingToInk(v7, MEMORY[0x1E0C9D538], (uint64_t *)&v43);
  CoreHandwriting::InkToImageBaseFeatureExtractionStep::process((CoreHandwriting::InkToImageBaseFeatureExtractionStep *)&v46, (double ***)&v43, retstr);
  if (__p)
    operator delete(__p);
  v36 = (char *)v43;
  if (v43)
  {
    v37 = v44;
    v38 = v43;
    if (v44 != v43)
    {
      v39 = v44;
      do
      {
        v41 = (void *)*((_QWORD *)v39 - 3);
        v39 -= 24;
        v40 = v41;
        if (v41)
        {
          *((_QWORD *)v37 - 2) = v40;
          operator delete(v40);
        }
        v37 = v39;
      }
      while (v39 != v36);
      v38 = v43;
    }
    v44 = v36;
    operator delete(v38);
  }

  return result;
}

- (vector<std::vector<std::unordered_map<int,)_createCompressedInputImage:()std:(int>>>> *__return_ptr)retstr :(CHEncoderDecoderNetwork *)self allocator<std:(SEL)a3 :(const void *)a4 vector<std::unordered_map<int
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void **var0;
  char *var1;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  __int128 v25;
  void **v26;
  void **v27;
  void *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  int *v36;
  uint64_t v37;
  int *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int *v42;
  uint64_t v43;
  int *v44;
  void *v45;
  uint64_t i;
  uint64_t v47;
  uint64_t j;
  uint64_t *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  char *v57;
  unint64_t v58;
  unint64_t v59;
  int v60;
  int *v61;
  char *v62;
  float *v63;
  int v64;
  unint64_t v65;
  int v66;
  int v67;
  uint64_t v68;
  unsigned int *v69;
  unsigned int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  uint64_t v75;
  int v76;
  int *v77;
  int v78;
  int v79;
  unint64_t v80;
  uint64_t v81;
  char *v82;
  int *v83;
  uint64_t v84;
  int *v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  uint8x8_t v94;
  unint64_t v95;
  uint64_t **v96;
  uint64_t *v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  _OWORD *v101;
  size_t v102;
  _DWORD *v103;
  char *v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  int *v108;
  int8x8_t v109;
  BOOL v110;
  uint64_t v111;
  size_t prime;
  _DWORD *v113;
  int *v114;
  int *v115;
  char *v116;
  int *v117;
  uint64_t v118;
  unint64_t v119;
  char *v120;
  int *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  int *v126;
  int8x8_t v127;
  BOOL v128;
  char *v129;
  void **v130;
  _QWORD *v131;
  _QWORD *v132;
  void *v133;
  _QWORD *v134;
  _QWORD *v135;
  void *v136;
  unint64_t v137;
  uint8x8_t v138;
  uint64_t v139;
  unint64_t v140;
  uint8x8_t v141;
  uint64_t v142;
  vector<std::vector<std::unordered_map<int, int>>, std::allocator<std::vector<std::unordered_map<int, int>>>> *v143;
  char *v144;
  char *v145;
  void *v146;
  unint64_t v147;
  unint64_t v148;
  char *v149;
  _BYTE *v150;
  unint64_t v151;
  unint64_t v152;
  int *v153;
  int *v154;
  char *v155;
  void **v156;
  void **v157;
  __int128 v158;
  void **v159;
  void **v160;
  void *v161;
  _QWORD *v162;
  _QWORD *v163;
  _QWORD *v164;
  _QWORD *v165;
  _QWORD *v166;
  void *v167;
  void *v168;
  char *v169;
  char *v170;
  _QWORD *v171;
  _QWORD *v172;
  void *v173;
  void *v174;
  vector<std::vector<std::unordered_map<int, int>>, std::allocator<std::vector<std::unordered_map<int, int>>>> *result;
  int v176;
  uint64_t v177;
  unint64_t v178;
  unint64_t v179;
  void *v181;
  void **v182;
  void **v183;
  char *v184;
  char *v185;
  void **v186;
  uint64_t v187;
  unint64_t v188;
  int *v189;
  int v190;
  size_t __n[2];
  void *v192[2];
  int v193;
  void *__p;
  char *v195;
  char *v196;
  int *v197;
  char *v198;
  int *v199;
  int *v200;
  __compressed_pair<std::vector<std::unordered_map<int, int>> *, std::allocator<std::vector<std::unordered_map<int, int>>>> *p_var2;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  v9 = **(_QWORD **)a4;
  v10 = objc_msgSend_encoderCompressionFactor(self, a3, (uint64_t)a4, v4, v5, v6);
  v11 = *(_QWORD *)(*(_QWORD *)a4 + 8);
  v17 = objc_msgSend_encoderCompressionFactor(self, v12, v13, v14, v15, v16);
  v18 = v9 / v10;
  var0 = (void **)retstr->var0;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)retstr->var2.var0 - (char *)retstr->var0) >> 3) < (int)v18)
  {
    if (((v18 << 32) & 0x8000000000000000) != 0)
      sub_1BE61F930();
    var1 = (char *)retstr->var1;
    v21 = (char *)operator new(24 * (int)v18);
    v22 = &v21[24 * (int)v18];
    v23 = &v21[24 * ((var1 - (char *)var0) / 24)];
    if (var1 == (char *)var0)
    {
      retstr->var0 = v23;
      retstr->var1 = v23;
      retstr->var2.var0 = v22;
      if (var0)
LABEL_21:
        operator delete(var0);
    }
    else
    {
      v24 = &v21[24 * ((var1 - (char *)var0) / 24)];
      do
      {
        v25 = *(_OWORD *)(var1 - 24);
        var1 -= 24;
        *(_OWORD *)(v24 - 24) = v25;
        v24 -= 24;
        *((_QWORD *)v24 + 2) = *((_QWORD *)var1 + 2);
        *(_QWORD *)var1 = 0;
        *((_QWORD *)var1 + 1) = 0;
        *((_QWORD *)var1 + 2) = 0;
      }
      while (var1 != (char *)var0);
      var0 = (void **)retstr->var0;
      v26 = (void **)retstr->var1;
      retstr->var0 = v24;
      retstr->var1 = v23;
      retstr->var2.var0 = v22;
      if (v26 != var0)
      {
        v188 = v11;
        v27 = v26;
        do
        {
          v30 = *(v27 - 3);
          v27 -= 3;
          v29 = v30;
          if (v30)
          {
            v31 = *(v26 - 2);
            v28 = v29;
            if (v31 != v29)
            {
              do
              {
                v32 = (_QWORD *)*(v31 - 3);
                if (v32)
                {
                  do
                  {
                    v33 = (_QWORD *)*v32;
                    operator delete(v32);
                    v32 = v33;
                  }
                  while (v33);
                }
                v35 = (void *)*(v31 - 5);
                v31 -= 5;
                v34 = v35;
                *v31 = 0;
                if (v35)
                  operator delete(v34);
              }
              while (v31 != v29);
              v28 = *v27;
            }
            *(v26 - 2) = v29;
            operator delete(v28);
          }
          v26 = v27;
        }
        while (v27 != var0);
        v11 = v188;
      }
      if (var0)
        goto LABEL_21;
    }
  }
  v36 = (int *)operator new(0x10uLL);
  v42 = v36;
  *(_QWORD *)v36 = 0;
  *((_QWORD *)v36 + 1) = 0;
  if ((int)v18 >= 1)
  {
    v43 = 0;
    v178 = v11 / v17;
    v179 = (v11 / v17) << 32;
    v187 = (v11 / v17);
    v176 = v11 / v17;
    v177 = v18;
    v44 = v36 + 2;
    v189 = v36 + 2;
    do
    {
      __p = 0;
      v195 = 0;
      v196 = 0;
      if (v179)
      {
        if ((v179 & 0x8000000000000000) != 0)
          sub_1BE61F930();
        __p = operator new(40 * v176);
        v195 = (char *)__p;
        v196 = (char *)__p + 40 * v176;
      }
      if ((int)v178 >= 1)
      {
        for (i = 0; i != v187; ++i)
        {
          v47 = 0;
          *(_OWORD *)__n = 0u;
          *(_OWORD *)v192 = 0u;
          v193 = 1065353216;
          while (objc_msgSend_encoderCompressionFactor(self, (const char *)v37, (uint64_t)v38, v39, v40, v41) > v47)
          {
            for (j = 0;
                  objc_msgSend_encoderCompressionFactor(self, (const char *)v37, (uint64_t)v38, v39, v40, v41) > j;
                  ++j)
            {
              *(_QWORD *)v42 = v47
                             + objc_msgSend_encoderCompressionFactor(self, (const char *)v37, (uint64_t)v38, v39, v40, v41)* v43;
              v55 = j + objc_msgSend_encoderCompressionFactor(self, v50, v51, v52, v53, v54) * i;
              *((_QWORD *)v42 + 1) = v55;
              if (*(_QWORD *)v42 >= **(_QWORD **)a4 || v55 >= *(_QWORD *)(*(_QWORD *)a4 + 8))
                continue;
              v57 = (char *)*((_QWORD *)a4 + 3);
              v56 = (char *)*((_QWORD *)a4 + 4);
              if ((unint64_t)(v56 - v57) > 0x10)
                v56 = v57 + 16;
              if (v57 == v56)
              {
                v63 = (float *)*((_QWORD *)a4 + 6);
                if (*v63 <= 0.0)
                  continue;
                v190 = 0;
                v64 = (int)(float)(*v63 + -1.0);
                v190 = v64;
                v65 = __n[1];
                if (!__n[1])
                  goto LABEL_37;
                goto LABEL_62;
              }
              v58 = v56 - v57 - 8;
              v59 = v58 >> 3;
              if (v58 < 8)
              {
                v60 = 0;
                v61 = v42;
                v62 = (char *)*((_QWORD *)a4 + 3);
                do
                {
LABEL_54:
                  v73 = *(_DWORD *)v62;
                  v62 += 8;
                  v72 = v73;
                  v74 = *v61;
                  v61 += 2;
                  v60 += v74 * v72;
                }
                while (v62 != v56);
                goto LABEL_55;
              }
              v66 = 0;
              v67 = 0;
              v68 = (v59 + 1) & 0x3FFFFFFFFFFFFFFELL;
              v61 = &v42[2 * v68];
              v62 = &v57[8 * v68];
              v69 = (unsigned int *)(v57 + 8);
              v37 = v68;
              v38 = v44;
              do
              {
                v39 = *(v69 - 2);
                v70 = *v69;
                v69 += 4;
                v40 = v70;
                v41 = *(v38 - 2);
                v71 = *v38;
                v38 += 4;
                v66 += v41 * v39;
                v67 += v71 * v40;
                v37 -= 2;
              }
              while (v37);
              v60 = v67 + v66;
              if (v59 + 1 != v68)
                goto LABEL_54;
LABEL_55:
              v75 = *((_QWORD *)a4 + 6);
              if (*(float *)(v75 + 4 * v60) <= 0.0)
                continue;
              v76 = 0;
              v190 = 0;
              v77 = v42;
              if (v58 < 8)
                goto LABEL_210;
              v78 = 0;
              v79 = 0;
              v80 = v59 + 1;
              v81 = 2 * (v80 & 0x3FFFFFFFFFFFFFFELL);
              v77 = &v42[v81];
              v82 = &v57[v81 * 4];
              v83 = (int *)(v57 + 8);
              v84 = v80 & 0x3FFFFFFFFFFFFFFELL;
              v85 = v44;
              do
              {
                v86 = *(v83 - 2);
                v88 = *v83;
                v83 += 4;
                v87 = v88;
                v89 = *(v85 - 2);
                v90 = *v85;
                v85 += 4;
                v78 += v89 * v86;
                v79 += v90 * v87;
                v84 -= 2;
              }
              while (v84);
              v76 = v79 + v78;
              v57 = v82;
              if (v80 != (v80 & 0x3FFFFFFFFFFFFFFELL))
              {
LABEL_210:
                do
                {
                  v92 = *(_DWORD *)v57;
                  v57 += 8;
                  v91 = v92;
                  v93 = *v77;
                  v77 += 2;
                  v76 += v93 * v91;
                }
                while (v57 != v56);
              }
              v64 = (int)(float)(*(float *)(v75 + 4 * v76) + -1.0);
              v190 = v64;
              v65 = __n[1];
              if (!__n[1])
                goto LABEL_37;
LABEL_62:
              v94 = (uint8x8_t)vcnt_s8((int8x8_t)v65);
              v94.i16[0] = vaddlv_u8(v94);
              if (v94.u32[0] > 1uLL)
              {
                v95 = v64;
                if (v65 <= v64)
                  v95 = v64 % v65;
              }
              else
              {
                v95 = (v65 - 1) & v64;
              }
              v96 = *(uint64_t ***)(__n[0] + 8 * v95);
              if (v96)
              {
                v97 = *v96;
                if (v97)
                {
                  if (v94.u32[0] < 2uLL)
                  {
                    v98 = v65 - 1;
                    while (1)
                    {
                      v100 = v97[1];
                      if (v100 == v64)
                      {
                        if (*((_DWORD *)v97 + 4) == v64)
                          goto LABEL_38;
                      }
                      else if ((v100 & v98) != v95)
                      {
                        goto LABEL_37;
                      }
                      v97 = (uint64_t *)*v97;
                      if (!v97)
                        goto LABEL_37;
                    }
                  }
                  do
                  {
                    v99 = v97[1];
                    if (v99 == v64)
                    {
                      if (*((_DWORD *)v97 + 4) == v64)
                        goto LABEL_38;
                    }
                    else
                    {
                      if (v99 >= v65)
                        v99 %= v65;
                      if (v99 != v95)
                        break;
                    }
                    v97 = (uint64_t *)*v97;
                  }
                  while (v97);
                }
              }
LABEL_37:
              v197 = &v190;
              *((_DWORD *)sub_1BE7CA1D0((uint64_t)__n, &v190, (uint64_t)&unk_1BE8D50A2, &v197) + 5) = 0;
LABEL_38:
              v197 = &v190;
              v49 = sub_1BE7CA1D0((uint64_t)__n, &v190, (uint64_t)&unk_1BE8D50A2, &v197);
              ++*((_DWORD *)v49 + 5);
            }
            ++v47;
          }
          v101 = v195;
          if (v195 >= v196)
          {
            v105 = 0xCCCCCCCCCCCCCCCDLL * ((v195 - (_BYTE *)__p) >> 3);
            v106 = v105 + 1;
            if (v105 + 1 > 0x666666666666666)
              sub_1BE61F930();
            if (0x999999999999999ALL * ((v196 - (_BYTE *)__p) >> 3) > v106)
              v106 = 0x999999999999999ALL * ((v196 - (_BYTE *)__p) >> 3);
            if (0xCCCCCCCCCCCCCCCDLL * ((v196 - (_BYTE *)__p) >> 3) >= 0x333333333333333)
              v107 = 0x666666666666666;
            else
              v107 = v106;
            p_var2 = (__compressed_pair<std::vector<std::unordered_map<int, int>> *, std::allocator<std::vector<std::unordered_map<int, int>>>> *)&v196;
            if (v107)
            {
              if (v107 > 0x666666666666666)
                sub_1BE61F100();
              v108 = (int *)operator new(40 * v107);
            }
            else
            {
              v108 = 0;
            }
            v111 = (uint64_t)&v108[10 * v105];
            v197 = v108;
            v198 = (char *)v111;
            v199 = (int *)v111;
            v200 = &v108[10 * v107];
            *(_OWORD *)v111 = 0u;
            *(_OWORD *)(v111 + 16) = 0u;
            *(_DWORD *)(v111 + 32) = v193;
            prime = __n[1];
            if (__n[1] == 1)
            {
              prime = 2;
              goto LABEL_104;
            }
            if ((__n[1] & (__n[1] - 1)) != 0)
            {
              prime = std::__next_prime(__n[1]);
              v127 = *(int8x8_t *)(v111 + 8);
              v128 = prime >= *(_QWORD *)&v127;
              if (prime > *(_QWORD *)&v127)
                goto LABEL_104;
            }
            else
            {
              v127 = 0;
              v128 = 1;
              if (__n[1])
                goto LABEL_104;
            }
            if (!v128)
            {
              v140 = vcvtps_u32_f32((float)*(unint64_t *)(v111 + 24) / *(float *)(v111 + 32));
              if (*(_QWORD *)&v127 < 3uLL
                || (v141 = (uint8x8_t)vcnt_s8(v127), v141.i16[0] = vaddlv_u8(v141), v141.u32[0] > 1uLL))
              {
                v140 = std::__next_prime(v140);
              }
              else
              {
                v142 = 1 << -(char)__clz(v140 - 1);
                if (v140 >= 2)
                  v140 = v142;
              }
              if (prime <= v140)
                prime = v140;
              if (prime < *(_QWORD *)&v127)
LABEL_104:
                sub_1BE61F23C(v111, prime);
            }
            v113 = v192[0];
            if (v192[0])
            {
              do
              {
                sub_1BE89EDD8(v111, v113[4], *((_QWORD *)v113 + 2));
                v113 = *(_DWORD **)v113;
              }
              while (v113);
            }
            v115 = (int *)__p;
            v114 = (int *)v195;
            v116 = v198;
            v117 = v199;
            if (v195 == __p)
            {
              v126 = (int *)v195;
            }
            else
            {
              v118 = 0;
              do
              {
                v120 = &v116[v118 * 4];
                v121 = &v114[v118];
                v122 = *(_QWORD *)&v114[v118 - 10];
                *((_QWORD *)v121 - 5) = 0;
                *((_QWORD *)v120 - 5) = v122;
                *((_QWORD *)v120 - 4) = *(_QWORD *)&v114[v118 - 8];
                *((_QWORD *)v121 - 4) = 0;
                v123 = *(_QWORD *)&v114[v118 - 6];
                *(_QWORD *)&v116[v118 * 4 - 24] = v123;
                v124 = *(_QWORD *)&v114[v118 - 4];
                *((_QWORD *)v120 - 2) = v124;
                v37 = v114[v118 - 2];
                *((_DWORD *)v120 - 2) = v37;
                if (v124)
                {
                  v119 = *(_QWORD *)(v123 + 8);
                  v125 = *((_QWORD *)v120 - 4);
                  if ((v125 & (v125 - 1)) != 0)
                  {
                    if (v119 >= v125)
                      v119 %= v125;
                  }
                  else
                  {
                    v119 &= v125 - 1;
                  }
                  *(_QWORD *)(v122 + 8 * v119) = &v116[v118 * 4 - 24];
                  *(_QWORD *)&v114[v118 - 6] = 0;
                  *(_QWORD *)&v114[v118 - 4] = 0;
                }
                v118 -= 10;
              }
              while (&v114[v118] != v115);
              v126 = (int *)__p;
              v114 = (int *)v195;
              v116 += v118 * 4;
            }
            v104 = (char *)(v117 + 10);
            __p = v116;
            v195 = (char *)(v117 + 10);
            v129 = v196;
            v196 = (char *)v200;
            v200 = (int *)v129;
            v197 = v126;
            v198 = (char *)v126;
            if (v114 != v126)
            {
              v184 = (char *)(v117 + 10);
              do
              {
                v130 = (void **)(v114 - 10);
                v199 = v114 - 10;
                v131 = (_QWORD *)*((_QWORD *)v114 - 3);
                if (v131)
                {
                  do
                  {
                    v132 = (_QWORD *)*v131;
                    operator delete(v131);
                    v131 = v132;
                  }
                  while (v132);
                }
                v133 = *v130;
                *v130 = 0;
                if (v133)
                  operator delete(v133);
                v114 = v199;
              }
              while (v199 != v126);
              v114 = v197;
              v104 = v184;
            }
            if (v114)
              operator delete(v114);
            goto LABEL_131;
          }
          *(_OWORD *)v195 = 0u;
          v101[1] = 0u;
          *((_DWORD *)v101 + 8) = v193;
          v102 = __n[1];
          if (__n[1] == 1)
          {
            v102 = 2;
            goto LABEL_85;
          }
          if ((__n[1] & (__n[1] - 1)) != 0)
          {
            v102 = std::__next_prime(__n[1]);
            v109 = *(int8x8_t *)((char *)v101 + 8);
            v110 = v102 >= *(_QWORD *)&v109;
            if (v102 > *(_QWORD *)&v109)
              goto LABEL_85;
          }
          else
          {
            v109 = 0;
            v110 = 1;
            if (__n[1])
              goto LABEL_85;
          }
          if (!v110)
          {
            v137 = vcvtps_u32_f32((float)*((unint64_t *)v101 + 3) / *((float *)v101 + 8));
            if (*(_QWORD *)&v109 < 3uLL
              || (v138 = (uint8x8_t)vcnt_s8(v109), v138.i16[0] = vaddlv_u8(v138), v138.u32[0] > 1uLL))
            {
              v137 = std::__next_prime(v137);
            }
            else
            {
              v139 = 1 << -(char)__clz(v137 - 1);
              if (v137 >= 2)
                v137 = v139;
            }
            if (v102 <= v137)
              v102 = v137;
            if (v102 < *(_QWORD *)&v109)
LABEL_85:
              sub_1BE61F23C((uint64_t)v101, v102);
          }
          v103 = v192[0];
          if (v192[0])
          {
            do
            {
              sub_1BE89EDD8((uint64_t)v101, v103[4], *((_QWORD *)v103 + 2));
              v103 = *(_DWORD **)v103;
            }
            while (v103);
          }
          v104 = (char *)v101 + 40;
LABEL_131:
          v195 = v104;
          v134 = v192[0];
          if (v192[0])
          {
            do
            {
              v135 = (_QWORD *)*v134;
              operator delete(v134);
              v134 = v135;
            }
            while (v135);
          }
          v136 = (void *)__n[0];
          __n[0] = 0;
          if (v136)
            operator delete(v136);
          v44 = v189;
        }
      }
      v143 = retstr;
      v145 = (char *)retstr->var1;
      v144 = (char *)retstr->var2.var0;
      if (v145 >= v144)
      {
        v147 = 0xAAAAAAAAAAAAAAABLL * ((v145 - (char *)retstr->var0) >> 3);
        v148 = v147 + 1;
        if (v147 + 1 > 0xAAAAAAAAAAAAAAALL)
          sub_1BE61F930();
        v150 = __p;
        v149 = v195;
        v151 = 0xAAAAAAAAAAAAAAABLL * ((v144 - (char *)retstr->var0) >> 3);
        if (2 * v151 > v148)
          v148 = 2 * v151;
        if (v151 >= 0x555555555555555)
          v152 = 0xAAAAAAAAAAAAAAALL;
        else
          v152 = v148;
        p_var2 = &retstr->var2;
        if (v152)
        {
          v185 = v195;
          if (v152 > 0xAAAAAAAAAAAAAAALL)
            sub_1BE61F100();
          v153 = (int *)operator new(24 * v152);
          v149 = v185;
        }
        else
        {
          v153 = 0;
        }
        v154 = &v153[6 * v147];
        v197 = v153;
        v198 = (char *)v154;
        v199 = v154;
        v200 = &v153[6 * v152];
        *((_QWORD *)v154 + 1) = 0;
        *((_QWORD *)v154 + 2) = 0;
        *(_QWORD *)v154 = 0;
        sub_1BE89F0BC((uint64_t)v154, (uint64_t)v150, (uint64_t)v149, 0xCCCCCCCCCCCCCCCDLL * ((v149 - v150) >> 3));
        v155 = v198;
        v146 = v199 + 6;
        v143 = retstr;
        v157 = (void **)retstr->var0;
        v156 = (void **)retstr->var1;
        if (v156 == retstr->var0)
        {
          retstr->var0 = v198;
          retstr->var1 = v146;
          retstr->var2.var0 = v200;
          if (!v156)
            goto LABEL_189;
        }
        else
        {
          do
          {
            *((_QWORD *)v155 - 3) = 0;
            *((_QWORD *)v155 - 2) = 0;
            v155 -= 24;
            *((_QWORD *)v155 + 2) = 0;
            v158 = *(_OWORD *)(v156 - 3);
            v156 -= 3;
            *(_OWORD *)v155 = v158;
            *((_QWORD *)v155 + 2) = v156[2];
            *v156 = 0;
            v156[1] = 0;
            v156[2] = 0;
          }
          while (v156 != v157);
          v156 = (void **)retstr->var0;
          v159 = (void **)retstr->var1;
          retstr->var0 = v155;
          retstr->var1 = v146;
          retstr->var2.var0 = v200;
          if (v159 != v156)
          {
            v160 = v159;
            v181 = v146;
            v182 = v156;
            do
            {
              v163 = *(v160 - 3);
              v160 -= 3;
              v162 = v163;
              if (v163)
              {
                v186 = v160;
                v164 = *(v159 - 2);
                v161 = v162;
                if (v164 != v162)
                {
                  v183 = v159;
                  do
                  {
                    v165 = (_QWORD *)*(v164 - 3);
                    if (v165)
                    {
                      do
                      {
                        v166 = (_QWORD *)*v165;
                        operator delete(v165);
                        v165 = v166;
                      }
                      while (v166);
                    }
                    v168 = (void *)*(v164 - 5);
                    v164 -= 5;
                    v167 = v168;
                    *v164 = 0;
                    if (v168)
                      operator delete(v167);
                  }
                  while (v164 != v162);
                  v161 = *v186;
                  v146 = v181;
                  v159 = v183;
                }
                *(v159 - 2) = v162;
                operator delete(v161);
                v156 = v182;
                v160 = v186;
              }
              v159 = v160;
            }
            while (v160 != v156);
            v143 = retstr;
          }
          if (!v156)
            goto LABEL_189;
        }
        operator delete(v156);
      }
      else
      {
        *(_QWORD *)v145 = 0;
        *((_QWORD *)v145 + 1) = 0;
        *((_QWORD *)v145 + 2) = 0;
        sub_1BE89F0BC((uint64_t)v145, (uint64_t)__p, (uint64_t)v195, 0xCCCCCCCCCCCCCCCDLL * ((v195 - (_BYTE *)__p) >> 3));
        v146 = v145 + 24;
        retstr->var1 = v146;
      }
LABEL_189:
      v143->var1 = v146;
      v169 = (char *)__p;
      if (__p)
      {
        v170 = v195;
        v45 = __p;
        if (v195 != __p)
        {
          do
          {
            v171 = (_QWORD *)*((_QWORD *)v170 - 3);
            if (v171)
            {
              do
              {
                v172 = (_QWORD *)*v171;
                operator delete(v171);
                v171 = v172;
              }
              while (v172);
            }
            v174 = (void *)*((_QWORD *)v170 - 5);
            v170 -= 40;
            v173 = v174;
            *(_QWORD *)v170 = 0;
            if (v174)
              operator delete(v173);
          }
          while (v170 != v169);
          v45 = __p;
          v44 = v189;
        }
        v195 = v169;
        operator delete(v45);
      }
      ++v43;
    }
    while (v43 != v177);
  }
  operator delete(v42);
  return result;
}

- (void)filterOutAlternatives:(void *)a3 codemap:(const void *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void **v24;
  char *v25;
  _BYTE *v26;
  size_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  _QWORD *v35;
  _BYTE *v36;
  unint64_t v37;
  char *v38;
  void *v39;
  uint64_t v40;
  void **v41;
  char *v42;
  char *v43;
  _BYTE *v44;
  size_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  char *v51;
  _QWORD *v52;
  _BYTE *v53;
  unint64_t v54;
  char *v55;
  void *v56;
  uint64_t v57;
  void **v58;
  char *v59;
  char *v60;
  _BYTE *v61;
  size_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  char *v68;
  _QWORD *v69;
  _BYTE *v70;
  unint64_t v71;
  char *v72;
  void *v73;
  uint64_t v74;
  char *v75;
  void **v76;
  char *v77;
  _BYTE *v78;
  size_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  char *v85;
  _QWORD *v86;
  _BYTE *v87;
  unint64_t v88;
  char *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;

  v4 = *(_QWORD *)a3;
  v5 = *((_QWORD *)a3 + 1);
  v6 = v5 - *(_QWORD *)a3;
  if (v5 != *(_QWORD *)a3)
  {
    v7 = (uint64_t *)a3;
    v8 = *(_QWORD *)(v4 + 80) - *(_QWORD *)(v4 + 72);
    if (v8)
    {
      v9 = *(float *)(v4 + 168) / fabs(sqrt((double)(unint64_t)(v8 >> 2)));
      if (v6 < 225)
        return;
LABEL_6:
      v10 = 0;
      v11 = v9 + -2.30258509;
      v12 = 224 * ((((unint64_t)v6 >> 5) * (unsigned __int128)0x2492492492492493uLL) >> 64);
      v13 = (((unint64_t)v6 >> 5) * (unsigned __int128)0x2492492492492493uLL) >> 64;
      v105 = v12;
      while (1)
      {
        v15 = v13 - 1;
        v16 = *v7;
        v17 = *v7 + 224 * (v13 - 1);
        v18 = *(_QWORD *)(v17 + 80) - *(_QWORD *)(v17 + 72);
        if (!v18)
          break;
        v19 = *(float *)(v17 + 168) / fabs(sqrt((double)(unint64_t)(v18 >> 2)));
        if (v19 < v11)
          goto LABEL_13;
LABEL_8:
        v10 -= 224;
        v14 = v13 <= 2;
        v13 = v15;
        if (v14)
          return;
      }
      if (*(float *)(v17 + 168) >= v11)
        goto LABEL_8;
LABEL_13:
      if (v16 + 224 * v13 == v5)
        goto LABEL_97;
      v102 = v13 - 1;
      v103 = v13;
      v104 = v10;
      v20 = v16 + v10;
      v21 = v16 + v10;
      while (1)
      {
        v106 = v21;
        v107 = (_QWORD *)v17;
        v22 = v20 + v12;
        sub_1BE784720((uint64_t **)(v20 + v12 - 224), *(_QWORD **)(v20 + v12), (_QWORD *)(v12 + v21 + 8));
        sub_1BE781768(v22 - 200, *(int **)(v22 + 24), (int *)(v12 + v21 + 32));
        sub_1BE784C3C(v22 - 176, *(char ***)(v22 + 48), *(_QWORD *)(v22 + 56), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v22 + 56) - *(_QWORD *)(v22 + 48)) >> 3));
        v24 = (void **)(v20 + v12 - 152);
        v23 = (char *)*v24;
        v25 = *(char **)(v20 + v12 + 72);
        v26 = *(_BYTE **)(v20 + v12 + 80);
        v27 = v26 - v25;
        v28 = (v26 - v25) >> 2;
        v29 = *(_QWORD *)(v20 + v12 - 136);
        if (v28 <= (v29 - (uint64_t)*v24) >> 2)
          break;
        if (v23)
        {
          *(_QWORD *)(v20 + v12 - 144) = v23;
          operator delete(v23);
          v29 = 0;
          *v24 = 0;
          *(_QWORD *)(v22 - 144) = 0;
          *(_QWORD *)(v22 - 136) = 0;
        }
        if ((v27 & 0x8000000000000000) != 0)
          goto LABEL_120;
        v30 = v29 >> 1;
        if (v29 >> 1 <= v28)
          v30 = (v26 - v25) >> 2;
        v31 = (unint64_t)v29 >= 0x7FFFFFFFFFFFFFFCLL;
        v32 = 0x3FFFFFFFFFFFFFFFLL;
        if (!v31)
          v32 = v30;
        if (v32 >> 62)
LABEL_120:
          sub_1BE61F930();
        v33 = 4 * v32;
        v34 = (char *)operator new(4 * v32);
        v23 = v34;
        *v24 = v34;
        *(_QWORD *)(v20 + v12 - 144) = v34;
        v35 = (_QWORD *)(v20 + v12 - 144);
        *(_QWORD *)(v22 - 136) = &v34[v33];
        if (v26 != v25)
          memcpy(v34, v25, v26 - v25);
LABEL_38:
        *v35 = &v23[v27];
        v40 = v20 + v12;
        v41 = (void **)(v20 + v12 - 128);
        v42 = (char *)*v41;
        v43 = *(char **)(v20 + v12 + 96);
        v44 = *(_BYTE **)(v20 + v12 + 104);
        v45 = v44 - v43;
        v46 = (v44 - v43) >> 2;
        v47 = *(_QWORD *)(v20 + v12 - 112);
        if (v46 <= (v47 - (uint64_t)*v41) >> 2)
        {
          v52 = v107 + 13;
          v53 = *(_BYTE **)(v40 - 120);
          v54 = (v53 - v42) >> 2;
          if (v54 >= v46)
          {
            if (v44 != v43)
            {
              v56 = v42;
              v55 = v43;
LABEL_56:
              memmove(v56, v55, v45);
            }
          }
          else
          {
            if (v53 != v42)
            {
              memmove(v42, v43, v53 - v42);
              v42 = *(char **)(v40 - 120);
            }
            v55 = &v43[4 * v54];
            v45 = v44 - v55;
            if (v44 != v55)
            {
              v56 = v42;
              goto LABEL_56;
            }
          }
          v12 = v105;
          goto LABEL_58;
        }
        if (v42)
        {
          *(_QWORD *)(v20 + v12 - 120) = v42;
          operator delete(v42);
          v47 = 0;
          *v41 = 0;
          *(_QWORD *)(v20 + v12 - 120) = 0;
          *(_QWORD *)(v20 + v12 - 112) = 0;
        }
        if ((v45 & 0x8000000000000000) != 0)
          goto LABEL_123;
        v48 = v47 >> 1;
        if (v47 >> 1 <= v46)
          v48 = (v44 - v43) >> 2;
        v31 = (unint64_t)v47 >= 0x7FFFFFFFFFFFFFFCLL;
        v49 = 0x3FFFFFFFFFFFFFFFLL;
        if (!v31)
          v49 = v48;
        if (v49 >> 62)
LABEL_123:
          sub_1BE61F930();
        v50 = 4 * v49;
        v51 = (char *)operator new(4 * v49);
        v42 = v51;
        *v41 = v51;
        *(_QWORD *)(v20 + v12 - 120) = v51;
        v52 = (_QWORD *)(v20 + v12 - 120);
        *(_QWORD *)(v40 - 112) = &v51[v50];
        if (v44 != v43)
          memcpy(v51, v43, v44 - v43);
LABEL_58:
        *v52 = &v42[v45];
        v57 = v20 + v12;
        v58 = (void **)(v20 + v12 - 104);
        v59 = (char *)*v58;
        v60 = *(char **)(v20 + v12 + 120);
        v61 = *(_BYTE **)(v20 + v12 + 128);
        v62 = v61 - v60;
        v63 = (v61 - v60) >> 3;
        v64 = *(_QWORD *)(v20 + v12 - 88);
        if (v63 <= (v64 - (uint64_t)*v58) >> 3)
        {
          v69 = v107 + 16;
          v70 = *(_BYTE **)(v57 - 96);
          v71 = (v70 - v59) >> 3;
          if (v71 >= v63)
          {
            if (v61 != v60)
            {
              v73 = v59;
              v72 = v60;
LABEL_76:
              memmove(v73, v72, v62);
            }
          }
          else
          {
            if (v70 != v59)
            {
              memmove(v59, v60, v70 - v59);
              v59 = *(char **)(v57 - 96);
            }
            v72 = &v60[8 * v71];
            v62 = v61 - v72;
            if (v61 != v72)
            {
              v73 = v59;
              goto LABEL_76;
            }
          }
          v12 = v105;
          goto LABEL_78;
        }
        if (v59)
        {
          *(_QWORD *)(v20 + v12 - 96) = v59;
          operator delete(v59);
          v64 = 0;
          *v58 = 0;
          *(_QWORD *)(v20 + v12 - 96) = 0;
          *(_QWORD *)(v20 + v12 - 88) = 0;
        }
        if ((v62 & 0x8000000000000000) != 0)
          goto LABEL_121;
        v65 = v64 >> 2;
        if (v64 >> 2 <= v63)
          v65 = (v61 - v60) >> 3;
        v31 = (unint64_t)v64 >= 0x7FFFFFFFFFFFFFF8;
        v66 = 0x1FFFFFFFFFFFFFFFLL;
        if (!v31)
          v66 = v65;
        if (v66 >> 61)
LABEL_121:
          sub_1BE61F930();
        v67 = 8 * v66;
        v68 = (char *)operator new(8 * v66);
        v59 = v68;
        *v58 = v68;
        *(_QWORD *)(v20 + v12 - 96) = v68;
        v69 = (_QWORD *)(v20 + v12 - 96);
        *(_QWORD *)(v57 - 88) = &v68[v67];
        if (v61 != v60)
          memcpy(v68, v60, v61 - v60);
LABEL_78:
        *v69 = &v59[v62];
        v74 = v20 + v12;
        sub_1BE77E7C0(v20 + v12 - 80, *(_QWORD **)(v20 + v12 + 144), (_QWORD *)(v12 + v106 + 152));
        *(_DWORD *)(v74 - 56) = *(_DWORD *)(v74 + 168);
        *(_WORD *)(v74 - 52) = *(_WORD *)(v74 + 172);
        v76 = (void **)(v20 + v12 - 48);
        v75 = (char *)*v76;
        v77 = *(char **)(v20 + v12 + 176);
        v78 = *(_BYTE **)(v20 + v12 + 184);
        v79 = v78 - v77;
        v80 = (v78 - v77) >> 2;
        v81 = *(_QWORD *)(v20 + v12 - 32);
        if (v80 > (v81 - (uint64_t)*v76) >> 2)
        {
          if (v75)
          {
            *(_QWORD *)(v20 + v12 - 40) = v75;
            operator delete(v75);
            v81 = 0;
            *v76 = 0;
            *(_QWORD *)(v74 - 40) = 0;
            *(_QWORD *)(v74 - 32) = 0;
          }
          if ((v79 & 0x8000000000000000) != 0)
            goto LABEL_122;
          v82 = v81 >> 1;
          if (v81 >> 1 <= v80)
            v82 = (v78 - v77) >> 2;
          v31 = (unint64_t)v81 >= 0x7FFFFFFFFFFFFFFCLL;
          v83 = 0x3FFFFFFFFFFFFFFFLL;
          if (!v31)
            v83 = v82;
          if (v83 >> 62)
LABEL_122:
            sub_1BE61F930();
          v84 = 4 * v83;
          v85 = (char *)operator new(4 * v83);
          v75 = v85;
          *v76 = v85;
          *(_QWORD *)(v20 + v12 - 40) = v85;
          v86 = (_QWORD *)(v20 + v12 - 40);
          *(_QWORD *)(v74 - 32) = &v85[v84];
          if (v78 != v77)
            memcpy(v85, v77, v78 - v77);
          goto LABEL_17;
        }
        v86 = v107 + 23;
        v87 = *(_BYTE **)(v74 - 40);
        v88 = (v87 - v75) >> 2;
        if (v88 >= v80)
        {
          if (v78 == v77)
            goto LABEL_16;
          v90 = *(void **)(v74 - 48);
          v89 = *(char **)(v74 + 176);
        }
        else
        {
          if (v87 != v75)
          {
            memmove(*(void **)(v74 - 48), *(const void **)(v74 + 176), v87 - v75);
            v75 = *(char **)(v74 - 40);
          }
          v89 = &v77[4 * v88];
          v79 = v78 - v89;
          if (v78 == v89)
            goto LABEL_16;
          v90 = v75;
        }
        memmove(v90, v89, v79);
LABEL_16:
        v12 = v105;
LABEL_17:
        *v86 = &v75[v79];
        std::string::operator=((std::string *)(v20 + v12 - 24), (const std::string *)(v20 + v12 + 200));
        v17 = (uint64_t)(v107 + 28);
        v21 = v106 + 224;
        v20 += 224;
        if (v20 + v12 == v5)
        {
          v7 = (uint64_t *)a3;
          v15 = v102;
          v5 = *((_QWORD *)a3 + 1);
          v17 = v12 + v106;
          v13 = v103;
          v10 = v104;
LABEL_97:
          if (v5 == v17)
          {
LABEL_7:
            v7[1] = v17;
            v5 = v17;
            goto LABEL_8;
          }
          while (2)
          {
            if (*(char *)(v5 - 1) < 0)
            {
              operator delete(*(void **)(v5 - 24));
              v92 = *(void **)(v5 - 48);
              if (v92)
              {
LABEL_104:
                *(_QWORD *)(v5 - 40) = v92;
                operator delete(v92);
              }
            }
            else
            {
              v92 = *(void **)(v5 - 48);
              if (v92)
                goto LABEL_104;
            }
            sub_1BE62033C(v5 - 80, *(_QWORD **)(v5 - 72));
            v93 = *(void **)(v5 - 104);
            if (v93)
            {
              *(_QWORD *)(v5 - 96) = v93;
              operator delete(v93);
            }
            v94 = *(void **)(v5 - 128);
            if (v94)
            {
              *(_QWORD *)(v5 - 120) = v94;
              operator delete(v94);
            }
            v95 = *(void **)(v5 - 152);
            if (v95)
            {
              *(_QWORD *)(v5 - 144) = v95;
              operator delete(v95);
            }
            v96 = *(_QWORD *)(v5 - 176);
            if (v96)
            {
              v97 = *(_QWORD *)(v5 - 168);
              v91 = *(void **)(v5 - 176);
              if (v97 != v96)
              {
                v98 = *(_QWORD *)(v5 - 168);
                do
                {
                  v100 = *(void **)(v98 - 24);
                  v98 -= 24;
                  v99 = v100;
                  if (v100)
                  {
                    *(_QWORD *)(v97 - 16) = v99;
                    operator delete(v99);
                  }
                  v97 = v98;
                }
                while (v98 != v96);
                v91 = *(void **)(v5 - 176);
              }
              *(_QWORD *)(v5 - 168) = v96;
              operator delete(v91);
            }
            sub_1BE67AC7C(v5 - 200, *(_QWORD **)(v5 - 192));
            sub_1BE77D58C(v5 - 224, *(char **)(v5 - 216));
            v5 -= 224;
            if (v5 == v17)
              goto LABEL_7;
            continue;
          }
        }
      }
      v35 = v107 + 10;
      v36 = *(_BYTE **)(v22 - 144);
      v37 = (v36 - v23) >> 2;
      if (v37 >= v28)
      {
        if (v26 == v25)
        {
LABEL_37:
          v12 = v105;
          goto LABEL_38;
        }
        v39 = *(void **)(v22 - 152);
        v38 = *(char **)(v22 + 72);
      }
      else
      {
        if (v36 != v23)
        {
          memmove(*(void **)(v22 - 152), *(const void **)(v22 + 72), v36 - v23);
          v23 = *(char **)(v22 - 144);
        }
        v38 = &v25[4 * v37];
        v27 = v26 - v38;
        if (v26 == v38)
          goto LABEL_37;
        v39 = v23;
      }
      memmove(v39, v38, v27);
      goto LABEL_37;
    }
    v9 = *(float *)(v4 + 168);
    if (v6 >= 225)
      goto LABEL_6;
  }
}

- (id)_bestPathTokensFromDecodingStates:(const void *)a3 drawing:(id)a4 codemap:(const void *)a5
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD, __n128);
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __n128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint64_t *v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  uint64_t *v57;
  id v59;
  id v60;
  id v61;
  uint8_t buf[16];
  _QWORD v63[4];
  id v64;
  const void *v65;

  v59 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v61 = (id)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = sub_1BE89D140;
  v63[3] = &unk_1E77F6648;
  v65 = a5;
  v60 = v59;
  v64 = v60;
  v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, __n128))MEMORY[0x1C3B81A84](v63);
  v17 = *(_QWORD *)a3;
  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    v18 = 0;
    do
    {
      v19 = (_QWORD *)(v17 + 224 * v18);
      v20 = (uint64_t)(v19[10] - v19[9]) >> 2;
      if (v20 != 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v19[7] - v19[6]) >> 3))
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v21 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE607000, v21, OS_LOG_TYPE_FAULT, "Predicted sequence and segmentation have different length", buf, 2u);
        }

        v20 = (uint64_t)(*(_QWORD *)(*(_QWORD *)a3 + 224 * v18 + 80) - *(_QWORD *)(*(_QWORD *)a3 + 224 * v18 + 72)) >> 2;
      }
      objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v12, v20, v13, v14, v15);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *(_QWORD *)a3;
      if ((int)((*(_QWORD *)(*(_QWORD *)a3 + 224 * v18 + 80) - *(_QWORD *)(*(_QWORD *)a3 + 224 * v18 + 72)) >> 2) >= 1)
      {
        v29 = 0;
        do
        {
          v30 = v28 + 224 * v18;
          v33 = *(_QWORD *)(v30 + 152);
          v31 = v30 + 152;
          v32 = v33;
          v27.n128_u64[0] = 0;
          if (!v33)
            goto LABEL_22;
          v34 = v31;
          v35 = v32;
          do
          {
            v36 = *(int *)(v35 + 28);
            v37 = v29 <= v36;
            if (v29 <= v36)
              v38 = (uint64_t *)v35;
            else
              v38 = (uint64_t *)(v35 + 8);
            if (v37)
              v34 = v35;
            v35 = *v38;
          }
          while (*v38);
          if (v34 != v31 && v29 >= *(int *)(v34 + 28))
          {
            v45 = v31;
            do
            {
              v46 = *(int *)(v32 + 28);
              v47 = v29 <= v46;
              if (v29 <= v46)
                v48 = (uint64_t *)v32;
              else
                v48 = (uint64_t *)(v32 + 8);
              if (v47)
                v45 = v32;
              v32 = *v48;
            }
            while (*v48);
            if (v45 == v31 || v29 < *(int *)(v45 + 28))
              v45 = v31;
            v49 = *(_QWORD *)a5 + 24 * *(int *)(v45 + 32);
            if (*(char *)(v49 + 23) < 0)
              v49 = *(_QWORD *)v49;
            objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v22, v49, v23, v24, v25, 0.0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = *(_QWORD *)a3;
            v50 = *(_QWORD *)a3 + 224 * v18;
            v53 = *(_QWORD *)(v50 + 152);
            v51 = v50 + 152;
            v52 = v53;
            if (!v53)
              goto LABEL_49;
            v54 = v51;
            do
            {
              v55 = *(int *)(v52 + 28);
              v56 = v29 <= v55;
              if (v29 <= v55)
                v57 = (uint64_t *)v52;
              else
                v57 = (uint64_t *)(v52 + 8);
              if (v56)
                v54 = v52;
              v52 = *v57;
            }
            while (*v57);
            if (v54 == v51 || v29 < *(int *)(v54 + 28))
LABEL_49:
              v54 = v51;
            v27.n128_f64[0] = *(float *)(v54 + 36);
          }
          else
          {
LABEL_22:
            v39 = 0;
          }
          ((void (**)(_QWORD, unint64_t, uint64_t, void *, __n128))v16)[2](v16, v28 + 224 * v18, v29, v39, v27);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v26, v41, (uint64_t)v40, v42, v43, v44);

          ++v29;
          v28 = *(_QWORD *)a3;
        }
        while (v29 < (int)((*(_QWORD *)(*(_QWORD *)a3 + 224 * v18 + 80) - *(_QWORD *)(*(_QWORD *)a3 + 224 * v18 + 72)) >> 2));
      }
      objc_msgSend_addObject_(v61, v22, (uint64_t)v26, v23, v24, v25);

      ++v18;
      v17 = *(_QWORD *)a3;
    }
    while (v18 < 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5));
  }

  return v61;
}

- (CHSingletonMLModel)encoderModel
{
  return self->_encoderModel;
}

- (CHSingletonMLModel)decoderModel
{
  return self->_decoderModel;
}

- (NSArray)codeMap
{
  return self->_codeMap;
}

- (int64_t)eosIndex
{
  return self->_eosIndex;
}

- (int64_t)maxDecodingSteps
{
  return self->_maxDecodingSteps;
}

- (float)segmentationAttThreshold
{
  return self->_segmentationAttThreshold;
}

- (int64_t)encoderCompressionFactor
{
  return self->_encoderCompressionFactor;
}

- (int64_t)renderSymbolSize
{
  return self->_renderSymbolSize;
}

- (int64_t)minInputHeight
{
  return self->_minInputHeight;
}

- (int64_t)maxInputHeight
{
  return self->_maxInputHeight;
}

- (int64_t)minInputWidth
{
  return self->_minInputWidth;
}

- (int64_t)maxInputWidth
{
  return self->_maxInputWidth;
}

- (int64_t)padToMultipleOf
{
  return self->_padToMultipleOf;
}

- (int64_t)enlargeSingleDotBy
{
  return self->_enlargeSingleDotBy;
}

- (int64_t)numInputChannels
{
  return self->_numInputChannels;
}

- (int64_t)numOutputClasses
{
  return self->_numOutputClasses;
}

- (NSSet)definedMathFunctionNameSet
{
  return self->_definedMathFunctionNameSet;
}

- (void)setDefinedMathFunctionNameSet:(id)a3
{
  objc_storeStrong((id *)&self->_definedMathFunctionNameSet, a3);
}

- (NSArray)recognitionLocales
{
  return self->_recognitionLocales;
}

- (void)setRecognitionLocales:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSSet)activeAlphabet
{
  return self->_activeAlphabet;
}

- (void)setActiveAlphabet:(id)a3
{
  objc_storeStrong((id *)&self->_activeAlphabet, a3);
}

- (NSSet)declaredVariables
{
  return self->_declaredVariables;
}

- (void)setDeclaredVariables:(id)a3
{
  objc_storeStrong((id *)&self->_declaredVariables, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declaredVariables, 0);
  objc_storeStrong((id *)&self->_activeAlphabet, 0);
  objc_storeStrong((id *)&self->_recognitionLocales, 0);
  objc_storeStrong((id *)&self->_definedMathFunctionNameSet, 0);
  objc_storeStrong((id *)&self->_codeMap, 0);
  objc_storeStrong((id *)&self->_decoderModel, 0);
  objc_storeStrong((id *)&self->_encoderModel, 0);
}

@end
