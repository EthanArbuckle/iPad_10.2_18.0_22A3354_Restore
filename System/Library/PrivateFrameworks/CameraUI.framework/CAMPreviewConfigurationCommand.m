@implementation CAMPreviewConfigurationCommand

- (CAMPreviewConfigurationCommand)initWithPreviewConfiguration:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  CAMPreviewLayerEnabledCommand *v6;
  CAMEffectsPreviewVideoDataOutputEnabledCommand *v7;
  CAMVideoThumbnailOutputEnabledCommand *v8;
  void *v9;
  CAMPreviewConfigurationCommand *v10;
  objc_super v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = (a3 >> 1) & 1;
  v5 = (a3 >> 2) & 1;
  v6 = -[CAMPreviewLayerEnabledCommand initWithPreviewLayerEnabled:]([CAMPreviewLayerEnabledCommand alloc], "initWithPreviewLayerEnabled:", a3 & 1);
  v7 = -[CAMEffectsPreviewVideoDataOutputEnabledCommand initWithVideoDataOutputEnabled:]([CAMEffectsPreviewVideoDataOutputEnabledCommand alloc], "initWithVideoDataOutputEnabled:", v4);
  v8 = -[CAMVideoThumbnailOutputEnabledCommand initWithVideoThumbnailOutputEnabled:]([CAMVideoThumbnailOutputEnabledCommand alloc], "initWithVideoThumbnailOutputEnabled:", v5);
  v13[0] = v6;
  v13[1] = v7;
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)CAMPreviewConfigurationCommand;
  v10 = -[CAMCaptureCommand initWithSubcommands:](&v12, sel_initWithSubcommands_, v9);

  return v10;
}

@end
