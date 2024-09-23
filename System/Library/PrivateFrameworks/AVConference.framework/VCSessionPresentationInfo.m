@implementation VCSessionPresentationInfo

- (VCSessionPresentationInfo)init
{
  VCSessionPresentationInfo *v2;
  VCSessionPresentationInfo *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCSessionPresentationInfo;
  v2 = -[VCSessionPresentationInfo init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_hasPendingChanges = 0;
    v2->_displayID = 0;
    -[VCSessionPresentationInfo setDisplayID:](v2, "setDisplayID:", 0);
  }
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("displayRect=[%.0f, %.0f, %.0f, %.0f] layout=%u state=%u"), *(_QWORD *)&self->_appWindowRect.origin.x, *(_QWORD *)&self->_appWindowRect.origin.y, *(_QWORD *)&self->_appWindowRect.size.width, *(_QWORD *)&self->_appWindowRect.size.height, self->_uiLayout, self->_uiState);
}

- (void)setDisplayID:(unsigned int)a3
{
  self->_displaySize.width = (double)-[VCHardwareSettingsEmbedded screenWidth](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "screenWidth");
  self->_displaySize.height = (double)-[VCHardwareSettingsEmbedded screenHeight](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "screenHeight");
  self->_displayID = a3;
}

+ (unsigned)layoutWithAVCLayout:(unsigned int)a3
{
  return 0;
}

+ (unsigned)avcLayoutWithLayout:(unsigned int)a3
{
  return 0;
}

+ (unsigned)uiStateWithAVCUIState:(unsigned __int8)a3
{
  if (a3 >= 4u)
    return 0;
  else
    return a3;
}

+ (unsigned)avcUIStateWithUIState:(unsigned __int8)a3
{
  if (a3 >= 4u)
    return 0;
  else
    return a3;
}

+ (unsigned)metadataSateWithUIState:(unsigned __int8)a3
{
  return a3 != 2;
}

- (id)serialize
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, v5);
  if (v5[0])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionPresentationInfo serialize].cold.1();
    }
  }
  else
  {
    self->_hasPendingChanges = 0;
  }
  return v3;
}

- (void)unserialize:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v4 = objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), a3, &v15);
  if (v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionPresentationInfo unserialize:].cold.1();
    }
  }
  else
  {
    v5 = v4;
    if (*(_DWORD *)(v4 + 8) != self->_displayID)
    {
      -[VCSessionPresentationInfo setDisplayID:](self, "setDisplayID:");
      self->_hasPendingChanges = 1;
    }
    v6 = *(_DWORD *)(v5 + 64);
    if (v6 != self->_uiLayout)
    {
      self->_uiLayout = v6;
      self->_hasPendingChanges = 1;
    }
    v7 = *(unsigned __int8 *)(v5 + 68);
    if (v7 != self->_uiState)
    {
      self->_uiState = v7;
      self->_hasPendingChanges = 1;
    }
    v8 = *(double *)(v5 + 32);
    if (v8 != self->_appWindowRect.origin.x)
    {
      self->_appWindowRect.origin.x = v8;
      self->_hasPendingChanges = 1;
    }
    v9 = *(double *)(v5 + 40);
    if (v9 != self->_appWindowRect.origin.y)
    {
      self->_appWindowRect.origin.y = v9;
      self->_hasPendingChanges = 1;
    }
    v10 = *(double *)(v5 + 48);
    if (v10 != self->_appWindowRect.size.width)
    {
      self->_appWindowRect.size.width = v10;
      self->_hasPendingChanges = 1;
    }
    v11 = *(double *)(v5 + 56);
    if (v11 != self->_appWindowRect.size.height)
    {
      self->_appWindowRect.size.height = v11;
      self->_hasPendingChanges = 1;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = -[VCSessionPresentationInfo description](self, "description");
        *(_DWORD *)buf = 136315906;
        v17 = v12;
        v18 = 2080;
        v19 = "-[VCSessionPresentationInfo unserialize:]";
        v20 = 1024;
        v21 = 157;
        v22 = 2112;
        v23 = v14;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [AVC SPATIAL AUDIO] Updated presentation info: %@", buf, 0x26u);
      }
    }
  }
}

- (tagAVCSessionPresentationInfo)avcSessionPresentationInfo
{
  CGSize size;
  tagAVCSessionPresentationInfo *result;

  size = self->_appWindowRect.size;
  retstr->var0.origin = self->_appWindowRect.origin;
  retstr->var0.size = size;
  retstr->var1 = self->_displayID;
  retstr->var2 = +[VCSessionPresentationInfo avcLayoutWithLayout:](VCSessionPresentationInfo, "avcLayoutWithLayout:", self->_uiLayout);
  result = (tagAVCSessionPresentationInfo *)+[VCSessionPresentationInfo avcUIStateWithUIState:](VCSessionPresentationInfo, "avcUIStateWithUIState:", self->_uiState);
  retstr->var3 = result;
  return result;
}

- (void)setAvcSessionPresentationInfo:(tagAVCSessionPresentationInfo *)a3
{
  int v5;
  unsigned int v6;
  double y;
  double width;
  double height;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  VCSessionPresentationInfo *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = +[VCSessionPresentationInfo uiStateWithAVCUIState:](VCSessionPresentationInfo, "uiStateWithAVCUIState:", a3->var3);
  v6 = +[VCSessionPresentationInfo layoutWithAVCLayout:](VCSessionPresentationInfo, "layoutWithAVCLayout:", a3->var2);
  if (a3->var1 != self->_displayID)
  {
    -[VCSessionPresentationInfo setDisplayID:](self, "setDisplayID:");
    self->_hasPendingChanges = 1;
  }
  if (a3->var0.origin.x != self->_appWindowRect.origin.x)
  {
    self->_appWindowRect.origin.x = a3->var0.origin.x;
    self->_hasPendingChanges = 1;
  }
  y = a3->var0.origin.y;
  if (y != self->_appWindowRect.origin.y)
  {
    self->_appWindowRect.origin.y = y;
    self->_hasPendingChanges = 1;
  }
  width = a3->var0.size.width;
  if (width != self->_appWindowRect.size.width)
  {
    self->_appWindowRect.size.width = width;
    self->_hasPendingChanges = 1;
  }
  height = a3->var0.size.height;
  if (height != self->_appWindowRect.size.height)
  {
    self->_appWindowRect.size.height = height;
    self->_hasPendingChanges = 1;
  }
  if (v6 != self->_uiLayout)
  {
    self->_uiLayout = v6;
    self->_hasPendingChanges = 1;
  }
  if (v5 != self->_uiState)
  {
    self->_uiState = v5;
    self->_hasPendingChanges = 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315906;
      v13 = v10;
      v14 = 2080;
      v15 = "-[VCSessionPresentationInfo setAvcSessionPresentationInfo:]";
      v16 = 1024;
      v17 = 188;
      v18 = 2112;
      v19 = self;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [AVC SPATIAL AUDIO] %@", (uint8_t *)&v12, 0x26u);
    }
  }
}

- (const)metadataGlobalInfo
{
  VCSessionPresentationInfo *v2;
  unsigned int displayID;
  float32x2_t v4;
  unsigned int v5;
  float32x4_t v7;

  v2 = self;
  displayID = self->_displayID;
  v7 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)self->_displaySize), (float64x2_t)self->_appWindowRect.size);
  v4 = vcvt_f32_f64((float64x2_t)self->_appWindowRect.origin);
  v5 = +[VCSessionPresentationInfo metadataSateWithUIState:](VCSessionPresentationInfo, "metadataSateWithUIState:", self->_uiState);
  v2->_metadataGlobalInfo.displayID = displayID;
  v2 = (VCSessionPresentationInfo *)((char *)v2 + 72);
  *(float32x4_t *)((char *)&v2->super.isa + 4) = v7;
  *(float32x2_t *)((char *)&v2->_displaySize.width + 4) = v4;
  HIDWORD(v2->_displaySize.height) = 0;
  LODWORD(v2->_appWindowRect.origin.x) = v5;
  return (const tagVCSpatialAudioMetadataGlobalInfo *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t displayID;
  uint64_t uiLayout;

  x = self->_appWindowRect.origin.x;
  if (x != 0.0)
  {
    *(float *)&x = x;
    objc_msgSend(a3, "encodeFloat:forKey:", kVCSessionPresentationInfoAppWindowRectX, x);
  }
  y = self->_appWindowRect.origin.y;
  if (y != 0.0)
  {
    *(float *)&y = y;
    objc_msgSend(a3, "encodeFloat:forKey:", kVCSessionPresentationInfoAppWindowRectY, y);
  }
  width = self->_appWindowRect.size.width;
  *(float *)&width = width;
  objc_msgSend(a3, "encodeFloat:forKey:", kVCSessionPresentationInfoAppWindowRectW, width);
  height = self->_appWindowRect.size.height;
  *(float *)&height = height;
  objc_msgSend(a3, "encodeFloat:forKey:", kVCSessionPresentationInfoAppWindowRectH, height);
  displayID = self->_displayID;
  if ((_DWORD)displayID)
    objc_msgSend(a3, "encodeInt32:forKey:", displayID, kVCSessionPresentationInfoDisplayID);
  uiLayout = self->_uiLayout;
  if ((_DWORD)uiLayout)
    objc_msgSend(a3, "encodeInt32:forKey:", uiLayout, kVCSessionPresentationInfoUILayout);
  if (self->_uiState)
    objc_msgSend(a3, "encodeInt32:forKey:");
}

- (VCSessionPresentationInfo)initWithCoder:(id)a3
{
  VCSessionPresentationInfo *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VCSessionPresentationInfo;
  v4 = -[VCSessionPresentationInfo init](&v10, sel_init);
  if (v4)
  {
    if (objc_msgSend(a3, "containsValueForKey:", kVCSessionPresentationInfoAppWindowRectX))
    {
      objc_msgSend(a3, "decodeFloatForKey:", kVCSessionPresentationInfoAppWindowRectX);
      v4->_appWindowRect.origin.x = v5;
    }
    if (objc_msgSend(a3, "containsValueForKey:", kVCSessionPresentationInfoAppWindowRectY))
    {
      objc_msgSend(a3, "decodeFloatForKey:", kVCSessionPresentationInfoAppWindowRectY);
      v4->_appWindowRect.origin.y = v6;
    }
    if (objc_msgSend(a3, "containsValueForKey:", kVCSessionPresentationInfoAppWindowRectW))
    {
      objc_msgSend(a3, "decodeFloatForKey:", kVCSessionPresentationInfoAppWindowRectW);
      v4->_appWindowRect.size.width = v7;
    }
    if (objc_msgSend(a3, "containsValueForKey:", kVCSessionPresentationInfoAppWindowRectH))
    {
      objc_msgSend(a3, "decodeFloatForKey:", kVCSessionPresentationInfoAppWindowRectH);
      v4->_appWindowRect.size.height = v8;
    }
    if (objc_msgSend(a3, "containsValueForKey:", kVCSessionPresentationInfoDisplayID))
      v4->_displayID = objc_msgSend(a3, "decodeInt32ForKey:", kVCSessionPresentationInfoDisplayID);
    if (objc_msgSend(a3, "containsValueForKey:", kVCSessionPresentationInfoUILayout))
      v4->_uiLayout = objc_msgSend(a3, "decodeInt32ForKey:", kVCSessionPresentationInfoUILayout);
    if (objc_msgSend(a3, "containsValueForKey:", kVCSessionPresentationInfoUIState))
      v4->_uiState = objc_msgSend(a3, "decodeInt32ForKey:", kVCSessionPresentationInfoUIState);
  }
  return v4;
}

- (BOOL)hasPendingChanges
{
  return self->_hasPendingChanges;
}

- (unsigned)uiState
{
  return self->_uiState;
}

- (void)serialize
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to serialize. error=%@");
}

- (void)unserialize:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d [AVC SPATIAL AUDIO] Failed to serialize. error=%@");
}

@end
