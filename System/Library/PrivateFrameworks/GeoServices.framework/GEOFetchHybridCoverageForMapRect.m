@implementation GEOFetchHybridCoverageForMapRect

void __GEOFetchHybridCoverageForMapRect_block_invoke(uint64_t a1)
{
  double v2;
  float64x2_t v3;
  int32x2_t v4;
  int32x2_t v5;
  int64x2_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  double v12;
  char v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  __int128 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  double v31;
  double v32;
  double v33;
  char v34;
  NSObject *v35;
  int v36;
  __int32 v37;
  int32x2_t v38;
  int32x2_t v39;
  double v40;
  _QWORD v41[4];
  id v42;
  double v43;
  char v44;
  _QWORD block[4];
  id v46;
  _QWORD v47[2];
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  v2 = (double)(1 << *(double *)(a1 + 48)) * 0.0000000037252903;
  v3 = *(float64x2_t *)(a1 + 56);
  v4 = vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vmulq_n_f64(v3, v2))));
  v5 = vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vmulq_n_f64(vaddq_f64(v3, *(float64x2_t *)(a1 + 72)), v2))));
  v6 = vsubl_s32(v5, v4);
  if (v6.i64[1] * v6.i64[0] >= 0x3E9uLL && (v7 = *(void **)(a1 + 40)) != 0)
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __GEOFetchHybridCoverageForMapRect_block_invoke_2;
    block[3] = &unk_1E1C05D48;
    v46 = v7;
    dispatch_async(v8, block);
    v9 = v46;
  }
  else
  {
    v38 = v5;
    v39 = v4;
    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeTileGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v39.u32[0];
    v37 = v38.i32[0];
    if (v39.i32[0] <= v38.i32[0])
    {
      v14 = v39.i32[1];
      v36 = v39.i32[1];
      v12 = 0.0;
      v13 = -1;
      do
      {
        v38.i32[0] = v11;
        if (v14 <= v38.i32[1])
        {
          v15 = v11 << 46;
          v16 = (v11 >> 18);
          v17 = v14;
          do
          {
            *(_QWORD *)((char *)v48 + 1) = v15 | ((unint64_t)(*(double *)(a1 + 48) & 0x3F) << 40);
            LOBYTE(v48[0]) = 0;
            *((_QWORD *)&v18 + 1) = v16 & 0xFFFFFFFC000000FFLL | ((unint64_t)(v17 & 0x3FFFFFF) << 8) | 0x2000000000000;
            *(_QWORD *)&v18 = v15;
            v47[0] = v48[0];
            v47[1] = v18 >> 56;
            v19 = GEOMapRectForGEOTileKey((uint64_t)v47);
            v21 = v20;
            v23 = v22;
            v25 = v24;
            v40 = v12;
            v26 = *(double *)(a1 + 56);
            v27 = *(double *)(a1 + 64);
            v28 = *(double *)(a1 + 72);
            v29 = *(double *)(a1 + 80);
            v30 = objc_msgSend(v9, "isHybridModeAvailableForTileKey:", v47);
            GEOMapRectIntersection(v26, v27, v28, v29, v19, v21, v23, v25);
            v33 = v31 / v28 * (v32 / v29);
            if (v13 == -1)
              v34 = v30;
            else
              v34 = 2;
            if (v30 != v13)
              v13 = v34;
            if (!v30)
              v33 = -0.0;
            v12 = v40 + v33;
            ++v17;
          }
          while (v38.i32[1] + 1 != v17);
        }
        v11 = (v38.i32[0] + 1);
        v14 = v36;
      }
      while (v38.i32[0] != v37);
    }
    else
    {
      v12 = 0.0;
      v13 = -1;
    }
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __GEOFetchHybridCoverageForMapRect_block_invoke_3;
    v41[3] = &unk_1E1C21C58;
    v35 = *(NSObject **)(a1 + 32);
    v42 = *(id *)(a1 + 40);
    v44 = v13;
    v43 = v12;
    dispatch_async(v35, v41);

  }
}

void __GEOFetchHybridCoverageForMapRect_block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("Exceeded tile limit of 1000"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);

}

uint64_t __GEOFetchHybridCoverageForMapRect_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, double))(result + 16))(result, *(char *)(a1 + 48), 0, *(double *)(a1 + 40));
  return result;
}

@end
