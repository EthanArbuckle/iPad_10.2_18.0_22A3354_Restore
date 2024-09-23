@implementation VCEmulatedPacket

- (VCEmulatedPacket)initWithPacketID:(unsigned int)a3
{
  VCEmulatedPacket *result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCEmulatedPacket;
  result = -[VCEmulatedPacket init](&v5, sel_init);
  if (result)
    result->_packetID = a3;
  return result;
}

- (VCEmulatedPacket)initWithPacketID:(unsigned int)a3 datagram:(char *)a4 datagramSize:(unsigned int)a5
{
  VCEmulatedPacket *v8;
  VCEmulatedPacket *v9;
  uint64_t v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  unsigned int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VCEmulatedPacket;
  v8 = -[VCEmulatedPacket init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_packetID = a3;
    v8->_size = a5;
    if (a4 && a5 < 0x5DD)
    {
      memcpy(v8->_datagram, a4, a5);
      v9->_datagramPtr = (char *)v9->_datagram;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v15 = v10;
          v16 = 2080;
          v17 = "-[VCEmulatedPacket initWithPacketID:datagram:datagramSize:]";
          v18 = 1024;
          v19 = 51;
          v20 = 2048;
          v21 = a4;
          v22 = 1024;
          v23 = a5;
          _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot create VCEmualtedPacket with datagram: %p, datagramSize: %d", buf, 0x2Cu);
        }
      }

      return 0;
    }
  }
  return v9;
}

- (unsigned)packetID
{
  return self->_packetID;
}

- (unsigned)size
{
  return self->_size;
}

- (void)setSize:(unsigned int)a3
{
  self->_size = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (double)arrivalTime
{
  return self->_arrivalTime;
}

- (void)setArrivalTime:(double)a3
{
  self->_arrivalTime = a3;
}

- (double)networkServiceTime
{
  return self->_networkServiceTime;
}

- (void)setNetworkServiceTime:(double)a3
{
  self->_networkServiceTime = a3;
}

- (double)departureTime
{
  return self->_departureTime;
}

- (void)setDepartureTime:(double)a3
{
  self->_departureTime = a3;
}

- (BOOL)isLost
{
  return self->_isLost;
}

- (void)setIsLost:(BOOL)a3
{
  self->_isLost = a3;
}

- (BOOL)isDroppedByAQM
{
  return self->_isDroppedByAQM;
}

- (void)setIsDroppedByAQM:(BOOL)a3
{
  self->_isDroppedByAQM = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (char)datagram
{
  return self->_datagramPtr;
}

- (void)setDatagram:(char *)a3
{
  self->_datagramPtr = a3;
}

- (tagIDSDatagramStruct)metadata
{
  tagIDSDatagramStruct *result;

  objc_copyStruct(retstr, &self->_metadata, 1640, 1, 0);
  return result;
}

- (void)setMetadata:(tagIDSDatagramStruct *)a3
{
  objc_copyStruct(&self->_metadata, a3, 1640, 1, 0);
}

@end
