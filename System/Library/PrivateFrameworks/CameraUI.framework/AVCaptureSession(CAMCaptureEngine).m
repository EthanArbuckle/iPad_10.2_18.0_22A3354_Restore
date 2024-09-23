@implementation AVCaptureSession(CAMCaptureEngine)

- (void)cam_removeInputs:()CAMCaptureEngine
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "inputs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__AVCaptureSession_CAMCaptureEngine__cam_removeInputs___block_invoke;
  v7[3] = &unk_1EA32E798;
  v8 = v4;
  v9 = a1;
  v5 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

- (uint64_t)cam_ensureInputs:()CAMCaptureEngine
{
  return objc_msgSend(a1, "cam_ensureInputs:exclusively:", a3, 0);
}

- (uint64_t)cam_ensureOutputs:()CAMCaptureEngine whileRemoving:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[6];
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v7 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(a1, "outputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_whileRemoving___block_invoke;
  v18[3] = &unk_1EA32FFE8;
  v11 = v6;
  v19 = v11;
  v12 = v8;
  v20 = v12;
  v13 = v7;
  v21 = v13;
  v22 = a1;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v18);
  if (objc_msgSend(v12, "count"))
  {
    v14 = (void *)objc_msgSend(v12, "copy");
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __70__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_whileRemoving___block_invoke_2;
    v17[3] = &unk_1EA32FFC0;
    v17[4] = a1;
    v17[5] = &v23;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);

  }
  v15 = *((unsigned __int8 *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return v15;
}

- (BOOL)cam_hasAddedInput:()CAMCaptureEngine
{
  id v4;
  void *v5;
  id v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "inputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__AVCaptureSession_CAMCaptureEngine__cam_hasAddedInput___block_invoke;
  v9[3] = &unk_1EA32FEF8;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9) != 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (uint64_t)cam_ensureInputs:()CAMCaptureEngine exclusively:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[6];
  _QWORD v16[4];
  id v17;
  id v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(a1, "inputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__AVCaptureSession_CAMCaptureEngine__cam_ensureInputs_exclusively___block_invoke;
  v16[3] = &unk_1EA32FF20;
  v10 = v6;
  v17 = v10;
  v11 = v7;
  v20 = a4;
  v18 = v11;
  v19 = a1;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v16);
  if (objc_msgSend(v11, "count"))
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __67__AVCaptureSession_CAMCaptureEngine__cam_ensureInputs_exclusively___block_invoke_2;
    v15[3] = &unk_1EA32FF48;
    v15[4] = a1;
    v15[5] = &v21;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);

  }
  v13 = *((unsigned __int8 *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (void)cam_removeAllInputs
{
  id v2;
  _QWORD v3[5];

  objc_msgSend(a1, "inputs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__AVCaptureSession_CAMCaptureEngine__cam_removeAllInputs__block_invoke;
  v3[3] = &unk_1EA32FF70;
  v3[4] = a1;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

- (BOOL)cam_hasAddedOutput:()CAMCaptureEngine
{
  id v4;
  void *v5;
  id v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "outputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__AVCaptureSession_CAMCaptureEngine__cam_hasAddedOutput___block_invoke;
  v9[3] = &unk_1EA32EB70;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9) != 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (uint64_t)cam_ensureOutputs:()CAMCaptureEngine exclusively:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[6];
  _QWORD v16[4];
  id v17;
  id v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(a1, "outputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_exclusively___block_invoke;
  v16[3] = &unk_1EA32FF98;
  v10 = v6;
  v17 = v10;
  v11 = v7;
  v20 = a4;
  v18 = v11;
  v19 = a1;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v16);
  if (objc_msgSend(v11, "count"))
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __68__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_exclusively___block_invoke_2;
    v15[3] = &unk_1EA32FFC0;
    v15[4] = a1;
    v15[5] = &v21;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);

  }
  v13 = *((unsigned __int8 *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (void)cam_removeAllOutputs
{
  id v2;
  _QWORD v3[5];

  objc_msgSend(a1, "outputs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__AVCaptureSession_CAMCaptureEngine__cam_removeAllOutputs__block_invoke;
  v3[3] = &unk_1EA330010;
  v3[4] = a1;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

- (uint64_t)cam_ensureControls:()CAMCaptureEngine
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t j;
  uint64_t v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(a1, "controls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(a1, "removeControl:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v7);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v22;
    v15 = 1;
    *(_QWORD *)&v12 = 138543362;
    v20 = v12;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v10);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
        if (objc_msgSend(a1, "canAddControl:", v17, v20, (_QWORD)v21))
        {
          objc_msgSend(a1, "addControl:", v17);
        }
        else
        {
          v18 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v30 = v17;
            _os_log_error_impl(&dword_1DB760000, v18, OS_LOG_TYPE_ERROR, "Failed to add control %{public}@", buf, 0xCu);
          }

          v15 = 0;
        }
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v13);
  }
  else
  {
    v15 = 1;
  }

  return v15 & 1;
}

@end
