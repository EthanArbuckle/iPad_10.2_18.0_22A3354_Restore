@implementation MDLMeshBufferViewAllocator

- (id)newBufferViewAtRegionIndex:(int64_t)a3 type:(unint64_t)a4 length:(int64_t)a5 offset:(int64_t)a6
{
  void *BaseAddress;
  MDLBufferView *v12;
  const char *v13;
  void *v14;
  MDLMeshBufferView *v15;
  const char *v16;
  void *v17;

  if (!objc_msgSend__regionAtIndex_length_offset_(self, a2, a3, a5, a6))
    return 0;
  BaseAddress = IOSurfaceGetBaseAddress(self->super._sharedRegions.__begin_[self->super._regionIndices.__begin_[a3]]);
  v12 = [MDLBufferView alloc];
  v14 = (void *)objc_msgSend_initWithBytesNoCopy_length_offset_regionIndex_allocator_(v12, v13, (uint64_t)BaseAddress, a5, a6, a3, self);
  v15 = [MDLMeshBufferView alloc];
  v17 = (void *)objc_msgSend_initWithBufferViewNoCopy_type_(v15, v16, (uint64_t)v14, a4);

  return v17;
}

- (id)newBufferViewAtRegionIndex:(int64_t)a3 type:(unint64_t)a4
{
  __IOSurface *v7;
  void *BaseAddress;
  size_t AllocSize;
  MDLBufferView *v10;
  const char *v11;
  void *v12;
  MDLMeshBufferView *v13;
  const char *v14;
  void *v15;

  if (!objc_msgSend__regionAtIndex_(self, a2, a3))
    return 0;
  v7 = self->super._sharedRegions.__begin_[self->super._regionIndices.__begin_[a3]];
  BaseAddress = IOSurfaceGetBaseAddress(v7);
  AllocSize = IOSurfaceGetAllocSize(v7);
  v10 = [MDLBufferView alloc];
  v12 = (void *)objc_msgSend_initWithBytesNoCopy_length_offset_regionIndex_allocator_(v10, v11, (uint64_t)BaseAddress, AllocSize, 0, a3, self);
  v13 = [MDLMeshBufferView alloc];
  v15 = (void *)objc_msgSend_initWithBufferViewNoCopy_type_(v13, v14, (uint64_t)v12, a4);

  return v15;
}

- (void)encodeMeshBuffer:(id)a3 withCoder:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v18;
    objc_msgSend_stringByAppendingString_(v9, v11, (uint64_t)CFSTR(".view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeBuffer_withCoder_forKey_(self, v13, (uint64_t)v10, v8, v12);

    v14 = v10[7];
    objc_msgSend_stringByAppendingString_(v9, v15, (uint64_t)CFSTR(".type"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeInteger_forKey_(v8, v17, v14, v16);

  }
}

- (void)encodeMeshBuffers:(id)a3 withCoder:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  unint64_t i;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  char isKindOfClass;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  id v29;

  v29 = a3;
  v8 = a4;
  v9 = a5;
  v12 = objc_msgSend_count(v29, v10, v11);
  objc_msgSend_stringByAppendingString_(v9, v13, (uint64_t)CFSTR(".count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v8, v15, v12, v14);

  for (i = 0; i < objc_msgSend_count(v29, v16, v17); ++i)
  {
    objc_msgSend_stringByAppendingFormat_(v9, v19, (uint64_t)CFSTR("[%ld]"), i);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v29, v21, i);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend_objectAtIndexedSubscript_(v29, v24, i);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingString_(v20, v26, (uint64_t)CFSTR(".view"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeMeshBuffer_withCoder_forKey_(self, v28, (uint64_t)v25, v8, v27);

    }
  }

}

- (id)decodeMeshBuffersWithCoder:(id)a3 forKey:(id)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  const char *v13;
  void *v14;
  uint64_t i;
  void *v16;
  const char *v17;
  void *v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  id v24;

  v6 = a3;
  v24 = a4;
  objc_msgSend_stringByAppendingString_(v24, v7, (uint64_t)CFSTR(".count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_decodeIntegerForKey_(v6, v9, (uint64_t)v8);

  v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v14 = (void *)objc_msgSend_initWithCapacity_(v11, v12, v10);
  if (v10 >= 1)
  {
    for (i = 0; i != v10; ++i)
    {
      objc_msgSend_stringByAppendingFormat_(v24, v13, (uint64_t)CFSTR("[%ld]"), i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingString_(v16, v17, (uint64_t)CFSTR(".view"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v6;
      objc_msgSend_decodeMeshBufferWithCoder_forKey_(self, v20, (uint64_t)v6, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_addObject_(v14, v22, (uint64_t)v21);
      v6 = v19;
    }
  }

  return v14;
}

- (id)decodeMeshBufferWithCoder:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  MDLMeshBufferView *v16;
  const char *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend_stringByAppendingString_(v7, v8, (uint64_t)CFSTR(".view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeBufferWithCoder_forKey_(self, v10, (uint64_t)v6, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByAppendingString_(v7, v12, (uint64_t)CFSTR(".type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_decodeIntegerForKey_(v6, v14, (uint64_t)v13);

  v16 = [MDLMeshBufferView alloc];
  v18 = (void *)objc_msgSend_initWithBufferViewNoCopy_type_(v16, v17, (uint64_t)v11, v15);

  return v18;
}

- (id)newBuffer:(unint64_t)a3 type:(unint64_t)a4
{
  NSLog(CFSTR("Warning: newBuffer:type: not currently supported\n"), a2, a3, a4);
  return 0;
}

- (id)newBufferFromZone:(id)a3 data:(id)a4 type:(unint64_t)a5
{
  NSLog(CFSTR("Warning: zones not supported in current development \n"), a2, a3, a4, a5);
  return 0;
}

- (id)newBufferFromZone:(id)a3 length:(unint64_t)a4 type:(unint64_t)a5
{
  NSLog(CFSTR("Warning: zones not supported in current development\n"), a2, a3, a4, a5);
  return 0;
}

- (id)newBufferWithData:(id)a3 type:(unint64_t)a4
{
  NSLog(CFSTR("Warning: newBufferWithData: not currently supported\n"), a2, a3, a4);
  return 0;
}

- (id)newZone:(unint64_t)a3
{
  NSLog(CFSTR("Warning: zones not supported in current development\n"), a2, a3);
  return 0;
}

- (id)newZoneForBuffersWithSize:(id)a3 andType:(id)a4
{
  NSLog(CFSTR("Warning: zones not supported in current development\n"), a2, a3, a4);
  return 0;
}

@end
