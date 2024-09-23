@implementation CHSynthesisStyleSample

+ (double)normalizationTextHeight
{
  return 16.0;
}

+ (vector<float,)floatMultiArrayToVector:(id)a2
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  _BYTE *v23;
  int64_t v24;
  float *v25;
  float *v26;
  vector<float, std::allocator<float>> *result;
  _QWORD v28[5];
  __int128 buf;
  uint64_t v30;
  __n128 (*v31)(__n128 *, __n128 *);
  void (*v32)(uint64_t);
  void *v33;
  void *__p;
  void *v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend_dataType(v5, v6, v7, v8, v9, v10) != 65568)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v15 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend_dataType(v5, v16, v17, v18, v19, v20);
      _os_log_impl(&dword_1BE607000, v15, OS_LOG_TYPE_FAULT, "Unexpected data type from mlMultiArray: %ld", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x4812000000;
  v31 = sub_1BE6D12D0;
  v32 = sub_1BE6D12F4;
  v33 = &unk_1BE94989A;
  __p = 0;
  v35 = 0;
  v36 = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1BE6D130C;
  v28[3] = &unk_1E77F37A0;
  v28[4] = &buf;
  objc_msgSend_getBytesWithHandler_(v5, v11, (uint64_t)v28, v12, v13, v14);
  v21 = *((_QWORD *)&buf + 1);
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  v23 = *(_BYTE **)(v21 + 48);
  v22 = *(_BYTE **)(v21 + 56);
  v24 = v22 - v23;
  if (v22 != v23)
  {
    if (v24 < 0)
      sub_1BE61F930();
    v25 = (float *)operator new(v22 - v23);
    retstr->__begin_ = v25;
    v26 = &v25[v24 >> 2];
    retstr->__end_cap_.__value_ = v26;
    memcpy(v25, v23, v24);
    retstr->__end_ = v26;
  }
  _Block_object_dispose(&buf, 8);
  if (__p)
  {
    v35 = __p;
    operator delete(__p);
  }

  return result;
}

+ (vector<float,)floatArrayToVector:(id)a2
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t *v17;
  _BYTE *v18;
  _BYTE *v19;
  int64_t v20;
  float *v21;
  float *v22;
  vector<float, std::allocator<float>> *result;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  __n128 (*v28)(__n128 *, __n128 *);
  void (*v29)(uint64_t);
  void *v30;
  void *__p;
  char *v32;
  char *v33;

  v5 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x4812000000;
  v28 = sub_1BE6D12D0;
  v29 = sub_1BE6D12F4;
  v30 = &unk_1BE94989A;
  v15 = objc_msgSend_count(v5, v6, v7, v8, v9, v10);
  __p = 0;
  v32 = 0;
  v33 = 0;
  if (v15)
  {
    if (v15 >> 62)
      sub_1BE61F930();
    v16 = (char *)operator new(4 * v15);
    __p = v16;
    v33 = &v16[4 * v15];
    bzero(v16, 4 * v15);
    v32 = &v16[4 * v15];
  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1BE6D15B8;
  v24[3] = &unk_1E77F37C8;
  v24[4] = &v25;
  objc_msgSend_enumerateObjectsUsingBlock_(v5, v11, (uint64_t)v24, v12, v13, v14);
  v17 = v26;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  v19 = (_BYTE *)v17[6];
  v18 = (_BYTE *)v17[7];
  v20 = v18 - v19;
  if (v18 != v19)
  {
    if (v20 < 0)
      sub_1BE61F930();
    v21 = (float *)operator new(v18 - v19);
    retstr->__begin_ = v21;
    v22 = &v21[v20 >> 2];
    retstr->__end_cap_.__value_ = v22;
    memcpy(v21, v19, v20);
    retstr->__end_ = v22;
  }
  _Block_object_dispose(&v25, 8);
  if (__p)
  {
    v32 = (char *)__p;
    operator delete(__p);
  }

  return result;
}

+ (id)floatVectorToArray:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  _DWORD *v14;
  _DWORD *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2, v3, v4, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_DWORD **)a3;
  v15 = (_DWORD *)*((_QWORD *)a3 + 1);
  if (*(_DWORD **)a3 != v15)
  {
    do
    {
      LODWORD(v13) = *v14;
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v7, v8, v9, v10, v11, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v12, v17, (uint64_t)v16, v18, v19, v20);

      ++v14;
    }
    while (v14 != v15);
  }
  return v12;
}

+ (float)distanceBetweenFirstVector:(const void *)a3 secondVector:(const void *)a4
{
  float __C;

  __C = -1.0;
  vDSP_distancesq(*(const float **)a3, 1, *(const float **)a4, 1, &__C, (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
  return sqrtf(__C);
}

+ (float)cosineSimilarityBetweenFirstVector:(const void *)a3 secondVector:(const void *)a4
{
  float __C;

  __C = -1.0;
  vDSP_dotpr(*(const float **)a3, 1, *(const float **)a4, 1, &__C, (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
  return __C;
}

+ (void)normalizeVector:(void *)a3
{
  const float *v3;
  uint64_t v4;
  double v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[12];
  float __C;

  v3 = *(const float **)a3;
  v4 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
  if (v4)
  {
    __C = -1.0;
    vDSP_dotpr(v3, 1, v3, 1, &__C, v4 >> 2);
    __C = sqrtf(__C);
    v6 = fabsf(__C);
    if (v6 <= 0.0000001)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v7 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_FAULT, "Style Inventory Embedding: Magnitude of the vector is very close to 0", buf, 2u);
      }

      v6 = fabsf(__C);
    }
    if (v6 >= 0.0000001)
    {
      vDSP_vsdiv(*(const float **)a3, 1, &__C, *(float **)a3, 1, (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
    }
    else
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v8 = (id)qword_1EF568E60;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1BE607000, v8, OS_LOG_TYPE_ERROR, "Style Inventory Embedding: Magnitude of the vector is very close to 0, will not normalize the vector", v9, 2u);
      }

    }
  }
}

+ (id)normalizeDrawing:(id)a3 transcription:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  CHTransformationParameters *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  void *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint8_t buf[4];
  id v86;
  __int16 v87;
  id v88;
  id v89;
  _QWORD v90[2];

  v90[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v12 = objc_msgSend_strokeCount(v5, v7, v8, v9, v10, v11);
  if (v6 && v12)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v13 = (id)qword_1EF568E60;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v13, OS_LOG_TYPE_DEBUG, "Style Sampling: Normalizing the style sample by applying rotation and resize transformations", buf, 2u);
    }

    v19 = objc_msgSend_strokeCount(v5, v14, v15, v16, v17, v18);
    objc_msgSend_indexSetWithIndexesInRange_(MEMORY[0x1E0CB36B8], v20, 0, v19, v21, v22);
    v82 = objc_claimAutoreleasedReturnValue();
    v90[0] = v82;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v23, (uint64_t)v90, 1, v24, v25);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v6;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v26, (uint64_t)&v89, 1, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v30, (uint64_t)CFSTR("en_US"), v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_opt_class();
    objc_msgSend_textLineForDrawing_transcriptions_strokeIndexes_fullText_locale_strokeClassification_shouldCancel_(v35, v36, (uint64_t)v5, (uint64_t)v29, (uint64_t)v83, (uint64_t)v6, v34, 1, &unk_1E77F1690);
    v37 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v37;
    if (v37)
    {
      v84 = v37;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v38, (uint64_t)&v84, 1, v39, v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_alloc_init(CHTransformationParameters);
      if ((unint64_t)objc_msgSend_length(v6, v44, v45, v46, v47, v48) >= 3)
        objc_msgSend_setOrientationBehavior_(v43, v49, 2, v50, v51, v52);
      objc_msgSend_setResizeBehavior_(v43, v49, 3, v50, v51, v52);
      objc_msgSend_normalizationTextHeight(CHSynthesisStyleSample, v53, v54, v55, v56, v57);
      objc_msgSend_setTextSizeTarget_(v43, v59, (unint64_t)v58, v60, v61, v62);
      objc_msgSend_setInsertionPoint_(v43, v63, v64, v65, v66, v67, 100.0, 100.0);
      v68 = (void *)objc_opt_class();
      objc_msgSend_transformTextLines_withParameters_(v68, v69, (uint64_t)v42, (uint64_t)v43, v70, v71);
      objc_msgSend_drawingForTransformedTextLines_(CHTextTransformationManager, v72, (uint64_t)v42, v73, v74, v75);
      v76 = (id)objc_claimAutoreleasedReturnValue();
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v77 = (void *)v82;
      v78 = (id)qword_1EF568E60;
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v78, OS_LOG_TYPE_DEBUG, "Style Sampling: Return the new style sample with normalized drawing", buf, 2u);
      }

    }
    else
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v77 = (void *)v82;
      v80 = (id)qword_1EF568E60;
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v86 = v5;
        v87 = 2112;
        v88 = v6;
        _os_log_impl(&dword_1BE607000, v80, OS_LOG_TYPE_DEBUG, "Transformed text line is nil for drawing %@ and transcription %@", buf, 0x16u);
      }

      v76 = v5;
    }

  }
  else
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v79 = (id)qword_1EF568E60;
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v79, OS_LOG_TYPE_ERROR, "Style Sampling: Cannot transform style sample with nil or empty drawing or nil transcription", buf, 2u);
    }

    v76 = v5;
  }

  return v76;
}

+ (id)normalizeStyleSample:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;

  v3 = a3;
  objc_msgSend_drawing(v3, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcription(v3, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_normalizeDrawing_transcription_(CHSynthesisStyleSample, v16, (uint64_t)v9, (uint64_t)v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_transcription(v3, v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifiers(v3, v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sampleWithTranscription_drawing_strokeIdentifiers_(CHSynthesisStyleSample, v32, (uint64_t)v25, (uint64_t)v19, (uint64_t)v31, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (void)clearEmbeddingVector
{
  self->_embeddingVector.__end_ = self->_embeddingVector.__begin_;
}

- (BOOL)hasEmbeddingVector
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;

  objc_msgSend_embeddingVector(self, a2, v2, v3, v4, v5);
  if (v7)
    operator delete(v7);
  return v8 != v7;
}

- (void)updateStyleEmbedding:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *__p[3];

  v9 = a3;
  if (v9)
  {
    objc_msgSend_floatMultiArrayToVector_(CHSynthesisStyleSample, v4, (uint64_t)v9, v6, v7, v8);
    objc_msgSend_setEmbeddingVector_(self, v10, (uint64_t)__p, v11, v12, v13);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    objc_msgSend_normalizeVector_(CHSynthesisStyleSample, v14, (uint64_t)&self->_embeddingVector, v15, v16, v17);
  }
  else
  {
    objc_msgSend_clearEmbeddingVector(self, v4, v5, v6, v7, v8);
  }

}

- (float)distanceToSample:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  float v41;
  void *v43;
  uint64_t v44;
  void *__p;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint8_t buf[8];
  void *v51;

  v4 = a3;
  objc_msgSend_embeddingVector(self, v5, v6, v7, v8, v9);
  v15 = v51;
  if (v51 != *(void **)buf)
  {
    if (!v4)
    {
      v27 = 0;
      goto LABEL_15;
    }
    objc_msgSend_embeddingVector(v4, v10, v11, v12, v13, v14);
    v21 = v48;
    if (v48 == v47)
    {
      v27 = 0;
      if (!v48)
        goto LABEL_15;
    }
    else
    {
      objc_msgSend_embeddingVector(self, v16, v17, v18, v19, v20);
      objc_msgSend_embeddingVector(v4, v22, v23, v24, v25, v26);
      v27 = v46 - (_QWORD)__p == v44 - (_QWORD)v43;
      if (v43)
        operator delete(v43);
      if (__p)
        operator delete(__p);
      v21 = v47;
      if (!v47)
      {
LABEL_15:
        v15 = *(void **)buf;
        if (!*(_QWORD *)buf)
          goto LABEL_17;
        goto LABEL_16;
      }
    }
    v48 = v21;
    operator delete(v21);
    goto LABEL_15;
  }
  v27 = 0;
  if (v51)
  {
LABEL_16:
    v51 = v15;
    operator delete(v15);
  }
LABEL_17:
  if (!v27)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v28 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v28, OS_LOG_TYPE_FAULT, "While calculating distanceToSample, one of the embedding vectors is empty or not the same size as the other vector", buf, 2u);
    }

  }
  v29 = (void *)objc_opt_class();
  objc_msgSend_embeddingVector(self, v30, v31, v32, v33, v34);
  if (v4)
  {
    objc_msgSend_embeddingVector(v4, v35, v36, v37, v38, v39);
  }
  else
  {
    v47 = 0;
    v48 = 0;
    v49 = 0;
  }
  objc_msgSend_distanceBetweenFirstVector_secondVector_(v29, v35, (uint64_t)buf, (uint64_t)&v47, v38, v39);
  v41 = v40;
  if (v47)
  {
    v48 = v47;
    operator delete(v47);
  }
  if (*(_QWORD *)buf)
  {
    v51 = *(void **)buf;
    operator delete(*(void **)buf);
  }

  return v41;
}

- (float)cosineSimilarityToSample:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  float v41;
  void *v43;
  uint64_t v44;
  void *__p;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint8_t buf[8];
  void *v51;

  v4 = a3;
  objc_msgSend_embeddingVector(self, v5, v6, v7, v8, v9);
  v15 = v51;
  if (v51 != *(void **)buf)
  {
    if (!v4)
    {
      v27 = 0;
      goto LABEL_15;
    }
    objc_msgSend_embeddingVector(v4, v10, v11, v12, v13, v14);
    v21 = v48;
    if (v48 == v47)
    {
      v27 = 0;
      if (!v48)
        goto LABEL_15;
    }
    else
    {
      objc_msgSend_embeddingVector(self, v16, v17, v18, v19, v20);
      objc_msgSend_embeddingVector(v4, v22, v23, v24, v25, v26);
      v27 = v46 - (_QWORD)__p == v44 - (_QWORD)v43;
      if (v43)
        operator delete(v43);
      if (__p)
        operator delete(__p);
      v21 = v47;
      if (!v47)
      {
LABEL_15:
        v15 = *(void **)buf;
        if (!*(_QWORD *)buf)
          goto LABEL_17;
        goto LABEL_16;
      }
    }
    v48 = v21;
    operator delete(v21);
    goto LABEL_15;
  }
  v27 = 0;
  if (v51)
  {
LABEL_16:
    v51 = v15;
    operator delete(v15);
  }
LABEL_17:
  if (!v27)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v28 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v28, OS_LOG_TYPE_FAULT, "While calculating cosineSimilarityToSample, one of the embedding vectors is emptyor not the same size as the other vector", buf, 2u);
    }

  }
  v29 = (void *)objc_opt_class();
  objc_msgSend_embeddingVector(self, v30, v31, v32, v33, v34);
  if (v4)
  {
    objc_msgSend_embeddingVector(v4, v35, v36, v37, v38, v39);
  }
  else
  {
    v47 = 0;
    v48 = 0;
    v49 = 0;
  }
  objc_msgSend_cosineSimilarityBetweenFirstVector_secondVector_(v29, v35, (uint64_t)buf, (uint64_t)&v47, v38, v39);
  v41 = v40;
  if (v47)
  {
    v48 = v47;
    operator delete(v47);
  }
  if (*(_QWORD *)buf)
  {
    v51 = *(void **)buf;
    operator delete(*(void **)buf);
  }

  return v41;
}

- (CHSynthesisStyleSample)initWithTranscription:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5 embeddingVector:(const void *)a6
{
  id v11;
  id v12;
  id v13;
  CHSynthesisStyleSample *v14;
  CHSynthesisStyleSample *v15;
  CHSynthesisStyleSample *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSDate *creationDate;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CHSynthesisStyleSample;
  v14 = -[CHSynthesisStyleSample init](&v29, sel_init);
  v15 = v14;
  v16 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_transcription, a3);
    objc_storeStrong((id *)&v15->_drawing, a4);
    objc_storeStrong((id *)&v15->_strokeIdentifiers, a5);
    if (&v15->_embeddingVector != a6)
      sub_1BE66E294(&v15->_embeddingVector.__begin_, *(char **)a6, *((char **)a6 + 1), (uint64_t)(*((_QWORD *)a6 + 1) - *(_QWORD *)a6) >> 2);
    objc_msgSend_now(MEMORY[0x1E0C99D68], v17, v18, v19, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    creationDate = v16->_creationDate;
    v16->_creationDate = (NSDate *)v22;

    objc_msgSend_normalizeVector_(CHSynthesisStyleSample, v24, (uint64_t)&v15->_embeddingVector, v25, v26, v27);
  }

  return v16;
}

+ (id)sampleWithTranscription:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5
{
  id v7;
  id v8;
  id v9;
  CHSynthesisStyleSample *v10;
  const char *v11;
  void *v12;
  void *__p;
  void *v15;
  uint64_t v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  __p = 0;
  v15 = 0;
  v16 = 0;
  v10 = [CHSynthesisStyleSample alloc];
  v12 = (void *)objc_msgSend_initWithTranscription_drawing_strokeIdentifiers_embeddingVector_(v10, v11, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)&__p);
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }

  return v12;
}

+ (id)sampleWithTranscription:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5 embeddingVector:(const void *)a6
{
  id v9;
  id v10;
  id v11;
  CHSynthesisStyleSample *v12;
  const char *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = [CHSynthesisStyleSample alloc];
  v14 = (void *)objc_msgSend_initWithTranscription_drawing_strokeIdentifiers_embeddingVector_(v12, v13, (uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)a6);

  return v14;
}

- (CHSynthesisStyleSample)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CHSynthesisStyleSample *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSDate *creationDate;
  void *__p[3];

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("transcription"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("drawing"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend_setWithObjects_(v15, v18, v16, v19, v20, v21, v17, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, (uint64_t)CFSTR("strokeIdentifiers"), v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_class();
  objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v28, v27, (uint64_t)CFSTR("embeddingVector"), v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatArrayToVector_(CHSynthesisStyleSample, v32, (uint64_t)v31, v33, v34, v35);
  v41 = (CHSynthesisStyleSample *)objc_msgSend_initWithTranscription_drawing_strokeIdentifiers_embeddingVector_(self, v36, (uint64_t)v9, (uint64_t)v14, (uint64_t)v26, (uint64_t)__p);
  if (v41)
  {
    v41->_creationTimestep = objc_msgSend_decodeIntegerForKey_(v4, v37, (uint64_t)CFSTR("creationTimestep"), v38, v39, v40);
    v41->_samplingCount = objc_msgSend_decodeIntegerForKey_(v4, v42, (uint64_t)CFSTR("samplingCount"), v43, v44, v45);
    v46 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, (uint64_t)CFSTR("creationDate"), v48, v49);
    v50 = objc_claimAutoreleasedReturnValue();
    creationDate = v41->_creationDate;
    v41->_creationDate = (NSDate *)v50;

  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v41;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v30 = a3;
  objc_msgSend_encodeObject_forKey_(v30, v4, (uint64_t)self->_transcription, (uint64_t)CFSTR("transcription"), v5, v6);
  objc_msgSend_encodeObject_forKey_(v30, v7, (uint64_t)self->_drawing, (uint64_t)CFSTR("drawing"), v8, v9);
  objc_msgSend_encodeObject_forKey_(v30, v10, (uint64_t)self->_strokeIdentifiers, (uint64_t)CFSTR("strokeIdentifiers"), v11, v12);
  objc_msgSend_floatVectorToArray_(CHSynthesisStyleSample, v13, (uint64_t)&self->_embeddingVector, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v30, v18, (uint64_t)v17, (uint64_t)CFSTR("embeddingVector"), v19, v20);

  objc_msgSend_encodeInteger_forKey_(v30, v21, self->_creationTimestep, (uint64_t)CFSTR("creationTimestep"), v22, v23);
  objc_msgSend_encodeInteger_forKey_(v30, v24, self->_samplingCount, (uint64_t)CFSTR("samplingCount"), v25, v26);
  objc_msgSend_encodeObject_forKey_(v30, v27, (uint64_t)self->_creationDate, (uint64_t)CFSTR("creationDate"), v28, v29);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CHSynthesisStyleSample *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *__p[3];

  v3 = self;
  objc_msgSend_transcription(v3, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_drawing(v3, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifiers(v3, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_embeddingVector(v3, v22, v23, v24, v25, v26);
  v28 = (void *)objc_msgSend_initWithTranscription_drawing_strokeIdentifiers_embeddingVector_(v3, v27, (uint64_t)v9, (uint64_t)v15, (uint64_t)v21, (uint64_t)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  if (v28)
  {
    v34 = objc_msgSend_creationTimestep(v3, v29, v30, v31, v32, v33);
    objc_msgSend_setCreationTimestep_(v28, v35, v34, v36, v37, v38);
    v44 = objc_msgSend_samplingCount(v3, v39, v40, v41, v42, v43);
    objc_msgSend_setSamplingCount_(v28, v45, v44, v46, v47, v48);
  }
  return v28;
}

+ (id)characterCoverageWithString:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[4];
  id v28;

  v3 = a3;
  objc_msgSend_set(MEMORY[0x1E0C99E20], v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_length(v3, v10, v11, v12, v13, v14);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1BE6D2D5C;
  v27[3] = &unk_1E77F2070;
  v16 = v9;
  v28 = v16;
  objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v3, v17, 0, v15, 2, (uint64_t)v27);
  if (objc_msgSend_containsObject_(v16, v18, (uint64_t)CFSTR(" "), v19, v20, v21))
    objc_msgSend_removeObject_(v16, v22, (uint64_t)CFSTR(" "), v23, v24, v25);

  return v16;
}

- (id)characterCoverage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend_transcription(self, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_characterCoverageWithString_(CHSynthesisStyleSample, v7, (uint64_t)v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CHSynthesisStyleSample *v4;
  CHSynthesisStyleSample *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int isEqualToDrawing;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int isEqualToString;
  const char *v40;
  uint64_t v41;
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
  int isEqualToSet;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  float *v67;
  char *v68;
  float *v69;
  float *v70;
  float *v71;
  float v72;
  _BOOL4 v73;
  BOOL v74;
  char isEqualToDate;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  float *v110;
  uint64_t v111;
  char *v112;
  float *v113;

  v4 = (CHSynthesisStyleSample *)a3;
  if (self == v4)
  {
    isEqualToDate = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_drawing(self, v6, v7, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_drawing(v5, v12, v13, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToDrawing = objc_msgSend_isEqualToDrawing_(v11, v18, (uint64_t)v17, v19, v20, v21);

      if (!isEqualToDrawing)
        goto LABEL_29;
      objc_msgSend_transcription(self, v23, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcription(v5, v29, v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v28, v35, (uint64_t)v34, v36, v37, v38);

      if (!isEqualToString)
        goto LABEL_29;
      objc_msgSend_strokeIdentifiers(self, v40, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeIdentifiers(v5, v46, v47, v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToSet = objc_msgSend_isEqualToSet_(v45, v52, (uint64_t)v51, v53, v54, v55);

      if (!isEqualToSet)
        goto LABEL_29;
      objc_msgSend_embeddingVector(self, v57, v58, v59, v60, v61);
      if (v5)
      {
        objc_msgSend_embeddingVector(v5, v62, v63, v64, v65, v66);
        v67 = v110;
        v68 = v112;
        v69 = v113;
        if ((char *)v113 - v112 == v111 - (_QWORD)v110)
          goto LABEL_8;
      }
      else
      {
        v67 = 0;
        v68 = v112;
        v69 = v113;
        if (v113 == (float *)v112)
        {
LABEL_8:
          if (v68 == (char *)v69)
          {
            v73 = 1;
          }
          else
          {
            v70 = (float *)(v68 + 4);
            v71 = v67;
            do
            {
              v72 = *v71++;
              v73 = *(v70 - 1) == v72;
              v74 = *(v70 - 1) != v72 || v70 == v69;
              ++v70;
            }
            while (!v74);
          }
LABEL_21:
          if (v67)
          {
            operator delete(v67);
            v68 = v112;
          }
          if (v68)
            operator delete(v68);
          if (v73)
          {
            v76 = objc_msgSend_creationTimestep(self, v62, v63, v64, v65, v66);
            if (v76 == objc_msgSend_creationTimestep(v5, v77, v78, v79, v80, v81))
            {
              v87 = objc_msgSend_samplingCount(self, v82, v83, v84, v85, v86);
              if (v87 == objc_msgSend_samplingCount(v5, v88, v89, v90, v91, v92))
              {
                objc_msgSend_creationDate(self, v93, v94, v95, v96, v97);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_creationDate(v5, v99, v100, v101, v102, v103);
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                isEqualToDate = objc_msgSend_isEqualToDate_(v98, v105, (uint64_t)v104, v106, v107, v108);

LABEL_30:
                goto LABEL_31;
              }
            }
          }
LABEL_29:
          isEqualToDate = 0;
          goto LABEL_30;
        }
      }
      v73 = 0;
      goto LABEL_21;
    }
    isEqualToDate = 0;
  }
LABEL_31:

  return isEqualToDate;
}

- (void)incrementSamplingCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = objc_msgSend_samplingCount(self, a2, v2, v3, v4, v5) + 1;
  objc_msgSend_setSamplingCount_(self, v8, v7, v9, v10, v11);
}

- (void)shiftTimestepsByOffset:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = objc_msgSend_creationTimestep(self, a2, a3, v3, v4, v5);
  v12 = objc_msgSend_shiftTimestep_offset_(CHSynthesisStyleSample, v9, v8, a3, v10, v11);
  objc_msgSend_setCreationTimestep_(self, v13, v12, v14, v15, v16);
}

+ (int64_t)shiftTimestep:(int64_t)a3 offset:(int64_t)a4
{
  NSObject *v6;
  uint8_t v8[16];

  if (a4 < 0)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v6 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_FAULT, "Offset must be zero or positive", v8, 2u);
    }

  }
  if (a4 >= 0)
    return a3 - a4;
  else
    return 0x8000000000000000;
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (NSString)transcription
{
  return self->_transcription;
}

- (vector<float,)embeddingVector
{
  float *value;
  float *end;
  int64_t v6;
  float *v7;
  float *v8;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  end = self[2].__end_;
  value = self[2].__end_cap_.__value_;
  v6 = (char *)value - (char *)end;
  if (value != end)
  {
    if (v6 < 0)
      sub_1BE61F930();
    v7 = (float *)operator new((char *)value - (char *)end);
    retstr->__begin_ = v7;
    v8 = &v7[v6 >> 2];
    retstr->__end_cap_.__value_ = v8;
    self = (vector<float, std::allocator<float>> *)memcpy(v7, end, v6);
    retstr->__end_ = v8;
  }
  return self;
}

- (void)setEmbeddingVector:()vector<float
{
  vector<float, std::allocator<float>> *p_embeddingVector;

  p_embeddingVector = &self->_embeddingVector;
  if (p_embeddingVector != a3)
    sub_1BE66E294(p_embeddingVector, (char *)a3->__begin_, (char *)a3->__end_, a3->__end_ - a3->__begin_);
}

- (int64_t)creationTimestep
{
  return self->_creationTimestep;
}

- (void)setCreationTimestep:(int64_t)a3
{
  self->_creationTimestep = a3;
}

- (int64_t)samplingCount
{
  return self->_samplingCount;
}

- (void)setSamplingCount:(int64_t)a3
{
  self->_samplingCount = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSSet)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (void).cxx_destruct
{
  float *begin;

  begin = self->_embeddingVector.__begin_;
  if (begin)
  {
    self->_embeddingVector.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_transcription, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  return self;
}

@end
