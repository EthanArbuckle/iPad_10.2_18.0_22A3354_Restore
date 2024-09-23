@implementation PHAssetExportRequestPerformSlomoFlattening

uint64_t __PHAssetExportRequestPerformSlomoFlattening_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelRemaking");
}

uint64_t __PHAssetExportRequestPerformSlomoFlattening_block_invoke_2(uint64_t result, double a2)
{
  if (a2 < 1.0)
    return objc_msgSend(*(id *)(result + 32), "setCompletedUnitCount:", vcvtd_n_s64_f64(a2, 0x3FuLL));
  return result;
}

uint64_t __PHAssetExportRequestPerformSlomoFlattening_block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "videoOutputURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v7, v6);

  return objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", 0x7FFFFFFFFFFFFFFFLL);
}

@end
