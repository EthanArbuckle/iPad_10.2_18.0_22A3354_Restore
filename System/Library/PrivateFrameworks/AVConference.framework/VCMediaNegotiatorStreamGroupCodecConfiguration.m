@implementation VCMediaNegotiatorStreamGroupCodecConfiguration

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("codecType=%ld, rtpPayload=%d, cipherSuite=%d"), self->_codecType, self->_rtpPayload, self->_cipherSuite);
  v4 = v3;
  if (self->_pTime)
    objc_msgSend(v3, "appendFormat:", CFSTR(", pTime=%ld"), self->_pTime);
  if (self->_useInBandFEC)
    objc_msgSend(v4, "appendFormat:", CFSTR(", useInBandFEC"));
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = v5;
  if (self->_rtcpSREnabled)
    objc_msgSend(v5, "addObject:", CFSTR("SR"));
  if (self->_rtcpPSFB_PLIEnabled)
    objc_msgSend(v6, "addObject:", CFSTR("PLI"));
  if (self->_rtcpPSFB_FIREnabled)
    objc_msgSend(v6, "addObject:", CFSTR("FIR"));
  if (self->_rtcpRTPFB_GNACKEnabled)
    objc_msgSend(v6, "addObject:", CFSTR("GNACK"));
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v4, "appendFormat:", CFSTR(", rtcp=[%@]"), objc_msgSend(v6, "componentsJoinedByString:", CFSTR(",")));
  if (self->_encoderUsage)
    objc_msgSend(v4, "appendFormat:", CFSTR(", encoderUsage=%u"), self->_encoderUsage);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(a3, "codecType") == self->_codecType
      && objc_msgSend(a3, "rtpPayload") == self->_rtpPayload
      && objc_msgSend(a3, "pTime") == self->_pTime
      && self->_rtcpRTPFB_GNACKEnabled == objc_msgSend(a3, "rtcpRTPFB_GNACKEnabled")
      && self->_rtcpPSFB_PLIEnabled == objc_msgSend(a3, "rtcpPSFB_PLIEnabled")
      && self->_rtcpPSFB_FIREnabled == objc_msgSend(a3, "rtcpPSFB_FIREnabled")
      && self->_rtcpSREnabled == objc_msgSend(a3, "rtcpSREnabled")
      && self->_H264PacketizationMode == objc_msgSend(a3, "H264PacketizationMode")
      && self->_H264LevelAsymmetryAllowed == objc_msgSend(a3, "H264LevelAsymmetryAllowed")
      && self->_useInBandFEC == objc_msgSend(a3, "useInBandFEC")
      && objc_msgSend(a3, "profileLevelId") == self->_profileLevelId
      && objc_msgSend(a3, "cipherSuite") == self->_cipherSuite
      && objc_msgSend(a3, "encoderUsage") == self->_encoderUsage;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setCodecType:", self->_codecType);
    objc_msgSend(v5, "setRtpPayload:", self->_rtpPayload);
    objc_msgSend(v5, "setPTime:", self->_pTime);
    objc_msgSend(v5, "setRtcpRTPFB_GNACKEnabled:", self->_rtcpRTPFB_GNACKEnabled);
    objc_msgSend(v5, "setRtcpPSFB_PLIEnabled:", self->_rtcpPSFB_PLIEnabled);
    objc_msgSend(v5, "setRtcpPSFB_FIREnabled:", self->_rtcpPSFB_FIREnabled);
    objc_msgSend(v5, "setRtcpSREnabled:", self->_rtcpSREnabled);
    objc_msgSend(v5, "setH264LevelAsymmetryAllowed:", self->_H264LevelAsymmetryAllowed);
    objc_msgSend(v5, "setH264PacketizationMode:", self->_H264PacketizationMode);
    objc_msgSend(v5, "setUseInBandFEC:", self->_useInBandFEC);
    objc_msgSend(v5, "setProfileLevelId:", self->_profileLevelId);
    objc_msgSend(v5, "setSerializedSize:", self->_serializedSize);
    objc_msgSend(v5, "setCipherSuite:", self->_cipherSuite);
    objc_msgSend(v5, "setEncoderUsage:", self->_encoderUsage);
  }
  return v5;
}

- (int64_t)codecType
{
  return self->_codecType;
}

- (void)setCodecType:(int64_t)a3
{
  self->_codecType = a3;
}

- (unsigned)rtpPayload
{
  return self->_rtpPayload;
}

- (void)setRtpPayload:(unsigned int)a3
{
  self->_rtpPayload = a3;
}

- (unint64_t)pTime
{
  return self->_pTime;
}

- (void)setPTime:(unint64_t)a3
{
  self->_pTime = a3;
}

- (BOOL)rtcpRTPFB_GNACKEnabled
{
  return self->_rtcpRTPFB_GNACKEnabled;
}

- (void)setRtcpRTPFB_GNACKEnabled:(BOOL)a3
{
  self->_rtcpRTPFB_GNACKEnabled = a3;
}

- (BOOL)rtcpPSFB_PLIEnabled
{
  return self->_rtcpPSFB_PLIEnabled;
}

- (void)setRtcpPSFB_PLIEnabled:(BOOL)a3
{
  self->_rtcpPSFB_PLIEnabled = a3;
}

- (BOOL)rtcpPSFB_FIREnabled
{
  return self->_rtcpPSFB_FIREnabled;
}

- (void)setRtcpPSFB_FIREnabled:(BOOL)a3
{
  self->_rtcpPSFB_FIREnabled = a3;
}

- (BOOL)rtcpSREnabled
{
  return self->_rtcpSREnabled;
}

- (void)setRtcpSREnabled:(BOOL)a3
{
  self->_rtcpSREnabled = a3;
}

- (BOOL)H264LevelAsymmetryAllowed
{
  return self->_H264LevelAsymmetryAllowed;
}

- (void)setH264LevelAsymmetryAllowed:(BOOL)a3
{
  self->_H264LevelAsymmetryAllowed = a3;
}

- (BOOL)H264PacketizationMode
{
  return self->_H264PacketizationMode;
}

- (void)setH264PacketizationMode:(BOOL)a3
{
  self->_H264PacketizationMode = a3;
}

- (BOOL)useInBandFEC
{
  return self->_useInBandFEC;
}

- (void)setUseInBandFEC:(BOOL)a3
{
  self->_useInBandFEC = a3;
}

- (unint64_t)profileLevelId
{
  return self->_profileLevelId;
}

- (void)setProfileLevelId:(unint64_t)a3
{
  self->_profileLevelId = a3;
}

- (unint64_t)serializedSize
{
  return self->_serializedSize;
}

- (void)setSerializedSize:(unint64_t)a3
{
  self->_serializedSize = a3;
}

- (unsigned)cipherSuite
{
  return self->_cipherSuite;
}

- (void)setCipherSuite:(unsigned int)a3
{
  self->_cipherSuite = a3;
}

- (unsigned)encoderUsage
{
  return self->_encoderUsage;
}

- (void)setEncoderUsage:(unsigned int)a3
{
  self->_encoderUsage = a3;
}

@end
