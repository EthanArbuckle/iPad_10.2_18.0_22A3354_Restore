@implementation CRAttestationDeviceGen2Handler

- (CRAttestationDeviceGen2Handler)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  CRAttestationDeviceGen2Handler *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CRAttestationDeviceGen2Handler;
  v5 = -[CRAttestationBaseDeviceHandler init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend_sharedSingleton(CRComponentBatteryRoswell, v2, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedSingleton(CRComponentTsid, v7, v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend_componentsMapping(v5, v10, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v14, v15, (uint64_t)v6, (uint64_t)CFSTR("bcrt"));

    }
    if (v13)
    {
      objc_msgSend_componentsMapping(v5, v10, v11, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v13, (uint64_t)CFSTR("tsid"));

    }
  }
  return v5;
}

+ (BOOL)isGen2Device:(int)a3
{
  int64x2_t v3;

  v3 = vdupq_n_s64(*(unint64_t *)&a3);
  return vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575E50), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575E60)))) & 1 | (*(_QWORD *)&a3 == 1234705395);
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  uint64_t v3;
  CRAttestationDeviceGen2Handler *v4;

  if (objc_msgSend_isGen2Device_(CRAttestationDeviceGen2Handler, a2, *(uint64_t *)&a3, v3))
    v4 = objc_alloc_init(CRAttestationDeviceGen2Handler);
  else
    v4 = 0;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRAttestationDeviceGen2Handler);
}

@end
