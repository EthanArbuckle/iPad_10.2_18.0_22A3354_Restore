@implementation AAUIBadgeModel

- (void)dealloc
{
  objc_super v3;

  free(self->_materials);
  free(self->_groups);
  free(self->_vertices);
  free(self->_indices);
  v3.receiver = self;
  v3.super_class = (Class)AAUIBadgeModel;
  -[AAUIBadgeModel dealloc](&v3, sel_dealloc);
}

- (AAUIBadgeModel)initWithPath:(id)a3
{
  id v4;
  AAUIBadgeModel *v5;
  AAUIBadgeModel *v6;
  unsigned int *v7;
  int *v8;
  objc_super v10;
  int v11;
  uint64_t v12;
  int *v13;
  int *v14;
  unsigned int *v15;
  $2FE3C3292E52C4A5B67D27538456EAD9 *v16;

  v4 = a3;
  v15 = 0;
  v16 = 0;
  v14 = 0;
  v12 = 0;
  v13 = 0;
  v11 = 0;
  v10.receiver = self;
  v10.super_class = (Class)AAUIBadgeModel;
  v5 = -[AAUIBadgeModel init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AAUIBadgeModel _loadModelAtPath:intoVertices:indices:groups:materials:vertexCount:indexCount:groupCount:](v5, "_loadModelAtPath:intoVertices:indices:groups:materials:vertexCount:indexCount:groupCount:", v4, &v16, &v15, &v14, &v13, (char *)&v12 + 4, &v12, &v11);
    v7 = v15;
    v6->_vertices = v16;
    v6->_indices = v7;
    v8 = v13;
    v6->_groups = v14;
    v6->_materials = v8;
    LODWORD(v8) = v12;
    v6->_vertexCount = HIDWORD(v12);
    v6->_indexCount = (int)v8;
    v6->_groupCount = v11;
  }

  return v6;
}

- (void)_loadModelAtPath:(id)a3 intoVertices:(id *)a4 indices:(unsigned int *)a5 groups:(int *)a6 materials:(int *)a7 vertexCount:(int *)a8 indexCount:(int *)a9 groupCount:(int *)a10
{
  void *v10;
  size_t v11;
  size_t v12;
  size_t v13;
  int *v14;
  uint64_t v15;
  int *v16;
  size_t v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v18;
  unsigned int *v19;
  _DWORD v25[2];
  _DWORD size[3];

  *(_QWORD *)&size[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getBytes:length:", v25, 12);
  v12 = v25[0];
  v11 = v25[1];
  v13 = size[0];
  v14 = (int *)malloc_type_calloc(4uLL, size[0], 0x449065CDuLL);
  objc_msgSend(v10, "getBytes:range:", v14, 12, 4 * v13);
  v15 = 4 * v13 + 12;
  v16 = (int *)malloc_type_calloc(4uLL, v13, 0xDECCA63CuLL);
  objc_msgSend(v10, "getBytes:range:", v16, v15, 4 * v13);
  v17 = v15 + 4 * v13;
  v18 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(0x20uLL, v12, 0x30225939uLL);
  objc_msgSend(v10, "getBytes:range:", v18, v17, 32 * v12);
  v11 *= 3;
  v19 = (unsigned int *)malloc_type_calloc(4uLL, v11, 0xAF7A0BA4uLL);
  objc_msgSend(v10, "getBytes:range:", v19, v17 + 32 * v12, 4 * v11);
  *a8 = v12;
  *a9 = v11;
  *a10 = v13;
  *a4 = v18;
  *a5 = v19;
  *a6 = v16;
  *a7 = v14;

}

- (int)groups
{
  return self->_groups;
}

- (int)groupCount
{
  return self->_groupCount;
}

- (int)materials
{
  return self->_materials;
}

- ($2FE3C3292E52C4A5B67D27538456EAD9)vertices
{
  return self->_vertices;
}

- (int)vertexCount
{
  return self->_vertexCount;
}

- (unsigned)indices
{
  return self->_indices;
}

- (int)indexCount
{
  return self->_indexCount;
}

- (void)setVertices:(id *)a3
{
  self->_vertices = a3;
}

- (void)setIndices:(unsigned int *)a3
{
  self->_indices = a3;
}

- (void)setGroups:(int *)a3
{
  self->_groups = a3;
}

- (void)setMaterials:(int *)a3
{
  self->_materials = a3;
}

- (void)setVertexCount:(int)a3
{
  self->_vertexCount = a3;
}

- (void)setIndexCount:(int)a3
{
  self->_indexCount = a3;
}

- (void)setGroupCount:(int)a3
{
  self->_groupCount = a3;
}

@end
