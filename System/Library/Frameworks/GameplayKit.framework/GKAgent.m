@implementation GKAgent

- (GKAgent)init
{
  char *v2;
  char *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKAgent;
  v2 = -[GKComponent init](&v6, sel_init);
  v3 = v2 + 40;
  (*(void (**)(char *))(*((_QWORD *)v2 + 5) + 72))(v2 + 40);
  *((_QWORD *)v2 + 12) = 0;
  v2[128] = 0;
  (*(void (**)(char *, float))(*(_QWORD *)v3 + 168))(v3, 1.0);
  (*(void (**)(char *, float))(*(_QWORD *)v3 + 208))(v3, 0.0);
  (*(void (**)(char *, float))(*(_QWORD *)v3 + 184))(v3, 0.5);
  (*(void (**)(char *, float))(*(_QWORD *)v3 + 232))(v3, 1.0);
  (*(void (**)(char *, float))(*(_QWORD *)v3 + 248))(v3, 1.0);
  *((_QWORD *)v2 + 23) = _static_vec3_zero;
  *((_DWORD *)v2 + 48) = dword_25591E708;
  *((_QWORD *)v2 + 20) = _static_vec3_zero;
  *((_DWORD *)v2 + 42) = dword_25591E708;
  *(_QWORD *)(v2 + 172) = _static_vec3_zero;
  *((_DWORD *)v2 + 45) = dword_25591E708;
  *((_DWORD *)v2 + 39) = 0;
  *((_DWORD *)v2 + 49) = 0;
  v4 = _static_vec3_zero;
  *((_DWORD *)v2 + 52) = dword_25591E708;
  *((_QWORD *)v2 + 25) = v4;
  v2[212] = 1;
  return (GKAgent *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKAgent)initWithCoder:(id)a3
{
  id v4;
  GKAgent *v5;
  GKAgent *v6;
  GKSimpleVehicle *p_vehicle;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  _DWORD *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GKAgent;
  v5 = -[GKComponent initWithCoder:](&v17, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    p_vehicle = &v5->_vehicle;
    (*((void (**)(GKSimpleVehicle *))v5->_vehicle._vptr$AbstractLocalSpace + 9))(&v5->_vehicle);
    *(_QWORD *)&v6->_vehicle.WanderSide = 0;
    v6->_vehicle.gaudyPursuitAnnotation = 0;
    (*((void (**)(GKSimpleVehicle *, float))p_vehicle->_vptr$AbstractLocalSpace + 21))(&v6->_vehicle, 1.0);
    (*((void (**)(GKSimpleVehicle *, float))p_vehicle->_vptr$AbstractLocalSpace + 26))(&v6->_vehicle, 0.0);
    (*((void (**)(GKSimpleVehicle *, float))p_vehicle->_vptr$AbstractLocalSpace + 23))(&v6->_vehicle, 0.5);
    (*((void (**)(GKSimpleVehicle *, float))p_vehicle->_vptr$AbstractLocalSpace + 29))(&v6->_vehicle, 1.0);
    (*((void (**)(GKSimpleVehicle *, float))p_vehicle->_vptr$AbstractLocalSpace + 31))(&v6->_vehicle, 1.0);
    *(_QWORD *)&v6->_vehicle._smoothedPosition.x = _static_vec3_zero;
    LODWORD(v6->_vehicle._smoothedPosition.z) = dword_25591E708;
    *(_QWORD *)&v6->_vehicle._lastForward.x = _static_vec3_zero;
    LODWORD(v6->_vehicle._lastForward.z) = dword_25591E708;
    *(_QWORD *)&v6->_vehicle._lastPosition.x = _static_vec3_zero;
    LODWORD(v6->_vehicle._lastPosition.z) = dword_25591E708;
    v6->_vehicle._curvature = 0.0;
    v6->_vehicle._smoothedCurvature = 0.0;
    v8 = _static_vec3_zero;
    LODWORD(v6->_vehicle._smoothedAcceleration.z) = dword_25591E708;
    *(_QWORD *)&v6->_vehicle._smoothedAcceleration.x = v8;
    -[GKAgent setDelegate:](v6, "setDelegate:", 0);
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("mass"));
    -[GKAgent setMass:](v6, "setMass:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("radius"));
    -[GKAgent setRadius:](v6, "setRadius:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("speed"));
    -[GKAgent setSpeed:](v6, "setSpeed:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("maxAcceleration"));
    -[GKAgent setMaxAcceleration:](v6, "setMaxAcceleration:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("maxSpeed"));
    -[GKAgent setMaxSpeed:](v6, "setMaxSpeed:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("positionX"));
    v10 = v9;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("positionY"));
    v12 = v11;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("positionZ"));
    v14 = v13;
    v15 = -[GKAgent vehicle](v6, "vehicle");
    v15[11] = v10;
    v15[12] = v12;
    v15[13] = v14;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  int v5;
  double v6;
  id v7;

  v7 = a3;
  -[GKAgent mass](self, "mass");
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("mass"));
  -[GKAgent radius](self, "radius");
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("radius"));
  -[GKAgent speed](self, "speed");
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("speed"));
  -[GKAgent maxAcceleration](self, "maxAcceleration");
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("maxAcceleration"));
  -[GKAgent maxSpeed](self, "maxSpeed");
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("maxSpeed"));
  -[GKAgent position3](self, "position3");
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("positionX"));
  -[GKAgent position3](self, "position3");
  LODWORD(v4) = HIDWORD(v4);
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("positionY"), v4);
  -[GKAgent position3](self, "position3");
  LODWORD(v6) = v5;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("positionZ"), v6);

}

- (void)vehicle
{
  return &self->_vehicle;
}

- (float)mass
{
  float result;

  (*((void (**)(GKSimpleVehicle *))self->_vehicle._vptr$AbstractLocalSpace + 20))(&self->_vehicle);
  return result;
}

- (void)setMass:(float)mass
{
  (*((void (**)(GKSimpleVehicle *, float))self->_vehicle._vptr$AbstractLocalSpace + 21))(&self->_vehicle, mass);
}

- (float)radius
{
  float result;

  (*((void (**)(GKSimpleVehicle *))self->_vehicle._vptr$AbstractLocalSpace + 22))(&self->_vehicle);
  return result;
}

- (void)setRadius:(float)radius
{
  (*((void (**)(GKSimpleVehicle *, float))self->_vehicle._vptr$AbstractLocalSpace + 23))(&self->_vehicle, radius);
}

- (float)speed
{
  float result;

  (*((void (**)(GKSimpleVehicle *))self->_vehicle._vptr$AbstractLocalSpace + 25))(&self->_vehicle);
  return result;
}

- (void)setSpeed:(float)speed
{
  (*((void (**)(GKSimpleVehicle *, float))self->_vehicle._vptr$AbstractLocalSpace + 26))(&self->_vehicle, speed);
}

- (float)maxAcceleration
{
  float v3;
  float v4;

  v3 = (*((float (**)(GKSimpleVehicle *, SEL))self->_vehicle._vptr$AbstractLocalSpace + 28))(&self->_vehicle, a2);
  -[GKAgent mass](self, "mass");
  return v3 / v4;
}

- (void)setMaxAcceleration:(float)maxAcceleration
{
  GKSimpleVehicle *p_vehicle;
  float v5;

  p_vehicle = &self->_vehicle;
  -[GKAgent mass](self, "mass");
  (*((void (**)(GKSimpleVehicle *, float))p_vehicle->_vptr$AbstractLocalSpace + 29))(p_vehicle, v5 * maxAcceleration);
}

- (float)maxSpeed
{
  float result;

  (*((void (**)(GKSimpleVehicle *))self->_vehicle._vptr$AbstractLocalSpace + 30))(&self->_vehicle);
  return result;
}

- (void)setMaxSpeed:(float)maxSpeed
{
  (*((void (**)(GKSimpleVehicle *, float))self->_vehicle._vptr$AbstractLocalSpace + 31))(&self->_vehicle, maxSpeed);
}

- (double)position3
{
  uint64_t v1;
  unsigned int v2;
  unsigned int v4;
  unsigned int v5;

  v1 = a1 + 40;
  v5 = COERCE_UNSIGNED_INT64((*(double (**)(uint64_t))(*(_QWORD *)(a1 + 40) + 48))(a1 + 40));
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 48))(v1);
  v4 = v2;
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 48))(v1);
  return COERCE_DOUBLE(__PAIR64__(v4, v5));
}

- (double)velocity3
{
  uint64_t v1;
  unsigned int v2;
  unsigned int v4;
  unsigned int v5;

  v1 = a1 + 40;
  v5 = COERCE_UNSIGNED_INT64((*(double (**)(uint64_t))(*(_QWORD *)(a1 + 40) + 192))(a1 + 40));
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 192))(v1);
  v4 = v2;
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 192))(v1);
  return COERCE_DOUBLE(__PAIR64__(v4, v5));
}

- (float32x2_t)steerForSeek:(void *)a1
{
  uint64_t v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float32x2_t v7;
  float v8;
  float v10;

  v2 = objc_msgSend(a1, "vehicle");
  v3 = (*(float (**)(uint64_t))(*(_QWORD *)v2 + 48))(v2);
  v5 = v4;
  v6 = *(float *)&a2 - v3;
  if (v6 == 0.0)
    v6 = 0.00000011921;
  v10 = v6;
  v7.f32[0] = (*(float (**)(uint64_t))(*(_QWORD *)v2 + 192))(v2);
  v7.f32[1] = v5 + v8;
  return vsub_f32((float32x2_t)__PAIR64__(HIDWORD(a2), LODWORD(v10)), v7);
}

- (__n64)steerForFlee:(void *)a1
{
  uint64_t v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  __n64 result;

  v2 = objc_msgSend(a1, "vehicle");
  v3 = (*(float (**)(uint64_t))(*(_QWORD *)v2 + 48))(v2);
  v5 = v4;
  v6 = v3 - *(float *)&a2;
  if (v6 == 0.0)
    v7 = 0.00000011921;
  else
    v7 = v6;
  result.n64_f32[0] = v7 - (*(float (**)(uint64_t))(*(_QWORD *)v2 + 192))(v2);
  result.n64_f32[1] = v5 - (float)(*((float *)&a2 + 1) + v8);
  return result;
}

- (__n128)steerToAvoidObstacles:(uint64_t)a3 timeBeforeCollisionToAvoid:(void *)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _BYTE *v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  _OWORD *v28;
  __int128 *v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  unsigned __int32 v35;
  unsigned __int32 v36;
  unsigned __int32 v37;
  __n128 result;
  unsigned __int32 v39;
  unsigned __int32 v40;
  void *v41;
  unsigned __int32 v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  void *__p;
  char *v49;
  char *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  __p = 0;
  v49 = 0;
  v50 = 0;
  v7 = objc_msgSend(v6, "count");
  v8 = v7;
  if (v7)
  {
    if (v7 >> 61)
      _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
    __p = operator new(8 * v7);
    v49 = (char *)__p;
    v50 = (char *)__p + 8 * v8;
  }
  v41 = a1;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(obj);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "obstacle");
        v14 = v13;
        v15 = v49;
        if (v49 < v50)
        {
          *(_QWORD *)v49 = v13;
          v12 = (uint64_t)(v15 + 8);
          goto LABEL_8;
        }
        v16 = __p;
        v17 = v49 - (_BYTE *)__p;
        v18 = (v49 - (_BYTE *)__p) >> 3;
        v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61)
          _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
        v20 = v50 - (_BYTE *)__p;
        if ((v50 - (_BYTE *)__p) >> 2 > v19)
          v19 = v20 >> 2;
        if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
          v21 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v21 = v19;
        if (v21)
        {
          if (v21 >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v22 = operator new(8 * v21);
          v23 = (uint64_t *)&v22[8 * v18];
          *v23 = v14;
          v12 = (uint64_t)(v23 + 1);
          if (v15 == v16)
          {
LABEL_21:
            __p = v23;
            v49 = (char *)v12;
            v50 = &v22[8 * v21];
            if (v15)
              goto LABEL_31;
            goto LABEL_8;
          }
        }
        else
        {
          v22 = 0;
          v23 = (uint64_t *)(8 * v18);
          *(_QWORD *)(8 * v18) = v14;
          v12 = 8 * v18 + 8;
          if (v15 == v16)
            goto LABEL_21;
        }
        v24 = v15 - 8 - v16;
        if (v24 < 0x58)
          goto LABEL_41;
        if ((unint64_t)(v15 - &v22[v17]) < 0x20)
          goto LABEL_41;
        v25 = (v24 >> 3) + 1;
        v26 = 8 * (v25 & 0x3FFFFFFFFFFFFFFCLL);
        v27 = &v15[-v26];
        v23 = (uint64_t *)((char *)v23 - v26);
        v28 = &v22[8 * v18 - 16];
        v29 = (__int128 *)(v15 - 16);
        v30 = v25 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v31 = *v29;
          *(v28 - 1) = *(v29 - 1);
          *v28 = v31;
          v28 -= 2;
          v29 -= 2;
          v30 -= 4;
        }
        while (v30);
        v15 = v27;
        if (v25 != (v25 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_41:
          do
          {
            v32 = *((_QWORD *)v15 - 1);
            v15 -= 8;
            *--v23 = v32;
          }
          while (v15 != v16);
        }
        v15 = __p;
        __p = v23;
        v49 = (char *)v12;
        v50 = &v22[8 * v21];
        if (v15)
LABEL_31:
          operator delete(v15);
LABEL_8:
        v49 = (char *)v12;
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v9);
  }

  v33 = objc_msgSend(v41, "vehicle");
  v34 = a2;
  OpenSteer::SteerLibraryMixin<OpenSteer::LocalSpaceMixin<OpenSteer::AbstractVehicle>>::steerToAvoidObstacles(v33, (const void ***)&__p, v34);
  v42 = v35;
  v39 = v36;
  v40 = v37;
  if (__p)
  {
    v49 = (char *)__p;
    operator delete(__p);
  }

  result.n128_u32[0] = v42;
  result.n128_u32[1] = v39;
  result.n128_u32[2] = v40;
  return result;
}

- (__n128)steerToAvoidAgents:(uint64_t)a3 timeBeforeCollisionToAvoid:(void *)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _BYTE *v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  _OWORD *v28;
  __int128 *v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  unsigned __int32 v35;
  unsigned __int32 v36;
  unsigned __int32 v37;
  __n128 result;
  unsigned __int32 v39;
  unsigned __int32 v40;
  void *v41;
  unsigned __int32 v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  void *__p;
  char *v49;
  char *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  __p = 0;
  v49 = 0;
  v50 = 0;
  v7 = objc_msgSend(v6, "count");
  v8 = v7;
  if (v7)
  {
    if (v7 >> 61)
      _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
    __p = operator new(8 * v7);
    v49 = (char *)__p;
    v50 = (char *)__p + 8 * v8;
  }
  v41 = a1;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(obj);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "vehicle");
        v14 = v13;
        v15 = v49;
        if (v49 < v50)
        {
          *(_QWORD *)v49 = v13;
          v12 = (uint64_t)(v15 + 8);
          goto LABEL_8;
        }
        v16 = __p;
        v17 = v49 - (_BYTE *)__p;
        v18 = (v49 - (_BYTE *)__p) >> 3;
        v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61)
          _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
        v20 = v50 - (_BYTE *)__p;
        if ((v50 - (_BYTE *)__p) >> 2 > v19)
          v19 = v20 >> 2;
        if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
          v21 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v21 = v19;
        if (v21)
        {
          if (v21 >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v22 = operator new(8 * v21);
          v23 = (uint64_t *)&v22[8 * v18];
          *v23 = v14;
          v12 = (uint64_t)(v23 + 1);
          if (v15 == v16)
          {
LABEL_21:
            __p = v23;
            v49 = (char *)v12;
            v50 = &v22[8 * v21];
            if (v15)
              goto LABEL_31;
            goto LABEL_8;
          }
        }
        else
        {
          v22 = 0;
          v23 = (uint64_t *)(8 * v18);
          *(_QWORD *)(8 * v18) = v14;
          v12 = 8 * v18 + 8;
          if (v15 == v16)
            goto LABEL_21;
        }
        v24 = v15 - 8 - v16;
        if (v24 < 0x58)
          goto LABEL_41;
        if ((unint64_t)(v15 - &v22[v17]) < 0x20)
          goto LABEL_41;
        v25 = (v24 >> 3) + 1;
        v26 = 8 * (v25 & 0x3FFFFFFFFFFFFFFCLL);
        v27 = &v15[-v26];
        v23 = (uint64_t *)((char *)v23 - v26);
        v28 = &v22[8 * v18 - 16];
        v29 = (__int128 *)(v15 - 16);
        v30 = v25 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v31 = *v29;
          *(v28 - 1) = *(v29 - 1);
          *v28 = v31;
          v28 -= 2;
          v29 -= 2;
          v30 -= 4;
        }
        while (v30);
        v15 = v27;
        if (v25 != (v25 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_41:
          do
          {
            v32 = *((_QWORD *)v15 - 1);
            v15 -= 8;
            *--v23 = v32;
          }
          while (v15 != v16);
        }
        v15 = __p;
        __p = v23;
        v49 = (char *)v12;
        v50 = &v22[8 * v21];
        if (v15)
LABEL_31:
          operator delete(v15);
LABEL_8:
        v49 = (char *)v12;
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v9);
  }

  v33 = objc_msgSend(v41, "vehicle");
  v34 = a2;
  OpenSteer::SteerLibraryMixin<OpenSteer::LocalSpaceMixin<OpenSteer::AbstractVehicle>>::steerToAvoidNeighbors(v33, (uint64_t **)&__p, v34);
  v42 = v35;
  v39 = v36;
  v40 = v37;
  if (__p)
  {
    v49 = (char *)__p;
    operator delete(__p);
  }

  result.n128_u32[0] = v42;
  result.n128_u32[1] = v39;
  result.n128_u32[2] = v40;
  return result;
}

- (__n128)steerForSeparation:(float)a3 maxDistance:(uint64_t)a4 maxAngle:(void *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  _BYTE *v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _BYTE *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  _OWORD *v30;
  __int128 *v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  unsigned __int32 v37;
  unsigned __int32 v38;
  __n128 result;
  unsigned __int32 v40;
  unsigned __int32 v41;
  void *v42;
  float v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *__p;
  char *v50;
  char *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  __p = 0;
  v50 = 0;
  v51 = 0;
  v9 = objc_msgSend(v8, "count");
  v10 = v9;
  if (v9)
  {
    if (v9 >> 61)
      _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
    __p = operator new(8 * v9);
    v50 = (char *)__p;
    v51 = (char *)__p + 8 * v10;
  }
  v42 = a1;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(obj);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "vehicle");
        v16 = v15;
        v17 = v50;
        if (v50 < v51)
        {
          *(_QWORD *)v50 = v15;
          v14 = (uint64_t)(v17 + 8);
          goto LABEL_8;
        }
        v18 = __p;
        v19 = v50 - (_BYTE *)__p;
        v20 = (v50 - (_BYTE *)__p) >> 3;
        v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 61)
          _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
        v22 = v51 - (_BYTE *)__p;
        if ((v51 - (_BYTE *)__p) >> 2 > v21)
          v21 = v22 >> 2;
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8)
          v23 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v23 = v21;
        if (v23)
        {
          if (v23 >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v24 = operator new(8 * v23);
          v25 = (uint64_t *)&v24[8 * v20];
          *v25 = v16;
          v14 = (uint64_t)(v25 + 1);
          if (v17 == v18)
          {
LABEL_21:
            __p = v25;
            v50 = (char *)v14;
            v51 = &v24[8 * v23];
            if (v17)
              goto LABEL_31;
            goto LABEL_8;
          }
        }
        else
        {
          v24 = 0;
          v25 = (uint64_t *)(8 * v20);
          *(_QWORD *)(8 * v20) = v16;
          v14 = 8 * v20 + 8;
          if (v17 == v18)
            goto LABEL_21;
        }
        v26 = v17 - 8 - v18;
        if (v26 < 0x58)
          goto LABEL_41;
        if ((unint64_t)(v17 - &v24[v19]) < 0x20)
          goto LABEL_41;
        v27 = (v26 >> 3) + 1;
        v28 = 8 * (v27 & 0x3FFFFFFFFFFFFFFCLL);
        v29 = &v17[-v28];
        v25 = (uint64_t *)((char *)v25 - v28);
        v30 = &v24[8 * v20 - 16];
        v31 = (__int128 *)(v17 - 16);
        v32 = v27 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v33 = *v31;
          *(v30 - 1) = *(v31 - 1);
          *v30 = v33;
          v30 -= 2;
          v31 -= 2;
          v32 -= 4;
        }
        while (v32);
        v17 = v29;
        if (v27 != (v27 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_41:
          do
          {
            v34 = *((_QWORD *)v17 - 1);
            v17 -= 8;
            *--v25 = v34;
          }
          while (v17 != v18);
        }
        v17 = __p;
        __p = v25;
        v50 = (char *)v14;
        v51 = &v24[8 * v23];
        if (v17)
LABEL_31:
          operator delete(v17);
LABEL_8:
        v50 = (char *)v14;
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v11);
  }

  v35 = objc_msgSend(v42, "vehicle");
  v36 = cosf(a3);
  v43 = OpenSteer::SteerLibraryMixin<OpenSteer::LocalSpaceMixin<OpenSteer::AbstractVehicle>>::steerForSeparation(v35, (uint64_t)&__p, a2, v36);
  v40 = v37;
  v41 = v38;
  if (__p)
  {
    v50 = (char *)__p;
    operator delete(__p);
  }

  result.n128_f32[0] = v43;
  result.n128_u32[1] = v40;
  result.n128_u32[2] = v41;
  return result;
}

- (__n128)steerForAlignment:(float)a3 maxDistance:(uint64_t)a4 maxAngle:(void *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  _BYTE *v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _BYTE *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  _OWORD *v30;
  __int128 *v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  unsigned __int32 v37;
  unsigned __int32 v38;
  __n128 result;
  unsigned __int32 v40;
  unsigned __int32 v41;
  void *v42;
  float v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *__p;
  char *v50;
  char *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  __p = 0;
  v50 = 0;
  v51 = 0;
  v9 = objc_msgSend(v8, "count");
  v10 = v9;
  if (v9)
  {
    if (v9 >> 61)
      _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
    __p = operator new(8 * v9);
    v50 = (char *)__p;
    v51 = (char *)__p + 8 * v10;
  }
  v42 = a1;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(obj);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "vehicle");
        v16 = v15;
        v17 = v50;
        if (v50 < v51)
        {
          *(_QWORD *)v50 = v15;
          v14 = (uint64_t)(v17 + 8);
          goto LABEL_8;
        }
        v18 = __p;
        v19 = v50 - (_BYTE *)__p;
        v20 = (v50 - (_BYTE *)__p) >> 3;
        v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 61)
          _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
        v22 = v51 - (_BYTE *)__p;
        if ((v51 - (_BYTE *)__p) >> 2 > v21)
          v21 = v22 >> 2;
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8)
          v23 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v23 = v21;
        if (v23)
        {
          if (v23 >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v24 = operator new(8 * v23);
          v25 = (uint64_t *)&v24[8 * v20];
          *v25 = v16;
          v14 = (uint64_t)(v25 + 1);
          if (v17 == v18)
          {
LABEL_21:
            __p = v25;
            v50 = (char *)v14;
            v51 = &v24[8 * v23];
            if (v17)
              goto LABEL_31;
            goto LABEL_8;
          }
        }
        else
        {
          v24 = 0;
          v25 = (uint64_t *)(8 * v20);
          *(_QWORD *)(8 * v20) = v16;
          v14 = 8 * v20 + 8;
          if (v17 == v18)
            goto LABEL_21;
        }
        v26 = v17 - 8 - v18;
        if (v26 < 0x58)
          goto LABEL_41;
        if ((unint64_t)(v17 - &v24[v19]) < 0x20)
          goto LABEL_41;
        v27 = (v26 >> 3) + 1;
        v28 = 8 * (v27 & 0x3FFFFFFFFFFFFFFCLL);
        v29 = &v17[-v28];
        v25 = (uint64_t *)((char *)v25 - v28);
        v30 = &v24[8 * v20 - 16];
        v31 = (__int128 *)(v17 - 16);
        v32 = v27 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v33 = *v31;
          *(v30 - 1) = *(v31 - 1);
          *v30 = v33;
          v30 -= 2;
          v31 -= 2;
          v32 -= 4;
        }
        while (v32);
        v17 = v29;
        if (v27 != (v27 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_41:
          do
          {
            v34 = *((_QWORD *)v17 - 1);
            v17 -= 8;
            *--v25 = v34;
          }
          while (v17 != v18);
        }
        v17 = __p;
        __p = v25;
        v50 = (char *)v14;
        v51 = &v24[8 * v23];
        if (v17)
LABEL_31:
          operator delete(v17);
LABEL_8:
        v50 = (char *)v14;
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v11);
  }

  v35 = objc_msgSend(v42, "vehicle");
  v36 = cosf(a3);
  v43 = OpenSteer::SteerLibraryMixin<OpenSteer::LocalSpaceMixin<OpenSteer::AbstractVehicle>>::steerForAlignment(v35, (uint64_t)&__p, a2, v36);
  v40 = v37;
  v41 = v38;
  if (__p)
  {
    v50 = (char *)__p;
    operator delete(__p);
  }

  result.n128_f32[0] = v43;
  result.n128_u32[1] = v40;
  result.n128_u32[2] = v41;
  return result;
}

- (__n128)steerForCohesion:(float)a3 maxDistance:(uint64_t)a4 maxAngle:(void *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  _BYTE *v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _BYTE *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  _OWORD *v30;
  __int128 *v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  unsigned __int32 v37;
  unsigned __int32 v38;
  __n128 result;
  unsigned __int32 v40;
  unsigned __int32 v41;
  void *v42;
  float v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *__p;
  char *v50;
  char *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  __p = 0;
  v50 = 0;
  v51 = 0;
  v9 = objc_msgSend(v8, "count");
  v10 = v9;
  if (v9)
  {
    if (v9 >> 61)
      _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
    __p = operator new(8 * v9);
    v50 = (char *)__p;
    v51 = (char *)__p + 8 * v10;
  }
  v42 = a1;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(obj);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "vehicle");
        v16 = v15;
        v17 = v50;
        if (v50 < v51)
        {
          *(_QWORD *)v50 = v15;
          v14 = (uint64_t)(v17 + 8);
          goto LABEL_8;
        }
        v18 = __p;
        v19 = v50 - (_BYTE *)__p;
        v20 = (v50 - (_BYTE *)__p) >> 3;
        v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 61)
          _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
        v22 = v51 - (_BYTE *)__p;
        if ((v51 - (_BYTE *)__p) >> 2 > v21)
          v21 = v22 >> 2;
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8)
          v23 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v23 = v21;
        if (v23)
        {
          if (v23 >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v24 = operator new(8 * v23);
          v25 = (uint64_t *)&v24[8 * v20];
          *v25 = v16;
          v14 = (uint64_t)(v25 + 1);
          if (v17 == v18)
          {
LABEL_21:
            __p = v25;
            v50 = (char *)v14;
            v51 = &v24[8 * v23];
            if (v17)
              goto LABEL_31;
            goto LABEL_8;
          }
        }
        else
        {
          v24 = 0;
          v25 = (uint64_t *)(8 * v20);
          *(_QWORD *)(8 * v20) = v16;
          v14 = 8 * v20 + 8;
          if (v17 == v18)
            goto LABEL_21;
        }
        v26 = v17 - 8 - v18;
        if (v26 < 0x58)
          goto LABEL_41;
        if ((unint64_t)(v17 - &v24[v19]) < 0x20)
          goto LABEL_41;
        v27 = (v26 >> 3) + 1;
        v28 = 8 * (v27 & 0x3FFFFFFFFFFFFFFCLL);
        v29 = &v17[-v28];
        v25 = (uint64_t *)((char *)v25 - v28);
        v30 = &v24[8 * v20 - 16];
        v31 = (__int128 *)(v17 - 16);
        v32 = v27 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v33 = *v31;
          *(v30 - 1) = *(v31 - 1);
          *v30 = v33;
          v30 -= 2;
          v31 -= 2;
          v32 -= 4;
        }
        while (v32);
        v17 = v29;
        if (v27 != (v27 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_41:
          do
          {
            v34 = *((_QWORD *)v17 - 1);
            v17 -= 8;
            *--v25 = v34;
          }
          while (v17 != v18);
        }
        v17 = __p;
        __p = v25;
        v50 = (char *)v14;
        v51 = &v24[8 * v23];
        if (v17)
LABEL_31:
          operator delete(v17);
LABEL_8:
        v50 = (char *)v14;
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v11);
  }

  v35 = objc_msgSend(v42, "vehicle");
  v36 = cosf(a3);
  v43 = OpenSteer::SteerLibraryMixin<OpenSteer::LocalSpaceMixin<OpenSteer::AbstractVehicle>>::steerForCohesion(v35, (uint64_t)&__p, a2, v36);
  v40 = v37;
  v41 = v38;
  if (__p)
  {
    v50 = (char *)__p;
    operator delete(__p);
  }

  result.n128_f32[0] = v43;
  result.n128_u32[1] = v40;
  result.n128_u32[2] = v41;
  return result;
}

- (float32x2_t)steerForTargetSpeed:(void *)a1
{
  uint64_t v3;
  float v4;
  float v5;
  float v6;
  __int32 v7;
  float32x2_t v8;
  float v9;

  v3 = objc_msgSend(a1, "vehicle");
  v4 = (*(float (**)(uint64_t))(*(_QWORD *)v3 + 224))(v3);
  v5 = a2 - (*(float (**)(uint64_t))(*(_QWORD *)v3 + 200))(v3);
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 32))(v3);
  v6 = fminf(v5, v4);
  v8.i32[1] = v7;
  if (v5 >= (float)-v4)
    v9 = v6;
  else
    v9 = -v4;
  return vmul_n_f32(v8, v9);
}

- (__n64)steerForWander:(float)a3 speed:
{
  float *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  __n64 result;

  v5 = (float *)objc_msgSend(a1, "vehicle");
  v6 = a2;
  v7 = v6 * a3;
  v5[14] = fmaxf(fminf(v5[14] - (float)(v7 - (float)((float)((float)rand() * 9.3132e-10) * v7)), 1.0), -1.0);
  v5[15] = fmaxf(fminf(v5[15] - (float)(v7 - (float)((float)((float)rand() * 9.3132e-10) * v7)), 1.0), -1.0);
  v8 = (**(float (***)(float *))v5)(v5);
  v9 = v5[14];
  v10 = v8 * v9;
  *(float *)&a2 = v11 * v9;
  v12 = (*(float (**)(float *))(*(_QWORD *)v5 + 16))(v5);
  v13 = v5[15];
  result.n64_f32[0] = v10 + (float)(v12 * v13);
  result.n64_f32[1] = *(float *)&a2 + (float)(v14 * v13);
  return result;
}

- (__n128)steerForIntercept:(uint64_t)a3 maxPredictionTime:(void *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  unsigned __int32 v10;
  unsigned __int32 v11;
  __n128 result;
  unsigned __int32 v13;
  unsigned __int32 v14;
  float v15;

  v6 = a4;
  v7 = objc_msgSend(a1, "vehicle");
  v8 = objc_msgSend(v6, "vehicle");
  v9 = a2;
  v15 = OpenSteer::SteerLibraryMixin<OpenSteer::LocalSpaceMixin<OpenSteer::AbstractVehicle>>::steerForPursuit(v7, v8, v9);
  v13 = v10;
  v14 = v11;

  result.n128_f32[0] = v15;
  result.n128_u32[1] = v13;
  result.n128_u32[2] = v14;
  return result;
}

- (__n128)steerToFollowPath:(uint64_t)a3 maxPredictionTime:(void *)a4 forward:(int)a5
{
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  unsigned __int32 v13;
  unsigned __int32 v14;
  unsigned __int32 v15;
  __n128 result;
  unsigned __int32 v17;
  unsigned __int32 v18;
  unsigned __int32 v19;

  v8 = a4;
  if (a5)
    v9 = 1;
  else
    v9 = -1;
  v10 = objc_msgSend(a1, "vehicle");
  v11 = objc_msgSend(v8, "pathway");
  v12 = a2;
  OpenSteer::SteerLibraryMixin<OpenSteer::LocalSpaceMixin<OpenSteer::AbstractVehicle>>::steerToFollowPath(v10, v9, v11, v12);
  v19 = v13;
  v17 = v14;
  v18 = v15;

  result.n128_u32[0] = v19;
  result.n128_u32[1] = v17;
  result.n128_u32[2] = v18;
  return result;
}

- (__n128)steerToStayOnPath:(void *)a3 maxPredictionTime:
{
  id v4;
  unsigned __int32 v5;
  unsigned __int32 v6;
  __n128 result;
  unsigned __int32 v8;
  unsigned __int32 v9;
  float v10;

  v4 = a3;
  v10 = OpenSteer::SteerLibraryMixin<OpenSteer::LocalSpaceMixin<OpenSteer::AbstractVehicle>>::steerToStayOnPath(objc_msgSend(a1, "vehicle"), (float (***)(_QWORD, _DWORD *, uint64_t *, float *))objc_msgSend(v4, "pathway"));
  v8 = v5;
  v9 = v6;

  result.n128_f32[0] = v10;
  result.n128_u32[1] = v8;
  result.n128_u32[2] = v9;
  return result;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (GKBehavior)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(GKBehavior *)behavior
{
  objc_storeStrong((id *)&self->_behavior, behavior);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_destroyWeak((id *)&self->_delegate);
  OpenSteer::SimpleVehicle::~SimpleVehicle((OpenSteer::SimpleVehicle *)&self->_vehicle);
}

- (id).cxx_construct
{
  *(_QWORD *)OpenSteer::SimpleVehicle::SimpleVehicle((OpenSteer::SimpleVehicle *)&self->_vehicle) = off_24F04EEC0;
  return self;
}

@end
