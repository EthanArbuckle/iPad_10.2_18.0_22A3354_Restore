@implementation CRAttestationDeviceGen1Handler

- (CRAttestationDeviceGen1Handler)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  CRAttestationDeviceGen1Handler *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRAttestationDeviceGen1Handler;
  v5 = -[CRAttestationBaseDeviceHandler init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend_sharedSingleton(CRComponentTsid, v2, v3, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend_componentsMapping(v5, v6, v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v10, v11, (uint64_t)v9, (uint64_t)CFSTR("tsid"));

    }
  }
  return v5;
}

+ (BOOL)isGen1Device:(int)a3
{
  int64x2_t v3;

  v3 = vdupq_n_s64(*(unint64_t *)&a3);
  return vmaxvq_u8((uint8x16_t)vcltzq_s8(vshlq_n_s8(vorrq_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575F30), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575F20)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575F10), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575F00))), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575EF0), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575EE0)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575ED0), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575EC0)))), vuzp1q_s8((int8x16_t)vuzp1q_s16(
                                                    (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575FB0), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575FA0)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575F90), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575F80))), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575F70), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575F60)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575F50), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575F40))))), 7uLL))) & 1;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  uint64_t v3;
  CRAttestationDeviceGen1Handler *v4;

  if (objc_msgSend_isGen1Device_(CRAttestationDeviceGen1Handler, a2, *(uint64_t *)&a3, v3))
    v4 = objc_alloc_init(CRAttestationDeviceGen1Handler);
  else
    v4 = 0;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRAttestationDeviceGen1Handler);
}

@end
