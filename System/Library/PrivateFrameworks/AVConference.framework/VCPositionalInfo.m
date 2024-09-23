@implementation VCPositionalInfo

- (VCPositionalInfo)init
{
  VCPositionalInfo *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCPositionalInfo;
  result = -[VCPositionalInfo init](&v3, sel_init);
  if (result)
    result->_hasPendingChanges = 0;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inCanvas=%u size=[%f;%f] center=[%.0f;%.0f;%.02f] prominanceIndex=%d"),
               self->_isInCanvas,
               *(_QWORD *)&self->_size.width,
               *(_QWORD *)&self->_size.height,
               *(_QWORD *)&self->_x,
               *(_QWORD *)&self->_y,
               *(_QWORD *)&self->_z,
               self->_prominenceIndex);
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
        -[VCPositionalInfo serialize].cold.1();
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
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int v10;
  unsigned int v11;
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
        -[VCPositionalInfo unserialize:].cold.1();
    }
  }
  else
  {
    v5 = *(double *)(v4 + 32);
    if (v5 != self->_x)
    {
      self->_x = v5;
      self->_hasPendingChanges = 1;
    }
    v6 = *(double *)(v4 + 40);
    if (v6 != self->_y)
    {
      self->_y = v6;
      self->_hasPendingChanges = 1;
    }
    v7 = *(double *)(v4 + 48);
    if (v7 != self->_z)
    {
      self->_z = v7;
      self->_hasPendingChanges = 1;
    }
    v8 = *(double *)(v4 + 16);
    if (v8 != self->_size.width)
    {
      self->_size.width = v8;
      self->_hasPendingChanges = 1;
    }
    v9 = *(double *)(v4 + 24);
    if (v9 != self->_size.height)
    {
      self->_size.height = v9;
      self->_hasPendingChanges = 1;
    }
    v10 = *(unsigned __int8 *)(v4 + 8);
    if (v10 != self->_isInCanvas)
    {
      self->_isInCanvas = v10;
      self->_hasPendingChanges = 1;
    }
    v11 = *(_DWORD *)(v4 + 60);
    if (v11 != self->_prominenceIndex)
    {
      self->_prominenceIndex = v11;
      self->_hasPendingChanges = 1;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = -[VCPositionalInfo description](self, "description");
        *(_DWORD *)buf = 136315906;
        v17 = v12;
        v18 = 2080;
        v19 = "-[VCPositionalInfo unserialize:]";
        v20 = 1024;
        v21 = 81;
        v22 = 2112;
        v23 = v14;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [AVC SPATIAL AUDIO] unserialize done. %@", buf, 0x26u);
      }
    }
  }
}

- (const)metadataPositionalInfo
{
  const tagVCSpatialAudioMetadataPositionalInfo *result;
  float v3;
  unsigned int v4;

  *(float32x2_t *)&self->_metadataPositionalInfo.positionX = vcvt_f32_f64(*(float64x2_t *)&self->_x);
  result = &self->_metadataPositionalInfo;
  v3 = *(double *)&result[-1].positionZ;
  result->positionZ = v3;
  v4 = BYTE1(result[-1].isVisible);
  result->prominence = result[-1].isInCanvas;
  result->isVisible = v4;
  result->isInCanvas = LOBYTE(result[-3].isVisible);
  return result;
}

- (tagAVCPositionalInfo)avcPositionalInfo
{
  __int128 v3;

  retstr->var0 = LOBYTE(self->var1.width);
  v3 = *(_OWORD *)&self->var3;
  retstr->var1 = *(CGSize *)&self->var1.height;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = *(double *)&self[1].var0;
  return self;
}

- (void)setAvcPositionalInfo:(tagAVCPositionalInfo *)a3
{
  double var2;
  double var3;
  double var4;
  double width;
  double height;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  VCPositionalInfo *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  var2 = a3->var2;
  if (var2 != self->_x)
  {
    self->_x = var2;
    self->_hasPendingChanges = 1;
  }
  var3 = a3->var3;
  if (var3 != self->_y)
  {
    self->_y = var3;
    self->_hasPendingChanges = 1;
  }
  var4 = a3->var4;
  if (var4 != self->_z)
  {
    self->_z = var4;
    self->_hasPendingChanges = 1;
  }
  width = a3->var1.width;
  if (width != self->_size.width)
  {
    self->_size.width = width;
    self->_hasPendingChanges = 1;
  }
  height = a3->var1.height;
  if (height != self->_size.height)
  {
    self->_size.height = height;
    self->_hasPendingChanges = 1;
  }
  if ((a3->var0 & 1) != self->_isInCanvas)
  {
    self->_isInCanvas = a3->var0 & 1;
    self->_hasPendingChanges = 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315906;
      v12 = v9;
      v13 = 2080;
      v14 = "-[VCPositionalInfo setAvcPositionalInfo:]";
      v15 = 1024;
      v16 = 114;
      v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [AVC SPATIAL AUDIO] %@", (uint8_t *)&v11, 0x26u);
    }
  }
}

- (void)setProminenceIndex:(unsigned int)a3
{
  if (self->_prominenceIndex != a3)
  {
    self->_prominenceIndex = a3;
    self->_hasPendingChanges = 1;
  }
}

- (void)setIsVisible:(BOOL)a3
{
  if (self->_isVisible != a3)
  {
    self->_isVisible = a3;
    self->_hasPendingChanges = 1;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double x;
  double y;
  double z;
  CGFloat width;
  CGFloat height;
  uint64_t prominenceIndex;

  x = self->_x;
  *(float *)&x = x;
  objc_msgSend(a3, "encodeFloat:forKey:", kVCPositionalInfoTilePositionX, x);
  y = self->_y;
  *(float *)&y = y;
  objc_msgSend(a3, "encodeFloat:forKey:", kVCPositionalInfoTilePositionY, y);
  z = self->_z;
  if (z != 0.0)
  {
    *(float *)&z = z;
    objc_msgSend(a3, "encodeFloat:forKey:", kVCPositionalInfoTilePositionZ, z);
  }
  width = self->_size.width;
  *(float *)&width = width;
  objc_msgSend(a3, "encodeFloat:forKey:", kVCPositionalInfoTileWidth, width);
  height = self->_size.height;
  *(float *)&height = height;
  objc_msgSend(a3, "encodeFloat:forKey:", kVCPositionalInfoTileHeight, height);
  if (self->_isInCanvas)
    objc_msgSend(a3, "encodeBool:forKey:", 1, kVCPositionalInfoInCanvas);
  if (self->_isVisible)
    objc_msgSend(a3, "encodeBool:forKey:", 1, kVCPositionalInfoIsVisible);
  prominenceIndex = self->_prominenceIndex;
  if ((_DWORD)prominenceIndex)
    objc_msgSend(a3, "encodeInt32:forKey:", prominenceIndex, kVCPositionalInfoProminence);
}

- (VCPositionalInfo)initWithCoder:(id)a3
{
  VCPositionalInfo *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCPositionalInfo;
  v4 = -[VCPositionalInfo init](&v11, sel_init);
  if (v4)
  {
    if (objc_msgSend(a3, "containsValueForKey:", kVCPositionalInfoTilePositionX))
    {
      objc_msgSend(a3, "decodeFloatForKey:", kVCPositionalInfoTilePositionX);
      v4->_x = v5;
    }
    if (objc_msgSend(a3, "containsValueForKey:", kVCPositionalInfoTilePositionY))
    {
      objc_msgSend(a3, "decodeFloatForKey:", kVCPositionalInfoTilePositionY);
      v4->_y = v6;
    }
    if (objc_msgSend(a3, "containsValueForKey:", kVCPositionalInfoTilePositionZ))
    {
      objc_msgSend(a3, "decodeFloatForKey:", kVCPositionalInfoTilePositionZ);
      v4->_z = v7;
    }
    if (objc_msgSend(a3, "containsValueForKey:", kVCPositionalInfoTileWidth))
    {
      objc_msgSend(a3, "decodeFloatForKey:", kVCPositionalInfoTileWidth);
      v4->_size.width = v8;
    }
    if (objc_msgSend(a3, "containsValueForKey:", kVCPositionalInfoTileHeight))
    {
      objc_msgSend(a3, "decodeFloatForKey:", kVCPositionalInfoTileHeight);
      v4->_size.height = v9;
    }
    if (objc_msgSend(a3, "containsValueForKey:", kVCPositionalInfoInCanvas))
      v4->_isInCanvas = objc_msgSend(a3, "decodeBoolForKey:", kVCPositionalInfoInCanvas);
    if (objc_msgSend(a3, "containsValueForKey:", kVCPositionalInfoProminence))
      v4->_prominenceIndex = objc_msgSend(a3, "decodeInt32ForKey:", kVCPositionalInfoProminence);
    if (objc_msgSend(a3, "containsValueForKey:", kVCPositionalInfoIsVisible))
      v4->_isVisible = objc_msgSend(a3, "decodeBoolForKey:", kVCPositionalInfoIsVisible);
  }
  return v4;
}

- (BOOL)hasPendingChanges
{
  return self->_hasPendingChanges;
}

- (unsigned)prominenceIndex
{
  return self->_prominenceIndex;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (BOOL)isInCanvas
{
  return self->_isInCanvas;
}

- (void)setIsInCanvas:(BOOL)a3
{
  self->_isInCanvas = a3;
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
