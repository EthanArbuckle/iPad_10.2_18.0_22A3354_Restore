@implementation ZN2CI16GLTextureManager19purge

_QWORD *___ZN2CI16GLTextureManager19purge_intermediatesEm_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  unint64_t v3;
  _QWORD *i;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v10[3];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(v1 + 136);
  v3 = v2[2];
  v10[0] = (uint64_t)v10;
  v10[1] = (uint64_t)v10;
  v10[2] = 0;
  for (i = (_QWORD *)v2[1]; i != v2; i = (_QWORD *)v7[1])
  {
    if (v3 <= *(_QWORD *)(a1 + 40) || (v6 = i[2], (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6)))
    {
      v7 = i;
    }
    else
    {
      (**(void (***)(uint64_t, _QWORD, _QWORD))v1)(v1, *(_QWORD *)(v6 + 8), *(_QWORD *)(v6 + 16));
      CFRelease(*(CFTypeRef *)(v6 + 24));
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6);
      v7 = (_QWORD *)i[1];
      if (v7 == v2)
      {
LABEL_14:
        std::list<CI::attached_surface_t *>::splice((uint64_t)v10, v10, (uint64_t)v2, i, v2);
        return std::__list_imp<CI::attached_surface_t *>::clear(v10);
      }
      --v3;
      while (v3 > *(_QWORD *)(a1 + 40))
      {
        v8 = v7[2];
        if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8))
          break;
        (**(void (***)(uint64_t, _QWORD, _QWORD))v1)(v1, *(_QWORD *)(v8 + 8), *(_QWORD *)(v8 + 16));
        CFRelease(*(CFTypeRef *)(v8 + 24));
        (*(void (**)(uint64_t))(*(_QWORD *)v8 + 48))(v8);
        v7 = (_QWORD *)v7[1];
        --v3;
        if (v7 == v2)
          goto LABEL_14;
      }
      std::list<CI::attached_surface_t *>::splice((uint64_t)v10, v10, (uint64_t)v2, i, v7);
    }
  }
  return std::__list_imp<CI::attached_surface_t *>::clear(v10);
}

@end
