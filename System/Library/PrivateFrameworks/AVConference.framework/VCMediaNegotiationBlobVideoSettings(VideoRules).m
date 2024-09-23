@implementation VCMediaNegotiationBlobVideoSettings(VideoRules)

- (void)initWithSSRC:()VideoRules allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create video rules media blob entries", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithScreenSSRC:()VideoRules allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:customVideoWidth:customVideoHeight:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:fecEnabled:rtxEnabled:blackFrameOnClearScreenEnabled:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create screen sharing media blob entries", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setVideoRuleCollections:()VideoRules featureStrings:isScreen:isCellular16x9Capable:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "unsignedIntValue");
  v7 = 136315906;
  v8 = a1;
  v9 = 2080;
  OUTLINED_FUNCTION_4_0();
  v10 = 367;
  v11 = v5;
  v12 = v6;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid parameter set for payload %u", (uint8_t *)&v7, 0x22u);
}

- (void)setVideoRuleCollections:()VideoRules featureStrings:isScreen:isCellular16x9Capable:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  int v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a2, "iWidth");
  v7 = objc_msgSend(a2, "iHeight");
  objc_msgSend(a2, "fRate");
  v10 = 136316418;
  v11 = a1;
  v12 = 2080;
  OUTLINED_FUNCTION_4_0();
  v13 = 504;
  v14 = v8;
  v15 = v6;
  v16 = v8;
  v17 = v7;
  v18 = 2048;
  v19 = v9;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to add video format to negotiation blob: %dx%d %f", (uint8_t *)&v10, 0x32u);
}

- (void)newVideoRuleCollectionsForScreen:()VideoRules isCellular16x9Capable:isLocalConfig:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[22];

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) newVideoRuleCollectionsForScreen:isCellular16x9"
                       "Capable:isLocalConfig:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, a2, a3, " [%s] %s:%d Failed to allocate video rule collection (screen=%d)", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCMediaNegotiationBlobVideoSettings(VideoRules) newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:]" >> 16, 555);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoRuleCollectionsForScreen:()VideoRules isCellular16x9Capable:isLocalConfig:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate video rules array (screen=%d)", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)newCameraConfiguration
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate videoFeatureStrings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newScreenConfigurationWithCameraConfiguration:()VideoRules .cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v3 = 708;
  v4 = 2112;
  v5 = v0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to copy cameraConfiguration=%@", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

@end
