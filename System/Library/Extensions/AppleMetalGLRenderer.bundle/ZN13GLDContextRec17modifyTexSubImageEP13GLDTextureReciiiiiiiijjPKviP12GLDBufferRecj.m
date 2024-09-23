@implementation ZN13GLDContextRec17modifyTexSubImageEP13GLDTextureReciiiiiiiijjPKviP12GLDBufferRecj

unsigned int *___ZN13GLDContextRec17modifyTexSubImageEP13GLDTextureReciiiiiiiijjPKviP12GLDBufferRecj_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t TextureResource;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  _OWORD v9[3];

  v2 = *(_QWORD *)(a1 + 40);
  TextureResource = GLDTextureRec::getTextureResource(*(GLDTextureRec **)(a1 + 48), 0);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)TextureResource + 40))(TextureResource, *(_QWORD *)(v2 + 88));
  (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 56) + 24) + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 24), *(_QWORD *)(v2 + 88));
  v4 = *(_QWORD *)(a1 + 72);
  if (v4 < *(_QWORD *)(a1 + 80) + v4)
  {
    v5 = *(_QWORD *)(a1 + 64);
    do
    {
      v6 = *(void **)(a1 + 32);
      v7 = *(_OWORD *)(a1 + 104);
      v9[0] = *(_OWORD *)(a1 + 88);
      v9[1] = v7;
      v9[2] = *(_OWORD *)(a1 + 120);
      objc_msgSend(v6, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v9, *(int *)(a1 + 152), v4, v5, *(int *)(a1 + 156), *(_QWORD *)(a1 + 136));
      v5 += *(_QWORD *)(a1 + 144);
      ++v4;
    }
    while (v4 < *(_QWORD *)(a1 + 80) + *(_QWORD *)(a1 + 72));
  }
  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 56) + 24))(*(_QWORD *)(a1 + 56));
  return GLDObject::release(*(unsigned int **)(a1 + 48));
}

_QWORD *___ZN13GLDContextRec17modifyTexSubImageEP13GLDTextureReciiiiiiiijjPKviP12GLDBufferRecj_block_invoke_3(_QWORD *result)
{
  unint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _OWORD *v4;
  void *v5;
  __int128 v6;
  _OWORD v7[3];

  v1 = result[6];
  if (v1 < result[7] + v1)
  {
    v2 = result;
    v3 = result[5];
    v4 = result + 8;
    do
    {
      v5 = (void *)v2[4];
      v6 = v4[1];
      v7[0] = *v4;
      v7[1] = v6;
      v7[2] = v4[2];
      result = (_QWORD *)objc_msgSend(v5, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v7, *((int *)v2 + 32), v1, v3, *((int *)v2 + 33), v2[14]);
      v3 += v2[15];
      ++v1;
    }
    while (v1 < v2[7] + v2[6]);
  }
  return result;
}

@end
