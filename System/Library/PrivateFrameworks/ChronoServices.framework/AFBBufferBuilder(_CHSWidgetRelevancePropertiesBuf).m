@implementation AFBBufferBuilder(_CHSWidgetRelevancePropertiesBuf)

- (id)_chsCreateWidgetRelevancePropertiesBufUsingBlock:()_CHSWidgetRelevancePropertiesBuf
{
  void (**v5)(id, id *);
  void *v6;
  id *v7;
  void *v8;
  void *v10;

  v5 = a3;
  v6 = (void *)MEMORY[0x194008FB8]();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_CHSRelevanceCache_generated.mm"), 1461, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  objc_msgSend(a1, "throwIfFinalizedWithSelector:", a2);
  v7 = (id *)-[_CHSWidgetRelevancePropertiesBufBuilder initWithBufferBuilder:]([_CHSWidgetRelevancePropertiesBufBuilder alloc], a1);
  v5[2](v5, v7);
  -[_CHSRelevanceCacheBufBuilder _finish](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  return v8;
}

- (id)_chsCreateVectorOfWidgetRelevancePropertiesBufWithOffsets:()_CHSWidgetRelevancePropertiesBuf
{
  id result;

  *a2 = &off_1E2A59430;
  result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (id)_chsFinishedBufferWithRootWidgetRelevancePropertiesBufOfs:()_CHSWidgetRelevancePropertiesBuf error:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_CHSRelevanceCache_generated.mm"), 1483, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  objc_msgSend(a1, "throwIfFinalizedWithSelector:", a2);
  objc_msgSend(a1, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (a4)
    {
      objc_msgSend(a1, "firstError");
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    goto LABEL_16;
  }
  v10 = (void *)MEMORY[0x194008FB8]();
  objc_msgSend(a1, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v23 = 0;
    v12 = objc_msgSend(a1, "_chsFinishBufferWithRootWidgetRelevancePropertiesBufOfs:error:", v7, &v23);
    v13 = v23;
    if (!v12)
    {
      v9 = 0;
      goto LABEL_13;
    }
    v22 = v13;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v11, 8, &v22);
    v14 = v22;
  }
  else
  {
    v13 = v7;
    apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)objc_msgSend(a1, "fbb"), objc_msgSend(v13, "unsignedIntValue"), "RECA", 0);
    objc_msgSend(a1, "finalizeWithSelector:", a2);
    v15 = operator new();
    apple::aiml::flatbuffers2::FlatBufferBuilder::Release((apple::aiml::flatbuffers2::FlatBufferBuilder *)objc_msgSend(a1, "fbb"), v15);
    v16 = objc_alloc(MEMORY[0x1E0C99D50]);
    v17 = *(_QWORD *)(v15 + 32);
    v18 = *(_QWORD *)(v15 + 40);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __118__AFBBufferBuilder__CHSWidgetRelevancePropertiesBuf___chsFinishedBufferWithRootWidgetRelevancePropertiesBufOfs_error___block_invoke;
    v21[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
    v21[4] = v15;
    v9 = (void *)objc_msgSend(v16, "initWithBytesNoCopy:length:deallocator:", v17, v18, v21);
    v14 = 0;
  }

  v13 = v14;
LABEL_13:

  objc_autoreleasePoolPop(v10);
  if (a4)
    *a4 = objc_retainAutorelease(v13);

LABEL_16:
  return v9;
}

- (uint64_t)_chsFinishBufferWithRootWidgetRelevancePropertiesBufOfs:()_CHSWidgetRelevancePropertiesBuf error:
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t BufferPointer;
  _DWORD *v13;
  int v14;
  int v15;
  int v16;
  id v17;
  void *v19;
  id v20;
  _BYTE v21[48];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_CHSRelevanceCache_generated.mm"), 1517, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  objc_msgSend(a1, "throwIfFinalizedWithSelector:", a2);
  objc_msgSend(a1, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (a4)
    {
      objc_msgSend(a1, "firstError");
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x194008FB8]();
    v11 = v7;
    apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)objc_msgSend(a1, "fbb"), objc_msgSend(v11, "unsignedIntValue"), "RECA", 0);
    BufferPointer = apple::aiml::flatbuffers2::FlatBufferBuilder::GetBufferPointer((apple::aiml::flatbuffers2::FlatBufferBuilder *)objc_msgSend(a1, "fbb"));
    v13 = (_DWORD *)objc_msgSend(a1, "fbb");
    v14 = v13[8];
    v15 = v13[12];
    v16 = v13[10];
    apple::aiml::flatbuffers2::FlatBufferBuilder::Release((apple::aiml::flatbuffers2::FlatBufferBuilder *)objc_msgSend(a1, "fbb"), (uint64_t)v21);
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer((apple::aiml::flatbuffers2::DetachedBuffer *)v21);
    v20 = 0;
    v9 = objc_msgSend(a1, "finalizeWithSelector:allocatorBufferAddr:size:error:", a2, BufferPointer, (v14 - v15 + v16), &v20);
    v17 = v20;

    objc_autoreleasePoolPop(v10);
    if (a4)
      *a4 = objc_retainAutorelease(v17);

  }
  return v9;
}

- (uint64_t)_chsCreateVectorOfWidgetRelevancePropertiesBufWithOffsets:()_CHSWidgetRelevancePropertiesBuf
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)_chsCreateVectorOfWidgetRelevancePropertiesBufWithOffsets:()_CHSWidgetRelevancePropertiesBuf
{
}

- (_QWORD)_chsCreateVectorOfWidgetRelevancePropertiesBufWithOffsets:()_CHSWidgetRelevancePropertiesBuf
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_1E2A59430;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

@end
