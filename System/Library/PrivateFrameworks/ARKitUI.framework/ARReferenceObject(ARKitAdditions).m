@implementation ARReferenceObject(ARKitAdditions)

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ARReferenceObject_ARKitAdditions__initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, block);
}

- (id)_writeToArchiveWithPreviewImage:()ARKitAdditions error:
{
  UIImage *v6;
  void *v7;
  void *v8;
  void *v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  _OWORD v35[4];
  uint8_t buf[32];
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = (void *)MEMORY[0x1E0CF21A0];
  objc_msgSend(a1, "trackingData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "boundsForTrackingData:", v9);

  objc_msgSend(a1, "referenceOriginTransform");
  v33 = v11;
  v34 = v10;
  v31 = v13;
  v32 = v12;
  ARMatrix4x4FromRotationAndTranslation();
  v14 = 0;
  v35[0] = v15;
  v35[1] = v16;
  v35[2] = v17;
  v35[3] = v18;
  memset(buf, 0, sizeof(buf));
  v37 = 0u;
  v38 = 0u;
  do
  {
    *(float32x4_t *)&buf[v14 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v34, COERCE_FLOAT(v35[v14])), v33, *(float32x2_t *)&v35[v14], 1), v32, (float32x4_t)v35[v14], 2), v31, (float32x4_t)v35[v14], 3);
    ++v14;
  }
  while (v14 != 4);
  if (v6)
  {
    UIImageJPEGRepresentation(v6, 0.8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  v20 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "version"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("Version"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("trackingData.cv3dmap"), CFSTR("TrackingDataReference"));
  ARMatrix4x4Dictionary();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("ReferenceOrigin"));

  if (objc_msgSend(v19, "length"))
    objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("preview.jpg"), CFSTR("ImageReference"));
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v20, 100, 0, a4, *(_OWORD *)&v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v7, "addData:withPath:", v23, CFSTR("Info.plist"));
    objc_msgSend(a1, "trackingData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addData:withPath:", v24, CFSTR("trackingData.cv3dmap"));

    if (objc_msgSend(v19, "length"))
      objc_msgSend(v7, "addData:withPath:", v19, CFSTR("preview.jpg"));
    v25 = v7;
  }
  else
  {
    if (_ARLogGeneral_onceToken_4 != -1)
      dispatch_once(&_ARLogGeneral_onceToken_4, &__block_literal_global_15);
    v26 = (void *)_ARLogGeneral_logObj_4;
    if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_4, OS_LOG_TYPE_ERROR))
    {
      v27 = v26;
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      _os_log_impl(&dword_1DCC73000, v27, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to serialize object metadata.", buf, 0x16u);

    }
    v25 = 0;
  }

  return v25;
}

@end
