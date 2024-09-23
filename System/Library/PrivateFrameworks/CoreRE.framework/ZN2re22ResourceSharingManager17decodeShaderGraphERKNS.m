@implementation ZN2re22ResourceSharingManager17decodeShaderGraphERKNS

_anonymous_namespace_ *___ZN2re22ResourceSharingManager17decodeShaderGraphERKNS_4DataE_block_invoke(_anonymous_namespace_ *result)
{
  uint64_t v1;
  uint64_t v2;
  _anonymous_namespace_ *v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;

  v1 = *((_QWORD *)result + 5);
  v2 = *(_QWORD *)(v1 + 80);
  if (v2)
  {
    v3 = result;
    v4 = *(void ***)(v1 + 96);
    v5 = 168 * v2;
    do
    {
      v6 = *(_QWORD *)(*((_QWORD *)v3 + 4) + 8);
      v7 = *(_QWORD *)(v6 + 56);
      v8 = *(_QWORD *)(v6 + 64);
      if (v8 >= v7)
      {
        v9 = v8 + 1;
        if (v7 < v9)
        {
          if (*(_QWORD *)(v6 + 48))
          {
            if (v7)
              v10 = 2 * v7;
            else
              v10 = 8;
            if (v10 <= v9)
              v11 = v9;
            else
              v11 = v10;
            re::DynamicArray<re::ObjCObject>::setCapacity((_QWORD *)(v6 + 48), v11);
          }
          else
          {
            re::DynamicArray<re::ObjCObject>::setCapacity((_QWORD *)(v6 + 48), v9);
            ++*(_DWORD *)(v6 + 72);
          }
        }
        v8 = *(_QWORD *)(v6 + 64);
      }
      v12 = *(_QWORD *)(v6 + 80);
      v13 = *v4;
      v4 += 21;
      result = v13;
      *(_QWORD *)(v12 + 8 * v8) = result;
      ++*(_QWORD *)(v6 + 64);
      ++*(_DWORD *)(v6 + 72);
      v5 -= 168;
    }
    while (v5);
  }
  return result;
}

void **___ZN2re22ResourceSharingManager17decodeShaderGraphERKNS_4DataE_block_invoke_68(uint64_t a1, void *a2)
{
  return re::ObjCObject::operator=((void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), a2);
}

@end
