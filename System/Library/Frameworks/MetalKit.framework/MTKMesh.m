@implementation MTKMesh

- (MTKMesh)initWithMesh:(MDLMesh *)mesh device:(id)device error:(NSError *)error
{
  MDLMesh *v8;
  MTKMesh *v9;
  NSMutableArray *v10;
  NSMutableArray *vertexBuffers;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  NSMutableArray *v20;
  NSMutableArray *submeshes;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  MTKSubmesh *v30;
  MTKSubmesh *v31;
  uint64_t v32;
  MDLVertexDescriptor *vertexDescriptor;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  NSString *name;
  MTKMesh *v39;
  MDLMesh *v41;
  id v42;
  NSError **v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = mesh;
  v42 = device;
  v52.receiver = self;
  v52.super_class = (Class)MTKMesh;
  v9 = -[MTKMesh init](&v52, sel_init);
  if (v9)
  {
    v43 = error;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    vertexBuffers = v9->_vertexBuffers;
    v9->_vertexBuffers = v10;

    v9->_vertexCount = -[MDLMesh vertexCount](v8, "vertexCount");
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v41 = v8;
    -[MDLMesh vertexBuffers](v8, "vertexBuffers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v49;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v49 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqual:", v18);

          if ((v19 & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v43)
              {
                _MTKModelErrorWithCodeAndErrorString(0, CFSTR("vertex buffer in MDLMesh was not created using a MTKMeshBufferAllocator"));
                *v43 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
              }
LABEL_28:

              v39 = 0;
              v8 = v41;
              goto LABEL_29;
            }
            -[NSMutableArray addObject:](v9->_vertexBuffers, "addObject:", v17);
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
        if (v14)
          continue;
        break;
      }
    }

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    submeshes = v9->_submeshes;
    v9->_submeshes = v20;

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[MDLMesh submeshes](v41, "submeshes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v45 != v24)
            objc_enumerationMutation(v12);
          v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          objc_msgSend(v26, "indexBuffer");
          v27 = objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v28 = (void *)v27;
            v29 = objc_msgSend(v26, "indexCount");

            if (v29)
            {
              v30 = -[MTKSubmesh initWithMesh:submesh:device:error:]([MTKSubmesh alloc], "initWithMesh:submesh:device:error:", v9, v26, v42, v43);
              if (!v30)
                goto LABEL_28;
              v31 = v30;
              -[NSMutableArray addObject:](v9->_submeshes, "addObject:", v30);

            }
          }
        }
        v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v23);
    }

    v8 = v41;
    -[MDLMesh vertexDescriptor](v41, "vertexDescriptor");
    v32 = objc_claimAutoreleasedReturnValue();
    vertexDescriptor = v9->_vertexDescriptor;
    v9->_vertexDescriptor = (MDLVertexDescriptor *)v32;

    -[MDLMesh name](v41, "name");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = objc_alloc(MEMORY[0x24BDD17C8]);
      -[MDLMesh name](v41, "name");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "initWithString:", v36);
      name = v9->_name;
      v9->_name = (NSString *)v37;

    }
  }
  v39 = v9;
LABEL_29:

  return v39;
}

+ (void)_createMeshesFromObject:(id)a3 newMeshes:(id)a4 sourceMeshes:(id)a5 device:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MTKMesh *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  getMDLMeshClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v12;
    v17 = -[MTKMesh initWithMesh:device:error:]([MTKMesh alloc], "initWithMesh:device:error:", v16, v15, a7);
    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v17 = (MTKMesh *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "addObject:", v17);
    objc_msgSend(v14, "addObject:", v16);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v12, "children", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(a1, "_createMeshesFromObject:newMeshes:sourceMeshes:device:error:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22++), v13, v14, v15, a7);
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v20);
  }

}

+ (NSArray)newMeshesFromAsset:(MDLAsset *)asset device:(id)device sourceMeshes:(NSArray *)sourceMeshes error:(NSError *)error
{
  MDLAsset *v10;
  id v11;
  void *v12;
  NSArray *v13;
  MDLAsset *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __CFString *v19;
  NSArray **v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = asset;
  v11 = device;
  v12 = v11;
  if (!v10)
  {
    if (error)
    {
      v19 = CFSTR("Must supply asset");
LABEL_19:
      _MTKModelErrorWithCodeAndErrorString(0, v19);
      v13 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_20:
    v13 = 0;
    goto LABEL_21;
  }
  if (!v11)
  {
    if (error)
    {
      v19 = CFSTR("Must supply device");
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v13 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = sourceMeshes;
  if (sourceMeshes)
    sourceMeshes = (NSArray **)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v10;
  v15 = -[MDLAsset countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(a1, "_createMeshesFromObject:newMeshes:sourceMeshes:device:error:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v13, sourceMeshes, v12, error);
      }
      v16 = -[MDLAsset countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  if (v21)
    *v21 = (NSArray *)objc_retainAutorelease(sourceMeshes);

LABEL_21:
  return v13;
}

- (NSArray)vertexBuffers
{
  return &self->_vertexBuffers->super;
}

- (MDLVertexDescriptor)vertexDescriptor
{
  return self->_vertexDescriptor;
}

- (NSArray)submeshes
{
  return &self->_submeshes->super;
}

- (NSUInteger)vertexCount
{
  return self->_vertexCount;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_vertexDescriptor, 0);
  objc_storeStrong((id *)&self->_vertexBuffers, 0);
  objc_storeStrong((id *)&self->_submeshes, 0);
}

@end
