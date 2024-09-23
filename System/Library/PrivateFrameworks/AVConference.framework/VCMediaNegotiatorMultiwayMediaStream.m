@implementation VCMediaNegotiatorMultiwayMediaStream

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setSsrc:", self->_ssrc);
    objc_msgSend(v5, "setMaxNetworkBitrate:", self->_maxNetworkBitrate);
    objc_msgSend(v5, "setMaxMediaBitrate:", self->_maxMediaBitrate);
    objc_msgSend(v5, "setMaxPacketsPerSecond:", self->_maxPacketsPerSecond);
    objc_msgSend(v5, "setStreamID:", self->_streamID);
    objc_msgSend(v5, "setIsSubstream:", self->_isSubstream);
    objc_msgSend(v5, "setQualityIndex:", self->_qualityIndex);
    objc_msgSend(v5, "setHasRepairedStreamID:", self->_hasRepairedStreamID);
    objc_msgSend(v5, "setRepairedStreamID:", self->_repairedStreamID);
    objc_msgSend(v5, "setRepairedMaxNetworkBitrate:", self->_repairedMaxNetworkBitrate);
    objc_msgSend(v5, "setV2StreamID:", self->_v2StreamID);
    objc_msgSend(v5, "setHasV2StreamID:", self->_hasV2StreamID);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  int hasRepairedStreamID;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (objc_msgSend(a3, "ssrc") != self->_ssrc)
    return 0;
  if (objc_msgSend(a3, "maxNetworkBitrate") != self->_maxNetworkBitrate)
    return 0;
  if (objc_msgSend(a3, "maxMediaBitrate") != self->_maxMediaBitrate)
    return 0;
  if (objc_msgSend(a3, "maxPacketsPerSecond") != self->_maxPacketsPerSecond)
    return 0;
  if (objc_msgSend(a3, "streamID") != self->_streamID)
    return 0;
  if (self->_isSubstream != objc_msgSend(a3, "isSubstream"))
    return 0;
  if (objc_msgSend(a3, "qualityIndex") != self->_qualityIndex)
    return 0;
  if (objc_msgSend(a3, "v2StreamID") != self->_v2StreamID)
    return 0;
  if (self->_hasV2StreamID != objc_msgSend(a3, "hasV2StreamID"))
    return 0;
  v5 = objc_msgSend(a3, "hasRepairedStreamID");
  hasRepairedStreamID = self->_hasRepairedStreamID;
  if (hasRepairedStreamID != v5)
    return 0;
  if (self->_hasV2StreamID)
  {
    if (objc_msgSend(a3, "v2StreamID") != self->_v2StreamID)
      return 0;
    hasRepairedStreamID = self->_hasRepairedStreamID;
  }
  return !hasRepairedStreamID
      || objc_msgSend(a3, "repairedStreamID") == self->_repairedStreamID
      && objc_msgSend(a3, "repairedMaxNetworkBitrate") == self->_repairedMaxNetworkBitrate;
}

- (unsigned)ssrc
{
  return self->_ssrc;
}

- (void)setSsrc:(unsigned int)a3
{
  self->_ssrc = a3;
}

- (unsigned)maxNetworkBitrate
{
  return self->_maxNetworkBitrate;
}

- (void)setMaxNetworkBitrate:(unsigned int)a3
{
  self->_maxNetworkBitrate = a3;
}

- (unsigned)maxMediaBitrate
{
  return self->_maxMediaBitrate;
}

- (void)setMaxMediaBitrate:(unsigned int)a3
{
  self->_maxMediaBitrate = a3;
}

- (unsigned)maxPacketsPerSecond
{
  return self->_maxPacketsPerSecond;
}

- (void)setMaxPacketsPerSecond:(unsigned int)a3
{
  self->_maxPacketsPerSecond = a3;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned __int16)a3
{
  self->_streamID = a3;
}

- (BOOL)isSubstream
{
  return self->_isSubstream;
}

- (void)setIsSubstream:(BOOL)a3
{
  self->_isSubstream = a3;
}

- (unsigned)qualityIndex
{
  return self->_qualityIndex;
}

- (void)setQualityIndex:(unsigned int)a3
{
  self->_qualityIndex = a3;
}

- (BOOL)hasRepairedStreamID
{
  return self->_hasRepairedStreamID;
}

- (void)setHasRepairedStreamID:(BOOL)a3
{
  self->_hasRepairedStreamID = a3;
}

- (unsigned)repairedStreamID
{
  return self->_repairedStreamID;
}

- (void)setRepairedStreamID:(unsigned __int16)a3
{
  self->_repairedStreamID = a3;
}

- (unsigned)repairedMaxNetworkBitrate
{
  return self->_repairedMaxNetworkBitrate;
}

- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3
{
  self->_repairedMaxNetworkBitrate = a3;
}

- (unsigned)v2StreamID
{
  return self->_v2StreamID;
}

- (void)setV2StreamID:(unsigned __int16)a3
{
  self->_v2StreamID = a3;
}

- (BOOL)hasV2StreamID
{
  return self->_hasV2StreamID;
}

- (void)setHasV2StreamID:(BOOL)a3
{
  self->_hasV2StreamID = a3;
}

@end
