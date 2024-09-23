@implementation CAMStillImageCaptureRequest(CAMCaptureEngine)

- (void)_configurePhotoSettings:()CAMCaptureEngine shouldIgnoreInitiationSettingsProperties:context:.cold.1(unint64_t a1, NSObject *a2)
{
  __CFString *v2;
  int v3;
  __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (a1 > 2)
    v2 = 0;
  else
    v2 = off_1EA32FC48[a1];
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Cannot enable stereo capture because photoQualityPrioritization is set to %{public}@ (must be Quality)", (uint8_t *)&v3, 0xCu);
}

- (void)_configurePhotoSettings:()CAMCaptureEngine shouldIgnoreInitiationSettingsProperties:context:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Failed to find a defaultRawThumbnailFormat for the rawEmbeddedThumbnailPhotoFormat", a5, a6, a7, a8, 0);
}

- (void)_configurePhotoSettings:()CAMCaptureEngine shouldIgnoreInitiationSettingsProperties:context:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Failed to find a embeddedThumbnailCodec for the embeddedThumbnailFormat", a5, a6, a7, a8, 0);
}

@end
