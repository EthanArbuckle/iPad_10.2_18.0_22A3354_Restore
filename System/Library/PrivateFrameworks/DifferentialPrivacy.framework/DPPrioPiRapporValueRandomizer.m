@implementation DPPrioPiRapporValueRandomizer

uint64_t __72___DPPrioPiRapporValueRandomizer_encodeClassIndices_withDimensionality___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  NSObject *v10;

  if (!*(_QWORD *)(a1 + 48))
    return 1;
  v6 = 0;
  while (1)
  {
    v7 = *(unsigned int *)(*(_QWORD *)(a1 + 56) + 4 * v6);
    v8 = v7 + v6 * objc_msgSend(*(id *)(a1 + 32), "prime");
    if (v8 >= a3)
      break;
    result = 1;
    *(_DWORD *)(a2 + 4 * v8) = 1;
    if ((unint64_t)++v6 >= *(_QWORD *)(a1 + 48))
      return result;
  }
  +[_DPLog framework](_DPLog, "framework");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __72___DPPrioPiRapporValueRandomizer_encodeClassIndices_withDimensionality___block_invoke_cold_1(a1, v6, v10);

  return 0;
}

void __72___DPPrioPiRapporValueRandomizer_encodeClassIndices_withDimensionality___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unsignedIntegerValue");
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1D3FAA000, a3, OS_LOG_TYPE_ERROR, "Prio algorithm cannot encode the Pi-Rappor results generated for class index %lu.", v5, 0xCu);

  OUTLINED_FUNCTION_3();
}

@end
