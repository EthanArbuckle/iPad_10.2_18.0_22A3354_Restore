@implementation CIKeystoneCorrectionVertical

- (void)computeRotation
{
  CIVector *v3;
  double v4;
  double v5;
  CIVector *v6;
  double v7;
  double v8;
  CIVector *v9;
  double v10;
  double v11;
  CIVector *v12;
  double v13;
  double v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  int32x4_t v18;
  double v19;
  int32x4_t v20;
  double v21;
  int32x4_t v22;
  double v23;
  int32x4_t v24;
  double v25;
  float v26;
  CI::Perspective *v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;

  v3 = -[CIKeystoneCorrection inputBottomLeft](self, "inputBottomLeft");
  -[CIVector X](v3, "X");
  *(float *)&v4 = v4;
  v34 = *(float *)&v4;
  -[CIVector Y](v3, "Y");
  *(float *)&v5 = v5;
  v33 = *(float *)&v5;
  v6 = -[CIKeystoneCorrection inputTopLeft](self, "inputTopLeft");
  -[CIVector X](v6, "X");
  *(float *)&v7 = v7;
  v32 = *(float *)&v7;
  -[CIVector Y](v6, "Y");
  *(float *)&v8 = v8;
  v31 = *(float *)&v8;
  v9 = -[CIKeystoneCorrection inputBottomRight](self, "inputBottomRight");
  -[CIVector X](v9, "X");
  *(float *)&v10 = v10;
  v30 = *(float *)&v10;
  -[CIVector Y](v9, "Y");
  *(float *)&v11 = v11;
  v29 = *(float *)&v11;
  v12 = -[CIKeystoneCorrection inputTopRight](self, "inputTopRight");
  -[CIVector X](v12, "X");
  *(float *)&v13 = v13;
  v28 = *(float *)&v13;
  -[CIVector Y](v12, "Y");
  *(float *)&v14 = v14;
  v15 = *(float32x4_t *)self->super._anon_80;
  v16 = *(float32x4_t *)&self->super._anon_80[16];
  v17 = *(float32x4_t *)&self->super._anon_80[32];
  v18 = (int32x4_t)vaddq_f32(v17, vmlaq_n_f32(vmulq_n_f32(v15, v34), v16, v33));
  v19 = COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v18.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v18, 2)));
  v20 = (int32x4_t)vaddq_f32(v17, vmlaq_n_f32(vmulq_n_f32(v15, v32), v16, v31));
  v21 = COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v20.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v20, 2)));
  v22 = (int32x4_t)vaddq_f32(v17, vmlaq_n_f32(vmulq_n_f32(v15, v30), v16, v29));
  v23 = COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v22.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v22, 2)));
  v24 = (int32x4_t)vaddq_f32(v17, vmlaq_n_f32(vmulq_n_f32(v15, v28), v16, *(float *)&v14));
  v25 = COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v24.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v24, 2)));
  v26 = CI::Perspective::keystoneV(v19, v21, v23, v25);
  self->super.pitch = v26;
  self->super.roll = CI::Perspective::horizonV(v27, v19, v21, v23, v25, v26, self->super.yaw);
}

@end
