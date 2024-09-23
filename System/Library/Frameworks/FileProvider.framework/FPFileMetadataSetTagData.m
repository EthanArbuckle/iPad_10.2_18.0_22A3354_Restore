@implementation FPFileMetadataSetTagData

BOOL __FPFileMetadataSetTagData_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v7;
  id v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  if (v4 != v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(v3 + 24));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "label");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_QWORD *)a2 = objc_msgSend(v8, "UTF8String");

    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(a2 + 8) = objc_msgSend(v9, "color");

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  return v4 != v2;
}

@end
