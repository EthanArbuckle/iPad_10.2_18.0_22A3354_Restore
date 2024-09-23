@implementation ZN2CI16GLTextureManager23purge

_QWORD *___ZN2CI16GLTextureManager23purge_attached_surfacesEm_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t i;
  uint64_t v13;
  BOOL v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  _DWORD *v19;
  CFTypeRef *v20;
  NSObject *v21;
  void *v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;

  v1 = result[4];
  v2 = *(_QWORD *)(v1 + 176);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v4 = result[5];
    v54 = &v54;
    v55 = &v54;
    v56 = 0;
    v5 = *(_QWORD *)(v2 + 8);
    if (v5 == v2)
    {
      v7 = 0;
      v6 = 0;
      v8 = &v54;
    }
    else
    {
      v6 = 0;
      v7 = 0;
      v8 = &v54;
      do
      {
        v9 = *(_QWORD *)(v5 + 16);
        if (!*(_BYTE *)(v9 + 24))
        {
          v10 = operator new(0x18uLL);
          v10[1] = &v54;
          v10[2] = v9;
          *v10 = v8;
          v8[1] = v10;
          ++v7;
          v6 = (v6 + 1);
          v8 = v10;
          v54 = v10;
          v56 = v7;
        }
        v5 = *(_QWORD *)(v5 + 8);
      }
      while (v5 != v2);
    }
    if (v3 >= v4)
      v11 = v3 - v4;
    else
      v11 = 0;
    if (v11 > (int)v6)
    {
      for (i = *(_QWORD *)(v2 + 8); i != v2; i = *(_QWORD *)(i + 8))
      {
        v13 = *(_QWORD *)(i + 16);
        if (*(_BYTE *)(v13 + 24))
          v14 = v11 > (int)v6;
        else
          v14 = 0;
        if (v14)
        {
          v15 = operator new(0x18uLL);
          v15[1] = &v54;
          v15[2] = v13;
          *v15 = v8;
          v8[1] = v15;
          ++v7;
          v6 = (v6 + 1);
          v8 = v15;
          v54 = v15;
          v56 = v7;
        }
      }
    }
    if ((_DWORD)v6)
    {
      v16 = malloc_type_malloc(4 * (int)v6, 0x100004052888210uLL);
      v17 = v16;
      v18 = v55;
      if (v55 != &v54)
      {
        v19 = v16;
        do
        {
          v20 = (CFTypeRef *)v18[2];
          v22[0] = v20;
          *v19++ = *((_DWORD *)v20 + 2);
          CFRelease(*v20);
          *(_QWORD *)v22[0] = 0;
          std::list<CI::attached_surface_t *>::remove(*(_QWORD **)(v1 + 176), v22);
          free(v22[0]);
          v18 = (_QWORD *)v18[1];
        }
        while (v18 != &v54);
      }
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      *(_OWORD *)v22 = 0u;
      v23 = 0u;
      GetMacroContext(*(void **)(v1 + 184), v22);
      if (!LOBYTE(v22[0]))
      {
        v21 = ci_logger_render();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          ___ZN2CI16GLTextureManager19create_intermediateERKNS_22IntermediateDescriptorEP11__IOSurfaceiRK5IRectmb_block_invoke_cold_1();
      }
      (*((void (**)(void *, uint64_t, void *))&v35 + 1))(v22[1], v6, v17);
      free(v17);
    }
    return std::__list_imp<CI::attached_surface_t *>::clear(&v54);
  }
  return result;
}

@end
