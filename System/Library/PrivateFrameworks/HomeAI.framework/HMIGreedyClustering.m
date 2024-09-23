@implementation HMIGreedyClustering

+ (BOOL)addFaceObservations:(id)a3 toFaceDescriptorBuffer:(void *)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *DataForKthDescriptor;
  id v17;
  id *v19;
  id v20;
  id obj;
  uint64_t __n;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  objc_msgSend(v20, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "faceprint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __n = objc_msgSend(v8, "lengthInBytes");

  homeai::mod::ImageDescriptorBufferAbstract::resizeForDescriptorsCount((homeai::mod::ImageDescriptorBufferAbstract *)a4, objc_msgSend(v20, "count"), 1);
  std::vector<long long>::resize((uint64_t)a4 + 8, objc_msgSend(v20, "count"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v20;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v19 = a5;
    v10 = 0;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "faceprint", v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "descriptorData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        DataForKthDescriptor = (void *)homeai::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor((homeai::mod::ImageDescriptorBufferAbstract *)a4, v10 + i);
        v17 = objc_retainAutorelease(v15);
        memcpy(DataForKthDescriptor, (const void *)objc_msgSend(v17, "bytes"), __n);
        homeai::mod::ImageDescriptorBufferAbstract::setDescriptorIdForKthDescriptor((homeai::mod::ImageDescriptorBufferAbstract *)a4, v10 + i, objc_msgSend(v13, "faceId"));

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v10 += i;
    }
    while (v9);
  }

  return 1;
}

- (HMIGreedyClustering)initWithError:(id *)a3
{
  return -[HMIGreedyClustering initWithFaceThreshold:singleLinkThreshold:percentConnectionsThreshold:error:](self, "initWithFaceThreshold:singleLinkThreshold:percentConnectionsThreshold:error:", &unk_24DC15748, &unk_24DC15758, &unk_24DC15768, a3);
}

- (HMIGreedyClustering)initWithFaceThreshold:(id)a3 singleLinkThreshold:(id)a4 percentConnectionsThreshold:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  HMIGreedyClustering *v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  HMIGreedyClustering *v18;
  int v19;
  int v20;
  int v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  int v26;
  int v27;
  int v28;
  __int128 v29;
  objc_super v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)HMIGreedyClustering;
  v13 = -[HMIGreedyClustering init](&v30, sel_init);
  if (!v13)
  {
LABEL_12:
    v18 = v13;
    goto LABEL_13;
  }
  objc_msgSend(v10, "floatValue");
  if (v14 >= 0.0)
  {
    objc_msgSend(v11, "floatValue");
    if (v15 >= 0.0)
    {
      objc_msgSend(v10, "floatValue");
      v28 = v19;
      objc_msgSend(v11, "floatValue");
      v27 = v20;
      objc_msgSend(v12, "floatValue");
      v26 = v21;
      std::allocate_shared[abi:ne180100]<homeai::clustering::GreedyClusterer,std::allocator<homeai::clustering::GreedyClusterer>,float,float,float,void>((float *)&v28, (float *)&v27, (float *)&v26, &v29);
      std::shared_ptr<homeai::clustering::GreedyClusterer>::operator=[abi:ne180100]((uint64_t)&v13->_greedyClusterer, &v29);
      v22 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
      if (*((_QWORD *)&v29 + 1))
      {
        v23 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
      goto LABEL_12;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:", 1046);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (a6)
    *a6 = objc_retainAutorelease(v16);
  HMIErrorLog(v13, v17);

  v18 = 0;
LABEL_13:

  return v18;
}

- (id)getClustersWithFaces:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  HMIGreedyClustering *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *__p;
  void *v17;
  uint64_t v18;
  void *v19[13];
  int v20;
  void *v21;
  int v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    __p = 0;
    v17 = 0;
    v18 = 0;
    objc_msgSend(v7, "faceprint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "lengthInBytes");
    homeai::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v19, (_QWORD **)&__p, &v22, v9, 0, 0);
    v20 = 1;
    v21 = 0;
    v19[0] = &off_24DBEB530;
    v19[12] = (void *)(v9 >> 2);

    if (__p)
    {
      v17 = __p;
      operator delete(__p);
    }
    v20 = 2;
    if ((objc_msgSend((id)objc_opt_class(), "addFaceObservations:toFaceDescriptorBuffer:error:", v6, v19, a4) & 1) != 0)
    {
      __p = 0;
      v17 = 0;
      v18 = 0;
      homeai::clustering::GreedyClusterer::performClustering((homeai::clustering::GreedyClusterer *)self->_greedyClusterer.__ptr_, v19, (uint64_t)&__p);
      v10 = (void *)MEMORY[0x220735570]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v13;
        _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Clustering successful", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      -[HMIGreedyClustering convertToClusters:](v11, "convertToClusters:", &__p);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (__p)
      {
        v17 = __p;
        operator delete(__p);
      }
    }
    else
    {
      v14 = 0;
    }
    v19[0] = &off_24DBEB530;
    free(v21);
    homeai::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)convertToClusters:(void *)a3
{
  id v4;
  id v5;
  _QWORD *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  for (i = *(_QWORD **)a3; i != *((_QWORD **)a3 + 1); i += 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", i[1]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayWithObject:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", i[1]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v9);
    }

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v5, "allKeys", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
        v17 = objc_alloc_init(MEMORY[0x24BDF9B00]);
        objc_msgSend(v5, "objectForKeyedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObjects:", v18);
        objc_msgSend(v17, "setClusterId:", (int)objc_msgSend(v16, "intValue"));
        objc_msgSend(v17, "objects");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTotalObjectCount:", objc_msgSend(v19, "count"));

        objc_msgSend(v17, "setShouldUpdateRepresentative:", 0);
        objc_msgSend(v4, "addObject:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  return v4;
}

+ (float)faceDistanceFromDescriptor:(id)a3 toDescriptor:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  const float *v9;
  id v10;
  float v11;
  float result;
  float __C;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  if (v7 == objc_msgSend(v6, "length"))
  {
    v8 = objc_retainAutorelease(v5);
    v9 = (const float *)objc_msgSend(v8, "bytes");
    v10 = objc_retainAutorelease(v6);
    __C = 0.0;
    vDSP_dotpr(v9, 1, (const float *)objc_msgSend(v10, "bytes"), 1, &__C, 0x80uLL);
    v11 = 1.0 - __C;

    return v11;
  }
  else
  {
    _HMFPreconditionFailure();
    __break(1u);
  }
  return result;
}

+ (id)centermostFaceprintInCluster:(id)a3 faceObservations:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  int v20;
  void *v21;
  void *v22;
  id v23;
  float *v24;
  void *v25;
  uint64_t v26;
  float *v27;
  float v28;
  float *v29;
  float v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  float v36;
  uint64_t j;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  float v43;
  float v44;
  void *v45;
  _QWORD v47[2];
  uint64_t v48;
  id v49;
  id v50;
  unint64_t v51;
  char *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v53 = a4;
  v49 = v5;
  objc_msgSend(v5, "objects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7
    || !objc_msgSend(v53, "count")
    || (objc_msgSend(v53, "firstObject"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "faceprint"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v9))
  {
    _HMFPreconditionFailure();
LABEL_31:
    __break(1u);
  }
  objc_msgSend(v53, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "faceprint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "lengthInBytes");
  v13 = (unint64_t)v12 >> 2;

  v14 = v13;
  v51 = v13;
  v52 = (char *)v47 - ((4 * v13 + 15) & 0x7FFFFFFF0);
  bzero(v52, 4 * (int)v13);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(v49, "objects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v47;
  v48 = 4 * (int)v13;
  v50 = v15;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (!v16)
    goto LABEL_14;
  v17 = (uint64_t)v12 >> 2;
  v18 = *(_QWORD *)v59;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v59 != v18)
        objc_enumerationMutation(v50);
      v20 = objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "intValue");
      objc_msgSend(v53, "objectAtIndexedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "faceprint");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "descriptorData");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v24 = (float *)objc_msgSend(v23, "bytes");

      objc_msgSend(v21, "faceprint");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v23) = v17 == (unint64_t)objc_msgSend(v25, "lengthInBytes") >> 2;

      if (!(_DWORD)v23)
      {
        _HMFPreconditionFailure();
        goto LABEL_31;
      }
      v26 = v14;
      v27 = (float *)v52;
      if ((int)v51 >= 1)
      {
        do
        {
          v28 = *v24++;
          *v27 = v28 + *v27;
          ++v27;
          --v26;
        }
        while (v26);
      }

    }
    v16 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  }
  while (v16);
LABEL_14:

  if ((int)v51 >= 1)
  {
    v29 = (float *)v52;
    do
    {
      v30 = *v29;
      objc_msgSend(v49, "objects");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *v29 = v30 / (float)(unint64_t)objc_msgSend(v31, "count");

      ++v29;
      --v14;
    }
    while (v14);
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v52, v48);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v49, "objects");
  v52 = (char *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v55;
    v35 = -1;
    v36 = 100000.0;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v55 != v34)
          objc_enumerationMutation(v52);
        v38 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        v39 = objc_msgSend(v38, "intValue");
        objc_msgSend(v53, "objectAtIndexedSubscript:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "faceprint");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "descriptorData");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        +[HMIGreedyClustering faceDistanceFromDescriptor:toDescriptor:](HMIGreedyClustering, "faceDistanceFromDescriptor:toDescriptor:", v42, v32);
        v44 = v43;
        if (v43 < v36)
        {
          v35 = objc_msgSend(v38, "intValue");
          v36 = v44;
        }

      }
      v33 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v33);
  }
  else
  {
    v35 = -1;
  }

  objc_msgSend(v53, "objectAtIndexedSubscript:", v35);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
}

- (void).cxx_destruct
{
  std::shared_ptr<std::vector<long long>>::~shared_ptr[abi:ne180100]((uint64_t)&self->_greedyClusterer);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
