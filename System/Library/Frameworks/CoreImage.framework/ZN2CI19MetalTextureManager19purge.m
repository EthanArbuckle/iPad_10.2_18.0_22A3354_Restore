@implementation ZN2CI19MetalTextureManager19purge

_QWORD *___ZN2CI19MetalTextureManager19purge_intermediatesEm_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  _QWORD *i;
  uint64_t v8;
  char v9;
  uint64_t v11[3];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 136);
  v3 = *(_QWORD *)(v2 + 16);
  v11[0] = (uint64_t)v11;
  v11[1] = (uint64_t)v11;
  v11[2] = 0;
  v4 = *(_QWORD **)(v2 + 8);
  if (v4 != (_QWORD *)v2)
  {
    do
    {
      if (v3 <= *(_QWORD *)(a1 + 40) || (v6 = v4[2], (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6)))
      {
        i = v4;
      }
      else
      {
        (**(void (***)(uint64_t, _QWORD, _QWORD))v1)(v1, *(_QWORD *)(v6 + 8), *(_QWORD *)(v6 + 16));
        CFRelease(*(CFTypeRef *)(v6 + 24));
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6);
        --v3;
        for (i = (_QWORD *)v4[1]; ; i = (_QWORD *)i[1])
        {
          if (i == (_QWORD *)v2)
          {
            v9 = 1;
            i = (_QWORD *)v2;
            goto LABEL_15;
          }
          if (v3 <= *(_QWORD *)(a1 + 40))
            break;
          v8 = i[2];
          if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8))
            break;
          (**(void (***)(uint64_t, _QWORD, _QWORD))v1)(v1, *(_QWORD *)(v8 + 8), *(_QWORD *)(v8 + 16));
          CFRelease(*(CFTypeRef *)(v8 + 24));
          (*(void (**)(uint64_t))(*(_QWORD *)v8 + 48))(v8);
          --v3;
        }
        v9 = 0;
LABEL_15:
        std::list<CI::attached_surface_t *>::splice((uint64_t)v11, v11, v2, v4, i);
        if ((v9 & 1) != 0)
          goto LABEL_6;
      }
      i = (_QWORD *)i[1];
LABEL_6:
      v4 = i;
    }
    while (i != (_QWORD *)v2);
  }
  return std::__list_imp<CI::attached_surface_t *>::clear(v11);
}

@end
