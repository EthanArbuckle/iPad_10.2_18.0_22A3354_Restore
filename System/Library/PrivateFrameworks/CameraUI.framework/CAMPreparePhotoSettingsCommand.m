@implementation CAMPreparePhotoSettingsCommand

- (CAMPreparePhotoSettingsCommand)initWithGraphConfiguration:(id)a3
{
  id v5;
  CAMPreparePhotoSettingsCommand *v6;
  CAMPreparePhotoSettingsCommand *v7;
  CAMPreparePhotoSettingsCommand *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMPreparePhotoSettingsCommand;
  v6 = -[CAMCaptureCommand init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__desiredGraphConfiguration, a3);
    v8 = v7;
  }

  return v7;
}

- (void)executeWithContext:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "currentStillImageOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMPreparePhotoSettingsCommand _desiredGraphConfiguration](self, "_desiredGraphConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "mode");
  v11 = objc_msgSend(v8, "device");
  v12 = objc_msgSend(v9, "isHDRSupportedForMode:devicePosition:", v10, objc_msgSend(v8, "devicePosition"));
  v13 = objc_msgSend(v8, "photoEncodingBehavior");
  switch(v10)
  {
    case 0:
    case 4:
      if (objc_msgSend(v9, "isBurstSupportedForMode:device:", v10, v11))
      {
        objc_msgSend(MEMORY[0x1E0C8B0F8], "burstQualityPhotoSettings");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setHDRMode:", 0);
        objc_msgSend(v14, "setPhotoQualityPrioritization:", 1);
        objc_msgSend(v14, "setHighResolutionPhotoEnabled:", 1);
        objc_msgSend(v6, "addObject:", v14);

      }
      goto LABEL_4;
    case 6:
    case 9:
LABEL_4:
      switch(v13)
      {
        case 0:
          objc_msgSend(MEMORY[0x1E0C8B0F8], "photoSettings");
          v18 = objc_claimAutoreleasedReturnValue();
LABEL_10:
          v17 = (void *)v18;
          break;
        case 2:
          v19 = +[CAMStillImageCaptureRequest rawPixelFormatTypeForPhotoOutput:](CAMStillImageCaptureRequest, "rawPixelFormatTypeForPhotoOutput:", v7);
          objc_msgSend(MEMORY[0x1E0C8B0F8], "photoSettingsWithRawPixelFormatType:rawFileType:processedFormat:processedFileType:", v19, *MEMORY[0x1E0C8A2C0], 0, *MEMORY[0x1E0C8A2C0]);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        case 1:
          v15 = (void *)MEMORY[0x1E0C8B0F8];
          v20 = *MEMORY[0x1E0C8AE68];
          v21[0] = *MEMORY[0x1E0C8AE78];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "photoSettingsWithFormat:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          break;
        default:
          v17 = 0;
          break;
      }
      objc_msgSend(v17, "setHDRMode:", +[CAMCaptureConversions captureHDRModeForHDRMode:](CAMCaptureConversions, "captureHDRModeForHDRMode:", v12));
      objc_msgSend(v17, "setHighResolutionPhotoEnabled:", 1);
      objc_msgSend(v17, "setPhotoQualityPrioritization:", +[CAMCaptureConversions AVCapturePhotoQualityPrioritizationForCAMPhotoQualityPrioritization:](CAMCaptureConversions, "AVCapturePhotoQualityPrioritizationForCAMPhotoQualityPrioritization:", objc_msgSend(v8, "photoQualityPrioritization")));
      objc_msgSend(v6, "addObject:", v17);

LABEL_13:
      objc_msgSend(v7, "setPreparedPhotoSettingsArray:completionHandler:", v6, 0);

      return;
    default:
      goto LABEL_13;
  }
}

- (CAMCaptureGraphConfiguration)_desiredGraphConfiguration
{
  return self->__desiredGraphConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__desiredGraphConfiguration, 0);
}

- (CAMPreparePhotoSettingsCommand)initWithCoder:(id)a3
{
  id v4;
  CAMPreparePhotoSettingsCommand *v5;
  uint64_t v6;
  CAMCaptureGraphConfiguration *desiredGraphConfiguration;
  CAMPreparePhotoSettingsCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMPreparePhotoSettingsCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMPreparePhotoSettingsCommandDesiredConfiguration"));
    v6 = objc_claimAutoreleasedReturnValue();
    desiredGraphConfiguration = v5->__desiredGraphConfiguration;
    v5->__desiredGraphConfiguration = (CAMCaptureGraphConfiguration *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMPreparePhotoSettingsCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CAMPreparePhotoSettingsCommand _desiredGraphConfiguration](self, "_desiredGraphConfiguration", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CAMPreparePhotoSettingsCommandDesiredConfiguration"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMPreparePhotoSettingsCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[CAMPreparePhotoSettingsCommand _desiredGraphConfiguration](self, "_desiredGraphConfiguration");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

@end
