@implementation CAMStillImageCaptureCommand

- (CAMStillImageCaptureCommand)initWithRequest:(id)a3
{
  id v5;
  CAMStillImageCaptureCommand *v6;
  CAMStillImageCaptureCommand *v7;
  CAMStillImageCaptureCommand *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMStillImageCaptureCommand;
  v6 = -[CAMCaptureCommand initWithSubcommands:](&v10, sel_initWithSubcommands_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__request, a3);
    v8 = v7;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMStillImageCaptureCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[CAMStillImageCaptureCommand _request](self, "_request");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (CAMStillImageCaptureRequest)_request
{
  return self->__request;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  double Current;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  double v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  double v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  char v24;
  uint64_t v25;
  NSObject *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  __CFString *v30;
  __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  NSObject *v41;
  uint64_t v42;
  __CFString *v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  const char *v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  __CFString *v62;
  uint8_t buf[4];
  double v64;
  __int16 v65;
  __CFString *v66;
  __int16 v67;
  __CFString *v68;
  __int16 v69;
  double v70;
  __int16 v71;
  double v72;
  __int16 v73;
  double v74;
  _QWORD v75[4];

  v75[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  -[CAMStillImageCaptureCommand _request](self, "_request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentStillImageOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isVideoOrientationSupported"))
  {
    v9 = -[CAMStillImageCaptureCommand _videoOrientationForCaptureOrientation:](self, "_videoOrientationForCaptureOrientation:", objc_msgSend(v6, "captureOrientation"));
    v10 = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v8, "setVideoOrientation:", v9);
    v11 = CFAbsoluteTimeGetCurrent() - v10;
    if (v11 > 0.2)
    {
      v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v64 = v11;
        _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "Call to -[AVCaptureConnection setVideoOrientation:] took %.3fs", buf, 0xCu);
      }

    }
  }
  v13 = objc_msgSend(v6, "ctmCaptureType");
  if (v13 == 2)
  {
    v14 = 0;
    goto LABEL_10;
  }
  if (v13 == 1)
  {
    v14 = 1;
LABEL_10:
    v15 = 1;
    goto LABEL_12;
  }
  v14 = 0;
  v15 = 0;
LABEL_12:
  objc_msgSend(v6, "persistenceUUID");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedMomentCaptureSettingsForIdentifier:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    v19 = v15;
  else
    v19 = 0;
  if (v19 != 1)
  {
    if (v17)
    {
      v21 = v8;
      v22 = -[NSObject uniqueID](v17, "uniqueID");
      v23 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[CAMStillImageCaptureCommand executeWithContext:].cold.2(v16, v22, v23);

      objc_msgSend(v7, "cancelMomentCaptureWithUniqueID:", v22);
      v8 = v21;
    }
    else
    {
      if (!v15)
      {
LABEL_28:
        objc_msgSend(v6, "capturePhotoSettingsWithContext:", v4);
        v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v18 = 0;
        goto LABEL_29;
      }
      v18 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CAMStillImageCaptureCommand executeWithContext:].cold.3(v16, v18);
      v15 = 0;
    }

    goto LABEL_28;
  }
  if (v14)
    objc_msgSend(v4, "clearCachedMomentCaptureSettingsForIdentifier:", v16);
  -[NSObject photoSettings](v18, "photoSettings");
  v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  v15 = 1;
LABEL_29:
  if (objc_msgSend(v6, "needsLivePhotoCaptureResumedOnPhotoOutput:", v7))
    objc_msgSend(v7, "setLivePhotoCaptureSuspended:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v24 = objc_opt_respondsToSelector();
    if ((objc_msgSend(v6, "isCTMVideo") & 1) == 0 && (v24 & 1) != 0)
    {
      if (objc_msgSend(v7, "isUltraHighResolutionZeroShutterLagEnabled"))
      {
        if (objc_msgSend(*(id *)&v20, "photoQualityPrioritization") != 1)
        {
          v25 = objc_msgSend(*(id *)&v20, "maxPhotoDimensions");
          if (v25 != objc_msgSend(v7, "maxPhotoDimensions"))
          {
            v26 = os_log_create("com.apple.camera", "Camera");
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              -[CAMStillImageCaptureCommand executeWithContext:].cold.1(v26);

            objc_msgSend(v7, "setUltraHighResolutionZeroShutterLagEnabled:", 0);
          }
        }
      }
    }
  }
  else
  {
    objc_msgSend(v6, "isCTMVideo");
  }
  objc_msgSend(v4, "registerStillImageCaptureRequest:withSettings:", v6, *(_QWORD *)&v20);
  v27 = objc_msgSend(v6, "captureOrientation");
  if (v27 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected:%ld"), v27);
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v62 = off_1EA3291B0[v27];
  }
  v61 = (void *)v16;
  if (objc_msgSend(*(id *)&v20, "digitalFlashMode"))
  {
    v28 = (void *)MEMORY[0x1E0CB3940];
    v29 = objc_msgSend(v6, "lowLightMode");
    if (v29 > 2)
      v30 = 0;
    else
      v30 = off_1EA3291D8[v29];
    objc_msgSend(v28, "stringWithFormat:", CFSTR(" NightMode%@"), v30);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = &stru_1EA3325A0;
  }
  objc_msgSend(v4, "currentStillImageDelegate");
  v32 = objc_claimAutoreleasedReturnValue();
  v60 = (void *)v32;
  if ((v19 & v15) != 1)
  {
    v44 = v32;
    v45 = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v7, "capturePhotoWithSettings:delegate:", *(_QWORD *)&v20, v44);
    v46 = CFAbsoluteTimeGetCurrent();
    v47 = CFAbsoluteTimeGetCurrent();
    v33 = os_log_create("com.apple.camera", "Camera");
    v43 = v62;
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      goto LABEL_60;
    v48 = objc_msgSend(*(id *)&v20, "uniqueID");
    *(_DWORD *)buf = 134219266;
    v64 = *(double *)&v48;
    v65 = 2114;
    v66 = v31;
    v67 = 2114;
    v68 = v62;
    v69 = 2114;
    v70 = v20;
    v71 = 2048;
    v72 = v47 - v45;
    v73 = 2048;
    v74 = v46 - Current;
    v49 = "captureID:%lld Called capturePhotoWithSettings:%{public}@ (%{public}@) %{public}@. Took %.3fs of %.3fs command time";
LABEL_59:
    _os_log_impl(&dword_1DB760000, v33, OS_LOG_TYPE_DEFAULT, v49, buf, 0x3Eu);
    goto LABEL_60;
  }
  if (!objc_msgSend(v6, "isCTMVideo"))
  {
    v50 = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v7, "commitMomentCaptureToPhotoWithUniqueID:", -[NSObject uniqueID](v18, "uniqueID"));
    v51 = CFAbsoluteTimeGetCurrent();
    v52 = CFAbsoluteTimeGetCurrent();
    v33 = os_log_create("com.apple.camera", "Camera");
    v43 = v62;
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      goto LABEL_60;
    v53 = objc_msgSend(*(id *)&v20, "uniqueID");
    *(_DWORD *)buf = 134219266;
    v64 = *(double *)&v53;
    v65 = 2114;
    v66 = v31;
    v67 = 2114;
    v68 = v62;
    v69 = 2114;
    v70 = v20;
    v71 = 2048;
    v72 = v52 - v50;
    v73 = 2048;
    v74 = v51 - Current;
    v49 = "captureID:%lld Called commitMomentCapture as Photo:%{public}@ (%{public}@) %{public}@. Took %.3fs of %.3fs command time";
    goto LABEL_59;
  }
  v59 = v8;
  objc_msgSend(v4, "currentMomentCaptureMovieRecordingDelegate");
  v33 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B248], "movieRecordingSettingsFromMomentCaptureSettings:", v18);
  v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localCTMVideoDestinationURL");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString setMovieFileURL:](v34, "setMovieFileURL:");
  objc_msgSend(v6, "videoEncodingBehavior");
  v35 = *MEMORY[0x1E0C8AE78];
  v75[0] = *MEMORY[0x1E0C8AE70];
  v75[1] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureEncodingUtilities selectVideoCodecFromAvailableCodecs:withBehavior:](CAMCaptureEncodingUtilities, "selectVideoCodecFromAvailableCodecs:withBehavior:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString setVideoCodecType:](v34, "setVideoCodecType:");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v36 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)v36;
  +[CAMPersistenceController clientVideoMetadataForLocation:withCreationDate:](CAMPersistenceController, "clientVideoMetadataForLocation:withCreationDate:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString setMovieMetadata:](v34, "setMovieMetadata:", v37);
  v38 = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v7, "commitMomentCaptureWithUniqueID:toMovieRecordingWithSettings:delegate:", -[NSObject uniqueID](v18, "uniqueID"), v34, v33);
  v39 = CFAbsoluteTimeGetCurrent();
  v40 = CFAbsoluteTimeGetCurrent();
  v41 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = -[__CFString uniqueID](v34, "uniqueID");
    *(_DWORD *)buf = 134219010;
    v64 = *(double *)&v42;
    v65 = 2114;
    v66 = v62;
    v67 = 2114;
    v68 = v34;
    v69 = 2048;
    v70 = v40 - v38;
    v71 = 2048;
    v72 = v39 - Current;
    _os_log_impl(&dword_1DB760000, v41, OS_LOG_TYPE_DEFAULT, "captureID:%lld Called commitMomentCapture as Video: (%{public}@) %{public}@. Took %.3fs of %.3fs command time", buf, 0x34u);
  }

  v8 = v59;
  v43 = v62;
LABEL_60:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__request, 0);
}

- (int64_t)_videoOrientationForCaptureOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3)
    return 1;
  else
    return a3;
}

- (CAMStillImageCaptureCommand)initWithCoder:(id)a3
{
  id v4;
  CAMStillImageCaptureCommand *v5;
  uint64_t v6;
  CAMStillImageCaptureRequest *request;
  CAMStillImageCaptureCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMStillImageCaptureCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMStillImageCaptureCommandRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    request = v5->__request;
    v5->__request = (CAMStillImageCaptureRequest *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMStillImageCaptureCommand _request](self, "_request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CAMStillImageCaptureCommandRequest"));

}

- (void)executeWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Capture dimensions should match photo output maximums when ultraHighResolutionZeroShutterLagEnabled==YES. Setting ultraHighResolutionZeroShutterLagEnabled=NO", v1, 2u);
}

- (void)executeWithContext:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134349314;
  v4 = a2;
  v5 = 2114;
  v6 = a1;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Non-moment capture requested, canceling moment capture %{public}lld for identifier %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)executeWithContext:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Failed to find moment settings for identifier %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
