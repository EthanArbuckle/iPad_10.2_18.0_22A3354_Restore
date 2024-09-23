@implementation PHASEShape

- (PHASEShape)init
{
  -[PHASEShape doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEShape)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEShape)initWithShape:(id)a3
{
  char *v4;
  char *v5;
  char *v6;
  id WeakRetained;
  id *v8;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t j;
  PHASEShapeElement *v32;
  void *v33;
  void *v34;
  void *v35;
  PHASEShapeElement *v36;
  uint64_t v37;
  void *v38;
  unsigned int *begin;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  id *v46;
  std::vector<unsigned int> v47;
  objc_super v48;

  v4 = (char *)a3;
  v48.receiver = self;
  v48.super_class = (Class)PHASEShape;
  v5 = -[PHASEShape init](&v48, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_38;
  WeakRetained = objc_loadWeakRetained((id *)v4 + 10);
  v8 = (id *)(v5 + 80);
  objc_storeWeak((id *)v5 + 10, WeakRetained);

  v9 = (void **)*((_QWORD *)v4 + 2);
  if (v9 && *v9)
    Phase::MdlMeshAsset::Initialize((Phase::MdlMeshAsset *)(v5 + 8), *v9);
  *((_DWORD *)v5 + 8) = *((_DWORD *)v4 + 8);
  *((_QWORD *)v5 + 5) = *((_QWORD *)v4 + 5);
  v5[48] = v4[48];
  if (v5 != v4)
  {
    v11 = *((_QWORD *)v4 + 7);
    v10 = *((_QWORD *)v4 + 8);
    v12 = 0x2E8BA2E8BA2E8BA3 * ((v10 - v11) >> 3);
    v13 = *((_QWORD *)v5 + 9);
    v14 = *((_QWORD *)v5 + 7);
    if (0x2E8BA2E8BA2E8BA3 * ((v13 - v14) >> 3) >= v12)
    {
      v24 = 0x2E8BA2E8BA2E8BA3 * ((*((_QWORD *)v5 + 8) - v14) >> 3);
      if (v24 >= v12)
      {
        v26 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<Phase::LocalizedGeometryPermutation *,Phase::LocalizedGeometryPermutation *,Phase::LocalizedGeometryPermutation *>(*((_QWORD *)v4 + 7), *((_QWORD *)v4 + 8), *((_QWORD *)v5 + 7));
        for (i = *((_QWORD *)v5 + 8);
              i != v26;
              std::allocator<Phase::LocalizedGeometryPermutation>::destroy[abi:ne180100](i))
        {
          i -= 88;
        }
        *((_QWORD *)v5 + 8) = v26;
        goto LABEL_27;
      }
      v25 = v11 + 8 * ((*((_QWORD *)v5 + 8) - v14) >> 3);
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<Phase::LocalizedGeometryPermutation *,Phase::LocalizedGeometryPermutation *,Phase::LocalizedGeometryPermutation *>(*((_QWORD *)v4 + 7), v11 + 88 * v24, *((_QWORD *)v6 + 7));
      v23 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<Phase::LocalizedGeometryPermutation>,Phase::LocalizedGeometryPermutation*,Phase::LocalizedGeometryPermutation*,Phase::LocalizedGeometryPermutation*>(v25, v10, *((_QWORD *)v6 + 8));
    }
    else
    {
      if (v14)
      {
        v15 = v5 + 56;
        v16 = *((_QWORD *)v5 + 8);
        v17 = (void *)*((_QWORD *)v6 + 7);
        if (v16 != v14)
        {
          do
          {
            v16 -= 88;
            std::allocator<Phase::LocalizedGeometryPermutation>::destroy[abi:ne180100](v16);
          }
          while (v16 != v14);
          v17 = *(void **)v15;
        }
        *((_QWORD *)v6 + 8) = v14;
        operator delete(v17);
        v13 = 0;
        *(_QWORD *)v15 = 0;
        *((_QWORD *)v15 + 1) = 0;
        *((_QWORD *)v15 + 2) = 0;
      }
      if (v12 > 0x2E8BA2E8BA2E8BALL)
        goto LABEL_40;
      v18 = 0x2E8BA2E8BA2E8BA3 * (v13 >> 3);
      v19 = 2 * v18;
      if (2 * v18 <= v12)
        v19 = 0x2E8BA2E8BA2E8BA3 * ((v10 - v11) >> 3);
      v20 = v18 >= 0x1745D1745D1745DLL ? 0x2E8BA2E8BA2E8BALL : v19;
      if (v20 > 0x2E8BA2E8BA2E8BALL)
LABEL_40:
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Phase::LocalizedGeometryPermutation>>(v20);
      *((_QWORD *)v6 + 7) = v21;
      *((_QWORD *)v6 + 8) = v21;
      *((_QWORD *)v6 + 9) = &v21[88 * v22];
      v23 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<Phase::LocalizedGeometryPermutation>,Phase::LocalizedGeometryPermutation*,Phase::LocalizedGeometryPermutation*,Phase::LocalizedGeometryPermutation*>(v11, v10, (uint64_t)v21);
    }
    *((_QWORD *)v6 + 8) = v23;
  }
LABEL_27:
  objc_msgSend(v4, "elements");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (v29)
  {
    v46 = v8;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    for (j = 0; j != v29; ++j)
    {
      v32 = [PHASEShapeElement alloc];
      objc_msgSend(v4, "elements");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", j);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "material");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[PHASEShapeElement initWithOwner:material:](v32, "initWithOwner:material:", v6, v35);
      objc_msgSend(v30, "setObject:atIndexedSubscript:", v36, j);

    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v30);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v37;

    v8 = v46;
  }
  std::vector<unsigned int>::vector(&v47, 1uLL);
  begin = v47.__begin_;
  *v47.__begin_ = 1;
  v40 = *((_QWORD *)v6 + 7);
  v41 = *((_QWORD *)v6 + 8);
  if (v40 == v41)
    goto LABEL_37;
  do
  {
    if (*(_QWORD *)(v40 + 80))
    {
      v42 = objc_loadWeakRetained(v8);
      v43 = objc_msgSend(v42, "implementation");
      v44 = (*(uint64_t (**)(_QWORD, _QWORD, std::vector<unsigned int> *))(**(_QWORD **)(v43 + 368) + 64))(*(_QWORD *)(v43 + 368), *(_QWORD *)(v40 + 80), &v47);

      if (!v44)
        std::terminate();
      *(_QWORD *)(v40 + 80) = v44;
    }
    v40 += 88;
  }
  while (v40 != v41);
  begin = v47.__begin_;
  if (v47.__begin_)
  {
LABEL_37:
    v47.__end_ = begin;
    operator delete(begin);
  }
LABEL_38:

  return (PHASEShape *)v6;
}

- (PHASEShape)initWithEngine:(PHASEEngine *)engine mesh:(MDLMesh *)mesh
{
  PHASEEngine *v6;
  MDLMesh *v7;
  PHASEShape *v8;
  PHASEShape *v9;
  uint64_t SubmeshCount;
  void *v11;
  uint64_t v12;
  PHASEShapeElement *v13;
  uint64_t v14;
  NSArray *elements;
  objc_super v17;

  v6 = engine;
  v7 = mesh;
  v17.receiver = self;
  v17.super_class = (Class)PHASEShape;
  v8 = -[PHASEShape init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_engine, v6);
    Phase::MdlMeshAsset::Initialize((Phase::MdlMeshAsset *)&v9->_meshAsset, v7);
    v9->_voxelDensity = 64;
    v9->_flags = 7;
    v9->_isReal = 0;
    -[PHASEShape buildLocalizedGeometryPermutations](v9, "buildLocalizedGeometryPermutations");
    SubmeshCount = Phase::MdlMeshAsset::GetSubmeshCount((id **)&v9->_meshAsset);
    if (SubmeshCount)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", SubmeshCount);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      do
      {
        v13 = -[PHASEShapeElement initWithOwner:]([PHASEShapeElement alloc], "initWithOwner:", v9);
        objc_msgSend(v11, "setObject:atIndexedSubscript:", v13, v12);

        ++v12;
      }
      while (SubmeshCount != v12);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v11);
      v14 = objc_claimAutoreleasedReturnValue();
      elements = v9->_elements;
      v9->_elements = (NSArray *)v14;

    }
  }

  return v9;
}

- (PHASEShape)initWithEngine:(PHASEEngine *)engine mesh:(MDLMesh *)mesh materials:(NSArray *)materials
{
  PHASEEngine *v8;
  MDLMesh *v9;
  NSArray *v10;
  NSArray *v11;
  PHASEShape *v12;
  uint64_t v13;
  unint64_t i;
  void *v15;
  void *v16;
  PHASEShape *v17;

  v8 = engine;
  v9 = mesh;
  v10 = materials;
  v11 = v10;
  if (v10 && -[NSArray count](v10, "count"))
  {
    v12 = -[PHASEShape initWithEngine:mesh:](self, "initWithEngine:mesh:", v8, v9);
    if (v12 && -[NSArray count](v11, "count"))
    {
      v13 = 0;
      for (i = 0; i < -[NSArray count](v12->_elements, "count"); ++i)
      {
        -[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](v12->_elements, "objectAtIndexedSubscript:", i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setMaterial:", v15);

        if (v13 + 1 < -[NSArray count](v11, "count"))
          ++v13;
        else
          v13 = 0;
      }
    }
    self = v12;
    v17 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("initWithEngine:mesh:materials - the materials array cannot be nil or empty"));
    v17 = 0;
  }

  return v17;
}

- (PHASEShape)initWithEngine:(id)a3 mesh:(id)a4 options:(id)a5
{
  id v8;
  PHASEShape *v9;
  PHASEShape *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PHASEMaterial *v26;
  void *v27;
  id v29;
  id v30;
  PHASEShape *v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v29 = a4;
  v30 = a5;
  v32 = v8;
  v9 = -[PHASEShape initWithEngine:mesh:](self, "initWithEngine:mesh:", v8, v29);
  v10 = v9;
  if (v9)
  {
    -[PHASEShape applyOptions:](v9, "applyOptions:", v30);
    -[PHASEShape buildLocalizedGeometryPermutations](v10, "buildLocalizedGeometryPermutations");
  }
  v31 = v10;
  if (v10->_isReal)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v29, "submeshes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v11)
    {
      v12 = 0;
      v13 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v15, "material");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "propertyNamed:", CFSTR("ARMeshGeometryClassification"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "material");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "propertyNamed:", CFSTR("ARMeshGeometryMaterial"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            v20 = v19 == 0;
          else
            v20 = 1;
          if (!v20)
          {
            v38[0] = CFSTR("ARMeshClassificationID");
            v21 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v17, "floatValue");
            objc_msgSend(v21, "numberWithFloat:");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v38[1] = CFSTR("ARMeshMaterialID");
            v39[0] = v22;
            v23 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v19, "floatValue");
            objc_msgSend(v23, "numberWithFloat:");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v39[1] = v24;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = -[PHASEMaterial initWithEngine:semantics:]([PHASEMaterial alloc], "initWithEngine:semantics:", v32, v25);
            -[NSArray objectAtIndexedSubscript:](v31->_elements, "objectAtIndexedSubscript:", v12 + i);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setMaterial:", v26);

          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        v12 += i;
      }
      while (v11);
    }

  }
  return v31;
}

- (PHASEShape)initWithEngine:(id)a3 mesh:(id)a4 materials:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PHASEShape *v14;
  PHASEShape *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[PHASEShape initWithEngine:mesh:materials:](self, "initWithEngine:mesh:materials:", v10, v11, v12);
  v15 = v14;
  if (v14)
  {
    -[PHASEShape applyOptions:](v14, "applyOptions:", v13);
    -[PHASEShape buildLocalizedGeometryPermutations](v15, "buildLocalizedGeometryPermutations");
  }

  return v15;
}

- (id)geoShapeHandlesForEntityType:(unsigned int)a3
{
  LocalizedGeometryPermutation *begin;
  _DWORD *v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  id WeakRetained;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  Phase::Logger *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  LocalizedGeometryPermutation *end;
  NSArray *v31;
  id v33;
  uint64_t v34;
  id *location;
  void *__p;
  _BYTE *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[24];
  __int16 v44;
  void *v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  begin = self->_localizedGeometryPermutations.__begin_;
  end = self->_localizedGeometryPermutations.__end_;
  if (begin == end)
  {
LABEL_31:
    if (a3 - 3 <= 2 && !objc_msgSend(v33, "count"))
    {
      v24 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0)
                                                                                          + 432)));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        -[PHASEShape dumpState](self, "dumpState");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "PHASEShape.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 427;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = a3;
        v44 = 2112;
        v45 = v25;
        _os_log_impl(&dword_2164CC000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [PHASEShape geoShapeHandlesForEntityType] - Expected to find at least one geometry permutation with a matching entity type: %u.\n%@", buf, 0x22u);

      }
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  location = (id *)&self->_engine;
  while (1)
  {
    v4 = (_DWORD *)*((_QWORD *)begin + 6);
    v5 = (_DWORD *)*((_QWORD *)begin + 7);
    if (v4 != v5)
      break;
LABEL_30:
    begin = (LocalizedGeometryPermutation *)((char *)begin + 88);
    if (begin == end)
      goto LABEL_31;
  }
  v34 = (uint64_t)begin + 8;
  while (1)
  {
    if (*v4 != a3)
      goto LABEL_29;
    v6 = *((_QWORD *)begin + 10);
    if (!v6)
    {
      if (-[NSArray count](self->_elements, "count"))
      {
        v31 = self->_elements;
        std::vector<unsigned long long>::vector(&__p, -[NSArray count](v31, "count"));
        v7 = (uint64_t *)__p;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v8 = v31;
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v40 != v10)
                objc_enumerationMutation(v8);
              v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              objc_msgSend(v12, "material");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v13 == 0;

              if (v14)
              {
                v16 = 0;
              }
              else
              {
                objc_msgSend(v12, "material");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v15, "geoMaterialHandle");

              }
              *v7++ = v16;
            }
            v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
          }
          while (v9);
        }

        memset(buf, 0, sizeof(buf));
        std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(buf, __p, (uint64_t)v38, (v38 - (_BYTE *)__p) >> 3);
        v46 = 10;
        Phase::UnorderedStringMap<Phase::OptionsValue>::Set(v34, (uint64_t)&Phase::Geometry::ShapeOptions::MaterialList, (uint64_t)buf);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,unsigned int,float,double,Phase::Vector<float,2ul>,Phase::Vector<float,3ul>,Phase::Vector<float,4ul>,std::string,std::vector<unsigned int>,std::vector<unsigned long long>,Phase::UnorderedStringMap<Phase::OptionsValue>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)buf);
        if (__p)
        {
          v38 = __p;
          operator delete(__p);
        }
      }
      if (a3 == 4)
      {
        *(_DWORD *)buf = *((_DWORD *)begin + 18) & 7;
        v46 = 2;
        Phase::UnorderedStringMap<Phase::OptionsValue>::Set(v34, (uint64_t)&Phase::Geometry::ShapeOptions::SceneQueryFilter, (uint64_t)buf);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,unsigned int,float,double,Phase::Vector<float,2ul>,Phase::Vector<float,3ul>,Phase::Vector<float,4ul>,std::string,std::vector<unsigned int>,std::vector<unsigned long long>,Phase::UnorderedStringMap<Phase::OptionsValue>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)buf);
      }
      if (*(_DWORD *)begin == 2)
      {
        *(_DWORD *)buf = self->_voxelDensity;
        v46 = 1;
        Phase::UnorderedStringMap<Phase::OptionsValue>::Set(v34, (uint64_t)&Phase::Geometry::VoxelTreeOptions::Resolution, (uint64_t)buf);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,unsigned int,float,double,Phase::Vector<float,2ul>,Phase::Vector<float,3ul>,Phase::Vector<float,4ul>,std::string,std::vector<unsigned int>,std::vector<unsigned long long>,Phase::UnorderedStringMap<Phase::OptionsValue>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)buf);
      }
      WeakRetained = objc_loadWeakRetained(location);
      v18 = objc_msgSend(WeakRetained, "implementation");
      v6 = (*(uint64_t (**)(_QWORD, _QWORD, MdlMeshAsset *, uint64_t))(**(_QWORD **)(v18 + 368) + 40))(*(_QWORD *)(v18 + 368), *(_DWORD *)begin, &self->_meshAsset, v34);
      *((_QWORD *)begin + 10) = v6;

      if (!v6)
        goto LABEL_29;
    }
    v19 = objc_loadWeakRetained(location);
    v20 = *(_QWORD *)(objc_msgSend(v19, "implementation") + 368);
    memset(buf, 0, sizeof(buf));
    v21 = (*(uint64_t (**)(uint64_t, uint64_t, uint8_t *))(*(_QWORD *)v20 + 64))(v20, v6, buf);
    if (*(_QWORD *)buf)
    {
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
    }

    if (!v21)
      break;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v23);

LABEL_29:
    if (++v4 == v5)
      goto LABEL_30;
  }
  v27 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v22)
                                                                                      + 432)));
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    -[PHASEShape dumpState](self, "dumpState");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "PHASEShape.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 402;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a3;
    v44 = 2112;
    v45 = v28;
    _os_log_impl(&dword_2164CC000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEShape geoShapeHandlesForEntityType] - Failed to copy shapetype: %u.\n%@", buf, 0x22u);

  }
  v26 = 0;
LABEL_40:

  return v26;
}

- (void)updateMaterialForElement:(id)a3
{
  unint64_t v4;
  LocalizedGeometryPermutation *begin;
  LocalizedGeometryPermutation *end;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = -[NSArray indexOfObject:](self->_elements, "indexOfObject:");
  if (v4 >= -[NSArray count](self->_elements, "count"))
    std::terminate();
  begin = self->_localizedGeometryPermutations.__begin_;
  end = self->_localizedGeometryPermutations.__end_;
  while (begin != end)
  {
    v7 = *((_QWORD *)begin + 10);
    if (v7)
      -[PHASEShape updateMaterialForShape:fromElementIndex:](self, "updateMaterialForShape:fromElementIndex:", v7, v4);
    begin = (LocalizedGeometryPermutation *)((char *)begin + 88);
  }

}

- (void)updateMaterialForShape:(Handle64)a3 fromElementIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  id v11;

  if (!a3.mData)
    std::terminate();
  -[NSArray objectAtIndexedSubscript:](self->_elements, "objectAtIndexedSubscript:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "material");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v11, "material");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "geoMaterialHandle");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v10 = objc_msgSend(WeakRetained, "implementation");
  (*(void (**)(_QWORD, unint64_t, unint64_t, void *))(**(_QWORD **)(v10 + 368) + 80))(*(_QWORD *)(v10 + 368), a3.mData, a4, v7);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithShape:", self);
}

- (void)dealloc
{
  PHASEEngine **p_engine;
  id WeakRetained;
  LocalizedGeometryPermutation *begin;
  LocalizedGeometryPermutation *end;
  id v7;
  uint64_t v8;
  objc_super v9;

  p_engine = &self->_engine;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
  {
    begin = self->_localizedGeometryPermutations.__begin_;
    end = self->_localizedGeometryPermutations.__end_;
    while (begin != end)
    {
      if (*((_QWORD *)begin + 10))
      {
        v7 = objc_loadWeakRetained((id *)p_engine);
        v8 = objc_msgSend(v7, "implementation");
        (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)(v8 + 368) + 304))(*(_QWORD *)(v8 + 368), *((_QWORD *)begin + 10));

        *((_QWORD *)begin + 10) = 0;
      }
      begin = (LocalizedGeometryPermutation *)((char *)begin + 88);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PHASEShape;
  -[PHASEShape dealloc](&v9, sel_dealloc);
}

- (void)applyOptions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t isKindOfClass;
  id v11;
  Phase::Logger *v12;
  int8x8_t v13;
  uint8x8_t v14;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  Phase::Logger *v21;
  NSObject *v22;
  std::logic_error *exception;
  NSObject *v24;
  int v26;
  std::logic_error *v27;
  NSObject *v28;
  NSObject *v29;
  std::logic_error *v30;
  NSObject *v31;
  NSObject *v32;
  int v33;
  std::logic_error *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  unint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v36 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v8, (_QWORD)v35);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("PHASEVoxelDensityKey")))
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) == 0)
          {
            v22 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)isKindOfClass)
                                                             + 432));
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v40 = "PHASEShape.mm";
              v41 = 1024;
              v42 = 512;
              _os_log_impl(&dword_2164CC000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument): \"[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEVoxelDensityKey must be of \" \"class NSNumber.\", buf, 0x12u);
            }
            exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::logic_error::logic_error(exception, "[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEVoxelDensityKey must be of class NSNumber.");
            goto LABEL_41;
          }
          v11 = v9;
          v12 = (Phase::Logger *)objc_msgSend(v11, "intValue");
          v13.i32[0] = (int)v12;
          v14 = (uint8x8_t)vcnt_s8(v13);
          v14.i16[0] = vaddlv_u8(v14);
          if (v14.i32[0] != 1 || (v12 & 0xAAAAAAAA) != 0)
          {
            v24 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v12)
                                                                                                + 432)));
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v26 = objc_msgSend(v11, "intValue");
              *(_DWORD *)buf = 136315650;
              v40 = "PHASEShape.mm";
              v41 = 1024;
              v42 = 505;
              v43 = 1024;
              LODWORD(v44) = v26;
              _os_log_impl(&dword_2164CC000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument): \"[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEVoxelDensityKey must be a \" \"power of four. The value passed in == %d\", buf, 0x18u);
            }

            v27 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::logic_error::logic_error(v27, "[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEVoxelDensityKey must be a power of four. The value passed in == %d");
            v27->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8D0] + 16);
          }
          self->_voxelDensity = objc_msgSend(v11, "intValue");

        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("PHASEShapeCategoriesKey")))
        {
          objc_opt_class();
          v16 = objc_opt_isKindOfClass();
          if ((v16 & 1) == 0)
          {
            v28 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v16) + 432));
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v40 = "PHASEShape.mm";
              v41 = 1024;
              v42 = 538;
              _os_log_impl(&dword_2164CC000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument): \"[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEShapeCategoriesKey must be of \" \"class NSNumber.\", buf, 0x12u);
            }
            exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::logic_error::logic_error(exception, "[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEShapeCategoriesKey must be of class NSNumber.");
            goto LABEL_41;
          }
          v17 = objc_msgSend(v9, "unsignedIntegerValue");
          v18 = v17;
          if ((v17 & 7) == 0)
          {
            v29 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v17) + 432));
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v40 = "PHASEShape.mm";
              v41 = 1024;
              v42 = 531;
              v43 = 2048;
              v44 = v18;
              _os_log_impl(&dword_2164CC000, v29, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument): \"[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEShapeCategoriesKey must \" \"contain a valid set of PHASESpatialPipelineFlags. The value passed in == %lu\", buf, 0x1Cu);
            }
            v30 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::logic_error::logic_error(v30, "[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEShapeCategoriesKey must contain a valid set of PHASESpatialPipelineFlags. The value passed in == %lu");
            v30->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8D0] + 16);
          }
          self->_flags = v17;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("PHASEShapeIsRealKey")))
        {
          objc_opt_class();
          v19 = objc_opt_isKindOfClass();
          if ((v19 & 1) == 0)
          {
            v31 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v19) + 432));
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v40 = "PHASEShape.mm";
              v41 = 1024;
              v42 = 562;
              _os_log_impl(&dword_2164CC000, v31, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument): \"[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEShapeIsRealKey must be of \" \"class NSNumber.\", buf, 0x12u);
            }
            exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::logic_error::logic_error(exception, "[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEShapeIsRealKey must be of class NSNumber.");
LABEL_41:
            exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8D0] + 16);
          }
          v20 = v9;
          if (objc_msgSend(v20, "intValue"))
          {
            v21 = (Phase::Logger *)objc_msgSend(v20, "intValue");
            if ((_DWORD)v21 != 1)
            {
              v32 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v21)
                                                                                                  + 432)));
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                v33 = objc_msgSend(v20, "intValue");
                *(_DWORD *)buf = 136315650;
                v40 = "PHASEShape.mm";
                v41 = 1024;
                v42 = 555;
                v43 = 1024;
                LODWORD(v44) = v33;
                _os_log_impl(&dword_2164CC000, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument): \"[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEShapeIsRealKey be either \" \"YES, NO, 1 (integer) or 0 (integer). The value passed in == %d\", buf, 0x18u);
              }

              v34 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
              std::logic_error::logic_error(v34, "[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEShapeIsRealKey be either YES, NO, 1 (integer) or 0 (integer). The value passed in == %d");
              v34->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8D0] + 16);
            }
          }
          self->_isReal = objc_msgSend(v20, "BOOLValue");

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v5);
  }

}

- (void)buildLocalizedGeometryPermutations
{
  LocalizedGeometryPermutation *i;
  LocalizedGeometryPermutation *begin;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  uint64_t j;
  unint64_t v9;
  LocalizedGeometryPermutation *value;
  LocalizedGeometryPermutation *end;
  LocalizedGeometryPermutation *v12;
  LocalizedGeometryPermutation *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  LocalizedGeometryPermutation *v19;
  LocalizedGeometryPermutation *v20;
  LocalizedGeometryPermutation *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  int64x2_t v26;
  LocalizedGeometryPermutation *v27;
  void **v28;
  _BYTE v29[40];
  void *__p;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  int64x2_t v39;
  LocalizedGeometryPermutation *v40;
  __compressed_pair<Phase::LocalizedGeometryPermutation *, std::allocator<Phase::LocalizedGeometryPermutation>> *p_end_cap;

  begin = self->_localizedGeometryPermutations.__begin_;
  for (i = self->_localizedGeometryPermutations.__end_;
        i != begin;
        std::allocator<Phase::LocalizedGeometryPermutation>::destroy[abi:ne180100]((uint64_t)i))
  {
    i = (LocalizedGeometryPermutation *)((char *)i - 88);
  }
  self->_localizedGeometryPermutations.__end_ = begin;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v6 = objc_msgSend(WeakRetained, "implementation");
  v35 = 0;
  v36 = 0;
  v37 = 0;
  std::vector<Phase::Controller::GeometryPermutation>::__init_with_size[abi:ne180100]<Phase::Controller::GeometryPermutation*,Phase::Controller::GeometryPermutation*>(&v35, *(_QWORD *)(v6 + 544), *(_QWORD *)(v6 + 552), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(v6 + 552) - *(_QWORD *)(v6 + 544)) >> 4));

  v7 = v35;
  for (j = v36; v7 != j; v7 += 80)
  {
    v9 = self->_flags & *(_QWORD *)(v7 + 72);
    if ((v9 & 7) != 0)
    {
      LODWORD(v28) = *(_DWORD *)v7;
      std::unordered_map<Phase::UnorderedStringMap<Phase::OptionsValue>::InternalKey,Phase::OptionsValue,Phase::UnorderedStringMap<Phase::OptionsValue>::InternalHash,Phase::UnorderedStringMap<Phase::OptionsValue>::InternalEqualTo,std::allocator<std::pair<Phase::UnorderedStringMap<Phase::OptionsValue>::InternalKey const,Phase::OptionsValue>>>::unordered_map((uint64_t)v29, v7 + 8);
      __p = 0;
      v31 = 0;
      v32 = 0;
      std::vector<Phase::Geometry::EntityType>::__init_with_size[abi:ne180100]<Phase::Geometry::EntityType*,Phase::Geometry::EntityType*>(&__p, *(const void **)(v7 + 48), *(_QWORD *)(v7 + 56), (uint64_t)(*(_QWORD *)(v7 + 56) - *(_QWORD *)(v7 + 48)) >> 2);
      v33 = v9;
      v34 = 0;
      end = self->_localizedGeometryPermutations.__end_;
      value = self->_localizedGeometryPermutations.__end_cap_.__value_;
      if (end >= value)
      {
        v13 = self->_localizedGeometryPermutations.__begin_;
        v14 = 0x2E8BA2E8BA2E8BA3 * ((end - v13) >> 3);
        v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) > 0x2E8BA2E8BA2E8BALL)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v16 = 0x2E8BA2E8BA2E8BA3 * ((value - v13) >> 3);
        if (2 * v16 > v15)
          v15 = 2 * v16;
        if (v16 >= 0x1745D1745D1745DLL)
          v17 = 0x2E8BA2E8BA2E8BALL;
        else
          v17 = v15;
        p_end_cap = &self->_localizedGeometryPermutations.__end_cap_;
        if (v17)
          v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<Phase::LocalizedGeometryPermutation>>(v17);
        else
          v18 = 0;
        v38 = v17;
        v39.i64[0] = v17 + 88 * v14;
        v39.i64[1] = v39.i64[0];
        v40 = (LocalizedGeometryPermutation *)(v17 + 88 * v18);
        std::allocator<Phase::LocalizedGeometryPermutation>::construct[abi:ne180100]<Phase::LocalizedGeometryPermutation,Phase::LocalizedGeometryPermutation const&>(v39.i64[0], (uint64_t)&v28);
        v19 = (LocalizedGeometryPermutation *)v39.i64[0];
        v12 = (LocalizedGeometryPermutation *)(v39.i64[1] + 88);
        v39.i64[1] += 88;
        v21 = self->_localizedGeometryPermutations.__begin_;
        v20 = self->_localizedGeometryPermutations.__end_;
        if (v20 == v21)
        {
          v26 = vdupq_n_s64((unint64_t)v20);
        }
        else
        {
          v22 = j;
          v23 = 0;
          do
          {
            v24 = (char *)v19 + v23;
            v25 = (char *)v20 + v23;
            *(_DWORD *)((char *)v19 + v23 - 88) = *(_DWORD *)((char *)v20 + v23 - 88);
            std::__hash_table<std::__hash_value_type<int,Phase::Controller::Parameter<double>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,Phase::Controller::Parameter<double>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,Phase::Controller::Parameter<double>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,Phase::Controller::Parameter<double>>>>::__hash_table((uint64_t)v19 + v23 - 80, (uint64_t *)((char *)v20 + v23 - 80));
            *((_QWORD *)v24 - 5) = 0;
            *((_QWORD *)v24 - 4) = 0;
            *((_QWORD *)v24 - 3) = 0;
            *(_OWORD *)(v24 - 40) = *(_OWORD *)((char *)v20 + v23 - 40);
            *((_QWORD *)v24 - 3) = *(_QWORD *)((char *)v20 + v23 - 24);
            *((_QWORD *)v25 - 5) = 0;
            *((_QWORD *)v25 - 4) = 0;
            *((_QWORD *)v25 - 3) = 0;
            *((_OWORD *)v24 - 1) = *(_OWORD *)((char *)v20 + v23 - 16);
            v23 -= 88;
          }
          while ((LocalizedGeometryPermutation *)((char *)v20 + v23) != v21);
          v26 = *(int64x2_t *)&self->_localizedGeometryPermutations.__begin_;
          v12 = (LocalizedGeometryPermutation *)v39.i64[1];
          v19 = (LocalizedGeometryPermutation *)((char *)v19 + v23);
          j = v22;
        }
        self->_localizedGeometryPermutations.__begin_ = v19;
        self->_localizedGeometryPermutations.__end_ = v12;
        v39 = v26;
        v27 = self->_localizedGeometryPermutations.__end_cap_.__value_;
        self->_localizedGeometryPermutations.__end_cap_.__value_ = v40;
        v40 = v27;
        v38 = v26.i64[0];
        std::__split_buffer<Phase::LocalizedGeometryPermutation>::~__split_buffer((uint64_t)&v38);
      }
      else
      {
        std::allocator<Phase::LocalizedGeometryPermutation>::construct[abi:ne180100]<Phase::LocalizedGeometryPermutation,Phase::LocalizedGeometryPermutation const&>((uint64_t)self->_localizedGeometryPermutations.__end_, (uint64_t)&v28);
        v12 = (LocalizedGeometryPermutation *)((char *)end + 88);
        self->_localizedGeometryPermutations.__end_ = (LocalizedGeometryPermutation *)((char *)end + 88);
      }
      self->_localizedGeometryPermutations.__end_ = v12;
      if (__p)
      {
        v31 = __p;
        operator delete(__p);
      }
      std::__hash_table<std::__hash_value_type<Phase::UnorderedStringMap<Phase::OptionsValue>::InternalKey,Phase::OptionsValue>,std::__unordered_map_hasher<Phase::UnorderedStringMap<Phase::OptionsValue>::InternalKey,std::__hash_value_type<Phase::UnorderedStringMap<Phase::OptionsValue>::InternalKey,Phase::OptionsValue>,Phase::UnorderedStringMap<Phase::OptionsValue>::InternalHash,Phase::UnorderedStringMap<Phase::OptionsValue>::InternalEqualTo,true>,std::__unordered_map_equal<Phase::UnorderedStringMap<Phase::OptionsValue>::InternalKey,std::__hash_value_type<Phase::UnorderedStringMap<Phase::OptionsValue>::InternalKey,Phase::OptionsValue>,Phase::UnorderedStringMap<Phase::OptionsValue>::InternalEqualTo,Phase::UnorderedStringMap<Phase::OptionsValue>::InternalHash,true>,std::allocator<std::__hash_value_type<Phase::UnorderedStringMap<Phase::OptionsValue>::InternalKey,Phase::OptionsValue>>>::~__hash_table((uint64_t)v29);
    }
  }
  v28 = (void **)&v35;
  std::vector<Phase::Controller::GeometryPermutation>::__destroy_vector::operator()[abi:ne180100](&v28);
}

- (id)dumpState
{
  PHASEShape *v2;
  void *v3;
  id WeakRetained;
  uint64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t **v9;
  unsigned int *v10;
  PHASEShape *v11;
  unsigned int *v12;
  unsigned int *v13;
  LocalizedGeometryPermutation *begin;
  unsigned int *end;
  uint64_t v16;
  uint64_t **v17;
  unsigned int *v18;
  unsigned int *v19;
  unsigned int *v20;
  void *v21;
  unsigned int *v23;
  unsigned int *v24;
  uint64_t v25;
  unsigned int **v26;

  v2 = self;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("PHASEShape:%p: --- State ---"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&v2->_engine);
  v5 = objc_msgSend(WeakRetained, "implementation");
  v23 = 0;
  v24 = 0;
  v25 = 0;
  std::vector<Phase::Controller::GeometryPermutation>::__init_with_size[abi:ne180100]<Phase::Controller::GeometryPermutation*,Phase::Controller::GeometryPermutation*>(&v23, *(_QWORD *)(v5 + 544), *(_QWORD *)(v5 + 552), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(v5 + 552) - *(_QWORD *)(v5 + 544)) >> 4));

  objc_msgSend(v3, "appendFormat:", CFSTR("\nGeometryPermutations (%lu):"), 0xCCCCCCCCCCCCCCCDLL * (((char *)v24 - (char *)v23) >> 4));
  v6 = v23;
  v7 = v24;
  if (v23 != v24)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%d"), v8);
      objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tShapeType = %d"), *v6);
      v9 = Phase::UnorderedStringMap<Phase::OptionsValue>::Find((_QWORD *)v6 + 1, (__int128 *)&Phase::Geometry::MeshOptions::SortPrimitives);
      if (v9)
      {
        v10 = (unsigned int *)(v9 + 7);
        if (*((_DWORD *)v9 + 24) != 1)
          v10 = (unsigned int *)&dword_24D579740;
      }
      else
      {
        v10 = (unsigned int *)&dword_24D579740;
      }
      objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tPrimitiveSortType = %d"), *v10);
      v11 = v2;
      v12 = (unsigned int *)*((_QWORD *)v6 + 6);
      v13 = (unsigned int *)*((_QWORD *)v6 + 7);
      while (v12 != v13)
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tEntityType (%d) = %d"), 0, *v12++);
      objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tSpatialPipelineFlags = %lu"), *((_QWORD *)v6 + 9));
      v2 = v11;
      v8 = (v8 + 1);
      v6 += 20;
    }
    while (v6 != v7);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\nLocalizedGeometryPermutations (%lu):"), 0x2E8BA2E8BA2E8BA3* ((v2->_localizedGeometryPermutations.__end_ - v2->_localizedGeometryPermutations.__begin_) >> 3));
  begin = v2->_localizedGeometryPermutations.__begin_;
  end = (unsigned int *)v2->_localizedGeometryPermutations.__end_;
  if (begin != (LocalizedGeometryPermutation *)end)
  {
    v16 = 0;
    do
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%d"), v16);
      objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tShapeType = %d"), *(_DWORD *)begin);
      v17 = Phase::UnorderedStringMap<Phase::OptionsValue>::Find((_QWORD *)begin + 1, (__int128 *)&Phase::Geometry::MeshOptions::SortPrimitives);
      if (v17)
      {
        v18 = (unsigned int *)(v17 + 7);
        if (*((_DWORD *)v17 + 24) != 1)
          v18 = (unsigned int *)&dword_24D579740;
      }
      else
      {
        v18 = (unsigned int *)&dword_24D579740;
      }
      objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tPrimitiveSortType = %d"), *v18);
      v19 = (unsigned int *)*((_QWORD *)begin + 6);
      v20 = (unsigned int *)*((_QWORD *)begin + 7);
      while (v19 != v20)
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tEntityType (%d) = %d"), 0, *v19++);
      objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tSpatialPipelineFlags = %lu"), *((_QWORD *)begin + 9));
      v16 = (v16 + 1);
      begin = (LocalizedGeometryPermutation *)((char *)begin + 88);
    }
    while (begin != (LocalizedGeometryPermutation *)end);
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = &v23;
  std::vector<Phase::Controller::GeometryPermutation>::__destroy_vector::operator()[abi:ne180100]((void ***)&v26);

  return v21;
}

- (NSArray)elements
{
  return self->_elements;
}

- (PHASEEngine)engine
{
  return (PHASEEngine *)objc_loadWeakRetained((id *)&self->_engine);
}

- (void)setEngine:(id)a3
{
  objc_storeWeak((id *)&self->_engine, a3);
}

- (void).cxx_destruct
{
  LocalizedGeometryPermutation *begin;
  LocalizedGeometryPermutation *end;
  LocalizedGeometryPermutation *v5;

  objc_destroyWeak((id *)&self->_engine);
  begin = self->_localizedGeometryPermutations.__begin_;
  if (begin)
  {
    end = self->_localizedGeometryPermutations.__end_;
    v5 = self->_localizedGeometryPermutations.__begin_;
    if (end != begin)
    {
      do
      {
        end = (LocalizedGeometryPermutation *)((char *)end - 88);
        std::allocator<Phase::LocalizedGeometryPermutation>::destroy[abi:ne180100]((uint64_t)end);
      }
      while (end != begin);
      v5 = self->_localizedGeometryPermutations.__begin_;
    }
    self->_localizedGeometryPermutations.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_elements, 0);
  std::unique_ptr<Phase::details::MdlMeshAssetImplementation>::reset[abi:ne180100]((id **)&self->_meshAsset.mpImplementation, 0);
}

- (id).cxx_construct
{
  MdlMeshAssetImplementation *v3;

  self->_meshAsset.mType = 1;
  v3 = (MdlMeshAssetImplementation *)operator new();
  *(_QWORD *)v3 = 0;
  self->_meshAsset.mpImplementation.__ptr_.__value_ = v3;
  self->_localizedGeometryPermutations.__end_ = 0;
  self->_localizedGeometryPermutations.__end_cap_.__value_ = 0;
  self->_localizedGeometryPermutations.__begin_ = 0;
  return self;
}

@end
