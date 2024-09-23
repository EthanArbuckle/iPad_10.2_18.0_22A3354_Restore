@implementation CAMStartVideoRecordingCommand

- (CAMStartVideoRecordingCommand)initWithRequest:(id)a3
{
  id v5;
  CAMStartVideoRecordingCommand *v6;
  CAMStartVideoRecordingCommand *v7;
  CAMStartVideoRecordingCommand *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMStartVideoRecordingCommand;
  v6 = -[CAMCaptureCommand initWithSubcommands:](&v10, sel_initWithSubcommands_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__request, a3);
    v8 = v7;
  }

  return v7;
}

- (CAMStartVideoRecordingCommand)initWithCoder:(id)a3
{
  id v4;
  CAMStartVideoRecordingCommand *v5;
  uint64_t v6;
  CAMVideoCaptureRequest *request;
  CAMStartVideoRecordingCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMStartVideoRecordingCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMVideoCaptureCommandRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    request = v5->__request;
    v5->__request = (CAMVideoCaptureRequest *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMStartVideoRecordingCommand _request](self, "_request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CAMVideoCaptureCommandRequest"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMStartVideoRecordingCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[CAMStartVideoRecordingCommand _request](self, "_request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[3];
  v4[3] = v6;

  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  CMTime v24;
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMStartVideoRecordingCommand _request](self, "_request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localDestinationURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CAMStartVideoRecordingCommand executeWithContext:].cold.1((uint64_t)v6, v8);

  }
  objc_msgSend(v4, "currentMovieFileOutput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "captureOrientation");
  objc_msgSend(v10, "setVideoOrientation:", -[CAMStartVideoRecordingCommand _videoOrientationForCaptureOrientation:](self, "_videoOrientationForCaptureOrientation:", v11));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMPersistenceController clientVideoMetadataForRequest:withCreationDate:isEV0ForHDR:livePhotoIdentifierOverride:slomoPlayback:](CAMPersistenceController, "clientVideoMetadataForRequest:withCreationDate:isEV0ForHDR:livePhotoIdentifierOverride:slomoPlayback:", v5, v23, 0, 0, objc_msgSend(v5, "captureMode") == 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMetadata:");
  objc_msgSend(v5, "maximumRecordedDuration");
  if (v12 > 0.0)
  {
    CMTimeMake(&v24, (uint64_t)v12, 1);
    objc_msgSend(v9, "setMaxRecordedDuration:", &v24);
  }
  v13 = objc_msgSend(v5, "maximumRecordedFileSize");
  if (v13 >= 1)
    objc_msgSend(v9, "setMaxRecordedFileSize:", v13);
  objc_msgSend(v9, "setMinFreeDiskSpaceLimit:", objc_msgSend(v5, "remainingDiskUsageThreshold"));
  objc_msgSend(v9, "setSendsLastVideoPreviewFrame:", objc_msgSend(v5, "shouldGenerateVideoPreviewImage"));
  v14 = objc_msgSend(v5, "videoEncodingBehavior");
  objc_msgSend(v9, "availableVideoCodecTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureEncodingUtilities selectVideoCodecFromAvailableCodecs:withBehavior:](CAMCaptureEncodingUtilities, "selectVideoCodecFromAvailableCodecs:withBehavior:", v15, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
  {
    v29 = *MEMORY[0x1E0C8AE68];
    v30[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOutputSettings:forConnection:", v18, v10);

  }
  objc_msgSend(v4, "registerVideoCaptureRequest:", v5);
  objc_msgSend(v4, "updateControlEnablementForRecording:mode:devicePosition:", 1, objc_msgSend(v5, "captureMode"), objc_msgSend(v5, "captureDevicePosition"));
  objc_msgSend(v4, "currentRecordingDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startRecordingToOutputFileURL:recordingDelegate:", v6, v19);
  if (v11 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected:%ld"), v11);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1EA32C518[v11];
  }
  v21 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = v20;
    v27 = 2114;
    v28 = v6;
    _os_log_impl(&dword_1DB760000, v21, OS_LOG_TYPE_DEFAULT, "startRecordingToOutputFileURL: (%{public}@) url=%{public}@", buf, 0x16u);
  }

}

- (int64_t)_videoOrientationForCaptureOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3)
    return 1;
  else
    return a3;
}

- (CAMVideoCaptureRequest)_request
{
  return self->__request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__request, 0);
}

- (void)executeWithContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Missing localDestinationURL while starting video recording %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
