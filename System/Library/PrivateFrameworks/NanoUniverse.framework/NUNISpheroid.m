@implementation NUNISpheroid

- (NUNISpheroid)initWithScene:(id)a3 parent:(id)a4 type:(unint64_t)a5
{
  id v8;
  id v9;
  NUNISpheroid *v10;
  NUNISpheroid *v11;
  id v12;
  id v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  float v22;
  float v23;
  float v24;
  float v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)NUNISpheroid;
  v10 = -[NUNISpheroid init](&v27, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_parent, a4);
    v12 = objc_storeWeak((id *)&v11->_scene, v8);
    v11->_structure.type = a5;
    *(_QWORD *)&v11->_anon_30[88] = 1;
    *(_DWORD *)&v11->_anon_30[56] = 1065353216;
    *(_QWORD *)&v11->_anon_30[32] = 0;
    *(_QWORD *)&v11->_anon_30[40] = 0;
    v11->_structure.distanceScale = 1.0;
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)&v11->_anon_30[16] = _D0;
    v11->_anon_30[120] = 1;
    *(_OWORD *)v11->_anon_30 = xmmword_2134DBE40;
    v18 = v12;
    v19 = objc_msgSend(v8, "collectionType");

    *(float *)&v11->_anon_30[52] = _NUNISphereoidComputeRadius(a5, v19);
    if (((1 << a5) & 0xFBF3FE) != 0)
    {
      v20 = a5;
      if (((1 << a5) & 0xFFC000) != 0)
      {
        v20 = a5 - 14;
        *(_QWORD *)&v11->_anon_30[88] = 1;
        *(_QWORD *)&v11->_anon_30[96] = a5 - 13;
        v11->_anon_30[121] = 1;
        *(_DWORD *)&v11->_anon_30[16] = 0;
      }
      v21 = 7;
      if (((1 << a5) & 0x3000) == 0)
        v21 = v20;
      if ((v21 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        v22 = s_distance[v21];
        if (v19)
        {
          v23 = (float)(v22 * 10.0) + 3.0;
          v24 = 48.0;
        }
        else
        {
          v23 = (float)(v22 * 18.0) + 4.0;
          v24 = 156.0;
        }
        v25 = (float)(v23 / v24) * 0.5;
      }
      else
      {
        v25 = 0.0;
      }
      v11->_structure.distance = v25;
      if ((uint64_t)a5 > 11)
      {
        if (a5 - 12 < 2)
        {
          *(_QWORD *)&v11->_anon_30[88] = 1;
          *(_QWORD *)&v11->_anon_30[96] = a5 - 1;
        }
      }
      else if (a5)
      {
        if (a5 == 3)
        {
          *(_QWORD *)&v11->_anon_30[88] = 0;
        }
        else if (a5 == 4)
        {
          *(_QWORD *)&v11->_anon_30[88] = 2;
        }
      }
      else
      {
        *(int64x2_t *)&v11->_anon_30[88] = vdupq_n_s64(1uLL);
        v11->_anon_30[121] = 1;
        v11->_structure.distance = 0.0;
      }
    }
    else
    {
      if (a5 != 11 && a5 != 10)
        -[NUNISpheroid initWithScene:parent:type:].cold.1();
      *(_OWORD *)&v11->_anon_30[64] = xmmword_2134DBF50;
      *(_OWORD *)&v11->_anon_30[88] = xmmword_2134DBF60;
    }
  }

  return v11;
}

- (void)_updatePositionFromAngle
{
  NUNISpheroid *parent;
  __int128 v4;
  float32x2_t v5;
  unint64_t v6;
  float32x4_t v7;

  parent = self->_parent;
  if (parent)
    -[NUNISpheroid position](parent, "position");
  else
    v4 = xmmword_2134DBF50;
  v7 = (float32x4_t)v4;
  v5 = vmul_n_f32((float32x2_t)__sincosf_stret(self->_structure.angle), self->_structure.distance * self->_structure.distanceScale);
  LODWORD(v6) = v5.i32[1];
  *((float *)&v6 + 1) = -v5.f32[0];
  *(float32x4_t *)&self->_anon_30[64] = vaddq_f32(v7, (float32x4_t)v6);
  -[NUNISpheroid _updateCamera](self, "_updateCamera");
}

- (void)date:(NUNISpheroid *)self toCameraPosition:(SEL)a2 toCameraTarget:(id)a3
{
  float32x4_t *v3;
  float32x4_t *v4;
  float32x4_t *v5;
  float32x4_t *v6;
  id v8;
  float32x4_t v9;
  float32x2_t v10;
  unint64_t v11;
  id WeakRetained;
  float32x2_t *v13;
  __n128 v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x2_t v17;
  uint64_t v18;
  float v19;
  float v20;

  v5 = v4;
  v6 = v3;
  v20 = 0.0;
  v19 = 0.0;
  v18 = 0;
  v8 = a3;
  NUNIComputeSpheroidTransformParameters(self, v8, &v20, &v19, &v17, (float *)&v18 + 1, (float *)&v18, 1);
  NUNIComputeSpheroidParentPosition(self->_parent, v8);
  v15 = v9;

  v10 = vmul_n_f32((float32x2_t)__sincosf_stret(v19), *((float *)&v18 + 1) * self->_structure.distanceScale);
  LODWORD(v11) = v10.i32[1];
  *((float *)&v11 + 1) = -v10.f32[0];
  v16 = vaddq_f32(v15, (float32x4_t)v11);
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v13 = (float32x2_t *)objc_msgSend(WeakRetained, "structure");

  v14 = NUNIComputeCameraView(self->_structure.type, *(_QWORD *)&vadd_f32(*(float32x2_t *)&self->_anon_30[112], v13[13]), v20);
  *v6 = vmlaq_n_f32(v16, vmulq_n_f32(vnegq_f32((float32x4_t)v14), *(float *)&v18), v13[6].f32[0]);
  *v5 = v16;
}

- (void)updateSunLocationForDate:(id)a3 lightingPreference:(unint64_t)a4 adjustEarthRotation:(BOOL)a5
{
  int v5;
  uint64_t v8;
  float v9;
  float v10;
  uint64_t v11;

  v5 = 1 << LODWORD(self->_structure.type);
  if ((v5 & 0xFBF3FE) != 0)
  {
    NUNIComputeSpheroidTransformParameters(self, a3, &self->_structure.equatorRotation, &self->_structure.angle, (float32x2_t *)&self->_anon_30[80], &self->_structure.distance, (float *)&self->_anon_30[52], a5);
    if ((v5 & 0x3E6) != 0)
    {
      v8 = *(_QWORD *)&self->_anon_30[80];
      v9 = *(float *)&v8 + self->_structure.equatorRotation;
      if (a4 == 1 || !a4 && (*(float *)&v8 > 1.5708 || *(float *)&v8 < -1.5708))
        v10 = 216.0;
      else
        v10 = 144.0;
      v11 = COERCE_UNSIGNED_INT((float)(v10 + (float)(v9 * -57.296))+ (float)(floorf((float)(v10 + (float)(v9 * -57.296)) / 360.0) * -360.0)) | 0x41A0000000000000;
      *(_QWORD *)&self->_anon_30[104] = v11;
      *(_QWORD *)&self->_anon_30[112] = v11;
    }
    -[NUNISpheroid _updatePositionFromAngle](self, "_updatePositionFromAngle");
  }
}

- (double)animatedFloatForKey:(uint64_t)a3
{
  __int128 v3;
  const float *v4;

  switch(a3)
  {
    case 0:
      v3 = *(_OWORD *)(a1 + 112);
      return *(double *)&v3;
    case 1:
      v4 = (const float *)(a1 + 36);
      goto LABEL_16;
    case 2:
      v3 = *(_OWORD *)(a1 + 48);
      return *(double *)&v3;
    case 3:
      *(_QWORD *)&v3 = *(_QWORD *)(a1 + 128);
      return *(double *)&v3;
    case 4:
      v4 = (const float *)(a1 + 24);
      goto LABEL_16;
    case 5:
      v4 = (const float *)(a1 + 28);
      goto LABEL_16;
    case 6:
      v4 = (const float *)(a1 + 100);
      goto LABEL_16;
    case 7:
      v4 = (const float *)(a1 + 104);
      goto LABEL_16;
    case 8:
      v4 = (const float *)(a1 + 32);
      goto LABEL_16;
    case 9:
      v4 = (const float *)(a1 + 64);
      goto LABEL_16;
    case 10:
      *(_QWORD *)&v3 = *(_QWORD *)(a1 + 160);
      return *(double *)&v3;
    case 11:
      v4 = (const float *)(a1 + 96);
      goto LABEL_16;
    case 12:
      v4 = (const float *)(a1 + 68);
LABEL_16:
      *(_QWORD *)&v3 = vld1q_dup_f32(v4).u64[0];
      break;
    default:
      *(_QWORD *)&v3 = 0;
      break;
  }
  return *(double *)&v3;
}

- (void)setAnimatedFloat:(unint64_t)a3 forKey:
{
  __int128 v3;

  switch(a3)
  {
    case 0uLL:
      *(_OWORD *)&self->_anon_30[64] = v3;
      return;
    case 1uLL:
      LODWORD(self->_structure.equatorRotation) = v3;
      goto LABEL_4;
    case 2uLL:
      *(_OWORD *)self->_anon_30 = v3;
      return;
    case 3uLL:
      *(_QWORD *)&self->_anon_30[80] = v3;
      return;
    case 4uLL:
      LODWORD(self->_structure.distance) = v3;
      goto LABEL_4;
    case 5uLL:
      LODWORD(self->_structure.distanceScale) = v3;
      return;
    case 6uLL:
      *(_DWORD *)&self->_anon_30[52] = v3;
      return;
    case 7uLL:
      *(_DWORD *)&self->_anon_30[56] = v3;
      return;
    case 8uLL:
      LODWORD(self->_structure.angle) = v3;
LABEL_4:
      -[NUNISpheroid _updatePositionFromAngle](self, "_updatePositionFromAngle");
      break;
    case 9uLL:
      *(_DWORD *)&self->_anon_30[16] = v3;
      break;
    case 0xAuLL:
      *(_QWORD *)&self->_anon_30[112] = v3;
      -[NUNISpheroid _updateCamera](self, "_updateCamera");
      break;
    case 0xBuLL:
      *(_DWORD *)&self->_anon_30[48] = v3;
      break;
    case 0xCuLL:
      *(_DWORD *)&self->_anon_30[20] = v3;
      break;
    default:
      return;
  }
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double longitude;
  double latitude;
  id WeakRetained;
  NUNIAnimation *v9;
  unsigned int v10;
  unsigned int v11;
  NUNIAnimation *v12;
  float v13;
  float v14;
  id v15;

  v4 = a4;
  longitude = a3.longitude;
  latitude = a3.latitude;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v15 = WeakRetained;
  if (v4)
  {
    v9 = [NUNIAnimation alloc];
    *(float *)&v10 = longitude;
    *(float *)&v11 = latitude;
    v12 = -[NUNIAnimation initWithAnimatable:value:key:](v9, "initWithAnimatable:value:key:", self, 10, COERCE_DOUBLE(__PAIR64__(v11, v10)));
    objc_msgSend(v15, "addAnimation:", v12);

  }
  else
  {
    objc_msgSend(WeakRetained, "removeAllAnimationsFor:withKeys:", self, 1024);

    v13 = longitude;
    v14 = latitude;
    *(float *)&self->_anon_30[112] = v13;
    *(float *)&self->_anon_30[116] = v14;
    -[NUNISpheroid _updateCamera](self, "_updateCamera");
  }
}

- (void)_updateCamera
{
  NUNIScene **p_scene;
  uint64_t v4;
  id v5;
  char v6;
  id v7;
  float32x2_t *v8;
  id v9;
  float v10;
  id v11;
  int v12;
  int v13;
  double v14;
  float v15;
  float32x4_t v16;
  id WeakRetained;
  __n128 v18;

  p_scene = &self->_scene;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v4 = objc_msgSend(WeakRetained, "snap");
  if (v4 == -[NUNISpheroid type](self, "type"))
  {
    v5 = objc_loadWeakRetained((id *)p_scene);
    v6 = objc_msgSend(v5, "isAnimating:forKeys:", v5, 15);

    if ((v6 & 1) != 0)
      return;
    v7 = objc_loadWeakRetained((id *)p_scene);
    v8 = (float32x2_t *)objc_msgSend(v7, "structure");

    v18 = NUNIComputeCameraView(self->_structure.type, *(_QWORD *)&vadd_f32(*(float32x2_t *)&self->_anon_30[112], v8[13]), self->_structure.equatorRotation);
    v15 = *(float *)&self->_anon_30[52];
    v16 = *(float32x4_t *)&self->_anon_30[64];
    v9 = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend(v9, "cameraOrbit");
    v16.i64[0] = vmlaq_n_f32(v16, vmulq_n_f32(vnegq_f32((float32x4_t)v18), v15), v10).u64[0];

    v11 = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend(v11, "cameraRoll");
    v13 = v12;

    WeakRetained = objc_loadWeakRetained((id *)p_scene);
    LODWORD(v14) = v13;
    objc_msgSend(WeakRetained, "setCamera:target:up:roll:", *(double *)v16.i64, *(double *)&self->_anon_30[64], 0.0, v14);
  }

}

- (unint64_t)type
{
  return self->_structure.type;
}

- (float)blend
{
  return *(float *)&self->_anon_30[48];
}

- (float)radius
{
  return *(float *)&self->_anon_30[52];
}

- (__n128)position
{
  return a1[7];
}

- (double)light
{
  return *(double *)(a1 + 128);
}

- (unint64_t)programType
{
  return *(_QWORD *)&self->_anon_30[88];
}

- (unint64_t)spriteType
{
  return *(_QWORD *)&self->_anon_30[96];
}

- (const)structure
{
  return &self->_structure;
}

- (float)distance
{
  return self->_structure.distance;
}

- (float)distanceScale
{
  return self->_structure.distanceScale;
}

- (float)angle
{
  return self->_structure.angle;
}

- (float)equatorRotation
{
  return self->_structure.equatorRotation;
}

- (float)opacity
{
  return *(float *)&self->_anon_30[16];
}

- (float)cloudOpacity
{
  return *(float *)&self->_anon_30[20];
}

- (float)radiusScale
{
  return *(float *)&self->_anon_30[56];
}

- (__n128)colorize
{
  return a1[5];
}

- (__n128)orientation
{
  return a1[3];
}

- (CLLocationCoordinate2D)homeCoordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  v2 = *(float *)&self->_anon_30[108];
  v3 = *(float *)&self->_anon_30[104];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (CLLocationCoordinate2D)centerCoordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  v2 = *(float *)&self->_anon_30[116];
  v3 = *(float *)&self->_anon_30[112];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (BOOL)isVisible
{
  return self->_anon_30[120];
}

- (BOOL)isFacing
{
  return self->_anon_30[121];
}

- (void)setDistance:(float)a3
{
  self->_structure.distance = a3;
}

- (void)setAngle:(float)a3
{
  self->_structure.angle = a3;
}

- (void)setEquatorRotation:(float)a3
{
  self->_structure.equatorRotation = a3;
}

- (void)setOpacity:(float)a3
{
  *(float *)&self->_anon_30[16] = a3;
}

- (void)setCloudOpacity:(float)a3
{
  *(float *)&self->_anon_30[20] = a3;
}

- (void)setRadiusScale:(float)a3
{
  *(float *)&self->_anon_30[56] = a3;
}

- (void)setColorize:(NUNISpheroid *)self
{
  __int128 v2;

  *(_OWORD *)&self->_anon_30[32] = v2;
}

- (__n128)setOrientation:(__n128 *)result
{
  result[3] = a2;
  return result;
}

- (void)setHomeCoordinate:(CLLocationCoordinate2D)a3
{
  float longitude;
  float latitude;

  longitude = a3.longitude;
  latitude = a3.latitude;
  *(float *)&self->_anon_30[104] = longitude;
  *(float *)&self->_anon_30[108] = latitude;
}

- (void)setVisible:(BOOL)a3
{
  self->_anon_30[120] = a3;
}

- (void)setFacing:(BOOL)a3
{
  self->_anon_30[121] = a3;
}

- (void)setDistanceScale:(float)a3
{
  self->_structure.distanceScale = a3;
  -[NUNISpheroid _updatePositionFromAngle](self, "_updatePositionFromAngle");
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3
{
  -[NUNISpheroid setCenterCoordinate:animated:](self, "setCenterCoordinate:animated:", 0, a3.latitude, a3.longitude);
}

- (NUNIScene)scene
{
  return (NUNIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (NUNISpheroid)parent
{
  return self->_parent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_destroyWeak((id *)&self->_scene);
}

- (void)initWithScene:parent:type:.cold.1()
{
  __assert_rtn("-[NUNISpheroid initWithScene:parent:type:]", "NUNISpheroid.m", 156, "false");
}

@end
