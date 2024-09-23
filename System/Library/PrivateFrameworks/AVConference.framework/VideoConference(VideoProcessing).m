@implementation VideoConference(VideoProcessing)

- (void)onVideoFrame:()VideoProcessing frameTime:attribute:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d VideoConference: onCaptureFrame failed to acquire rdlock, FRAME SKIPPED", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)avConferencePreviewError:()VideoProcessing .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_14_2();
  v12 = *MEMORY[0x1E0C80C00];
  if (v3)
    objc_msgSend((id)OUTLINED_FUNCTION_43(v2, v3), "UTF8String");
  v7 = 136315906;
  v8 = v1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9();
  v9 = 4288;
  v10 = v4;
  v11 = v5;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v6, "VideoConference [%s] %s:%d VideoConference: received error from camera: %s", (uint8_t *)&v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)avConferenceScreenCaptureError:()VideoProcessing .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_14_2();
  v7 = *MEMORY[0x1E0C80C00];
  if (v3)
    objc_msgSend((id)OUTLINED_FUNCTION_43(v2, v3), "UTF8String");
  v5 = 136315906;
  v6 = v1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_14_8();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v4, "VideoConference [%s] %s:%d VideoConference: received error from Screen Capture: %s", (uint8_t *)&v5);
  OUTLINED_FUNCTION_3_0();
}

- (void)avConferenceScreenCaptureError:()VideoProcessing .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14_2();
  v6 = *MEMORY[0x1E0C80C00];
  if (v3)
    objc_msgSend((id)OUTLINED_FUNCTION_43(v2, v3), "UTF8String");
  v4 = 136315906;
  v5 = v1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_14_8();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, "VideoConference [%s] %s:%d VideoConference: received error from Screen Capture: %s", (uint8_t *)&v4, 0x26u);
  OUTLINED_FUNCTION_3_0();
}

@end
