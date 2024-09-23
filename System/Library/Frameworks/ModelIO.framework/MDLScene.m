@implementation MDLScene

- (MDLScene)init
{
  MDLScene *v2;
  MDLScene *v3;
  MDLScene *v4;
  uint64_t v5;
  RTRenderable **begin;
  vector<ModelIO::RTRenderable *, std::allocator<ModelIO::RTRenderable *>> *p_sceneObjects;
  NSMutableArray *v8;
  NSMutableArray *objects;
  MDLScene *v10;
  _QWORD v12[3];
  objc_super v13;
  void **v14;

  v13.receiver = self;
  v13.super_class = (Class)MDLScene;
  v2 = -[MDLScene init](&v13, sel_init);
  v3 = v2;
  v4 = v2;
  if (v2)
  {
    v2->_signature = 0;
    v5 = operator new();
    *(_QWORD *)v5 = 850045863;
    *(_OWORD *)(v5 + 8) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_QWORD *)(v5 + 56) = 0;
    p_sceneObjects = &v4->_sceneObjects;
    begin = v4->_sceneObjects.__begin_;
    v4->_sceneMutex = (mutex *)v5;
    if (begin)
    {
      v4->_sceneObjects.__end_ = begin;
      operator delete(begin);
      p_sceneObjects->__begin_ = 0;
      v4->_sceneObjects.__end_ = 0;
      v4->_sceneObjects.__end_cap_.__value_ = 0;
    }
    p_sceneObjects->__begin_ = 0;
    v4->_sceneObjects.__end_ = 0;
    v4->_sceneObjects.__end_cap_.__value_ = 0;
    sub_1DCC100D4((void **)&v3->_sceneLights.__begin_);
    v4->_sceneLights.__begin_ = 0;
    v4->_sceneLights.var0 = 0;
    v4->_sceneLights.var1.__value_ = 0;
    memset(v12, 0, sizeof(v12));
    v14 = (void **)v12;
    sub_1DCC10068(&v14);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objects = v4->_objects;
    v4->_objects = v8;

    v10 = v4;
  }

  return v4;
}

- (void)dealloc
{
  mutex *sceneMutex;
  RTRenderable **begin;
  RTRenderable **end;
  objc_super v6;

  sceneMutex = self->_sceneMutex;
  std::mutex::lock((std::mutex *)sceneMutex);
  begin = self->_sceneObjects.__begin_;
  end = self->_sceneObjects.__end_;
  while (begin != end)
  {
    if (*begin)
      (*(void (**)(RTRenderable *))(*(_QWORD *)*begin + 24))(*begin);
    ++begin;
  }
  std::mutex::unlock((std::mutex *)sceneMutex);
  v6.receiver = self;
  v6.super_class = (Class)MDLScene;
  -[MDLScene dealloc](&v6, sel_dealloc);
}

- (int)acquireLockGuard
{
  int result;

  std::mutex::lock((std::mutex *)self->_sceneMutex);
  result = self->_signature + 1;
  self->_signature = result;
  return result;
}

- (void)releaseLockGuard:(int)a3
{
  std::mutex::unlock((std::mutex *)self->_sceneMutex);
  --self->_signature;
}

- (__n128)hitTestRayFrom:(uint64_t)a1 withDirection:(uint64_t)a2 usingCamera:(void *)a3
{
  id v4;
  float32x4_t v5;
  uint64_t *v11;
  uint64_t *v12;
  float32x4_t v13;
  float32x4_t v15;
  int8x16_t v16;

  v4 = a3;
  __asm { FMOV            V0.2S, #1.0 }
  v11 = *(uint64_t **)(a1 + 16);
  v12 = *(uint64_t **)(a1 + 24);
  if (v11 == v12)
  {
    v16 = (int8x16_t)vdupq_n_s32(0x7F7FFFFFu);
  }
  else
  {
    v16 = (int8x16_t)vdupq_n_s32(0x7F7FFFFFu);
    v5.i32[0] = 2139095039;
    do
    {
      v15 = v5;
      sub_1DCAF1160(*v11);
      v13.i32[0] = 2139095039;
      v5 = v15;
      v16 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v15, v13), 0), (int8x16_t)0, v16);
      if (v15.f32[0] > 3.4028e38)
        v5.f32[0] = 3.4028e38;
      ++v11;
    }
    while (v11 != v12);
  }

  return (__n128)v16;
}

- (BOOL)castRayFrom:(MDLScene *)self withDirection:(SEL)a2 usingCamera:(RTCamera *)a3 result:(RTIntersectionResult *)a4
{
  return sub_1DCC0F328((uint64_t)self);
}

- (void)addObject:(id)a3
{
  id v4;
  const char *v5;
  mutex *sceneMutex;
  id v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  unint64_t v22;
  const char *v23;
  uint64_t v24;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  unint64_t v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  RTRenderable **value;
  RTRenderable **end;
  RTRenderable **v35;
  RTRenderable **begin;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  RTRenderable **v42;
  RTRenderable **v43;
  RTRenderable **v44;
  RTRenderable **v45;
  RTRenderable *v46;
  id v47;

  v4 = a3;
  objc_msgSend_addObject_(self->_objects, v5, (uint64_t)v4);
  sceneMutex = self->_sceneMutex;
  std::mutex::lock((std::mutex *)sceneMutex);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = v4;
    sub_1DCC0F778((char **)&self->_sceneLights, &v47);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v4;
      v10 = objc_msgSend_vertexCount(v7, v8, v9);
      v13 = objc_msgSend_vertexCount(v7, v11, v12);
      v16 = objc_msgSend_vertexCount(v7, v14, v15);
      v19 = objc_msgSend_vertexCount(v7, v17, v18);
      v22 = objc_msgSend_vertexCount(v7, v20, v21);
      v25 = objc_msgSend_vertexCount(v7, v23, v24);
      v28 = objc_msgSend_vertexCount(v7, v26, v27);
      if (v10 <= 0x1F3)
        v29 = 3;
      else
        v29 = 4;
      if (v13 > 0x9C3)
        ++v29;
      if (v16 >> 3 > 0x270)
        ++v29;
      if (v19 >> 3 > 0xC34)
        ++v29;
      if (v22 >> 4 > 0xC34)
        ++v29;
      if (v25 >> 5 <= 0xC34)
        v30 = v29;
      else
        v30 = v29 + 1;
      if (v28 <= 0x7A11F)
        v31 = v30;
      else
        v31 = v30 + 1;

    }
    else
    {
      v31 = 3;
    }
    v32 = operator new();
    sub_1DCBFF148(v32, v4, v31);
    value = self->_sceneObjects.__end_cap_.__value_;
    end = self->_sceneObjects.__end_;
    if (end >= value)
    {
      begin = self->_sceneObjects.__begin_;
      v37 = end - begin;
      if ((unint64_t)(v37 + 1) >> 61)
        sub_1DCAE4C44();
      v38 = (char *)value - (char *)begin;
      v39 = v38 >> 2;
      if (v38 >> 2 <= (unint64_t)(v37 + 1))
        v39 = v37 + 1;
      if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8)
        v40 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v40 = v39;
      if (v40)
        v41 = (char *)sub_1DCAE79A4((uint64_t)&self->_sceneObjects.__end_cap_, v40);
      else
        v41 = 0;
      v42 = (RTRenderable **)&v41[8 * v37];
      v43 = (RTRenderable **)&v41[8 * v40];
      *v42 = (RTRenderable *)v32;
      v35 = v42 + 1;
      v45 = self->_sceneObjects.__begin_;
      v44 = self->_sceneObjects.__end_;
      if (v44 != v45)
      {
        do
        {
          v46 = *--v44;
          *--v42 = v46;
        }
        while (v44 != v45);
        v44 = self->_sceneObjects.__begin_;
      }
      self->_sceneObjects.__begin_ = v42;
      self->_sceneObjects.__end_ = v35;
      self->_sceneObjects.__end_cap_.__value_ = v43;
      if (v44)
        operator delete(v44);
    }
    else
    {
      *end = (RTRenderable *)v32;
      v35 = end + 1;
    }
    self->_sceneObjects.__end_ = v35;
  }
  std::mutex::unlock((std::mutex *)sceneMutex);

}

- (void)clear
{
  mutex *sceneMutex;
  RTRenderable **begin;
  RTRenderable **end;

  sceneMutex = self->_sceneMutex;
  std::mutex::lock((std::mutex *)sceneMutex);
  begin = self->_sceneObjects.__begin_;
  end = self->_sceneObjects.__end_;
  if (begin != end)
  {
    do
    {
      if (*begin)
        (*(void (**)(RTRenderable *))(*(_QWORD *)*begin + 24))(*begin);
      ++begin;
    }
    while (begin != end);
    begin = self->_sceneObjects.__begin_;
  }
  self->_sceneObjects.__end_ = begin;
  std::mutex::unlock((std::mutex *)sceneMutex);
}

- (id)raytraceSceneWithCamera:(const RTCamera *)a3 reflection:(id)a4 irradiance:(id)a5 size:
{
  int32x2_t v5;
  id v9;
  id v10;
  id v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  clock_t v21;
  const char *v22;
  uint64_t v23;
  __int128 v24;
  dispatch_group_t v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  float32x2_t v31;
  float32x2_t v32;
  id v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  clock_t v37;
  const char *v38;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  dispatch_queue_t v45;
  id v46;
  double v47;
  int32x2_t v48;
  _QWORD block[4];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  float32x4_t v55;
  MDLScene *v56;
  id v57;
  id v58;
  NSObject *v59;
  NSObject *v60;
  int32x2_t v61;
  uint64_t v62;
  const RTCamera *v63;

  v48 = v5;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v46 = objc_retainAutorelease((id)objc_msgSend_initWithLength_(v11, v12, 4 * v48.i32[1] * v48.i32[0]));
  v15 = objc_msgSend_mutableBytes(v46, v13, v14);
  v16 = atomic_load((unsigned __int8 *)&qword_1F03B5190);
  if ((v16 & 1) == 0 && __cxa_guard_acquire(&qword_1F03B5190))
  {
    v40 = operator new();
    sub_1DCAD2364(v40);
    qword_1F03B5188 = v40;
    __cxa_guard_release(&qword_1F03B5190);
  }
  v17 = (void *)MEMORY[0x1DF0D25C8]();
  v20 = objc_msgSend_acquireLockGuard(self, v18, v19);
  v21 = clock();
  objc_msgSend_translation(a3->var10, v22, v23);
  v44 = v24;
  v45 = dispatch_queue_create("trace", 0);
  v25 = dispatch_group_create();
  dispatch_get_global_queue(33, 0);
  v26 = objc_claimAutoreleasedReturnValue();
  v47 = COERCE_DOUBLE(vcvt_f32_s32(v48));
  *(double *)&v27 = sub_1DCBC1EB8((float32x4_t *)a3, 0.0, v47);
  v43 = v27;
  *(double *)&v28 = sub_1DCBC1EB8((float32x4_t *)a3, COERCE_DOUBLE((unint64_t)LODWORD(v47)), v47);
  v42 = v28;
  DWORD1(v28) = HIDWORD(v47);
  LODWORD(v28) = 0;
  *(double *)&v29 = sub_1DCBC1EB8((float32x4_t *)a3, *(double *)&v28, v47);
  v41 = v29;
  *(double *)&v30 = sub_1DCBC1EB8((float32x4_t *)a3, v47, v47);
  v31 = vrsqrte_f32((float32x2_t)1062333316);
  v32 = vmul_f32(vrsqrts_f32((float32x2_t)1062333316, vmul_f32(v31, v31)), v31);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1DCC0FCB0;
  block[3] = &unk_1EA577438;
  v61 = v48;
  v50 = v43;
  v51 = v41;
  v52 = v42;
  v53 = v30;
  v56 = self;
  v62 = v15;
  v63 = a3;
  v54 = v44;
  v55 = vmulq_n_f32((float32x4_t)xmmword_1DCC5AF60, vmul_f32(v32, vrsqrts_f32((float32x2_t)1062333316, vmul_f32(v32, v32))).f32[0]);
  v33 = v9;
  v57 = v33;
  v34 = v10;
  v58 = v34;
  v35 = v25;
  v59 = v35;
  v36 = v45;
  v60 = v36;
  dispatch_apply(0x20uLL, v26, block);
  dispatch_group_wait(v35, 0xFFFFFFFFFFFFFFFFLL);
  v37 = clock();
  NSLog(CFSTR("frame time : %.2fms"), (double)(v37 - v21) * 0.0001);
  objc_msgSend_releaseLockGuard_(self, v38, v20);

  objc_autoreleasePoolPop(v17);
  return v46;
}

- (NSArray)objects
{
  return &self->_objects->super;
}

- (void).cxx_destruct
{
  RTRenderable **begin;
  vector<MDLLight *, std::allocator<MDLLight *>> *p_sceneLights;

  objc_storeStrong((id *)&self->_objects, 0);
  p_sceneLights = &self->_sceneLights;
  sub_1DCC10068((void ***)&p_sceneLights);
  begin = self->_sceneObjects.__begin_;
  if (begin)
  {
    self->_sceneObjects.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end
