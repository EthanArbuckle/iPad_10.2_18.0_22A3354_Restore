@implementation UIDocumentPickerContainerURLItem

void __48___UIDocumentPickerContainerURLItem_cacheValues__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  objc_msgSend(*(id *)(a1 + 32), "_removeCachedValues");
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 104);
  *(_QWORD *)(v3 + 104) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v5;

  v8 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 120);
  *(_QWORD *)(v9 + 120) = v8;

  v11 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 128);
  *(_QWORD *)(v12 + 128) = v11;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = *(_QWORD *)(a1 + 96);
  v14 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 152);
  *(_QWORD *)(v15 + 152) = v14;

  v17 = objc_msgSend(*(id *)(a1 + 80), "copy");
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 160);
  *(_QWORD *)(v18 + 160) = v17;

  v20 = objc_msgSend(*(id *)(a1 + 88), "copy");
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 176);
  *(_QWORD *)(v21 + 176) = v20;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 168) = *(_BYTE *)(a1 + 104);
}

@end
