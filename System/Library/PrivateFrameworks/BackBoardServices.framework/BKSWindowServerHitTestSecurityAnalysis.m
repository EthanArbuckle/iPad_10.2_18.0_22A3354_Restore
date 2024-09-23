@implementation BKSWindowServerHitTestSecurityAnalysis

+ (id)securityAnalysisFromCAHitTestDictionary:(id)a3 errorString:(id *)a4
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  id v25;
  int v26;
  id result;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v5 = a3;
  *a4 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v6 = (_QWORD *)getkCAWindowServerHitTestSecurityAnalysisOcclusionTypeSymbolLoc_ptr;
  v38 = getkCAWindowServerHitTestSecurityAnalysisOcclusionTypeSymbolLoc_ptr;
  if (!getkCAWindowServerHitTestSecurityAnalysisOcclusionTypeSymbolLoc_ptr)
  {
    v7 = QuartzCoreLibrary_8992();
    v6 = dlsym(v7, "kCAWindowServerHitTestSecurityAnalysisOcclusionType");
    v36[3] = (uint64_t)v6;
    getkCAWindowServerHitTestSecurityAnalysisOcclusionTypeSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v35, 8);
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v14 = 0;
LABEL_36:

      return v14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_msgSend(v8, "unsignedIntValue");
        v35 = 0;
        v36 = &v35;
        v37 = 0x2020000000;
        v15 = (_QWORD *)getkCAWindowServerHitTestSecurityAnalysisOcclusionPercentSymbolLoc_ptr;
        v38 = getkCAWindowServerHitTestSecurityAnalysisOcclusionPercentSymbolLoc_ptr;
        if (!getkCAWindowServerHitTestSecurityAnalysisOcclusionPercentSymbolLoc_ptr)
        {
          v16 = QuartzCoreLibrary_8992();
          v15 = dlsym(v16, "kCAWindowServerHitTestSecurityAnalysisOcclusionPercent");
          v36[3] = (uint64_t)v15;
          getkCAWindowServerHitTestSecurityAnalysisOcclusionPercentSymbolLoc_ptr = (uint64_t)v15;
        }
        _Block_object_dispose(&v35, 8);
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkCAWindowServerHitTestSecurityAnalysisOcclusionPercent(void)");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("BKSWindowServerHitTestSecurityAnalysis.m"), 29, CFSTR("%s"), dlerror());
          goto LABEL_42;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", *v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_opt_class();
        v19 = v17;
        if (v18)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v20 = v19;
          else
            v20 = 0;
        }
        else
        {
          v20 = 0;
        }
        v25 = v20;

        if (v25)
        {
          objc_msgSend(v25, "floatValue");
          v11 = v26;

          v13 = 0;
          goto LABEL_33;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("occlusionTypeMask is %X, but there is no percentage"), v12);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("occlusionType is unexpected class:%@"), objc_opt_class());
      }
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v9 = (_QWORD *)getkCAWindowServerOcclusionTypeLayerSymbolLoc_ptr;
    v38 = getkCAWindowServerOcclusionTypeLayerSymbolLoc_ptr;
    if (!getkCAWindowServerOcclusionTypeLayerSymbolLoc_ptr)
    {
      v10 = QuartzCoreLibrary_8992();
      v9 = dlsym(v10, "kCAWindowServerOcclusionTypeLayer");
      v36[3] = (uint64_t)v9;
      getkCAWindowServerOcclusionTypeLayerSymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(&v35, 8);
    if (v9)
    {
      v11 = 0;
      if ((objc_msgSend(v8, "isEqual:", *v9) & 1) != 0)
      {
        LODWORD(v12) = 0;
        v13 = 3;
LABEL_33:
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __94__BKSWindowServerHitTestSecurityAnalysis_securityAnalysisFromCAHitTestDictionary_errorString___block_invoke;
        v30[3] = &unk_1E1EA1408;
        v32 = v13;
        v33 = v12;
        v34 = v11;
        v31 = v5;
        +[BKSWindowServerHitTestSecurityAnalysis build:](BKSMutableWindowServerHitTestSecurityAnalysis, "build:", v30);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_36;
      }
      v35 = 0;
      v36 = &v35;
      v37 = 0x2020000000;
      v21 = (_QWORD *)getkCAWindowServerOcclusionTypeClippedSymbolLoc_ptr;
      v38 = getkCAWindowServerOcclusionTypeClippedSymbolLoc_ptr;
      if (!getkCAWindowServerOcclusionTypeClippedSymbolLoc_ptr)
      {
        v22 = QuartzCoreLibrary_8992();
        v21 = dlsym(v22, "kCAWindowServerOcclusionTypeClipped");
        v36[3] = (uint64_t)v21;
        getkCAWindowServerOcclusionTypeClippedSymbolLoc_ptr = (uint64_t)v21;
      }
      _Block_object_dispose(&v35, 8);
      if (v21)
      {
        if ((objc_msgSend(v8, "isEqual:", *v21) & 1) != 0)
        {
          LODWORD(v12) = 0;
          v13 = 2;
          goto LABEL_33;
        }
        v35 = 0;
        v36 = &v35;
        v37 = 0x2020000000;
        v23 = (_QWORD *)getkCAWindowServerOcclusionTypeBorderSymbolLoc_ptr;
        v38 = getkCAWindowServerOcclusionTypeBorderSymbolLoc_ptr;
        if (!getkCAWindowServerOcclusionTypeBorderSymbolLoc_ptr)
        {
          v24 = QuartzCoreLibrary_8992();
          v23 = dlsym(v24, "kCAWindowServerOcclusionTypeBorder");
          v36[3] = (uint64_t)v23;
          getkCAWindowServerOcclusionTypeBorderSymbolLoc_ptr = (uint64_t)v23;
        }
        _Block_object_dispose(&v35, 8);
        if (v23)
        {
          LODWORD(v12) = 0;
          v13 = objc_msgSend(v8, "isEqual:", *v23);
          goto LABEL_33;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkCAWindowServerOcclusionTypeBorder(void)");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("BKSWindowServerHitTestSecurityAnalysis.m"), 27, CFSTR("%s"), dlerror());
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkCAWindowServerOcclusionTypeClipped(void)");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("BKSWindowServerHitTestSecurityAnalysis.m"), 26, CFSTR("%s"), dlerror());
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkCAWindowServerOcclusionTypeLayer(void)");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("BKSWindowServerHitTestSecurityAnalysis.m"), 25, CFSTR("%s"), dlerror());
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkCAWindowServerHitTestSecurityAnalysisOcclusionType(void)");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("BKSWindowServerHitTestSecurityAnalysis.m"), 28, CFSTR("%s"), dlerror());
  }
LABEL_42:

  __break(1u);
  return result;
}

- (void)_initWithCopyOf:(void *)a1
{
  char *v3;
  char *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = a2;
  if (a1)
  {
    v4 = (char *)-[BKSWindowServerHitTestSecurityAnalysis _init](a1);
    a1 = v4;
    if (v4)
    {
      v5 = *(_OWORD *)(v3 + 8);
      v6 = *(_OWORD *)(v3 + 24);
      v7 = *(_OWORD *)(v3 + 40);
      *(_OWORD *)(v4 + 56) = *(_OWORD *)(v3 + 56);
      *(_OWORD *)(v4 + 40) = v7;
      *(_OWORD *)(v4 + 24) = v6;
      *(_OWORD *)(v4 + 8) = v5;
      v8 = *(_OWORD *)(v3 + 72);
      v9 = *(_OWORD *)(v3 + 88);
      v10 = *(_OWORD *)(v3 + 104);
      *(_OWORD *)(v4 + 120) = *(_OWORD *)(v3 + 120);
      *(_OWORD *)(v4 + 104) = v10;
      *(_OWORD *)(v4 + 88) = v9;
      *(_OWORD *)(v4 + 72) = v8;
      *((_DWORD *)v4 + 34) = *((_DWORD *)v3 + 34);
      v4[140] = v3[140];
      v4[141] = v3[141];
      *((_DWORD *)v4 + 36) = *((_DWORD *)v3 + 36);
      *((_DWORD *)v4 + 37) = *((_DWORD *)v3 + 37);
      *((_QWORD *)v4 + 19) = *((_QWORD *)v3 + 19);
    }
  }

  return a1;
}

- (id)_init
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  if (result)
  {
    v1 = result;
    v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__init, v1, CFSTR("BKSWindowServerHitTestSecurityAnalysis.m"), 144, CFSTR("BKSWindowServerHitTestSecurityAnalysis cannot be subclassed"));

      }
    }
    v5.receiver = v1;
    v5.super_class = (Class)BKSWindowServerHitTestSecurityAnalysis;
    return objc_msgSendSuper2(&v5, sel_init);
  }
  return result;
}

- (BKSWindowServerHitTestSecurityAnalysis)init
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BKSWindowServerHitTestSecurityAnalysis init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("BKSWindowServerHitTestSecurityAnalysis.m"), 133, CFSTR("cannot directly allocate BKSWindowServerHitTestSecurityAnalysis"));

  return 0;
}

- (unint64_t)hash
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  _OWORD v15[8];

  v3 = *(_OWORD *)&self->_cumulativeLayerTransform.m33;
  v15[4] = *(_OWORD *)&self->_cumulativeLayerTransform.m31;
  v15[5] = v3;
  v4 = *(_OWORD *)&self->_cumulativeLayerTransform.m43;
  v15[6] = *(_OWORD *)&self->_cumulativeLayerTransform.m41;
  v15[7] = v4;
  v5 = *(_OWORD *)&self->_cumulativeLayerTransform.m13;
  v15[0] = *(_OWORD *)&self->_cumulativeLayerTransform.m11;
  v15[1] = v5;
  v6 = *(_OWORD *)&self->_cumulativeLayerTransform.m23;
  v15[2] = *(_OWORD *)&self->_cumulativeLayerTransform.m21;
  v15[3] = v6;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v15, "{CATransform3D=dddddddddddddddd}");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hash");

  *(float *)&v8 = self->_cumulativeOpacity;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_occlusionMask);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hash");

  *(float *)&v11 = self->_occlusionPercentage;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_occlusionType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hash");

  return BSHashPurifyNS();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (char *)v4;
    v6 = (vminvq_u8((uint8x16_t)vcltzq_s8(vshlq_n_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(v5 + 8), *(float64x2_t *)&self->_cumulativeLayerTransform.m11), (int32x4_t)vceqq_f64(*(float64x2_t *)(v5 + 24), *(float64x2_t *)&self->_cumulativeLayerTransform.m13)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(v5 + 40), *(float64x2_t *)&self->_cumulativeLayerTransform.m21), (int32x4_t)vceqq_f64(*(float64x2_t *)(v5 + 56), *(float64x2_t *)&self->_cumulativeLayerTransform.m23))), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32(
                                                                (int32x4_t)vceqq_f64(*(float64x2_t *)(v5 + 72), *(float64x2_t *)&self->_cumulativeLayerTransform.m31), (int32x4_t)vceqq_f64(*(float64x2_t *)(v5 + 88), *(float64x2_t *)&self->_cumulativeLayerTransform.m33)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(v5 + 104), *(float64x2_t *)&self->_cumulativeLayerTransform.m41), (int32x4_t)vceqq_f64(*(float64x2_t *)(v5 + 120), *(float64x2_t *)&self->_cumulativeLayerTransform.m43)))), 7uLL))) & 1) != 0&& BSFloatEqualToFloat()&& v5[140] == self->_hasInsecureFilter&& v5[141] == self->_parentsHaveInsecureLayerProperties&& *((_DWORD *)v5 + 36) == self->_occlusionMask&& BSFloatEqualToFloat()&& *((_QWORD *)v5 + 19) == self->_occlusionType;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSWindowServerHitTestSecurityAnalysis _initWithCopyOf:]([BKSMutableWindowServerHitTestSecurityAnalysis alloc], self);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v4 = (void *)MEMORY[0x1E0CB3B18];
  v5 = *(_OWORD *)&self->_cumulativeLayerTransform.m33;
  v22 = *(_OWORD *)&self->_cumulativeLayerTransform.m31;
  v23 = v5;
  v6 = *(_OWORD *)&self->_cumulativeLayerTransform.m43;
  v24 = *(_OWORD *)&self->_cumulativeLayerTransform.m41;
  v25 = v6;
  v7 = *(_OWORD *)&self->_cumulativeLayerTransform.m13;
  v18 = *(_OWORD *)&self->_cumulativeLayerTransform.m11;
  v19 = v7;
  v8 = *(_OWORD *)&self->_cumulativeLayerTransform.m23;
  v20 = *(_OWORD *)&self->_cumulativeLayerTransform.m21;
  v21 = v8;
  v9 = a3;
  objc_msgSend(v4, "valueWithCATransform3D:", &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "appendObject:withName:", v10, CFSTR("cumulativeLayerTransform"), v18, v19, v20, v21, v22, v23, v24, v25);

  v12 = (id)objc_msgSend(v9, "appendFloat:withName:", CFSTR("cumulativeOpacity"), self->_cumulativeOpacity);
  v13 = (id)objc_msgSend(v9, "appendBool:withName:", self->_hasInsecureFilter, CFSTR("hasInsecureFilter"));
  v14 = (id)objc_msgSend(v9, "appendBool:withName:", self->_parentsHaveInsecureLayerProperties, CFSTR("parentsHaveInsecureLayerProperties"));
  v15 = (id)objc_msgSend(v9, "appendInt:withName:", self->_occlusionMask, CFSTR("occlusionMask"));
  v16 = (id)objc_msgSend(v9, "appendFloat:withName:", CFSTR("occlusionPercentage"), self->_occlusionPercentage);
  NSStringFromBKSWindowServerHitTestOcclusionType(self->_occlusionType);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:withName:", v17, CFSTR("occlusionType"));

}

- (CATransform3D)cumulativeLayerTransform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self->m34;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m32;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self->m44;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self->m42;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self->m14;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m12;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self->m24;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m22;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (float)cumulativeOpacity
{
  return self->_cumulativeOpacity;
}

- (BOOL)hasInsecureFilter
{
  return self->_hasInsecureFilter;
}

- (BOOL)parentsHaveInsecureLayerProperties
{
  return self->_parentsHaveInsecureLayerProperties;
}

- (unsigned)occlusionMask
{
  return self->_occlusionMask;
}

- (float)occlusionPercentage
{
  return self->_occlusionPercentage;
}

- (int64_t)occlusionType
{
  return self->_occlusionType;
}

+ (id)build:(id)a3
{
  void (**v3)(id, id);
  id v4;
  void *v5;

  v3 = (void (**)(id, id))a3;
  v4 = -[BKSWindowServerHitTestSecurityAnalysis _init]([BKSMutableWindowServerHitTestSecurityAnalysis alloc]);
  v3[2](v3, v4);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

+ (BKSWindowServerHitTestSecurityAnalysis)new
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BKSWindowServerHitTestSecurityAnalysis new]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BKSWindowServerHitTestSecurityAnalysis.m"), 138, CFSTR("cannot directly allocate BKSWindowServerHitTestSecurityAnalysis"));

  return 0;
}

+ (id)protobufSchema
{
  return (id)objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", a1, &__block_literal_global_8984);
}

void __56__BKSWindowServerHitTestSecurityAnalysis_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_cumulativeLayerTransform");
  objc_msgSend(v2, "addField:", "_cumulativeOpacity");
  objc_msgSend(v2, "addField:", "_hasInsecureFilter");
  objc_msgSend(v2, "addField:", "_parentsHaveInsecureLayerProperties");
  objc_msgSend(v2, "addField:", "_occlusionMask");
  objc_msgSend(v2, "addField:", "_occlusionPercentage");
  objc_msgSend(v2, "addField:", "_occlusionType");

}

void __94__BKSWindowServerHitTestSecurityAnalysis_securityAnalysisFromCAHitTestDictionary_errorString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _OWORD v24[8];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = a2;
  objc_msgSend(v3, "setOcclusionType:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setOcclusionMask:", *(unsigned int *)(a1 + 48));
  LODWORD(v4) = *(_DWORD *)(a1 + 52);
  objc_msgSend(v3, "setOcclusionPercentage:", v4);
  v5 = *(void **)(a1 + 32);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v6 = (_QWORD *)getkCAWindowServerHitTestSecurityAnalysisCumulativeLayerTransformSymbolLoc_ptr;
  v28 = getkCAWindowServerHitTestSecurityAnalysisCumulativeLayerTransformSymbolLoc_ptr;
  if (!getkCAWindowServerHitTestSecurityAnalysisCumulativeLayerTransformSymbolLoc_ptr)
  {
    v7 = QuartzCoreLibrary_8992();
    v6 = dlsym(v7, "kCAWindowServerHitTestSecurityAnalysisCumulativeLayerTransform");
    v26[3] = (uint64_t)v6;
    getkCAWindowServerHitTestSecurityAnalysisCumulativeLayerTransformSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v25, 8);
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "CATransform3DValue");
    else
      memset(v24, 0, sizeof(v24));
    objc_msgSend(v3, "setCumulativeLayerTransform:", v24);
    v10 = *(void **)(a1 + 32);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v11 = (_QWORD *)getkCAWindowServerHitTestSecurityAnalysisCumulativeOpacitySymbolLoc_ptr;
    v28 = getkCAWindowServerHitTestSecurityAnalysisCumulativeOpacitySymbolLoc_ptr;
    if (!getkCAWindowServerHitTestSecurityAnalysisCumulativeOpacitySymbolLoc_ptr)
    {
      v12 = QuartzCoreLibrary_8992();
      v11 = dlsym(v12, "kCAWindowServerHitTestSecurityAnalysisCumulativeOpacity");
      v26[3] = (uint64_t)v11;
      getkCAWindowServerHitTestSecurityAnalysisCumulativeOpacitySymbolLoc_ptr = (uint64_t)v11;
    }
    _Block_object_dispose(&v25, 8);
    if (v11)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      objc_msgSend(v3, "setCumulativeOpacity:");

      v14 = *(void **)(a1 + 32);
      v25 = 0;
      v26 = &v25;
      v27 = 0x2020000000;
      v15 = (_QWORD *)getkCAWindowServerHitTestSecurityAnalysisParentsHaveInsecureLayerPropertiesSymbolLoc_ptr;
      v28 = getkCAWindowServerHitTestSecurityAnalysisParentsHaveInsecureLayerPropertiesSymbolLoc_ptr;
      if (!getkCAWindowServerHitTestSecurityAnalysisParentsHaveInsecureLayerPropertiesSymbolLoc_ptr)
      {
        v16 = QuartzCoreLibrary_8992();
        v15 = dlsym(v16, "kCAWindowServerHitTestSecurityAnalysisParentsHaveInsecureLayerProperties");
        v26[3] = (uint64_t)v15;
        getkCAWindowServerHitTestSecurityAnalysisParentsHaveInsecureLayerPropertiesSymbolLoc_ptr = (uint64_t)v15;
      }
      _Block_object_dispose(&v25, 8);
      if (v15)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", *v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setParentsHaveInsecureLayerProperties:", objc_msgSend(v17, "BOOLValue"));

        v18 = *(void **)(a1 + 32);
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v19 = (_QWORD *)getkCAWindowServerHitTestSecurityAnalysisIsInsecureFilteredSymbolLoc_ptr;
        v28 = getkCAWindowServerHitTestSecurityAnalysisIsInsecureFilteredSymbolLoc_ptr;
        if (!getkCAWindowServerHitTestSecurityAnalysisIsInsecureFilteredSymbolLoc_ptr)
        {
          v20 = QuartzCoreLibrary_8992();
          v19 = dlsym(v20, "kCAWindowServerHitTestSecurityAnalysisIsInsecureFiltered");
          v26[3] = (uint64_t)v19;
          getkCAWindowServerHitTestSecurityAnalysisIsInsecureFilteredSymbolLoc_ptr = (uint64_t)v19;
        }
        _Block_object_dispose(&v25, 8);
        if (v19)
        {
          objc_msgSend(v18, "objectForKeyedSubscript:", *v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setHasInsecureFilter:", objc_msgSend(v21, "BOOLValue"));

          return;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkCAWindowServerHitTestSecurityAnalysisIsInsecureFiltered(void)");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("BKSWindowServerHitTestSecurityAnalysis.m"), 33, CFSTR("%s"), dlerror());
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkCAWindowServerHitTestSecurityAnalysisParentsHaveInsecureLayerProperties(void)");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("BKSWindowServerHitTestSecurityAnalysis.m"), 32, CFSTR("%s"), dlerror());
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkCAWindowServerHitTestSecurityAnalysisCumulativeOpacity(void)");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("BKSWindowServerHitTestSecurityAnalysis.m"), 31, CFSTR("%s"), dlerror());
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkCAWindowServerHitTestSecurityAnalysisCumulativeLayerTransform(void)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("BKSWindowServerHitTestSecurityAnalysis.m"), 30, CFSTR("%s"), dlerror());
  }

  __break(1u);
}

@end
