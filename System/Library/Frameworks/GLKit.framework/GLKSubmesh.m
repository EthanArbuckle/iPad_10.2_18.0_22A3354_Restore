@implementation GLKSubmesh

- (GLKSubmesh)initWithMesh:(id)a3 submesh:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  GLKSubmesh *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  char isKindOfClass;
  uint64_t v20;
  GLKMeshBuffer *elementBuffer;
  id v22;
  void *v23;
  uint64_t v24;
  NSString *name;
  GLKSubmesh *v26;
  id v27;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)GLKSubmesh;
  v10 = -[GLKSubmesh init](&v29, sel_init);
  if (!v10)
    goto LABEL_27;
  v11 = objc_msgSend(v9, "geometryType");
  if (objc_msgSend(v9, "indexType") == 16)
  {
    v12 = 0;
    v13 = 1;
    v14 = 5123;
  }
  else if (objc_msgSend(v9, "indexType") == 32)
  {
    v12 = 0;
    v13 = 1;
    v14 = 5125;
  }
  else
  {
    if (objc_msgSend(v9, "indexType") != 8)
    {
      if (a5)
      {
        v16 = CFSTR("invalid index type in submesh");
LABEL_30:
        _GLKModelErrorWithCodeAndErrorString(0, (uint64_t)v16);
        v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
        v26 = 0;
        *a5 = v27;
        goto LABEL_36;
      }
LABEL_35:
      v26 = 0;
      goto LABEL_36;
    }
    v13 = 0;
    v14 = 5123;
    v12 = 16;
  }
  v10->_type = v14;
  if (objc_msgSend(v9, "geometryType") == 1)
  {
    v15 = 1;
  }
  else if (objc_msgSend(v9, "geometryType"))
  {
    if (objc_msgSend(v9, "geometryType") == 2)
    {
      v15 = 4;
    }
    else if (objc_msgSend(v9, "geometryType") == 3)
    {
      v15 = 5;
    }
    else
    {
      if (objc_msgSend(v9, "geometryType") != 4 && objc_msgSend(v9, "geometryType") != 5)
      {
        if (a5)
        {
          v16 = CFSTR("invalid geometry type in submesh");
          goto LABEL_30;
        }
        goto LABEL_35;
      }
      if (v13)
        v12 = objc_msgSend(v9, "indexType");
      v15 = 4;
      v11 = 2;
    }
  }
  else
  {
    v15 = 0;
  }
  v10->_mode = v15;
  if (v12)
  {
    v17 = objc_msgSend(objc_alloc(getMDLSubmeshClass()), "initWithMDLSubmesh:indexType:geometryType:", v9, v12, v11);

    v9 = (id)v17;
    if (!v17)
    {
      if (a5)
      {
        _GLKModelErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("required conversion from orginal submesh indexType and geometryType failed"));
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        goto LABEL_33;
      }
      v9 = 0;
      goto LABEL_35;
    }
  }
  objc_msgSend(v9, "indexBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (a5)
    {
      v16 = CFSTR("Index buffer in MDLSubmesh was not created using a GLKMeshBufferAllocator");
      goto LABEL_30;
    }
    goto LABEL_35;
  }
  objc_msgSend(v9, "indexBuffer");
  v20 = objc_claimAutoreleasedReturnValue();
  elementBuffer = v10->_elementBuffer;
  v10->_elementBuffer = (GLKMeshBuffer *)v20;

  v10->_elementCount = objc_msgSend(v9, "indexCount");
  v22 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v9, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "initWithString:", v23);
  name = v10->_name;
  v10->_name = (NSString *)v24;

  objc_storeWeak((id *)&v10->_mesh, v8);
LABEL_27:
  v26 = v10;
LABEL_36:

  return v26;
}

- (GLenum)type
{
  return self->_type;
}

- (GLenum)mode
{
  return self->_mode;
}

- (GLsizei)elementCount
{
  return self->_elementCount;
}

- (GLKMeshBuffer)elementBuffer
{
  return self->_elementBuffer;
}

- (GLKMesh)mesh
{
  return (GLKMesh *)objc_loadWeakRetained((id *)&self->_mesh);
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_mesh);
  objc_storeStrong((id *)&self->_elementBuffer, 0);
}

@end
