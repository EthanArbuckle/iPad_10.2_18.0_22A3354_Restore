@implementation BKSHIDEventHitTestLayerInformation

- (BKSHIDEventHitTestLayerInformation)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventHitTestLayerInformation *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventHitTestLayerInformation *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate BKSHIDEventHitTestLayerInformation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BKSHIDEventHitTestLayerInformation.m");
    v17 = 1024;
    v18 = 72;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventHitTestLayerInformation *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  double v24;
  void *v25;
  uint64_t v26;
  double v27;
  void *v28;
  uint64_t v29;
  double v30;
  void *v31;
  unint64_t v32;
  _OWORD v34[8];
  _OWORD v35[8];

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_validMask);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = *(_OWORD *)&self->_cumulativeLayerTransform.m33;
  v35[4] = *(_OWORD *)&self->_cumulativeLayerTransform.m31;
  v35[5] = v5;
  v6 = *(_OWORD *)&self->_cumulativeLayerTransform.m43;
  v35[6] = *(_OWORD *)&self->_cumulativeLayerTransform.m41;
  v35[7] = v6;
  v7 = *(_OWORD *)&self->_cumulativeLayerTransform.m13;
  v35[0] = *(_OWORD *)&self->_cumulativeLayerTransform.m11;
  v35[1] = v7;
  v8 = *(_OWORD *)&self->_cumulativeLayerTransform.m23;
  v35[2] = *(_OWORD *)&self->_cumulativeLayerTransform.m21;
  v35[3] = v8;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v35, "{CATransform3D=dddddddddddddddd}");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") ^ v4;

  v11 = *(_OWORD *)&self->_cumulativeContentsTransform.m33;
  v34[4] = *(_OWORD *)&self->_cumulativeContentsTransform.m31;
  v34[5] = v11;
  v12 = *(_OWORD *)&self->_cumulativeContentsTransform.m43;
  v34[6] = *(_OWORD *)&self->_cumulativeContentsTransform.m41;
  v34[7] = v12;
  v13 = *(_OWORD *)&self->_cumulativeContentsTransform.m13;
  v34[0] = *(_OWORD *)&self->_cumulativeContentsTransform.m11;
  v34[1] = v13;
  v14 = *(_OWORD *)&self->_cumulativeContentsTransform.m23;
  v34[2] = *(_OWORD *)&self->_cumulativeContentsTransform.m21;
  v34[3] = v14;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v34, "{CATransform3D=dddddddddddddddd}");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");

  *(float *)&v17 = self->_cumulativeOpacity;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v10 ^ v16 ^ objc_msgSend(v18, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasInsecureFilter);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_detectedOcclusion);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21 ^ objc_msgSend(v22, "hash");

  *(float *)&v24 = self->_backgroundAverage;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v19 ^ v23 ^ objc_msgSend(v25, "hash");

  *(float *)&v27 = self->_backgroundStandardDeviation;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "hash");

  *(float *)&v30 = self->_backgroundAverageContrastThreshold;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v26 ^ v29 ^ objc_msgSend(v31, "hash");

  return v32;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && *((_QWORD *)v4 + 1) == self->_validMask
    && (vminvq_u8((uint8x16_t)vcltzq_s8(vshlq_n_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 2), *(float64x2_t *)&self->_cumulativeLayerTransform.m11), (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 3), *(float64x2_t *)&self->_cumulativeLayerTransform.m13)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 4), *(float64x2_t *)&self->_cumulativeLayerTransform.m21), (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 5), *(float64x2_t *)&self->_cumulativeLayerTransform.m23))), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32(
                                                              (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 6), *(float64x2_t *)&self->_cumulativeLayerTransform.m31), (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 7), *(float64x2_t *)&self->_cumulativeLayerTransform.m33)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 8), *(float64x2_t *)&self->_cumulativeLayerTransform.m41), (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 9), *(float64x2_t *)&self->_cumulativeLayerTransform.m43)))), 7uLL))) & 1) != 0&& (vminvq_u8((uint8x16_t)vcltzq_s8(vshlq_n_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(
                                                                           *((float64x2_t *)v4 + 10),
                                                                           *(float64x2_t *)&self->_cumulativeContentsTransform.m11),
                                                              (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 11), *(float64x2_t *)&self->_cumulativeContentsTransform.m13)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 12), *(float64x2_t *)&self->_cumulativeContentsTransform.m21), (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 13), *(float64x2_t *)&self->_cumulativeContentsTransform.m23))), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 14), *(float64x2_t *)&self->_cumulativeContentsTransform.m31), (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 15), *(float64x2_t *)&self->_cumulativeContentsTransform.m33)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(
                                                                           *((float64x2_t *)v4 + 16),
                                                                           *(float64x2_t *)&self->_cumulativeContentsTransform.m41),
                                                              (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 17), *(float64x2_t *)&self->_cumulativeContentsTransform.m43)))), 7uLL))) & 1) != 0&& *((float *)v4 + 4) == self->_cumulativeOpacity&& v4[288] == self->_hasInsecureFilter&& v4[289] == self->_detectedOcclusion&& *((float *)v4 + 5) == self->_backgroundAverage&& *((float *)v4 + 6) == self->_backgroundStandardDeviation&& *((float *)v4 + 7) == self->_backgroundAverageContrastThreshold;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventHitTestLayerInformation _initWithCopyOf:]([BKSHIDEventHitTestLayerInformation alloc], self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventHitTestLayerInformation _initWithCopyOf:]([BKSMutableHIDEventHitTestLayerInformation alloc], self);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BKSHIDEventHitTestLayerInformation *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__BKSHIDEventHitTestLayerInformation_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E1EA1BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

- (unint64_t)validMask
{
  return self->_validMask;
}

- (CATransform3D)cumulativeTransform
{
  *(_OWORD *)&retstr->m22 = 0u;
  *(_OWORD *)&retstr->m32 = 0u;
  *(_OWORD *)&retstr->m42 = 0u;
  *(_OWORD *)&retstr->m34 = 0u;
  *(_OWORD *)&retstr->m24 = 0u;
  *(_OWORD *)&retstr->m14 = 0u;
  *(_OWORD *)&retstr->m12 = 0u;
  retstr->m11 = 1.0;
  retstr->m22 = 1.0;
  retstr->m33 = 1.0;
  retstr->m44 = 1.0;
  return self;
}

- (CATransform3D)cumulativeLayerTransform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  if ((LOBYTE(self->m12) & 0x10) != 0)
  {
    v3 = *(_OWORD *)&self->m43;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m41;
    *(_OWORD *)&retstr->m33 = v3;
    v4 = *(_OWORD *)&self[1].m13;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m11;
    *(_OWORD *)&retstr->m43 = v4;
    v5 = *(_OWORD *)&self->m23;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m21;
    *(_OWORD *)&retstr->m13 = v5;
    v6 = *(_OWORD *)&self->m33;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m31;
    *(_OWORD *)&retstr->m23 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->m22 = 0u;
    *(_OWORD *)&retstr->m32 = 0u;
    *(_OWORD *)&retstr->m42 = 0u;
    *(_OWORD *)&retstr->m34 = 0u;
    *(_OWORD *)&retstr->m24 = 0u;
    *(_OWORD *)&retstr->m14 = 0u;
    *(_OWORD *)&retstr->m12 = 0u;
    retstr->m11 = 1.0;
    retstr->m22 = 1.0;
    retstr->m33 = 1.0;
    retstr->m44 = 1.0;
  }
  return self;
}

- (CATransform3D)cumulativeContentsTransform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  if ((LOBYTE(self->m12) & 0x20) != 0)
  {
    v3 = *(_OWORD *)&self[1].m43;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[1].m41;
    *(_OWORD *)&retstr->m33 = v3;
    v4 = *(_OWORD *)&self[2].m13;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[2].m11;
    *(_OWORD *)&retstr->m43 = v4;
    v5 = *(_OWORD *)&self[1].m23;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[1].m21;
    *(_OWORD *)&retstr->m13 = v5;
    v6 = *(_OWORD *)&self[1].m33;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[1].m31;
    *(_OWORD *)&retstr->m23 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->m22 = 0u;
    *(_OWORD *)&retstr->m32 = 0u;
    *(_OWORD *)&retstr->m42 = 0u;
    *(_OWORD *)&retstr->m34 = 0u;
    *(_OWORD *)&retstr->m24 = 0u;
    *(_OWORD *)&retstr->m14 = 0u;
    *(_OWORD *)&retstr->m12 = 0u;
    retstr->m11 = 1.0;
    retstr->m22 = 1.0;
    retstr->m33 = 1.0;
    retstr->m44 = 1.0;
  }
  return self;
}

- (float)cumulativeOpacity
{
  float result;

  result = 1.0;
  if ((self->_validMask & 2) != 0)
    return self->_cumulativeOpacity;
  return result;
}

- (BOOL)hasInsecureFilter
{
  return self->_hasInsecureFilter;
}

- (BOOL)detectedOcclusion
{
  return self->_detectedOcclusion;
}

- (float)backgroundAverage
{
  float result;

  result = 1.0;
  if ((self->_validMask & 8) != 0)
    return self->_backgroundAverage;
  return result;
}

- (float)backgroundStandardDeviation
{
  float result;

  result = 0.0;
  if ((self->_validMask & 8) != 0)
    return self->_backgroundStandardDeviation;
  return result;
}

- (float)backgroundAverageContrastThreshold
{
  float result;

  result = 0.0;
  if ((self->_validMask & 8) != 0)
    return self->_backgroundAverageContrastThreshold;
  return result;
}

- (NSArray)minimumBackgroundColor
{
  return (NSArray *)&unk_1E1EBC5E8;
}

- (NSArray)maximumBackgroundColor
{
  return (NSArray *)&unk_1E1EBC600;
}

- (void)_updateCCHmacContext:(id *)a3
{
  CCHmacUpdate((CCHmacContext *)a3, &self->_validMask, 8uLL);
  CCHmacUpdate((CCHmacContext *)a3, &self->_cumulativeOpacity, 4uLL);
  CCHmacUpdate((CCHmacContext *)a3, &self->_cumulativeLayerTransform, 0x80uLL);
  CCHmacUpdate((CCHmacContext *)a3, &self->_cumulativeContentsTransform, 0x80uLL);
  CCHmacUpdate((CCHmacContext *)a3, &self->_hasInsecureFilter, 1uLL);
  CCHmacUpdate((CCHmacContext *)a3, &self->_detectedOcclusion, 1uLL);
  CCHmacUpdate((CCHmacContext *)a3, &self->_backgroundAverage, 4uLL);
  CCHmacUpdate((CCHmacContext *)a3, &self->_backgroundStandardDeviation, 4uLL);
  CCHmacUpdate((CCHmacContext *)a3, &self->_backgroundAverageContrastThreshold, 4uLL);
}

- (id)_init
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDEventHitTestLayerInformation cannot be subclassed"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__init);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = (objc_class *)objc_opt_class();
          NSStringFromClass(v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v10 = v5;
          v11 = 2114;
          v12 = v7;
          v13 = 2048;
          v14 = v1;
          v15 = 2114;
          v16 = CFSTR("BKSHIDEventHitTestLayerInformation.m");
          v17 = 1024;
          v18 = 83;
          v19 = 2114;
          v20 = v4;
          _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18A13C28CLL);
      }
    }
    v8.receiver = v1;
    v8.super_class = (Class)BKSHIDEventHitTestLayerInformation;
    return objc_msgSendSuper2(&v8, sel_init);
  }
  return result;
}

void __67__BKSHIDEventHitTestLayerInformation_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v2 = *(void **)(a1 + 32);
  NSStringFromBKSHIDEventHitTestLayerInformationMask(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("validMask"));

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 289), CFSTR("detectedOcclusion"));
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(v5 + 8);
  if ((v6 & 0x10) != 0)
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(_OWORD *)(v5 + 112);
    v30 = *(_OWORD *)(v5 + 96);
    v31 = v11;
    v12 = *(_OWORD *)(v5 + 144);
    v32 = *(_OWORD *)(v5 + 128);
    v33 = v12;
    v13 = *(_OWORD *)(v5 + 48);
    v26 = *(_OWORD *)(v5 + 32);
    v27 = v13;
    v14 = *(_OWORD *)(v5 + 80);
    v28 = *(_OWORD *)(v5 + 64);
    v29 = v14;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v10, "appendObject:withName:", v15, CFSTR("cumulativeLayerTransform"));

    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(v5 + 8);
    if ((v6 & 0x20) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v17 = *(void **)(a1 + 32);
  v18 = *(_OWORD *)(v5 + 240);
  v30 = *(_OWORD *)(v5 + 224);
  v31 = v18;
  v19 = *(_OWORD *)(v5 + 272);
  v32 = *(_OWORD *)(v5 + 256);
  v33 = v19;
  v20 = *(_OWORD *)(v5 + 176);
  v26 = *(_OWORD *)(v5 + 160);
  v27 = v20;
  v21 = *(_OWORD *)(v5 + 208);
  v28 = *(_OWORD *)(v5 + 192);
  v29 = v21;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v17, "appendObject:withName:", v22, CFSTR("cumulativeContentsTransform"));

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(v5 + 8);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v24 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("cumulativeOpacity"), *(float *)(v5 + 16));
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(v5 + 8);
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0)
      return;
    goto LABEL_6;
  }
LABEL_11:
  v25 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(v5 + 288), CFSTR("hasInsecureFilter"));
  v5 = *(_QWORD *)(a1 + 40);
  if ((*(_QWORD *)(v5 + 8) & 8) == 0)
    return;
LABEL_6:
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("backgroundAverage"), *(float *)(v5 + 20));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("backgroundStandardDeviation"), *(float *)(*(_QWORD *)(a1 + 40) + 24));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("backgroundAverageContrastThreshold"), *(float *)(*(_QWORD *)(a1 + 40) + 28));
}

- (void)_initWithCopyOf:(void *)a1
{
  _QWORD *v3;
  id v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v3 = a2;
  if (a1)
  {
    v4 = -[BKSHIDEventHitTestLayerInformation _init](a1);
    a1 = v4;
    if (v4)
    {
      *((_QWORD *)v4 + 1) = v3[1];
      v5 = *((_OWORD *)v3 + 2);
      v6 = *((_OWORD *)v3 + 3);
      v7 = *((_OWORD *)v3 + 5);
      *((_OWORD *)v4 + 4) = *((_OWORD *)v3 + 4);
      *((_OWORD *)v4 + 5) = v7;
      *((_OWORD *)v4 + 2) = v5;
      *((_OWORD *)v4 + 3) = v6;
      v8 = *((_OWORD *)v3 + 6);
      v9 = *((_OWORD *)v3 + 7);
      v10 = *((_OWORD *)v3 + 9);
      *((_OWORD *)v4 + 8) = *((_OWORD *)v3 + 8);
      *((_OWORD *)v4 + 9) = v10;
      *((_OWORD *)v4 + 6) = v8;
      *((_OWORD *)v4 + 7) = v9;
      v11 = *((_OWORD *)v3 + 17);
      v13 = *((_OWORD *)v3 + 14);
      v12 = *((_OWORD *)v3 + 15);
      *((_OWORD *)v4 + 16) = *((_OWORD *)v3 + 16);
      *((_OWORD *)v4 + 17) = v11;
      *((_OWORD *)v4 + 14) = v13;
      *((_OWORD *)v4 + 15) = v12;
      v14 = *((_OWORD *)v3 + 10);
      v15 = *((_OWORD *)v3 + 11);
      v16 = *((_OWORD *)v3 + 13);
      *((_OWORD *)v4 + 12) = *((_OWORD *)v3 + 12);
      *((_OWORD *)v4 + 13) = v16;
      *((_OWORD *)v4 + 10) = v14;
      *((_OWORD *)v4 + 11) = v15;
      *((_DWORD *)v4 + 4) = *((_DWORD *)v3 + 4);
      *((_BYTE *)v4 + 288) = *((_BYTE *)v3 + 288);
      *((_BYTE *)v4 + 289) = *((_BYTE *)v3 + 289);
      *((_DWORD *)v4 + 5) = *((_DWORD *)v3 + 5);
      *((_DWORD *)v4 + 6) = *((_DWORD *)v3 + 6);
      *((_DWORD *)v4 + 7) = *((_DWORD *)v3 + 7);
    }
  }

  return a1;
}

+ (id)build:(id)a3
{
  void (**v3)(id, id);
  id v4;
  void *v5;

  v3 = (void (**)(id, id))a3;
  v4 = -[BKSHIDEventHitTestLayerInformation _init]([BKSMutableHIDEventHitTestLayerInformation alloc]);
  v3[2](v3, v4);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

+ (BKSHIDEventHitTestLayerInformation)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventHitTestLayerInformation *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate BKSHIDEventHitTestLayerInformation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2114;
    v16 = CFSTR("BKSHIDEventHitTestLayerInformation.m");
    v17 = 1024;
    v18 = 77;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventHitTestLayerInformation *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)protobufSchema
{
  return (id)objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", a1, &__block_literal_global_8035);
}

void __52__BKSHIDEventHitTestLayerInformation_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_validMask");
  objc_msgSend(v2, "addField:", "_cumulativeLayerTransform");
  objc_msgSend(v2, "addField:", "_cumulativeContentsTransform");
  objc_msgSend(v2, "addField:", "_cumulativeOpacity");
  objc_msgSend(v2, "addField:", "_hasInsecureFilter");
  objc_msgSend(v2, "addField:", "_detectedOcclusion");
  objc_msgSend(v2, "addField:", "_backgroundAverage");
  objc_msgSend(v2, "addField:", "_backgroundStandardDeviation");
  objc_msgSend(v2, "addField:", "_backgroundAverageContrastThreshold");

}

@end
