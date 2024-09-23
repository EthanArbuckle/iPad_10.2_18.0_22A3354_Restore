@implementation AVCaptureSession

BOOL __56__AVCaptureSession_CAMCaptureEngine__cam_hasAddedInput___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

void __67__AVCaptureSession_CAMCaptureEngine__cam_ensureInputs_exclusively___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v4);
LABEL_5:
    v3 = v4;
    goto LABEL_6;
  }
  v3 = v4;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 48), "removeInput:", v4);
    goto LABEL_5;
  }
LABEL_6:

}

void __67__AVCaptureSession_CAMCaptureEngine__cam_ensureInputs_exclusively___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "canAddInput:", v3))
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__AVCaptureSession_CAMCaptureEngine__cam_ensureInputs_exclusively___block_invoke_2_cold_1((uint64_t)v3, (uint64_t *)(a1 + 32), v4);

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "addInput:", v3);
LABEL_8:

}

uint64_t __57__AVCaptureSession_CAMCaptureEngine__cam_removeAllInputs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeInput:", a2);
}

void __55__AVCaptureSession_CAMCaptureEngine__cam_removeInputs___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
    objc_msgSend(*(id *)(a1 + 40), "removeInput:", v3);

}

BOOL __57__AVCaptureSession_CAMCaptureEngine__cam_hasAddedOutput___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

void __68__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_exclusively___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v4);
LABEL_5:
    v3 = v4;
    goto LABEL_6;
  }
  v3 = v4;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 48), "removeOutput:", v4);
    goto LABEL_5;
  }
LABEL_6:

}

void __68__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_exclusively___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "canAddOutput:", v3))
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __68__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_exclusively___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "addOutput:", v3);
LABEL_8:

}

void __70__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_whileRemoving___block_invoke(id *a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(a1[4], "containsObject:"))
  {
    objc_msgSend(a1[5], "removeObject:", v3);
  }
  else if (objc_msgSend(a1[6], "containsObject:", v3))
  {
    objc_msgSend(a1[7], "removeOutput:", v3);
  }

}

void __70__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_whileRemoving___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "canAddOutput:", v3))
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __68__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_exclusively___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "addOutput:", v3);
LABEL_8:

}

uint64_t __58__AVCaptureSession_CAMCaptureEngine__cam_removeAllOutputs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeOutput:", a2);
}

void __67__AVCaptureSession_CAMCaptureEngine__cam_ensureInputs_exclusively___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Failed to add input %{public}@ to session %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __68__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_exclusively___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Failed to add output %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
