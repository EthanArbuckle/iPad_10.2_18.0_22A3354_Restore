@implementation GLKMeshBuffer

- (id)_initWithLength:(unint64_t)a3 offset:(unint64_t)a4 zone:(id)a5 type:(unint64_t)a6
{
  id v10;
  void *v11;
  id v12;

  v10 = a5;
  objc_msgSend(v10, "allocator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[GLKMeshBuffer _initWithBytes:length:offset:allocator:zone:type:](self, "_initWithBytes:length:offset:allocator:zone:type:", 0, a3, a4, v11, v10, a6);

  return v12;
}

- (id)_initWithLength:(unint64_t)a3 allocator:(id)a4 type:(unint64_t)a5
{
  return -[GLKMeshBuffer _initWithBytes:length:offset:allocator:zone:type:](self, "_initWithBytes:length:offset:allocator:zone:type:", 0, a3, 0, a4, 0, a5);
}

- (id)_initWithData:(id)a3 allocator:(id)a4 type:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v8 = objc_retainAutorelease(a3);
  v9 = a4;
  v10 = v8;
  v11 = objc_msgSend(v10, "bytes");
  v12 = objc_msgSend(v10, "length");

  v13 = -[GLKMeshBuffer _initWithBytes:length:offset:allocator:zone:type:](self, "_initWithBytes:length:offset:allocator:zone:type:", v11, v12, 0, v9, 0, a5);
  return v13;
}

- (id)_initWithBytes:(const void *)a3 length:(unint64_t)a4 offset:(unint64_t)a5 allocator:(id)a6 zone:(id)a7 type:(unint64_t)a8
{
  id v15;
  id v16;
  GLKMeshBuffer *v17;
  GLKMeshBuffer *v18;
  int v19;
  GLKMeshBuffer *v20;
  objc_super v22;

  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)GLKMeshBuffer;
  v17 = -[GLKMeshBuffer init](&v22, sel_init);
  v18 = v17;
  if (!v17)
    goto LABEL_10;
  v17->_mapCount = 0;
  v17->_type = a8;
  objc_storeStrong((id *)&v17->_zone, a7);
  v18->_length = a4;
  objc_storeStrong((id *)&v18->_allocator, a6);
  v18->_offset = a5;
  if (a8 == 1)
  {
    v19 = 34962;
LABEL_6:
    v18->_target = v19;
    if (v18->_zone)
    {
      v18->_glBufferName = objc_msgSend(v16, "glBufferName");
    }
    else
    {
      glGenBuffers(1, &v18->_glBufferName);
      glBindBuffer(v18->_target, v18->_glBufferName);
      glBufferData(v18->_target, a4, a3, 0x88E4u);
    }
LABEL_10:
    v20 = v18;
    goto LABEL_11;
  }
  if (a8 == 2)
  {
    v19 = 34963;
    goto LABEL_6;
  }
  v20 = 0;
LABEL_11:

  return v20;
}

- (void)fillData:(id)a3 offset:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  unint64_t length;
  unint64_t v9;
  GLsizeiptr v10;
  GLenum target;
  GLintptr v12;
  id v13;
  const GLvoid *v14;

  if (self->_length >= a4)
  {
    v6 = a3;
    v7 = objc_msgSend(v6, "length");
    length = self->_length;
    v9 = v7 + a4 - length;
    if (v7 + a4 < length)
      v9 = 0;
    v10 = v7 - v9;
    glBindBuffer(self->_target, self->_glBufferName);
    target = self->_target;
    v12 = self->_offset + a4;
    v13 = objc_retainAutorelease(v6);
    v14 = (const GLvoid *)objc_msgSend(v13, "bytes");

    glBufferSubData(target, v12, v10, v14);
  }
}

- (id)map
{
  unsigned int mapCount;
  id v4;
  char *v5;
  _QWORD v7[5];

  mapCount = self->_mapCount;
  if (!mapCount)
  {
    glBindBuffer(self->_target, self->_glBufferName);
    self->_mapPtr = glMapBufferRange(self->_target, 0, self->_length, 1u);
    mapCount = self->_mapCount;
  }
  self->_mapCount = mapCount + 1;
  v4 = objc_alloc(getMDLMeshBufferMapClass());
  v5 = (char *)self->_mapPtr + self->_offset;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __20__GLKMeshBuffer_map__block_invoke;
  v7[3] = &unk_24C848110;
  v7[4] = self;
  return (id)objc_msgSend(v4, "initWithBytes:deallocator:", v5, v7);
}

uint64_t __20__GLKMeshBuffer_map__block_invoke(uint64_t result)
{
  _DWORD *v1;
  int v2;
  uint64_t v3;

  v1 = *(_DWORD **)(result + 32);
  v2 = v1[2];
  if (v2 == 1)
  {
    v3 = result;
    glBindBuffer(v1[6], v1[10]);
    result = glUnmapBuffer(*(_DWORD *)(*(_QWORD *)(v3 + 32) + 24));
    *(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) = 0;
    v1 = *(_DWORD **)(v3 + 32);
    v2 = v1[2];
  }
  v1[2] = v2 - 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  GLKMeshBuffer *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(GLKMeshBuffer);
  -[GLKMeshBuffer map](self, "map");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v5, "bytes"), -[GLKMeshBuffer length](self, "length"), 0);
  -[GLKMeshBuffer allocator](self, "allocator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newBufferWithData:type:", v6, self->_type);

  return v8;
}

- (void)dealloc
{
  GLKMeshBufferZone *zone;
  objc_super v4;

  zone = self->_zone;
  if (zone)
    -[GLKMeshBufferZone destroyBuffer:](zone, "destroyBuffer:", self);
  else
    glDeleteBuffers(1, &self->_glBufferName);
  v4.receiver = self;
  v4.super_class = (Class)GLKMeshBuffer;
  -[GLKMeshBuffer dealloc](&v4, sel_dealloc);
}

- (id)zone
{
  return self->_zone;
}

- (NSUInteger)length
{
  return self->_length;
}

- (GLKMeshBufferAllocator)allocator
{
  return self->_allocator;
}

- (GLuint)glBufferName
{
  return self->_glBufferName;
}

- (NSUInteger)offset
{
  return self->_offset;
}

- (MDLMeshBufferType)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allocator, 0);
  objc_storeStrong((id *)&self->_zone, 0);
}

@end
