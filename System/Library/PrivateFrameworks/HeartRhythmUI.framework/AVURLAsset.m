@implementation AVURLAsset

void __43__AVURLAsset_HeartRhythmUI__hrui_assetSize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  float64x2_t v10;
  float64x2_t v11;
  double v12;
  double v13;
  float64x2_t v14;
  float64x2_t v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "naturalSize");
    if (v7)
    {
      v12 = v9;
      v13 = v8;
      objc_msgSend(v7, "preferredTransform");
      v9 = v12;
      v8 = v13;
      v10 = v14;
      v11 = v15;
    }
    else
    {
      v10 = 0uLL;
      v11 = 0uLL;
    }
    *(float64x2_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = vmlaq_n_f64(vmulq_n_f64(v11, v9), v10, v8);

  }
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __43__AVURLAsset_HeartRhythmUI__hrui_assetSize__block_invoke_cold_1();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __48__AVURLAsset_HeartRhythmUI__hrui_thumbnailImage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", a2);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __48__AVURLAsset_HeartRhythmUI__hrui_thumbnailImage__block_invoke_cold_1();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __43__AVURLAsset_HeartRhythmUI__hrui_assetSize__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_215454000, v0, v1, "[%{public}@ Failed to asynchronously get asset size for Heart Rhythm with error: %@");
}

void __48__AVURLAsset_HeartRhythmUI__hrui_thumbnailImage__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_215454000, v0, v1, "[%{public}@ Failed to asynchronously generate CG image for Heart Rhythm with error: %@");
}

@end
