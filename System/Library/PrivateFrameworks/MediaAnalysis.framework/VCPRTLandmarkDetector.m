@implementation VCPRTLandmarkDetector

- (id)initFromConfigFile:(id)a3 numStage:(int)a4 numLandmarks:(int)a5 numTreePerStage:(int)a6 depthOfTree:(int)a7 numFeatures:(int)a8
{
  id v14;
  VCPRTLandmarkDetector *v15;
  ma::LandmarkDetector *v16;
  double v17;
  LandmarkDetector *v18;
  id v19;
  FILE *v20;
  ma::LandmarkDetector *internalLandmarkDetector;
  BOOL v22;
  VCPRTLandmarkDetector *v23;
  VCPRTLandmarkDetector *v24;
  int v25;
  objc_super v27;

  v14 = a3;
  v27.receiver = self;
  v27.super_class = (Class)VCPRTLandmarkDetector;
  v15 = -[VCPRTLandmarkDetector init](&v27, sel_init);
  if (v15)
  {
    v16 = (ma::LandmarkDetector *)operator new(0x58uLL, MEMORY[0x1E0DE4E10]);
    v18 = (LandmarkDetector *)v16;
    if (v16)
      v17 = ma::LandmarkDetector::LandmarkDetector(v16);
    v15->_internalLandmarkDetector = v18;
    objc_msgSend(v14, "path", v17);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = fopen((const char *)objc_msgSend(v19, "UTF8String"), "rb");

    internalLandmarkDetector = (ma::LandmarkDetector *)v15->_internalLandmarkDetector;
    if (internalLandmarkDetector)
      v22 = v20 == 0;
    else
      v22 = 1;
    if (v22)
    {
      if (v20)
        fclose(v20);
      v23 = 0;
    }
    else
    {
      v15->_numOfLandmarks = a5;
      v25 = ma::LandmarkDetector::Initialize(internalLandmarkDetector, v20, a4, a5, a6, a7, a8);
      fclose(v20);
      if (v25)
        v23 = 0;
      else
        v23 = v15;
    }
    v24 = v23;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)dealloc
{
  LandmarkDetector *internalLandmarkDetector;
  objc_super v4;

  internalLandmarkDetector = self->_internalLandmarkDetector;
  if (internalLandmarkDetector)
  {
    ma::LandmarkDetector::~LandmarkDetector((ma::LandmarkDetector *)internalLandmarkDetector);
    MEMORY[0x1BCCA12BC]();
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPRTLandmarkDetector;
  -[VCPRTLandmarkDetector dealloc](&v4, sel_dealloc);
}

- (void)detectLandmark:(char *)a3 width:(int)a4 height:(int)a5 stride:(int)a6 facerect:(float *)a7 prevResult:(float *)a8 result:(float *)a9
{
  bzero(a9, 8 * self->_numOfLandmarks);
  ma::LandmarkDetector::SetPreviousLandmarks((void **)self->_internalLandmarkDetector, a8);
  ma::LandmarkDetector::DetectLandmarks((ma::LandmarkDetector *)self->_internalLandmarkDetector, (const unsigned __int8 *)a3, a4, a5, a6, a7, a9);
}

- (void)calculateFaceRectFromPrevLM:(float *)a3 result:(float *)a4 numOfLandmarks:(int)a5
{
  int32x2_t v5;
  float32x2_t v6;
  float32x2_t v7;
  uint64_t v8;
  float32x2_t v9;
  float32x2_t v10;
  int32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;

  v6 = (float32x2_t)vdup_n_s32(0xE0AD78EC);
  v7 = (float32x2_t)vdup_n_s32(0x60AD78ECu);
  if (a5 >= 1)
  {
    v8 = a5;
    do
    {
      v9 = *(float32x2_t *)a3;
      a3 += 2;
      v5.i32[1] = v9.i32[1];
      v7 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v7, v9), (int8x8_t)v9, (int8x8_t)v7);
      v6 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v9, v6), (int8x8_t)v9, (int8x8_t)v6);
      --v8;
    }
    while (v8);
  }
  v10 = vsub_f32(v6, v7);
  v5.i32[0] = v10.i32[1];
  if (v10.f32[0] >= v10.f32[1])
    *(float *)v5.i32 = v10.f32[0];
  *(float *)v5.i32 = (float)(*(float *)v5.i32 * 1.1) * 0.5;
  *(float32x2_t *)v11.i8 = vadd_f32(v7, vmul_f32(v10, (float32x2_t)0x3F0000003F000000));
  v11.i64[1] = v11.i64[0];
  v12 = (float32x4_t)vrev64q_s32(v11);
  v13 = (float32x4_t)vdupq_lane_s32(v5, 0);
  v14.i64[0] = vsubq_f32(v12, v13).u64[0];
  v14.i64[1] = vaddq_f32(v12, v13).i64[1];
  *(float32x4_t *)a4 = vrndaq_f32(v14);
}

@end
