@implementation MTKSubmesh

- (MTKSubmesh)initWithMesh:(id)a3 submesh:(id)a4 device:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  MTKSubmesh *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  char isKindOfClass;
  uint64_t v21;
  MTKMeshBuffer *indexBuffer;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  NSString *name;
  MTKSubmesh *v28;
  id v29;
  objc_super v31;

  v9 = a3;
  v10 = a4;
  v31.receiver = self;
  v31.super_class = (Class)MTKSubmesh;
  v11 = -[MTKSubmesh init](&v31, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "geometryType");
    if (objc_msgSend(v10, "indexType") == 32)
    {
      v13 = 0;
      v14 = 1;
    }
    else
    {
      if (objc_msgSend(v10, "indexType") != 16)
      {
        if (objc_msgSend(v10, "indexType") != 8)
        {
          if (a6)
          {
            v17 = CFSTR("invalid index type submesh");
LABEL_33:
            _MTKModelErrorWithCodeAndErrorString(0, v17);
            v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:
            v28 = 0;
            *a6 = v29;
            goto LABEL_39;
          }
LABEL_38:
          v28 = 0;
          goto LABEL_39;
        }
        v14 = 0;
        v15 = 0;
        v13 = 16;
LABEL_7:
        v11->_indexType = v14;
        if (objc_msgSend(v10, "geometryType") == 1)
        {
          v16 = 1;
LABEL_24:
          v11->_primitiveType = v16;
          if (v13
            && (v18 = objc_msgSend(objc_alloc(getMDLSubmeshClass()), "initWithMDLSubmesh:indexType:geometryType:", v10, v13, v12), v10, (v10 = (id)v18) == 0))
          {
            if (a6)
            {
              _MTKModelErrorWithCodeAndErrorString(0, CFSTR("required conversion from orginal submesh indexType and geometryType failed"));
              v29 = (id)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              goto LABEL_36;
            }
            v10 = 0;
          }
          else
          {
            objc_msgSend(v10, "indexBuffer");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v10, "indexBuffer");
              v21 = objc_claimAutoreleasedReturnValue();
              indexBuffer = v11->_indexBuffer;
              v11->_indexBuffer = (MTKMeshBuffer *)v21;

              v11->_indexCount = objc_msgSend(v10, "indexCount");
              objc_msgSend(v10, "name");
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                v24 = objc_alloc(MEMORY[0x24BDD17C8]);
                objc_msgSend(v10, "name");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v24, "initWithString:", v25);
                name = v11->_name;
                v11->_name = (NSString *)v26;

              }
              objc_storeWeak((id *)&v11->_mesh, v9);
              goto LABEL_30;
            }
            if (a6)
            {
              v17 = CFSTR("index buffer in MDLSubmesh was not created using a MTKMeshBufferAllocator");
              goto LABEL_33;
            }
          }
          goto LABEL_38;
        }
        if (!objc_msgSend(v10, "geometryType"))
        {
          v16 = 0;
          goto LABEL_24;
        }
        if (objc_msgSend(v10, "geometryType") != 2)
        {
          if (objc_msgSend(v10, "geometryType") == 3)
          {
            v16 = 4;
            goto LABEL_24;
          }
          if (objc_msgSend(v10, "geometryType") != 4 && objc_msgSend(v10, "geometryType") != 5)
          {
            if (a6)
            {
              v17 = CFSTR("invalid geometry type in submesh");
              goto LABEL_33;
            }
            goto LABEL_38;
          }
          if (v15)
            v13 = objc_msgSend(v10, "indexType");
          v12 = 2;
        }
        v16 = 3;
        goto LABEL_24;
      }
      v14 = 0;
      v13 = 0;
    }
    v15 = 1;
    goto LABEL_7;
  }
LABEL_30:
  v28 = v11;
LABEL_39:

  return v28;
}

- (MTLPrimitiveType)primitiveType
{
  return self->_primitiveType;
}

- (MTLIndexType)indexType
{
  return self->_indexType;
}

- (MTKMeshBuffer)indexBuffer
{
  return self->_indexBuffer;
}

- (NSUInteger)indexCount
{
  return self->_indexCount;
}

- (MTKMesh)mesh
{
  return (MTKMesh *)objc_loadWeakRetained((id *)&self->_mesh);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_mesh);
  objc_storeStrong((id *)&self->_indexBuffer, 0);
}

@end
