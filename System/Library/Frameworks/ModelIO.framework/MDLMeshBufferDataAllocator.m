@implementation MDLMeshBufferDataAllocator

- (id)newBufferFromZone:(id)a3 length:(unint64_t)a4 type:(unint64_t)a5
{
  id v8;
  MDLMeshBufferData *v9;
  const char *v10;
  _QWORD *v11;

  v8 = a3;
  v9 = [MDLMeshBufferData alloc];
  v11 = (_QWORD *)objc_msgSend_initWithLength_data_allocator_zone_(v9, v10, a4, 0, self, v8);
  v11[6] = a5;

  return v11;
}

- (id)newBufferWithData:(id)a3 type:(unint64_t)a4
{
  id v6;
  MDLMeshBufferData *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD *v12;

  v6 = a3;
  v7 = [MDLMeshBufferData alloc];
  v10 = objc_msgSend_length(v6, v8, v9);
  v12 = (_QWORD *)objc_msgSend_initWithLength_data_allocator_zone_(v7, v11, v10, v6, self, 0);
  v12[6] = a4;

  return v12;
}

- (id)newZone:(unint64_t)a3
{
  MDLMeshBufferZoneDefault *v4;

  v4 = [MDLMeshBufferZoneDefault alloc];
  return (id)MEMORY[0x1E0DE7D20](v4, sel_initWithCapacity_allocator_, a3);
}

- (id)newZoneForBuffersWithSize:(id)a3 andType:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v10 = objc_msgSend_count(v6, v8, v9);
  if (v10 == objc_msgSend_count(v7, v11, v12))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v6;
    v15 = 0;
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v24, v28, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v25;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v13);
          v15 += objc_msgSend_unsignedIntegerValue(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v20++), v16, v17, (_QWORD)v24);
        }
        while (v18 != v20);
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v24, v28, 16);
      }
      while (v18);
    }

    v22 = (void *)objc_msgSend_newZone_(self, v21, v15);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)newBuffer:(unint64_t)a3 type:(unint64_t)a4
{
  MDLMeshBufferData *v7;
  const char *v8;
  id result;

  v7 = [MDLMeshBufferData alloc];
  result = (id)objc_msgSend_initWithLength_data_allocator_zone_(v7, v8, a3, 0, self, 0);
  *((_QWORD *)result + 6) = a4;
  return result;
}

- (id)newBufferFromZone:(id)a3 data:(id)a4 type:(unint64_t)a5
{
  id v8;
  id v9;
  MDLMeshBufferData *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD *v15;

  v8 = a3;
  v9 = a4;
  v10 = [MDLMeshBufferData alloc];
  v13 = objc_msgSend_length(v9, v11, v12);
  v15 = (_QWORD *)objc_msgSend_initWithLength_data_allocator_zone_(v10, v14, v13, v9, self, v8);
  v15[6] = a5;

  return v15;
}

@end
