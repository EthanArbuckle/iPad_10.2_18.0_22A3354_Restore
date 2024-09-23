@implementation REPHASEContext

- (REPHASEContext)initWithSampleRate:(double)a3 phaseQueue:(id)a4 audioEngineRunnableManager:(shared_ptr<re::AudioEngineRunnableManager>)a5
{
  uint64_t *ptr;
  id v9;
  REPHASEContext *v10;
  REPHASEContext *v11;
  uint64_t v12;
  PHASENumberMetaParameterDefinition *gainLinearParamDefinition;
  uint64_t v14;
  PHASENumberMetaParameterDefinition *rateParamDefinition;
  void *v16;
  objc_super v18;

  ptr = (uint64_t *)a5.__ptr_;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)REPHASEContext;
  v10 = -[REPHASEContext init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    atomic_store(0, (unsigned __int8 *)&v10->_stoppedAndDestroyed);
    v10->_reverbPreset = -1;
    v10->_allowSpaceBlend = 1;
    v10->_spaceBlendLevel = 0.0;
    v10->_sampleRate = a3;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDE3298]), "initWithValue:minimum:maximum:identifier:", CFSTR("gain"), 1.0, 0.0, 4.0);
    gainLinearParamDefinition = v11->_gainLinearParamDefinition;
    v11->_gainLinearParamDefinition = (PHASENumberMetaParameterDefinition *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDE3298]), "initWithValue:minimum:maximum:identifier:", CFSTR("rate"), 1.0, 0.25, 4.0);
    rateParamDefinition = v11->_rateParamDefinition;
    v11->_rateParamDefinition = (PHASENumberMetaParameterDefinition *)v14;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_directpathEnabled = objc_msgSend(v16, "BOOLForKey:", CFSTR("com.apple.re.audio.directpathenabled"));
    objc_storeStrong((id *)&v11->_phaseQueue, a4);
    std::shared_ptr<std::atomic<re::VideoReturn>>::operator=[abi:nn180100](&v11->_audioEngineRunnableManager.__ptr_, ptr);

  }
  return v11;
}

- (void)fillOutMeshBoundingBoxInformation:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  __int128 v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  float v22;
  __int128 v23;
  float v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  id *v44;

  v4 = a3;
  -[REPHASEContext copyPhaseShapeCache](self, "copyPhaseShapeCache");
  v42 = 0uLL;
  v41 = 0uLL;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v44;
  if (v44)
  {
    v31 = 0u;
    v32 = 0u;
    do
    {
      v7 = (uint64_t)v6[2];
      v8 = v6[4];
      objc_msgSend(v8, "boundingBox");
      v29 = v10;
      v30 = v9;
      objc_msgSend(v8, "boundingBox");
      v38 = v11;
      v40 = v12;
      v37 = v13;
      v39 = v14;
      objc_msgSend(v8, "boundingBox");
      v34 = v15;
      v36 = v16;
      v33 = v17;
      v35 = v18;
      -[REPHASEContext fillOutMeshBoundingBoxInformation:]::$_5::operator()(v7, &v39, &v33);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PHASEMesh-%llu"), v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v19, v20);

      if (v6 == v44)
      {
        objc_msgSend(v8, "boundingBox");
        v32 = v25;
        v42 = v25;
        objc_msgSend(v8, "boundingBox");
        v31 = v26;
        v41 = v26;
      }
      else
      {
        HIDWORD(v23) = HIDWORD(v32);
        v22 = *((float *)&v32 + 2);
        *(int8x8_t *)&v21 = vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)&v32, *(float32x2_t *)&v29), *(int8x8_t *)&v29, *(int8x8_t *)&v32);
        *(int8x8_t *)&v23 = vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)&v30, *(float32x2_t *)&v31), *(int8x8_t *)&v30, *(int8x8_t *)&v31);
        if (*((float *)&v32 + 2) > *((float *)&v29 + 2))
          v22 = *((float *)&v29 + 2);
        *(_QWORD *)&v42 = v21;
        *((float *)&v21 + 2) = v22;
        v32 = v21;
        *((float *)&v42 + 2) = v22;
        v24 = *((float *)&v30 + 2);
        if (*((float *)&v31 + 2) >= *((float *)&v30 + 2))
          v24 = *((float *)&v31 + 2);
        *(_QWORD *)&v41 = v23;
        *((float *)&v23 + 2) = v24;
        v31 = v23;
        *((float *)&v41 + 2) = v24;
      }

      v6 = (id *)*v6;
    }
    while (v6);
  }
  -[REPHASEContext fillOutMeshBoundingBoxInformation:]::$_5::operator()(0, &v42, &v41);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v27, CFSTR("Overall-PHASEMesh"));

  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("PHASEMeshBoundingBoxInfo"));
  std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::__deallocate_node(v44);
  v28 = v43;
  v43 = 0;
  if (v28)
    operator delete(v28);

}

- (id)fillOutMeshBoundingBoxInformation:
{
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v26[0] = CFSTR("minBounds");
  LODWORD(v6) = *a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  LODWORD(v8) = a2[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v9;
  LODWORD(v10) = a2[2];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v12;
  v26[1] = CFSTR("maxBounds");
  LODWORD(v13) = *a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  LODWORD(v15) = a3[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v16;
  LODWORD(v17) = a3[2];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v19;
  v26[2] = CFSTR("meshID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v21);

  return v23;
}

- (void)fillOutDebugInformation:(id)a3
{
  NSMutableDictionary *v4;
  re *v5;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *>>> *i;
  NSObject *v7;
  uint8_t v8[16];

  v4 = (NSMutableDictionary *)a3;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  for (i = &self->_scenes.__table_.__p1_;
        ;
        re::audio::REPHASEAudioScene::fillOutDebugInformation((re::audio::REPHASEAudioScene *)i[3].__value_.__next_, v4))
  {
    i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *>>> *)i->__value_.__next_;
    if (!i)
      break;
  }
  if (self->_engine)
  {
    v7 = *re::audioLogObjects(v5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_224FE9000, v7, OS_LOG_TYPE_DEFAULT, "Filling out PHASE Mesh Info", v8, 2u);
    }
    -[REPHASEContext fillOutMeshBoundingBoxInformation:](self, "fillOutMeshBoundingBoxInformation:", v4);
  }
  os_unfair_lock_unlock(&self->_scenesMutex.m_lock);

}

- (PHASEEngine)maybeEngine
{
  UnfairLock *p_audioEngineMutex;
  PHASEEngine *v4;

  p_audioEngineMutex = &self->_audioEngineMutex;
  os_unfair_lock_lock(&self->_audioEngineMutex.m_lock);
  v4 = self->_engine;
  os_unfair_lock_unlock(&p_audioEngineMutex->m_lock);
  return v4;
}

- (PHASEEngine)engine
{
  UnfairLock *p_audioEngineMutex;
  re *v4;
  PHASEEngine *engine;
  NSObject *v6;
  pthread_t v7;
  PHASEEngine *v8;
  PHASEEngine *v9;
  void *v10;
  PHASEEngine *v11;
  id v13[2];

  p_audioEngineMutex = &self->_audioEngineMutex;
  os_unfair_lock_lock(&self->_audioEngineMutex.m_lock);
  engine = self->_engine;
  if (!engine)
  {
    v6 = *re::audioLogObjects(v4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_224FE9000, v6, OS_LOG_TYPE_DEFAULT, "Initializing Phase audio engine... update mode = manual", (uint8_t *)v13, 2u);
    }
    v7 = pthread_self();
    re::internal::AriadneSignpostScopeGuard::AriadneSignpostScopeGuard((re::internal::AriadneSignpostScopeGuard *)v13, 2522, (uint64_t)v7);
    REAudioCreatePHASEEngine();
    v8 = (PHASEEngine *)objc_claimAutoreleasedReturnValue();
    v9 = self->_engine;
    self->_engine = v8;

    re::internal::AriadneSignpostScopeGuard::~AriadneSignpostScopeGuard((re::internal::AriadneSignpostScopeGuard *)v13);
    -[REPHASEContext applyCustomHRIR](self, "applyCustomHRIR");
    -[REPHASEContext applyReverbPreset](self, "applyReverbPreset");
    -[REPHASEContext applySpaceBlendLevel](self, "applySpaceBlendLevel");
    re::Bundle::coreREFramework(v13);
    objc_msgSend(v13[0], "URLForResource:withExtension:", CFSTR("PHASEHumanDirectivity"), CFSTR("plist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[REPHASEContext loadHumanDirectivityPlistFromURL:](self, "loadHumanDirectivityPlistFromURL:", v10);

    engine = self->_engine;
  }
  v11 = engine;
  os_unfair_lock_unlock(&p_audioEngineMutex->m_lock);
  return v11;
}

- (void)update
{
  UnfairLock *p_soundEventsMutex;
  id *i;
  id v5;
  re *v6;
  uint64_t *v7;
  re *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  re *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  p_soundEventsMutex = &self->_soundEventsMutex;
  os_unfair_lock_lock(&self->_soundEventsMutex.m_lock);
  for (i = (id *)self->_soundEvents.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
  {
    v5 = i[3];
    objc_msgSend(v5, "updateCommandQueue");

  }
  os_unfair_lock_unlock(&p_soundEventsMutex->m_lock);
  -[PHASEEngine rootObject](self->_engine, "rootObject");
  v6 = (re *)objc_claimAutoreleasedReturnValue();
  v7 = re::audioLogObjects(v6);
  v8 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v7);
  if ((_DWORD)v8)
  {
    v10 = (id)*re::audioLogObjects(v8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[re children](v6, "children");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v6;
      v14 = 2048;
      v15 = objc_msgSend(v11, "count");
      _os_log_debug_impl(&dword_224FE9000, v10, OS_LOG_TYPE_DEBUG, "REPHASEContext update: %@ has %lu children right before PHASEEngine update", (uint8_t *)&v12, 0x16u);

    }
  }
  -[REPHASEContext maybeEngine](self, "maybeEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "update");

}

- (void)clearPhaseShapeCache
{
  UnfairLock *p_shapesMutex;
  unint64_t value;
  uint64_t i;

  p_shapesMutex = &self->_shapesMutex;
  os_unfair_lock_lock(&self->_shapesMutex.m_lock);
  if (self->_shapes.__table_.__p2_.__value_)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::__deallocate_node((id *)self->_shapes.__table_.__p1_.__value_.__next_);
    self->_shapes.__table_.__p1_.__value_.__next_ = 0;
    value = self->_shapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (i = 0; i != value; ++i)
        self->_shapes.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
    }
    self->_shapes.__table_.__p2_.__value_ = 0;
  }
  os_unfair_lock_unlock(&p_shapesMutex->m_lock);
}

- (void)addPhaseShapeToCache:(id)a3 meshID:(unint64_t)a4 mesh:(id)a5
{
  unint64_t v5;
  id v9;
  re *v10;
  uint64_t *v11;
  re *v12;
  id v13;
  re *v14;
  unordered_map<unsigned long long, PhaseShapeAndMesh, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, PhaseShapeAndMesh>>> *p_shapes;
  unint64_t value;
  uint8x8_t v17;
  _QWORD **v18;
  _QWORD *i;
  unint64_t v20;
  float v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  size_t v26;
  void **v27;
  void **v28;
  unint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (re *)a5;
  v11 = re::audioLogObjects(v10);
  v12 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v11);
  if ((_DWORD)v12)
  {
    v32 = *re::audioLogObjects(v12);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v9;
      v35 = 2048;
      v36 = a4;
      _os_log_debug_impl(&dword_224FE9000, v32, OS_LOG_TYPE_DEBUG, "REPHASEContext:addPhaseShapeToCache: adding PHASEShape(%@) with meshID(%llu) to cache", buf, 0x16u);
    }
  }
  os_unfair_lock_lock(&self->_shapesMutex.m_lock);
  v13 = v9;
  v14 = v10;
  p_shapes = &self->_shapes;
  value = self->_shapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v17 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] > 1uLL)
    {
      v5 = a4;
      if (value <= a4)
        v5 = a4 % value;
    }
    else
    {
      v5 = (value - 1) & a4;
    }
    v18 = (_QWORD **)p_shapes->__table_.__bucket_list_.__ptr_.__value_[v5];
    if (v18)
    {
      for (i = *v18; i; i = (_QWORD *)*i)
      {
        v20 = i[1];
        if (v20 == a4)
        {
          if (i[2] == a4)
            goto LABEL_41;
        }
        else
        {
          if (v17.u32[0] > 1uLL)
          {
            if (v20 >= value)
              v20 %= value;
          }
          else
          {
            v20 &= value - 1;
          }
          if (v20 != v5)
            break;
        }
      }
    }
  }
  i = operator new(0x28uLL);
  *i = 0;
  i[1] = a4;
  i[3] = 0;
  i[4] = 0;
  i[2] = a4;
  v21 = (float)(self->_shapes.__table_.__p2_.__value_ + 1);
  v22 = self->_shapes.__table_.__p3_.__value_;
  if (!value || (float)(v22 * (float)value) < v21)
  {
    v23 = 1;
    if (value >= 3)
      v23 = (value & (value - 1)) != 0;
    v24 = v23 | (2 * value);
    v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25)
      v26 = v25;
    else
      v26 = v24;
    std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::__rehash<true>((uint64_t)&self->_shapes, v26);
    value = self->_shapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if ((value & (value - 1)) != 0)
    {
      if (value <= a4)
        v5 = a4 % value;
      else
        v5 = a4;
    }
    else
    {
      v5 = (value - 1) & a4;
    }
  }
  v27 = p_shapes->__table_.__bucket_list_.__ptr_.__value_;
  v28 = (void **)p_shapes->__table_.__bucket_list_.__ptr_.__value_[v5];
  if (v28)
  {
    *i = *v28;
LABEL_39:
    *v28 = i;
    goto LABEL_40;
  }
  *i = self->_shapes.__table_.__p1_.__value_.__next_;
  self->_shapes.__table_.__p1_.__value_.__next_ = i;
  v27[v5] = &self->_shapes.__table_.__p1_;
  if (*i)
  {
    v29 = *(_QWORD *)(*i + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v29 >= value)
        v29 %= value;
    }
    else
    {
      v29 &= value - 1;
    }
    v28 = &p_shapes->__table_.__bucket_list_.__ptr_.__value_[v29];
    goto LABEL_39;
  }
LABEL_40:
  ++self->_shapes.__table_.__p2_.__value_;
LABEL_41:
  v30 = (void *)i[3];
  i[3] = v13;

  v31 = (void *)i[4];
  i[4] = v14;

  os_unfair_lock_unlock(&self->_shapesMutex.m_lock);
}

- (id)getPhaseShapeFromCacheWithMeshID:(unint64_t)a3
{
  UnfairLock *p_shapesMutex;
  _QWORD *v6;
  id v7;

  p_shapesMutex = &self->_shapesMutex;
  os_unfair_lock_lock(&self->_shapesMutex.m_lock);
  v6 = std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_shapes.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v6)
    v7 = (id)v6[3];
  else
    v7 = 0;
  os_unfair_lock_unlock(&p_shapesMutex->m_lock);
  return v7;
}

- (void)removePhaseShapeFromCacheWithMeshID:(unint64_t)a3
{
  UnfairLock *p_shapesMutex;
  unordered_map<unsigned long long, PhaseShapeAndMesh, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, PhaseShapeAndMesh>>> *p_shapes;
  re *v7;
  uint64_t *v8;
  re *v9;
  unint64_t value;
  objc_class *v11;
  unint64_t v12;
  uint8x8_t v13;
  re *v14;
  NSObject *v15;
  REPHASEContext *isa;
  REPHASEContext *v17;
  unint64_t engine;
  unint64_t v19;
  unint64_t v20;
  NSObject *v21;
  unint64_t v22;
  int v23;
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  p_shapesMutex = &self->_shapesMutex;
  os_unfair_lock_lock(&self->_shapesMutex.m_lock);
  p_shapes = &self->_shapes;
  v7 = (re *)std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_shapes.__table_.__bucket_list_.__ptr_.__value_, a3);
  v8 = re::audioLogObjects(v7);
  if (v7)
  {
    v9 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v8);
    if ((_DWORD)v9)
    {
      v21 = *re::audioLogObjects(v9);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = *((_QWORD *)v7 + 3);
        v23 = 138412546;
        v24 = v22;
        v25 = 2048;
        v26 = a3;
        _os_log_debug_impl(&dword_224FE9000, v21, OS_LOG_TYPE_DEBUG, "REPHASEContext:removePhaseShapeFromCache: removing PHASEShape(%@) with meshID(%llu) from cache", (uint8_t *)&v23, 0x16u);
      }
    }
    value = self->_shapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    v11 = *(objc_class **)v7;
    v12 = *((_QWORD *)v7 + 1);
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      if (v12 >= value)
        v12 %= value;
    }
    else
    {
      v12 &= value - 1;
    }
    isa = (REPHASEContext *)p_shapes->__table_.__bucket_list_.__ptr_.__value_[v12];
    do
    {
      v17 = isa;
      isa = (REPHASEContext *)isa->super.isa;
    }
    while (isa != (REPHASEContext *)v7);
    if (v17 == (REPHASEContext *)&self->_shapes.__table_.__p1_)
      goto LABEL_23;
    engine = (unint64_t)v17->_engine;
    if (v13.u32[0] > 1uLL)
    {
      if (engine >= value)
        engine %= value;
    }
    else
    {
      engine &= value - 1;
    }
    if (engine != v12)
    {
LABEL_23:
      if (v11)
      {
        v19 = *((_QWORD *)v11 + 1);
        if (v13.u32[0] > 1uLL)
        {
          v20 = *((_QWORD *)v11 + 1);
          if (v19 >= value)
            v20 = v19 % value;
        }
        else
        {
          v20 = v19 & (value - 1);
        }
        if (v20 == v12)
          goto LABEL_27;
      }
      p_shapes->__table_.__bucket_list_.__ptr_.__value_[v12] = 0;
      v11 = *(objc_class **)v7;
    }
    if (!v11)
    {
LABEL_33:
      v17->super.isa = v11;
      *(_QWORD *)v7 = 0;
      --self->_shapes.__table_.__p2_.__value_;
      std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,void *>>>::operator()[abi:ne180100](1, (id *)v7);
      goto LABEL_34;
    }
    v19 = *((_QWORD *)v11 + 1);
LABEL_27:
    if (v13.u32[0] > 1uLL)
    {
      if (v19 >= value)
        v19 %= value;
    }
    else
    {
      v19 &= value - 1;
    }
    if (v19 != v12)
    {
      p_shapes->__table_.__bucket_list_.__ptr_.__value_[v19] = v17;
      v11 = *(objc_class **)v7;
    }
    goto LABEL_33;
  }
  v14 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v8);
  if ((_DWORD)v14)
  {
    v15 = *re::audioLogObjects(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v23 = 134217984;
      v24 = a3;
      _os_log_debug_impl(&dword_224FE9000, v15, OS_LOG_TYPE_DEBUG, "REPHASEContext:removePhaseShapeFromCache: warning: meshID(%llu) not found in cache", (uint8_t *)&v23, 0xCu);
    }
  }
LABEL_34:
  os_unfair_lock_unlock(&p_shapesMutex->m_lock);
}

- (unint64_t)phaseShapeCount
{
  UnfairLock *p_shapesMutex;
  unint64_t value;

  p_shapesMutex = &self->_shapesMutex;
  os_unfair_lock_lock(&self->_shapesMutex.m_lock);
  value = self->_shapes.__table_.__p2_.__value_;
  os_unfair_lock_unlock(&p_shapesMutex->m_lock);
  return value;
}

- (unordered_map<unsigned)copyPhaseShapeCache
{
  unint64_t v3;
  UnfairLock *p_shapesMutex;
  void *next;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, PhaseShapeAndMesh>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, PhaseShapeAndMesh>, void *>>> *p_p1;
  unint64_t v9;
  unint64_t value;
  uint8x8_t v11;
  _QWORD *v12;
  _QWORD *i;
  unint64_t v14;
  _QWORD *v15;
  void *v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  void **v23;
  void **v24;
  unint64_t v25;
  unordered_map<unsigned long long, PhaseShapeAndMesh, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, PhaseShapeAndMesh>>> *result;

  p_shapesMutex = &self->_shapesMutex;
  os_unfair_lock_lock(&self->_shapesMutex.m_lock);
  retstr->__table_.__bucket_list_ = 0u;
  *(_OWORD *)&retstr->__table_.__p1_.__value_.__next_ = 0u;
  retstr->__table_.__p3_.__value_ = self->_shapes.__table_.__p3_.__value_;
  std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::__rehash<true>((uint64_t)retstr, self->_shapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_);
  next = self->_shapes.__table_.__p1_.__value_.__next_;
  if (next)
  {
    p_p1 = &retstr->__table_.__p1_;
    do
    {
      v9 = *((_QWORD *)next + 2);
      value = retstr->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (value)
      {
        v11 = (uint8x8_t)vcnt_s8((int8x8_t)value);
        v11.i16[0] = vaddlv_u8(v11);
        if (v11.u32[0] > 1uLL)
        {
          v3 = *((_QWORD *)next + 2);
          if (value <= v9)
            v3 = v9 % value;
        }
        else
        {
          v3 = (value - 1) & v9;
        }
        v12 = retstr->__table_.__bucket_list_.__ptr_.__value_[v3];
        if (v12)
        {
          for (i = (_QWORD *)*v12; i; i = (_QWORD *)*i)
          {
            v14 = i[1];
            if (v14 == v9)
            {
              if (i[2] == v9)
                goto LABEL_41;
            }
            else
            {
              if (v11.u32[0] > 1uLL)
              {
                if (v14 >= value)
                  v14 %= value;
              }
              else
              {
                v14 &= value - 1;
              }
              if (v14 != v3)
                break;
            }
          }
        }
      }
      v15 = operator new(0x28uLL);
      *v15 = 0;
      v15[1] = v9;
      v16 = (void *)*((_QWORD *)next + 3);
      v15[2] = *((_QWORD *)next + 2);
      v15[3] = v16;
      v15[4] = *((id *)next + 4);
      v17 = (float)(retstr->__table_.__p2_.__value_ + 1);
      v18 = retstr->__table_.__p3_.__value_;
      if (!value || (float)(v18 * (float)value) < v17)
      {
        v19 = (value & (value - 1)) != 0;
        if (value < 3)
          v19 = 1;
        v20 = v19 | (2 * value);
        v21 = vcvtps_u32_f32(v17 / v18);
        if (v20 <= v21)
          v22 = v21;
        else
          v22 = v20;
        std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::__rehash<true>((uint64_t)retstr, v22);
        value = retstr->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
        if ((value & (value - 1)) != 0)
        {
          if (value <= v9)
            v3 = v9 % value;
          else
            v3 = v9;
        }
        else
        {
          v3 = (value - 1) & v9;
        }
      }
      v23 = retstr->__table_.__bucket_list_.__ptr_.__value_;
      v24 = (void **)retstr->__table_.__bucket_list_.__ptr_.__value_[v3];
      if (v24)
      {
        *v15 = *v24;
      }
      else
      {
        *v15 = p_p1->__value_.__next_;
        p_p1->__value_.__next_ = v15;
        v23[v3] = p_p1;
        if (!*v15)
          goto LABEL_40;
        v25 = *(_QWORD *)(*v15 + 8);
        if ((value & (value - 1)) != 0)
        {
          if (v25 >= value)
            v25 %= value;
        }
        else
        {
          v25 &= value - 1;
        }
        v24 = &retstr->__table_.__bucket_list_.__ptr_.__value_[v25];
      }
      *v24 = v15;
LABEL_40:
      ++retstr->__table_.__p2_.__value_;
LABEL_41:
      next = *(void **)next;
    }
    while (next);
  }
  os_unfair_lock_unlock(&p_shapesMutex->m_lock);
  return result;
}

- (void)removeOccluderFromScene:(unint64_t)a3 entity:(unint64_t)a4
{
  re *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  re *v10;
  void *v11;
  void *v12;
  re *v13;
  uint64_t *v14;
  re *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  re *v30;
  std::__shared_weak_count *v31;
  uint8_t buf[4];
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[REPHASEContext sceneForID:](self, "sceneForID:");
  if (v30)
  {
    re::audio::REPHASEAudioScene::getEntity((os_unfair_lock_s *)v30, a4, &v28);
    v7 = v28;
    if (v28)
    {
      v8 = *(_QWORD *)(v28 + 24);
      v9 = re::audioLogObjects(v6);
      if (v8)
      {
        v10 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v9);
        if ((_DWORD)v10)
        {
          v25 = *re::audioLogObjects(v10);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            v26 = *(_QWORD *)(v7 + 32);
            *(_DWORD *)buf = 134218498;
            v33 = a3;
            v34 = 2048;
            v35 = a4;
            v36 = 2112;
            v37 = v26;
            _os_log_debug_impl(&dword_224FE9000, v25, OS_LOG_TYPE_DEBUG, "removeOccluderFromScene: sceneID=%llu entityID=%llu entityName='%@'", buf, 0x20u);
          }
        }
        objc_msgSend(*(id *)(v7 + 24), "parent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeChild:", *(_QWORD *)(v7 + 24));
        v12 = *(void **)(v7 + 24);
        *(_QWORD *)(v7 + 24) = 0;

        if (!*(_QWORD *)(v7 + 16))
        {
          v14 = re::audioLogObjects(v13);
          v15 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v14);
          if ((_DWORD)v15)
          {
            v27 = *re::audioLogObjects(v15);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              v33 = a4;
              _os_log_debug_impl(&dword_224FE9000, v27, OS_LOG_TYPE_DEBUG, "removeOccluderFromScene: removing entity(%llu) from REAudioScene", buf, 0xCu);
            }
          }
          re::audio::REPHASEAudioScene::removeEntity((os_unfair_lock_s *)v30, a4);
        }

        goto LABEL_9;
      }
      v23 = *v9;
      if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v33 = a3;
        v34 = 2048;
        v35 = a4;
        v24 = "removeOccluderFromScene: occluder not found for sceneID=%llu entityID=%llu";
        goto LABEL_26;
      }
    }
    else
    {
      v23 = *re::audioLogObjects(v6);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v33 = a3;
        v34 = 2048;
        v35 = a4;
        v24 = "removeOccluderFromScene: entity not found for sceneID=%llu entityID=%llu";
LABEL_26:
        _os_log_error_impl(&dword_224FE9000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x16u);
      }
    }
LABEL_9:
    v16 = v29;
    if (v29)
    {
      p_shared_owners = (unint64_t *)&v29->__shared_owners_;
      do
        v18 = __ldaxr(p_shared_owners);
      while (__stlxr(v18 - 1, p_shared_owners));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    goto LABEL_14;
  }
  v22 = *re::audioLogObjects(0);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    v33 = a3;
    v34 = 2048;
    v35 = a4;
    _os_log_error_impl(&dword_224FE9000, v22, OS_LOG_TYPE_ERROR, "removeOccluderFromScene: scene not found for sceneID=%llu entityID=%llu", buf, 0x16u);
  }
LABEL_14:
  v19 = v31;
  if (v31)
  {
    v20 = (unint64_t *)&v31->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
}

- (void)applyMeshRemoval:(const void *)a3
{
  -[REPHASEContext removePhaseShapeFromCacheWithMeshID:](self, "removePhaseShapeFromCacheWithMeshID:", *((_QWORD *)a3 + 2));
  -[REPHASEContext removeOccluderFromScene:entity:](self, "removeOccluderFromScene:entity:", *(_QWORD *)a3, *((_QWORD *)a3 + 1));
}

- (void)applyMeshRemovals:(const void *)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v3 = *((_QWORD *)a3 + 2);
  if (v3)
  {
    v5 = *((_QWORD *)a3 + 4);
    v6 = 40 * v3;
    do
    {
      -[REPHASEContext applyMeshRemoval:](self, "applyMeshRemoval:", v5);
      v5 += 40;
      v6 -= 40;
    }
    while (v6);
  }
}

- (void)addOccluder:(id)a3 toScene:(unint64_t)a4 entity:(unint64_t)a5
{
  re *v9;
  re *v10;
  re *v11;
  void *v12;
  re *v13;
  re *v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  re *v28;
  std::__shared_weak_count *v29;
  uint8_t buf[4];
  unint64_t v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = (re *)a3;
  v10 = v9;
  if (a4 == -1 || !a5)
  {
    v21 = *re::audioLogObjects(v9);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v31 = a5;
      v32 = 2048;
      v33 = a4;
      _os_log_error_impl(&dword_224FE9000, v21, OS_LOG_TYPE_ERROR, "REPhaseContext:addOccluder Can't add occluder to invalid entity(%llu)/scene(%llu)", buf, 0x16u);
    }
  }
  else
  {
    -[REPHASEContext sceneForID:](self, "sceneForID:", a4);
    if (v28)
    {
      re::audio::REPHASEAudioScene::getOrCreateEntity((os_unfair_lock_s *)v28, a5, &v26);
      if (v26)
      {
        -[PHASEEngine rootObject](self->_engine, "rootObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v26 + 24), a3);
        v25 = 0;
        objc_msgSend(v12, "addChild:error:", v10, &v25);
        v13 = (re *)v25;
        v14 = v13;
        if (v13)
        {
          v24 = *re::audioLogObjects(v13);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            v31 = a5;
            v32 = 2112;
            v33 = (unint64_t)v14;
            _os_log_error_impl(&dword_224FE9000, v24, OS_LOG_TYPE_ERROR, "REPhaseContext:addOccluder Could not add PHASEOccluder for entity %llu. Error %@", buf, 0x16u);
          }
        }

      }
      else
      {
        v23 = *re::audioLogObjects(v11);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v31 = a4;
          v32 = 2048;
          v33 = a5;
          _os_log_error_impl(&dword_224FE9000, v23, OS_LOG_TYPE_ERROR, "REPhaseContext:addOccluder failed to find or create REPHASEEntity for sceneID(%llu) entityID(%llu)", buf, 0x16u);
        }
      }
      v15 = v27;
      if (v27)
      {
        p_shared_owners = (unint64_t *)&v27->__shared_owners_;
        do
          v17 = __ldaxr(p_shared_owners);
        while (__stlxr(v17 - 1, p_shared_owners));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
    }
    else
    {
      v22 = *re::audioLogObjects(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v31 = a4;
        _os_log_error_impl(&dword_224FE9000, v22, OS_LOG_TYPE_ERROR, "REPhaseContext:addOccluder failed to find REPHASEAudioScene for sceneID(%llu)", buf, 0xCu);
      }
    }
    v18 = v29;
    if (v29)
    {
      v19 = (unint64_t *)&v29->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }

}

- (void)addOccluder:(const void *)a3
{
  -[REPHASEContext addOccluder:toScene:entity:](self, "addOccluder:toScene:entity:", *((_QWORD *)a3 + 3), *(_QWORD *)a3, *((_QWORD *)a3 + 1));
}

- (void)applyOccluderAdditions:(const void *)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v3 = *((_QWORD *)a3 + 2);
  if (v3)
  {
    v5 = *((_QWORD *)a3 + 4);
    v6 = 48 * v3;
    do
    {
      -[REPHASEContext addOccluder:](self, "addOccluder:", v5);
      v5 += 48;
      v6 -= 48;
    }
    while (v6);
  }
}

- (void)updateOccluder:(const void *)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v14 = *(_OWORD *)a3;
  v5 = *((_QWORD *)a3 + 5);
  v15 = *((_QWORD *)a3 + 2);
  v16 = v5;
  v17 = *((_BYTE *)a3 + 48);
  -[REPHASEContext applyMeshRemoval:](self, "applyMeshRemoval:", &v14);
  v9 = *(_OWORD *)a3;
  v6 = (void *)*((_QWORD *)a3 + 4);
  v10 = *((_QWORD *)a3 + 3);
  v7 = v6;
  v8 = *((_QWORD *)a3 + 5);
  v11 = v7;
  v12 = v8;
  v13 = *((_BYTE *)a3 + 48);
  -[REPHASEContext addOccluder:](self, "addOccluder:", &v9);

}

- (void)applyOccluderUpdates:(const void *)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v3 = *((_QWORD *)a3 + 2);
  if (v3)
  {
    v5 = *((_QWORD *)a3 + 4);
    v6 = 56 * v3;
    do
    {
      -[REPHASEContext updateOccluder:](self, "updateOccluder:", v5);
      v5 += 56;
      v6 -= 56;
    }
    while (v6);
  }
}

- (void)applyMeshEvents:(const void *)a3
{
  uint64_t i;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  REPHASEContext *v16;
  _QWORD v17[3];
  _QWORD *v18;

  v16 = self;
  v14 = *((_QWORD *)a3 + 2);
  if (v14)
  {
    for (i = 0; i != v14; ++i)
    {
      v4 = (unint64_t)(*((_QWORD *)a3 + 3) + i) % *((_QWORD *)a3 + 1);
      v5 = *((_QWORD *)a3 + 5);
      v6 = *(_QWORD *)(v5 + 48 * v4 + 16);
      if (v6)
      {
        v7 = 0;
        v8 = (_QWORD *)(v5 + 48 * v4);
        v9 = v8 + 3;
        v10 = v8 + 1;
        v11 = v8 + 5;
        do
        {
          v12 = *v11 + 48 * ((unint64_t)(v7 + *v9) % *v10);
          v17[0] = &v16;
          v17[1] = &v16;
          v17[2] = &v16;
          v13 = *(unsigned int *)(v12 + 40);
          if ((_DWORD)v13 == -1)
            std::__throw_bad_variant_access[abi:ne180100]();
          v18 = v17;
          ((void (*)(_QWORD **))off_24ED3D238[v13])(&v18);
          ++v7;
        }
        while (v6 != v7);
      }
    }
  }
}

- (id)createAcousticMaterialsArrayWithAbsorption:(DynamicArray<re:(DynamicArray<re:(DynamicArray<re::AcousticSoundReductionMaterial> *)a5 :AcousticScatteringMaterial> *)a4 :AcousticAbsorptionMaterial> *)a3 scattering:soundReduction:
{
  void *v9;
  void *v10;
  _BYTE v12[16];

  re::internal::AriadneSignpostScopeGuard::AriadneSignpostScopeGuard((re::internal::AriadneSignpostScopeGuard *)v12, 2532, (uint64_t)self);
  -[REPHASEContext engine](self, "engine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  re::REPHASEMaterialCache::getMaterials((re::REPHASEMaterialCache *)&self->_phaseMaterialCache, v9, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  re::internal::AriadneSignpostScopeGuard::~AriadneSignpostScopeGuard((re::internal::AriadneSignpostScopeGuard *)v12);
  return v10;
}

- (id)createPhaseShapeWithMeshID:(unint64_t)a3 materials:(id)a4 mdlMesh:(id)a5 arkitMesh:(BOOL)a6 meshType:(unsigned __int8)a7
{
  int v7;
  _BOOL4 v8;
  id v12;
  id v13;
  re *v14;
  uint64_t *v15;
  re *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  re *v20;
  uint64_t *v21;
  re *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  re *v29;
  __int128 v30;
  __int128 v31;
  uint64_t *v32;
  re *v33;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[16];
  uint8_t buf[4];
  unint64_t v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  _QWORD v56[2];
  _QWORD v57[3];

  v7 = a7;
  v8 = a6;
  v57[2] = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = re::internal::AriadneSignpostScopeGuard::AriadneSignpostScopeGuard((re::internal::AriadneSignpostScopeGuard *)v41, 2530, (uint64_t)self);
  if (v7 || !v8)
  {
    v17 = 0;
    v18 = 7;
    if (v7 == 1 && v8)
    {
      v19 = re::audioLogObjects(v14);
      v20 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v19);
      if ((_DWORD)v20)
      {
        v37 = *re::audioLogObjects(v20);
        v20 = (re *)os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v20)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_224FE9000, v37, OS_LOG_TYPE_DEFAULT, "[AudioManager_PHASE_Async::CreatePhaseShape] PRRMesh being used", buf, 2u);
        }
      }
      if (self->_directpathEnabled)
      {
        v17 = 1;
        v18 = 7;
      }
      else
      {
        v21 = re::audioLogObjects(v20);
        v22 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v21);
        if ((_DWORD)v22)
        {
          v38 = *re::audioLogObjects(v22);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_224FE9000, v38, OS_LOG_TYPE_DEFAULT, "[AudioManager_PHASE_Async::CreatePhaseShape] Removing PHASESpatialPipelineFlagDirectPathTransmission", buf, 2u);
          }
        }
        v17 = 1;
        v18 = 6;
      }
    }
  }
  else
  {
    v15 = re::audioLogObjects(v14);
    v16 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v15);
    if ((_DWORD)v16)
    {
      v36 = *re::audioLogObjects(v16);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224FE9000, v36, OS_LOG_TYPE_DEFAULT, "[AudioManager_PHASE_Async::CreatePhaseShape] MeshChunks being used", buf, 2u);
      }
      v18 = 1;
      v17 = 1;
    }
    else
    {
      v17 = 1;
      v18 = 1;
    }
  }
  v56[0] = CFSTR("PHASEShapeCategoriesKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = CFSTR("PHASEShapeIsRealKey");
  v57[0] = v23;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc(MEMORY[0x24BDE32C0]);
  -[REPHASEContext engine](self, "engine");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithEngine:mesh:materials:options:", v27, v13, v12, v25);

  v29 = (re *)objc_msgSend(v13, "boundingBox");
  v39 = v31;
  v40 = v30;
  v32 = re::audioLogObjects(v29);
  v33 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v32);
  if ((_DWORD)v33)
  {
    v35 = *re::audioLogObjects(v33);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219520;
      v43 = a3;
      v44 = 2048;
      v45 = *(float *)&v39;
      v46 = 2048;
      v47 = *((float *)&v39 + 1);
      v48 = 2048;
      v49 = *((float *)&v39 + 2);
      v50 = 2048;
      v51 = *(float *)&v40;
      v52 = 2048;
      v53 = *((float *)&v40 + 1);
      v54 = 2048;
      v55 = *((float *)&v40 + 2);
      _os_log_impl(&dword_224FE9000, v35, OS_LOG_TYPE_DEFAULT, "REPHASEContext:createPhaseShapeWithMeshID: created shape with id %llu, bounding box = [% 4.3f,% 4.3f,% 4.3f|% 4.3f,% 4.3f,% 4.3f]", buf, 0x48u);
    }
  }

  re::internal::AriadneSignpostScopeGuard::~AriadneSignpostScopeGuard((re::internal::AriadneSignpostScopeGuard *)v41);
  return v28;
}

- (id)createPHASEShape:(const void *)a3
{
  uint64_t v3;
  id v4;
  id v6;
  REPHASEContext *v7;
  _QWORD v8[4];
  _QWORD *v9;

  v6 = 0;
  v7 = self;
  v8[0] = &v7;
  v8[1] = &v6;
  v8[2] = &v6;
  v8[3] = &v7;
  v3 = *((unsigned int *)a3 + 38);
  if ((_DWORD)v3 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v9 = v8;
  ((void (*)(_QWORD **, const void *))off_24ED3D250[v3])(&v9, a3);
  v4 = v6;

  return v4;
}

- (id)createPHASEShapeAndOccluder:(const void *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  PHASEEngine *engine;
  void *v12;
  void *v13;
  re *v14;
  uint64_t *v15;
  re *v16;
  NSObject *v17;
  uint64_t v18;
  char v20;
  _BYTE buf[12];
  __int16 v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  -[REPHASEContext createPHASEShape:](self, "createPHASEShape:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = re::audio::meshID<std::variant<re::audio::AcousticMeshData,re::audio::AcousticARKitMeshData>>((uint64_t)a3);
    v7 = *((unsigned int *)a3 + 38);
    if ((_DWORD)v7 == -1)
      std::__throw_bad_variant_access[abi:ne180100]();
    v8 = v6;
    *(_QWORD *)buf = &v20;
    ((void (*)(_BYTE *, const void *))off_24ED3D270[v7])(buf, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[REPHASEContext addPhaseShapeToCache:meshID:mesh:](self, "addPhaseShapeToCache:meshID:mesh:", v5, v8, v9);

    re::audio::meshID<std::variant<re::audio::AcousticMeshData,re::audio::AcousticARKitMeshData>>((uint64_t)a3);
    re::audio::meshType<std::variant<re::audio::AcousticMeshData,re::audio::AcousticARKitMeshData>>((uint64_t)a3);
    re::audio::meshType<std::variant<re::audio::AcousticMeshData,re::audio::AcousticARKitMeshData>>((uint64_t)a3);
    re::internal::AriadneSignpostScopeGuard::AriadneSignpostScopeGuard((re::internal::AriadneSignpostScopeGuard *)buf, 2543, (uint64_t)self);
    v10 = objc_alloc(MEMORY[0x24BDE32A0]);
    engine = self->_engine;
    v24[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithEngine:shapes:", engine, v12);

    re::internal::AriadneSignpostScopeGuard::~AriadneSignpostScopeGuard((re::internal::AriadneSignpostScopeGuard *)buf);
    v15 = re::audioLogObjects(v14);
    v16 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v15);
    if ((_DWORD)v16)
    {
      v17 = (id)*re::audioLogObjects(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = re::audio::entityID<std::variant<re::audio::AcousticMeshData,re::audio::AcousticARKitMeshData>>((uint64_t)a3);
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v18;
        v22 = 2112;
        v23 = v13;
        _os_log_impl(&dword_224FE9000, v17, OS_LOG_TYPE_DEFAULT, "REPHASEContext:createPHASEShapeAndOccluder entityId=%llu created PHASEOccluder: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (PHASEOccluderData)createPHASEOccluderData:(SEL)a3
{
  uint64_t v5;
  uint64_t v8;
  BOOL v9;
  PHASEOccluderData *result;
  double v11;
  _BOOL8 v12;
  _QWORD v13[2];
  _QWORD *v14;

  retstr->var3 = 0;
  retstr->var4.var0.__null_state_ = 0;
  retstr->var4.__engaged_ = 0;
  v5 = *((unsigned int *)a4 + 38);
  if ((_DWORD)v5 == -1)
    goto LABEL_4;
  v13[0] = &v11;
  retstr->var0 = ((uint64_t (*)(_QWORD *, const void *))off_24ED3D290[v5])(v13, a4);
  retstr->var1 = re::audio::entityID<std::variant<re::audio::AcousticMeshData,re::audio::AcousticARKitMeshData>>((uint64_t)a4);
  retstr->var2 = re::audio::meshID<std::variant<re::audio::AcousticMeshData,re::audio::AcousticARKitMeshData>>((uint64_t)a4);
  LOBYTE(v11) = 0;
  LOBYTE(v12) = 0;
  v13[0] = &v11;
  v13[1] = &v11;
  v8 = *((unsigned int *)a4 + 38);
  if ((_DWORD)v8 == -1)
LABEL_4:
    std::__throw_bad_variant_access[abi:ne180100]();
  v14 = v13;
  ((void (*)(_QWORD **, const void *))off_24ED3D2A0[v8])(&v14, a4);
  v9 = v12;
  retstr->var4.var0.__val_ = v11;
  retstr->var4.__engaged_ = v9;
  -[REPHASEContext createPHASEShapeAndOccluder:](self, "createPHASEShapeAndOccluder:", a4);
  result = (PHASEOccluderData *)objc_claimAutoreleasedReturnValue();
  retstr->var3 = result;
  return result;
}

- (DynamicArray<re::audio::PHASEOccluderData>)createPHASEOccluders:(SEL)a3
{
  uint64_t v5;
  DynamicArray<re::audio::PHASEOccluderData> *v6;
  uint64_t v7;
  uint64_t v8;
  _anonymous_namespace_ *v9;
  unint64_t var1;
  unint64_t var2;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  PHASEOccluderData *v15;
  __int128 v16;
  id v17;
  __int128 v18;
  unint64_t v19;
  id v20;
  optional<double> v21;

  retstr->var4 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var0 = 0;
  retstr->var3 = 0;
  v5 = *((_QWORD *)a4 + 2);
  if (v5)
  {
    v6 = self;
    v7 = *((_QWORD *)a4 + 4);
    v8 = 160 * v5;
    do
    {
      v9 = (_anonymous_namespace_ *)unk_255851C78(v6, "createPHASEOccluderData:", v7);
      var1 = retstr->var1;
      var2 = retstr->var2;
      if (var2 >= var1)
      {
        v12 = var2 + 1;
        if (var1 < var2 + 1)
        {
          if (retstr->var0)
          {
            if (var1)
              v13 = 2 * var1;
            else
              v13 = 8;
            if (v13 <= v12)
              v14 = var2 + 1;
            else
              v14 = v13;
            re::DynamicArray<re::audio::PHASEOccluderData>::setCapacity(retstr, v14);
          }
          else
          {
            re::DynamicArray<re::audio::PHASEOccluderData>::setCapacity(retstr, v12);
            ++retstr->var3;
          }
        }
        var2 = retstr->var2;
      }
      v15 = &retstr->var4[var2];
      v16 = v18;
      v15->var2 = v19;
      *(_OWORD *)&v15->var0 = v16;
      v17 = v20;
      v20 = 0;
      v15->var3 = v17;
      v15->var4 = v21;
      ++retstr->var2;
      ++retstr->var3;

      v7 += 160;
      v8 -= 160;
    }
    while (v8);
  }
  return self;
}

- (PHASEOccluderUpdateData)createPHASEOccluderUpdateData:(SEL)a3
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  _OWORD v14[10];
  double v15;
  _BOOL8 v16;
  _OWORD *v17;

  retstr->var4 = 0;
  retstr->var5.var0.__null_state_ = 0;
  retstr->var5.__engaged_ = 0;
  v5 = *((unsigned int *)a4 + 40);
  if ((_DWORD)v5 == -1)
    goto LABEL_7;
  *(_QWORD *)&v14[0] = &v15;
  retstr->var0 = ((uint64_t (*)(_OWORD *, const void *))off_24ED3D2B0[v5])(v14, a4);
  v8 = *((unsigned int *)a4 + 40);
  if ((_DWORD)v8 == -1)
    goto LABEL_7;
  *(_QWORD *)&v14[0] = &v15;
  retstr->var1 = ((uint64_t (*)(_OWORD *, const void *))off_24ED3D2C0[v8])(v14, a4);
  v9 = *((unsigned int *)a4 + 40);
  if ((_DWORD)v9 == -1)
    goto LABEL_7;
  *(_QWORD *)&v14[0] = &v15;
  retstr->var2 = ((uint64_t (*)(_OWORD *, const void *))off_24ED3D2D0[v9])(v14, a4);
  v10 = *((unsigned int *)a4 + 40);
  if ((_DWORD)v10 == -1
    || (*(_QWORD *)&v14[0] = &v15,
        retstr->var3 = ((uint64_t (*)(_OWORD *, const void *))off_24ED3D2E0[v10])(v14, a4),
        LOBYTE(v15) = 0,
        LOBYTE(v16) = 0,
        *(_QWORD *)&v14[0] = &v15,
        *((_QWORD *)&v14[0] + 1) = &v15,
        v11 = *((unsigned int *)a4 + 40),
        (_DWORD)v11 == -1))
  {
LABEL_7:
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  v17 = v14;
  ((void (*)(_OWORD **, const void *))off_24ED3D2F0[v11])(&v17, a4);
  v12 = v16;
  retstr->var5.var0.__val_ = v15;
  retstr->var5.__engaged_ = v12;
  re::audio::convertToAcousticMeshAddition((uint64_t)a4, v14);
  -[REPHASEContext createPHASEShapeAndOccluder:](self, "createPHASEShapeAndOccluder:", v14);
  retstr->var4 = (id)objc_claimAutoreleasedReturnValue();
  return (PHASEOccluderUpdateData *)std::__variant_detail::__dtor<std::__variant_detail::__traits<re::audio::AcousticMeshData,re::audio::AcousticARKitMeshData>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v14);
}

- (DynamicArray<re::audio::PHASEOccluderUpdateData>)updatePHASEOccluders:(SEL)a3
{
  uint64_t v5;
  DynamicArray<re::audio::PHASEOccluderUpdateData> *v6;
  uint64_t v7;
  uint64_t v8;
  _anonymous_namespace_ *v9;
  unint64_t var1;
  unint64_t var2;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  PHASEOccluderUpdateData *v15;
  __int128 v16;
  id v17;
  __int128 v18;
  __int128 v19;
  id v20;
  optional<double> v21;

  retstr->var4 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var0 = 0;
  retstr->var3 = 0;
  v5 = *((_QWORD *)a4 + 2);
  if (v5)
  {
    v6 = self;
    v7 = *((_QWORD *)a4 + 4);
    v8 = 168 * v5;
    do
    {
      v9 = (_anonymous_namespace_ *)unk_255851CA8(v6, "createPHASEOccluderUpdateData:", v7);
      var1 = retstr->var1;
      var2 = retstr->var2;
      if (var2 >= var1)
      {
        v12 = var2 + 1;
        if (var1 < var2 + 1)
        {
          if (retstr->var0)
          {
            if (var1)
              v13 = 2 * var1;
            else
              v13 = 8;
            if (v13 <= v12)
              v14 = var2 + 1;
            else
              v14 = v13;
            re::DynamicArray<re::audio::PHASEOccluderUpdateData>::setCapacity(retstr, v14);
          }
          else
          {
            re::DynamicArray<re::audio::PHASEOccluderUpdateData>::setCapacity(retstr, v12);
            ++retstr->var3;
          }
        }
        var2 = retstr->var2;
      }
      v15 = &retstr->var4[var2];
      v16 = v19;
      *(_OWORD *)&v15->var0 = v18;
      *(_OWORD *)&v15->var2 = v16;
      v17 = v20;
      v20 = 0;
      v15->var4 = v17;
      v15->var5 = v21;
      ++retstr->var2;
      ++retstr->var3;

      v7 += 168;
      v8 -= 168;
    }
    while (v8);
  }
  return self;
}

- (void)stopAllAndReset
{
  UnfairLock *p_soundEventsMutex;
  id *i;
  id v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t value;
  uint64_t j;
  _QWORD *next;
  _QWORD *v11;
  unint64_t v12;
  uint64_t k;
  unint64_t v14;
  uint64_t m;
  _QWORD *n;
  re::audio::REPHASEAudioScene *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t ii;
  uint64_t v24;
  std::__shared_weak_count *v25;

  atomic_store(1u, (unsigned __int8 *)&self->_stoppedAndDestroyed);
  p_soundEventsMutex = &self->_soundEventsMutex;
  os_unfair_lock_lock(&self->_soundEventsMutex.m_lock);
  for (i = (id *)self->_soundEvents.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
  {
    v5 = i[3];
    objc_msgSend(v5, "stopAndDestroy");
    objc_msgSend(v5, "prepareState");
    -[REPHASEContext decrementOrDestroyEntityWithZeroCount:](self, "decrementOrDestroyEntityWithZeroCount:", *(_QWORD *)(v24 + 40));
    if (v25)
    {
      p_shared_owners = (unint64_t *)&v25->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)())v25->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v25);
      }
    }

  }
  if (self->_soundEvents.__table_.__p2_.__value_)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,REPHASESoundEvent * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,REPHASESoundEvent * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,REPHASESoundEvent * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,REPHASESoundEvent * {__strong}>>>::__deallocate_node((id *)self->_soundEvents.__table_.__p1_.__value_.__next_);
    self->_soundEvents.__table_.__p1_.__value_.__next_ = 0;
    value = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (j = 0; j != value; ++j)
        self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_[j] = 0;
    }
    self->_soundEvents.__table_.__p2_.__value_ = 0;
  }
  os_unfair_lock_unlock(&p_soundEventsMutex->m_lock);
  os_unfair_lock_lock(&self->_soundEventsPreparingMutex.m_lock);
  if (self->_soundEventsPreparing.__table_.__p2_.__value_)
  {
    next = self->_soundEventsPreparing.__table_.__p1_.__value_.__next_;
    if (next)
    {
      do
      {
        v11 = (_QWORD *)*next;
        operator delete(next);
        next = v11;
      }
      while (v11);
    }
    self->_soundEventsPreparing.__table_.__p1_.__value_.__next_ = 0;
    v12 = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (v12)
    {
      for (k = 0; k != v12; ++k)
        self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_[k] = 0;
    }
    self->_soundEventsPreparing.__table_.__p2_.__value_ = 0;
  }
  os_unfair_lock_unlock(&self->_soundEventsPreparingMutex.m_lock);
  -[REPHASEContext clearPhaseShapeCache](self, "clearPhaseShapeCache");
  os_unfair_lock_lock(&self->_audioAssetsMutex.m_lock);
  if (self->_audioAssets.__table_.__p2_.__value_)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,REPHASESoundAsset>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,REPHASESoundAsset>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,REPHASESoundAsset>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,REPHASESoundAsset>>>::__deallocate_node((_QWORD *)self->_audioAssets.__table_.__p1_.__value_.__next_);
    self->_audioAssets.__table_.__p1_.__value_.__next_ = 0;
    v14 = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (v14)
    {
      for (m = 0; m != v14; ++m)
        self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_[m] = 0;
    }
    self->_audioAssets.__table_.__p2_.__value_ = 0;
  }
  os_unfair_lock_unlock(&self->_audioAssetsMutex.m_lock);
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  for (n = self->_scenes.__table_.__p1_.__value_.__next_; n; n = (_QWORD *)*n)
  {
    v17 = (re::audio::REPHASEAudioScene *)n[3];
    v18 = (std::__shared_weak_count *)n[4];
    if (v18)
    {
      v19 = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldxr(v19);
      while (__stxr(v20 + 1, v19));
      re::audio::REPHASEAudioScene::destroy(v17);
      do
        v21 = __ldaxr(v19);
      while (__stlxr(v21 - 1, v19));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    else
    {
      re::audio::REPHASEAudioScene::destroy(v17);
    }
  }
  if (self->_scenes.__table_.__p2_.__value_)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>>>::__deallocate_node((_QWORD *)self->_scenes.__table_.__p1_.__value_.__next_);
    self->_scenes.__table_.__p1_.__value_.__next_ = 0;
    v22 = self->_scenes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (v22)
    {
      for (ii = 0; ii != v22; ++ii)
        self->_scenes.__table_.__bucket_list_.__ptr_.__value_[ii] = 0;
    }
    self->_scenes.__table_.__p2_.__value_ = 0;
  }
  os_unfair_lock_unlock(&self->_scenesMutex.m_lock);
  -[PHASEEngine stop](self->_engine, "stop");
}

- (shared_ptr<re::audio::REPHASEAudioScene>)sceneForID:(unint64_t)a3
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  UnfairLock *p_scenesMutex;
  unint64_t value;
  uint8x8_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *i;
  unint64_t v14;
  unint64_t v15;
  uint8x8_t v16;
  _QWORD **v17;
  _QWORD *j;
  unint64_t v19;
  _QWORD *v20;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *>>> *p_p1;
  float v22;
  float v23;
  _BOOL8 v24;
  unint64_t v25;
  unint64_t v26;
  int8x8_t prime;
  void **v28;
  void **v29;
  uint64_t v30;
  _QWORD *next;
  unint64_t v32;
  uint8x8_t v33;
  unint64_t v34;
  uint8x8_t v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  void **v39;
  void **v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *p_shared_owners;
  unint64_t v48;
  uint64_t v49;
  unint64_t *v50;
  unint64_t v51;
  void **v52;
  _QWORD v53[2];
  char v54;
  shared_ptr<re::audio::REPHASEAudioScene> result;

  v5 = v3;
  if (a3 == -1)
  {
    *v3 = 0;
    v3[1] = 0;
    goto LABEL_115;
  }
  v6 = a3;
  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  value = self->_scenes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v11 = v6;
      if (value <= v6)
        v11 = v6 % value;
    }
    else
    {
      v11 = (value - 1) & v6;
    }
    v12 = self->_scenes.__table_.__bucket_list_.__ptr_.__value_[v11];
    if (v12)
    {
      for (i = (_QWORD *)*v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v14 == v6)
        {
          if (i[2] == v6)
          {
            *v5 = i[3];
            v49 = i[4];
            v5[1] = v49;
            if (v49)
            {
              v50 = (unint64_t *)(v49 + 8);
              do
                v51 = __ldxr(v50);
              while (__stxr(v51 + 1, v50));
            }
            goto LABEL_100;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v14 >= value)
              v14 %= value;
          }
          else
          {
            v14 &= value - 1;
          }
          if (v14 != v11)
            break;
        }
      }
    }
  }
  re::audio::REPHASEAudioScene::create((re::audio::REPHASEAudioScene *)self, v5);
  v15 = self->_scenes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (v15)
  {
    v16 = (uint8x8_t)vcnt_s8((int8x8_t)v15);
    v16.i16[0] = vaddlv_u8(v16);
    if (v16.u32[0] > 1uLL)
    {
      v4 = v6;
      if (v15 <= v6)
        v4 = v6 % v15;
    }
    else
    {
      v4 = (v15 - 1) & v6;
    }
    v17 = (_QWORD **)self->_scenes.__table_.__bucket_list_.__ptr_.__value_[v4];
    if (v17)
    {
      for (j = *v17; j; j = (_QWORD *)*j)
      {
        v19 = j[1];
        if (v19 == v6)
        {
          if (j[2] == v6)
            goto LABEL_92;
        }
        else
        {
          if (v16.u32[0] > 1uLL)
          {
            if (v19 >= v15)
              v19 %= v15;
          }
          else
          {
            v19 &= v15 - 1;
          }
          if (v19 != v4)
            break;
        }
      }
    }
  }
  v20 = operator new(0x28uLL);
  p_p1 = &self->_scenes.__table_.__p1_;
  v53[0] = v20;
  v53[1] = &self->_scenes.__table_.__p1_;
  *v20 = 0;
  v20[1] = v6;
  v20[3] = 0;
  v20[4] = 0;
  v20[2] = v6;
  v54 = 1;
  v22 = (float)(self->_scenes.__table_.__p2_.__value_ + 1);
  v23 = self->_scenes.__table_.__p3_.__value_;
  if (v15 && (float)(v23 * (float)v15) >= v22)
  {
    v6 = v4;
    goto LABEL_82;
  }
  v24 = 1;
  if (v15 >= 3)
    v24 = (v15 & (v15 - 1)) != 0;
  v25 = v24 | (2 * v15);
  v26 = vcvtps_u32_f32(v22 / v23);
  if (v25 <= v26)
    prime = (int8x8_t)v26;
  else
    prime = (int8x8_t)v25;
  if (*(_QWORD *)&prime == 1)
  {
    prime = (int8x8_t)2;
  }
  else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
  {
    prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    v15 = self->_scenes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  }
  if (*(_QWORD *)&prime <= v15)
  {
    if (*(_QWORD *)&prime >= v15)
      goto LABEL_78;
    v34 = vcvtps_u32_f32((float)self->_scenes.__table_.__p2_.__value_ / self->_scenes.__table_.__p3_.__value_);
    if (v15 < 3 || (v35 = (uint8x8_t)vcnt_s8((int8x8_t)v15), v35.i16[0] = vaddlv_u8(v35), v35.u32[0] > 1uLL))
    {
      v34 = std::__next_prime(v34);
    }
    else
    {
      v36 = 1 << -(char)__clz(v34 - 1);
      if (v34 >= 2)
        v34 = v36;
    }
    if (*(_QWORD *)&prime <= v34)
      prime = (int8x8_t)v34;
    if (*(_QWORD *)&prime >= v15)
    {
      v15 = self->_scenes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      goto LABEL_78;
    }
    if (!*(_QWORD *)&prime)
    {
      v52 = self->_scenes.__table_.__bucket_list_.__ptr_.__value_;
      self->_scenes.__table_.__bucket_list_.__ptr_.__value_ = 0;
      if (v52)
        operator delete(v52);
      v15 = 0;
      self->_scenes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      goto LABEL_78;
    }
  }
  if (*(_QWORD *)&prime >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v28 = (void **)operator new(8 * *(_QWORD *)&prime);
  v29 = self->_scenes.__table_.__bucket_list_.__ptr_.__value_;
  self->_scenes.__table_.__bucket_list_.__ptr_.__value_ = v28;
  if (v29)
    operator delete(v29);
  v30 = 0;
  self->_scenes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
  do
    self->_scenes.__table_.__bucket_list_.__ptr_.__value_[v30++] = 0;
  while (*(_QWORD *)&prime != v30);
  next = p_p1->__value_.__next_;
  if (p_p1->__value_.__next_)
  {
    v32 = next[1];
    v33 = (uint8x8_t)vcnt_s8(prime);
    v33.i16[0] = vaddlv_u8(v33);
    if (v33.u32[0] > 1uLL)
    {
      if (v32 >= *(_QWORD *)&prime)
        v32 %= *(_QWORD *)&prime;
    }
    else
    {
      v32 &= *(_QWORD *)&prime - 1;
    }
    self->_scenes.__table_.__bucket_list_.__ptr_.__value_[v32] = p_p1;
    v37 = (_QWORD *)*next;
    if (*next)
    {
      do
      {
        v38 = v37[1];
        if (v33.u32[0] > 1uLL)
        {
          if (v38 >= *(_QWORD *)&prime)
            v38 %= *(_QWORD *)&prime;
        }
        else
        {
          v38 &= *(_QWORD *)&prime - 1;
        }
        if (v38 != v32)
        {
          v39 = self->_scenes.__table_.__bucket_list_.__ptr_.__value_;
          if (!v39[v38])
          {
            v39[v38] = next;
            goto LABEL_74;
          }
          *next = *v37;
          *v37 = *(_QWORD *)self->_scenes.__table_.__bucket_list_.__ptr_.__value_[v38];
          *(_QWORD *)self->_scenes.__table_.__bucket_list_.__ptr_.__value_[v38] = v37;
          v37 = next;
        }
        v38 = v32;
LABEL_74:
        next = v37;
        v37 = (_QWORD *)*v37;
        v32 = v38;
      }
      while (v37);
    }
  }
  v15 = (unint64_t)prime;
LABEL_78:
  if ((v15 & (v15 - 1)) != 0)
  {
    if (v15 <= v6)
      v6 %= v15;
  }
  else
  {
    v6 &= v15 - 1;
  }
LABEL_82:
  v40 = (void **)self->_scenes.__table_.__bucket_list_.__ptr_.__value_[v6];
  j = (_QWORD *)v53[0];
  if (v40)
  {
    *(_QWORD *)v53[0] = *v40;
LABEL_90:
    *v40 = j;
    goto LABEL_91;
  }
  *(_QWORD *)v53[0] = self->_scenes.__table_.__p1_.__value_.__next_;
  self->_scenes.__table_.__p1_.__value_.__next_ = j;
  self->_scenes.__table_.__bucket_list_.__ptr_.__value_[v6] = p_p1;
  if (*j)
  {
    v41 = *(_QWORD *)(*j + 8);
    if ((v15 & (v15 - 1)) != 0)
    {
      if (v41 >= v15)
        v41 %= v15;
    }
    else
    {
      v41 &= v15 - 1;
    }
    v40 = &self->_scenes.__table_.__bucket_list_.__ptr_.__value_[v41];
    goto LABEL_90;
  }
LABEL_91:
  v53[0] = 0;
  ++self->_scenes.__table_.__p2_.__value_;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>,void *>>>>::reset[abi:ne180100]((uint64_t)v53);
LABEL_92:
  v43 = *v5;
  v42 = v5[1];
  if (v42)
  {
    v44 = (unint64_t *)(v42 + 8);
    do
      v45 = __ldxr(v44);
    while (__stxr(v45 + 1, v44));
  }
  v46 = (std::__shared_weak_count *)j[4];
  j[3] = v43;
  j[4] = v42;
  if (v46)
  {
    p_shared_owners = (unint64_t *)&v46->__shared_owners_;
    do
      v48 = __ldaxr(p_shared_owners);
    while (__stlxr(v48 - 1, p_shared_owners));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
LABEL_100:
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
LABEL_115:
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (REPHASEAudioScene *)self;
  return result;
}

- (id)phaseIDForAssetID:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a3);
}

- (void)addAudioAssetID:(unint64_t)a3 configuration:(const void *)a4
{
  unint64_t v4;
  double v8;
  UnfairLock *p_audioAssetsMutex;
  unint64_t value;
  uint8x8_t v11;
  void **v12;
  char *v13;
  unint64_t v14;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundAsset>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundAsset>, void *>>> *p_p1;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  int8x8_t prime;
  void **v22;
  void **v23;
  uint64_t v24;
  _QWORD *next;
  unint64_t v26;
  uint8x8_t v27;
  unint64_t v28;
  uint8x8_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  void **v33;
  void **v34;
  void **v35;
  unint64_t v36;
  void **v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  int v44;
  char v45;
  double v46;

  if (*((_DWORD *)a4 + 2))
    v8 = *((double *)a4 + 2);
  else
    v8 = 1.0;
  p_audioAssetsMutex = &self->_audioAssetsMutex;
  os_unfair_lock_lock(&self->_audioAssetsMutex.m_lock);
  v38 = *(_OWORD *)a4;
  v39 = *((_OWORD *)a4 + 1);
  LOBYTE(v40) = *((_BYTE *)a4 + 32);
  if ((_BYTE)v40)
    re::DynamicString::DynamicString((re::DynamicString *)&v41, (const re::DynamicString *)((char *)a4 + 40));
  v43 = *((_BYTE *)a4 + 72);
  if (v43)
    v44 = *((_DWORD *)a4 + 19);
  v45 = *((_BYTE *)a4 + 80);
  v46 = v8;
  value = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v4 = a3;
      if (value <= a3)
        v4 = a3 % value;
    }
    else
    {
      v4 = (value - 1) & a3;
    }
    v12 = (void **)self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_[v4];
    if (v12)
    {
      v13 = (char *)*v12;
      if (*v12)
      {
        do
        {
          v14 = *((_QWORD *)v13 + 1);
          if (v14 == a3)
          {
            if (*((_QWORD *)v13 + 2) == a3)
              goto LABEL_81;
          }
          else
          {
            if (v11.u32[0] > 1uLL)
            {
              if (v14 >= value)
                v14 %= value;
            }
            else
            {
              v14 &= value - 1;
            }
            if (v14 != v4)
              break;
          }
          v13 = *(char **)v13;
        }
        while (v13);
      }
    }
  }
  v13 = (char *)operator new(0x78uLL);
  p_p1 = &self->_audioAssets.__table_.__p1_;
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = a3;
  *((_QWORD *)v13 + 2) = a3;
  *(_OWORD *)(v13 + 40) = 0u;
  *(_OWORD *)(v13 + 24) = 0u;
  *(_OWORD *)(v13 + 56) = 0u;
  *(_OWORD *)(v13 + 72) = 0u;
  *(_OWORD *)(v13 + 88) = 0u;
  *((_QWORD *)v13 + 13) = 0;
  *((_QWORD *)v13 + 14) = 0;
  *((_QWORD *)v13 + 6) = 0xC028000000000000;
  v16 = (float)(self->_audioAssets.__table_.__p2_.__value_ + 1);
  v17 = self->_audioAssets.__table_.__p3_.__value_;
  if (value && (float)(v17 * (float)value) >= v16)
  {
    a3 = v4;
    goto LABEL_71;
  }
  v18 = 1;
  if (value >= 3)
    v18 = (value & (value - 1)) != 0;
  v19 = v18 | (2 * value);
  v20 = vcvtps_u32_f32(v16 / v17);
  if (v19 <= v20)
    prime = (int8x8_t)v20;
  else
    prime = (int8x8_t)v19;
  if (*(_QWORD *)&prime == 1)
  {
    prime = (int8x8_t)2;
  }
  else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
  {
    prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    value = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  }
  if (*(_QWORD *)&prime <= value)
  {
    if (*(_QWORD *)&prime >= value)
      goto LABEL_67;
    v28 = vcvtps_u32_f32((float)self->_audioAssets.__table_.__p2_.__value_ / self->_audioAssets.__table_.__p3_.__value_);
    if (value < 3 || (v29 = (uint8x8_t)vcnt_s8((int8x8_t)value), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
    {
      v28 = std::__next_prime(v28);
    }
    else
    {
      v30 = 1 << -(char)__clz(v28 - 1);
      if (v28 >= 2)
        v28 = v30;
    }
    if (*(_QWORD *)&prime <= v28)
      prime = (int8x8_t)v28;
    if (*(_QWORD *)&prime >= value)
    {
      value = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      goto LABEL_67;
    }
    if (!*(_QWORD *)&prime)
    {
      v37 = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_;
      self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_ = 0;
      if (v37)
        operator delete(v37);
      value = 0;
      self->_audioAssets.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      goto LABEL_67;
    }
  }
  if (*(_QWORD *)&prime >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v22 = (void **)operator new(8 * *(_QWORD *)&prime);
  v23 = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_;
  self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_ = v22;
  if (v23)
    operator delete(v23);
  v24 = 0;
  self->_audioAssets.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
  do
    self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_[v24++] = 0;
  while (*(_QWORD *)&prime != v24);
  next = p_p1->__value_.__next_;
  if (p_p1->__value_.__next_)
  {
    v26 = next[1];
    v27 = (uint8x8_t)vcnt_s8(prime);
    v27.i16[0] = vaddlv_u8(v27);
    if (v27.u32[0] > 1uLL)
    {
      if (v26 >= *(_QWORD *)&prime)
        v26 %= *(_QWORD *)&prime;
    }
    else
    {
      v26 &= *(_QWORD *)&prime - 1;
    }
    self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_[v26] = p_p1;
    v31 = (_QWORD *)*next;
    if (*next)
    {
      do
      {
        v32 = v31[1];
        if (v27.u32[0] > 1uLL)
        {
          if (v32 >= *(_QWORD *)&prime)
            v32 %= *(_QWORD *)&prime;
        }
        else
        {
          v32 &= *(_QWORD *)&prime - 1;
        }
        if (v32 != v26)
        {
          v33 = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_;
          if (!v33[v32])
          {
            v33[v32] = next;
            goto LABEL_63;
          }
          *next = *v31;
          *v31 = *(_QWORD *)self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_[v32];
          *(_QWORD *)self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_[v32] = v31;
          v31 = next;
        }
        v32 = v26;
LABEL_63:
        next = v31;
        v31 = (_QWORD *)*v31;
        v26 = v32;
      }
      while (v31);
    }
  }
  value = (unint64_t)prime;
LABEL_67:
  if ((value & (value - 1)) != 0)
  {
    if (value <= a3)
      a3 %= value;
  }
  else
  {
    a3 &= value - 1;
  }
LABEL_71:
  v34 = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_;
  v35 = (void **)v34[a3];
  if (v35)
  {
    *(_QWORD *)v13 = *v35;
LABEL_79:
    *v35 = v13;
    goto LABEL_80;
  }
  *(__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundAsset>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundAsset>, void *>>> *)v13 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundAsset>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundAsset>, void *>>>)p_p1->__value_.__next_;
  p_p1->__value_.__next_ = v13;
  v34[a3] = p_p1;
  if (*(_QWORD *)v13)
  {
    v36 = *(_QWORD *)(*(_QWORD *)v13 + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v36 >= value)
        v36 %= value;
    }
    else
    {
      v36 &= value - 1;
    }
    v35 = &self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_[v36];
    goto LABEL_79;
  }
LABEL_80:
  ++self->_audioAssets.__table_.__p2_.__value_;
LABEL_81:
  *(_OWORD *)(v13 + 24) = v38;
  *(_OWORD *)(v13 + 40) = v39;
  re::Optional<re::DynamicString>::operator=((unsigned __int8 *)v13 + 56, &v40);
  if (v13[96] || v43)
  {
    if (!v13[96] || v43)
    {
      if (!v13[96] && v43)
        v13[96] = 1;
      *((_DWORD *)v13 + 25) = v44;
    }
    else
    {
      v13[96] = 0;
    }
  }
  v13[104] = v45;
  *((double *)v13 + 14) = v46;
  if ((_BYTE)v40 && v41 && (v42 & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)v41 + 40))();
  os_unfair_lock_unlock(&p_audioAssetsMutex->m_lock);
}

- (BOOL)getConfigurationForAudioAssetID:(unint64_t)a3 configuration:(void *)a4
{
  UnfairLock *p_audioAssetsMutex;
  _QWORD *v8;
  _QWORD *v9;
  __int128 v10;

  p_audioAssetsMutex = &self->_audioAssetsMutex;
  os_unfair_lock_lock(&self->_audioAssetsMutex.m_lock);
  v8 = std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_, a3);
  v9 = v8;
  if (v8)
  {
    v10 = *(_OWORD *)(v8 + 5);
    *(_OWORD *)a4 = *(_OWORD *)(v8 + 3);
    *((_OWORD *)a4 + 1) = v10;
    re::Optional<re::DynamicString>::operator=((unsigned __int8 *)a4 + 32, (unsigned __int8 *)v8 + 56);
    if (*((_BYTE *)a4 + 72) || *((_BYTE *)v9 + 96))
    {
      if (!*((_BYTE *)a4 + 72) || *((_BYTE *)v9 + 96))
      {
        if (!*((_BYTE *)a4 + 72) && *((_BYTE *)v9 + 96))
          *((_BYTE *)a4 + 72) = 1;
        *((_DWORD *)a4 + 19) = *((_DWORD *)v9 + 25);
      }
      else
      {
        *((_BYTE *)a4 + 72) = 0;
      }
    }
    *((_BYTE *)a4 + 80) = *((_BYTE *)v9 + 104);
  }
  os_unfair_lock_unlock(&p_audioAssetsMutex->m_lock);
  return v9 != 0;
}

- (void)removeAudioAssetID:(unint64_t)a3
{
  UnfairLock *p_audioAssetsMutex;
  unordered_map<unsigned long long, REPHASESoundAsset, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, REPHASESoundAsset>>> *p_audioAssets;
  REPHASEContext *v7;
  unint64_t value;
  objc_class *isa;
  unint64_t engine;
  uint8x8_t v11;
  REPHASEContext *v12;
  REPHASEContext *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  p_audioAssetsMutex = &self->_audioAssetsMutex;
  os_unfair_lock_lock(&self->_audioAssetsMutex.m_lock);
  p_audioAssets = &self->_audioAssets;
  v7 = (REPHASEContext *)std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v7)
  {
    value = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    isa = v7->super.isa;
    engine = (unint64_t)v7->_engine;
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      if (engine >= value)
        engine %= value;
    }
    else
    {
      engine &= value - 1;
    }
    v12 = (REPHASEContext *)p_audioAssets->__table_.__bucket_list_.__ptr_.__value_[engine];
    do
    {
      v13 = v12;
      v12 = (REPHASEContext *)v12->super.isa;
    }
    while (v12 != v7);
    if (v13 == (REPHASEContext *)&self->_audioAssets.__table_.__p1_)
      goto LABEL_19;
    v14 = (unint64_t)v13->_engine;
    if (v11.u32[0] > 1uLL)
    {
      if (v14 >= value)
        v14 %= value;
    }
    else
    {
      v14 &= value - 1;
    }
    if (v14 != engine)
    {
LABEL_19:
      if (isa)
      {
        v15 = *((_QWORD *)isa + 1);
        if (v11.u32[0] > 1uLL)
        {
          v16 = *((_QWORD *)isa + 1);
          if (v15 >= value)
            v16 = v15 % value;
        }
        else
        {
          v16 = v15 & (value - 1);
        }
        if (v16 == engine)
          goto LABEL_23;
      }
      p_audioAssets->__table_.__bucket_list_.__ptr_.__value_[engine] = 0;
      isa = v7->super.isa;
    }
    if (!isa)
    {
LABEL_29:
      v13->super.isa = isa;
      v7->super.isa = 0;
      --self->_audioAssets.__table_.__p2_.__value_;
      std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,REPHASESoundAsset>,void *>>>::operator()[abi:ne180100](1, v7);
      goto LABEL_30;
    }
    v15 = *((_QWORD *)isa + 1);
LABEL_23:
    if (v11.u32[0] > 1uLL)
    {
      if (v15 >= value)
        v15 %= value;
    }
    else
    {
      v15 &= value - 1;
    }
    if (v15 != engine)
    {
      p_audioAssets->__table_.__bucket_list_.__ptr_.__value_[v15] = v13;
      isa = v7->super.isa;
    }
    goto LABEL_29;
  }
LABEL_30:
  os_unfair_lock_unlock(&p_audioAssetsMutex->m_lock);
}

- (int64_t)getReverbPreset
{
  return self->_reverbPreset;
}

- (void)setReverbPreset:(int64_t)a3 allowingSpaceBlend:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_reverbPreset != a3 || self->_allowSpaceBlend != a4)
  {
    v7 = *re::audioLogObjects((re *)self);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109376;
      v8[1] = a3;
      v9 = 1024;
      v10 = v4;
      _os_log_impl(&dword_224FE9000, v7, OS_LOG_TYPE_DEFAULT, "-[REPhaseContext setReverbPreset:] Setting preset to %d, allowing space blend %d.", (uint8_t *)v8, 0xEu);
    }
    self->_reverbPreset = a3;
    self->_allowSpaceBlend = v4;
    -[REPHASEContext applyReverbPreset](self, "applyReverbPreset");
    -[REPHASEContext applySpaceBlendLevel](self, "applySpaceBlendLevel");
  }
}

- (float)getSpaceBlendLevel
{
  return self->_spaceBlendLevel;
}

- (void)setSpaceBlendLevel:(float)a3
{
  if (self->_spaceBlendLevel != a3)
  {
    self->_spaceBlendLevel = a3;
    -[REPHASEContext applySpaceBlendLevel](self, "applySpaceBlendLevel");
  }
}

- (void)setSpaceBlendTargetPresetOrientation:(uint64_t)a1
{
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = *(void **)(a1 + 8);
  if (v1)
  {
    objc_msgSend(v1, "setSpaceBlendTargetPresetOrientation:");
  }
  else
  {
    v2 = *re::audioLogObjects(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_224FE9000, v2, OS_LOG_TYPE_INFO, "-[REPhaseContext setSpaceBlendTargetPresetOrientation] => not setting space blend target preset orientation since engine is not yet created.", v3, 2u);
    }
  }
}

- (void)applyReverbPreset
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = re::audio::phasePrivateReverbPresetFor((re *)self->_reverbPreset);
  if (!self->_engine)
  {
    v5 = (id)*re::audioLogObjects(0);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    v9 = 136315394;
    v10 = re::audio::phasePrivateReverbPresetName(v3);
    v11 = 1024;
    v12 = v3;
    v6 = "-[REPhaseContext applyReverbPreset] => not applying reverb preset(%s, %d) since engine is not yet created.";
LABEL_9:
    v7 = v5;
    v8 = OS_LOG_TYPE_INFO;
    goto LABEL_10;
  }
  v4 = objc_opt_respondsToSelector();
  if ((v4 & 1) == 0)
  {
    v5 = (id)*re::audioLogObjects((re *)v4);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    v9 = 136315394;
    v10 = re::audio::phasePrivateReverbPresetName(v3);
    v11 = 1024;
    v12 = v3;
    v6 = "-[REPhaseContext applyReverbPreset] => not applying reverb preset(%s, %d) since engine doesn't respond to selector.";
    goto LABEL_9;
  }
  v5 = (id)*re::audioLogObjects((re *)-[PHASEEngine setSpaceBlendTargetPreset:](self->_engine, "setSpaceBlendTargetPreset:", v3));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = re::audio::phasePrivateReverbPresetName(v3);
    v11 = 1024;
    v12 = v3;
    v6 = "-[REPhaseContext applyReverbPreset] => [_engine setSpaceBlendTargetPreset:%s] (%d)";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
    _os_log_impl(&dword_224FE9000, v7, v8, v6, (uint8_t *)&v9, 0x12u);
  }
LABEL_11:

}

- (void)applySpaceBlendLevel
{
  uint64_t v3;
  double spaceBlendLevel;
  NSObject *v5;
  double v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_engine)
  {
    v3 = objc_opt_respondsToSelector();
    if ((v3 & 1) != 0)
    {
      if (self->_allowSpaceBlend)
      {
        spaceBlendLevel = self->_spaceBlendLevel;
      }
      else
      {
        v8 = *re::audioLogObjects((re *)v3);
        v3 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
        spaceBlendLevel = 1.0;
        if ((_DWORD)v3)
        {
          v10 = 134217984;
          v11 = 1.0;
          _os_log_debug_impl(&dword_224FE9000, v8, OS_LOG_TYPE_DEBUG, "-[REPhaseContext applySpaceBlendLevel] will force spaceBlendLevel to %.9g.", (uint8_t *)&v10, 0xCu);
        }
      }
      v9 = *re::audioLogObjects((re *)v3);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = 134217984;
        v11 = spaceBlendLevel;
        _os_log_debug_impl(&dword_224FE9000, v9, OS_LOG_TYPE_DEBUG, "-[REPhaseContext applySpaceBlendLevel] => [_engine setSpaceBlendLevel:%.9g]", (uint8_t *)&v10, 0xCu);
      }
      -[PHASEEngine setSpaceBlendLevel:](self->_engine, "setSpaceBlendLevel:", spaceBlendLevel);
    }
    else
    {
      v7 = *re::audioLogObjects((re *)v3);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v10) = 0;
        _os_log_error_impl(&dword_224FE9000, v7, OS_LOG_TYPE_ERROR, "[REPHASEContext applySpaceBlendLevel] - not applying space blend level because Phase runtime is too old.", (uint8_t *)&v10, 2u);
      }
    }
  }
  else
  {
    v5 = *re::audioLogObjects(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = self->_spaceBlendLevel;
      v10 = 134217984;
      v11 = v6;
      _os_log_impl(&dword_224FE9000, v5, OS_LOG_TYPE_INFO, "-[REPhaseContext applySpaceBlendLevel] => not applying space blend level(%.9g) since engine is not yet created.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (id)baseMixerDefinitionWith:(const void *)a3
{
  REPHASEContext *v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  re *v8;
  NSObject *v9;
  id v10;
  void *v11;
  float32x4_t v12;
  int32x4_t v13;
  float32x4_t v14;
  float v15;
  float v16;
  float v17;
  float v19;
  float v20;
  float32x2_t v21;
  float32x2_t v22;
  float v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  re *v28;
  NSObject *v29;
  NSObject *v30;
  float v32;
  float32x2_t v33;
  float32x2_t v34;
  float v35;
  float v36;
  unsigned int v37;
  float32x2_t v38;
  float32x2_t v39;
  float v40;
  double v41;
  float v42;
  int v43;
  int v44;
  float v45;
  float v46;
  float32x2_t v47;
  float32x2_t v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  float v52;
  float v53;
  float v54;
  float v55;
  re *v56;
  NSObject *v57;
  std::__shared_weak_count *v58;
  unint64_t *p_shared_owners;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  uint64_t v64;
  double v65;
  int v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  double v70;
  float v71;
  float v72;
  float v73;
  uint64_t v74;
  std::__shared_weak_count *v75;
  re::audio::REPHASEAudioScene *v76;
  std::__shared_weak_count *v77;
  uint8_t buf[4];
  _BYTE v79[10];
  double v80;
  __int16 v81;
  double v82;
  __int16 v83;
  double v84;
  __int16 v85;
  double v86;
  uint64_t v87;

  v4 = self;
  v87 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)a3;
  v6 = *(unsigned __int8 *)(*(_QWORD *)a3 + 100);
  if (*(_BYTE *)(*(_QWORD *)a3 + 100))
  {
    if (*(_DWORD *)(v5 + 312))
    {
      v7 = *re::audioLogObjects((re *)self);
      self = (REPHASEContext *)os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      if ((_DWORD)self)
      {
        v43 = *(unsigned __int8 *)(*(_QWORD *)a3 + 100);
        v44 = *(_DWORD *)(*(_QWORD *)a3 + 312);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v79 = v43;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = v44;
        _os_log_error_impl(&dword_224FE9000, v7, OS_LOG_TYPE_ERROR, "Only point sources can have a directivity. Switching to omnidirectional. inputMode: %d, directivityMode: %d", buf, 0xEu);
      }
      v5 = *(_QWORD *)a3;
      *(_DWORD *)(v5 + 312) = 0;
      v6 = *(unsigned __int8 *)(v5 + 100);
    }
    if (v6 == 2)
    {
      -[REPHASEContext sceneForID:](v4, "sceneForID:", *(_QWORD *)(v5 + 32));
      re::audio::REPHASEAudioScene::getOrCreateEntity((os_unfair_lock_s *)v76, *(_QWORD *)(*(_QWORD *)a3 + 40), &v74);
      v10 = objc_alloc(MEMORY[0x24BDE3230]);
      re::audio::REPHASESoundPrepareState::getChannelLayout(*(re::audio::REPHASESoundPrepareState **)a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(int32x4_t *)(v74 + 48);
      v12 = *(float32x4_t *)(v74 + 64);
      v14 = *(float32x4_t *)(v74 + 80);
      LODWORD(v15) = HIDWORD(*(_QWORD *)(v74 + 64));
      v16 = COERCE_FLOAT(*(_QWORD *)(v74 + 88));
      v17 = v16 + (float)(*(float *)v13.i32 + v15);
      if (v17 >= 0.0)
      {
        v32 = sqrtf(v17 + 1.0);
        v33 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v32 + v32));
        v34 = vmul_f32(v33, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v32 + v32), v33));
        LODWORD(v35) = vmul_f32(v34, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v32 + v32), v34)).u32[0];
        *(float *)&v41 = vmuls_lane_f32(v35, (float32x2_t)*(_OWORD *)&vsubq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), v14), 1);
        v42 = vmuls_n_f32(vsubq_f32(v14, (float32x4_t)vdupq_laneq_s32(v13, 2)).f32[0], v35);
      }
      else if (*(float *)v13.i32 < v15 || *(float *)v13.i32 < v16)
      {
        v19 = 1.0 - *(float *)v13.i32;
        if (v15 >= v16)
        {
          v45 = sqrtf(v15 + (float)(v19 - v16));
          v46 = v45 + v45;
          v47 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v45 + v45));
          v48 = vmul_f32(v47, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v45 + v45), v47));
          *(float *)&v41 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.i8, 1), v12).f32[0], vmul_f32(v48, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v45 + v45), v48)).f32[0]);
          v42 = v46 * 0.25;
        }
        else
        {
          v20 = sqrtf(v16 + (float)(v19 - v15));
          v21 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v20 + v20));
          v22 = vmul_f32(v21, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v20 + v20), v21));
          LODWORD(v23) = vmul_f32(v22, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v20 + v20), v22)).u32[0];
          *(float *)&v41 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32(v13, 2), v14).f32[0], v23);
          v42 = vmuls_lane_f32(v23, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), v14), 1);
        }
      }
      else
      {
        v36 = sqrtf(*(float *)v13.i32 + (float)((float)(1.0 - v15) - v16));
        *(float *)&v37 = v36 + v36;
        v38 = vrecpe_f32((float32x2_t)v37);
        v39 = vmul_f32(v38, vrecps_f32((float32x2_t)v37, v38));
        LODWORD(v40) = vmul_f32(v39, vrecps_f32((float32x2_t)v37, v39)).u32[0];
        *(float *)&v41 = *(float *)&v37 * 0.25;
        v42 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.i8, 1), v12).f32[0], v40);
      }
      *((float *)&v41 + 1) = v42;
      v49 = (void *)objc_msgSend(v10, "initWithChannelLayout:orientation:", v11, v41);

      v8 = v49;
      v50 = (id)*re::audioLogObjects(v8);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = *(_QWORD *)(v74 + 16);
        -[re orientation](v8, "orientation");
        v73 = v52;
        -[re orientation](v8, "orientation");
        v72 = v53;
        -[re orientation](v8, "orientation");
        v71 = v54;
        -[re orientation](v8, "orientation");
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)v79 = v51;
        *(_WORD *)&v79[8] = 2048;
        v80 = v73;
        v81 = 2048;
        v82 = v72;
        v83 = 2048;
        v84 = v71;
        v85 = 2048;
        v86 = v55;
        _os_log_impl(&dword_224FE9000, v50, OS_LOG_TYPE_DEFAULT, "[REPHASEContext baseMixerDefinitionWith] created ambient mixer definition for source %@, orientation = [%+4.3f,%+4.3f,%+4.3f,%+4.3f]", buf, 0x34u);
      }

      if (!v8)
      {
        v57 = (id)*re::audioLogObjects(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          v69 = *(_QWORD *)(*(_QWORD *)a3 + 24);
          re::audio::REPHASESoundPrepareState::getChannelLayout(*(re::audio::REPHASESoundPrepareState **)a3);
          v70 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v79 = v69;
          *(_WORD *)&v79[8] = 2112;
          v80 = v70;
          _os_log_error_impl(&dword_224FE9000, v57, OS_LOG_TYPE_ERROR, "[REPHASEContext baseMixerDefinitionWith] Failed to create ambient mixer definition for token: %llu with channel layout %@", buf, 0x16u);

        }
      }

      v58 = v75;
      if (v75)
      {
        p_shared_owners = (unint64_t *)&v75->__shared_owners_;
        do
          v60 = __ldaxr(p_shared_owners);
        while (__stlxr(v60 - 1, p_shared_owners));
        if (!v60)
        {
          ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
          std::__shared_weak_count::__release_weak(v58);
        }
      }
      v61 = v77;
      if (v77)
      {
        v62 = (unint64_t *)&v77->__shared_owners_;
        do
          v63 = __ldaxr(v62);
        while (__stlxr(v63 - 1, v62));
        if (!v63)
        {
          ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
          std::__shared_weak_count::__release_weak(v61);
        }
      }
      return v8;
    }
    if (v6 == 1)
    {
      v24 = (v4->_mixerDefNameCounter + 1);
      v4->_mixerDefNameCounter = v24;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("channelMixer-%d"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_alloc(MEMORY[0x24BDE3248]);
      re::audio::REPHASESoundPrepareState::getChannelLayout(*(re::audio::REPHASESoundPrepareState **)a3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (re *)objc_msgSend(v26, "initWithChannelLayout:identifier:", v27, v25);

      if (!v8)
      {
        v29 = (id)*re::audioLogObjects(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v67 = *(_QWORD *)(*(_QWORD *)a3 + 24);
          re::audio::REPHASESoundPrepareState::getChannelLayout(*(re::audio::REPHASESoundPrepareState **)a3);
          v68 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v79 = v67;
          *(_WORD *)&v79[8] = 2112;
          v80 = v68;
          _os_log_error_impl(&dword_224FE9000, v29, OS_LOG_TYPE_ERROR, "[REPHASEContext baseMixerDefinitionWith] Failed to create channel mixer definition for token: %llu with channel layout %@", buf, 0x16u);

        }
      }

      return v8;
    }
    if (v6)
    {
      v30 = *re::audioLogObjects((re *)self);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v66 = *(unsigned __int8 *)(*(_QWORD *)a3 + 100);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v79 = v66;
        _os_log_error_impl(&dword_224FE9000, v30, OS_LOG_TYPE_ERROR, "Unrecognized input mode for AudioFileAsset %d", buf, 8u);
      }
      goto LABEL_28;
    }
  }
  -[REPHASEContext getOrCreateSpatialMixerDefinitionUsing:](v4, "getOrCreateSpatialMixerDefinitionUsing:", a3);
  v8 = (re *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = (id)*re::audioLogObjects(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v64 = *(_QWORD *)(*(_QWORD *)a3 + 24);
      re::audio::REPHASESoundPrepareState::getChannelLayout(*(re::audio::REPHASESoundPrepareState **)a3);
      v65 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)v79 = v64;
      *(_WORD *)&v79[8] = 2112;
      v80 = v65;
      _os_log_error_impl(&dword_224FE9000, v9, OS_LOG_TYPE_ERROR, "[REPHASEContext baseMixerDefinitionWith] Failed to create spatial mixer definition for token: %llu with channel layout %@", buf, 0x16u);

    }
LABEL_28:
    v8 = 0;
  }
  return v8;
}

- (id)createSamplerDefinitionForToken:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  NSObject *v18;
  uint64_t v20;
  std::__shared_weak_count *v21;
  _BYTE buf[22];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[REPHASEContext eventFor:](self, "eventFor:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_19;
  objc_msgSend(v5, "soundEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (!v5)
    goto LABEL_19;
  objc_msgSend(v6, "prepareState");
  if (*(_QWORD *)&buf[8])
  {
    v8 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)&buf[8] + 16))(*(_QWORD *)&buf[8]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&buf[8]);
    }
  }

  if (*(_QWORD *)buf)
  {
    objc_msgSend(v6, "prepareState");
    v10 = *(_QWORD *)(*(_QWORD *)buf + 64);
    objc_msgSend(v6, "prepareState");
    -[REPHASEContext samplerDefForFileAsset:with:](self, "samplerDefForFileAsset:with:", v10, &v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v21;
    if (v21)
    {
      p_shared_owners = (unint64_t *)&v21->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v15 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v16 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  else
  {
LABEL_19:
    v18 = *re::audioLogObjects((re *)v5);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_error_impl(&dword_224FE9000, v18, OS_LOG_TYPE_ERROR, "cannot create sampler definition for token %llu with invalid event %@", buf, 0x16u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)samplerDefForFileAsset:(unint64_t)a3 with:(const void *)a4
{
  void *v7;
  void *v8;

  -[REPHASEContext baseMixerDefinitionWith:](self, "baseMixerDefinitionWith:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REPHASEContext samplerDefForFileAsset:mixerDefinition:prepareState:](self, "samplerDefForFileAsset:mixerDefinition:prepareState:", a3, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)samplerDefForFileAsset:(unint64_t)a3 mixerDefinition:(id)a4 prepareState:(const void *)a5
{
  id v8;
  void *v9;
  void *v10;
  UnfairLock *p_audioAssetsMutex;
  double *v12;
  double *v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  std::string *p_buf;
  void *v24;
  void *v25;
  std::string::size_type v27;
  void *__p[2];
  char v29;
  std::string buf;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (v8)
  {
    -[REPHASEContext phaseIDForAssetID:](self, "phaseIDForAssetID:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE32B0]), "initWithSoundAssetIdentifier:mixerDefinition:", v9, v8);
    p_audioAssetsMutex = &self->_audioAssetsMutex;
    os_unfair_lock_lock(&self->_audioAssetsMutex.m_lock);
    v12 = (double *)std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_, a3);
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v10, "setCalibrationMode:level:", *((int *)v12 + 8), v12[14]);
      if (*((_BYTE *)v13 + 56))
      {
        v14 = *(_QWORD *)a5;
        if (((_BYTE)v13[9] & 1) != 0)
          v15 = (char *)*((_QWORD *)v13 + 10);
        else
          v15 = (char *)v13 + 73;
        v19 = *(_QWORD *)(v14 + 32);
        v20 = *(_QWORD *)(v14 + 48);
        std::string::basic_string[abi:ne180100]<0>(__p, v15);
        REAudioComputePHASEMixGroupID(v19, v20, (uint64_t)__p, &buf);
        if (v29 < 0)
          operator delete(__p[0]);
        -[REPHASEContext engine](self, "engine");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "groups");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_buf = &buf;
        else
          p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", p_buf);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setGroup:", v25);

        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf.__r_.__value_.__l.__data_);
      }
      os_unfair_lock_unlock(&self->_audioAssetsMutex.m_lock);
      objc_msgSend(v10, "setGainMetaParameterDefinition:", self->_gainLinearParamDefinition);
      objc_msgSend(v10, "setRateMetaParameterDefinition:", self->_rateParamDefinition);
      objc_msgSend(v10, "setRate:", 1.0);
      objc_msgSend(v10, "setPlaybackMode:", *(_DWORD *)(*(_QWORD *)a5 + 96) != 0);
      v17 = v10;
    }
    else
    {
      v18 = *re::audioLogObjects(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v27 = *(_QWORD *)(*(_QWORD *)a5 + 24);
        LODWORD(buf.__r_.__value_.__l.__data_) = 134218240;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v27;
        WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = a3;
        _os_log_error_impl(&dword_224FE9000, v18, OS_LOG_TYPE_ERROR, "Error: Preparing sampler definition for token %llu, unknown asset %llu", (uint8_t *)&buf, 0x16u);
      }
      os_unfair_lock_unlock(&p_audioAssetsMutex->m_lock);
      v17 = 0;
    }

  }
  else
  {
    v16 = *re::audioLogObjects(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = a3;
      _os_log_fault_impl(&dword_224FE9000, v16, OS_LOG_TYPE_FAULT, "[REPHASEContext samplerDefForFileAsset:mixerDefinition:prepareState] Failed to initialize PHASESamplerNodeDefinition for assetID: %llu.PHASEChannelMixerDefinition returned a null mixerDef", (uint8_t *)&buf, 0xCu);
    }
    v17 = 0;
  }

  return v17;
}

- (id)mixerParametersForPrepareState:(const void *)a3 source:(id)a4 listener:(id)a5 mixerIdentifiers:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_alloc_init(MEMORY[0x24BDE3290]);
  if (!*(_BYTE *)(*(_QWORD *)a3 + 100))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = v11;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(v12, "addSpatialMixerParametersWithIdentifier:source:listener:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), v9, v10);
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v18);
    }
    goto LABEL_18;
  }
  if (*(_BYTE *)(*(_QWORD *)a3 + 100) == 2)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(v12, "addAmbientMixerParametersWithIdentifier:listener:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), v10, (_QWORD)v22);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v14);
    }
LABEL_18:

  }
  return v12;
}

- (void)prepare:(shared_ptr<re::audio::REPHASESoundPrepareState>)a3
{
  REPHASESoundPrepareState *ptr;
  void *v5;
  std::__shared_weak_count *v6;
  void *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  re *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  char v14;
  PHASEListener *v15;
  PHASEListener *listener;
  char v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  re *v33;
  NSObject *v34;
  int v35;
  re *v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  void **v40;
  const char *v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  unint64_t *v50;
  void *v51;
  void **v52;
  void *v53;
  id v54;
  re *v55;
  NSObject *v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  unint64_t *v60;
  unint64_t v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  unint64_t *v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  unint64_t *v69;
  unint64_t v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  unint64_t *v74;
  void *v75;
  void *v76;
  void *v77;
  re *v78;
  NSObject *v79;
  std::__shared_weak_count *v80;
  unint64_t *v81;
  unint64_t v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  std::__shared_weak_count *v86;
  unint64_t *v87;
  unint64_t v88;
  uint64_t v89;
  std::__shared_weak_count *v90;
  uint64_t v91;
  std::__shared_weak_count *v92;
  uint64_t v93;
  std::__shared_weak_count *v94;
  uint64_t v95;
  std::__shared_weak_count *v96;
  uint64_t v97;
  std::__shared_weak_count *v98;
  uint64_t v99;
  std::__shared_weak_count *v100;
  uint64_t v101;
  std::__shared_weak_count *v102;
  uint64_t v103;
  std::__shared_weak_count *v104;
  id v105;
  void *__p[2];
  char v107;
  uint64_t v108;
  std::__shared_weak_count *v109;
  re::audio::REPHASEAudioScene *v110;
  std::__shared_weak_count *v111;
  _QWORD aBlock[4];
  id v113[3];
  std::__shared_weak_count *v114;
  id location;
  uint64_t v116;
  const __CFString *v117;
  uint64_t v118;
  const __CFString *v119;
  uint8_t buf[4];
  id v121;
  __int16 v122;
  void *v123;
  __int16 v124;
  void **v125;
  uint64_t v126;

  ptr = a3.__ptr_;
  v126 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v5 = *(void **)(*(_QWORD *)ptr + 24);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3321888768;
  aBlock[2] = __26__REPHASEContext_prepare___block_invoke;
  aBlock[3] = &unk_24ED3D170;
  objc_copyWeak(v113, &location);
  v7 = *(void **)ptr;
  v6 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v113[1] = v5;
  v113[2] = v7;
  v114 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v10 = (re *)_Block_copy(aBlock);
  v11 = *re::audioLogObjects(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v121 = v5;
    _os_log_impl(&dword_224FE9000, v11, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [Prepare] token: %llu", buf, 0xCu);
  }
  -[REPHASEContext sceneForID:](self, "sceneForID:", *(_QWORD *)(*(_QWORD *)ptr + 32));
  re::audio::REPHASEAudioScene::getOrCreateEntityWithIncrementedCount((os_unfair_lock_s *)v110, *(_QWORD *)(*(_QWORD *)ptr + 40), &v108);
  v12 = *(_QWORD *)ptr;
  if (!*(_QWORD *)(*(_QWORD *)ptr + 280) && !*(_QWORD *)(v12 + 288) || *(_BYTE *)(v12 + 296))
  {
    v13 = *(id *)(v108 + 16);
    if (v13)
    {
LABEL_10:
      objc_msgSend(v13, "setWorldTransform:", *(double *)(*(_QWORD *)ptr + 112), *(double *)(*(_QWORD *)ptr + 128), *(double *)(*(_QWORD *)ptr + 144), *(double *)(*(_QWORD *)ptr + 160));

      v14 = 0;
      goto LABEL_12;
    }
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDE32D8]), "initWithEngine:", self->_engine);
    objc_storeStrong((id *)(v108 + 16), v13);
    v35 = *(unsigned __int8 *)(*(_QWORD *)ptr + 208);
    v37 = (id)*re::audioLogObjects(v36);
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    if (v35)
    {
      if (!v38)
        goto LABEL_67;
      v39 = *(void **)(*(_QWORD *)ptr + 40);
      re::audio::stringFromPose((re::audio *)(*(_QWORD *)ptr + 112), __p);
      if (v107 >= 0)
        v40 = __p;
      else
        v40 = (void **)__p[0];
      *(_DWORD *)buf = 134218499;
      v121 = v39;
      v122 = 2048;
      v123 = v5;
      v124 = 2085;
      v125 = v40;
      v41 = "[REPhaseContext] [Prepare] creating PHASESource. EntityID(%llu) Token(%llu) Transform: %{sensitive}s";
    }
    else
    {
      if (!v38)
        goto LABEL_67;
      v51 = *(void **)(*(_QWORD *)ptr + 40);
      re::audio::stringFromPose((re::audio *)(*(_QWORD *)ptr + 112), __p);
      if (v107 >= 0)
        v52 = __p;
      else
        v52 = (void **)__p[0];
      *(_DWORD *)buf = 134218498;
      v121 = v51;
      v122 = 2048;
      v123 = v5;
      v124 = 2080;
      v125 = v52;
      v41 = "[REPhaseContext] [Prepare] creating PHASESource. EntityID(%llu) Token(%llu) Transform: %s";
    }
    _os_log_impl(&dword_224FE9000, v37, OS_LOG_TYPE_DEFAULT, v41, buf, 0x20u);
    if (v107 < 0)
      operator delete(__p[0]);
LABEL_67:

    -[PHASEEngine rootObject](self->_engine, "rootObject");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = 0;
    objc_msgSend(v53, "addChild:error:", v13, &v105);
    v54 = v105;

    if (v54)
    {
      v56 = *re::audioLogObjects(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v121 = v54;
        v122 = 2048;
        v123 = v5;
        _os_log_error_impl(&dword_224FE9000, v56, OS_LOG_TYPE_ERROR, "[REPhaseContext] [Prepare] Could not add entity to PHASE %@, token %llu", buf, 0x16u);
      }
      (*((void (**)(re *, _QWORD, id))v10 + 2))(v10, 0, v54);

      goto LABEL_106;
    }
    goto LABEL_10;
  }
  v14 = 1;
LABEL_12:
  re::audio::REPHASEAudioScene::getListener(v110);
  v15 = (PHASEListener *)objc_claimAutoreleasedReturnValue();
  listener = self->_listener;
  self->_listener = v15;

  if (self->_listener)
    v17 = 1;
  else
    v17 = v14;
  if ((v17 & 1) == 0)
  {
    v30 = (void *)MEMORY[0x24BDD1540];
    v118 = *MEMORY[0x24BDD0FC8];
    v119 = CFSTR("In order for audio to be rendered, the app must have a listener component attached to an active entity in the scene.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.re.internal"), -105, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = *re::audioLogObjects(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v121 = v32;
      _os_log_error_impl(&dword_224FE9000, v34, OS_LOG_TYPE_ERROR, "[REPhaseContext] [Prepare] Could not prepare audio due to lack of listener entity %@", buf, 0xCu);
    }
    (*((void (**)(re *, _QWORD, void *))v10 + 2))(v10, 0, v32);

    goto LABEL_106;
  }
  v18 = *(_QWORD *)(*(_QWORD *)ptr + 56);
  if (v18 > 1)
  {
    if (v18 == 2)
    {
      v66 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
      v95 = *(_QWORD *)ptr;
      v96 = v66;
      if (v66)
      {
        v67 = (unint64_t *)&v66->__shared_owners_;
        do
          v68 = __ldxr(v67);
        while (__stxr(v68 + 1, v67));
      }
      v93 = v108;
      v94 = v109;
      if (v109)
      {
        v69 = (unint64_t *)&v109->__shared_owners_;
        do
          v70 = __ldxr(v69);
        while (__stxr(v70 + 1, v69));
      }
      -[REPHASEContext prepareGeneratorType:phaseEntity:completion:](self, "prepareGeneratorType:phaseEntity:completion:", &v95, &v93, v10);
      v71 = v94;
      if (v94)
      {
        v72 = (unint64_t *)&v94->__shared_owners_;
        do
          v73 = __ldaxr(v72);
        while (__stlxr(v73 - 1, v72));
        if (!v73)
        {
          ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
          std::__shared_weak_count::__release_weak(v71);
        }
      }
      v27 = v96;
      if (!v96)
        goto LABEL_106;
      v74 = (unint64_t *)&v96->__shared_owners_;
      do
        v29 = __ldaxr(v74);
      while (__stlxr(v29 - 1, v74));
    }
    else
    {
      if (v18 != 100)
      {
LABEL_102:
        v75 = (void *)MEMORY[0x24BDD1540];
        v116 = *MEMORY[0x24BDD0FC8];
        v117 = CFSTR("Unsupported asset type");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "errorWithDomain:code:userInfo:", CFSTR("com.apple.re.internal"), -110, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        v79 = *re::audioLogObjects(v78);
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v121 = v5;
          v122 = 2112;
          v123 = v77;
          _os_log_error_impl(&dword_224FE9000, v79, OS_LOG_TYPE_ERROR, "[REPhaseContext] [Prepare] token %llu, error %@", buf, 0x16u);
          if (!v10)
            goto LABEL_105;
        }
        else if (!v10)
        {
LABEL_105:

          goto LABEL_106;
        }
        (*((void (**)(re *, _QWORD, void *))v10 + 2))(v10, 0, v77);
        goto LABEL_105;
      }
      v42 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
      v91 = *(_QWORD *)ptr;
      v92 = v42;
      if (v42)
      {
        v43 = (unint64_t *)&v42->__shared_owners_;
        do
          v44 = __ldxr(v43);
        while (__stxr(v44 + 1, v43));
      }
      v89 = v108;
      v90 = v109;
      if (v109)
      {
        v45 = (unint64_t *)&v109->__shared_owners_;
        do
          v46 = __ldxr(v45);
        while (__stxr(v46 + 1, v45));
      }
      -[REPHASEContext prepareExternalType:phaseEntity:completion:](self, "prepareExternalType:phaseEntity:completion:", &v91, &v89, v10);
      v47 = v90;
      if (v90)
      {
        v48 = (unint64_t *)&v90->__shared_owners_;
        do
          v49 = __ldaxr(v48);
        while (__stlxr(v49 - 1, v48));
        if (!v49)
        {
          ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
          std::__shared_weak_count::__release_weak(v47);
        }
      }
      v27 = v92;
      if (!v92)
        goto LABEL_106;
      v50 = (unint64_t *)&v92->__shared_owners_;
      do
        v29 = __ldaxr(v50);
      while (__stlxr(v29 - 1, v50));
    }
LABEL_100:
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
    goto LABEL_106;
  }
  if (!v18)
  {
    v57 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
    v103 = *(_QWORD *)ptr;
    v104 = v57;
    if (v57)
    {
      v58 = (unint64_t *)&v57->__shared_owners_;
      do
        v59 = __ldxr(v58);
      while (__stxr(v59 + 1, v58));
    }
    v101 = v108;
    v102 = v109;
    if (v109)
    {
      v60 = (unint64_t *)&v109->__shared_owners_;
      do
        v61 = __ldxr(v60);
      while (__stxr(v61 + 1, v60));
    }
    -[REPHASEContext prepareFileType:phaseEntity:completion:](self, "prepareFileType:phaseEntity:completion:", &v103, &v101, v10);
    v62 = v102;
    if (v102)
    {
      v63 = (unint64_t *)&v102->__shared_owners_;
      do
        v64 = __ldaxr(v63);
      while (__stlxr(v64 - 1, v63));
      if (!v64)
      {
        ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
        std::__shared_weak_count::__release_weak(v62);
      }
    }
    v27 = v104;
    if (!v104)
      goto LABEL_106;
    v65 = (unint64_t *)&v104->__shared_owners_;
    do
      v29 = __ldaxr(v65);
    while (__stlxr(v29 - 1, v65));
    goto LABEL_100;
  }
  if (v18 != 1)
    goto LABEL_102;
  v19 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v99 = *(_QWORD *)ptr;
  v100 = v19;
  if (v19)
  {
    v20 = (unint64_t *)&v19->__shared_owners_;
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
  v97 = v108;
  v98 = v109;
  if (v109)
  {
    v22 = (unint64_t *)&v109->__shared_owners_;
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }
  -[REPHASEContext prepareFileGroupType:phaseEntity:completion:](self, "prepareFileGroupType:phaseEntity:completion:", &v99, &v97, v10);
  v24 = v98;
  if (v98)
  {
    v25 = (unint64_t *)&v98->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = v100;
  if (v100)
  {
    v28 = (unint64_t *)&v100->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    goto LABEL_100;
  }
LABEL_106:
  v80 = v109;
  if (v109)
  {
    v81 = (unint64_t *)&v109->__shared_owners_;
    do
      v82 = __ldaxr(v81);
    while (__stlxr(v82 - 1, v81));
    if (!v82)
    {
      ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
      std::__shared_weak_count::__release_weak(v80);
    }
  }
  v83 = v111;
  if (v111)
  {
    v84 = (unint64_t *)&v111->__shared_owners_;
    do
      v85 = __ldaxr(v84);
    while (__stlxr(v85 - 1, v84));
    if (!v85)
    {
      ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
      std::__shared_weak_count::__release_weak(v83);
    }
  }

  v86 = v114;
  if (v114)
  {
    v87 = (unint64_t *)&v114->__shared_owners_;
    do
      v88 = __ldaxr(v87);
    while (__stlxr(v88 - 1, v87));
    if (!v88)
    {
      ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
      std::__shared_weak_count::__release_weak(v86);
    }
  }
  objc_destroyWeak(v113);
  objc_destroyWeak(&location);
}

void __26__REPHASEContext_prepare___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unsigned __int8 *v6;
  unsigned __int8 *WeakRetained;
  unsigned __int8 *v8;
  unsigned __int8 v9;
  re *v10;
  re *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  re *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  unsigned __int8 *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = atomic_load(WeakRetained + 20);
    if ((v9 & 1) == 0)
    {
      v10 = (re *)_Block_copy(*(const void **)(*(_QWORD *)(a1 + 48) + 352));
      v11 = v10;
      if (v10)
      {
        if (!v6)
        {
          if ((objc_msgSend(v8, "addEventIfStillPreparing:forToken:", v5, *(_QWORD *)(a1 + 40)) & 1) != 0)
          {
            (*((void (**)(re *, _QWORD))v11 + 2))(v11, 0);
            v6 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sound event was cleaned up before preparation completed for token=%llu"), *(_QWORD *)(a1 + 40));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)MEMORY[0x24BDD1540];
            v26 = *MEMORY[0x24BDD0FC8];
            v27 = v20;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.re.internal"), -200, v22);
            v6 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();

            v24 = *re::audioLogObjects(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v25 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = 134218242;
              v29 = v25;
              v30 = 2112;
              v31 = v6;
              _os_log_impl(&dword_224FE9000, v24, OS_LOG_TYPE_DEFAULT, "[REPHASEContext] [Prepare] token %llu couldn't add event: %@", buf, 0x16u);
            }
            (*((void (**)(re *, unsigned __int8 *))v11 + 2))(v11, v6);
            objc_msgSend(v5, "stopAndDestroy");
            objc_msgSend(v8, "clearPreparingStateForToken:", *(_QWORD *)(a1 + 40));
            objc_msgSend(v8, "decrementOrDestroyEntityWithZeroCount:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40));

          }
          goto LABEL_17;
        }
        v12 = *re::audioLogObjects(v10);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 134217984;
          v29 = v13;
          _os_log_impl(&dword_224FE9000, v12, OS_LOG_TYPE_DEFAULT, "[REPHASEContext] [Prepare] token %llu calling completion with error", buf, 0xCu);
        }
        (*((void (**)(re *, unsigned __int8 *))v11 + 2))(v11, v6);
      }
      else
      {
        v18 = *re::audioLogObjects(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 134217984;
          v29 = v19;
          _os_log_impl(&dword_224FE9000, v18, OS_LOG_TYPE_DEFAULT, "[REPHASEContext] [Prepare] prepare state for token %llu does not have completion handler", buf, 0xCu);
        }
      }
      objc_msgSend(v5, "stopAndDestroy");
      objc_msgSend(v8, "decrementOrDestroyEntityWithZeroCount:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40));
      objc_msgSend(v8, "clearPreparingStateForToken:", *(_QWORD *)(a1 + 40));
LABEL_17:

      goto LABEL_18;
    }
    v16 = *re::audioLogObjects((re *)WeakRetained);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v29 = v17;
      v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_224FE9000, v16, OS_LOG_TYPE_DEFAULT, "[REPHASEContext] [Prepare] token %llu, %@ stopped and destroyed before sound event prepared", buf, 0x16u);
    }
    objc_msgSend(v5, "stopAndDestroy");
    objc_msgSend(v8, "decrementOrDestroyEntityWithZeroCount:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40));
  }
  else
  {
    v14 = *re::audioLogObjects(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      v29 = v15;
      _os_log_impl(&dword_224FE9000, v14, OS_LOG_TYPE_DEFAULT, "[REPHASEContext] [Prepare] token %llu, dealloc'd before sound event preparation", buf, 0xCu);
    }
    objc_msgSend(v5, "stopAndDestroy");
  }
LABEL_18:

}

- (void)prepareExternalType:(shared_ptr<re:(shared_ptr<re:(id)a5 :audio::REPHASEEntity>)a4 :audio::REPHASESoundPrepareState>)a3 phaseEntity:completion:
{
  __shared_weak_count *cntrl;
  REPHASESoundPrepareState *ptr;
  REPHASEEntity *v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  re *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  re *v23;
  NSObject *v24;
  uint64_t v25;
  re *v26;
  NSObject *v27;
  void *v28;
  PHASEEngine *engine;
  uint64_t v30;
  PHASEListener *listener;
  uint64_t v32;
  int v33;
  __int128 v34;
  std::__shared_weak_count *v35;
  uint64_t v36;
  uint64_t v37;
  OS_dispatch_queue *phaseQueue;
  unint64_t *p_shared_owners;
  unint64_t v40;
  re *v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  uint64_t v45;
  re *v46;
  uint64_t v47;
  void *v48;
  REPHASEEntity *v49;
  _QWORD v50[4];
  re *v51;
  REPHASEEntity *v52;
  uint64_t v53;
  std::__shared_weak_count *v54;
  uint8_t buf[4];
  re *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  int v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  _BYTE v69[32];
  unsigned __int8 v70[8];
  uint64_t v71;
  char v72;
  BOOL v73;
  int v74;
  char v75;
  uint64_t v76;
  _QWORD v77[4];

  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v77[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4.var0;
  if (*(_QWORD *)(*(_QWORD *)ptr + 304))
  {
    *(_WORD *)v69 = 0;
    v69[2] = 0;
    *(_DWORD *)&v69[4] = 0;
    *(_DWORD *)&v69[8] = 0;
    *(_OWORD *)&v69[16] = xmmword_2260FDC00;
    v70[0] = 0;
    v73 = 0;
    v75 = 0;
    os_unfair_lock_lock(&self->_audioAssetsMutex.m_lock);
    v9 = *(_QWORD *)ptr;
    v10 = *(_QWORD *)(*(_QWORD *)ptr + 24);
    v11 = std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_, v10);
    if (v11)
    {
      v12 = v11;
      v13 = *(_OWORD *)(v11 + 5);
      *(_OWORD *)v69 = *(_OWORD *)(v11 + 3);
      *(_OWORD *)&v69[16] = v13;
      re::Optional<re::DynamicString>::operator=(v70, (unsigned __int8 *)v11 + 56);
      if (v73 || *((_BYTE *)v12 + 96))
      {
        if (!v73 || *((_BYTE *)v12 + 96))
        {
          if (!v73)
            v73 = *((_BYTE *)v12 + 96) != 0;
          v74 = *((_DWORD *)v12 + 25);
        }
        else
        {
          v73 = 0;
        }
      }
      v75 = *((_BYTE *)v12 + 104);
      os_unfair_lock_unlock(&self->_audioAssetsMutex.m_lock);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot prepare external stream UUID %@ (token=%llu) without configuration"), *(_QWORD *)(v9 + 304), v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BDD1540];
      v67 = *MEMORY[0x24BDD0FC8];
      v68 = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.re.internal"), -210, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_unlock(&self->_audioAssetsMutex.m_lock);
      if (v22)
      {
        v24 = *re::audioLogObjects(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v46 = *(re **)(*(_QWORD *)ptr + 24);
          *(_DWORD *)buf = 134218242;
          v56 = v46;
          v57 = 2112;
          v58 = v22;
          _os_log_error_impl(&dword_224FE9000, v24, OS_LOG_TYPE_ERROR, "[REPhaseContext] [Prepare] token %llu, error %@", buf, 0x16u);
        }
        (*((void (**)(REPHASEEntity *, _QWORD, void *))v8 + 2))(v8, 0, v22);
        goto LABEL_30;
      }
    }
    v25 = *(_QWORD *)ptr;
    *(_DWORD *)(v25 + 212) = *(_DWORD *)&v69[8];
    *(_QWORD *)(v25 + 216) = *(_QWORD *)&v69[16];
    v49 = v8;
    -[REPHASEContext baseMixerDefinitionWith:](self, "baseMixerDefinitionWith:", ptr);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (re *)*(id *)(*(_QWORD *)ptr + 304);
    v27 = *re::audioLogObjects(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(void **)(*(_QWORD *)ptr + 24);
      *(_DWORD *)buf = 138413570;
      v56 = v26;
      v57 = 2048;
      v58 = v28;
      v59 = 1024;
      v60 = *(_DWORD *)&v69[4];
      v61 = 2048;
      v62 = *(_QWORD *)&v69[24];
      v63 = 1024;
      v64 = *(_DWORD *)&v69[8];
      v65 = 2048;
      v66 = *(_QWORD *)&v69[16];
      _os_log_impl(&dword_224FE9000, v27, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [Prepare] creating controller for external stream %@ (token=%llu) with normalizationMode=%d, targetLUFS=%0.2f, calibrationMode=%d, calibrationLevel=%0.2f", buf, 0x36u);
    }
    engine = self->_engine;
    v30 = *(_QWORD *)(*(_QWORD *)cntrl + 16);
    listener = self->_listener;
    v32 = *(unsigned int *)&v69[4];
    v33 = *(_DWORD *)&v69[8];
    v34 = *(_OWORD *)&v69[16];
    v36 = *(_QWORD *)ptr;
    v35 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
    v37 = *(_QWORD *)(*(_QWORD *)ptr + 16);
    phaseQueue = self->_phaseQueue;
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3321888768;
    v50[2] = __61__REPHASEContext_prepareExternalType_phaseEntity_completion___block_invoke;
    v50[3] = &unk_24ED3D1A8;
    v53 = v36;
    v54 = v35;
    if (v35)
    {
      p_shared_owners = (unint64_t *)&v35->__shared_owners_;
      do
        v40 = __ldxr(p_shared_owners);
      while (__stxr(v40 + 1, p_shared_owners));
    }
    v52 = v49;
    v41 = v26;
    v51 = v41;
    LODWORD(v47) = v33;
    +[REPHASESoundEvent eventWithEngine:streamUUID:mixerDefinition:source:listener:normalizationMode:targetLUFS:calibrationMode:calibrationLevel:audioSession:phaseQueue:callback:](REPHASESoundEvent, "eventWithEngine:streamUUID:mixerDefinition:source:listener:normalizationMode:targetLUFS:calibrationMode:calibrationLevel:audioSession:phaseQueue:callback:", engine, v41, v48, v30, listener, v32, *((double *)&v34 + 1), *(double *)&v34, v47, v37, phaseQueue, v50, &v53);

    v8 = v49;
    v42 = v54;
    if (v54)
    {
      v43 = (unint64_t *)&v54->__shared_owners_;
      do
        v44 = __ldaxr(v43);
      while (__stlxr(v44 - 1, v43));
      if (!v44)
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
    }

    v22 = 0;
LABEL_30:

    if (v70[0] && v71 && (v72 & 1) != 0)
      (*(void (**)(void))(*(_QWORD *)v71 + 40))();
    goto LABEL_34;
  }
  v14 = (void *)MEMORY[0x24BDD1540];
  v76 = *MEMORY[0x24BDD0FC8];
  v77[0] = CFSTR("Could not prepare PHASESoundEvent for external stream. Invalid UUID");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.re.internal"), -210, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *re::audioLogObjects(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v45 = *(_QWORD *)(*(_QWORD *)ptr + 24);
    *(_DWORD *)v69 = 134218242;
    *(_QWORD *)&v69[4] = v45;
    *(_WORD *)&v69[12] = 2112;
    *(_QWORD *)&v69[14] = v16;
    _os_log_error_impl(&dword_224FE9000, v18, OS_LOG_TYPE_ERROR, "[REPhaseContext] [Prepare] token %llu, error %@", v69, 0x16u);
  }
  (*((void (**)(REPHASEEntity *, _QWORD, void *))v8 + 2))(v8, 0, v16);

LABEL_34:
}

void __61__REPHASEContext_prepareExternalType_phaseEntity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  re *v6;
  NSObject *v7;
  uint64_t v8;
  re *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  re *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *re::audioLogObjects(v6);
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24);
      *(_DWORD *)buf = 134218242;
      v23 = v16;
      v24 = 2112;
      v25 = v6;
      _os_log_error_impl(&dword_224FE9000, v7, OS_LOG_TYPE_ERROR, "[REPhaseContext] [Prepare] token %llu, error %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(re **)(*(_QWORD *)(a1 + 48) + 24);
      *(_DWORD *)buf = 138412546;
      v23 = v8;
      v24 = 2048;
      v25 = v9;
      _os_log_impl(&dword_224FE9000, v7, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [Prepare] Successfully created controller for external stream %@ (token=%llu). Preparing.", buf, 0x16u);
    }
    v10 = *(std::__shared_weak_count **)(a1 + 56);
    v20 = *(_QWORD *)(a1 + 48);
    v21 = v10;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
    }
    objc_msgSend(v5, "setPrepareState:", &v20);
    v13 = v21;
    if (v21)
    {
      v14 = (unint64_t *)&v21->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __61__REPHASEContext_prepareExternalType_phaseEntity_completion___block_invoke_57;
    v17[3] = &unk_24ED3D1E0;
    v18 = v5;
    v19 = *(id *)(a1 + 40);
    objc_msgSend(v18, "prepareWithCompletion:", v17);

  }
}

void __61__REPHASEContext_prepareExternalType_phaseEntity_completion___block_invoke_57(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "resume");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)prepareFileGroupType:(shared_ptr<re:(shared_ptr<re:(id)a5 :audio::REPHASEEntity>)a4 :audio::REPHASESoundPrepareState>)a3 phaseEntity:completion:
{
  __shared_weak_count *cntrl;
  REPHASESoundPrepareState *ptr;
  __shared_weak_count *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  __shared_weak_count *v15;
  void *v16;
  void *v17;
  id v18;
  REPHASESoundEvent *v19;
  PHASEEngine *engine;
  uint64_t v21;
  PHASEListener *listener;
  uint64_t v23;
  OS_dispatch_queue *phaseQueue;
  REPHASESoundEvent *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  re *v35;
  int v36;
  NSObject *v37;
  _BOOL8 v38;
  uint64_t v39;
  NSObject *v40;
  _BOOL8 v41;
  uint64_t v42;
  void **v43;
  NSObject *v44;
  uint64_t v45;
  void **v46;
  const char *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  _BOOL8 v60;
  uint64_t v61;
  void **v62;
  uint64_t v63;
  void **v64;
  std::__shared_weak_count *v65;
  unint64_t *p_shared_owners;
  unint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  REPHASEEntity *v77;
  void (**v78)(_QWORD, _QWORD);
  id v79;
  void *v80;
  _QWORD v81[4];
  REPHASESoundEvent *v82;
  REPHASEEntity *v83;
  uint64_t v84;
  std::__shared_weak_count *v85;
  void *__p[2];
  char v87;
  void *v88[2];
  char v89;
  id v90;
  id v91;
  _BYTE buf[32];
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD v97[2];
  uint64_t v98;
  _QWORD v99[4];

  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v99[1] = *MEMORY[0x24BDAC8D0];
  v77 = a4.var0;
  v79 = objc_alloc_init(MEMORY[0x24BDE32A8]);
  objc_msgSend(v79, "setUniqueSelectionQueueLength:", *(_QWORD *)(*(_QWORD *)ptr + 80) - *(_QWORD *)(*(_QWORD *)ptr + 72) > 8uLL);
  -[REPHASEContext baseMixerDefinitionWith:](self, "baseMixerDefinitionWith:", ptr);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = cntrl;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", (uint64_t)(*(_QWORD *)(*(_QWORD *)ptr + 80) - *(_QWORD *)(*(_QWORD *)ptr + 72)) >> 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD **)(*(_QWORD *)ptr + 72);
  v11 = *(_QWORD **)(*(_QWORD *)ptr + 80);
  if (v10 == v11)
  {
LABEL_4:
    v15 = v8;
    -[REPHASEContext mixerParametersForPrepareState:source:listener:mixerIdentifiers:](self, "mixerParametersForPrepareState:source:listener:mixerIdentifiers:", ptr, *(_QWORD *)(*(_QWORD *)v8 + 16), self->_listener, v9);
    v78 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v16 = v79;
    -[PHASEEngine assetRegistry](self->_engine, "assetRegistry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0;
    objc_msgSend(v17, "registerSoundEventAssetWithRootNode:identifier:error:", v79, 0, &v91);
    v76 = objc_claimAutoreleasedReturnValue();
    v18 = v91;

    v19 = [REPHASESoundEvent alloc];
    engine = self->_engine;
    v21 = *(_QWORD *)(*(_QWORD *)v15 + 16);
    listener = self->_listener;
    v23 = *(_QWORD *)(*(_QWORD *)ptr + 16);
    phaseQueue = self->_phaseQueue;
    v90 = v18;
    v25 = -[REPHASESoundEvent initWithEngine:soundEventAsset:source:listener:mixerParameters:audioSession:phaseQueue:outError:](v19, "initWithEngine:soundEventAsset:source:listener:mixerParameters:audioSession:phaseQueue:outError:", engine, v76, v21, listener, v78, v23, phaseQueue, &v90);
    v26 = v90;

    if (!v25)
    {
      if (v26)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v26);
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)MEMORY[0x24BDD1540];
        v55 = *MEMORY[0x24BDD0FC8];
        v97[0] = v53;
        v56 = *MEMORY[0x24BDD1398];
        v95 = v55;
        v96 = v56;
        v57 = v26;
      }
      else
      {
        v54 = (void *)MEMORY[0x24BDD1540];
        v53 = CFSTR("Could not create PHASESoundEvent for file group.");
        v71 = *MEMORY[0x24BDD1398];
        v95 = *MEMORY[0x24BDD0FC8];
        v96 = v71;
        v97[0] = CFSTR("Could not create PHASESoundEvent for file group.");
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v97[1] = v57;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v97, &v95, 2);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("com.apple.re.internal"), -200, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      (*((void (**)(REPHASEEntity *, _QWORD, void *))v77 + 2))(v77, 0, v73);

      goto LABEL_48;
    }
    -[PHASEListener worldTransform](self->_listener, "worldTransform");
    *(_OWORD *)buf = v27;
    *(_OWORD *)&buf[16] = v28;
    v93 = v29;
    v94 = v30;
    re::audio::stringFromPose((re::audio *)buf, v88);
    objc_msgSend(*(id *)(*(_QWORD *)v15 + 16), "worldTransform");
    *(_OWORD *)buf = v31;
    *(_OWORD *)&buf[16] = v32;
    v93 = v33;
    v94 = v34;
    v35 = (re *)re::audio::stringFromPose((re::audio *)buf, __p);
    v36 = *(unsigned __int8 *)(*(_QWORD *)ptr + 208);
    v37 = *re::audioLogObjects(v35);
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    if (v36)
    {
      if (v38)
      {
        v39 = *(_QWORD *)(*(_QWORD *)ptr + 24);
        *(_DWORD *)buf = 134218243;
        *(_QWORD *)&buf[4] = v39;
        *(_WORD *)&buf[12] = 2117;
        *(_QWORD *)&buf[14] = v25;
        _os_log_impl(&dword_224FE9000, v37, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [prepareFileGroup] Created sound event for token %llu (file): %{sensitive}@", buf, 0x16u);
      }
      v40 = *re::audioLogObjects((re *)v38);
      v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
      if (v41)
      {
        v42 = *(_QWORD *)(*(_QWORD *)ptr + 24);
        v43 = v88;
        if (v89 < 0)
          v43 = (void **)v88[0];
        *(_DWORD *)buf = 134218243;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2085;
        *(_QWORD *)&buf[14] = v43;
        _os_log_impl(&dword_224FE9000, v40, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [prepareFileGroup] Created sound event for token %llu (file): Listener = %{sensitive}s", buf, 0x16u);
      }
      v44 = *re::audioLogObjects((re *)v41);
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      v45 = *(_QWORD *)(*(_QWORD *)ptr + 24);
      v46 = __p;
      if (v87 < 0)
        v46 = (void **)__p[0];
      *(_DWORD *)buf = 134218243;
      *(_QWORD *)&buf[4] = v45;
      *(_WORD *)&buf[12] = 2085;
      *(_QWORD *)&buf[14] = v46;
      v47 = "[REPhaseContext] [prepareFileGroup] Created sound event for token %llu (file): Position = %{sensitive}s";
    }
    else
    {
      if (v38)
      {
        v58 = *(_QWORD *)(*(_QWORD *)ptr + 24);
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v58;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v25;
        _os_log_impl(&dword_224FE9000, v37, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [prepareFileGroup] Created sound event for token %llu (file): %@", buf, 0x16u);
      }
      v59 = *re::audioLogObjects((re *)v38);
      v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
      if (v60)
      {
        v61 = *(_QWORD *)(*(_QWORD *)ptr + 24);
        v62 = v88;
        if (v89 < 0)
          v62 = (void **)v88[0];
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v61;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v62;
        _os_log_impl(&dword_224FE9000, v59, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [prepareFileGroup] Created sound event for token %llu (file): Listener = %s", buf, 0x16u);
      }
      v44 = *re::audioLogObjects((re *)v60);
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      v63 = *(_QWORD *)(*(_QWORD *)ptr + 24);
      v64 = __p;
      if (v87 < 0)
        v64 = (void **)__p[0];
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v63;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v64;
      v47 = "[REPhaseContext] [prepareFileGroup] Created sound event for token %llu (file): Position = %s";
    }
    _os_log_impl(&dword_224FE9000, v44, OS_LOG_TYPE_DEFAULT, v47, buf, 0x16u);
LABEL_32:
    v65 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
    v84 = *(_QWORD *)ptr;
    v85 = v65;
    if (v65)
    {
      p_shared_owners = (unint64_t *)&v65->__shared_owners_;
      do
        v67 = __ldxr(p_shared_owners);
      while (__stxr(v67 + 1, p_shared_owners));
    }
    -[REPHASESoundEvent setPrepareState:](v25, "setPrepareState:", &v84);
    v68 = v85;
    if (v85)
    {
      v69 = (unint64_t *)&v85->__shared_owners_;
      do
        v70 = __ldaxr(v69);
      while (__stlxr(v70 - 1, v69));
      if (!v70)
      {
        ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
        std::__shared_weak_count::__release_weak(v68);
      }
    }
    v81[0] = MEMORY[0x24BDAC760];
    v81[1] = 3221225472;
    v81[2] = __62__REPHASEContext_prepareFileGroupType_phaseEntity_completion___block_invoke;
    v81[3] = &unk_24ED3D1E0;
    v83 = v77;
    v82 = v25;
    -[REPHASESoundEvent prepareWithCompletion:](v82, "prepareWithCompletion:", v81);

    if (v87 < 0)
      operator delete(__p[0]);
    if (v89 < 0)
      operator delete(v88[0]);
LABEL_48:

    v51 = (void *)v76;
    goto LABEL_49;
  }
  while (1)
  {
    -[REPHASEContext samplerDefForFileAsset:mixerDefinition:prepareState:](self, "samplerDefForFileAsset:mixerDefinition:prepareState:", *v10, v80, ptr);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      break;
    objc_msgSend(v79, "addSubtree:weight:", v12, &unk_24EDB7A30);
    objc_msgSend(v12, "mixerDefinition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v14);
    if (++v10 == v11)
      goto LABEL_4;
  }
  v48 = *re::audioLogObjects(0);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    v74 = *(_QWORD *)(*(_QWORD *)ptr + 64);
    v75 = *(_QWORD *)(*(_QWORD *)ptr + 24);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v74;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v75;
    _os_log_error_impl(&dword_224FE9000, v48, OS_LOG_TYPE_ERROR, "[REPhaseContext] [Prepare] Error creating sampler definition for asset: %llu and token: %llu. Sound event will not be prepared.", buf, 0x16u);
  }
  v78 = (void (**)(_QWORD, _QWORD))_Block_copy(*(const void **)(*(_QWORD *)ptr + 352));
  v16 = v79;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error creating sampler definition for asset: %llu. Sound event will not be prepared."), *(_QWORD *)(*(_QWORD *)ptr + 64));
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)MEMORY[0x24BDD1540];
  v98 = *MEMORY[0x24BDD0FC8];
  v99[0] = v49;
  v51 = (void *)v49;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v99, &v98, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.re.internal"), -110, v52);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, id))v78)[2](v78, v26);
LABEL_49:

}

uint64_t __62__REPHASEContext_prepareFileGroupType_phaseEntity_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (void)prepareGeneratorType:(shared_ptr<re:(shared_ptr<re:(id)a5 :audio::REPHASEEntity>)a4 :audio::REPHASESoundPrepareState>)a3 phaseEntity:completion:
{
  __shared_weak_count *cntrl;
  REPHASESoundPrepareState *ptr;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  re *v11;
  NSObject *v12;
  std::string::size_type v13;
  std::string::size_type v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  std::string *p_buf;
  void *v23;
  void *v24;
  PHASEEngine *engine;
  void *v26;
  uint64_t v27;
  PHASEListener *listener;
  uint64_t v29;
  OS_dispatch_queue *phaseQueue;
  REPHASEEntity *v31;
  std::__shared_weak_count *v32;
  uint64_t v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  REPHASEEntity *v43;
  void *v44;
  _QWORD v45[4];
  REPHASEEntity *v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  void *v49[2];
  char v50;
  std::string buf;
  uint64_t v52;

  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v52 = *MEMORY[0x24BDAC8D0];
  v43 = a4.var0;
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB17E8]), "initWithLayoutTag:", *(unsigned int *)(*(_QWORD *)ptr + 184));
  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initStandardFormatWithSampleRate:channelLayout:", v44, self->_sampleRate);
  v9 = *(void **)(*(_QWORD *)ptr + 104);
  *(_QWORD *)(*(_QWORD *)ptr + 104) = v8;

  v10 = *(_QWORD *)ptr;
  *(_DWORD *)(v10 + 212) = 0;
  *(_QWORD *)(v10 + 216) = 0x3FF0000000000000;
  v12 = *re::audioLogObjects(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(*(_QWORD *)ptr + 304);
    v14 = *(_QWORD *)(*(_QWORD *)ptr + 24);
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412546;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v13;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v14;
    _os_log_impl(&dword_224FE9000, v12, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [Prepare] Creating external stream %@ (token=%llu)", (uint8_t *)&buf, 0x16u);
  }
  v15 = *(_QWORD *)ptr;
  if (*(_BYTE *)(*(_QWORD *)ptr + 296))
  {
    -[REPHASEContext baseMixerDefinitionWith:](self, "baseMixerDefinitionWith:", ptr);
    v16 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)ptr;
  }
  else
  {
    v16 = 0;
  }
  if (*(_BYTE *)(v15 + 272))
  {
    v17 = (char *)(v15 + 248);
    if (*(char *)(v15 + 271) < 0)
      v17 = *(char **)v17;
    v18 = *(_QWORD *)(v15 + 32);
    v19 = *(_QWORD *)(v15 + 48);
    std::string::basic_string[abi:ne180100]<0>(v49, v17);
    REAudioComputePHASEMixGroupID(v18, v19, (uint64_t)v49, &buf);
    if (v50 < 0)
      operator delete(v49[0]);
    -[REPHASEContext engine](self, "engine");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "groups");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_buf = &buf;
    else
      p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", p_buf);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    v15 = *(_QWORD *)ptr;
  }
  else
  {
    v24 = 0;
  }
  engine = self->_engine;
  v41 = *(_QWORD *)(v15 + 104);
  v42 = *(_QWORD *)(v15 + 304);
  v39 = *(_QWORD *)(v15 + 288);
  v40 = *(_QWORD *)(v15 + 280);
  v26 = (void *)v16;
  if (*(_BYTE *)(v15 + 296))
  {
    v27 = *(_QWORD *)(*(_QWORD *)cntrl + 16);
    listener = self->_listener;
  }
  else
  {
    v27 = 0;
    listener = 0;
  }
  v29 = *(_QWORD *)(v15 + 16);
  phaseQueue = self->_phaseQueue;
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3321888768;
  v45[2] = __62__REPHASEContext_prepareGeneratorType_phaseEntity_completion___block_invoke;
  v45[3] = &unk_24ED3D208;
  v31 = v43;
  v33 = *(_QWORD *)ptr;
  v32 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v46 = v31;
  v47 = v33;
  v48 = v32;
  if (v32)
  {
    p_shared_owners = (unint64_t *)&v32->__shared_owners_;
    do
      v35 = __ldxr(p_shared_owners);
    while (__stxr(v35 + 1, p_shared_owners));
  }
  +[REPHASESoundEvent eventWithEngine:streamUUID:maximumFramesToRender:audioFormat:audioUnit:renderBlock:mixerDefinition:source:listener:group:normalizationMode:calibrationMode:calibrationLevel:audioSession:phaseQueue:callback:](REPHASESoundEvent, "eventWithEngine:streamUUID:maximumFramesToRender:audioFormat:audioUnit:renderBlock:mixerDefinition:source:listener:group:normalizationMode:calibrationMode:calibrationLevel:audioSession:phaseQueue:callback:", engine, v42, 4096, v41, v40, v39, 1.0, v26, v27, listener, v24, 0, v29, phaseQueue, v45);
  v36 = v48;
  if (v48)
  {
    v37 = (unint64_t *)&v48->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }

}

void __62__REPHASEContext_prepareGeneratorType_phaseEntity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BDD1398];
    v31[0] = *MEMORY[0x24BDD0FC8];
    v31[1] = v9;
    v32[0] = v7;
    v32[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.re.internal"), -200, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *re::audioLogObjects(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(v13 + 304);
      v15 = *(_QWORD *)(v13 + 24);
      *(_DWORD *)buf = 138412546;
      v28 = v14;
      v29 = 2048;
      v30 = v15;
      _os_log_impl(&dword_224FE9000, v12, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [Prepare] Successfully created external stream %@ (token=%llu). Preparing.", buf, 0x16u);
    }
    v16 = *(std::__shared_weak_count **)(a1 + 48);
    v25 = *(_QWORD *)(a1 + 40);
    v26 = v16;
    if (v16)
    {
      p_shared_owners = (unint64_t *)&v16->__shared_owners_;
      do
        v18 = __ldxr(p_shared_owners);
      while (__stxr(v18 + 1, p_shared_owners));
    }
    objc_msgSend(v5, "setPrepareState:", &v25);
    v19 = v26;
    if (v26)
    {
      v20 = (unint64_t *)&v26->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __62__REPHASEContext_prepareGeneratorType_phaseEntity_completion___block_invoke_73;
    v22[3] = &unk_24ED3D1E0;
    v24 = *(id *)(a1 + 32);
    v23 = v5;
    objc_msgSend(v23, "prepareWithCompletion:", v22);

    v11 = v24;
  }

}

uint64_t __62__REPHASEContext_prepareGeneratorType_phaseEntity_completion___block_invoke_73(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (void)prepareFileType:(shared_ptr<re:(shared_ptr<re:(id)a5 :audio::REPHASEEntity>)a4 :audio::REPHASESoundPrepareState>)a3 phaseEntity:completion:
{
  __shared_weak_count *cntrl;
  REPHASESoundPrepareState *ptr;
  void *v8;
  void *v9;
  uint64_t v10;
  PHASEListener *listener;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  void *v17;
  id v18;
  REPHASESoundEvent *v19;
  PHASEEngine *engine;
  uint64_t v21;
  PHASEListener *v22;
  uint64_t v23;
  OS_dispatch_queue *phaseQueue;
  REPHASESoundEvent *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  re *v35;
  int v36;
  NSObject *v37;
  _BOOL8 v38;
  uint64_t v39;
  NSObject *v40;
  _BOOL8 v41;
  uint64_t v42;
  void **v43;
  NSObject *v44;
  uint64_t v45;
  void **v46;
  const char *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  __CFString *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  _BOOL8 v58;
  uint64_t v59;
  void **v60;
  uint64_t v61;
  void **v62;
  std::__shared_weak_count *v63;
  unint64_t *p_shared_owners;
  unint64_t v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  REPHASEEntity *v74;
  _QWORD v75[4];
  REPHASESoundEvent *v76;
  REPHASEEntity *v77;
  uint64_t v78;
  std::__shared_weak_count *v79;
  void *__p[2];
  char v81;
  void *v82[2];
  char v83;
  id v84;
  id v85;
  _BYTE buf[32];
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD v91[2];
  void *v92;
  uint64_t v93;
  _QWORD v94[4];

  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v94[1] = *MEMORY[0x24BDAC8D0];
  v74 = a4.var0;
  -[REPHASEContext samplerDefForFileAsset:with:](self, "samplerDefForFileAsset:with:", *(_QWORD *)(*(_QWORD *)ptr + 64), ptr);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = *(_QWORD *)(*(_QWORD *)cntrl + 16);
    listener = self->_listener;
    objc_msgSend(v8, "mixerDefinition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v92, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[REPHASEContext mixerParametersForPrepareState:source:listener:mixerIdentifiers:](self, "mixerParametersForPrepareState:source:listener:mixerIdentifiers:", ptr, v10, listener, v14);
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    -[PHASEEngine assetRegistry](self->_engine, "assetRegistry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = 0;
    objc_msgSend(v16, "registerSoundEventAssetWithRootNode:identifier:error:", v9, 0, &v85);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v85;

    v19 = [REPHASESoundEvent alloc];
    engine = self->_engine;
    v21 = *(_QWORD *)(*(_QWORD *)cntrl + 16);
    v22 = self->_listener;
    v23 = *(_QWORD *)(*(_QWORD *)ptr + 16);
    phaseQueue = self->_phaseQueue;
    v84 = v18;
    v25 = -[REPHASESoundEvent initWithEngine:soundEventAsset:source:listener:mixerParameters:audioSession:phaseQueue:outError:](v19, "initWithEngine:soundEventAsset:source:listener:mixerParameters:audioSession:phaseQueue:outError:", engine, v17, v21, v22, v15, v23, phaseQueue, &v84);
    v26 = v84;

    if (!v25)
    {
      if (v26)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v26);
        v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)MEMORY[0x24BDD1540];
        v53 = *MEMORY[0x24BDD0FC8];
        v91[0] = v51;
        v54 = *MEMORY[0x24BDD1398];
        v89 = v53;
        v90 = v54;
        v55 = v26;
      }
      else
      {
        v52 = (void *)MEMORY[0x24BDD1540];
        v51 = CFSTR("Could not create PHASESoundEvent for file.");
        v69 = *MEMORY[0x24BDD1398];
        v89 = *MEMORY[0x24BDD0FC8];
        v90 = v69;
        v91[0] = CFSTR("Could not create PHASESoundEvent for file.");
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v91[1] = v55;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, &v89, 2);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("com.apple.re.internal"), -200, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      (*((void (**)(REPHASEEntity *, _QWORD, void *))v74 + 2))(v74, 0, v71);

      goto LABEL_46;
    }
    -[PHASEListener worldTransform](self->_listener, "worldTransform");
    *(_OWORD *)buf = v27;
    *(_OWORD *)&buf[16] = v28;
    v87 = v29;
    v88 = v30;
    re::audio::stringFromPose((re::audio *)buf, v82);
    objc_msgSend(*(id *)(*(_QWORD *)cntrl + 16), "worldTransform");
    *(_OWORD *)buf = v31;
    *(_OWORD *)&buf[16] = v32;
    v87 = v33;
    v88 = v34;
    v35 = (re *)re::audio::stringFromPose((re::audio *)buf, __p);
    v36 = *(unsigned __int8 *)(*(_QWORD *)ptr + 208);
    v37 = *re::audioLogObjects(v35);
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    if (v36)
    {
      if (v38)
      {
        v39 = *(_QWORD *)(*(_QWORD *)ptr + 24);
        *(_DWORD *)buf = 134218243;
        *(_QWORD *)&buf[4] = v39;
        *(_WORD *)&buf[12] = 2117;
        *(_QWORD *)&buf[14] = v25;
        _os_log_impl(&dword_224FE9000, v37, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [prepareFile] Created sound event for token %llu (file): %{sensitive}@", buf, 0x16u);
      }
      v40 = *re::audioLogObjects((re *)v38);
      v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
      if (v41)
      {
        v42 = *(_QWORD *)(*(_QWORD *)ptr + 24);
        v43 = v82;
        if (v83 < 0)
          v43 = (void **)v82[0];
        *(_DWORD *)buf = 134218243;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2085;
        *(_QWORD *)&buf[14] = v43;
        _os_log_impl(&dword_224FE9000, v40, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [prepareFile] Created sound event for token %llu (file): Listener = %{sensitive}s", buf, 0x16u);
      }
      v44 = *re::audioLogObjects((re *)v41);
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      v45 = *(_QWORD *)(*(_QWORD *)ptr + 24);
      v46 = __p;
      if (v81 < 0)
        v46 = (void **)__p[0];
      *(_DWORD *)buf = 134218243;
      *(_QWORD *)&buf[4] = v45;
      *(_WORD *)&buf[12] = 2085;
      *(_QWORD *)&buf[14] = v46;
      v47 = "[REPhaseContext] [prepareFile] Created sound event for token %llu (file): Position = %{sensitive}s";
    }
    else
    {
      if (v38)
      {
        v56 = *(_QWORD *)(*(_QWORD *)ptr + 24);
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v56;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v25;
        _os_log_impl(&dword_224FE9000, v37, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [prepareFile] Created sound event for token %llu (file): %@", buf, 0x16u);
      }
      v57 = *re::audioLogObjects((re *)v38);
      v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
      if (v58)
      {
        v59 = *(_QWORD *)(*(_QWORD *)ptr + 24);
        v60 = v82;
        if (v83 < 0)
          v60 = (void **)v82[0];
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v59;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v60;
        _os_log_impl(&dword_224FE9000, v57, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [prepareFile] Created sound event for token %llu (file): Listener = %s", buf, 0x16u);
      }
      v44 = *re::audioLogObjects((re *)v58);
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      v61 = *(_QWORD *)(*(_QWORD *)ptr + 24);
      v62 = __p;
      if (v81 < 0)
        v62 = (void **)__p[0];
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v61;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v62;
      v47 = "[REPhaseContext] [prepareFile] Created sound event for token %llu (file): Position = %s";
    }
    _os_log_impl(&dword_224FE9000, v44, OS_LOG_TYPE_DEFAULT, v47, buf, 0x16u);
LABEL_30:
    v63 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
    v78 = *(_QWORD *)ptr;
    v79 = v63;
    if (v63)
    {
      p_shared_owners = (unint64_t *)&v63->__shared_owners_;
      do
        v65 = __ldxr(p_shared_owners);
      while (__stxr(v65 + 1, p_shared_owners));
    }
    -[REPHASESoundEvent setPrepareState:](v25, "setPrepareState:", &v78);
    v66 = v79;
    if (v79)
    {
      v67 = (unint64_t *)&v79->__shared_owners_;
      do
        v68 = __ldaxr(v67);
      while (__stlxr(v68 - 1, v67));
      if (!v68)
      {
        ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
        std::__shared_weak_count::__release_weak(v66);
      }
    }
    v75[0] = MEMORY[0x24BDAC760];
    v75[1] = 3221225472;
    v75[2] = __57__REPHASEContext_prepareFileType_phaseEntity_completion___block_invoke;
    v75[3] = &unk_24ED3D1E0;
    v77 = v74;
    v76 = v25;
    -[REPHASESoundEvent prepareWithCompletion:](v76, "prepareWithCompletion:", v75);

    if (v81 < 0)
      operator delete(__p[0]);
    if (v83 < 0)
      operator delete(v82[0]);
LABEL_46:

    goto LABEL_47;
  }
  v48 = *re::audioLogObjects(0);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    v72 = *(_QWORD *)(*(_QWORD *)ptr + 64);
    v73 = *(_QWORD *)(*(_QWORD *)ptr + 24);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v72;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v73;
    _os_log_error_impl(&dword_224FE9000, v48, OS_LOG_TYPE_ERROR, "[REPhaseContext] [Prepare] Error creating sampler definition for asset: %llu and token: %llu. Sound event will not be prepared.", buf, 0x16u);
  }
  v15 = (void (**)(_QWORD, _QWORD))_Block_copy(*(const void **)(*(_QWORD *)ptr + 352));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error creating sampler definition for asset %llu. Sound event will not be prepared."), *(_QWORD *)(*(_QWORD *)ptr + 64));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)MEMORY[0x24BDD1540];
  v93 = *MEMORY[0x24BDD0FC8];
  v94[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v94, &v93, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("com.apple.re.internal"), -110, v50);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, id))v15)[2](v15, v26);
LABEL_47:

}

uint64_t __57__REPHASEContext_prepareFileType_phaseEntity_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (id)eventFor:(unint64_t)a3
{
  UnfairLock *p_soundEventsMutex;
  _QWORD *v6;
  id v7;

  p_soundEventsMutex = &self->_soundEventsMutex;
  os_unfair_lock_lock(&self->_soundEventsMutex.m_lock);
  v6 = std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v6)
    v7 = (id)v6[3];
  else
    v7 = 0;
  os_unfair_lock_unlock(&p_soundEventsMutex->m_lock);
  return v7;
}

- (BOOL)eventBeingPrepared:(unint64_t)a3
{
  UnfairLock *p_soundEventsPreparingMutex;

  p_soundEventsPreparingMutex = &self->_soundEventsPreparingMutex;
  os_unfair_lock_lock(&self->_soundEventsPreparingMutex.m_lock);
  LOBYTE(a3) = std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_, a3) != 0;
  os_unfair_lock_unlock(&p_soundEventsPreparingMutex->m_lock);
  return a3;
}

- (unint64_t)uniqueEventCount
{
  UnfairLock *p_soundEventsMutex;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundEvent *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundEvent *>, void *>>> *i;
  UnfairLock *p_soundEventsPreparingMutex;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, RESoundEventPreparingData>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, RESoundEventPreparingData>, void *>>> *j;
  unint64_t v7;
  __int128 v9;
  __int128 v10;
  int v11;

  v9 = 0u;
  v10 = 0u;
  v11 = 1065353216;
  p_soundEventsMutex = &self->_soundEventsMutex;
  os_unfair_lock_lock(&self->_soundEventsMutex.m_lock);
  for (i = &self->_soundEvents.__table_.__p1_;
        ;
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)&v9, (unint64_t *)&i[2], &i[2].__value_.__next_))
  {
    i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundEvent *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundEvent *>, void *>>> *)i->__value_.__next_;
    if (!i)
      break;
  }
  os_unfair_lock_unlock(&p_soundEventsMutex->m_lock);
  p_soundEventsPreparingMutex = &self->_soundEventsPreparingMutex;
  os_unfair_lock_lock(&self->_soundEventsPreparingMutex.m_lock);
  for (j = &self->_soundEventsPreparing.__table_.__p1_;
        ;
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)&v9, (unint64_t *)&j[2], &j[2].__value_.__next_))
  {
    j = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, RESoundEventPreparingData>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, RESoundEventPreparingData>, void *>>> *)j->__value_.__next_;
    if (!j)
      break;
  }
  os_unfair_lock_unlock(&p_soundEventsPreparingMutex->m_lock);
  v7 = *((_QWORD *)&v10 + 1);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned short>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned short>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned short>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned short>>>::~__hash_table((uint64_t)&v9);
  return v7;
}

- (unsigned)getPlayingSoundEventsCount
{
  UnfairLock *p_soundEventsMutex;
  id *next;
  unsigned int v5;

  p_soundEventsMutex = &self->_soundEventsMutex;
  os_unfair_lock_lock(&self->_soundEventsMutex.m_lock);
  next = (id *)self->_soundEvents.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v5 = 0;
    do
    {
      if (objc_msgSend(next[3], "state") == 1)
        ++v5;
      next = (id *)*next;
    }
    while (next);
  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(&p_soundEventsMutex->m_lock);
  return v5;
}

- (unsigned)getPreparingSoundEventsCount
{
  REPHASEContext *v2;
  UnfairLock *p_soundEventsPreparingMutex;

  v2 = self;
  p_soundEventsPreparingMutex = &self->_soundEventsPreparingMutex;
  os_unfair_lock_lock(&self->_soundEventsPreparingMutex.m_lock);
  LODWORD(v2) = v2->_soundEventsPreparing.__table_.__p2_.__value_;
  os_unfair_lock_unlock(&p_soundEventsPreparingMutex->m_lock);
  return v2;
}

- (unordered_set<unsigned)playbackClientsWithPreparedOrPreparingSounds
{
  UnfairLock *p_soundEventsMutex;
  _QWORD *i;
  void *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  UnfairLock *p_soundEventsPreparingMutex;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, RESoundEventPreparingData>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, RESoundEventPreparingData>, void *>>> *j;
  unordered_set<unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<unsigned long long>> *result;
  uint64_t v14;
  std::__shared_weak_count *v15;

  retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
  retstr->var0.var3.var0 = 1.0;
  p_soundEventsMutex = &self->_soundEventsMutex;
  os_unfair_lock_lock(&self->_soundEventsMutex.m_lock);
  for (i = self->_soundEvents.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    v7 = (void *)i[3];
    if (v7)
    {
      objc_msgSend(v7, "prepareState");
      v8 = v14;
    }
    else
    {
      v8 = 0;
      v14 = 0;
      v15 = 0;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)retstr, (unint64_t *)(v8 + 48), (_QWORD *)(v8 + 48));
    if (v15)
    {
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  os_unfair_lock_unlock(&p_soundEventsMutex->m_lock);
  p_soundEventsPreparingMutex = &self->_soundEventsPreparingMutex;
  os_unfair_lock_lock(&self->_soundEventsPreparingMutex.m_lock);
  for (j = &self->_soundEventsPreparing.__table_.__p1_;
        ;
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)retstr, (unint64_t *)&j[4], &j[4].__value_.__next_))
  {
    j = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, RESoundEventPreparingData>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, RESoundEventPreparingData>, void *>>> *)j->__value_.__next_;
    if (!j)
      break;
  }
  os_unfair_lock_unlock(&p_soundEventsPreparingMutex->m_lock);
  return result;
}

- (BOOL)doCleanUpSoundEventForToken:(unint64_t)a3 ifNotInScene:(unint64_t)a4
{
  UnfairLock *p_soundEventsMutex;
  UnfairLock *p_soundEventsPreparingMutex;
  unordered_map<unsigned long long, REPHASESoundEvent *, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, REPHASESoundEvent *>>> *p_soundEvents;
  _QWORD *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t *p_shared_owners;
  unint64_t v15;
  _BOOL4 v16;
  unint64_t v17;
  id v19;
  REPHASEContext *v20;
  REPHASEContext *v21;
  unint64_t value;
  objc_class *isa;
  unint64_t engine;
  uint8x8_t v25;
  REPHASEContext *v26;
  REPHASEContext *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _BOOL4 v31;
  uint64_t *v32;
  unint64_t v33;
  NSObject *phaseQueue;
  _QWORD block[4];
  id v37;
  uint64_t v38;
  std::__shared_weak_count *v39;

  p_soundEventsMutex = &self->_soundEventsMutex;
  p_soundEventsPreparingMutex = &self->_soundEventsPreparingMutex;
  std::lock[abi:ne180100]<re::UnfairLock,re::UnfairLock>(&self->_soundEventsMutex.m_lock, &self->_soundEventsPreparingMutex.m_lock);
  p_soundEvents = &self->_soundEvents;
  v10 = std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_, a3);
  v11 = (unint64_t)v10;
  if (v10)
  {
    v12 = (void *)v10[3];
    if (v12)
    {
      objc_msgSend(v12, "prepareState");
      v13 = *(_QWORD *)(v38 + 32);
      if (v39)
      {
        p_shared_owners = &v39->__shared_owners_;
        do
          v15 = __ldaxr((unint64_t *)p_shared_owners);
        while (__stlxr(v15 - 1, (unint64_t *)p_shared_owners));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
          std::__shared_weak_count::__release_weak(v39);
        }
      }
    }
    else
    {
      v13 = MEMORY[0x20];
    }
    v16 = v13 != a4;
  }
  else
  {
    v16 = 0;
  }
  v17 = (unint64_t)std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_, a3) | v11;
  if (a4 == -1 && v17 != 0)
    v16 = 1;
  if (!v16)
  {
    v19 = 0;
    goto LABEL_51;
  }
  if (v11)
    v19 = *(id *)(v11 + 24);
  else
    v19 = 0;
  v20 = (REPHASEContext *)std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v20)
  {
    v21 = v20;
    value = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    isa = v20->super.isa;
    engine = (unint64_t)v20->_engine;
    v25 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v25.i16[0] = vaddlv_u8(v25);
    if (v25.u32[0] > 1uLL)
    {
      if (engine >= value)
        engine %= value;
    }
    else
    {
      engine &= value - 1;
    }
    v26 = (REPHASEContext *)p_soundEvents->__table_.__bucket_list_.__ptr_.__value_[engine];
    do
    {
      v27 = v26;
      v26 = (REPHASEContext *)v26->super.isa;
    }
    while (v26 != v20);
    if (v27 == (REPHASEContext *)&self->_soundEvents.__table_.__p1_)
      goto LABEL_39;
    v28 = (unint64_t)v27->_engine;
    if (v25.u32[0] > 1uLL)
    {
      if (v28 >= value)
        v28 %= value;
    }
    else
    {
      v28 &= value - 1;
    }
    if (v28 != engine)
    {
LABEL_39:
      if (isa)
      {
        v29 = *((_QWORD *)isa + 1);
        if (v25.u32[0] > 1uLL)
        {
          v30 = *((_QWORD *)isa + 1);
          if (v29 >= value)
            v30 = v29 % value;
        }
        else
        {
          v30 = v29 & (value - 1);
        }
        if (v30 == engine)
          goto LABEL_43;
      }
      p_soundEvents->__table_.__bucket_list_.__ptr_.__value_[engine] = 0;
      isa = v20->super.isa;
    }
    if (!isa)
    {
LABEL_49:
      v27->super.isa = isa;
      v20->super.isa = 0;
      --self->_soundEvents.__table_.__p2_.__value_;

      operator delete(v21);
      goto LABEL_50;
    }
    v29 = *((_QWORD *)isa + 1);
LABEL_43:
    if (v25.u32[0] > 1uLL)
    {
      if (v29 >= value)
        v29 %= value;
    }
    else
    {
      v29 &= value - 1;
    }
    if (v29 != engine)
    {
      p_soundEvents->__table_.__bucket_list_.__ptr_.__value_[v29] = v27;
      isa = v20->super.isa;
    }
    goto LABEL_49;
  }
LABEL_50:
  std::__hash_table<std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,RESoundEventPreparingData>>>::__erase_unique<unsigned long long>(&self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_, a3);
LABEL_51:
  os_unfair_lock_unlock(&p_soundEventsMutex->m_lock);
  os_unfair_lock_unlock(&p_soundEventsPreparingMutex->m_lock);
  if (v19)
    v31 = v16;
  else
    v31 = 0;
  if (v31)
  {
    objc_msgSend(v19, "prepareState");
    -[REPHASEContext decrementOrDestroyEntityWithZeroCount:](self, "decrementOrDestroyEntityWithZeroCount:", *(_QWORD *)(v38 + 40));
    if (v39)
    {
      v32 = &v39->__shared_owners_;
      do
        v33 = __ldaxr((unint64_t *)v32);
      while (__stlxr(v33 - 1, (unint64_t *)v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
        std::__shared_weak_count::__release_weak(v39);
      }
    }
    phaseQueue = self->_phaseQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__REPHASEContext_doCleanUpSoundEventForToken_ifNotInScene___block_invoke;
    block[3] = &unk_24ED39E30;
    v37 = v19;
    dispatch_async(phaseQueue, block);

  }
  return v16;
}

uint64_t __59__REPHASEContext_doCleanUpSoundEventForToken_ifNotInScene___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopAndDestroy");
}

- (BOOL)addEventIfStillPreparing:(id)a3 forToken:(unint64_t)a4
{
  unint64_t v4;
  id v8;
  _QWORD *v9;
  unint64_t value;
  uint8x8_t v11;
  void **v12;
  void *i;
  unint64_t v14;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundEvent *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundEvent *>, void *>>> *p_p1;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  int8x8_t prime;
  void **v22;
  void **v23;
  uint64_t v24;
  _QWORD *next;
  unint64_t v26;
  uint8x8_t v27;
  unint64_t v28;
  uint8x8_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  void **v33;
  void **v34;
  void **v35;
  unint64_t v36;
  void **v38;
  id v39;

  v8 = a3;
  std::lock[abi:ne180100]<re::UnfairLock,re::UnfairLock>(&self->_soundEventsMutex.m_lock, &self->_soundEventsPreparingMutex.m_lock);
  v9 = std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_, a4);
  if (!v9)
    goto LABEL_76;
  std::__hash_table<std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,RESoundEventPreparingData>>>::__erase_unique<unsigned long long>(&self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_, a4);
  value = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v4 = a4;
      if (value <= a4)
        v4 = a4 % value;
    }
    else
    {
      v4 = (value - 1) & a4;
    }
    v12 = (void **)self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_[v4];
    if (v12)
    {
      for (i = *v12; i; i = *(void **)i)
      {
        v14 = *((_QWORD *)i + 1);
        if (v14 == a4)
        {
          if (*((_QWORD *)i + 2) == a4)
            goto LABEL_75;
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= value)
              v14 %= value;
          }
          else
          {
            v14 &= value - 1;
          }
          if (v14 != v4)
            break;
        }
      }
    }
  }
  v39 = v8;
  i = operator new(0x20uLL);
  p_p1 = &self->_soundEvents.__table_.__p1_;
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = a4;
  *((_QWORD *)i + 2) = a4;
  *((_QWORD *)i + 3) = 0;
  v16 = (float)(self->_soundEvents.__table_.__p2_.__value_ + 1);
  v17 = self->_soundEvents.__table_.__p3_.__value_;
  if (value && (float)(v17 * (float)value) >= v16)
  {
    a4 = v4;
    goto LABEL_65;
  }
  v18 = 1;
  if (value >= 3)
    v18 = (value & (value - 1)) != 0;
  v19 = v18 | (2 * value);
  v20 = vcvtps_u32_f32(v16 / v17);
  if (v19 <= v20)
    prime = (int8x8_t)v20;
  else
    prime = (int8x8_t)v19;
  if (*(_QWORD *)&prime == 1)
  {
    prime = (int8x8_t)2;
  }
  else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
  {
    prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    value = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  }
  if (*(_QWORD *)&prime <= value)
  {
    if (*(_QWORD *)&prime >= value)
      goto LABEL_61;
    v28 = vcvtps_u32_f32((float)self->_soundEvents.__table_.__p2_.__value_ / self->_soundEvents.__table_.__p3_.__value_);
    if (value < 3 || (v29 = (uint8x8_t)vcnt_s8((int8x8_t)value), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
    {
      v28 = std::__next_prime(v28);
    }
    else
    {
      v30 = 1 << -(char)__clz(v28 - 1);
      if (v28 >= 2)
        v28 = v30;
    }
    if (*(_QWORD *)&prime <= v28)
      prime = (int8x8_t)v28;
    if (*(_QWORD *)&prime >= value)
    {
      value = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      goto LABEL_61;
    }
    if (!*(_QWORD *)&prime)
    {
      v38 = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_;
      self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_ = 0;
      if (v38)
        operator delete(v38);
      value = 0;
      self->_soundEvents.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      goto LABEL_61;
    }
  }
  if (*(_QWORD *)&prime >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v22 = (void **)operator new(8 * *(_QWORD *)&prime);
  v23 = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_;
  self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_ = v22;
  if (v23)
    operator delete(v23);
  v24 = 0;
  self->_soundEvents.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
  do
    self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_[v24++] = 0;
  while (*(_QWORD *)&prime != v24);
  next = p_p1->__value_.__next_;
  if (p_p1->__value_.__next_)
  {
    v26 = next[1];
    v27 = (uint8x8_t)vcnt_s8(prime);
    v27.i16[0] = vaddlv_u8(v27);
    if (v27.u32[0] > 1uLL)
    {
      if (v26 >= *(_QWORD *)&prime)
        v26 %= *(_QWORD *)&prime;
    }
    else
    {
      v26 &= *(_QWORD *)&prime - 1;
    }
    self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_[v26] = p_p1;
    v31 = (_QWORD *)*next;
    if (*next)
    {
      do
      {
        v32 = v31[1];
        if (v27.u32[0] > 1uLL)
        {
          if (v32 >= *(_QWORD *)&prime)
            v32 %= *(_QWORD *)&prime;
        }
        else
        {
          v32 &= *(_QWORD *)&prime - 1;
        }
        if (v32 != v26)
        {
          v33 = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_;
          if (!v33[v32])
          {
            v33[v32] = next;
            goto LABEL_57;
          }
          *next = *v31;
          *v31 = *(_QWORD *)self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_[v32];
          *(_QWORD *)self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_[v32] = v31;
          v31 = next;
        }
        v32 = v26;
LABEL_57:
        next = v31;
        v31 = (_QWORD *)*v31;
        v26 = v32;
      }
      while (v31);
    }
  }
  value = (unint64_t)prime;
LABEL_61:
  if ((value & (value - 1)) != 0)
  {
    if (value <= a4)
      a4 %= value;
  }
  else
  {
    a4 &= value - 1;
  }
LABEL_65:
  v34 = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_;
  v35 = (void **)v34[a4];
  if (v35)
  {
    *(_QWORD *)i = *v35;
    v8 = v39;
  }
  else
  {
    *(__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundEvent *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundEvent *>, void *>>> *)i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundEvent *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundEvent *>, void *>>>)p_p1->__value_.__next_;
    p_p1->__value_.__next_ = i;
    v34[a4] = p_p1;
    v8 = v39;
    if (!*(_QWORD *)i)
      goto LABEL_74;
    v36 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v36 >= value)
        v36 %= value;
    }
    else
    {
      v36 &= value - 1;
    }
    v35 = &self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_[v36];
  }
  *v35 = i;
LABEL_74:
  ++self->_soundEvents.__table_.__p2_.__value_;
LABEL_75:
  objc_storeStrong((id *)i + 3, a3);
LABEL_76:
  os_unfair_lock_unlock(&self->_soundEventsMutex.m_lock);
  os_unfair_lock_unlock(&self->_soundEventsPreparingMutex.m_lock);

  return v9 != 0;
}

- (void)setPreparingWithData:(RESoundEventPreparingData)a3 forToken:(unint64_t)a4
{
  unint64_t v4;
  unint64_t var1;
  int64_t var0;
  UnfairLock *p_soundEventsPreparingMutex;
  unint64_t value;
  uint8x8_t v11;
  _QWORD **v12;
  _QWORD *i;
  unint64_t v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  int8x8_t prime;
  void **v21;
  void **v22;
  uint64_t v23;
  _QWORD *next;
  unint64_t v25;
  uint8x8_t v26;
  unint64_t v27;
  uint8x8_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  void **v32;
  void **v33;
  void **v34;
  unint64_t v35;
  void **v36;

  var1 = a3.var1;
  var0 = a3.var0;
  p_soundEventsPreparingMutex = &self->_soundEventsPreparingMutex;
  os_unfair_lock_lock(&self->_soundEventsPreparingMutex.m_lock);
  value = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v4 = a4;
      if (value <= a4)
        v4 = a4 % value;
    }
    else
    {
      v4 = (value - 1) & a4;
    }
    v12 = (_QWORD **)self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_[v4];
    if (v12)
    {
      for (i = *v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v14 == a4)
        {
          if (i[2] == a4)
            goto LABEL_74;
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= value)
              v14 %= value;
          }
          else
          {
            v14 &= value - 1;
          }
          if (v14 != v4)
            break;
        }
      }
    }
  }
  i = operator new(0x28uLL);
  *i = 0;
  i[1] = a4;
  i[3] = 0;
  i[4] = 0;
  i[2] = a4;
  v15 = (float)(self->_soundEventsPreparing.__table_.__p2_.__value_ + 1);
  v16 = self->_soundEventsPreparing.__table_.__p3_.__value_;
  if (value && (float)(v16 * (float)value) >= v15)
  {
    a4 = v4;
    goto LABEL_64;
  }
  v17 = 1;
  if (value >= 3)
    v17 = (value & (value - 1)) != 0;
  v18 = v17 | (2 * value);
  v19 = vcvtps_u32_f32(v15 / v16);
  if (v18 <= v19)
    prime = (int8x8_t)v19;
  else
    prime = (int8x8_t)v18;
  if (*(_QWORD *)&prime == 1)
  {
    prime = (int8x8_t)2;
  }
  else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
  {
    prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    value = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  }
  if (*(_QWORD *)&prime <= value)
  {
    if (*(_QWORD *)&prime >= value)
      goto LABEL_60;
    v27 = vcvtps_u32_f32((float)self->_soundEventsPreparing.__table_.__p2_.__value_/ self->_soundEventsPreparing.__table_.__p3_.__value_);
    if (value < 3 || (v28 = (uint8x8_t)vcnt_s8((int8x8_t)value), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
    {
      v27 = std::__next_prime(v27);
    }
    else
    {
      v29 = 1 << -(char)__clz(v27 - 1);
      if (v27 >= 2)
        v27 = v29;
    }
    if (*(_QWORD *)&prime <= v27)
      prime = (int8x8_t)v27;
    if (*(_QWORD *)&prime >= value)
    {
      value = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      goto LABEL_60;
    }
    if (!*(_QWORD *)&prime)
    {
      v36 = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_;
      self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_ = 0;
      if (v36)
        operator delete(v36);
      value = 0;
      self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      goto LABEL_60;
    }
  }
  if (*(_QWORD *)&prime >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v21 = (void **)operator new(8 * *(_QWORD *)&prime);
  v22 = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_;
  self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_ = v21;
  if (v22)
    operator delete(v22);
  v23 = 0;
  self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
  do
    self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_[v23++] = 0;
  while (*(_QWORD *)&prime != v23);
  next = self->_soundEventsPreparing.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v25 = next[1];
    v26 = (uint8x8_t)vcnt_s8(prime);
    v26.i16[0] = vaddlv_u8(v26);
    if (v26.u32[0] > 1uLL)
    {
      if (v25 >= *(_QWORD *)&prime)
        v25 %= *(_QWORD *)&prime;
    }
    else
    {
      v25 &= *(_QWORD *)&prime - 1;
    }
    self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_[v25] = &self->_soundEventsPreparing.__table_.__p1_;
    v30 = (_QWORD *)*next;
    if (*next)
    {
      do
      {
        v31 = v30[1];
        if (v26.u32[0] > 1uLL)
        {
          if (v31 >= *(_QWORD *)&prime)
            v31 %= *(_QWORD *)&prime;
        }
        else
        {
          v31 &= *(_QWORD *)&prime - 1;
        }
        if (v31 != v25)
        {
          v32 = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_;
          if (!v32[v31])
          {
            v32[v31] = next;
            goto LABEL_56;
          }
          *next = *v30;
          *v30 = *(_QWORD *)self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_[v31];
          *(_QWORD *)self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_[v31] = v30;
          v30 = next;
        }
        v31 = v25;
LABEL_56:
        next = v30;
        v30 = (_QWORD *)*v30;
        v25 = v31;
      }
      while (v30);
    }
  }
  value = (unint64_t)prime;
LABEL_60:
  if ((value & (value - 1)) != 0)
  {
    if (value <= a4)
      a4 %= value;
  }
  else
  {
    a4 &= value - 1;
  }
LABEL_64:
  v33 = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_;
  v34 = (void **)v33[a4];
  if (v34)
  {
    *i = *v34;
LABEL_72:
    *v34 = i;
    goto LABEL_73;
  }
  *i = self->_soundEventsPreparing.__table_.__p1_.__value_.__next_;
  self->_soundEventsPreparing.__table_.__p1_.__value_.__next_ = i;
  v33[a4] = &self->_soundEventsPreparing.__table_.__p1_;
  if (*i)
  {
    v35 = *(_QWORD *)(*i + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v35 >= value)
        v35 %= value;
    }
    else
    {
      v35 &= value - 1;
    }
    v34 = &self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_[v35];
    goto LABEL_72;
  }
LABEL_73:
  ++self->_soundEventsPreparing.__table_.__p2_.__value_;
LABEL_74:
  i[3] = var0;
  i[4] = var1;
  os_unfair_lock_unlock(&p_soundEventsPreparingMutex->m_lock);
}

- (void)clearPreparingStateForToken:(unint64_t)a3
{
  UnfairLock *p_soundEventsPreparingMutex;

  p_soundEventsPreparingMutex = &self->_soundEventsPreparingMutex;
  os_unfair_lock_lock(&self->_soundEventsPreparingMutex.m_lock);
  std::__hash_table<std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,RESoundEventPreparingData>>>::__erase_unique<unsigned long long>(&self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_, a3);
  os_unfair_lock_unlock(&p_soundEventsPreparingMutex->m_lock);
}

- (id)getOrCreateSpatialMixerDefinitionUsing:(const void *)a3
{
  uint64_t v4;
  REPHASEContext *v5;
  PHASEDirectivityModelParameters *v6;
  REPHASESpatialMixerDefinitionCache *p_spatialMixerDefinitionCache;
  NSObject *v8;
  double v9;
  id v10;
  int v12;
  double v13;
  __int16 v14;
  REPHASEContext *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)a3;
  switch(*(_DWORD *)(*(_QWORD *)a3 + 312))
  {
    case 0:
      re::REPHASESpatialMixerDefinitionCache::getOmniSpatialMixerDefinition((re::REPHASESpatialMixerDefinitionCache *)&self->_spatialMixerDefinitionCache);
      self = (REPHASEContext *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1:
      re::REPHASESpatialMixerDefinitionCache::getBeamSpatialMixerDefinition((re::REPHASESpatialMixerDefinitionCache *)&self->_spatialMixerDefinitionCache, *(float *)(v4 + 316));
      self = (REPHASEContext *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      v6 = *(PHASEDirectivityModelParameters **)(v4 + 176);
      p_spatialMixerDefinitionCache = &self->_spatialMixerDefinitionCache;
      if (v6)
        re::REPHASESpatialMixerDefinitionCache::getSpatialMixerDefinitionWithDirectivity((re::REPHASESpatialMixerDefinitionCache *)p_spatialMixerDefinitionCache, v6);
      else
        re::REPHASESpatialMixerDefinitionCache::getHumanSpatialMixerDefinition((re::REPHASESpatialMixerDefinitionCache *)p_spatialMixerDefinitionCache);
      self = (REPHASEContext *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3:
      re::REPHASESpatialMixerDefinitionCache::getSphericalSpatialMixerDefinition((re::REPHASESpatialMixerDefinitionCache *)&self->_spatialMixerDefinitionCache, *(float *)(v4 + 320) * 0.5, *(float *)(v4 + 324));
      self = (REPHASEContext *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v5 = self;
      break;
    default:
      v5 = 0;
      break;
  }
  v8 = *re::audioLogObjects((re *)self);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(float *)(*(_QWORD *)a3 + 204);
    v12 = 134218242;
    v13 = v9;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_224FE9000, v8, OS_LOG_TYPE_DEFAULT, "[RE/PHASE] [Prepare] Rolloff factor=%.2f on PHASESpatialMixerDefinition=%@", (uint8_t *)&v12, 0x16u);
  }
  v10 = objc_alloc_init(MEMORY[0x24BDE3270]);
  objc_msgSend(v10, "setRolloffFactor:", *(float *)(*(_QWORD *)a3 + 204));
  -[REPHASEContext setDistanceModelParameters:](v5, "setDistanceModelParameters:", v10);

  return v5;
}

- (void)setCustomHRIRURL:(id)a3
{
  objc_storeStrong((id *)&self->_customHRIRURL, a3);
  -[REPHASEContext applyCustomHRIR](self, "applyCustomHRIR");
}

- (void)applyCustomHRIR
{
  PHASEEngine *engine;
  NSURL *customHRIRURL;
  char v5;
  re *v6;
  re *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  re *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  engine = self->_engine;
  if (engine)
  {
    customHRIRURL = self->_customHRIRURL;
    if (customHRIRURL)
    {
      v9 = 0;
      v5 = -[PHASEEngine setHeadphoneHRIRFile:error:](engine, "setHeadphoneHRIRFile:error:", customHRIRURL, &v9);
      v6 = (re *)v9;
      v7 = v6;
      if ((v5 & 1) == 0)
      {
        v8 = *re::audioLogObjects(v6);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v11 = v7;
          _os_log_error_impl(&dword_224FE9000, v8, OS_LOG_TYPE_ERROR, "Error setting custom HRIR: %@", buf, 0xCu);
        }
      }

    }
  }
}

- (void)loadHumanDirectivityPlistFromURL:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  PHASECardioidDirectivityModelParameters *v22;
  PHASECardioidDirectivityModelParameters *humanDirectivity;
  NSObject *v24;
  uint8_t v25[8];
  id v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
    goto LABEL_9;
  re::Bundle::reTestsDataFramework((uint64_t)v25);
  if (v25[0])
    v5 = v26;
  else
    v5 = 0;
  v6 = objc_retainAutorelease(v5);
  if (v25[0])

  objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("PHASEHumanDirectivity"), CFSTR("plist"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_9:
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfURL:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x24BDE3240]);
    objc_msgSend(v7, "valueForKey:", CFSTR("lowFrequency"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[REPHASEContext doubleFromPlistValue:defaultValue:](self, "doubleFromPlistValue:defaultValue:", v9, 125.0);
    objc_msgSend(v8, "setFrequency:");

    objc_msgSend(v7, "valueForKey:", CFSTR("lowPattern"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[REPHASEContext doubleFromPlistValue:defaultValue:](self, "doubleFromPlistValue:defaultValue:", v10, 0.0);
    objc_msgSend(v8, "setPattern:");

    objc_msgSend(v7, "valueForKey:", CFSTR("lowSharpness"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[REPHASEContext doubleFromPlistValue:defaultValue:](self, "doubleFromPlistValue:defaultValue:", v11, 1.0);
    objc_msgSend(v8, "setSharpness:");

    v12 = objc_alloc_init(MEMORY[0x24BDE3240]);
    objc_msgSend(v7, "valueForKey:", CFSTR("midFrequency"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[REPHASEContext doubleFromPlistValue:defaultValue:](self, "doubleFromPlistValue:defaultValue:", v13, 1000.0);
    objc_msgSend(v12, "setFrequency:");

    objc_msgSend(v7, "valueForKey:", CFSTR("midPattern"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[REPHASEContext doubleFromPlistValue:defaultValue:](self, "doubleFromPlistValue:defaultValue:", v14, 0.0);
    objc_msgSend(v12, "setPattern:");

    objc_msgSend(v7, "valueForKey:", CFSTR("midSharpness"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[REPHASEContext doubleFromPlistValue:defaultValue:](self, "doubleFromPlistValue:defaultValue:", v15, 1.0);
    objc_msgSend(v12, "setSharpness:");

    v16 = objc_alloc_init(MEMORY[0x24BDE3240]);
    objc_msgSend(v7, "valueForKey:", CFSTR("highFrequency"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[REPHASEContext doubleFromPlistValue:defaultValue:](self, "doubleFromPlistValue:defaultValue:", v17, 3000.0);
    objc_msgSend(v16, "setFrequency:");

    objc_msgSend(v7, "valueForKey:", CFSTR("highPattern"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[REPHASEContext doubleFromPlistValue:defaultValue:](self, "doubleFromPlistValue:defaultValue:", v18, 0.0);
    objc_msgSend(v16, "setPattern:");

    objc_msgSend(v7, "valueForKey:", CFSTR("highSharpness"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[REPHASEContext doubleFromPlistValue:defaultValue:](self, "doubleFromPlistValue:defaultValue:", v19, 1.0);
    objc_msgSend(v16, "setSharpness:");

    v20 = objc_alloc(MEMORY[0x24BDE3238]);
    v27[0] = v8;
    v27[1] = v12;
    v27[2] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (PHASECardioidDirectivityModelParameters *)objc_msgSend(v20, "initWithSubbandParameters:", v21);
    humanDirectivity = self->_humanDirectivity;
    self->_humanDirectivity = v22;

    v6 = v4;
    goto LABEL_10;
  }
  v24 = *re::audioLogObjects(0);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v25 = 0;
    _os_log_error_impl(&dword_224FE9000, v24, OS_LOG_TYPE_ERROR, "No Human Directivity configuration plist found.", v25, 2u);
  }
LABEL_10:

}

- (double)doubleFromPlistValue:(id)a3 defaultValue:(double)a4
{
  id v5;
  double v6;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "doubleValue");
    a4 = v6;
  }

  return a4;
}

- (void)createListenerIfPending
{
  UnfairLock *p_scenesMutex;
  _QWORD *i;
  re::audio::REPHASEAudioScene *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  for (i = self->_scenes.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    v5 = (re::audio::REPHASEAudioScene *)i[3];
    v6 = (std::__shared_weak_count *)i[4];
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    re::audio::REPHASEAudioScene::createListenerIfPending(v5);
    if (v6)
    {
      v9 = (unint64_t *)&v6->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
}

- (void)removeEntity:(unint64_t)a3
{
  UnfairLock *p_scenesMutex;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *>>> *i;

  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  for (i = &self->_scenes.__table_.__p1_;
        ;
        re::audio::REPHASEAudioScene::removeEntity((os_unfair_lock_s *)i[3].__value_.__next_, a3))
  {
    i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *>>> *)i->__value_.__next_;
    if (!i)
      break;
  }
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
}

- (BOOL)isListenerCreatedInScene
{
  UnfairLock *p_scenesMutex;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *>>> *p_p1;
  os_unfair_lock_s *next;
  os_unfair_lock_s *v6;
  uint64_t v7;

  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  p_p1 = &self->_scenes.__table_.__p1_;
  do
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1)
      break;
    next = (os_unfair_lock_s *)p_p1[3].__value_.__next_;
    v6 = next + 16;
    os_unfair_lock_lock(next + 16);
    v7 = *(_QWORD *)&next[18]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v6);
  }
  while (!v7);
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
  return p_p1 != 0;
}

- (BOOL)engineShouldBeRunning
{
  uint64_t v2;
  UnfairLock *p_scenesMutex;
  _QWORD *next;
  char v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  os_unfair_lock_s *v11;
  _QWORD *v12;
  BOOL v13;
  char i;
  void *v15;
  uint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  std::__shared_weak_count *v22;

  v2 = *((_QWORD *)self->_audioEngineRunnableManager.__ptr_ + 3);
  if (v2)
  {
    p_scenesMutex = &self->_scenesMutex;
    os_unfair_lock_lock(&self->_scenesMutex.m_lock);
    next = self->_scenes.__table_.__p1_.__value_.__next_;
    if (next)
    {
      v6 = 0;
      while (1)
      {
        v7 = next[3];
        v8 = (os_unfair_lock_s *)(v7 + 80);
        os_unfair_lock_lock((os_unfair_lock_t)(v7 + 80));
        v9 = *(_QWORD *)(v7 + 112);
        os_unfair_lock_unlock(v8);
        if (v9)
          break;
        v10 = next[3];
        v11 = (os_unfair_lock_s *)(v10 + 64);
        os_unfair_lock_lock((os_unfair_lock_t)(v10 + 64));
        LOBYTE(v10) = *(_QWORD *)(v10 + 72) != 0;
        os_unfair_lock_unlock(v11);
        v6 |= v10;
        next = (_QWORD *)*next;
        if (!next)
          goto LABEL_8;
      }
      os_unfair_lock_unlock(&p_scenesMutex->m_lock);
      LOBYTE(v2) = 1;
    }
    else
    {
      v6 = 0;
LABEL_8:
      os_unfair_lock_unlock(&p_scenesMutex->m_lock);
      os_unfair_lock_lock(&self->_soundEventsMutex.m_lock);
      v12 = self->_soundEvents.__table_.__p1_.__value_.__next_;
      v13 = v12 != 0;
      for (i = 0; v12; v12 = (_QWORD *)*v12)
      {
        v15 = (void *)v12[3];
        if (v15)
        {
          objc_msgSend(v15, "prepareState");
          v16 = *(_QWORD *)(v21 + 56);
          if (v22)
          {
            p_shared_owners = (unint64_t *)&v22->__shared_owners_;
            do
              v18 = __ldaxr(p_shared_owners);
            while (__stlxr(v18 - 1, p_shared_owners));
            if (!v18)
            {
              ((void (*)())v22->__on_zero_shared)();
              std::__shared_weak_count::__release_weak(v22);
            }
          }
        }
        else
        {
          v16 = MEMORY[0x38];
        }
        i |= v16 == 2;
      }
      os_unfair_lock_unlock(&self->_soundEventsMutex.m_lock);
      os_unfair_lock_lock(&self->_soundEventsPreparingMutex.m_lock);
      v19 = self->_soundEventsPreparing.__table_.__p1_.__value_.__next_;
      if (v19)
      {
        do
        {
          i |= v19[3] == 2;
          v19 = (_QWORD *)*v19;
        }
        while (v19);
        v13 = 1;
      }
      os_unfair_lock_unlock(&self->_soundEventsPreparingMutex.m_lock);
      LOBYTE(v2) = i | v6 & v13;
    }
  }
  return v2 & 1;
}

- (id)getListener
{
  UnfairLock *p_scenesMutex;
  re::audio::REPHASEAudioScene *next;
  uint64_t v5;
  void *v6;

  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  next = (re::audio::REPHASEAudioScene *)self->_scenes.__table_.__p1_.__value_.__next_;
  if (next)
  {
    while (1)
    {
      re::audio::REPHASEAudioScene::getListener(*((re::audio::REPHASEAudioScene **)next + 3));
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
        break;
      next = *(re::audio::REPHASEAudioScene **)next;
      if (!next)
        goto LABEL_4;
    }
    v6 = (void *)v5;
  }
  else
  {
LABEL_4:
    v6 = 0;
  }
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
  return v6;
}

- (void)removeListener
{
  UnfairLock *p_scenesMutex;
  os_unfair_lock_s *i;

  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  for (i = (os_unfair_lock_s *)self->_scenes.__table_.__p1_.__value_.__next_;
        i;
        i = *(os_unfair_lock_s **)&i->_os_unfair_lock_opaque)
  {
    re::audio::REPHASEAudioScene::removeListener(*(os_unfair_lock_s **)&i[6]._os_unfair_lock_opaque);
  }
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
}

- (id)getSessionRoot:(unint64_t)a3
{
  UnfairLock *p_scenesMutex;
  os_unfair_lock_s *next;
  void *v7;

  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  next = (os_unfair_lock_s *)self->_scenes.__table_.__p1_.__value_.__next_;
  if (next)
  {
    while (1)
    {
      re::audio::REPHASEAudioScene::getSessionRoot(*(os_unfair_lock_s **)&next[6]._os_unfair_lock_opaque, a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        break;
      next = *(os_unfair_lock_s **)&next->_os_unfair_lock_opaque;
      if (!next)
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v7 = 0;
  }
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
  return v7;
}

- (void)removeSessionRoot:(unint64_t)a3
{
  UnfairLock *p_scenesMutex;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *>>> *i;

  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  for (i = &self->_scenes.__table_.__p1_;
        ;
        re::audio::REPHASEAudioScene::removeSessionRoot((os_unfair_lock_s *)i[3].__value_.__next_, a3))
  {
    i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *>>> *)i->__value_.__next_;
    if (!i)
      break;
  }
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
}

- (void)getSourceCount:(unsigned int *)a3 occluderCount:(unsigned int *)a4
{
  UnfairLock *p_scenesMutex;
  os_unfair_lock_s *next;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11[2];

  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  next = (os_unfair_lock_s *)self->_scenes.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      *(_QWORD *)v11 = 0;
      re::audio::REPHASEAudioScene::getSourceCount(*(os_unfair_lock_s **)&next[6]._os_unfair_lock_opaque, &v11[1], v11);
      v9 += v11[1];
      v10 += v11[0];
      next = *(os_unfair_lock_s **)&next->_os_unfair_lock_opaque;
    }
    while (next);
    if (a3)
      goto LABEL_5;
  }
  else
  {
    v10 = 0;
    v9 = 0;
    if (a3)
LABEL_5:
      *a3 = v9;
  }
  if (a4)
    *a4 = v10;
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
}

- (id)sourceObjectForEntityID:(unint64_t)a3
{
  id v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v7;
  std::__shared_weak_count *v8;

  -[REPHASEContext getEntity:](self, "getEntity:", a3);
  if (v7)
    v3 = *(id *)(v7 + 16);
  else
    v3 = 0;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return v3;
}

- (shared_ptr<re::audio::REPHASEEntity>)getEntity:(unint64_t)a3
{
  UnfairLock *p_scenesMutex;
  REPHASEEntity *v6;
  __shared_weak_count *v7;
  shared_ptr<re::audio::REPHASEEntity> result;

  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  -[REPHASEContext _getEntityUnderLock:](self, "_getEntityUnderLock:", a3);
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (shared_ptr<re::audio::REPHASEEntity>)_getEntityUnderLock:(unint64_t)a3
{
  _QWORD *v3;
  _QWORD *v4;
  os_unfair_lock_s *next;
  shared_ptr<re::audio::REPHASEEntity> result;

  v4 = v3;
  next = (os_unfair_lock_s *)self->_scenes.__table_.__p1_.__value_.__next_;
  if (next)
  {
    while (1)
    {
      re::audio::REPHASEAudioScene::getEntity(*(os_unfair_lock_s **)&next[6]._os_unfair_lock_opaque, a3, v4);
      if (*v4)
        break;
      self = (REPHASEContext *)std::shared_ptr<re::AssetManager>::~shared_ptr[abi:nn180100]((uint64_t)v4);
      next = *(os_unfair_lock_s **)&next->_os_unfair_lock_opaque;
      if (!next)
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    *v4 = 0;
    v4[1] = 0;
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (REPHASEEntity *)self;
  return result;
}

- (void)decrementOrDestroyEntityWithZeroCount:(unint64_t)a3
{
  UnfairLock *p_scenesMutex;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *>>> *i;

  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  for (i = &self->_scenes.__table_.__p1_;
        ;
        re::audio::REPHASEAudioScene::decrementOrDestroyEntityWithZeroCount((os_unfair_lock_s *)i[3].__value_.__next_, a3))
  {
    i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *>>> *)i->__value_.__next_;
    if (!i)
      break;
  }
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (PHASENumberMetaParameterDefinition)gainLinearParamDefinition
{
  return self->_gainLinearParamDefinition;
}

- (PHASENumberMetaParameterDefinition)rateParamDefinition
{
  return self->_rateParamDefinition;
}

- (PHASECardioidDirectivityModelParameters)humanDirectivity
{
  return self->_humanDirectivity;
}

- (PHASEListener)listener
{
  return self->_listener;
}

- (NSURL)customHRIRURL
{
  return self->_customHRIRURL;
}

- (void).cxx_destruct
{
  void **value;
  _QWORD *next;
  _QWORD *v5;
  void **v6;
  void **v7;
  void **v8;

  objc_storeStrong((id *)&self->_customHRIRURL, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_humanDirectivity, 0);
  objc_storeStrong((id *)&self->_rateParamDefinition, 0);
  objc_storeStrong((id *)&self->_gainLinearParamDefinition, 0);
  std::shared_ptr<re::AssetManager>::~shared_ptr[abi:nn180100]((uint64_t)&self->_audioEngineRunnableManager);
  objc_storeStrong((id *)&self->_phaseQueue, 0);

  std::__hash_table<std::__hash_value_type<unsigned long long,REPHASESoundAsset>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,REPHASESoundAsset>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,REPHASESoundAsset>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,REPHASESoundAsset>>>::__deallocate_node((_QWORD *)self->_audioAssets.__table_.__p1_.__value_.__next_);
  value = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_;
  self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  next = self->_soundEventsPreparing.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v5 = (_QWORD *)*next;
      operator delete(next);
      next = v5;
    }
    while (v5);
  }
  v6 = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_;
  self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v6)
    operator delete(v6);
  std::__hash_table<std::__hash_value_type<unsigned long long,REPHASESoundEvent * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,REPHASESoundEvent * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,REPHASESoundEvent * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,REPHASESoundEvent * {__strong}>>>::__deallocate_node((id *)self->_soundEvents.__table_.__p1_.__value_.__next_);
  v7 = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_;
  self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v7)
    operator delete(v7);
  std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::~__hash_table((uint64_t)&self->_shapes);
  std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>>>::__deallocate_node((_QWORD *)self->_scenes.__table_.__p1_.__value_.__next_);
  v8 = self->_scenes.__table_.__bucket_list_.__ptr_.__value_;
  self->_scenes.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v8)
    operator delete(v8);
  objc_storeStrong((id *)&self->_engine, 0);
}

- (id).cxx_construct
{
  self->_scenesMutex.m_lock._os_unfair_lock_opaque = 0;
  self->_scenes.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_scenes.__table_.__p1_.__value_.__next_ = 0u;
  self->_scenes.__table_.__p3_.__value_ = 1.0;
  self->_shapesMutex.m_lock._os_unfair_lock_opaque = 0;
  self->_shapes.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_shapes.__table_.__p1_.__value_.__next_ = 0u;
  self->_shapes.__table_.__p3_.__value_ = 1.0;
  self->_soundEvents.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_soundEvents.__table_.__p1_.__value_.__next_ = 0u;
  self->_soundEvents.__table_.__p3_.__value_ = 1.0;
  self->_soundEventsMutex.m_lock._os_unfair_lock_opaque = 0;
  self->_soundEventsPreparing.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_soundEventsPreparing.__table_.__p1_.__value_.__next_ = 0u;
  self->_soundEventsPreparing.__table_.__p3_.__value_ = 1.0;
  self->_soundEventsPreparingMutex.m_lock._os_unfair_lock_opaque = 0;
  *(_OWORD *)&self->_audioAssets.__table_.__p1_.__value_.__next_ = 0u;
  self->_audioAssets.__table_.__bucket_list_ = 0u;
  self->_audioAssets.__table_.__p3_.__value_ = 1.0;
  self->_audioEngineMutex.m_lock._os_unfair_lock_opaque = 0;
  self->_audioAssetsMutex.m_lock._os_unfair_lock_opaque = 0;
  re::REPHASEMaterialCache::REPHASEMaterialCache((re::REPHASEMaterialCache *)&self->_phaseMaterialCache);
  re::REPHASESpatialMixerDefinitionCache::REPHASESpatialMixerDefinitionCache((re::REPHASESpatialMixerDefinitionCache *)&self->_spatialMixerDefinitionCache);
  self->_audioEngineRunnableManager.__ptr_ = 0;
  self->_audioEngineRunnableManager.__cntrl_ = 0;
  return self;
}

@end
