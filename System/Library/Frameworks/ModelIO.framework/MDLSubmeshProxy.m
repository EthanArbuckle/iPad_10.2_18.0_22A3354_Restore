@implementation MDLSubmeshProxy

- (id)description
{
  id v3;
  const char *v4;
  const char *v5;
  const char *v6;
  MDLMeshBuffer *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  unint64_t v13;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend_appendString_(v3, v4, (uint64_t)CFSTR("IndexBuffers: \n"));
  objc_msgSend_appendFormat_(v3, v5, (uint64_t)CFSTR("Name: %@\n"), self->super._name);
  objc_msgSend_appendFormat_(v3, v6, (uint64_t)CFSTR("IndexCount: %lu\n"), self->super._indexCount);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = self->super._indexBuffer;
    v10 = objc_msgSend_data(v7, v8, v9);
    objc_msgSend_appendString_(v3, v11, (uint64_t)CFSTR("[ "));
    if (self->super._indexCount)
    {
      v13 = 0;
      do
        objc_msgSend_appendFormat_(v3, v12, (uint64_t)CFSTR(" (%d), "), *(unsigned int *)(v10 + 4 * v13++));
      while (v13 < self->super._indexCount);
    }
    objc_msgSend_appendString_(v3, v12, (uint64_t)CFSTR("]\n"));

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  id v11;

  v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v4, (uint64_t)self->super._allocator, CFSTR("allocator"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend_encodeMeshBuffer_withCoder_forKey_(self->super._allocator, v5, (uint64_t)self->super._indexBuffer, v11, CFSTR("indexBuffer"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend_encodeMaterialWithCoder_allocator_(self->super._material, v6, (uint64_t)v11, self->super._allocator);
  objc_msgSend_encodeTopologyWithCoder_allocator_(self->super._topology, v6, (uint64_t)v11, self->super._allocator);
  objc_msgSend_encodeObject_forKey_(v11, v7, (uint64_t)self->super._name, CFSTR("name"));
  objc_msgSend_encodeInteger_forKey_(v11, v8, self->super._indexCount, CFSTR("indexCount"));
  objc_msgSend_encodeInteger_forKey_(v11, v9, self->super._indexType, CFSTR("indexType"));
  objc_msgSend_encodeInteger_forKey_(v11, v10, self->super._geometryType, CFSTR("geometryType"));

}

- (MDLSubmeshProxy)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  MDLMeshBufferAllocator *v7;
  MDLMeshBufferAllocator *allocator;
  const char *v9;
  MDLMeshBuffer *v10;
  MDLMeshBuffer *indexBuffer;
  const char *v12;
  MDLMaterial *v13;
  MDLMaterial *material;
  MDLSubmeshTopology *v15;
  MDLSubmeshTopology *topology;
  uint64_t v17;
  const char *v18;
  NSString *v19;
  NSString *name;
  const char *v21;
  const char *v22;
  const char *v23;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, CFSTR("allocator"));
  v7 = (MDLMeshBufferAllocator *)objc_claimAutoreleasedReturnValue();
  allocator = self->super._allocator;
  self->super._allocator = v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_decodeMeshBufferWithCoder_forKey_(self->super._allocator, v9, (uint64_t)v4, CFSTR("indexBuffer"));
    v10 = (MDLMeshBuffer *)objc_claimAutoreleasedReturnValue();
    indexBuffer = self->super._indexBuffer;
    self->super._indexBuffer = v10;

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_decodeMaterialWithCoder_allocator_(MDLMaterial, v12, (uint64_t)v4, self->super._allocator);
    v13 = (MDLMaterial *)objc_claimAutoreleasedReturnValue();
    material = self->super._material;
    self->super._material = v13;

  }
  objc_msgSend_decodeTopologyWithCoder_allocator_(MDLSubmeshTopology, v12, (uint64_t)v4, self->super._allocator);
  v15 = (MDLSubmeshTopology *)objc_claimAutoreleasedReturnValue();
  topology = self->super._topology;
  self->super._topology = v15;

  v17 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, CFSTR("name"));
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->super._name;
  self->super._name = v19;

  self->super._indexCount = objc_msgSend_decodeIntegerForKey_(v4, v21, (uint64_t)CFSTR("indexCount"));
  self->super._indexType = objc_msgSend_decodeIntegerForKey_(v4, v22, (uint64_t)CFSTR("indexType"));
  self->super._geometryType = objc_msgSend_decodeIntegerForKey_(v4, v23, (uint64_t)CFSTR("geometryType"));

  return self;
}

@end
