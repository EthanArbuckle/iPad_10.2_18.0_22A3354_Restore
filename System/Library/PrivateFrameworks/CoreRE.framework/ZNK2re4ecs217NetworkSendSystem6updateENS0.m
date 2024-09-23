@implementation ZNK2re4ecs217NetworkSendSystem6updateENS0

_anonymous_namespace_ *___ZNK2re4ecs217NetworkSendSystem6updateENS0_6System13UpdateContextE_block_invoke_2(_anonymous_namespace_ *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;

  v2 = *a2;
  if (*a2)
  {
    v3 = *((_QWORD *)result + 4);
    result = *(_anonymous_namespace_ **)(v2 + 32);
    if (!result || (result = (_anonymous_namespace_ *)RESyncableIsAuthoritative(), (_DWORD)result))
    {
      v4 = *(_QWORD *)(v2 + 16);
      if (v4)
      {
        do
        {
          v5 = v4;
          v4 = *(_QWORD *)(v4 + 24);
        }
        while (v4);
        if (*(_QWORD *)(v5 + 16))
        {
          v6 = *(_QWORD *)(v3 + 112);
          v7 = *(_QWORD *)(v3 + 120);
          if (v7 >= v6)
          {
            v8 = v7 + 1;
            if (v6 < v7 + 1)
            {
              if (*(_QWORD *)(v3 + 104))
              {
                v9 = 2 * v6;
                v10 = v6 == 0;
                v11 = 8;
                if (!v10)
                  v11 = v9;
                if (v11 <= v8)
                  v12 = v8;
                else
                  v12 = v11;
                result = (_anonymous_namespace_ *)re::DynamicArray<float *>::setCapacity((_QWORD *)(v3 + 104), v12);
              }
              else
              {
                result = (_anonymous_namespace_ *)re::DynamicArray<float *>::setCapacity((_QWORD *)(v3 + 104), v8);
                ++*(_DWORD *)(v3 + 128);
              }
            }
            v7 = *(_QWORD *)(v3 + 120);
          }
          *(_QWORD *)(*(_QWORD *)(v3 + 136) + 8 * v7) = v2;
          *(_QWORD *)(v3 + 120) = v7 + 1;
          ++*(_DWORD *)(v3 + 128);
        }
      }
    }
  }
  return result;
}

@end
