@implementation VideoConference(SessionDelegate)

- (void)session:()SessionDelegate didStart:connectionType:localInterfaceType:remoteInterfaceType:error:.cold.1()
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
  v9 = 3274;
  v10 = v4;
  v11 = v5;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v6, "VideoConference [%s] %s:%d VideoConference: didStart when call is not running? session %s", (uint8_t *)&v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)session:()SessionDelegate receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d VCVideoRelay enqueueFrame failed; self = %p",
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_3();
}

- (void)session:()SessionDelegate receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:.cold.2()
{
  __int16 v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  const char *v4;
  _BYTE v5[14];
  const char *v6;

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v5[6] = "-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withScreenAttributes:videoAt"
                      "tributes:isFirstFrame:isVideoPaused:]";
  LODWORD(v6) = 3495;
  WORD2(v6) = v0;
  HIWORD(v6) = v1;
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v2, v3, "VideoConference [%s] %s:%d FigImageQueueEnqueueImage skipped [remote - %s] queue full!", v4, *(const char **)v5, (unint64_t)"-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]" >> 16, v6);
  OUTLINED_FUNCTION_3();
}

- (void)session:()SessionDelegate receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d VideoConference: no image queue/layer to draw to... This should be reported!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)session:()SessionDelegate receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:.cold.4()
{
  __int16 v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  const char *v4;
  _BYTE v5[14];
  const char *v6;

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v5[6] = "-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withScreenAttributes:videoAt"
                      "tributes:isFirstFrame:isVideoPaused:]";
  LODWORD(v6) = 3475;
  WORD2(v6) = v0;
  HIWORD(v6) = v1;
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v2, v3, "VideoConference [%s] %s:%d FigImageQueueEnqueueImage [remote - %s] queue", v4, *(const char **)v5, (unint64_t)"-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]" >> 16, v6);
  OUTLINED_FUNCTION_3();
}

- (void)session:()SessionDelegate startVideoSend:captureRuleWifi:captureRuleCell:interface:isUnpausing:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d registerForVideoFramesWithDeviceRole failed; self = %p",
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_3();
}

- (void)registerForVideoFramesWithDeviceRole:()SessionDelegate captureRule:isUnpausing:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d VCVideoRelay registerForVideoFrames failed; self = %p",
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_3();
}

- (void)registerForVideoFramesWithDeviceRole:()SessionDelegate captureRule:isUnpausing:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d VCVideoCaptureServer registerForVideoFramesFromSource (VCCaptureSourceCamera) failed; self = %p",
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_3();
}

- (void)registerForVideoFramesWithDeviceRole:()SessionDelegate captureRule:isUnpausing:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d VCVideoCaptureServer registerForVideoFramesFromSource (VCCaptureSourceScreen) failed; self = %p",
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_3();
}

- (void)stopVideoSend:()SessionDelegate error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d deregisterForVideoFramesWithDeviceRole failed; self = %p",
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_3();
}

- (void)deregisterForVideoFramesWithDeviceRole:()SessionDelegate .cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d VCVideoRelay deregisterForVideoFrames failed; self = %p",
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_3();
}

- (void)deregisterForVideoFramesWithDeviceRole:()SessionDelegate .cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d VCVideoCaptureServer deregisterForVideoFramesFromSource (VCCaptureSourceScreen) failed; self = %p",
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_3();
}

- (void)deregisterForVideoFramesWithDeviceRole:()SessionDelegate .cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d VCVideoCaptureServer deregisterForVideoFramesFromSource (VCCaptureSourceCamera) failed; self = %p",
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_3();
}

@end
