@implementation GLKMesh

- (GLKMesh)initWithMesh:(MDLMesh *)mesh error:(NSError *)error
{
  MDLMesh *v6;
  GLKMesh *v7;
  uint64_t v8;
  void *v9;
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
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  GLKSubmesh *v31;
  GLKSubmesh *v32;
  uint64_t v33;
  MDLVertexDescriptor *vertexDescriptor;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSString *name;
  GLKMesh *v40;
  void *v42;
  MDLMesh *v43;
  NSError **v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = mesh;
  v53.receiver = self;
  v53.super_class = (Class)GLKMesh;
  v7 = -[GLKMesh init](&v53, sel_init);
  if (!v7)
  {
LABEL_25:
    v40 = v7;
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v44 = error;
    v42 = (void *)v8;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    vertexBuffers = v7->_vertexBuffers;
    v7->_vertexBuffers = v10;

    v7->_vertexCount = -[MDLMesh vertexCount](v6, "vertexCount");
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v43 = v6;
    -[MDLMesh vertexBuffers](v6, "vertexBuffers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v50;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v50 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqual:", v18);

          if ((v19 & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v44)
              {
                _GLKModelErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Vertex buffer in MDLMesh was not created using a GLKMeshBufferAllocator"));
                *v44 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
              }

              v6 = v43;
LABEL_32:
              v9 = v42;
              goto LABEL_33;
            }
            -[NSMutableArray addObject:](v7->_vertexBuffers, "addObject:", v17);
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        if (v14)
          continue;
        break;
      }
    }

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    submeshes = v7->_submeshes;
    v7->_submeshes = v20;

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v6 = v43;
    -[MDLMesh submeshes](v43, "submeshes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v46;
      while (2)
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v46 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend(v27, "indexBuffer");
          v28 = objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            v29 = (void *)v28;
            v30 = objc_msgSend(v27, "indexCount");

            if (v30)
            {
              v31 = -[GLKSubmesh initWithMesh:submesh:error:]([GLKSubmesh alloc], "initWithMesh:submesh:error:", v7, v27, v44);
              if (!v31)
              {

                goto LABEL_32;
              }
              v32 = v31;
              -[NSMutableArray addObject:](v7->_submeshes, "addObject:", v31);

            }
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (v24)
          continue;
        break;
      }
    }

    -[MDLMesh vertexDescriptor](v43, "vertexDescriptor");
    v33 = objc_claimAutoreleasedReturnValue();
    vertexDescriptor = v7->_vertexDescriptor;
    v7->_vertexDescriptor = (MDLVertexDescriptor *)v33;

    v35 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[MDLMesh name](v43, "name");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v35;
    v6 = v43;
    v38 = objc_msgSend(v37, "initWithString:", v36);
    name = v7->_name;
    v7->_name = (NSString *)v38;

    goto LABEL_25;
  }
  if (error)
  {
    _GLKModelErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("An EAGL context must be current"));
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
LABEL_33:

  v40 = 0;
LABEL_34:

  return v40;
}

+ (void)_createMeshesFromObject:(id)a3 newMeshes:(id)a4 sourceMeshes:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GLKMesh *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  getMDLMeshClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v10;
    v14 = -[GLKMesh initWithMesh:error:]([GLKMesh alloc], "initWithMesh:error:", v13, a6);
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (GLKMesh *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "addObject:", v14);
    objc_msgSend(v12, "addObject:", v13);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v10, "children", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(a1, "_createMeshesFromObject:newMeshes:sourceMeshes:error:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), v11, v12, a6);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v17);
  }

}

+ (NSArray)newMeshesFromAsset:(MDLAsset *)asset sourceMeshes:(NSArray *)sourceMeshes error:(NSError *)error
{
  MDLAsset *v8;
  void *v9;
  NSArray *v10;
  MDLAsset *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  const __CFString *v16;
  NSArray **v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = asset;
  objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (error)
    {
      v16 = CFSTR("An EAGL context must be current");
LABEL_19:
      _GLKModelErrorWithCodeAndErrorString(0, (uint64_t)v16);
      v10 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_20:
    v10 = 0;
    goto LABEL_21;
  }
  if (!v8)
  {
    if (error)
    {
      v16 = CFSTR("Must supply asset");
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v10 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = sourceMeshes;
  if (sourceMeshes)
    sourceMeshes = (NSArray **)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v8;
  v12 = -[MDLAsset countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(a1, "_createMeshesFromObject:newMeshes:sourceMeshes:error:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v10, sourceMeshes, error);
      }
      v13 = -[MDLAsset countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  if (v18)
    *v18 = (NSArray *)objc_retainAutorelease(sourceMeshes);

LABEL_21:
  return v10;
}

- (NSUInteger)vertexCount
{
  return self->_vertexCount;
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

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_vertexDescriptor, 0);
  objc_storeStrong((id *)&self->_vertexBuffers, 0);
  objc_storeStrong((id *)&self->_submeshes, 0);
}

@end
