@implementation CRAttestationDeviceGen3Handler

- (CRAttestationDeviceGen3Handler)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  CRAttestationDeviceGen3Handler *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CRAttestationDeviceGen3Handler;
  v5 = -[CRAttestationBaseDeviceHandler init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend_sharedSingleton(CRComponentDisplayRoswell, v2, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedSingleton(CRComponentVeridian, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedSingleton(CRComponentTsid, v11, v12, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend_componentsMapping(v5, v14, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v18, v19, (uint64_t)v6, (uint64_t)CFSTR("tcrt"));

    }
    if (v10)
    {
      objc_msgSend_componentsMapping(v5, v14, v15, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v20, v21, (uint64_t)v10, (uint64_t)CFSTR("vcrt"));

    }
    if (v17)
    {
      objc_msgSend_componentsMapping(v5, v14, v15, v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v17, (uint64_t)CFSTR("tsid"));

    }
  }
  return v5;
}

+ (BOOL)isGen3Device:(int)a3
{
  int64x2_t v3;
  char v4;
  BOOL v6;

  v3 = vdupq_n_s64(*(unint64_t *)&a3);
  v4 = vmaxvq_u8((uint8x16_t)vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575FD0), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575FE0)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575FF0), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214576000))), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214576010), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214576020)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214576030), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214576040))))) | vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214576050), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214576060))));
  v6 = *(_QWORD *)&a3 == 2795618603 || *(_QWORD *)&a3 == 330877086;
  return v4 & 1 | (*(_QWORD *)&a3 == 574536383 || v6);
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  uint64_t v3;
  CRAttestationDeviceGen3Handler *v4;

  if (objc_msgSend_isGen3Device_(CRAttestationDeviceGen3Handler, a2, *(uint64_t *)&a3, v3))
    v4 = objc_alloc_init(CRAttestationDeviceGen3Handler);
  else
    v4 = 0;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRAttestationDeviceGen3Handler);
}

@end
