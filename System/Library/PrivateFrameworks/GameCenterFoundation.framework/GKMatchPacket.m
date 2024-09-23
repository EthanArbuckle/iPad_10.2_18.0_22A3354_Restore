@implementation GKMatchPacket

- (GKMatchPacket)init
{
  GKMatchPacket *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKMatchPacket;
  result = -[GKMatchPacket init](&v3, sel_init);
  if (result)
    result->_version = 1;
  return result;
}

- (GKMatchPacket)initWithMessage:(id)a3
{
  id v4;
  GKMatchPacket *v5;
  GKMatchPacket *v6;
  id v7;
  unsigned __int8 *v8;
  unsigned int v9;
  unsigned __int16 *v10;
  unsigned int v11;
  int v12;
  int v13;
  void *v14;

  v4 = a3;
  v5 = -[GKMatchPacket init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[GKMatchPacket setValid:](v5, "setValid:", 1);
    v7 = objc_retainAutorelease(v4);
    v8 = (unsigned __int8 *)objc_msgSend(v7, "bytes");
    if ((unint64_t)objc_msgSend(v7, "length") <= 0xB)
      -[GKMatchPacket setValid:](v6, "setValid:", 0);
    if (-[GKMatchPacket valid](v6, "valid"))
    {
      -[GKMatchPacket setVersion:](v6, "setVersion:", *v8);
      -[GKMatchPacket setPacketType:](v6, "setPacketType:", v8[1]);
      -[GKMatchPacket setSequenceNumber:](v6, "setSequenceNumber:", *(unsigned int *)(v8 + 2));
      -[GKMatchPacket setTotalLength:](v6, "setTotalLength:", *(unsigned int *)(v8 + 6));
      v9 = -[GKMatchPacket totalLength](v6, "totalLength");
      if (objc_msgSend(v7, "length") != v9)
        -[GKMatchPacket setValid:](v6, "setValid:", 0);
      v10 = (unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
      v11 = 0;
      v12 = 12;
      do
      {
        v13 = *v10++;
        v11 += v13;
        v12 -= 2;
      }
      while ((_WORD)v12);
      if (v11 >= 0x10000)
      {
        do
          v11 = HIWORD(v11) + (unsigned __int16)v11;
        while (HIWORD(v11));
      }
      if (v11 != 0xFFFF)
        -[GKMatchPacket setValid:](v6, "setValid:", 0);
      v8 += 12;
    }
    if (-[GKMatchPacket valid](v6, "valid"))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, -[GKMatchPacket totalLength](v6, "totalLength") - 12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKMatchPacket setData:](v6, "setData:", v14);

    }
    else
    {
      -[GKMatchPacket setData:](v6, "setData:", v7);
    }
  }

  return v6;
}

- (id)message
{
  void *v3;
  id v4;
  unsigned __int16 *v5;
  unsigned int v6;
  int v7;
  int v8;
  __int16 v10;

  self->_totalLength = -[NSData length](self->_data, "length") + 12;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendBytes:length:", &self->_version, 1);
  objc_msgSend(v3, "appendBytes:length:", &self->_packetType, 1);
  objc_msgSend(v3, "appendBytes:length:", &self->_sequenceNumber, 4);
  objc_msgSend(v3, "appendBytes:length:", &self->_totalLength, 4);
  v4 = objc_retainAutorelease(v3);
  v5 = (unsigned __int16 *)objc_msgSend(v4, "bytes");
  v6 = 0;
  v7 = 10;
  do
  {
    v8 = *v5++;
    v6 += v8;
    v7 -= 2;
  }
  while ((_WORD)v7);
  if (v6 >= 0x10000)
  {
    do
      v6 = HIWORD(v6) + (unsigned __int16)v6;
    while (HIWORD(v6));
  }
  v10 = ~(_WORD)v6;
  objc_msgSend(v4, "appendBytes:length:", &v10, 2);
  objc_msgSend(v4, "appendData:", self->_data);
  return v4;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int8)a3
{
  self->_version = a3;
}

- (unsigned)packetType
{
  return self->_packetType;
}

- (void)setPacketType:(unsigned __int8)a3
{
  self->_packetType = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (unsigned)totalLength
{
  return self->_totalLength;
}

- (void)setTotalLength:(unsigned int)a3
{
  self->_totalLength = a3;
}

- (unsigned)checksum
{
  return self->_checksum;
}

- (void)setChecksum:(unsigned __int16)a3
{
  self->_checksum = a3;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
