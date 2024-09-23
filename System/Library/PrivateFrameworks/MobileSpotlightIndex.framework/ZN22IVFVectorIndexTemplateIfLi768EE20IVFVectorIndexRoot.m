@implementation ZN22IVFVectorIndexTemplateIfLi768EE20IVFVectorIndexRoot

_DWORD *___ZN22IVFVectorIndexTemplateIfLi768EE20IVFVectorIndexRoot_sI30vi_onefixedsize_disk_allocator16vi_disk_postingsE14compactForTestIS2_EENSt3__19enable_ifIXsr13is_persistentIT_EE5valueEbE4typeEPS4_PVi_block_invoke(uint64_t a1, unsigned int *a2, BOOL *a3)
{
  uint64_t v5;
  _DWORD *result;

  v5 = **((_QWORD **)a2 + 3);
  result = IVFVectorIndexTemplate<float,768>::IVFVectorIndexRoot_s<vi_onefixedsize_disk_allocator,vi_disk_postings>::lookupForInsert(*(_QWORD *)(a1 + 32), a2[2], *((void **)a2 + 2), *a2, 0, *((float *)a2 + 1));
  *((_QWORD *)result + 384) = v5;
  *a3 = **(_DWORD **)(a1 + 40) != 0;
  return result;
}

int *___ZN22IVFVectorIndexTemplateIfLi768EE20IVFVectorIndexRoot_sI30vi_onefixedsize_disk_allocator16vi_disk_postingsE6existsERK10CIVector_sIfLi768EE_block_invoke(uint64_t a1, int a2, float *a3, _BYTE *a4)
{
  const void *v8;
  uint64_t v9;
  const void *v10;
  int *result;
  int v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  double v18;
  int v19;
  double v20;
  float v21;
  float v22;
  float v23;
  _BOOL4 v24;
  _BOOL4 v25;
  float v26;
  float v27;
  int v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BYTE v33[18];
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  _BOOL4 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = *(const void **)(a1 + 48);
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) + 32);
  v10 = (const void *)_windowsResolvePtr(v9 + 40, *(_QWORD *)(v9 + 24) + *(_QWORD *)(v9 + 16) * *(unsigned int *)a3, 0xC10uLL);
  result = (int *)memcmp(v8, v10, 0xC00uLL);
  if (!(_DWORD)result)
  {
    v12 = *__error();
    v13 = _SILogForLogForCategory(16);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = a3[1];
      v28 = 136315906;
      v29 = "exists_block_invoke";
      v30 = 1024;
      v31 = 2637;
      v32 = 1024;
      *(_DWORD *)v33 = a2;
      *(_WORD *)&v33[4] = 2048;
      *(double *)&v33[6] = v18;
      _os_log_error_impl(&dword_1B8270000, v13, OS_LOG_TYPE_ERROR, "%s:%d: Vector not found actually in partID=%u distsq=%e", (uint8_t *)&v28, 0x22u);
    }
    *__error() = v12;
    v14 = *__error();
    v15 = _SILogForLogForCategory(16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = *(_DWORD *)(a1 + 56);
      v20 = *(float *)(a1 + 60);
      v28 = 136315906;
      v29 = "exists_block_invoke";
      v30 = 1024;
      v31 = 2638;
      v32 = 1024;
      *(_DWORD *)v33 = v19;
      *(_WORD *)&v33[4] = 2048;
      *(double *)&v33[6] = v20;
      _os_log_error_impl(&dword_1B8270000, v15, OS_LOG_TYPE_ERROR, "%s:%d: Vec distance to centroid %u distsq=%e", (uint8_t *)&v28, 0x22u);
    }
    *__error() = v14;
    v16 = *__error();
    v17 = _SILogForLogForCategory(16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = *(float *)(a1 + 60);
      v22 = a3[1];
      v23 = vabds_f32(v21, v22);
      if (v21 == v22)
      {
        v24 = 1;
        v25 = 1;
      }
      else
      {
        v26 = fabsf(v21);
        v27 = fabsf(v22);
        v24 = v23 <= fmaxf(fminf(v27, v26) * 0.000015259, 0.000015259);
        v25 = v23 <= (float)(fmaxf(v26, v27) * 0.000015259);
      }
      v28 = 136317186;
      v29 = "exists_block_invoke";
      v30 = 1024;
      v31 = 2639;
      v32 = 2048;
      *(double *)v33 = v23;
      *(_WORD *)&v33[8] = 2048;
      *(_QWORD *)&v33[10] = 0x3810000000000000;
      v34 = 2048;
      v35 = 0x3E80000000000000;
      v36 = 1024;
      v37 = v23 < 1.1755e-38;
      v38 = 1024;
      v39 = v23 < 0.00000011921;
      v40 = 1024;
      v41 = v24;
      v42 = 1024;
      v43 = v25;
      _os_log_error_impl(&dword_1B8270000, v17, OS_LOG_TYPE_ERROR, "%s:%d: |distancesq - ve.distsq|=%e, FLT_MIN=%e, EPSILON=%e, %d, %d, %d, %d", (uint8_t *)&v28, 0x48u);
    }
    result = __error();
    *result = v16;
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *a3;
    *a4 = 1;
  }
  return result;
}

int *___ZN22IVFVectorIndexTemplateIfLi768EE20IVFVectorIndexRoot_sI32vi_onefixedsize_memory_allocator18vi_memory_postingsE6existsERK10CIVector_sIfLi768EE_block_invoke(uint64_t a1, int a2, float *a3, _BYTE *a4)
{
  const void *v8;
  const void *Ptr;
  int *result;
  int v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  double v17;
  int v18;
  double v19;
  float v20;
  float v21;
  float v22;
  _BOOL4 v23;
  _BOOL4 v24;
  float v25;
  float v26;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BYTE v32[18];
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  _BOOL4 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = *(const void **)(a1 + 48);
  Ptr = (const void *)vi_onefixedsize_memory_allocator::getPtr(*(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) + 16), *(unsigned int *)a3, 3092);
  result = (int *)memcmp(v8, Ptr, 0xC00uLL);
  if (!(_DWORD)result)
  {
    v11 = *__error();
    v12 = _SILogForLogForCategory(16);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v17 = a3[1];
      v27 = 136315906;
      v28 = "exists_block_invoke";
      v29 = 1024;
      v30 = 2637;
      v31 = 1024;
      *(_DWORD *)v32 = a2;
      *(_WORD *)&v32[4] = 2048;
      *(double *)&v32[6] = v17;
      _os_log_error_impl(&dword_1B8270000, v12, OS_LOG_TYPE_ERROR, "%s:%d: Vector not found actually in partID=%u distsq=%e", (uint8_t *)&v27, 0x22u);
    }
    *__error() = v11;
    v13 = *__error();
    v14 = _SILogForLogForCategory(16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_DWORD *)(a1 + 56);
      v19 = *(float *)(a1 + 60);
      v27 = 136315906;
      v28 = "exists_block_invoke";
      v29 = 1024;
      v30 = 2638;
      v31 = 1024;
      *(_DWORD *)v32 = v18;
      *(_WORD *)&v32[4] = 2048;
      *(double *)&v32[6] = v19;
      _os_log_error_impl(&dword_1B8270000, v14, OS_LOG_TYPE_ERROR, "%s:%d: Vec distance to centroid %u distsq=%e", (uint8_t *)&v27, 0x22u);
    }
    *__error() = v13;
    v15 = *__error();
    v16 = _SILogForLogForCategory(16);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = *(float *)(a1 + 60);
      v21 = a3[1];
      v22 = vabds_f32(v20, v21);
      if (v20 == v21)
      {
        v23 = 1;
        v24 = 1;
      }
      else
      {
        v25 = fabsf(v20);
        v26 = fabsf(v21);
        v23 = v22 <= fmaxf(fminf(v26, v25) * 0.000015259, 0.000015259);
        v24 = v22 <= (float)(fmaxf(v25, v26) * 0.000015259);
      }
      v27 = 136317186;
      v28 = "exists_block_invoke";
      v29 = 1024;
      v30 = 2639;
      v31 = 2048;
      *(double *)v32 = v22;
      *(_WORD *)&v32[8] = 2048;
      *(_QWORD *)&v32[10] = 0x3810000000000000;
      v33 = 2048;
      v34 = 0x3E80000000000000;
      v35 = 1024;
      v36 = v22 < 1.1755e-38;
      v37 = 1024;
      v38 = v22 < 0.00000011921;
      v39 = 1024;
      v40 = v23;
      v41 = 1024;
      v42 = v24;
      _os_log_error_impl(&dword_1B8270000, v16, OS_LOG_TYPE_ERROR, "%s:%d: |distancesq - ve.distsq|=%e, FLT_MIN=%e, EPSILON=%e, %d, %d, %d, %d", (uint8_t *)&v27, 0x48u);
    }
    result = __error();
    *result = v15;
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *a3;
    *a4 = 1;
  }
  return result;
}

@end
