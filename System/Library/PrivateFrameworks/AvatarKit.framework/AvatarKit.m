void OUTLINED_FUNCTION_5_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void OUTLINED_FUNCTION_2_4(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 597, a4);
}

uint64_t OUTLINED_FUNCTION_7_0(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "statusOfValueForKey:error:", a3, 0);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_3_3(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 580, a4);
}

void AVTCoordinatorLoadPoseAtPath(void *a1, void *a2, void *a3)
{
  void (**v5)(id, AVTAvatarPose *, void *);
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AVTAvatarPose *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  objc_msgSend(v6, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByDeletingPathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "fileURLWithPath:isDirectory:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v12, 0);
  v14 = -[AVTAvatarPose initWithDictionaryRepresentation:]([AVTAvatarPose alloc], "initWithDictionaryRepresentation:", v13);
  -[AVTAvatarPose setBakedAnimationBlendFactor:](v14, "setBakedAnimationBlendFactor:", 1.0);
  if (v14)
  {
    if (v9)
      goto LABEL_10;
    goto LABEL_7;
  }
  avt_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    AVTCoordinatorLoadPoseAtPath_cold_2(v15, v16, v17, v18, v19, v20, v21, v22);

  if (!v9)
  {
LABEL_7:
    avt_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      AVTCoordinatorLoadPoseAtPath_cold_1(v23, v24, v25, v26, v27, v28, v29, v30);

  }
LABEL_10:
  v5[2](v5, v14, v9);

}

void AVTCoordinatorLoadPosesAtPaths(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (**v32)(id, void *, void *);
  id obj;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v32 = a3;
  v7 = objc_msgSend(v6, "count");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v14);
        v34[0] = v13;
        v34[1] = 3221225472;
        v34[2] = __AVTCoordinatorLoadPosesAtPaths_block_invoke;
        v34[3] = &unk_1EA61D708;
        v35 = v8;
        v36 = v9;
        AVTCoordinatorLoadPoseAtPath(v5, v15, v34);

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v11);
  }

  if (!objc_msgSend(v8, "count"))
  {
    avt_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      AVTCoordinatorLoadPosesAtPaths_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);

  }
  if (!objc_msgSend(v9, "count"))
  {
    avt_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      AVTCoordinatorLoadPosesAtPaths_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);

  }
  v32[2](v32, v8, v9);

}

void AVTCoordinatorLoadPoseAnimationsAtPaths(void *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  AVTAvatarPoseAnimation *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (**v36)(id, void *, void *);
  id obj;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v38 = a1;
  v5 = a2;
  v36 = a3;
  v6 = objc_msgSend(v5, "count");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByDeletingPathExtension");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v38, "stringByAppendingPathComponent:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "fileURLWithPath:isDirectory:", v17, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = -[AVTAvatarPoseAnimation initWithAnimatedPoseRepresentationAtURL:]([AVTAvatarPoseAnimation alloc], "initWithAnimatedPoseRepresentationAtURL:", v18);
        objc_msgSend(v7, "addObject:", v19);
        objc_msgSend(v8, "addObject:", v15);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v10);
  }

  if (!objc_msgSend(v7, "count"))
  {
    avt_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      AVTCoordinatorLoadPoseAnimationsAtPaths_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);

  }
  if (!objc_msgSend(v8, "count"))
  {
    avt_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      AVTCoordinatorLoadPosesAtPaths_cold_1(v28, v29, v30, v31, v32, v33, v34, v35);

  }
  v36[2](v36, v7, v8);

}

void sub_1DD1FEFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

void sub_1DD201558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1DD201A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1DD2032F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD204838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1DD2054B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t AVTIsRunningInAppExtensionOrViewService()
{
  void *v1;
  uint64_t v2;

  if ((_UIApplicationIsExtension() & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0CEAC18], "_applicationKeyWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "_isHostedInAnotherProcess");

  return v2;
}

void sub_1DD206EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1DD207388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void AVTTrackingDataFromARFrame(uint64_t a1, void *a2, unint64_t a3, void *a4, uint64_t a5, uint64_t a6, int a7, int a8, float *a9)
{
  id v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  int32x4_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float32x4_t v29;
  int32x4_t v30;
  float32x2_t v31;
  float32x2_t v32;
  float32x4_t v33;
  int32x4_t v34;
  float32x2_t v35;
  float32x2_t v36;
  float32x4_t v37;
  float v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v43;
  float32x4_t v44;
  int32x4_t v45;
  float32_t v46;
  float32x4_t v47;
  float32x4_t v48;
  uint64_t v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  float32x4_t v64;
  __int128 v65;
  float32x4_t v66;
  float32x4_t v67;
  id v68;
  _QWORD v69[4];
  id v70;
  uint64_t v71;

  v68 = a2;
  v16 = a4;
  objc_msgSend(v16, "transform");
  v21 = _convertARFaceAnchorTransformToSceneKitTransform(a5, a6, a7, v68, a3, v17, v18, v19, v20);
  v65 = v22;
  v67 = (float32x4_t)v21;
  v61 = v24;
  v63 = v23;
  if (a9)
    *a9 = fabsf(atan2f(-v21.n128_f32[1], v21.n128_f32[0]));
  objc_msgSend(v68, "timestamp", v61, v63, v65);
  *(_QWORD *)a1 = v25;
  v26 = (int32x4_t)vmulq_f32(v67, v67);
  v26.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v26, 2), vadd_f32(*(float32x2_t *)v26.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v26.i8, 1))).u32[0];
  *(_OWORD *)(a1 + 16) = v62;
  v27 = vrsqrte_f32((float32x2_t)v26.u32[0]);
  v28 = vmul_f32(v27, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(v27, v27)));
  v29 = vmulq_n_f32(v67, vmul_f32(v28, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(v28, v28))).f32[0]);
  v30 = (int32x4_t)vmulq_f32(v64, v64);
  v30.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v30, 2), vadd_f32(*(float32x2_t *)v30.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v30.i8, 1))).u32[0];
  v31 = vrsqrte_f32((float32x2_t)v30.u32[0]);
  v32 = vmul_f32(v31, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v31, v31)));
  v33 = vmulq_n_f32(v64, vmul_f32(v32, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v32, v32))).f32[0]);
  v34 = (int32x4_t)vmulq_f32(v66, v66);
  v34.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2), vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1))).u32[0];
  v35 = vrsqrte_f32((float32x2_t)v34.u32[0]);
  v36 = vmul_f32(v35, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)));
  v37 = vmulq_n_f32(v66, vmul_f32(v36, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v36, v36))).f32[0]);
  v38 = (float)(v29.f32[0] + v33.f32[1]) + v37.f32[2];
  if (v38 <= 0.0)
  {
    if (v29.f32[0] <= v33.f32[1] || v29.f32[0] <= v37.f32[2])
    {
      if (v33.f32[1] <= v37.f32[2])
      {
        v48.i64[0] = v37.i64[0];
        v48.f32[2] = (float)(v37.f32[2] + 1.0) - v29.f32[0];
        v48.i32[3] = v29.i32[1];
        v41 = (float32x4_t)vrev64q_s32((int32x4_t)vextq_s8((int8x16_t)vtrn1q_s32((int32x4_t)v33, (int32x4_t)v29), (int8x16_t)v33, 8uLL));
        v40.i64[0] = vaddq_f32(v37, v41).u64[0];
        v40.i64[1] = vsubq_f32(v48, v41).i64[1];
        v41.i32[0] = v40.i32[2];
      }
      else
      {
        v43 = v33;
        v43.f32[1] = (float)(v33.f32[1] + 1.0) - v29.f32[0];
        v43.i32[3] = v37.i32[0];
        v44 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v29, (int32x4_t)v37), vtrn1q_s32((int32x4_t)v37, (int32x4_t)v29));
        v45 = (int32x4_t)vaddq_f32(v33, v44);
        v41 = vsubq_f32(v43, v44);
        v40 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v45), (int32x4_t)v41);
        v41.i32[0] = v41.i32[1];
      }
    }
    else
    {
      v46 = (float)(v29.f32[0] + 1.0) - v33.f32[1];
      v47 = (float32x4_t)vextq_s8((int8x16_t)v33, (int8x16_t)vtrn1q_s32((int32x4_t)v33, (int32x4_t)v37), 0xCuLL);
      v40 = vaddq_f32(v47, v29);
      v47.f32[0] = v46;
      v29.i32[0] = v37.i32[2];
      v29.i32[3] = v37.i32[1];
      v41 = vsubq_f32(v47, v29);
      v40.i32[0] = v41.i32[0];
      v40.i32[3] = v41.i32[3];
    }
  }
  else
  {
    v39 = (float32x4_t)vzip2q_s32((int32x4_t)v33, vuzp1q_s32((int32x4_t)v33, (int32x4_t)v37));
    v39.i32[2] = v29.i32[1];
    v41 = (float32x4_t)vtrn2q_s32((int32x4_t)v37, vzip2q_s32((int32x4_t)v37, (int32x4_t)v29));
    v41.i32[2] = v33.i32[0];
    v40 = vsubq_f32(v39, v41);
    v41.i32[3] = 1.0;
    v39.f32[3] = v38;
    v40.i32[3] = vaddq_f32(v39, v41).i32[3];
    v41.i32[0] = v40.i32[3];
  }
  v49 = 0;
  *(float32x4_t *)(a1 + 32) = vmulq_n_f32(v40, 0.5 / sqrtf(v41.f32[0]));
  *(_BYTE *)(a1 + 48) = a7 ^ 1;
  do
  {
    AVTBlendShapeLocationFromARIndex(v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_avt_rawBlendShapeAtLocation:", v50);
    *(_DWORD *)(a1 + 4 * v49 + 256) = v51;

    ++v49;
  }
  while (v49 != 51);
  AVTBlendShapeLocationFromARIndex(51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_avt_rawBlendShapeAtLocation:", v52);
  *(_DWORD *)(a1 + 464) = v53;

  if (a8)
  {
    v54 = *(_OWORD *)(a1 + 384);
    *(_OWORD *)(a1 + 196) = *(_OWORD *)(a1 + 400);
    v55 = *(_OWORD *)(a1 + 432);
    *(_OWORD *)(a1 + 212) = *(_OWORD *)(a1 + 416);
    *(_OWORD *)(a1 + 228) = v55;
    v56 = *(_OWORD *)(a1 + 320);
    *(_OWORD *)(a1 + 132) = *(_OWORD *)(a1 + 336);
    v57 = *(_OWORD *)(a1 + 368);
    *(_OWORD *)(a1 + 148) = *(_OWORD *)(a1 + 352);
    *(_OWORD *)(a1 + 164) = v57;
    *(_OWORD *)(a1 + 180) = v54;
    v58 = *(_OWORD *)(a1 + 256);
    *(_OWORD *)(a1 + 68) = *(_OWORD *)(a1 + 272);
    v59 = *(_OWORD *)(a1 + 304);
    *(_OWORD *)(a1 + 84) = *(_OWORD *)(a1 + 288);
    *(_OWORD *)(a1 + 100) = v59;
    *(_OWORD *)(a1 + 116) = v56;
    *(_OWORD *)(a1 + 52) = v58;
    *(_OWORD *)(a1 + 240) = *(_OWORD *)(a1 + 444);
    *(_DWORD *)(a1 + 460) = *(_DWORD *)(a1 + 464);
  }
  else
  {
    objc_msgSend(v16, "blendShapes");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __AVTTrackingDataFromARFrame_block_invoke;
    v69[3] = &unk_1EA61DC20;
    v71 = a1;
    v70 = v16;
    objc_msgSend(v60, "enumerateKeysAndObjectsUsingBlock:", v69);

  }
}

__n128 _convertARFaceAnchorTransformToSceneKitTransform(uint64_t a1, uint64_t a2, int a3, void *a4, unint64_t a5, __n128 a6, __n128 a7, __n128 a8, __n128 a9)
{
  id v13;
  void *v14;
  void *v15;
  __int32 v16;
  __int32 v17;
  __int32 v18;
  float32x4_t v19;
  unint64_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  __n128 v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  unint64_t v29;
  float32x4_t v30;
  void *v31;
  simd_float4 v32;
  simd_float4 v33;
  simd_float4 v34;
  simd_float4 v35;
  unint64_t v36;
  simd_float4 v38;
  __int32 v39;
  simd_float4 v40;
  __int32 v41;
  float32x4_t v42;
  simd_float4 v43;
  simd_float4 v44;
  __int32 v45;
  __n128 v47;
  __n128 v49;
  __n128 v51;
  __n128 v53;
  __n128 v54;
  __n128 v55;
  __n128 v56;
  __n128 v57;
  __n128 v58;
  __n128 v59;
  __n128 v60;
  float32x4_t v61;
  simd_float4x4 v62;
  simd_float4x4 v63;

  v13 = a4;
  v14 = v13;
  if (a3)
  {
    objc_msgSend(v13, "camera");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayCenterTransform");
    v39 = v16;
    v41 = v17;
    v42 = v19;
    v45 = v18;

    v20 = 0;
    v21 = (float32x4_t)xmmword_1DD26A060;
    v21.i32[3] = v39;
    v22 = (float32x4_t)xmmword_1DD26A070;
    v22.i32[3] = v41;
    v23 = (float32x4_t)xmmword_1DD26A080;
    v23.i32[3] = v45;
    v24 = vnegq_f32(v42);
    v24.i32[3] = v42.i32[3];
    v54 = a6;
    v55 = a7;
    v56 = a8;
    v57 = a9;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v58 + v20) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(_OWORD *)((char *)&v54 + v20))), v22, (float32x2_t)v54.n128_u64[v20 / 8], 1), v23, *(float32x4_t *)((char *)&v54 + v20), 2), v24, *(float32x4_t *)((char *)&v54 + v20), 3);
      v20 += 16;
    }
    while (v20 != 64);
    a6 = v58;
    a7 = v59;
    a8 = v60;
    a9 = (__n128)v61;
  }
  v25 = AVTARKitTransformToSceneKitTransformMatrix(a5, a1, a2);
  v29 = 0;
  v54 = a6;
  v55 = a7;
  v56 = a8;
  v57 = a9;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v58 + v29) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v25, COERCE_FLOAT(*(_OWORD *)((char *)&v54 + v29))), v26, (float32x2_t)v54.n128_u64[v29 / 8], 1), v27, *(float32x4_t *)((char *)&v54 + v29), 2), v28, *(float32x4_t *)((char *)&v54 + v29), 3);
    v29 += 16;
  }
  while (v29 != 64);
  v51 = v59;
  v53 = v58;
  v49 = v60;
  if (a3)
  {
    AVTGetNeutralZ();
  }
  else
  {
    v30 = vmulq_f32(v61, (float32x4_t)vdupq_n_s32(0x42C80000u));
    v30.i32[3] = v61.i32[3];
    v47 = (__n128)v30;
    objc_msgSend(v14, "camera");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "transform");
    v43 = v33;
    v44 = v32;
    v38 = v35;
    v40 = v34;

    v62.columns[1] = v43;
    v62.columns[0] = v44;
    v62.columns[3] = v38;
    v62.columns[2] = v40;
    v63 = __invert_f4(v62);
    v36 = 0;
    v54 = v53;
    v55 = v51;
    v56 = v49;
    v57 = v47;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v58 + v36) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v63.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v54 + v36))), (float32x4_t)v63.columns[1], (float32x2_t)v54.n128_u64[v36 / 8], 1), (float32x4_t)v63.columns[2], *(float32x4_t *)((char *)&v54 + v36), 2), (float32x4_t)v63.columns[3], *(float32x4_t *)((char *)&v54 + v36), 3);
      v36 += 16;
    }
    while (v36 != 64);
    v53 = v58;
  }

  return v53;
}

uint64_t ___slowestToFastestVideoFormatsForConfiguration_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "framesPerSecond"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "framesPerSecond");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

void sub_1DD20BD1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 120));
  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_1DD20C084(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD20CB8C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 120));
  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_1DD20CEF4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1DD20D43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD20D8AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD20DD04(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 120));
  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_1DD20E134(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD20E3D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVTPosterExpectsExtraTallContent(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "showsBody");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("giraffe"));

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

void sub_1DD212090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DD21260C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

id AVTPlistDatabaseMemojiAssetWithIdentifier(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (AVTPlistDatabaseMemojiAssetWithIdentifier::onceToken != -1)
    dispatch_once(&AVTPlistDatabaseMemojiAssetWithIdentifier::onceToken, &__block_literal_global_3);
  objc_msgSend((id)AVTPlistDatabaseMemojiAssetWithIdentifier::kAVTPlistDatabase_assetByIdentifier, "objectForKeyedSubscript:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1DD214BDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DD214C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

id AVTPlistDatabaseMemojiAssetsForComponentType(unint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (AVTPlistDatabaseMemojiAssetsForComponentType::onceToken != -1)
    dispatch_once(&AVTPlistDatabaseMemojiAssetsForComponentType::onceToken, &__block_literal_global_19);
  v2 = (void *)AVTPlistDatabaseMemojiAssetsForComponentType::kAVTPlistDatabase_assetIdentifiersByComponentType;
  AVTComponentTypeToString(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1DD214D30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DD214DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t AVTBlendShapeLocationToARIndex(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  if (_initialiseBlendshapeMappingIfNeeded_onceToken != -1)
    dispatch_once(&_initialiseBlendshapeMappingIfNeeded_onceToken, &__block_literal_global_4);
  objc_msgSend((id)kAVTBlendShapeLocationIndices, "objectForKeyedSubscript:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

id AVTBlendShapeLocationFromARIndex(uint64_t a1)
{
  if (_initialiseBlendshapeMappingIfNeeded_onceToken != -1)
    dispatch_once(&_initialiseBlendshapeMappingIfNeeded_onceToken, &__block_literal_global_4);
  return kAVTBlendShapeLocationFromARIndex[a1];
}

BOOL AVTMorphTargetNameIsUsedForFaceAnimation(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = _initialiseBlendshapeMappingIfNeeded_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_initialiseBlendshapeMappingIfNeeded_onceToken, &__block_literal_global_4);
  objc_msgSend((id)kAVTBlendShapeLocationIndices, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

uint64_t AVTMorphTargetNameIsUsedForDynamics(void *a1, const char *a2)
{
  return objc_msgSend(a1, "containsString:", CFSTR("_DYN_"));
}

uint64_t AVTMorphTargetNameIsUsedForBindings(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "containsString:", CFSTR("__")) & 1) != 0
    || (objc_msgSend(v1, "containsString:", CFSTR("_0_")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_backward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_forward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_rightward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_leftward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_downward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_upward")) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("Emoji")) ^ 1;
  }

  return v2;
}

uint64_t AVTMorphTargetNameDefinesPose(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "containsString:", CFSTR("__")) & 1) != 0
    || (objc_msgSend(v1, "containsString:", CFSTR("_0_")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_backward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_forward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_rightward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_leftward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_downward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_upward")) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("variant_")) ^ 1;
  }

  return v2;
}

uint64_t AVTMorphTargetNameIsOfInterestForAnimator(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "containsString:", CFSTR("_0_")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_backward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_forward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_rightward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_leftward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_downward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_upward")) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("Emoji")) ^ 1;
  }

  return v2;
}

void ___initialiseBlendshapeMappingIfNeeded_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *, uint64_t);
  void *v34;
  id v35;
  uint64_t v36;
  _QWORD v37[52];

  v37[51] = *MEMORY[0x1E0C80C00];
  if (AVTFaceTrackingIsSupported_onceToken != -1)
    dispatch_once(&AVTFaceTrackingIsSupported_onceToken, &__block_literal_global_44);
  if (AVTFaceTrackingIsSupported_kAVTFaceTrackingIsSupported)
  {
    v36 = 0;
    CVAFaceTrackingCopySemantics();
    objc_msgSend(0, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC88]);
    v0 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = *MEMORY[0x1E0C89388];
    v37[0] = *MEMORY[0x1E0C89380];
    v37[1] = v1;
    v2 = *MEMORY[0x1E0C893D8];
    v37[2] = *MEMORY[0x1E0C893D0];
    v37[3] = v2;
    v3 = *MEMORY[0x1E0C89398];
    v37[4] = *MEMORY[0x1E0C89390];
    v37[5] = v3;
    v4 = *MEMORY[0x1E0C893A8];
    v37[6] = *MEMORY[0x1E0C893A0];
    v37[7] = v4;
    v5 = *MEMORY[0x1E0C893E8];
    v37[8] = *MEMORY[0x1E0C893E0];
    v37[9] = v5;
    v6 = *MEMORY[0x1E0C893B8];
    v37[10] = *MEMORY[0x1E0C893B0];
    v37[11] = v6;
    v7 = *MEMORY[0x1E0C893C8];
    v37[12] = *MEMORY[0x1E0C893C0];
    v37[13] = v7;
    v8 = *MEMORY[0x1E0C89348];
    v37[14] = *MEMORY[0x1E0C89340];
    v37[15] = v8;
    v9 = *MEMORY[0x1E0C89358];
    v37[16] = *MEMORY[0x1E0C89350];
    v37[17] = v9;
    v10 = *MEMORY[0x1E0C89400];
    v37[18] = *MEMORY[0x1E0C89360];
    v37[19] = v10;
    v11 = *MEMORY[0x1E0C893F8];
    v37[20] = *MEMORY[0x1E0C89410];
    v37[21] = v11;
    v12 = *MEMORY[0x1E0C893F0];
    v37[22] = *MEMORY[0x1E0C89408];
    v37[23] = v12;
    v13 = *MEMORY[0x1E0C894C0];
    v37[24] = *MEMORY[0x1E0C894B8];
    v37[25] = v13;
    v14 = *MEMORY[0x1E0C89450];
    v37[26] = *MEMORY[0x1E0C89448];
    v37[27] = v14;
    v15 = *MEMORY[0x1E0C89478];
    v37[28] = *MEMORY[0x1E0C89480];
    v37[29] = v15;
    v16 = *MEMORY[0x1E0C894A0];
    v37[30] = *MEMORY[0x1E0C89498];
    v37[31] = v16;
    v17 = *MEMORY[0x1E0C89420];
    v37[32] = *MEMORY[0x1E0C89418];
    v37[33] = v17;
    v18 = *MEMORY[0x1E0C894B0];
    v37[34] = *MEMORY[0x1E0C894A8];
    v37[35] = v18;
    v19 = *MEMORY[0x1E0C89430];
    v37[36] = *MEMORY[0x1E0C89428];
    v37[37] = v19;
    v20 = *MEMORY[0x1E0C89460];
    v37[38] = *MEMORY[0x1E0C89458];
    v37[39] = v20;
    v21 = *MEMORY[0x1E0C89438];
    v37[40] = *MEMORY[0x1E0C89468];
    v37[41] = v21;
    v22 = *MEMORY[0x1E0C89470];
    v37[42] = *MEMORY[0x1E0C89440];
    v37[43] = v22;
    v23 = *MEMORY[0x1E0C89490];
    v37[44] = *MEMORY[0x1E0C89488];
    v37[45] = v23;
    v24 = *MEMORY[0x1E0C894D0];
    v37[46] = *MEMORY[0x1E0C894C8];
    v37[47] = v24;
    v25 = *MEMORY[0x1E0C89370];
    v37[48] = *MEMORY[0x1E0C89368];
    v37[49] = v25;
    v37[50] = *MEMORY[0x1E0C89378];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 51);
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v0, "count") != 51)
    ___initialiseBlendshapeMappingIfNeeded_block_invoke_cold_1();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 52);
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = ___initialiseBlendshapeMappingIfNeeded_block_invoke_2;
  v34 = &unk_1EA61E250;
  v35 = v26;
  v27 = v26;
  objc_msgSend(v0, "enumerateObjectsUsingBlock:", &v31);
  v28 = *MEMORY[0x1E0C894D8];
  objc_storeStrong(&qword_1F03CEAF8, (id)*MEMORY[0x1E0C894D8]);
  objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_1EA655930, v28, v31, v32, v33, v34);
  v29 = objc_msgSend(v27, "copy");
  v30 = (void *)kAVTBlendShapeLocationIndices;
  kAVTBlendShapeLocationIndices = v29;

}

void ___initialiseBlendshapeMappingIfNeeded_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  id v7;

  objc_storeStrong(&kAVTBlendShapeLocationFromARIndex[a3], a2);
  v6 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

__CFString *AVTComponentTypeToString(unint64_t a1)
{
  if (a1 > 0x29)
    return 0;
  else
    return off_1EA61E2E0[a1];
}

uint64_t AVTComponentTypeFromString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  if (AVTComponentTypeFromString_onceToken != -1)
    dispatch_once(&AVTComponentTypeFromString_onceToken, &__block_literal_global_5);
  objc_msgSend((id)AVTComponentTypeFromString_nameToType, "objectForKeyedSubscript:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)AVTComponentTypeFromString_nameToType, "objectForKeyedSubscript:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (int)objc_msgSend(v3, "intValue");

  }
  else
  {
    v4 = 42;
  }

  return v4;
}

uint64_t AVTComponentTypeIsPairable(unint64_t a1)
{
  return (a1 < 0x1C) & (0xC600000u >> a1);
}

BOOL AVTComponentTypeIsOnLeftInPair(uint64_t a1)
{
  return a1 == 26 || a1 == 21;
}

BOOL AVTComponentTypeIsOnRightInPair(uint64_t a1)
{
  return a1 == 27 || a1 == 22;
}

uint64_t AVTBodyRegionForComponentType(uint64_t a1)
{
  if ((unint64_t)(a1 - 34) > 7)
    return 0;
  else
    return qword_1DD26A188[a1 - 34];
}

void addAnimation(void *a1, void *a2, void *a3, void *a4, unsigned __int8 *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  __int128 v18;
  int v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  id v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  id v40;
  uint64_t *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[5];
  _QWORD v68[6];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  char v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v66 = v10;
  objc_msgSend(v10, "subAnimations");
  v72 = 0u;
  v70 = 0u;
  v71 = 0u;
  v69 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v70 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
        v18 = *((_OWORD *)a5 + 1);
        v73 = *(_OWORD *)a5;
        v74 = v18;
        addAnimation(v9, v17, v11, v12, &v73);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
    }
    while (v14);
  }

  if (!objc_msgSend(v13, "count"))
  {
    v19 = *a5;
    v20 = *((double *)a5 + 1);
    v21 = *((double *)a5 + 3);
    v22 = v10;
    objc_msgSend(v22, "startDelay");
    v24 = v23;
    objc_msgSend(v22, "setUsesSceneTimeBase:", 0);
    objc_msgSend(v22, "setStartDelay:", 0.0);
    objc_msgSend(v22, "caAnimation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "setUsesSceneTimeBase:", 0);
    objc_msgSend(v25, "setBeginTime:", 0.0);
    if (v19 && v24 != 0.0 && vabdd_f64(v20 / v21, v24) >= 0.001)
    {
      avt_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        addAnimation_cold_5(v26, v24, v27, v28);

    }
    objc_msgSend(v22, "keyPath");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v65, "containsString:", CFSTR("morpher.weights"));
    objc_msgSend(v65, "componentsSeparatedByString:", CFSTR("/"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "lastObject");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v64, "rangeOfString:", CFSTR("."));
    if (v31 == 0x7FFFFFFFFFFFFFFFLL)
      v32 = 1;
    else
      v32 = v29;
    if (v32 == 1)
    {
      objc_msgSend(v9, "name");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v64;
    }
    else
    {
      v34 = v30;
      objc_msgSend(v64, "substringToIndex:", v31);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "substringFromIndex:", v31 + v34);
      v33 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setKeyPath:", v33);
      objc_msgSend(MEMORY[0x1E0CD5A38], "flush");
      v65 = v33;
    }
    if ((objc_msgSend(v33, "isEqualToString:", CFSTR("transform")) & 1) != 0
      || (objc_msgSend(v33, "isEqualToString:", CFSTR("position")) & 1) != 0
      || (objc_msgSend(v33, "isEqualToString:", CFSTR("orientation")) & 1) != 0
      || (objc_msgSend(v33, "isEqualToString:", CFSTR("rotation")) & 1) != 0
      || objc_msgSend(v33, "isEqualToString:", CFSTR("eulerAngles")))
    {
      v77 = 0;
      v78 = &v77;
      v79 = 0x2020000000;
      v80 = 0;
      objc_msgSend(v22, "caAnimation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = v35;
        *(_QWORD *)&v73 = 0;
        *((_QWORD *)&v73 + 1) = &v73;
        *(_QWORD *)&v74 = 0x3032000000;
        *((_QWORD *)&v74 + 1) = __Block_byref_object_copy__3;
        v75 = __Block_byref_object_dispose__3;
        v76 = 0;
        -[NSObject values](v36, "values");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = __addAnimation_block_invoke;
        v68[3] = &unk_1EA61E900;
        v68[4] = &v73;
        v68[5] = &v77;
        objc_msgSend(v37, "enumerateObjectsUsingBlock:", v68);

        _Block_object_dispose(&v73, 8);
      }
      else
      {
        avt_default_log();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          addAnimation_cold_1(v39, (uint64_t)&v73, v36);
        }
      }

      if (*((_BYTE *)v78 + 24))
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", v62);
        v40 = (id)objc_claimAutoreleasedReturnValue();
        if (!v40)
        {
          v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v40, v62);
        }
        objc_msgSend(v40, "addObject:", v22);

      }
      v41 = &v77;
    }
    else
    {
      if (!v29)
      {
        avt_default_log();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          addAnimation_cold_4(v22, v45);

        goto LABEL_36;
      }
      *(_QWORD *)&v73 = 0;
      *((_QWORD *)&v73 + 1) = &v73;
      *(_QWORD *)&v74 = 0x2020000000;
      BYTE8(v74) = 0;
      objc_msgSend(v22, "caAnimation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = v42;
        -[NSObject values](v43, "values");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __addAnimation_block_invoke_213;
        v67[3] = &unk_1EA61E928;
        v67[4] = &v73;
        objc_msgSend(v44, "enumerateObjectsUsingBlock:", v67);

      }
      else
      {
        avt_default_log();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v46 = (objc_class *)objc_opt_class();
          NSStringFromClass(v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          addAnimation_cold_1(v47, (uint64_t)&v77, v43);
        }
      }

      if (*(_BYTE *)(*((_QWORD *)&v73 + 1) + 24))
      {
        objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("morpher\\.weights\\[([0-9]+)\\]"), 0, 0);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "matchesInString:options:range:", v65, 0, 0, objc_msgSend(v65, "length"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v61, "count"))
        {
          objc_msgSend(v61, "firstObject");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "rangeAtIndex:", 1);
          v51 = v50;

          objc_msgSend(v65, "substringWithRange:", v49, v51);
          v59 = objc_claimAutoreleasedReturnValue();
          v52 = -[NSObject integerValue](v59, "integerValue");
          objc_msgSend(v9, "morpher");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "targets");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectAtIndexedSubscript:", v52);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "name");
          v58 = objc_claimAutoreleasedReturnValue();

          v56 = v59;
          v65 = (void *)v58;
        }
        else
        {
          avt_default_log();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            addAnimation_cold_2(v56);
        }

        if (v65 && AVTMorphTargetNameDefinesPose(v65))
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", v65);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v57)
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, v65);

        }
      }

      v41 = (uint64_t *)&v73;
    }
    _Block_object_dispose(v41, 8);
LABEL_36:

  }
}

void sub_1DD218EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1DD219EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __addAnimation_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id *v9;
  id v10;

  v8 = a2;
  v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v10 = v8;
  if (a3)
  {
    if ((objc_msgSend(v8, "isEqual:", *v9) & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {
    objc_storeStrong(v9, a2);
  }

}

uint64_t __addAnimation_block_invoke_213(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  float v7;

  result = objc_msgSend(a2, "floatValue");
  if (v7 != 0.0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void sub_1DD21E530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id AVTGetCapturedDepthTexture(void *a1, __CVMetalTextureCache *a2)
{
  id v3;
  void *v4;
  id v5;
  __CVBuffer *v6;
  size_t Width;
  size_t Height;
  void *v9;
  CVMetalTextureRef image;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "depthDataByConvertingToDepthDataType:", 1717855600);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (__CVBuffer *)objc_msgSend(v5, "depthDataMap");
    Width = CVPixelBufferGetWidth(v6);
    Height = CVPixelBufferGetHeight(v6);
    image = 0;
    if (CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, v6, 0, MTLPixelFormatR32Float, Width, Height, 0, &image))
    {
      v9 = 0;
    }
    else
    {
      CVMetalTextureGetTexture(image);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(image);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_1DD22062C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__n128 AVTColor4WithCGColor(CGColor *a1)
{
  CGColorSpace *v2;
  const void *v3;
  CGColor *v4;
  size_t NumberOfComponents;
  float64x2_t *Components;
  __int32 v7;
  int8x16_t v8;
  float v9;
  __int128 v10;
  float v11;
  __int128 v13;

  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA00]);
  if (CGColorGetColorSpace(a1) == v2)
  {
    v4 = CGColorRetain(a1);
  }
  else
  {
    v3 = (const void *)MEMORY[0x1DF0D6888](v2, 0);
    v4 = (CGColor *)CGColorTransformConvertColor();
    CFRelease(v3);
  }
  CFRelease(v2);
  NumberOfComponents = CGColorGetNumberOfComponents(v4);
  Components = (float64x2_t *)CGColorGetComponents(v4);
  if (NumberOfComponents >= 4)
  {
    *(float *)&v7 = Components[1].f64[1];
    v8.i64[0] = 0;
    v8.i32[2] = 0;
    v8.i32[3] = v7;
LABEL_10:
    *(float32x2_t *)&v10 = vcvt_f32_f64(*Components);
    *((_QWORD *)&v10 + 1) = vextq_s8(v8, v8, 8uLL).u64[0];
    v11 = Components[1].f64[0];
LABEL_13:
    *((float *)&v10 + 2) = v11;
    goto LABEL_14;
  }
  if (NumberOfComponents == 2)
  {
    v9 = Components->f64[1];
    *((float *)&v10 + 3) = v9;
    goto LABEL_12;
  }
  if (NumberOfComponents >= 3)
  {
    v8 = (int8x16_t)xmmword_1DD26A170;
    goto LABEL_10;
  }
  v10 = xmmword_1DD26A170;
  if (NumberOfComponents)
  {
LABEL_12:
    v11 = Components->f64[0];
    *(float *)&v10 = v11;
    *((float *)&v10 + 1) = v11;
    goto LABEL_13;
  }
LABEL_14:
  v13 = v10;
  CGColorRelease(v4);
  return (__n128)v13;
}

double AVTGetColorComponents(void *a1, const char *a2)
{
  double result;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "avt_colorToColor4");
  return result;
}

__n128 AVTGetColorComponentsMetal(void *a1)
{
  id v1;
  float32x4_t v2;
  void *v3;
  float32x4_t v4;
  float v5;
  float v6;
  float v7;
  float32x4_t v8;
  float32x4_t v9;
  float v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;

  v1 = a1;
  v3 = v1;
  if (v1)
  {
    objc_msgSend(v1, "avt_colorToColor4");
    v4 = v2;
  }
  else
  {
    v4 = 0uLL;
  }
  v13 = v4;
  if (v4.f32[0] <= 0.04045)
  {
    v2.f32[0] = v4.f32[0] / 12.92;
  }
  else
  {
    v2.f32[0] = powf((float)(v4.f32[0] + 0.055) / 1.055, 2.4);
    v4 = v13;
  }
  v12 = v2;
  if (v4.f32[1] <= 0.04045)
  {
    v6 = v4.f32[1] / 12.92;
  }
  else
  {
    v5 = powf((float)(v4.f32[1] + 0.055) / 1.055, 2.4);
    v4 = v13;
    v6 = v5;
  }
  if (v4.f32[2] <= 0.04045)
  {
    v7 = v4.f32[2] / 12.92;
  }
  else
  {
    v11 = v6;
    v7 = powf((float)(v4.f32[2] + 0.055) / 1.055, 2.4);
    v6 = v11;
    v4 = v13;
  }
  v8 = v12;
  v8.f32[1] = v6;
  v8.f32[2] = v7;
  v9 = vmulq_laneq_f32(v8, v4, 3);
  v9.i32[3] = v4.i32[3];
  v14 = v9;

  return (__n128)v14;
}

float AVTGetNeutralZ()
{
  if (AVTGetNeutralZ_onceToken != -1)
    dispatch_once(&AVTGetNeutralZ_onceToken, &__block_literal_global_11);
  return *(float *)&AVTGetNeutralZ_avt_neutral_z;
}

void *PerfTimesCreate@<X0>(unsigned int a1@<W0>, uint64_t a2@<X8>)
{
  void *result;

  *(_DWORD *)a2 = 0;
  result = malloc_type_malloc(24 * a1, 0x1000040504FFAC1uLL);
  *(_QWORD *)(a2 + 8) = result;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = a1;
  *(_BYTE *)(a2 + 24) = a1 != 0;
  return result;
}

void PerfTimesFree(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  *(_DWORD *)(a1 + 20) = 0;
}

void PerfTimesPush(os_unfair_lock_t lock, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  uint32_t os_unfair_lock_opaque;
  uint32_t v7;

  if (lock && lock[5]._os_unfair_lock_opaque)
  {
    os_unfair_lock_lock(lock);
    v4 = *(_QWORD *)&lock[2]._os_unfair_lock_opaque + 24 * (int)lock[4]._os_unfair_lock_opaque;
    v5 = *a2;
    *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v4 = v5;
    os_unfair_lock_opaque = lock[4]._os_unfair_lock_opaque;
    if (os_unfair_lock_opaque == lock[5]._os_unfair_lock_opaque - 1)
    {
      v7 = 0;
      LOBYTE(lock[6]._os_unfair_lock_opaque) = 1;
    }
    else
    {
      v7 = os_unfair_lock_opaque + 1;
    }
    lock[4]._os_unfair_lock_opaque = v7;
    os_unfair_lock_unlock(lock);
  }
}

uint64_t PerfTimesNextIndex(uint64_t a1, int a2)
{
  if (*(_DWORD *)(a1 + 20) == a2)
    return 0;
  else
    return (a2 + 1);
}

void PerfTimesForEach(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  void (**v8)(id, uint64_t);

  v3 = a2;
  if (a1 && *(_DWORD *)(a1 + 20))
  {
    v8 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)a1);
    if (*(_BYTE *)(a1 + 24))
    {
      v4 = *(_DWORD *)(a1 + 16);
      if (*(_DWORD *)(a1 + 20) == v4)
        v5 = 0;
      else
        v5 = v4 + 1;
    }
    else
    {
      v5 = 0;
    }
    v6 = 20;
    if (!*(_BYTE *)(a1 + 24))
      v6 = 16;
    v7 = *(_DWORD *)(a1 + v6);
    if (v7 >= 1)
    {
      do
      {
        v8[2](v8, *(_QWORD *)(a1 + 8) + 24 * v5);
        if (*(_DWORD *)(a1 + 20) == v5)
          v5 = 0;
        else
          ++v5;
        --v7;
      }
      while (v7);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)a1);
    v3 = v8;
  }

}

double PerfTimesMinForKind(uint64_t a1, int a2)
{
  double v2;
  _QWORD v4[5];
  int v5;
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0x7FEFFFFFFFFFFFFFLL;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __PerfTimesMinForKind_block_invoke;
  v4[3] = &unk_1EA61EAD8;
  v5 = a2;
  v4[4] = &v6;
  PerfTimesForEach(a1, v4);
  v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v2;
}

void sub_1DD220F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double PerfTimesMaxForKind(uint64_t a1, int a2)
{
  double v2;
  _QWORD v4[5];
  int v5;
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0x10000000000000;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __PerfTimesMaxForKind_block_invoke;
  v4[3] = &unk_1EA61EAD8;
  v5 = a2;
  v4[4] = &v6;
  PerfTimesForEach(a1, v4);
  v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v2;
}

void sub_1DD22102C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double PerfTimesMin(uint64_t a1)
{
  double v1;
  _QWORD v3[5];
  uint64_t v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = (double *)&v4;
  v6 = 0x2020000000;
  v7 = 0x7FEFFFFFFFFFFFFFLL;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __PerfTimesMin_block_invoke;
  v3[3] = &unk_1EA61EB00;
  v3[4] = &v4;
  PerfTimesForEach(a1, v3);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DD2210FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double PerfTimesMax(uint64_t a1)
{
  double v1;
  _QWORD v3[5];
  uint64_t v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = (double *)&v4;
  v6 = 0x2020000000;
  v7 = 0x10000000000000;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __PerfTimesMax_block_invoke;
  v3[3] = &unk_1EA61EB00;
  v3[4] = &v4;
  PerfTimesForEach(a1, v3);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DD2211E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double PerfTimesAverageLatency(uint64_t a1)
{
  double v1;
  _QWORD v3[6];
  uint64_t v4;
  int *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = 0;
  v5 = (int *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __PerfTimesAverageLatency_block_invoke;
  v3[3] = &unk_1EA61EB28;
  v3[4] = &v8;
  v3[5] = &v4;
  PerfTimesForEach(a1, v3);
  v1 = v9[3] / (double)v5[6];
  _Block_object_dispose(&v4, 8);
  _Block_object_dispose(&v8, 8);
  return v1;
}

void sub_1DD2212EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

double PerfTimesAverageLatencyForKind(uint64_t a1, int a2)
{
  double v2;
  _QWORD v4[6];
  int v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = 0;
  v7 = (int *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __PerfTimesAverageLatencyForKind_block_invoke;
  v4[3] = &unk_1EA61EB50;
  v5 = a2;
  v4[4] = &v10;
  v4[5] = &v6;
  PerfTimesForEach(a1, v4);
  v2 = v11[3] / (double)v7[6];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return v2;
}

void sub_1DD221410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

__n128 AVTARKitTransformToSceneKitTransformMatrix(unint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if (a1 >= 2)
  {
    if (a1 == 2 && (unint64_t)(a2 - 2) < 3)
    {
      v6 = qword_1DD26A360[a2 - 2];
      goto LABEL_9;
    }
  }
  else
  {
    avt_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      AVTARKitTransformToSceneKitTransformMatrix_cold_1(a1, v5);

  }
  v6 = 0;
LABEL_9:
  v7 = v6 + 3;
  v8 = v6 + 2;
  if (a3 != 2)
    v8 = v6;
  if (a3 == 3)
    v9 = v6 + 1;
  else
    v9 = v8;
  if (a3 == 4)
    v9 = v7;
  if (v9 >= 4)
    v9 -= 4;
  return AVTARKitTransformToSceneKitTransformMatrix_rotationMatrices[4 * v9];
}

__n128 AVTSceneKitTextureCoordinatesForCaptureDeviceTexture(void *a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  id v7;
  void *v9;
  unint64_t v16;
  unint64_t v17;
  float v18;
  float v19;
  __int128 v20;
  __int128 v22;
  __int128 v23;

  v7 = a1;
  v9 = v7;
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
      *(_QWORD *)&_Q0 = 0;
      v22 = _Q0;
      __asm { FMOV            V0.2S, #1.0 }
      goto LABEL_5;
    case 2uLL:
      __asm { FMOV            V0.2S, #1.0 }
      v22 = _Q0;
      *(_QWORD *)&_Q0 = 0;
LABEL_5:
      v23 = _Q0;
      break;
    case 3uLL:
      *(_QWORD *)&_Q0 = 1065353216;
      v22 = _Q0;
      *(_QWORD *)&_Q0 = 0x3F80000000000000;
      v23 = _Q0;
      __asm { FMOV            V0.2S, #1.0 }
      break;
    case 4uLL:
      *(_QWORD *)&_Q0 = 0x3F80000000000000;
      v22 = _Q0;
      *(_QWORD *)&_Q0 = 1065353216;
      v23 = _Q0;
      __asm { FMOV            V0.2S, #1.0 }
      break;
    default:
      *(_QWORD *)&_Q0 = 0;
      v22 = _Q0;
      *(_QWORD *)&_Q0 = 0;
      v23 = _Q0;
      break;
  }
  v16 = objc_msgSend(v7, "width", v22);
  v17 = objc_msgSend(v9, "height");
  if (a4 <= 2)
  {
    v16 = objc_msgSend(v9, "height");
    v17 = objc_msgSend(v9, "width");
  }
  v18 = (float)a3 * (float)v16;
  v19 = (float)a2 * (float)v17;
  v20 = v23;
  if (v18 <= v19)
  {
    if (v18 < v19)
    {
      *(float *)&v20 = (float)((float)(*(float *)&v23 + -0.5) * (float)(v18 / v19)) + 0.5;
      v23 = v20;
    }
  }
  else
  {
    *((float *)&v20 + 1) = (float)((float)(*((float *)&v23 + 1) + -0.5) * (float)(v19 / v18)) + 0.5;
    v23 = v20;
  }

  return (__n128)v23;
}

id AVTRenderingCacheFolderURL()
{
  id *v0;
  void *v1;

  +[AVTResourceLocator sharedResourceLocator]();
  v0 = (id *)objc_claimAutoreleasedReturnValue();
  -[AVTResourceLocator rootCacheURL](v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void AVTSetARCompositingEnabled(void *a1, uint64_t a2)
{
  id v3;
  double v4;
  void *v5;
  id v6;

  v3 = a1;
  objc_msgSend(v3, "set_enableARMode:", a2);
  objc_msgSend(v3, "pointOfView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)a2)
    v4 = 0.82;
  else
    v4 = 0.0;
  objc_msgSend(v6, "camera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGrainIntensity:", v4);

}

void AVTApplyARGrainIfNeeded(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  float v17;
  float v18;
  float v19;
  void *v20;
  float v21;
  id v22;

  v22 = a1;
  v3 = a2;
  objc_msgSend(v22, "pointOfView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "camera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraGrainIntensity");
  if (v6 == 0.0)
  {
    objc_msgSend(v5, "setGrainIntensity:", 0.0);
  }
  else
  {
    objc_msgSend(v5, "setGrainIntensity:", 0.82);
    objc_msgSend(v22, "_backingSize");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v3, "camera");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageResolution");
    v13 = v12;
    v15 = v14;

    v16 = v13;
    v17 = v15;
    v18 = fmax(v8, v10);
    v19 = fmin(v8, v10);
    objc_msgSend(v5, "setGrainScale:", fmaxf(v18 / v16, v19 / v17));
    objc_msgSend(v5, "setGrainIsColored:", 1);
    objc_msgSend(v3, "cameraGrainTexture");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGrainTexture:", v20);

    objc_msgSend(v3, "cameraGrainIntensity");
    objc_msgSend(v5, "setGrainSlice:", v21);
  }

}

uint64_t AVTMTLDeviceSupportsNonUniformThreadgroupSize(void *a1, const char *a2)
{
  return objc_msgSend(a1, "supportsFeatureSet:", 11);
}

id AVTMTLTextureDescriptorCreateFromTexture(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  uint64_t v4;

  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x1E0CC6BB8];
    v2 = a1;
    v3 = objc_alloc_init(v1);
    objc_msgSend(v3, "setTextureType:", objc_msgSend(v2, "textureType"));
    objc_msgSend(v3, "setPixelFormat:", objc_msgSend(v2, "pixelFormat"));
    objc_msgSend(v3, "setWidth:", objc_msgSend(v2, "width"));
    objc_msgSend(v3, "setHeight:", objc_msgSend(v2, "height"));
    objc_msgSend(v3, "setDepth:", objc_msgSend(v2, "depth"));
    objc_msgSend(v3, "setMipmapLevelCount:", objc_msgSend(v2, "mipmapLevelCount"));
    objc_msgSend(v3, "setSampleCount:", objc_msgSend(v2, "sampleCount"));
    objc_msgSend(v3, "setArrayLength:", objc_msgSend(v2, "arrayLength"));
    objc_msgSend(v3, "setCpuCacheMode:", objc_msgSend(v2, "cpuCacheMode"));
    objc_msgSend(v3, "setStorageMode:", objc_msgSend(v2, "storageMode"));
    v4 = objc_msgSend(v2, "usage");

    objc_msgSend(v3, "setUsage:", v4);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id plistWithVector(__n128 a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  numberFromDouble(a1.n128_f32[0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  numberFromDouble(a1.n128_f32[1]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  numberFromDouble(a1.n128_f32[2]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isEqualToNumber:", v2, a1.n128_u64[0])
    && objc_msgSend(v1, "isEqualToNumber:", v3))
  {
    v4 = v1;
  }
  else
  {
    v8[0] = CFSTR("x");
    v8[1] = CFSTR("y");
    v9[0] = v1;
    v9[1] = v2;
    v8[2] = CFSTR("z");
    v9[2] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

id numberFromDouble(double a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB35A0], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, 3, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "numberWithDouble:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decimalNumberByRoundingAccordingToBehavior:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id AVTMergeSpecializationSettings(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = a2;
  v4 = a1;
  v5 = objc_opt_class();
  __AVTMergeSpecializationSettings(0, v4, v3, CFSTR("ARKit driven morpher"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  __AVTMergeSpecializationSettings(v6, v4, v3, CFSTR("ARKit driven material"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_opt_class();
  __AVTMergeSpecializationSettings(v8, v4, v3, CFSTR("ARKit disabled blendshapes"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  __AVTMergeSpecializationSettings(v10, v4, v3, CFSTR("dynamics"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_opt_class();
  __AVTMergeSpecializationSettings(v12, v4, v3, CFSTR("AR"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __AVTMergeSpecializationSettings(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;

  v9 = a1;
  v10 = a4;
  v11 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v13 = objc_claimAutoreleasedReturnValue();

  if (v12 | v13)
  {
    if (objc_opt_class() == a5)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = v16;
      if (v12)
        objc_msgSend(v16, "addEntriesFromDictionary:", v12);
      if (v13)
        objc_msgSend(v15, "addEntriesFromDictionary:", v13);
    }
    else
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = v14;
      if (v12)
        objc_msgSend(v14, "addObjectsFromArray:", v12);
      if (v13)
        objc_msgSend(v15, "addObjectsFromArray:", v13);
    }
    if (!v9)
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v10);

  }
  return v9;
}

void sub_1DD2264C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AVTColorApplyVariation(void *a1, void *a2, void *a3, double a4)
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  float32x4_t v12;
  const char *v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  const char *v17;
  float32x4_t v18;
  void *v19;
  float32x4_t v21;

  v6 = a1;
  v7 = a2;
  v8 = a3;
  v10 = v8;
  if (*(float *)&a4 == 0.0)
    goto LABEL_2;
  if (*(float *)&a4 <= 0.0)
  {
    if (v7)
    {
      *(double *)v16.i64 = AVTGetColorComponents(v6, v9);
      v21 = v16;
      *(double *)v18.i64 = AVTGetColorComponents(v7, v17);
      v15 = vmlsq_lane_f32(v21, vsubq_f32(v18, v21), *(float32x2_t *)&a4, 0);
      goto LABEL_8;
    }
  }
  else if (v8)
  {
    *(double *)v12.i64 = AVTGetColorComponents(v6, v9);
    v21 = v12;
    *(double *)v14.i64 = AVTGetColorComponents(v10, v13);
    v15 = vmlaq_n_f32(v21, vsubq_f32(v14, v21), *(float *)&a4);
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v15.f32[0], v15.f32[1], v15.f32[2], v15.f32[3], *(_OWORD *)&v21);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_2:
  v11 = v6;
LABEL_9:
  v19 = v11;

  return v19;
}

void *_scanColor(void *result, float *a2, float *a3, float *a4, float *a5)
{
  float v9;
  float v10;
  float v11;
  uint64_t v12;
  int v13;
  int v14;

  if (result)
  {
    v14 = 0;
    v13 = 0;
    v12 = 0;
    result = (void *)sscanf((const char *)objc_msgSend(objc_retainAutorelease(result), "UTF8String"), "%d %d %d %d", &v14, &v13, (char *)&v12 + 4, &v12);
    v9 = (float)v13 / 255.0;
    v10 = 1.0;
    v11 = (float)SHIDWORD(v12) / 255.0;
    if ((_DWORD)result != 3)
    {
      if ((_DWORD)result == 1)
      {
        v9 = (float)v14 / 255.0;
        v11 = v9;
      }
      else
      {
        v10 = (float)(int)v12 / 255.0;
      }
    }
    *a2 = (float)v14 / 255.0;
    *a3 = v9;
    *a4 = v11;
    *a5 = v10;
  }
  return result;
}

__n128 AVTAvatarPoseRepresentationGetTransform(void *a1)
{
  id v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  float32x4_t v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  float v24;
  void *v25;
  float v26;
  void *v27;
  float32x4_t v28;
  __int32 v29;
  id v30;
  void *v31;
  float v32;
  void *v33;
  void *v34;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  float32x4_t v50;
  void *v51;
  float32x4_t v52;
  void *v53;
  float v54;
  float32x4_t v55;
  unsigned int v56;
  unsigned int v57;
  float v58;
  unsigned int v59;
  float32x4_t v60;
  float v61;

  v1 = a1;
  if (objc_msgSend(v1, "count") == 16)
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "floatValue");
    v59 = v2;
    objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "floatValue");
    v57 = v3;
    objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "floatValue");
    v56 = v4;
    objc_msgSend(v1, "objectAtIndexedSubscript:", 3);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "floatValue");
    v5.i64[0] = __PAIR64__(v57, v59);
    v5.i64[1] = __PAIR64__(v6, v56);
    v60 = v5;
    objc_msgSend(v1, "objectAtIndexedSubscript:", 4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 5);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 6);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 9);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 10);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 11);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 13);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 14);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 15);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");

  }
  else
  {
    v16 = v1;
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "floatValue");
    v20 = v16;
    objc_msgSend(v20, "objectAtIndexedSubscript:", 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    v55.i64[0] = v22;
    objc_msgSend(v20, "objectAtIndexedSubscript:", 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "floatValue");
    v61 = v24;
    objc_msgSend(v20, "objectAtIndexedSubscript:", 5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "floatValue");
    v58 = v26;
    objc_msgSend(v20, "objectAtIndexedSubscript:", 6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "floatValue");
    v28 = v55;
    v28.f32[1] = v61;
    v28.f32[2] = v58;
    v52 = v28;
    v28.i32[3] = v29;
    v50 = v28;

    v30 = v20;
    if (objc_msgSend(v30, "count") == 10)
    {
      objc_msgSend(v30, "objectAtIndexedSubscript:", 7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "floatValue");
      v54 = v32;
      objc_msgSend(v30, "objectAtIndexedSubscript:", 8);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "floatValue");
      objc_msgSend(v30, "objectAtIndexedSubscript:", 9);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "floatValue");

    }
    else
    {
      __asm { FMOV            V0.4S, #1.0 }
      v54 = *(float *)&_Q0;
    }

    v40 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
    v41 = vmulq_f32(v50, v50);
    v42 = vaddq_f32(v41, v41);
    v43 = vmulq_laneq_f32(v52, v50, 3);
    v40.f32[0] = (float)(1.0 - v42.f32[1]) - v42.f32[2];
    v40.f32[1] = (float)((float)(v55.f32[0] * v61) + v43.f32[2]) + (float)((float)(v55.f32[0] * v61) + v43.f32[2]);
    v40.f32[2] = (float)((float)(v55.f32[0] * v58) - v43.f32[1]) + (float)((float)(v55.f32[0] * v58) - v43.f32[1]);
    v60 = vmulq_n_f32(v40, v54);
  }

  return (__n128)v60;
}

void _simd_slerp_internal(float32x4_t a1, float32x4_t a2, float a3)
{
  float v5;
  float32x4_t v6;
  int8x16_t v7;
  float32x4_t v8;
  int8x16_t v9;
  float v10;
  float v11;
  float v12;

  v5 = 1.0 - a3;
  v6 = vsubq_f32(a1, a2);
  v7 = (int8x16_t)vmulq_f32(v6, v6);
  v8 = vaddq_f32(a1, a2);
  v9 = (int8x16_t)vmulq_f32(v8, v8);
  v10 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)))));
  v11 = v10 + v10;
  if ((float)(v10 + v10) != 0.0)
    sinf(v11);
  if ((float)(v5 * v11) != 0.0)
    sinf(v5 * v11);
  v12 = v11 * a3;
  if (v12 != 0.0)
    sinf(v12);
}

__CFString *AVTPrereleaseStickerPackForStickerPack(void *a1)
{
  __CFString *v1;
  const __CFString *v2;
  __CFString *v3;
  int v4;
  __CFString *v5;
  __CFString *v6;

  v1 = a1;
  v2 = CFSTR("stickers");
  if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("stickers")))
  {
    v3 = CFSTR("stickersPrerelease");
  }
  else
  {
    v2 = CFSTR("posesPack");
    if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("posesPack")))
    {
      v3 = CFSTR("posesPackPrerelease");
    }
    else
    {
      v2 = CFSTR("memojiEditorCarousel");
      if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("memojiEditorCarousel")))
      {
        v3 = CFSTR("memojiEditorCarouselPrerelease");
      }
      else
      {
        v2 = CFSTR("memojiEditorCarousel_poses");
        v4 = -[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("memojiEditorCarousel_poses"));
        v5 = v1;
        if (!v4)
          goto LABEL_12;
        v3 = CFSTR("memojiEditorCarousel_posesPrerelease");
      }
    }
  }
  if (AVTPrecompiledStickerPackIsEmpty(v3))
    v5 = (__CFString *)v2;
  else
    v5 = v3;
LABEL_12:
  v6 = v5;

  return v6;
}

BOOL AVTPrecompiledStickerPackIsEmpty(void *a1)
{
  void *v1;
  _BOOL8 v2;

  AVTPrecompiledStickerPackPlist(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") == 0;

  return v2;
}

id AVTPrecompiledStickerPackPlistForPuppetNamed(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  AVTPrecompiledStickerPackPlist(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("animoji"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id AVTPrecompiledStickerPackPlist(void *a1)
{
  id v1;
  void *v2;
  id v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("stickers")))
  {
    if (AVTPrecompiledStickerPackPlist_onceToken != -1)
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken, &__block_literal_global_15);
    v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_stickers;
LABEL_41:
    v3 = v2;
    goto LABEL_42;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("stickersPrerelease")))
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_1274 != -1)
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_1274, &__block_literal_global_1275);
    v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_stickersPrerelease;
    goto LABEL_41;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("posesPack")))
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_1276 != -1)
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_1276, &__block_literal_global_1277);
    v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_posesPack;
    goto LABEL_41;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("posesPackPrerelease")))
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_1519 != -1)
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_1519, &__block_literal_global_1520);
    v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_posesPackPrerelease;
    goto LABEL_41;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("memojiEditorCarousel")))
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_1521 != -1)
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_1521, &__block_literal_global_1522);
    v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorCarousel;
    goto LABEL_41;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("memojiEditorCarouselPrerelease")))
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_1532 != -1)
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_1532, &__block_literal_global_1533);
    v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorCarouselPrerelease;
    goto LABEL_41;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("memojiEditorCarousel_poses")))
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_1534 != -1)
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_1534, &__block_literal_global_1535);
    v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorCarousel_poses;
    goto LABEL_41;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("memojiEditorCarousel_posesPrerelease")))
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_1545 != -1)
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_1545, &__block_literal_global_1546);
    v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorCarousel_posesPrerelease;
    goto LABEL_41;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("memojiEditorThumbnails")))
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_1547 != -1)
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_1547, &__block_literal_global_1548);
    v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorThumbnails;
    goto LABEL_41;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("allStickers")))
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_1562 != -1)
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_1562, &__block_literal_global_1563);
    v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_allStickers;
    goto LABEL_41;
  }
  avt_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    AVTPrecompiledStickerPackPlist_cold_1((uint64_t)v1, v5, v6, v7, v8, v9, v10, v11);

  v3 = 0;
LABEL_42:

  return v3;
}

void sub_1DD23034C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD2306C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t AVTAvatarKitVersionNumber()
{
  return 346;
}

uint64_t AVTAvatarKitSnapshotVersionNumber()
{
  if (AVTAvatarKitSnapshotVersionNumber_onceToken != -1)
    dispatch_once(&AVTAvatarKitSnapshotVersionNumber_onceToken, &__block_literal_global_16);
  return AVTAvatarKitSnapshotVersionNumber_kAVTAvatarKitSnapshotVersionNumber;
}

id AVTAvatarKitSnapshotVersionString()
{
  if (AVTAvatarKitSnapshotVersionString_onceToken != -1)
    dispatch_once(&AVTAvatarKitSnapshotVersionString_onceToken, &__block_literal_global_25_0);
  return (id)AVTAvatarKitSnapshotVersionString_kAVTAvatarKitSnapshotVersionString;
}

uint64_t AVTAvatarKitSnapshotVersionNumberFromString(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if ((unint64_t)objc_msgSend(v1, "count") < 2)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

  }
  if ((unint64_t)objc_msgSend(v1, "count") < 3)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

  }
  return v7 + 1000 * (v5 + 1000 * v3);
}

id AVTSceneKitSnapshotVersionString()
{
  if (AVTSceneKitSnapshotVersionString_onceToken != -1)
    dispatch_once(&AVTSceneKitSnapshotVersionString_onceToken, &__block_literal_global_26);
  return (id)AVTSceneKitSnapshotVersionString_kAVTSceneKitSnapshotVersionString;
}

BOOL AVTNodeMatchesHierarchyEnumerationOptions(void *a1, char a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  v3 = a1;
  v4 = v3;
  if ((a2 & 1) != 0
    && (objc_msgSend(v3, "morpher"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    v6 = 0;
  }
  else if ((a2 & 2) != 0)
  {
    objc_msgSend(v4, "geometry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

void AVTInitializeShaderCache()
{
  if (AVTInitializeShaderCache_onceToken != -1)
    dispatch_once(&AVTInitializeShaderCache_onceToken, &__block_literal_global_65);
}

void sub_1DD231828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD232D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

float AVTMorphWeightApplyBlinkCorrection(void *a1, float a2)
{
  id v3;
  float v4;
  float v5;

  v3 = a1;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C89380]) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C89388]))
  {
    v4 = a2 * 1.1;
    if (a2 < 0.0)
      v4 = 0.0;
    v5 = pow(fminf(v4, 1.0), 0.666666667);
    a2 = fminf(v5, 1.0);
  }

  return a2;
}

float AVTMorphWeightApplyCorrectionForTongue(void *a1, float a2, float a3)
{
  id v5;
  void *v6;

  v5 = a1;
  v6 = v5;
  if (a3 != -1.0
    && ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C89438]) & 1) != 0
     || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C89468]) & 1) != 0
     || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C89478]) & 1) != 0
     || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C89458]) & 1) != 0
     || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C89460]) & 1) != 0
     || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C89488]) & 1) != 0
     || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C89410])))
  {
    a2 = (1.0 - a3) * a2;
  }

  return a2;
}

void sub_1DD234AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD2376B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  uint64_t v13;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 144));
  _Unwind_Resume(a1);
}

void sub_1DD238298(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double AVTDebugViewValueForIndex(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1 + 24;
  v3 = a1 + 16;
  v4 = a1 + 8;
  if (a2 != 1)
    v4 = a1;
  if (a2 != 2)
    v3 = v4;
  if (a2 != 3)
    v2 = v3;
  return *(double *)v2;
}

void sub_1DD23A698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD23B5F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD23B88C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD23BA64(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1DD23BCE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD23CA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD23CEC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id avt_default_log()
{
  if (avt_default_log_once != -1)
    dispatch_once(&avt_default_log_once, &__block_literal_global_17);
  return (id)avt_default_log_logger;
}

void __avt_default_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.avatarkit", "AvatarKit");
  v1 = (void *)avt_default_log_logger;
  avt_default_log_logger = (uint64_t)v0;

}

BOOL AVTLogAllowsInternalCrash()
{
  void *v0;
  void *v1;
  int v2;

  if (!os_variant_has_internal_diagnostics())
    return 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.loginwindow")))
  {

    return 0;
  }
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SecurityAgent"));

  return !v2;
}

id AVTEditorMetadata()
{
  if (AVTEditorMetadata_onceToken != -1)
    dispatch_once(&AVTEditorMetadata_onceToken, &__block_literal_global_18);
  return (id)AVTEditorMetadata_kAVTEditorMetadata;
}

id AVTPrereleaseEditorMetadata()
{
  if (AVTPrereleaseEditorMetadata_onceToken != -1)
    dispatch_once(&AVTPrereleaseEditorMetadata_onceToken, &__block_literal_global_14);
  return (id)AVTPrereleaseEditorMetadata_kAVTPrereleaseEditorMetadata;
}

id AVTMakePresetLocalizableKey(unint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (!AVTPresetCategoryIsPairable(a1))
  {
    AVTPresetCategoryToString(a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  AVTPresetCategoryPairToString(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("none")))
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v4, v3);
    goto LABEL_7;
  }
  if (AVTPresetCategoryIsOnLeftInPair(a1))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_LEFT"), v4, v3);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_RIGHT"), v4, v3);
LABEL_7:
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id AVTMakePresetPairLocalizableKey(unint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  AVTPresetCategoryPairToString(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id AVTMakeColorPresetLocalizableKey(unint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  AVTPresetCategoryToColorCategoryString(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id AVTLocalizedEditorString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_1EA6284D0, CFSTR("memoji_editor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id AVTLocalizedPresetString(unint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a2;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AVTMakePresetLocalizableKey(a1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_1EA6284D0, CFSTR("memoji_presets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
    v8 = v7;
  else
    v8 = v4;
  v9 = v8;

  return v9;
}

id AVTLocalizedPresetPairString(unint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a2;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AVTMakePresetPairLocalizableKey(a1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_1EA6284D0, CFSTR("memoji_presets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
    v8 = v7;
  else
    v8 = v4;
  v9 = v8;

  return v9;
}

id AVTLocalizedPaletteString(unint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a2;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AVTMakeColorPresetLocalizableKey(a1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_1EA6284D0, CFSTR("memoji_palettes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
    v8 = v7;
  else
    v8 = v4;
  v9 = v8;

  return v9;
}

id AVTLocalizedStickerName(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_1EA6284D0, CFSTR("stickers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = v2;
  v6 = v5;

  return v6;
}

void sub_1DD241A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD2422E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AVTUpgradesForPresetCategory(unint64_t a1, unsigned int a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  AVTPrecompiledMemojiPresetPlist();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("upgrade"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preset-categories"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    AVTPresetCategoryToString(a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__5;
    v28 = __Block_byref_object_dispose__5;
    v29 = 0;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v15;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("upgrade-if-version-less-than"), v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (!v11 || objc_msgSend(v11, "unsignedIntegerValue") > (unint64_t)a2)
          {
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __AVTUpgradesForPresetCategory_block_invoke;
            v17[3] = &unk_1EA61F840;
            v18 = v5;
            v19 = &v24;
            objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v17);

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      }
      while (v7);
    }

    v13 = (id)v25[5];
    _Block_object_dispose(&v24, 8);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void sub_1DD243B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *AVTPresetCategoryToString(unint64_t a1)
{
  if (a1 > 0x27)
    return 0;
  else
    return off_1EA61F9D8[a1];
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

id AVTUpgradePresetIdentifierIfNeeded(unint64_t a1, void *a2, unsigned int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  AVTPrecompiledMemojiPresetPlist();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("upgrade"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("preset-identifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _AVTRemapIdentifier(a1, v5, a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id _AVTRemapIdentifier(unint64_t a1, void *a2, unsigned int a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v23;
  id obj;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (v8)
  {
    AVTPresetCategoryToString(a1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = v8;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      v12 = a3;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("upgrade-if-version-less-than"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (!v15 || objc_msgSend(v15, "unsignedIntegerValue") > v12)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", v25);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", v7);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v18)
            {
              v20 = v18;

              v7 = v20;
            }

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v10);
    }

    v21 = v7;
    v8 = v23;
  }
  else
  {
    v21 = v7;
  }

  return v21;
}

id AVTPresetCategoriesPairs()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("earrings_left");
  v5[1] = CFSTR("earrings_right");
  v6[0] = CFSTR("earrings");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("audio");
  v7[0] = v0;
  v4[0] = CFSTR("audio_left");
  v4[1] = CFSTR("audio_right");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id AVTUpgradePairedPresetCategoriesIfNeeded(void *a1)
{
  id v1;
  void *v2;
  uint64_t i;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  AVTPresetCategoriesPairs();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  v2 = 0;
  if (v17)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v1, "objectForKeyedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {
          if (!v2)
            v2 = (void *)objc_msgSend(v1, "mutableCopy");
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          objc_msgSend(obj, "objectForKeyedSubscript:", v4);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v8; ++j)
              {
                if (*(_QWORD *)v20 != v9)
                  objc_enumerationMutation(v6);
                v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
                objc_msgSend(v1, "objectForKeyedSubscript:", v4);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, v11);

              }
              v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v8);
          }

        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v17);
  }
  if (v2)
    v13 = v2;
  else
    v13 = v1;
  v14 = v13;

  return v14;
}

id AVTUpgradeColorPresetIdentifierIfNeeded(unint64_t a1, void *a2, unsigned int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  AVTColorPalettes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("upgrade"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("color-preset-identifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _AVTRemapIdentifier(a1, v5, a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id AVTIdentifierOfUpgradedColorPresetForAssetPresetIdentifier(unint64_t a1, void *a2, unint64_t a3, _DWORD *a4, unsigned int a5)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  id v29;
  NSObject *v30;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  __CFString *v37;
  __CFString *v39;
  id obj;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v42 = a2;
  AVTPrecompiledMemojiPresetPlist();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("upgrade"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("preset-colors"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    AVTPresetCategoryToString(a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 >= 3)
    {
      avt_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        AVTIdentifierOfUpgradedColorPresetForAssetPresetIdentifier_cold_1(v30);

      v29 = 0;
    }
    else
    {
      v32 = v10;
      v33 = v8;
      v37 = off_1EA61FB18[a3];
      v39 = off_1EA61FB30[a3];
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = v10;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v12)
      {
        v13 = v12;
        v41 = 0;
        v14 = *(_QWORD *)v44;
        v15 = a5;
        v35 = *(_QWORD *)v44;
        v36 = a5;
        v34 = v11;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v44 != v14)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("upgrade-if-version-less-than"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (!v18 || objc_msgSend(v18, "unsignedIntegerValue") > v15)
            {
              objc_msgSend(v17, "objectForKeyedSubscript:", v11);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKeyedSubscript:", v42);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v21;
              if (v21)
              {
                v23 = v13;
                objc_msgSend(v21, "objectForKeyedSubscript:", v39);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = v24;
                if (v24)
                {
                  v26 = v24;

                  objc_msgSend(v22, "objectForKeyedSubscript:", v37);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "floatValue");
                  *a4 = v28;

                  v41 = v26;
                  v11 = v34;
                  v14 = v35;
                  v15 = v36;
                }

                v13 = v23;
              }

            }
          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        }
        while (v13);
      }
      else
      {
        v41 = 0;
      }

      v29 = v41;
      v10 = v32;
      v8 = v33;
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

uint64_t AVTPresetCategoryIsPrerelease()
{
  return 0;
}

uint64_t AVTPresetCategoryIsPairable(unint64_t a1)
{
  return (a1 < 0x20) & (0xC6000000 >> a1);
}

BOOL AVTPresetCategoryIsOnLeftInPair(uint64_t a1)
{
  return a1 == 30 || a1 == 25;
}

BOOL AVTPresetCategoryIsOnRightInPair(uint64_t a1)
{
  return a1 == 31 || a1 == 26;
}

__CFString *AVTPresetCategoryPairToString(unint64_t a1)
{
  unint64_t v1;
  __CFString *v2;

  v1 = a1 - 25;
  if (a1 - 25 < 7 && ((0x63u >> v1) & 1) != 0)
  {
    v2 = off_1EA61FB48[v1];
  }
  else
  {
    AVTPresetCategoryToString(a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *AVTPresetCategoryToColorCategoryString(unint64_t a1)
{
  __CFString *v1;

  if (a1 - 25 < 2)
    return CFSTR("audio");
  if (a1 - 30 >= 2)
  {
    if (!a1)
      return CFSTR("skin");
    AVTPresetCategoryToString(a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = CFSTR("earrings");
  }
  return v1;
}

uint64_t AVTColorCategoryFromString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  if (AVTColorCategoryFromString_onceToken != -1)
    dispatch_once(&AVTColorCategoryFromString_onceToken, &__block_literal_global_20);
  objc_msgSend((id)AVTColorCategoryFromString_nameToCategory, "objectForKeyedSubscript:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)AVTColorCategoryFromString_nameToCategory, "objectForKeyedSubscript:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (int)objc_msgSend(v3, "intValue");

  }
  else
  {
    v4 = 40;
  }

  return v4;
}

uint64_t AVTPresetCategoryFromString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  if (AVTPresetCategoryFromString_onceToken != -1)
    dispatch_once(&AVTPresetCategoryFromString_onceToken, &__block_literal_global_130);
  objc_msgSend((id)AVTPresetCategoryFromString_nameToCategory, "objectForKeyedSubscript:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)AVTPresetCategoryFromString_nameToCategory, "objectForKeyedSubscript:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

  }
  else
  {
    v4 = 40;
  }

  return v4;
}

uint64_t AVTPresetCategoryToComponentType(unint64_t a1)
{
  if (a1 >= 0x29)
    AVTPresetCategoryToComponentType_cold_1();
  return qword_1DD26A518[a1];
}

uint64_t AVTAvatarBodyPartForComponentType(uint64_t a1)
{
  if ((unint64_t)(a1 - 34) > 7)
    return 1;
  else
    return qword_1DD26A660[a1 - 34];
}

uint64_t AVTEnumeratePresetCategories(uint64_t result)
{
  uint64_t v1;
  uint64_t i;

  if (result)
  {
    v1 = result;
    for (i = 0; i != 40; ++i)
      result = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, i);
  }
  return result;
}

void AVTEvaluateNameMatchingRules(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  char v19;
  char v20;
  char v21;
  char v22;

  v14 = a3;
  if (a1)
  {
    v5 = a2;
    v6 = a1;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exclude"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = objc_opt_isKindOfClass() & 1;
    objc_opt_class();
    v9 = objc_opt_isKindOfClass() & 1;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("include"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    LOBYTE(v6) = objc_opt_isKindOfClass() & 1;
    objc_opt_class();
    v11 = objc_opt_isKindOfClass() & 1;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __AVTEvaluateNameMatchingRules_block_invoke;
    v15[3] = &unk_1EA61F8A8;
    v19 = v8;
    v20 = v9;
    v21 = (char)v6;
    v16 = v7;
    v17 = v10;
    v18 = v14;
    v22 = v11;
    v12 = v10;
    v13 = v7;
    objc_msgSend(v5, "enumerateHierarchyUsingBlock:", v15);

  }
}

void sub_1DD24717C(_Unwind_Exception *a1)
{
  uint64_t v1;

  __destructor_8_s72_s80(v1);
  _Unwind_Resume(a1);
}

void __destructor_8_s72_s80(uint64_t a1)
{

}

void sub_1DD2473B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  __destructor_8_s72_s80(v1);
  _Unwind_Resume(a1);
}

id AVTSetInitialValuesExportedAsAnimations(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  void (**v8)(id, void *);
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v36 = a1;
  v7 = a2;
  v8 = a4;
  if ((a3 & 1) != 0)
  {
    v12 = 0;
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      AVTSetInitialValuesExportedAsAnimations_cold_1();
    v13 = v7;
    objc_msgSend(v13, "animations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v17)
    {
      v18 = v17;
      v34 = v13;
      v35 = v7;
      v19 = 0;
      v20 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v38 != v20)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          AVTSetInitialValuesExportedAsAnimations(v36, v22, a3, v8);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            objc_msgSend(v15, "addObject:", v23);
          v19 |= v23 != v22;

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v18);

      v13 = v34;
      v7 = v35;
      if ((v19 & 1) != 0)
      {
        if (objc_msgSend(v15, "count"))
        {
          v12 = (id)objc_msgSend(v34, "copy");
          objc_msgSend(v12, "setAnimations:", v15);
        }
        else
        {
          v12 = 0;
        }
        goto LABEL_27;
      }
    }
    else
    {

    }
    v12 = v13;
LABEL_27:

    goto LABEL_28;
  }
  v9 = v7;
  objc_msgSend(v9, "keyTimes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if ((a3 & 2) != 0 || v11 == 1)
  {
    objc_msgSend(v9, "values");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "keyPath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setValue:forKeyPath:", v25, v26);

    objc_msgSend(v9, "keyTimes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (v8 && v28 >= 2)
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v36, "name");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "keyTimes");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("Removed animation with more than one keyframe from \"%@\" (%d keyframes)"), v30, objc_msgSend(v31, "count"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v32);

    }
    v12 = 0;
  }
  else
  {
    v12 = v9;
  }

LABEL_28:
  return v12;
}

id AVTCloneNodesAndMaterials(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v1 = (objc_class *)MEMORY[0x1E0CB3748];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
  _AVTNodeDeepCopyWithCache(v2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___AVTNodeDeepCopy_block_invoke;
  v7[3] = &unk_1EA61D7A8;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v2, "enumerateHierarchyUsingBlock:", v7);

  return v4;
}

void _AVTSplitShaderModifier(void *a1, void *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  void (**v9)(id, id);
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  v26 = a1;
  v9 = a2;
  v10 = objc_msgSend(v26, "rangeOfString:", CFSTR("#pragma arguments\n"));
  v11 = objc_msgSend(v26, "rangeOfString:", CFSTR("#pragma declaration\n"));
  v12 = objc_msgSend(v26, "rangeOfString:", CFSTR("#pragma body\n"));
  v14 = v13;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v10 == 0x7FFFFFFFFFFFFFFFLL || (v15 = v10 - v11, v10 <= v11))
    {
      v16 = v26;
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        _AVTSplitShaderModifier_cold_4();
      v15 = v12 - v11;
    }
    else
    {
      v16 = v26;
    }
    objc_msgSend(v16, "substringWithRange:", v11, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (objc_msgSend(v26, "containsString:", CFSTR("#pragma declaration\n")))
    _AVTSplitShaderModifier_cold_5();
  if (v10 && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v26, "substringToIndex:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v17 = v19;
    goto LABEL_16;
  }
  v17 = 0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v12)
  {
    objc_msgSend(v26, "substringToIndex:", v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v26;
    goto LABEL_26;
  }
LABEL_16:
  *a3 = v17;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = v26;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL && v11 > v10)
    {
      objc_msgSend(v26, "substringWithRange:", v10, v11 - v10);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
LABEL_26:
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      _AVTSplitShaderModifier_cold_3();
    objc_msgSend(v18, "substringWithRange:", v10, v12 - v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (objc_msgSend(v26, "containsString:", CFSTR("#pragma arguments")))
    _AVTSplitShaderModifier_cold_1();
  v20 = 0;
LABEL_22:
  *a4 = v20;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v26, "containsString:", CFSTR("#pragma body")))
      _AVTSplitShaderModifier_cold_2();
    if (!v9)
    {
      v25 = objc_retainAutorelease(v26);
      goto LABEL_33;
    }
    v9[2](v9, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
    v25 = v21;
LABEL_33:
    *a5 = v25;
    goto LABEL_34;
  }
LABEL_28:
  if (!v9)
  {
    objc_msgSend(v26, "substringWithRange:", v12, objc_msgSend(v26, "length") - v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  objc_msgSend(v26, "substringWithRange:", v12, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "substringWithRange:", v12 + v14, objc_msgSend(v26, "length") - (v12 + v14));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "stringByAppendingString:", v24);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_34:
}

id AVTMergeShaderModifiers(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t i;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t j;
  id v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v20 = a1;
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v21[0] = (id)*MEMORY[0x1E0CD5BB8];
  v21[1] = (id)*MEMORY[0x1E0CD5BC8];
  v21[2] = (id)*MEMORY[0x1E0CD5BC0];
  v21[3] = (id)*MEMORY[0x1E0CD5BB0];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
  for (i = 0; i != 4; ++i)
  {
    v12 = (id)v21[i];
    objc_msgSend(v20, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AVTMergeShaderModifiersForEntryPoint(v13, v7, v14, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v12);

  }
  if (objc_msgSend(v10, "count"))
    v16 = v10;
  else
    v16 = 0;
  v17 = v16;

  for (j = 3; j != -1; --j)
  return v17;
}

id AVTMergeShaderModifiersForEntryPoint(void *a1, void *a2, void *a3, void *a4)
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (!(v7 | v10))
  {
    v11 = (id)v9;
LABEL_5:
    v12 = v11;
    goto LABEL_10;
  }
  if (!(v8 | v9))
  {
    v11 = (id)v7;
    goto LABEL_5;
  }
  v25 = 0;
  v26 = 0;
  v24 = 0;
  _AVTSplitShaderModifier((void *)v7, (void *)v8, &v26, &v25, &v24);
  v13 = v26;
  v14 = v25;
  v15 = v24;
  v20 = v13;
  if (v10)
  {
    v22 = 0;
    v23 = 0;
    v21 = 0;
    _AVTSplitShaderModifier((void *)v9, (void *)v10, &v23, &v22, &v21);
    v16 = v23;
    v17 = v22;
    v18 = v21;
    AVTMergeShaderModifiersForEntryPointWithPartsAndParts(v13, v14, v15, v16, v17, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AVTMergeShaderModifiersForEntryPointWithPartsAndCode(v13, v14, v15, (void *)v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v12;
}

id AVTMergeShaderModifiersForEntryPointWithPartsAndParts(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  __CFString *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  __CFString *v37;
  __CFString *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v43;
  void *v44;

  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (v14)
    v17 = v14;
  else
    v17 = &stru_1EA6284D0;
  v18 = v17;
  if (objc_msgSend(v11, "length"))
  {
    v19 = -[__CFString rangeOfString:](v18, "rangeOfString:", CFSTR("#pragma declaration\n"));
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (-[__CFString containsString:](v18, "containsString:", CFSTR("#pragma declaration")))
        AVTMergeShaderModifiersForEntryPointWithPartsAndParts_cold_3();
      v21 = (__CFString *)v11;
    }
    else
    {
      -[__CFString stringByReplacingCharactersInRange:withString:](v18, "stringByReplacingCharactersInRange:withString:", v19, v20, v11);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v22 = v21;

    v18 = v22;
  }
  if (v15)
    v23 = v15;
  else
    v23 = &stru_1EA6284D0;
  v24 = v23;
  v44 = v12;
  if (objc_msgSend(v12, "length"))
  {
    v25 = -[__CFString rangeOfString:](v24, "rangeOfString:", CFSTR("#pragma arguments\n"));
    if (v25 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (-[__CFString containsString:](v24, "containsString:", CFSTR("#pragma arguments")))
        AVTMergeShaderModifiersForEntryPointWithPartsAndParts_cold_2();
      v27 = (__CFString *)v12;
    }
    else
    {
      -[__CFString stringByReplacingCharactersInRange:withString:](v24, "stringByReplacingCharactersInRange:withString:", v25, v26, v12);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v28 = v27;

    v24 = v28;
  }
  if (v16)
    v29 = v16;
  else
    v29 = &stru_1EA6284D0;
  v30 = v29;
  if (objc_msgSend(v13, "length"))
  {
    v31 = -[__CFString rangeOfString:](v30, "rangeOfString:", CFSTR("#pragma body\n"));
    if (v31 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (-[__CFString containsString:](v30, "containsString:", CFSTR("#pragma body")))
        AVTMergeShaderModifiersForEntryPointWithPartsAndParts_cold_1();
      v33 = v14;
      v34 = v11;
      v35 = -[__CFString rangeOfString:](v30, "rangeOfString:", CFSTR("#pragma transparent\n"));
      if (v35 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v39 = v35;
        v43 = v36;
        v38 = (__CFString *)-[__CFString mutableCopy](v30, "mutableCopy");
        -[__CFString insertString:atIndex:](v38, "insertString:atIndex:", v13, v39 + v43);
        goto LABEL_30;
      }
      v37 = (__CFString *)v13;
    }
    else
    {
      v33 = v14;
      v34 = v11;
      -[__CFString stringByReplacingCharactersInRange:withString:](v30, "stringByReplacingCharactersInRange:withString:", v31, v32, v13);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v38 = v37;
LABEL_30:

    v30 = v38;
    v11 = v34;
    v14 = v33;
  }
  -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", v24);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringByAppendingString:", v30);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

__CFString *AVTMergeShaderModifiersForEntryPointWithPartsAndCode(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  uint64_t v27;
  uint64_t v28;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "length"))
  {
    v11 = &stru_1EA6284D0;
    if (v10)
      v11 = v10;
    v12 = v11;
    if (objc_msgSend(v7, "length"))
    {
      v13 = -[__CFString rangeOfString:](v12, "rangeOfString:", CFSTR("#pragma declaration\n"));
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (-[__CFString containsString:](v12, "containsString:", CFSTR("#pragma declaration")))
          AVTMergeShaderModifiersForEntryPointWithPartsAndCode_cold_3();
        objc_msgSend(v7, "stringByAppendingString:", v12);
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[__CFString stringByReplacingCharactersInRange:withString:](v12, "stringByReplacingCharactersInRange:withString:", v13, v14, v7);
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v16 = (__CFString *)v15;

      v12 = v16;
    }
    if (objc_msgSend(v8, "length"))
    {
      v17 = -[__CFString rangeOfString:](v12, "rangeOfString:", CFSTR("#pragma arguments\n"));
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (-[__CFString containsString:](v12, "containsString:", CFSTR("#pragma arguments")))
          AVTMergeShaderModifiersForEntryPointWithPartsAndCode_cold_2();
        objc_msgSend(v8, "stringByAppendingString:", v12);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[__CFString stringByReplacingCharactersInRange:withString:](v12, "stringByReplacingCharactersInRange:withString:", v17, v18, v8);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      v20 = (__CFString *)v19;

      v12 = v20;
    }
    if (v9)
    {
      v21 = -[__CFString rangeOfString:](v12, "rangeOfString:", CFSTR("#pragma body\n"));
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (-[__CFString containsString:](v12, "containsString:", CFSTR("#pragma body")))
          AVTMergeShaderModifiersForEntryPointWithPartsAndCode_cold_1();
        v23 = -[__CFString rangeOfString:](v12, "rangeOfString:", CFSTR("#pragma transparent\n"));
        if (v23 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v27 = v23;
          v28 = v24;
          v26 = (__CFString *)-[__CFString mutableCopy](v12, "mutableCopy");
          -[__CFString insertString:atIndex:](v26, "insertString:atIndex:", v9, v27 + v28);
          goto LABEL_25;
        }
        -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v9);
        v25 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[__CFString stringByReplacingCharactersInRange:withString:](v12, "stringByReplacingCharactersInRange:withString:", v21, v22, v9);
        v25 = objc_claimAutoreleasedReturnValue();
      }
      v26 = (__CFString *)v25;
LABEL_25:

      v12 = v26;
    }
  }
  else
  {
    v12 = v10;
  }

  return v12;
}

__CFString *AVTMergeShaderModifiersForEntryPointWithCodeAndParts(void *a1, void *a2, void *a3, void *a4)
{
  __CFString *v7;
  id v8;
  id v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v10, "length"))
  {
    v11 = &stru_1EA6284D0;
    if (v7)
      v11 = v7;
    v12 = v11;
    if (objc_msgSend(v8, "length"))
    {
      v13 = -[__CFString rangeOfString:](v12, "rangeOfString:", CFSTR("#pragma declaration\n"));
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (-[__CFString containsString:](v12, "containsString:", CFSTR("#pragma declaration")))
          AVTMergeShaderModifiersForEntryPointWithCodeAndParts_cold_2();
        objc_msgSend(v8, "stringByAppendingString:", v12);
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[__CFString stringByReplacingCharactersInRange:withString:](v12, "stringByReplacingCharactersInRange:withString:", v13, v14, v8);
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v17 = (__CFString *)v15;

      v12 = v17;
    }
    if (objc_msgSend(v9, "length"))
    {
      v18 = -[__CFString rangeOfString:](v12, "rangeOfString:", CFSTR("#pragma arguments\n"));
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (-[__CFString containsString:](v12, "containsString:", CFSTR("#pragma arguments")))
          AVTMergeShaderModifiersForEntryPointWithCodeAndParts_cold_1();
        objc_msgSend(v9, "stringByAppendingString:", v12);
        v20 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[__CFString stringByReplacingCharactersInRange:withString:](v12, "stringByReplacingCharactersInRange:withString:", v18, v19, v9);
        v20 = objc_claimAutoreleasedReturnValue();
      }
      v21 = (__CFString *)v20;

      v12 = v21;
    }
    -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v10);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = v7;
  }

  return v16;
}

id _AVTNodeDeepCopyWithCache(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t m;
  void *v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _OWORD v84[8];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[4];
  id v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    goto LABEL_56;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0CD59D0]);
  objc_msgSend(v7, "setObject:forKey:", v10, v6);
  objc_msgSend(v6, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setName:", v11);

  objc_msgSend(v6, "simdTransform");
  objc_msgSend(v10, "setSimdTransform:");
  objc_msgSend(v10, "setHidden:", objc_msgSend(v6, "isHidden"));
  objc_msgSend(v6, "opacity");
  objc_msgSend(v10, "setOpacity:");
  objc_msgSend(v10, "setRenderingOrder:", objc_msgSend(v6, "renderingOrder"));
  objc_msgSend(v10, "setCategoryBitMask:", objc_msgSend(v6, "categoryBitMask"));
  objc_msgSend(v6, "light");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLight:", v12);

  objc_msgSend(v6, "camera");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCamera:", v13);

  objc_msgSend(v10, "setCastsShadow:", objc_msgSend(v6, "castsShadow"));
  objc_msgSend(v10, "setUsesDepthPrePass:", objc_msgSend(v6, "usesDepthPrePass"));
  objc_msgSend(v6, "valueForKey:", CFSTR("_valueForKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = MEMORY[0x1E0C809B0];
  v97[1] = 3221225472;
  v97[2] = ___AVTNodeDeepCopyWithCache_block_invoke;
  v97[3] = &unk_1EA61EDA8;
  v15 = v10;
  v98 = v15;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v97);
  objc_msgSend(v6, "geometry");
  v16 = objc_claimAutoreleasedReturnValue();
  v78 = (void *)v16;
  v79 = v14;
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v7, "objectForKey:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v74 = v6;
      v19 = (void *)objc_msgSend(v17, "copy");
      objc_msgSend(v7, "setObject:forKey:", v19, v17);
      objc_msgSend(v17, "tessellator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "copy");
      v76 = v19;
      objc_msgSend(v19, "setTessellator:", v21);

      v22 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v17, "materials");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "arrayWithCapacity:", objc_msgSend(v23, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      objc_msgSend(v17, "materials");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v94;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v94 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
            objc_msgSend(v7, "objectForKey:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v31)
            {
              v31 = (void *)objc_msgSend(v30, "copy");
              objc_msgSend(v7, "setObject:forKey:", v31, v30);
            }
            objc_msgSend(v24, "addObject:", v31);

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
        }
        while (v27);
      }

      v18 = v76;
      objc_msgSend(v76, "setMaterials:", v24);

      v6 = v74;
    }
    objc_msgSend(v15, "setGeometry:", v18);

  }
  objc_msgSend(v6, "morpher");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    objc_msgSend(v7, "objectForKey:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      v33 = (void *)objc_msgSend(v32, "copy");
      objc_msgSend(v7, "setObject:forKey:", v33, v32);
    }
    objc_msgSend(v15, "setMorpher:", v33);

  }
  v77 = v32;
  objc_msgSend(v6, "skinner");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_msgSend(v7, "objectForKey:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
LABEL_47:
      objc_msgSend(v15, "setSkinner:", v35, v70);

      goto LABEL_48;
    }
    objc_msgSend(v34, "bones");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "skeleton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v36, "count"));
    v73 = v36;
    v75 = v6;
    v72 = v37;
    if (!v37)
      goto LABEL_28;
    v39 = v37;
    if (v39 == v5)
    {

    }
    else
    {
      v40 = v39;
      do
      {
        v41 = v40;
        objc_msgSend(v40, "parentNode");
        v40 = (id)objc_claimAutoreleasedReturnValue();

      }
      while (v40 && v40 != v5);

      if (!v40)
      {
LABEL_28:
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v42 = v36;
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v85, v100, 16);
        if (!v43)
        {
          v71 = 0;
          goto LABEL_46;
        }
        v44 = v43;
        v70 = v34;
        v45 = *(_QWORD *)v86;
        do
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v86 != v45)
              objc_enumerationMutation(v42);
            v47 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
            v48 = objc_alloc_init(MEMORY[0x1E0CD59D0]);
            objc_msgSend(v47, "name");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "setName:", v49);

            objc_msgSend(v38, "addObject:", v48);
          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v85, v100, 16);
        }
        while (v44);
        v71 = 0;
        goto LABEL_44;
      }
    }
    objc_msgSend(v34, "skeleton");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    _AVTNodeDeepCopyWithCache(v5, v50, v7);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v51 = v36;
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
    if (!v52)
    {
LABEL_46:

      v57 = (void *)MEMORY[0x1E0CD5A20];
      objc_msgSend(v15, "geometry");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "boneInverseBindTransforms");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "boneWeights");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "boneIndices");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "skinnerWithBaseGeometry:bones:boneInverseBindTransforms:boneWeights:boneIndices:", v58, v38, v59, v60, v61);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "baseGeometryBindTransform");
      v84[0] = v84[4];
      v84[1] = v84[5];
      v84[2] = v84[6];
      v84[3] = v84[7];
      objc_msgSend(v35, "setBaseGeometryBindTransform:", v84);
      objc_msgSend(v35, "setSkeleton:", v71);
      objc_msgSend(v7, "setObject:forKey:", v35, v34);

      v6 = v75;
      goto LABEL_47;
    }
    v53 = v52;
    v70 = v34;
    v54 = *(_QWORD *)v90;
    do
    {
      for (k = 0; k != v53; ++k)
      {
        if (*(_QWORD *)v90 != v54)
          objc_enumerationMutation(v51);
        _AVTNodeDeepCopyWithCache(v5, *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * k), v7);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObject:", v56);

      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
    }
    while (v53);
LABEL_44:
    v34 = v70;
    v36 = v73;
    goto LABEL_46;
  }
LABEL_48:
  v62 = v34;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  objc_msgSend(v6, "childNodes");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v80, v99, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v81;
    do
    {
      for (m = 0; m != v65; ++m)
      {
        if (*(_QWORD *)v81 != v66)
          objc_enumerationMutation(v63);
        _AVTNodeDeepCopyWithCache(v5, *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * m), v7);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addChildNode:", v68);

      }
      v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v80, v99, 16);
    }
    while (v65);
  }

  v9 = v15;
LABEL_56:

  return v9;
}

void _AVTMemojiRandomize(void *a1, void *a2)
{
  void (**v3)(id, void *, uint64_t, _QWORD);
  uint64_t i;
  void *v5;
  uint32_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint32_t v12;
  uint32_t v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t j;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void (**v22)(id, void *, _QWORD);
  _QWORD v23[4];
  void (**v24)(id, void *, uint64_t, _QWORD);

  v22 = a1;
  v3 = a2;
  for (i = 0; i != 40; ++i)
  {
    +[AVTPreset availablePresetsForCategory:](AVTPreset, "availablePresetsForCategory:", i, v22);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = arc4random_uniform(objc_msgSend(v5, "count"));
      v7 = 1.0;
      if ((unint64_t)(i - 1) <= 0x22)
        v7 = dbl_1DD26A7D0[i - 1];
      if (_AVTMemojiRandomizationInitializeRand_onceToken != -1)
        dispatch_once(&_AVTMemojiRandomizationInitializeRand_onceToken, &__block_literal_global_452);
      if (drand48() <= v7)
      {
        v9 = v6;
      }
      else
      {
        v8 = objc_msgSend(v5, "indexOfObjectPassingTest:", &__block_literal_global_451);
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
          v9 = 0;
        else
          v9 = v8;
      }
      objc_msgSend(v5, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2](v22, v10, i);

    }
    +[AVTColorPreset colorPresetsForCategory:](AVTColorPreset, "colorPresetsForCategory:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v12 = arc4random_uniform(objc_msgSend(v11, "count"));
      if (i)
      {
        if (i == 10)
        {
          v13 = 1;
        }
        else
        {
          if (i != 1)
          {
LABEL_21:
            objc_msgSend(v11, "objectAtIndex:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (_AVTMemojiRandomizationInitializeRand_onceToken != -1)
              dispatch_once(&_AVTMemojiRandomizationInitializeRand_onceToken, &__block_literal_global_452);
            v15 = drand48();
            *(float *)&v15 = v15;
            *(float *)&v15 = (float)(*(float *)&v15 * 2.0) + -1.0;
            objc_msgSend(v14, "colorPresetWithVariation:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v3[2](v3, v16, i, 0);
            v23[0] = MEMORY[0x1E0C809B0];
            v23[1] = 3221225472;
            v23[2] = ___AVTMemojiRandomize_block_invoke_2;
            v23[3] = &unk_1EA620018;
            v24 = v3;
            objc_msgSend(v16, "enumerateDerivedColorPresetsUsingBlock:", v23);

            goto LABEL_24;
          }
          v13 = 7;
        }
      }
      else
      {
        v13 = 8;
      }
      v12 = arc4random_uniform(v13);
      goto LABEL_21;
    }
LABEL_24:
    if (i != 7)
    {
      for (j = 1; j != 3; ++j)
      {
        v18 = v11;
        +[AVTPreset colorPresetsForCategory:colorIndex:](AVTPreset, "colorPresetsForCategory:colorIndex:", i, j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(v11, "objectAtIndex:", arc4random_uniform(objc_msgSend(v11, "count")));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (_AVTMemojiRandomizationInitializeRand_onceToken != -1)
            dispatch_once(&_AVTMemojiRandomizationInitializeRand_onceToken, &__block_literal_global_452);
          v20 = drand48();
          *(float *)&v20 = v20;
          *(float *)&v20 = (float)(*(float *)&v20 * 2.0) + -1.0;
          objc_msgSend(v19, "colorPresetWithVariation:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v3[2](v3, v21, i, j);
        }
      }
    }

  }
}

double AVTRGB2HSB(__n128 a1)
{
  float v1;
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;

  if (a1.n128_f32[0] >= a1.n128_f32[1])
    v1 = a1.n128_f32[0];
  else
    v1 = a1.n128_f32[1];
  if (a1.n128_f32[0] >= a1.n128_f32[1])
    v2 = a1.n128_f32[1];
  else
    v2 = a1.n128_f32[0];
  if (v1 >= a1.n128_f32[2])
    v3 = v1;
  else
    v3 = a1.n128_f32[2];
  if (v2 >= a1.n128_f32[2])
    v4 = a1.n128_f32[2];
  else
    v4 = v2;
  v5 = v3 - v4;
  v6 = 0.0;
  if ((float)(v3 - v4) != 0.0)
  {
    v7 = (float)((float)(a1.n128_f32[0] - a1.n128_f32[1]) / v5) + 4.0;
    if (a1.n128_f32[1] == v3)
      v7 = (float)((float)(a1.n128_f32[2] - a1.n128_f32[0]) / v5) + 2.0;
    v8 = (float)(a1.n128_f32[1] - a1.n128_f32[2]) / v5;
    if (a1.n128_f32[0] != v3)
      v8 = v7;
    v6 = v8 * 60.0;
    if ((float)(v8 * 60.0) < 0.0)
      v6 = v6 + 360.0;
  }
  v9 = v5 / v3;
  if (v3 == 0.0)
    v9 = 0.0;
  *(float *)&v10 = v6 / 360.0;
  *((float *)&v10 + 1) = v9;
  return v10;
}

double AVTHSB2RGB(__n128 a1)
{
  float v1;
  float v2;
  float v3;
  double v4;
  float v5;
  float v7;
  int v8;
  float v9;
  float v10;
  float v11;
  float v12;

  v1 = 0.0;
  v2 = fmaxf(fminf(a1.n128_f32[1], 1.0), 0.0);
  v3 = fmaxf(fminf(a1.n128_f32[2], 1.0), 0.0);
  if (v2 == 0.0)
  {
    *(float *)&v4 = v3;
    v5 = v3;
  }
  else
  {
    v7 = fmaxf(fminf(a1.n128_f32[0], 1.0), 0.0) * 360.0;
    if (v7 != 360.0)
      v1 = v7 / 60.0;
    v8 = (int)v1;
    v9 = v1 - (float)(int)v1;
    v10 = v3 * (float)(1.0 - v2);
    v11 = v3 * (float)(1.0 - (float)(v2 * v9));
    v12 = v3 * (float)(1.0 - (float)(v2 * (float)(1.0 - v9)));
    *(float *)&v4 = v3;
    v5 = v12;
    switch(v8)
    {
      case 0:
        break;
      case 1:
        *(float *)&v4 = v11;
        v5 = v3;
        break;
      case 2:
        *(float *)&v4 = v10;
        v5 = v3;
        break;
      case 3:
        *(float *)&v4 = v10;
        v5 = v11;
        break;
      case 4:
        *(float *)&v4 = v12;
        v5 = v10;
        break;
      default:
        *(float *)&v4 = v3;
        v5 = v10;
        break;
    }
  }
  *((float *)&v4 + 1) = v5;
  return v4;
}

void sub_1DD24FEE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD250584(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD250774(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD251CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1DD252790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD253C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD255930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Unwind_Resume(a1);
}

uint64_t AVTInterpolateBasicAnimationFloat(void *a1, float a2)
{
  id v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  float v8;
  float v9;
  double v10;

  v3 = a1;
  objc_msgSend(v3, "fromValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  objc_msgSend(v3, "toValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "floatValue");
  v9 = v8;

  *(float *)&v10 = v6 + (float)(a2 * (float)(v9 - v6));
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
}

uint64_t AVTInterpolateBasicAnimationFloat4(void *a1, float a2)
{
  id v2;
  void *v3;
  float32x4_t v4;
  void *v5;
  float32x4_t v6;
  float32x4_t v8;
  float32x4_t v9;

  v2 = a1;
  objc_msgSend(v2, "fromValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avt_float4Value");
  v9 = v4;

  objc_msgSend(v2, "toValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "avt_float4Value");
  v8 = v6;

  return objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat4_usableWithKVCForSCNVector4:", *(double *)vmlaq_n_f32(v9, vsubq_f32(v8, v9), a2).i64);
}

uint64_t AVTInterpolateBasicAnimationQuaternion(void *a1, float a2)
{
  id v3;
  void *v4;
  float32x4_t v5;
  void *v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float v11;
  float v12;
  float32x4_t v13;
  int8x16_t v14;
  float32x4_t v15;
  int8x16_t v16;
  float v17;
  float v18;
  BOOL v19;
  float v20;
  float v21;
  float32x2_t v22;
  float32x2_t v23;
  float v24;
  float32x4_t v25;
  float v26;
  float v27;
  float v28;
  float32x4_t v29;
  int8x16_t v30;
  float32x2_t v31;
  double v32;
  unsigned __int32 v33;
  float32x2_t v34;
  float32x2_t v35;
  float32x4_t v37;
  float v38;
  float v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;

  v3 = a1;
  objc_msgSend(v3, "fromValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avt_float4Value");
  v42 = v5;

  objc_msgSend(v3, "toValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "avt_float4Value");
  v40 = v7;

  v8 = vmulq_f32(v42, v40);
  v9 = (float32x4_t)vextq_s8((int8x16_t)v8, (int8x16_t)v8, 8uLL);
  *(float32x2_t *)v8.f32 = vadd_f32(*(float32x2_t *)v8.f32, *(float32x2_t *)v9.f32);
  v8.f32[0] = vaddv_f32(*(float32x2_t *)v8.f32);
  v9.i32[0] = 0;
  v10 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v8, v9)), 0), (int8x16_t)vnegq_f32(v40), (int8x16_t)v40);
  v11 = 1.0;
  v12 = 1.0 - a2;
  v13 = vsubq_f32(v42, v10);
  v14 = (int8x16_t)vmulq_f32(v13, v13);
  v41 = v10;
  v15 = vaddq_f32(v42, v10);
  v16 = (int8x16_t)vmulq_f32(v15, v15);
  v17 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v14.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v16.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v16, v16, 8uLL)))));
  v18 = v17 + v17;
  v19 = (float)(v17 + v17) == 0.0;
  v20 = 1.0;
  if (!v19)
    v20 = sinf(v18) / v18;
  v21 = v20;
  v22 = vrecpe_f32((float32x2_t)LODWORD(v20));
  v23 = vmul_f32(v22, vrecps_f32((float32x2_t)LODWORD(v21), v22));
  LODWORD(v24) = vmul_f32(v23, vrecps_f32((float32x2_t)LODWORD(v21), v23)).u32[0];
  if ((float)(v12 * v18) != 0.0)
  {
    v38 = v24;
    v23.f32[0] = sinf(v12 * v18);
    v24 = v38;
    v11 = v23.f32[0] / (float)(v12 * v18);
  }
  v23.f32[0] = v12 * (float)(v24 * v11);
  v25 = (float32x4_t)vdupq_lane_s32((int32x2_t)v23, 0);
  v26 = v18 * a2;
  v27 = 1.0;
  if (v26 != 0.0)
  {
    v37 = v25;
    v39 = v24;
    v28 = sinf(v26);
    v25 = v37;
    v24 = v39;
    v27 = v28 / v26;
  }
  v29 = vmlaq_f32(vmulq_n_f32(v41, (float)(v24 * v27) * a2), v42, v25);
  v30 = (int8x16_t)vmulq_f32(v29, v29);
  v31 = vadd_f32(*(float32x2_t *)v30.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v30, v30, 8uLL));
  if (vaddv_f32(v31) == 0.0)
  {
    v32 = 0.0;
  }
  else
  {
    v33 = vadd_f32(v31, (float32x2_t)vdup_lane_s32((int32x2_t)v31, 1)).u32[0];
    v34 = vrsqrte_f32((float32x2_t)v33);
    v35 = vmul_f32(v34, vrsqrts_f32((float32x2_t)v33, vmul_f32(v34, v34)));
    *(_QWORD *)&v32 = vmulq_n_f32(v29, vmul_f32(v35, vrsqrts_f32((float32x2_t)v33, vmul_f32(v35, v35))).f32[0]).u64[0];
  }
  return objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat4_usableWithKVCForSCNVector4:", v32);
}

void sub_1DD25ADFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1DD25CC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

id AVTPrecompiledAnimojiSpecializationSettings()
{
  if (AVTPrecompiledAnimojiSpecializationSettings_onceToken != -1)
    dispatch_once(&AVTPrecompiledAnimojiSpecializationSettings_onceToken, &__block_literal_global_24);
  return (id)AVTPrecompiledAnimojiSpecializationSettings_kAVTAnimojiPrecompiledPlist_specializationSettings;
}

id AVTPrecompiledMemojiAssetWithIdentifier(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = AVTPrecompiledMemojiAssetWithIdentifier_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&AVTPrecompiledMemojiAssetWithIdentifier_onceToken, &__block_literal_global_1158);
  objc_msgSend((id)AVTPrecompiledMemojiAssetWithIdentifier_kAVTMemojiPrecompiledPlist_assetByIdentifier, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id AVTPrecompiledMemojiAssetsForComponentType(unint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (AVTPrecompiledMemojiAssetsForComponentType_onceToken != -1)
    dispatch_once(&AVTPrecompiledMemojiAssetsForComponentType_onceToken, &__block_literal_global_11627);
  v2 = (void *)AVTPrecompiledMemojiAssetsForComponentType_kAVTMemojiPrecompiledPlist_assetIdentifiersByComponentType;
  AVTComponentTypeToString(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id AVTPrecompiledMemojiCompositorPropertyNames()
{
  if (AVTPrecompiledMemojiCompositorPropertyNames_onceToken != -1)
    dispatch_once(&AVTPrecompiledMemojiCompositorPropertyNames_onceToken, &__block_literal_global_12750);
  return (id)AVTPrecompiledMemojiCompositorPropertyNames_kAVTPrecompiledMemojiCompositorPropertyNames;
}

id AVTPrecompiledMemojiColorPalettes()
{
  if (AVTPrecompiledMemojiColorPalettes_onceToken != -1)
    dispatch_once(&AVTPrecompiledMemojiColorPalettes_onceToken, &__block_literal_global_12761);
  return (id)AVTPrecompiledMemojiColorPalettes_kAVTMemojiPrecompiledPlist_palettes;
}

id AVTPrecompiledMemojiPresetPlist()
{
  if (AVTPrecompiledMemojiPresetPlist_onceToken != -1)
    dispatch_once(&AVTPrecompiledMemojiPresetPlist_onceToken, &__block_literal_global_19942);
  return (id)AVTPrecompiledMemojiPresetPlist_kAVTMemojiPrecompiledPlist_presets;
}

id AVTPrecompiledMemojiEditorMetadata()
{
  if (AVTPrecompiledMemojiEditorMetadata_onceToken != -1)
    dispatch_once(&AVTPrecompiledMemojiEditorMetadata_onceToken, &__block_literal_global_29655);
  return (id)AVTPrecompiledMemojiEditorMetadata_kAVTMemojiPrecompiledPlist_editor;
}

id AVTPrecompiledMemojiPrereleaseEditorMetadata()
{
  if (AVTPrecompiledMemojiPrereleaseEditorMetadata_onceToken != -1)
    dispatch_once(&AVTPrecompiledMemojiPrereleaseEditorMetadata_onceToken, &__block_literal_global_33494);
  return (id)AVTPrecompiledMemojiPrereleaseEditorMetadata_kAVTMemojiPrecompiledPlist_editorPrerelease;
}

id AVTPrecompiledToyboxAnimojiNames()
{
  if (AVTPrecompiledToyboxAnimojiNames_onceToken != -1)
    dispatch_once(&AVTPrecompiledToyboxAnimojiNames_onceToken, &__block_literal_global_33495);
  return (id)AVTPrecompiledToyboxAnimojiNames_kAVTWatchFacesPrecompiledPlist_toyboxAnimojiNames;
}

id _AVTPoseRoundingBehaviour()
{
  if (_AVTPoseRoundingBehaviour_onceToken != -1)
    dispatch_once(&_AVTPoseRoundingBehaviour_onceToken, &__block_literal_global_26);
  return (id)_AVTPoseRoundingBehaviour_behavior;
}

void sub_1DD25F1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVTCoordinatorLoadPoseAtPath_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

void AVTCoordinatorLoadPoseAtPath_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

void AVTCoordinatorLoadPosesAtPaths_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

void AVTCoordinatorLoadPosesAtPaths_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

void AVTCoordinatorLoadPoseAnimationsAtPaths_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

void ___initialiseBlendshapeMappingIfNeeded_block_invoke_cold_1()
{
  __assert_rtn("_initialiseBlendshapeMappingIfNeeded_block_invoke", "AVT_ARKitExtensions.m", 228, "blendshapeNames.count == AVT_APPLECVA_BLENDSHAPE_COUNT");
}

void addAnimation_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1DD1FA000, a3, (uint64_t)a3, "Error: Unreachable code: Unsupported CAPropertyAnimation subclass (%@)", (uint8_t *)a2);

}

void addAnimation_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD1FA000, log, OS_LOG_TYPE_ERROR, "Error: Unreachable code: Could not infer blendshape name", v1, 2u);
}

void addAnimation_cold_4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_2(&dword_1DD1FA000, a2, v4, "Error: Unreachable code: Unknown animation target %@", (uint8_t *)&v5);

}

void addAnimation_cold_5(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  const char *v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 136315394;
  v5 = "fabs(delta - beginTime) < 1e-3";
  v6 = 2048;
  v7 = a2;
  OUTLINED_FUNCTION_1_4(&dword_1DD1FA000, a1, a4, "Error: Condition '%s' failed. We did not expect a beginTime of %.3f", (uint8_t *)&v4);
}

void AVTARKitTransformToSceneKitTransformMatrix_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1DD1FA000, a2, OS_LOG_TYPE_ERROR, "Error: Unreachable code: Unsupported worldAlignment %ld", (uint8_t *)&v2, 0xCu);
}

void AVTPrecompiledStickerPackPlist_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a2, a3, "Error: Could not find precompiled sticker pack \"%@\"", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void AVTIdentifierOfUpgradedColorPresetForAssetPresetIdentifier_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD1FA000, log, OS_LOG_TYPE_ERROR, "Error: Unreachable code: Unsupported color index", v1, 2u);
}

void AVTPresetCategoryToComponentType_cold_1()
{
  __assert_rtn("AVTPresetCategoryToComponentType", "AVTPreset.m", 425, "0");
}

void AVTSetInitialValuesExportedAsAnimations_cold_1()
{
  NSLog(CFSTR("Unsupported CAAnimation subclass"));
  abort();
}

void _AVTSplitShaderModifier_cold_1()
{
  __assert_rtn("_AVTSplitShaderModifier", "SceneKit+AVTExtensions.m", 1210, "[modifier containsString:kAVTShaderModifierPragmaArgumentsMarker] == NO");
}

void _AVTSplitShaderModifier_cold_2()
{
  __assert_rtn("_AVTSplitShaderModifier", "SceneKit+AVTExtensions.m", 1233, "[modifier containsString:kAVTShaderModifierPragmaBodyMarker] == NO");
}

void _AVTSplitShaderModifier_cold_3()
{
  __assert_rtn("_AVTSplitShaderModifier", "SceneKit+AVTExtensions.m", 1206, "0");
}

void _AVTSplitShaderModifier_cold_4()
{
  __assert_rtn("_AVTSplitShaderModifier", "SceneKit+AVTExtensions.m", 1169, "0");
}

void _AVTSplitShaderModifier_cold_5()
{
  __assert_rtn("_AVTSplitShaderModifier", "SceneKit+AVTExtensions.m", 1173, "[modifier containsString:kAVTShaderModifierPragmaDeclarationLine] == NO");
}

void AVTMergeShaderModifiersForEntryPointWithPartsAndParts_cold_1()
{
  __assert_rtn("AVTMergeShaderModifiersForEntryPointWithPartsAndParts", "SceneKit+AVTExtensions.m", 1472, "[mergedBody containsString:kAVTShaderModifierPragmaBodyMarker] == NO");
}

void AVTMergeShaderModifiersForEntryPointWithPartsAndParts_cold_2()
{
  __assert_rtn("AVTMergeShaderModifiersForEntryPointWithPartsAndParts", "SceneKit+AVTExtensions.m", 1457, "[mergedArguments containsString:kAVTShaderModifierPragmaArgumentsMarker] == NO");
}

void AVTMergeShaderModifiersForEntryPointWithPartsAndParts_cold_3()
{
  __assert_rtn("AVTMergeShaderModifiersForEntryPointWithPartsAndParts", "SceneKit+AVTExtensions.m", 1442, "[mergedDeclarations containsString:kAVTShaderModifierPragmaDeclarationMarker] == NO");
}

void AVTMergeShaderModifiersForEntryPointWithPartsAndCode_cold_1()
{
  __assert_rtn("AVTMergeShaderModifiersForEntryPointWithPartsAndCode", "SceneKit+AVTExtensions.m", 1356, "[mergedCode containsString:kAVTShaderModifierPragmaBodyMarker] == NO");
}

void AVTMergeShaderModifiersForEntryPointWithPartsAndCode_cold_2()
{
  __assert_rtn("AVTMergeShaderModifiersForEntryPointWithPartsAndCode", "SceneKit+AVTExtensions.m", 1342, "[mergedCode containsString:kAVTShaderModifierPragmaArgumentsMarker] == NO");
}

void AVTMergeShaderModifiersForEntryPointWithPartsAndCode_cold_3()
{
  __assert_rtn("AVTMergeShaderModifiersForEntryPointWithPartsAndCode", "SceneKit+AVTExtensions.m", 1326, "[mergedCode containsString:kAVTShaderModifierPragmaDeclarationMarker] == NO");
}

void AVTMergeShaderModifiersForEntryPointWithCodeAndParts_cold_1()
{
  __assert_rtn("AVTMergeShaderModifiersForEntryPointWithCodeAndParts", "SceneKit+AVTExtensions.m", 1409, "[mergedCode containsString:kAVTShaderModifierPragmaArgumentsMarker] == NO");
}

void AVTMergeShaderModifiersForEntryPointWithCodeAndParts_cold_2()
{
  __assert_rtn("AVTMergeShaderModifiersForEntryPointWithCodeAndParts", "SceneKit+AVTExtensions.m", 1393, "[mergedCode containsString:kAVTShaderModifierPragmaDeclarationMarker] == NO");
}

uint64_t ARAdjustIntrincisForOrientation()
{
  return MEMORY[0x1E0C89330]();
}

uint64_t ARAdjustIntrinsicsForViewportSize()
{
  return MEMORY[0x1E0C89338]();
}

uint64_t ARCameraToDisplayRotation()
{
  return MEMORY[0x1E0C894E0]();
}

uint64_t ARMatrix3x3FromArray()
{
  return MEMORY[0x1E0C894F0]();
}

uint64_t ARMatrix4x4FromRotationAndTranslation()
{
  return MEMORY[0x1E0C894F8]();
}

uint64_t ARMatrixMakeFrustum()
{
  return MEMORY[0x1E0C89500]();
}

uint64_t ARVector3FromArray()
{
  return MEMORY[0x1E0C89550]();
}

uint64_t ARVector3ScalarMultiplication()
{
  return MEMORY[0x1E0C89558]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1E0C9BB60](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1E0C9BB80](context);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x1E0C9BF78]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x1E0C9BF90]();
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9BFC8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x1E0C9C028](c);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
  MEMORY[0x1E0C9C470](c, lengths, count, phase);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A0](c, red, green, blue, alpha);
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C560](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC368](idst, properties);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF0](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1E0C9CC00](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC528](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

OSStatus CMAudioFormatDescriptionCreate(CFAllocatorRef allocator, const AudioStreamBasicDescription *asbd, size_t layoutSize, const AudioChannelLayout *layout, size_t magicCookieSize, const void *magicCookie, CFDictionaryRef extensions, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9EA80](allocator, asbd, layoutSize, layout, magicCookieSize, magicCookie, extensions, formatDescriptionOut);
}

OSStatus CMAudioSampleBufferCreateReadyWithPacketDescriptions(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EAE0](allocator, dataBuffer, formatDescription, numSamples, presentationTimeStamp, packetDescriptions, sampleBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB88](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

OSStatus CMBlockBufferFillDataBytes(char fillByte, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x1E0C9EB90](fillByte, destinationBuffer, offsetIntoDestination, dataLength);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9EFE0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9F008](retstr, sbuf);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E8](retstr, start, duration);
}

uint64_t CVAFaceTrackingCopySemantics()
{
  return MEMORY[0x1E0CFCC00]();
}

uint64_t CVAFaceTrackingPostProcessRecordingExt()
{
  return MEMORY[0x1E0CFCC20]();
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1E0CA8A30](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1E0CA8A38](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1E0CA8A50](image);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1E0DE2BA0]();
}

uint64_t MTLReadWriteTextureIsSupported()
{
  return MEMORY[0x1E0CC69D8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void *__cdecl NSMapInsertIfAbsent(NSMapTable *table, const void *key, const void *value)
{
  return (void *)MEMORY[0x1E0CB2DB0](table, key, value);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0CEA118]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t SCNGetPerformanceStatistics()
{
  return MEMORY[0x1E0CD5A98]();
}

uint64_t SCNGetShaderCollectionOutputURL()
{
  return MEMORY[0x1E0CD5AA0]();
}

uint64_t SCNSetPerformanceStatisticsEnabled()
{
  return MEMORY[0x1E0CD5BA0]();
}

uint64_t SCNSetShaderCollectionEnabled()
{
  return MEMORY[0x1E0CD5BA8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _SCNSetShaderCacheURL()
{
  return MEMORY[0x1E0CD5BD0]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x1E0CEBEE0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  simd_float4x4 result;

  MEMORY[0x1E0C80B38]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C81008]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x1E0C81630](a1);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

double drand48(void)
{
  double result;

  MEMORY[0x1E0C83070]();
  return result;
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

float sinf(float a1)
{
  float result;

  MEMORY[0x1E0C85420](a1);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

void srand48(uint64_t a1)
{
  MEMORY[0x1E0C85480](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

float tanf(float a1)
{
  float result;

  MEMORY[0x1E0C857F0](a1);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

