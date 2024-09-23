@implementation MDLInteractiveCameraController

- (MDLInteractiveCameraController)init
{
  MDLInteractiveCameraController *v2;
  uint64_t v3;
  MDLStereoscopicCamera *camera;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MDLInteractiveCameraController;
  v2 = -[MDLInteractiveCameraController init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    camera = v2->_camera;
    v2->_camera = (MDLStereoscopicCamera *)v3;

    *(_OWORD *)v2->_lookAt = 0u;
    *(_QWORD *)v2->_dragPoint = 0;
    v2->_mode = 0;
    __asm { FMOV            V1.2S, #1.0 }
    *(_QWORD *)v2->_viewSize = _D1;
    __asm { FMOV            V1.4S, #-1.0 }
    *(_OWORD *)v2->_anon_40 = _Q1;
    *(_OWORD *)&v2->_anon_40[16] = 0u;
    v2->_zoom = 1.0;
  }
  return v2;
}

- (uint64_t)setFramingBounds:(_OWORD *)a3
{
  *(_OWORD *)(a1 + 80) = a3[1];
  *(_OWORD *)(a1 + 64) = *a3;
  return MEMORY[0x1E0DE7D20](a1, sel_frameObject, a3);
}

- (void)frameBounds
{
  ((void (*)(MDLInteractiveCameraController *, char *))MEMORY[0x1E0DE7D20])(self, sel_frameObject);
}

- (__n128)framingBounds
{
  __n128 result;

  result = *(__n128 *)(a1 + 80);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 64);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

- (void)setClickPoint:(MDLInteractiveCameraController *)self
{
  uint64_t v2;

  *(_QWORD *)self->_clickPoint = v2;
}

- (double)clickPoint
{
  return *(double *)(a1 + 32);
}

- (__n128)targetPosition
{
  return a1[1];
}

- (void)setTargetPosition:(MDLInteractiveCameraController *)self
{
  float32x4_t v2;

  sub_1DCBC19BC((float32x4_t *)self->_camera->super._camera, v2);
}

- (uint64_t)position
{
  return objc_msgSend_translation(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 56) + 56), a2, a3);
}

- (void)setPosition:(MDLInteractiveCameraController *)self
{
  __n128 v2;

  sub_1DCBC1214((uint64_t)self->_camera->super._camera, v2);
}

- (void)frameObject
{
  MDLStereoscopicCamera *camera;
  float var4;
  float32x4_t v5;
  float32x4_t v6;
  int8x16_t v7;
  _BOOL4 v8;
  int v9;
  __int32 v10;
  char v16;
  unsigned int v17;
  int8x16_t v18;
  int8x16_t v19;
  uint64_t v21;
  float v22;
  float32x4_t v23;
  float32x4_t v24;
  int32x4_t v25;
  float v26;
  float v27;
  float32x4_t v28;
  float32x4_t v29;

  camera = self->_camera;
  var4 = camera->super._camera[2].var4;
  v5 = *(float32x4_t *)self->_anon_40;
  v6 = *(float32x4_t *)&self->_anon_40[16];
  v7 = (int8x16_t)vcgtq_f32(v6, v5);
  v8 = v7.i32[0] != 0;
  v7.i32[0] = vextq_s8(v7, v7, 8uLL).u32[0];
  *(int32x2_t *)v7.i8 = vtst_s32(*(int32x2_t *)v7.i8, *(int32x2_t *)v7.i8);
  v9 = v8 & v7.i32[1];
  v10 = v7.i32[0];
  __asm { FMOV            V2.4S, #-5.0 }
  v16 = v9 & v10;
  if ((v9 & v10) != 0)
    v17 = -1;
  else
    v17 = 0;
  v18 = (int8x16_t)vdupq_n_s32(v17);
  v19 = vbslq_s8(v18, _Q2, (int8x16_t)v6);
  __asm { FMOV            V2.4S, #5.0 }
  objc_msgSend_frameBoundingBox_setNearAndFar_(camera, a2, 1, vbslq_s8(v18, _Q2, (int8x16_t)v5), *(_OWORD *)&v19);
  v22 = -100.0;
  if ((v16 & 1) == 0)
  {
    v23.i64[0] = 0x3F0000003F000000;
    v23.i64[1] = 0x3F0000003F000000;
    v24 = vmulq_f32(vsubq_f32(v28, v29), v23);
    v25 = (int32x4_t)vmulq_f32(v24, v24);
    v26 = sqrtf(vaddq_f32(vaddq_f32((float32x4_t)v25, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.i8, 1)), (float32x4_t)vdupq_laneq_s32(v25, 2)).f32[0]);
    if (v26 > 1.1755e-38)
    {
      v27 = var4 * 0.0174532925;
      v22 = (float)(v26 * 1.05) / sinf(v27 * 0.5);
    }
  }
  self->_targetDistance = self->_zoom * v22;
  MEMORY[0x1E0DE7D20](self, sel_update_, v21);
}

- (void)update:(float)a3
{
  simd_float4x4 *camera;
  const char *v5;
  uint64_t v6;
  unint64_t mode;
  unint64_t v8;
  float targetDistance;
  __float2 v10;
  __n128 v11;
  RTCamera *v12;
  RTCamera *v13;
  float32x2_t v14;
  unsigned __int32 v15;
  float32x4_t v16;
  float32x4_t v18;
  float32x4_t v19;

  camera = (simd_float4x4 *)self->_camera->super._camera;
  camera[3].columns[3].i32[0] = vdiv_f32(*(float32x2_t *)self->_viewSize, (float32x2_t)vdup_lane_s32(*(int32x2_t *)self->_viewSize, 1)).u32[0];
  sub_1DCBC1034(camera);
  mode = self->_mode;
  switch(mode)
  {
    case 2uLL:
      v12 = self->_camera->super._camera;
      v18 = *(float32x4_t *)&v12[2].var7;
      objc_msgSend_translation(v12->var10, v5, v6);
      sub_1DCBC1334((__n128 *)self->_camera->super._camera, v18, self->_targetDistance, self->_pitch, self->_yaw);
      break;
    case 1uLL:
      *(float32x2_t *)self->_dragVector = vmul_f32(vmul_n_f32((float32x2_t)0xC040000040A00000, a3), vsub_f32(*(float32x2_t *)self->_dragPoint, *(float32x2_t *)self->_clickPoint));
      v13 = self->_camera->super._camera;
      v19 = *(float32x4_t *)&v13[2].var7;
      objc_msgSend_translation(v13->var10, v5, v6);
      v14 = vadd_f32(*(float32x2_t *)&self->_pitch, (float32x2_t)vrev64_s32(*(int32x2_t *)self->_dragVector));
      *(float32x2_t *)&self->_pitch = v14;
      sub_1DCBC1334((__n128 *)self->_camera->super._camera, v19, self->_targetDistance, v14.f32[0], v14.f32[1]);
      break;
    case 0uLL:
      LODWORD(v8) = 0;
      HIDWORD(v8) = LODWORD(self->_targetElevation);
      v15 = HIDWORD(v8);
      v16 = (float32x4_t)v8;
      *(float *)&dword_1F03B5184 = *(float *)&dword_1F03B5184 + (float)(a3 * 10.0);
      targetDistance = self->_targetDistance;
      *(float *)&v8 = *(float *)&dword_1F03B5184 * -0.1;
      v10 = __sincosf_stret(*(float *)&v8);
      v11.n128_f32[0] = v10.__sinval * targetDistance;
      v11.n128_u32[1] = v15;
      v11.n128_f32[2] = v10.__cosval * targetDistance;
      sub_1DCBC1214((uint64_t)self->_camera->super._camera, v11);
      sub_1DCBC19BC((float32x4_t *)self->_camera->super._camera, v16);
      break;
  }
}

- (MDLStereoscopicCamera)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (double)dragPoint
{
  return *(double *)(a1 + 128);
}

- (void)setDragPoint:(MDLInteractiveCameraController *)self
{
  uint64_t v2;

  *(_QWORD *)self->_dragPoint = v2;
}

- (__n128)trackVector
{
  return a1[10];
}

- (void)setTrackVector:(MDLInteractiveCameraController *)self
{
  __int128 v2;

  *(_OWORD *)self->_trackVector = v2;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (float)tumbleSpeed
{
  return self->_tumbleSpeed;
}

- (void)setTumbleSpeed:(float)a3
{
  self->_tumbleSpeed = a3;
}

- (float)zoomSpeed
{
  return self->_zoomSpeed;
}

- (void)setZoomSpeed:(float)a3
{
  self->_zoomSpeed = a3;
}

- (float)trackSpeed
{
  return self->_trackSpeed;
}

- (void)setTrackSpeed:(float)a3
{
  self->_trackSpeed = a3;
}

- (float)targetDistance
{
  return self->_targetDistance;
}

- (void)setTargetDistance:(float)a3
{
  self->_targetDistance = a3;
}

- (double)viewSize
{
  return *(double *)(a1 + 144);
}

- (void)setViewSize:(MDLInteractiveCameraController *)self
{
  uint64_t v2;

  *(_QWORD *)self->_viewSize = v2;
}

- (float)zoom
{
  return self->_zoom;
}

- (void)setZoom:(float)a3
{
  self->_zoom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_camera, 0);
}

@end
