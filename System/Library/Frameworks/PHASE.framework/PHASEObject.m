@implementation PHASEObject

- (PHASEObject)init
{
  -[PHASEObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEObject)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEObject)initWithEngine:(id)a3 entityType:(unsigned int)a4 shapes:(id)a5
{
  PHASEObject *v7;
  PHASEObject *v8;
  void *v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  id v16;
  id WeakRetained;
  BOOL v18;
  Phase::Logger *v19;
  void *v20;
  unint64_t j;
  void *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  PHASEObject *v41;
  id v42;
  NSObject *v43;
  id v44;
  void *v45;
  id v46;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  id *location;
  id v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *__p;
  char *v60;
  char *v61;
  objc_super v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  id v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  obj = a3;
  v53 = a5;
  v62.receiver = self;
  v62.super_class = (Class)PHASEObject;
  v7 = -[PHASEObject init](&v62, sel_init);
  v8 = v7;
  if (!v7)
  {
LABEL_48:
    v41 = v8;
    goto LABEL_59;
  }
  location = (id *)&v7->_engine;
  objc_storeWeak((id *)&v7->_engine, obj);
  objc_storeWeak((id *)&v8->_parent, 0);
  __p = 0;
  v60 = 0;
  v61 = 0;
  if (!v53 || !objc_msgSend(v53, "count"))
    goto LABEL_38;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v53, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHASEObject setGeoShapeHandles:](v8, "setGeoShapeHandles:", v9);

  v10 = objc_msgSend(v53, "count");
  if (v10 > (v61 - (_BYTE *)__p) >> 3)
  {
    if (v10 >> 61)
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>((uint64_t)&v61, v10);
    __p = &v11[(v60 - (_BYTE *)__p) & 0xFFFFFFFFFFFFFFF8];
    v60 = (char *)__p;
    v61 = &v11[8 * v12];
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v48 = v53;
  v13 = -[NSObject countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
  if (!v13)
    goto LABEL_37;
  v50 = *(_QWORD *)v56;
  while (2)
  {
    v49 = v13;
    for (i = 0; i != v49; ++i)
    {
      if (*(_QWORD *)v56 != v50)
        objc_enumerationMutation(v48);
      v15 = *(id *)(*((_QWORD *)&v55 + 1) + 8 * i);
      objc_msgSend(v15, "engine");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained(location);
      v18 = v16 == WeakRetained;

      if (!v18)
      {
        v43 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v19)
                                                                                            + 432)));
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = objc_loadWeakRetained(location);
          objc_msgSend(v15, "engine");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v64 = "PHASEObject.mm";
          v65 = 1024;
          v66 = 89;
          v67 = 2048;
          v68 = v44;
          v69 = 2048;
          v70 = v45;
          _os_log_impl(&dword_2164CC000, v43, OS_LOG_TYPE_ERROR, "%25s:%-5d engine@%p: Error: Attempting to use a shape initialized with a different PHASEEngine instance @%p", buf, 0x26u);

        }
        goto LABEL_55;
      }
      objc_msgSend(v15, "geoShapeHandlesForEntityType:", a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        v43 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0)
                                                                                            + 432)));
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v46 = objc_loadWeakRetained(location);
          *(_DWORD *)buf = 136315906;
          v64 = "PHASEObject.mm";
          v65 = 1024;
          v66 = 97;
          v67 = 2048;
          v68 = v46;
          v69 = 1024;
          LODWORD(v70) = a4;
          _os_log_impl(&dword_2164CC000, v43, OS_LOG_TYPE_ERROR, "%25s:%-5d engine@%p: Error: could not create shape handles for entity type %d!", buf, 0x22u);

        }
LABEL_55:

        goto LABEL_56;
      }
      for (j = 0; objc_msgSend(v20, "count") > j; ++j)
      {
        objc_msgSend(v20, "objectAtIndexedSubscript:", j);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "unsignedLongLongValue");

        if (v23)
        {
          v24 = v60;
          if (v60 >= v61)
          {
            v26 = (char *)__p;
            v27 = (v60 - (_BYTE *)__p) >> 3;
            v28 = v27 + 1;
            if ((unint64_t)(v27 + 1) >> 61)
              std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
            v29 = v61 - (_BYTE *)__p;
            if ((v61 - (_BYTE *)__p) >> 2 > v28)
              v28 = v29 >> 2;
            if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8)
              v30 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v30 = v28;
            if (v30)
            {
              v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>((uint64_t)&v61, v30);
              v26 = (char *)__p;
              v24 = v60;
            }
            else
            {
              v31 = 0;
            }
            v32 = (uint64_t *)&v31[8 * v27];
            *v32 = v23;
            v25 = (char *)(v32 + 1);
            while (v24 != v26)
            {
              v33 = *((_QWORD *)v24 - 1);
              v24 -= 8;
              *--v32 = v33;
            }
            __p = v32;
            v60 = v25;
            v61 = &v31[8 * v30];
            if (v26)
              operator delete(v26);
          }
          else
          {
            *(_QWORD *)v60 = v23;
            v25 = v24 + 8;
          }
          v60 = v25;
          -[PHASEObject geoShapeHandles](v8, "geoShapeHandles");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", j);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v35);

        }
      }

    }
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
    if (v13)
      continue;
    break;
  }
LABEL_37:

LABEL_38:
  if (!a4)
  {
LABEL_42:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v39 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 32);
      v38 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 48);
      v40 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
      *(_OWORD *)v8->_anon_10 = *MEMORY[0x24BDAEE00];
      *(_OWORD *)&v8->_anon_10[16] = v40;
      *(_OWORD *)&v8->_anon_10[32] = v39;
      *(_OWORD *)&v8->_anon_10[48] = v38;
    }
    else
    {
      -[PHASEObject setTransform:](v8, "setTransform:", *MEMORY[0x24BDAEE00], *(double *)(MEMORY[0x24BDAEE00] + 16), *(double *)(MEMORY[0x24BDAEE00] + 32), *(double *)(MEMORY[0x24BDAEE00] + 48));
    }
    if (__p)
    {
      v60 = (char *)__p;
      operator delete(__p);
    }
    goto LABEL_48;
  }
  v36 = objc_msgSend(obj, "implementation");
  -[PHASEObject setGeoEntityHandle:](v8, "setGeoEntityHandle:", (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v36 + 368) + 16))(*(_QWORD *)(v36 + 368), a4));
  if (-[PHASEObject geoEntityHandle](v8, "geoEntityHandle"))
  {
    if (v60 != __p)
    {
      v37 = *(_QWORD *)(objc_msgSend(obj, "implementation") + 368);
      (*(void (**)(uint64_t, uint64_t, void **))(*(_QWORD *)v37 + 96))(v37, -[PHASEObject geoEntityHandle](v8, "geoEntityHandle"), &__p);
    }
    goto LABEL_42;
  }
  v48 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0)
                                                                                      + 432)));
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    v42 = objc_loadWeakRetained(location);
    *(_DWORD *)buf = 136315906;
    v64 = "PHASEObject.mm";
    v65 = 1024;
    v66 = 119;
    v67 = 2048;
    v68 = v42;
    v69 = 1024;
    LODWORD(v70) = a4;
    _os_log_impl(&dword_2164CC000, v48, OS_LOG_TYPE_ERROR, "%25s:%-5d engine@%p: Error: could not create geometry entity handle for type %d!", buf, 0x22u);

  }
LABEL_56:

  if (__p)
  {
    v60 = (char *)__p;
    operator delete(__p);
  }
  v41 = 0;
LABEL_59:

  return v41;
}

- (PHASEObject)initWithEngine:(PHASEEngine *)engine
{
  PHASEEngine *v4;
  PHASEObject *v5;
  PHASEObject *v6;
  id WeakRetained;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  NSObject *v12;
  id v13;
  PHASEObject *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = engine;
  v16.receiver = self;
  v16.super_class = (Class)PHASEObject;
  v5 = -[PHASEObject init](&v16, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_9;
  objc_storeWeak((id *)&v5->_engine, v4);
  objc_storeWeak((id *)&v6->_parent, 0);
  WeakRetained = objc_loadWeakRetained((id *)&v6->_engine);
  v8 = objc_msgSend(WeakRetained, "implementation");
  -[PHASEObject setGeoEntityHandle:](v6, "setGeoEntityHandle:", (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(v8 + 368) + 16))(*(_QWORD *)(v8 + 368), 1));

  if (-[PHASEObject geoEntityHandle](v6, "geoEntityHandle"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 32);
      v9 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 48);
      v11 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
      *(_OWORD *)v6->_anon_10 = *MEMORY[0x24BDAEE00];
      *(_OWORD *)&v6->_anon_10[16] = v11;
      *(_OWORD *)&v6->_anon_10[32] = v10;
      *(_OWORD *)&v6->_anon_10[48] = v9;
    }
    else
    {
      -[PHASEObject setTransform:](v6, "setTransform:", *MEMORY[0x24BDAEE00], *(double *)(MEMORY[0x24BDAEE00] + 16), *(double *)(MEMORY[0x24BDAEE00] + 32), *(double *)(MEMORY[0x24BDAEE00] + 48));
    }
LABEL_9:
    v14 = v6;
    goto LABEL_10;
  }
  v12 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0)
                                                                                      + 432)));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = objc_loadWeakRetained((id *)&v6->_engine);
    *(_DWORD *)buf = 136315906;
    v18 = "PHASEObject.mm";
    v19 = 1024;
    v20 = 161;
    v21 = 2048;
    v22 = v13;
    v23 = 1024;
    v24 = 1;
    _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d engine@%p: Error: could not create geometry entity handle for type %d!", buf, 0x22u);

  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t isKindOfClass;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  PHASEObject *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v4 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "implementation"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[PHASEObject geoShapeHandles](self, "geoShapeHandles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v5);
          v9 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "unsignedLongLongValue");
          v10 = objc_msgSend(v4, "implementation");
          (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v10 + 368) + 304))(*(_QWORD *)(v10 + 368), v9);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
      }
      while (v6);
    }

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      v12 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)isKindOfClass)
                                                       + 432));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v21 = "PHASEObject.mm";
        v22 = 1024;
        v23 = 198;
        v24 = 2112;
        v25 = self;
        _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Destroyed %@", buf, 0x1Cu);
      }
    }
    v13 = *(_QWORD *)(objc_msgSend(v4, "implementation") + 368);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v13 + 280))(v13, -[PHASEObject geoEntityHandle](self, "geoEntityHandle"));
    -[PHASEObject setGeoEntityHandle:](self, "setGeoEntityHandle:", 0);
    -[PHASEObject geoShapeHandles](self, "geoShapeHandles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeAllObjects");

  }
  v15.receiver = self;
  v15.super_class = (Class)PHASEObject;
  -[PHASEObject dealloc](&v15, sel_dealloc);
}

- (BOOL)isConnectedToRoot
{
  BOOL v3;
  PHASEObject *i;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  char v9;
  uint64_t v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  for (i = self; ; i = (PHASEObject *)v10)
  {
    -[PHASEObject parent](i, "parent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5 != 0;

    if (!v5)
      break;
    -[PHASEObject parent](i, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      break;
    -[PHASEObject parent](i, "parent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) != 0)
      break;
    -[PHASEObject parent](i, "parent");
    v10 = objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (void)registerSubTree:(id)a3 engine:(id)a4
{
  id *v5;
  id v6;
  uint64_t v7;
  _QWORD *WeakRetained;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (id *)a3;
  v6 = a4;
  v7 = *(_QWORD *)(objc_msgSend(v6, "implementation") + 368);
  WeakRetained = objc_loadWeakRetained(v5 + 10);
  (*(void (**)(uint64_t, _QWORD, id))(*(_QWORD *)v7 + 240))(v7, WeakRetained[12], v5[12]);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v5[1];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        v13 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v12);
        +[PHASEObject registerSubTree:engine:](PHASEObject, "registerSubTree:engine:", v13, v6, (_QWORD)v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

+ (void)deRegisterSubTree:(id)a3 engine:(id)a4
{
  id *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  _QWORD *WeakRetained;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  NSObject *v18;
  uint64_t v19;
  Phase::Logger *InstancePtr;
  NSObject *v21;
  std::runtime_error *exception;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  BOOL v27;
  unint64_t v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = (id *)a3;
  v6 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v5[1];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v7);
        v11 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * i);
        +[PHASEObject deRegisterSubTree:engine:](PHASEObject, "deRegisterSubTree:engine:", v11, v6, (_QWORD)v23);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v8);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = Phase::Controller::TaskManager::GetService<Phase::Controller::AssetUnloader>((Phase::Logger *)(objc_msgSend(v6, "implementation", (_QWORD)v23) + 48), 12);
    WeakRetained = objc_loadWeakRetained(v5 + 10);
    v14 = WeakRetained[12];
    v15 = v5[12];
    v16 = **(_QWORD **)(v12 + 8);
    v28 = 0;
    v27 = 1;
    v17 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v16, 32, &v28, &v27);
    if (!v17)
    {
      InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      v21 = objc_retainAutorelease(**(id **)(v16 + 48));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "CommandQueue.hpp";
        v32 = 1024;
        v33 = 100;
        _os_log_impl(&dword_2164CC000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v27)
    {
      v18 = objc_retainAutorelease(**(id **)(v16 + 48));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v31 = "CommandQueue.hpp";
        v32 = 1024;
        v33 = 89;
        v34 = 2048;
        v35 = v28;
        v36 = 2048;
        v37 = 32;
        _os_log_impl(&dword_2164CC000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *v17 = &off_24D57F7D8;
    v17[1] = v12;
    v17[2] = v14;
    v17[3] = v15;
    Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v16, 32);
    atomic_store(0, (unsigned __int8 *)(v16 + 40));
  }
  else
  {
    v19 = *(_QWORD *)(objc_msgSend(v6, "implementation") + 368);
    WeakRetained = objc_loadWeakRetained(v5 + 10);
    (*(void (**)(uint64_t, _QWORD, id))(*(_QWORD *)v19 + 248))(v19, WeakRetained[12], v5[12]);
  }

}

- (BOOL)isUnderTarget:(id)a3
{
  PHASEObject *v4;
  PHASEObject *v5;
  PHASEObject *v6;
  PHASEObject *v7;

  v4 = (PHASEObject *)a3;
  v5 = self;
  while (1)
  {
    v6 = v5;
    if (v5 == v4)
      break;
    -[PHASEObject parent](v5, "parent");
    v5 = (PHASEObject *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v7 = 0;
      goto LABEL_6;
    }
  }
  v7 = v4;
LABEL_6:

  return v6 == v4;
}

- (BOOL)addChild:(PHASEObject *)child error:(NSError *)error
{
  PHASEObject *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  Phase::Logger *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  Phase::Logger *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  Phase::Logger *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  void *v26;
  Phase::Logger *v27;
  NSObject *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  Phase::Logger *v33;
  NSObject *v34;
  id v35;
  Handle64 v36;
  uint64_t v37;
  void *v38;
  Phase::Logger *v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  NSMutableSet *v45;
  NSMutableSet *children;
  void *v47;
  uint64_t v48;
  void *v49;
  Phase::Logger *v50;
  NSObject *v51;
  id v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  Phase::Logger *v63;
  NSObject *v64;
  id v65;
  BOOL v66;
  uint64_t isKindOfClass;
  NSObject *v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  int v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  PHASEObject *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  const __CFString *v83;
  uint64_t v84;
  const __CFString *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  _QWORD v97[2];

  v97[1] = *MEMORY[0x24BDAC8D0];
  v6 = child;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v8 = WeakRetained;
  if (error)
    *error = 0;
  if (!WeakRetained)
  {
    v15 = *MEMORY[0x24BDD0FC8];
    v96 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid PHASEEngine"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v97, &v96, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v17)
                                                                                        + 432)));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v15);
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      v72 = 1024;
      v73 = 305;
      v74 = 2080;
      v75 = objc_msgSend(v19, "UTF8String");
      _os_log_impl(&dword_2164CC000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (error)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913633, v11);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_67;
  }
  if (!v6)
  {
    v20 = *MEMORY[0x24BDD0FC8];
    v94 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Nil child PHASEObject is invalid"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v22)
                                                                                        + 432)));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v20);
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      v72 = 1024;
      v73 = 317;
      v74 = 2080;
      v75 = objc_msgSend(v24, "UTF8String");
      _os_log_impl(&dword_2164CC000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (error)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913634, v11);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_67;
  }
  if (v6 == self)
  {
    v25 = *MEMORY[0x24BDD0FC8];
    v92 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot make an entity a parent of itself"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v27)
                                                                                        + 432)));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v25);
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      v72 = 1024;
      v73 = 329;
      v74 = 2080;
      v75 = objc_msgSend(v29, "UTF8String");
      _os_log_impl(&dword_2164CC000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (error)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913634, v11);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_67;
  }
  if (-[PHASEObject isUnderTarget:](self, "isUnderTarget:", v6))
  {
    v9 = *MEMORY[0x24BDD0FC8];
    v90 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot add child that is in this object's parentage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v12)
                                                                                        + 432)));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v9);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      v72 = 1024;
      v73 = 343;
      v74 = 2080;
      v75 = objc_msgSend(v14, "UTF8String");
      _os_log_impl(&dword_2164CC000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (error)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913634, v11);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
LABEL_67:

    v66 = 0;
    goto LABEL_68;
  }
  -[PHASEObject engine](v6, "engine");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v30)
  {
    v31 = *MEMORY[0x24BDD0FC8];
    v88 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot add a child belonging to a different engine"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v33)
                                                                                        + 432)));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v31);
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      v72 = 1024;
      v73 = 357;
      v74 = 2080;
      v75 = objc_msgSend(v35, "UTF8String");
      _os_log_impl(&dword_2164CC000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (error)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913634, v11);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_67;
  }
  v36.mData = (unint64_t)-[PHASEObject geoEntityHandle](self, "geoEntityHandle");
  if (v36.mData == -[PHASEObject geoEntityHandle](v6, "geoEntityHandle"))
  {
    v37 = *MEMORY[0x24BDD0FC8];
    v86 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot make an entity a parent of itself"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v38;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v39)
                                                                                        + 432)));
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v37);
      v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      v72 = 1024;
      v73 = 370;
      v74 = 2080;
      v75 = objc_msgSend(v41, "UTF8String");
      _os_log_impl(&dword_2164CC000, v40, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (error)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913634, v11);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_67;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (Phase::CurrentProcessCanModifySharedEntities(void)::onceToken != -1)
      dispatch_once(&Phase::CurrentProcessCanModifySharedEntities(void)::onceToken, &__block_literal_global_4);
    if (!Phase::CurrentProcessCanModifySharedEntities(void)::currentProcessCanModifySharedEntities)
    {
      v53 = *MEMORY[0x24BDD0FC8];
      v84 = *MEMORY[0x24BDD0FC8];
      v85 = CFSTR("Cannot add PHASESharedListener as child");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v11)
                                                                                          + 432)));
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v71 = "PHASEObject.mm";
        v72 = 1024;
        v73 = 384;
        v74 = 2112;
        v75 = (uint64_t)v55;
        _os_log_impl(&dword_2164CC000, v54, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

      }
      if (error)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913634, v11);
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_67;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = *MEMORY[0x24BDD0FC8];
    v82 = *MEMORY[0x24BDD0FC8];
    v83 = CFSTR("Cannot add root object as child");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v11)
                                                                                        + 432)));
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      v72 = 1024;
      v73 = 398;
      v74 = 2112;
      v75 = (uint64_t)v44;
      _os_log_impl(&dword_2164CC000, v43, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

    }
    if (error)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913634, v11);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_67;
  }
  if (!self->_children)
  {
    v45 = (NSMutableSet *)objc_opt_new();
    children = self->_children;
    self->_children = v45;

  }
  -[PHASEObject parent](v6, "parent");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    v48 = *MEMORY[0x24BDD0FC8];
    v80 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PHASEObject child node already has a parent"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v49;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v50)
                                                                                        + 432)));
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v48);
      v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      v72 = 1024;
      v73 = 419;
      v74 = 2080;
      v75 = objc_msgSend(v52, "UTF8String");
      _os_log_impl(&dword_2164CC000, v51, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (error)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913634, v11);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_67;
  }
  -[PHASEObject engine](self, "engine");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHASEObject engine](v6, "engine");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56 != v57)
  {
    v58 = *MEMORY[0x24BDD0FC8];
    v78 = *MEMORY[0x24BDD0FC8];
    v59 = (void *)MEMORY[0x24BDD17C8];
    -[PHASEObject engine](self, "engine");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHASEObject engine](v6, "engine");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "stringWithFormat:", CFSTR("PHASEObject child is registered with a different engine instance than the parent @%p - @%p"), v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v62;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v63)
                                                                                        + 432)));
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v58);
      v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      v72 = 1024;
      v73 = 436;
      v74 = 2080;
      v75 = objc_msgSend(v65, "UTF8String");
      _os_log_impl(&dword_2164CC000, v64, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (error)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913634, v11);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_67;
  }
  -[NSMutableSet addObject:](self->_children, "addObject:", v6);
  -[PHASEObject setParent:](v6, "setParent:", self);
  if (-[PHASEObject isConnectedToRoot](self, "isConnectedToRoot"))
    +[PHASEObject registerSubTree:engine:](PHASEObject, "registerSubTree:engine:", v6, v8);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v69 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)isKindOfClass)
                                                     + 432));
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v71 = "PHASEObject.mm";
      v72 = 1024;
      v73 = 455;
      v74 = 2112;
      v75 = (uint64_t)v6;
      v76 = 2112;
      v77 = self;
      _os_log_impl(&dword_2164CC000, v69, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Added child %@ to parent %@", buf, 0x26u);
    }
  }
  v66 = 1;
LABEL_68:

  return v66;
}

- (void)removeChild:(PHASEObject *)child
{
  PHASEObject *v4;
  Phase::Logger *WeakRetained;
  Phase::Logger *v6;
  PHASEObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t isKindOfClass;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  PHASEObject *v17;
  __int16 v18;
  PHASEObject *v19;
  __int16 v20;
  PHASEObject *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = child;
  WeakRetained = (Phase::Logger *)objc_loadWeakRetained((id *)&self->_engine);
  v6 = WeakRetained;
  if (v4
    && WeakRetained
    && (-[PHASEObject parent](v4, "parent"),
        v7 = (PHASEObject *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 == self))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      v11 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)isKindOfClass)
                                                       + 432));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315906;
        v13 = "PHASEObject.mm";
        v14 = 1024;
        v15 = 474;
        v16 = 2112;
        v17 = v4;
        v18 = 2112;
        v19 = self;
        _os_log_impl(&dword_2164CC000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Removed child %@ from parent %@", (uint8_t *)&v12, 0x26u);
      }
    }
    if (-[PHASEObject isConnectedToRoot](self, "isConnectedToRoot"))
      +[PHASEObject deRegisterSubTree:engine:](PHASEObject, "deRegisterSubTree:engine:", v4, v6);
    -[NSMutableSet removeObject:](self->_children, "removeObject:", v4);
    -[PHASEObject setParent:](v4, "setParent:", 0);
  }
  else
  {
    v8 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(WeakRetained)
                                                                                       + 432)));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[PHASEObject parent](v4, "parent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136316418;
      v13 = "PHASEObject.mm";
      v14 = 1024;
      v15 = 468;
      v16 = 2048;
      v17 = (PHASEObject *)v6;
      v18 = 2048;
      v19 = self;
      v20 = 2048;
      v21 = v4;
      v22 = 2048;
      v23 = v9;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d engine@%p: Error: object@%p, cannot remove the child@%p with parent@%p!", (uint8_t *)&v12, 0x3Au);

    }
  }

}

- (void)removeChildren
{
  id WeakRetained;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained && -[PHASEObject isConnectedToRoot](self, "isConnectedToRoot"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = self->_children;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          v8 = *(id *)(*((_QWORD *)&v9 + 1) + 8 * v7);
          +[PHASEObject deRegisterSubTree:engine:](PHASEObject, "deRegisterSubTree:engine:", v8, WeakRetained, (_QWORD)v9);

          ++v7;
        }
        while (v5 != v7);
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
  -[NSMutableSet removeAllObjects](self->_children, "removeAllObjects", (_QWORD)v9);

}

- (NSArray)children
{
  NSMutableSet *children;
  void *v4;
  void *v5;
  void *v6;

  children = self->_children;
  if (children && -[NSMutableSet count](children, "count"))
  {
    v4 = (void *)MEMORY[0x24BDBCE30];
    -[NSMutableSet allObjects](self->_children, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v6;
}

+ (simd_float3)right
{
  return (simd_float3)xmmword_2166F8010;
}

+ (simd_float3)up
{
  return (simd_float3)xmmword_21673A2B0;
}

+ (simd_float3)forward
{
  return (simd_float3)xmmword_21673A2C0;
}

- (BOOL)validateTransform:(__n128)a3 outAffine:(__n128)a4
{
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  unint64_t v15;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;
  float *v26;
  uint64_t i;
  uint64_t v28;
  float *v29;
  float *v30;
  uint64_t j;
  float v32;
  float v33;
  uint64_t v34;
  float *v35;
  float *v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  uint64_t v56;
  float *v57;
  float32x2_t *v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  NSObject *v64;
  _BOOL8 result;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE *v70;
  _BYTE *v71;
  _BYTE *v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  unint64_t v81;
  float v82;
  NSObject *v83;
  _BOOL4 v84;
  int v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  unint64_t v94;
  float v95;
  uint64_t v96;
  __int128 v97;
  float v98[12];
  unint64_t v99;
  unsigned __int32 v100;
  int v101;
  float v102[13];
  uint64_t v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  float v111;
  float v112;
  _BYTE buf[38];
  __int16 v114;
  double v115;
  __int16 v116;
  double v117;
  __int16 v118;
  double v119;
  __int16 v120;
  double v121;
  __int16 v122;
  double v123;
  __int16 v124;
  double v125;
  __int16 v126;
  double v127;
  __int16 v128;
  double v129;
  __int16 v130;
  double v131;
  __int16 v132;
  double v133;
  __int16 v134;
  double v135;
  __int16 v136;
  double v137;
  __int16 v138;
  double v139;
  __int16 v140;
  double v141;
  uint64_t v142;

  v142 = *MEMORY[0x24BDAC8D0];
  v7 = a2.n128_f32[1];
  v8 = a2.n128_f32[2];
  v9 = a2.n128_f32[3];
  v10 = a3.n128_f32[1];
  v11 = a3.n128_f32[3];
  v12 = a5.n128_f32[1];
  v13 = a5.n128_f32[3];
  v97 = xmmword_2166F7280;
  v95 = 0.0;
  v96 = 0;
  if (a5.n128_f32[3] < 0.0)
    v14 = -a5.n128_f32[3];
  else
    v14 = a5.n128_f32[3];
  v94 = a5.n128_u64[0];
  v93 = a5.n128_f32[2];
  v92 = a3.n128_f32[0];
  v15 = a4.n128_u64[0];
  v91 = a4.n128_f32[3];
  v89 = a3.n128_f32[2];
  v90 = a4.n128_f32[2];
  v88 = a2.n128_f32[0];
  if (v14 <= 0.00000011921)
    goto LABEL_39;
  v86 = a3.n128_f32[1];
  v87 = a5.n128_f32[1];
  v102[0] = a2.n128_f32[0] / a5.n128_f32[3];
  v102[1] = a2.n128_f32[1] / a5.n128_f32[3];
  v17 = a2.n128_f32[3] / a5.n128_f32[3];
  v102[2] = a2.n128_f32[2] / a5.n128_f32[3];
  v102[3] = a2.n128_f32[3] / a5.n128_f32[3];
  v102[4] = a3.n128_f32[0] / a5.n128_f32[3];
  v102[5] = a3.n128_f32[1] / a5.n128_f32[3];
  v18 = a3.n128_f32[3];
  v19 = a3.n128_f32[3] / a5.n128_f32[3];
  v102[6] = a3.n128_f32[2] / a5.n128_f32[3];
  v102[7] = a3.n128_f32[3] / a5.n128_f32[3];
  v102[8] = a4.n128_f32[0] / a5.n128_f32[3];
  v102[9] = a4.n128_f32[1] / a5.n128_f32[3];
  v20 = a4.n128_f32[3] / a5.n128_f32[3];
  v102[10] = a4.n128_f32[2] / a5.n128_f32[3];
  v102[11] = a4.n128_f32[3] / a5.n128_f32[3];
  v98[0] = a2.n128_f32[0] / a5.n128_f32[3];
  v98[1] = a2.n128_f32[1] / a5.n128_f32[3];
  v98[2] = a2.n128_f32[2] / a5.n128_f32[3];
  v98[4] = a3.n128_f32[0] / a5.n128_f32[3];
  v98[5] = a3.n128_f32[1] / a5.n128_f32[3];
  v98[6] = a3.n128_f32[2] / a5.n128_f32[3];
  v98[8] = a4.n128_f32[0] / a5.n128_f32[3];
  v98[9] = a4.n128_f32[1] / a5.n128_f32[3];
  v98[10] = a4.n128_f32[2] / a5.n128_f32[3];
  v99 = a5.n128_u64[0];
  v100 = a5.n128_u32[2];
  v98[3] = 0.0;
  v98[7] = 0.0;
  v98[11] = 0.0;
  v101 = 1065353216;
  v21 = Phase::Determinant<float>(v98);
  if (v21 < 0.0)
    v21 = -v21;
  if (v21 <= 0.00000011921)
  {
    v11 = v18;
    v10 = v86;
    v12 = v87;
LABEL_39:
    v64 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 432));
    result = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    *(_DWORD *)buf = 136319490;
    *(_QWORD *)&buf[4] = "PHASEObject.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 547;
    *(_WORD *)&buf[18] = 2048;
    *(double *)&buf[20] = v88;
    *(_WORD *)&buf[28] = 2048;
    *(double *)&buf[30] = v7;
    v114 = 2048;
    v115 = v8;
    v116 = 2048;
    v117 = v9;
    v118 = 2048;
    v119 = v92;
    v120 = 2048;
    v121 = v10;
    v122 = 2048;
    v123 = v89;
    v124 = 2048;
    v125 = v11;
    v126 = 2048;
    v127 = *(float *)&v15;
    v128 = 2048;
    v129 = *((float *)&v15 + 1);
    v130 = 2048;
    v131 = v90;
    v132 = 2048;
    v133 = v91;
    v134 = 2048;
    v135 = *(float *)&v94;
    v136 = 2048;
    v137 = v12;
    v138 = 2048;
    v139 = v93;
    v140 = 2048;
    v141 = v13;
    v66 = "%25s:%-5d [PHASEObject setTransform]: transform either has a zero in the last row diagonal (and thus can't be "
          "normalized), or it's singular (i.e., non-invertible, non-orthogonal): [%f, %f, %f, %f], [%f, %f, %f, %f], [%f,"
          " %f, %f, %f], [%f, %f, %f, %f]";
    goto LABEL_55;
  }
  v22 = -v17;
  if (v17 >= 0.0)
    v22 = v9 / v13;
  if (v22 <= 0.00000011921)
    goto LABEL_17;
  v23 = -v19;
  if (v19 >= 0.0)
    v23 = v19;
  if (v23 <= 0.00000011921)
    goto LABEL_17;
  v24 = -v20;
  if (v20 >= 0.0)
    v24 = v20;
  if (v24 <= 0.00000011921)
  {
LABEL_17:
    v25 = 0;
    v26 = (float *)buf;
    do
    {
      for (i = 0; i != 4; ++i)
      {
        v28 = 0;
        v29 = &v104;
        v30 = v98;
        do
        {
          if (v28 != i)
          {
            for (j = 0; j != 4; ++j)
            {
              if (v25 != j)
                *v29++ = v30[j];
            }
          }
          ++v28;
          v30 += 4;
        }
        while (v28 != 4);
        v32 = (float)((float)((float)((float)((float)(v105 * v109) * v110) + (float)((float)(v104 * v108) * v112))
                            + (float)((float)(v106 * v107) * v111))
                    + (float)((float)-(float)(v106 * v108) * v110))
            + (float)((float)-(float)(v105 * v107) * v112);
        v33 = -(float)(v32 + (float)((float)-(float)(v104 * v109) * v111));
        if (((i ^ v25) & 1) == 0)
          v33 = v32 + (float)((float)-(float)(v104 * v109) * v111);
        *v26++ = v33;
      }
      ++v25;
    }
    while (v25 != 4);
  }
  v34 = 0;
  v103 = 0;
  v102[12] = 0.0;
  memset(buf, 0, 36);
  v35 = v102;
  do
  {
    v36 = (float *)&buf[v34];
    *(_QWORD *)v36 = *(_QWORD *)v35;
    v36[2] = v35[2];
    v34 += 12;
    v35 += 4;
  }
  while (v34 != 36);
  v37 = sqrtf((float)((float)(*(float *)buf * *(float *)buf) + (float)(*(float *)&buf[4] * *(float *)&buf[4]))+ (float)(*(float *)&buf[8] * *(float *)&buf[8]));
  v38 = *(float *)buf / v37;
  *(float *)buf = v38;
  *(float *)&buf[4] = *(float *)&buf[4] / v37;
  v39 = (float)((float)(v38 * *(float *)&buf[12]) + (float)(*(float *)&buf[4] * *(float *)&buf[16]))
      + (float)((float)(*(float *)&buf[8] / v37) * *(float *)&buf[20]);
  v40 = *(float *)&buf[12] - (float)(v38 * v39);
  v41 = *(float *)&buf[16] - (float)(*(float *)&buf[4] * v39);
  v42 = *(float *)&buf[20] - (float)((float)(*(float *)&buf[8] / v37) * v39);
  v43 = sqrtf((float)(v42 * v42) + (float)((float)(v40 * v40) + (float)(v41 * v41)));
  v95 = v37;
  *(float *)&v96 = v43;
  v44 = v41 / v43;
  *(float *)&buf[8] = *(float *)&buf[8] / v37;
  *(float *)&buf[12] = v40 / v43;
  *(float *)&buf[16] = v44;
  *(float *)&buf[20] = v42 / v43;
  v45 = (float)((float)(v38 * *(float *)&buf[24]) + (float)(*(float *)&buf[4] * *(float *)&buf[28]))
      + (float)(*(float *)&buf[8] * *(float *)&buf[32]);
  v46 = *(float *)&buf[24] - (float)(v38 * v45);
  v47 = *(float *)&buf[28] - (float)(*(float *)&buf[4] * v45);
  v48 = *(float *)&buf[32] - (float)(*(float *)&buf[8] * v45);
  v49 = (float)(*(float *)&buf[20] * v48) + (float)((float)((float)(v40 / v43) * v46) + (float)(v44 * v47));
  v50 = v46 - (float)(*(float *)&buf[12] * v49);
  v51 = v47 - (float)(v44 * v49);
  v52 = v48 - (float)(*(float *)&buf[20] * v49);
  v53 = sqrtf((float)(v52 * v52) + (float)((float)(v50 * v50) + (float)(v51 * v51)));
  *((float *)&v96 + 1) = v53;
  v54 = v51 / v53;
  v55 = v52 / v53;
  *(float *)&buf[24] = v50 / v53;
  *(float *)&buf[28] = v54;
  *(float *)&buf[32] = v52 / v53;
  if ((float)((float)(*(float *)&buf[8] * (float)((float)(*(float *)&buf[12] * v54) - (float)(v44 * (float)(v50 / v53))))
             + (float)((float)(v38 * (float)((float)(v44 * (float)(v52 / v53)) - (float)(*(float *)&buf[20] * v54)))
                     + (float)(*(float *)&buf[4]
                             * (float)((float)(*(float *)&buf[20] * (float)(v50 / v53))
                                     - (float)(*(float *)&buf[12] * (float)(v52 / v53)))))) < 0.0)
  {
    v56 = 0;
    v57 = &v95;
    do
    {
      *v57 = -*v57;
      ++v57;
      v58 = (float32x2_t *)&buf[v56];
      *v58 = vneg_f32(*(float32x2_t *)&buf[v56]);
      v58[1].f32[0] = -*(float *)&buf[v56 + 8];
      v56 += 12;
    }
    while (v56 != 36);
    v55 = *(float *)&buf[32];
    v44 = *(float *)&buf[16];
    v38 = *(float *)buf;
  }
  v59 = v49 / v53;
  v60 = v55 + (float)(v44 + v38);
  if (v60 <= 0.0)
  {
    v67 = v44 > v38;
    if (v55 > *(float *)(((unint64_t)buf | (4 * v67) | (8 * v67)) + 4 * v67))
      v67 = 2;
    v68 = Phase::Decompose<float>(Phase::Matrix<float,4ul,4ul> const&,Phase::Quaternion<float> &,Phase::Vector<float,3ul> &,Phase::Vector<float,3ul> &,Phase::Vector<float,3ul> &,Phase::Vector<float,4ul> &,float)::sNext[v67];
    v69 = Phase::Decompose<float>(Phase::Matrix<float,4ul,4ul> const&,Phase::Quaternion<float> &,Phase::Vector<float,3ul> &,Phase::Vector<float,3ul> &,Phase::Vector<float,3ul> &,Phase::Vector<float,4ul> &,float)::sNext[v68];
    v70 = &buf[12 * v67];
    v71 = &buf[12 * (int)v68];
    v72 = &buf[12 * (int)v69];
    v73 = sqrtf((float)((float)(*(float *)&v70[4 * v67] - *(float *)&v71[4 * v68]) - *(float *)&v72[4 * v69]) + 1.0);
    *(float *)((unint64_t)&v97 | (4 * v67)) = v73 * 0.5;
    v74 = 0.5 / v73;
    v98[v68 - 1] = v74 * (float)(*(float *)&v70[4 * v68] + *(float *)&v71[4 * v67]);
    v98[v69 - 1] = v74 * (float)(*(float *)&v70[4 * v69] + *(float *)&v72[4 * v67]);
    v62 = v74 * (float)(*(float *)&v71[4 * v69] - *(float *)&v72[4 * v68]);
  }
  else
  {
    v61 = sqrtf(v60 + 1.0);
    v62 = v61 * 0.5;
    v63 = 0.5 / v61;
    *(float32x2_t *)&v97 = vmul_n_f32(vsub_f32(*(float32x2_t *)&buf[20], (float32x2_t)__PAIR64__(*(unsigned int *)&buf[8], *(unsigned int *)&buf[28])), v63);
    *((float *)&v97 + 2) = v63 * (float)(*(float *)&buf[4] - *(float *)&buf[12]);
  }
  *((float *)&v97 + 3) = v62;
  if (v59 < 0.0)
    v59 = -v59;
  if (v59 > 0.0001)
    goto LABEL_53;
  v75 = v45 / v53;
  if (v75 < 0.0)
    v75 = -v75;
  if (v75 > 0.0001)
    goto LABEL_53;
  v76 = v39 / v43;
  if (v76 < 0.0)
    v76 = -v76;
  if (v76 > 0.0001)
  {
LABEL_53:
    v64 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 432));
    result = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    *(_DWORD *)buf = 136319490;
    *(_QWORD *)&buf[4] = "PHASEObject.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 561;
    *(_WORD *)&buf[18] = 2048;
    *(double *)&buf[20] = v88;
    *(_WORD *)&buf[28] = 2048;
    *(double *)&buf[30] = v7;
    v114 = 2048;
    v115 = v8;
    v116 = 2048;
    v117 = v9;
    v118 = 2048;
    v119 = v92;
    v120 = 2048;
    v121 = v86;
    v122 = 2048;
    v123 = v89;
    v124 = 2048;
    v125 = v18;
    v126 = 2048;
    v127 = *(float *)&v15;
    v128 = 2048;
    v129 = *((float *)&v15 + 1);
    v130 = 2048;
    v131 = v90;
    v132 = 2048;
    v133 = v91;
    v134 = 2048;
    v135 = *(float *)&v94;
    v136 = 2048;
    v137 = v87;
    v138 = 2048;
    v139 = v93;
    v140 = 2048;
    v141 = v13;
    v66 = "%25s:%-5d [PHASEObject setTransform]: transform is skewed (i.e., has non axis-aligned scale): [%f, %f, %f, %f]"
          ", [%f, %f, %f, %f], [%f, %f, %f, %f], [%f, %f, %f, %f]";
    goto LABEL_55;
  }
  v77 = fmaxf(fmaxf(v95, *(float *)&v96), *((float *)&v96 + 1));
  v78 = v77 * 0.001;
  v79 = v95 - *(float *)&v96;
  if ((float)(v95 - *(float *)&v96) < 0.0)
    v79 = -(float)(v95 - *(float *)&v96);
  if (v79 > v78)
    goto LABEL_63;
  v80 = v95 - *((float *)&v96 + 1);
  if ((float)(v95 - *((float *)&v96 + 1)) < 0.0)
    v80 = -v80;
  if (v80 <= v78)
  {
    v81 = v94;
    v82 = v93;
    if (fabsf(*(float *)&v94) >= 1000000000.0 || fabsf(v87) >= 1000000000.0 || fabsf(v93) >= 1000000000.0)
    {
      v83 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 432));
      v84 = os_log_type_enabled(v83, OS_LOG_TYPE_ERROR);
      v82 = v93;
      v81 = v94;
      if (v84)
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "PHASEObject.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 591;
        *(_WORD *)&buf[18] = 2048;
        *(double *)&buf[20] = *(float *)&v94;
        *(_WORD *)&buf[28] = 2048;
        *(double *)&buf[30] = v87;
        v114 = 2048;
        v115 = v93;
        _os_log_impl(&dword_2164CC000, v83, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEObject setTransform]: WARNING: transform has extremely large translation values [%f, %f, %f]. Expect numerical errors.", buf, 0x30u);
        v82 = v93;
        v81 = v94;
      }
    }
    v85 = DWORD2(v97);
    *(_QWORD *)a7 = v97;
    *(_DWORD *)(a7 + 8) = v85;
    *(float *)(a7 + 12) = v62;
    *(_QWORD *)(a7 + 16) = v81;
    *(float *)(a7 + 24) = v82;
    *(float *)(a7 + 28) = v77;
    return 1;
  }
  else
  {
LABEL_63:
    v64 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 432));
    result = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)buf = 136319490;
      *(_QWORD *)&buf[4] = "PHASEObject.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 579;
      *(_WORD *)&buf[18] = 2048;
      *(double *)&buf[20] = v88;
      *(_WORD *)&buf[28] = 2048;
      *(double *)&buf[30] = v7;
      v114 = 2048;
      v115 = v8;
      v116 = 2048;
      v117 = v9;
      v118 = 2048;
      v119 = v92;
      v120 = 2048;
      v121 = v86;
      v122 = 2048;
      v123 = v89;
      v124 = 2048;
      v125 = v18;
      v126 = 2048;
      v127 = *(float *)&v15;
      v128 = 2048;
      v129 = *((float *)&v15 + 1);
      v130 = 2048;
      v131 = v90;
      v132 = 2048;
      v133 = v91;
      v134 = 2048;
      v135 = *(float *)&v94;
      v136 = 2048;
      v137 = v87;
      v138 = 2048;
      v139 = v93;
      v140 = 2048;
      v141 = v13;
      v66 = "%25s:%-5d [PHASEObject setTransform]: transform has non-uniform scale: [%f, %f, %f, %f], [%f, %f, %f, %f], ["
            "%f, %f, %f, %f], [%f, %f, %f, %f]";
LABEL_55:
      _os_log_impl(&dword_2164CC000, v64, OS_LOG_TYPE_ERROR, v66, buf, 0xB2u);
      return 0;
    }
  }
  return result;
}

- (__n128)_storeTransform:(__n128)a3
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  return result;
}

- (void)setTransform:(simd_float4x4)transform
{
  id WeakRetained;
  Phase::Logger *v5;
  Phase::Logger *InstancePtr;
  Phase::Logger *v7;
  uint64_t v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  Handle64 v11;
  uint64_t v12;
  Handle64 v13;
  char isKindOfClass;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  float v21;
  uint64_t v22;
  int v23;
  uint8_t buf[4];
  PHASEObject *v25;
  __int16 v26;
  unint64_t mData;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained)
  {
    if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32((float32x4_t)transform.columns[1], *(float32x4_t *)&self->_anon_10[16]), (int8x16_t)vceqq_f32((float32x4_t)transform.columns[0], *(float32x4_t *)self->_anon_10)), vandq_s8((int8x16_t)vceqq_f32((float32x4_t)transform.columns[2], *(float32x4_t *)&self->_anon_10[32]), (int8x16_t)vceqq_f32((float32x4_t)transform.columns[3], *(float32x4_t *)&self->_anon_10[48])))) & 0x80000000) == 0)
    {
      v20 = xmmword_2166F7280;
      v21 = 0.0;
      v22 = 0;
      v23 = 1065353216;
      v5 = (Phase::Logger *)-[PHASEObject validateTransform:outAffine:](self, "validateTransform:outAffine:", &v20, *(double *)transform.columns[0].i64, *(double *)transform.columns[1].i64, *(double *)transform.columns[2].i64, *(double *)transform.columns[3].i64);
      if ((v5 & 1) != 0)
      {
        InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(v5);
        if (*((_BYTE *)InstancePtr + 440))
        {
          v7 = (Phase::Logger *)objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(InstancePtr)
                                                                                                  + 432)));
          v8 = Phase::Logger::GetInstancePtr(v7);
          v9 = os_signpost_id_generate(**(os_log_t **)(v8 + 432));
          if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v10 = v9;
            if (os_signpost_enabled((os_log_t)v7))
            {
              v11.mData = (unint64_t)-[PHASEObject geoEntityHandle](self, "geoEntityHandle");
              *(_DWORD *)buf = 134220032;
              v25 = self;
              v26 = 2048;
              mData = v11.mData;
              v28 = 2048;
              v29 = *(float *)&v20;
              v30 = 2048;
              v31 = *((float *)&v20 + 1);
              v32 = 2048;
              v33 = *((float *)&v20 + 2);
              v34 = 2048;
              v35 = *((float *)&v20 + 3);
              v36 = 2048;
              v37 = v21;
              v38 = 2048;
              v39 = *(float *)&v22;
              v40 = 2048;
              v41 = *((float *)&v22 + 1);
              _os_signpost_emit_with_name_impl(&dword_2164CC000, (os_log_t)v7, OS_SIGNPOST_EVENT, v10, "Phase_API_Transform_Update", "Entity@%p: %llu Update Rotation: [%f, %f, %f, %f], Position: [%f, %f, %f]", buf, 0x5Cu);
            }
          }

        }
        v12 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation", *(_OWORD *)transform.columns, *(_OWORD *)&transform.columns[1], *(_OWORD *)&transform.columns[2], *(_OWORD *)&transform.columns[3])+ 368);
        v13.mData = (unint64_t)-[PHASEObject geoEntityHandle](self, "geoEntityHandle");
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        (*(void (**)(uint64_t, Handle64, __int128 *, _QWORD))(*(_QWORD *)v12 + 256))(v12, v13, &v20, isKindOfClass & 1);
        -[PHASEObject _storeTransform:](self, "_storeTransform:", v16, v17, v18, v19);
      }
    }
  }

}

- (__n128)_convertTransform:(__n128)a3 fromObject:(__n128)a4
{
  id v8;
  void *v9;
  id *v10;
  id WeakRetained;
  uint64_t v12;
  unint64_t v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  float32x4_t v18;
  float32x4_t v19;
  unint64_t v20;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  _OWORD v34[4];
  simd_float4x4 v35;
  simd_float4x4 v36;

  v8 = a7;
  v9 = v8;
  if (v8)
  {
    v10 = (id *)v8;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(a1 + 11);
    objc_msgSend(WeakRetained, "rootObject");
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (id *)v12;
  }
  if (v10 != a1)
  {
    objc_msgSend(a1, "worldTransform");
    v36 = __invert_f4(v35);
    v22 = (float32x4_t)v36.columns[1];
    v23 = (float32x4_t)v36.columns[0];
    v24 = (float32x4_t)v36.columns[3];
    v25 = (float32x4_t)v36.columns[2];
    if (v9)
    {
      objc_msgSend(v9, "worldTransform");
      v13 = 0;
      v30 = v14;
      v31 = v15;
      v32 = v16;
      v33 = v17;
      do
      {
        v34[v13 / 2] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(*(_OWORD *)((char *)&v30 + v13 * 8))), v22, (float32x2_t)v30.n128_u64[v13], 1), v25, *(float32x4_t *)((char *)&v30 + v13 * 8), 2), v24, *(float32x4_t *)((char *)&v30 + v13 * 8), 3);
        v13 += 2;
      }
      while (v13 != 8);
      v18 = (float32x4_t)v34[0];
      v19 = (float32x4_t)v34[1];
      v24 = (float32x4_t)v34[3];
      v25 = (float32x4_t)v34[2];
    }
    else
    {
      v19 = (float32x4_t)v36.columns[1];
      v18 = (float32x4_t)v36.columns[0];
    }
    v20 = 0;
    v30 = a2;
    v31 = a3;
    v32 = a4;
    v33 = a5;
    do
    {
      v34[v20 / 2] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(_OWORD *)((char *)&v30 + v20 * 8))), v19, (float32x2_t)v30.n128_u64[v20], 1), v25, *(float32x4_t *)((char *)&v30 + v20 * 8), 2), v24, *(float32x4_t *)((char *)&v30 + v20 * 8), 3);
      v20 += 2;
    }
    while (v20 != 8);
    a2 = (__n128)v34[0];
  }

  return a2;
}

- (void)setWorldTransform:(simd_float4x4)worldTransform
{
  void *v3;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v13 = *(double *)worldTransform.columns[3].i64;
  v11 = *(double *)worldTransform.columns[1].i64;
  v12 = *(double *)worldTransform.columns[2].i64;
  v10 = *(double *)worldTransform.columns[0].i64;
  -[PHASEObject parent](self, "parent");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PHASEObject parent](self, "parent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_convertTransform:fromObject:", 0, v10, v11, v12, v13);
    v10 = v5;
    v11 = v6;
    v12 = v7;
    v13 = v8;
  }
  -[PHASEObject setTransform:](self, "setTransform:", v10, v11, v12, v13);
  if (v9)

}

- (simd_float4x4)worldTransform
{
  void *v3;
  void *v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  simd_float4 v14;
  simd_float4 v15;
  simd_float4 v16;
  simd_float4 v17;
  simd_float4 v18;
  simd_float4 v19;
  simd_float4 v20;
  simd_float4 v21;
  float32x4_t v22;
  simd_float4 v23;
  float32x4_t v24;
  simd_float4 v25;
  float32x4_t v26;
  simd_float4 v27;
  float32x4_t v28;
  simd_float4 v29;
  _OWORD v30[4];
  _OWORD v31[4];
  simd_float4x4 result;

  -[PHASEObject parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "worldTransform");
    v26 = v6;
    v28 = v5;
    v22 = v8;
    v24 = v7;
    -[PHASEObject transform](self, "transform");
    v9 = 0;
    v30[0] = v10;
    v30[1] = v11;
    v30[2] = v12;
    v30[3] = v13;
    do
    {
      v31[v9] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v28, COERCE_FLOAT(v30[v9])), v26, *(float32x2_t *)&v30[v9], 1), v24, (float32x4_t)v30[v9], 2), v22, (float32x4_t)v30[v9], 3);
      ++v9;
    }
    while (v9 != 4);
    v27 = (simd_float4)v31[1];
    v29 = (simd_float4)v31[0];
    v23 = (simd_float4)v31[3];
    v25 = (simd_float4)v31[2];
  }
  else
  {
    -[PHASEObject transform](self, "transform");
    v27 = v15;
    v29 = v14;
    v23 = v17;
    v25 = v16;
  }

  v19 = v27;
  v18 = v29;
  v21 = v23;
  v20 = v25;
  result.columns[3] = v21;
  result.columns[2] = v20;
  result.columns[1] = v19;
  result.columns[0] = v18;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  if ((-[PHASEObject isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    std::terminate();
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[PHASEObject engine](self, "engine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEngine:", v6);

  -[PHASEObject transform](self, "transform");
  objc_msgSend(v7, "setTransform:");
  return v7;
}

- (PHASEObject)parent
{
  return (PHASEObject *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (simd_float4x4)transform
{
  simd_float4 v2;
  simd_float4 v3;
  simd_float4 v4;
  simd_float4 v5;
  simd_float4x4 result;

  v2 = *(simd_float4 *)self->_anon_10;
  v3 = *(simd_float4 *)&self->_anon_10[16];
  v4 = *(simd_float4 *)&self->_anon_10[32];
  v5 = *(simd_float4 *)&self->_anon_10[48];
  result.columns[3] = v5;
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (PHASEEngine)engine
{
  return (PHASEEngine *)objc_loadWeakRetained((id *)&self->_engine);
}

- (Handle64)geoEntityHandle
{
  return self->_geoEntityHandle;
}

- (void)setGeoEntityHandle:(Handle64)a3
{
  self->_geoEntityHandle = a3;
}

- (NSMutableArray)geoShapeHandles
{
  return self->_geoShapeHandles;
}

- (void)setGeoShapeHandles:(id)a3
{
  objc_storeStrong((id *)&self->_geoShapeHandles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoShapeHandles, 0);
  objc_destroyWeak((id *)&self->_engine);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_children, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0;
  return self;
}

+ (void)deRegisterSubTree:engine:
{
  JUMPOUT(0x2199F9D70);
}

+ (_QWORD)deRegisterSubTree:engine:
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;

  v1 = (_QWORD *)a1[1];
  v2 = a1[2];
  v3 = a1[3];
  result = operator new(0x20uLL);
  result[2] = v2;
  result[3] = v3;
  v5 = v1[8];
  v1 += 8;
  *(_QWORD *)(v5 + 8) = result;
  *result = v5;
  *v1 = result;
  result[1] = v1;
  ++v1[2];
  return result;
}

@end
