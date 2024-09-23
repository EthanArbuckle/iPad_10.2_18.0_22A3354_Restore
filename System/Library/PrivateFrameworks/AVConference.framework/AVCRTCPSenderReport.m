@implementation AVCRTCPSenderReport

- (AVCRTCPSenderReport)initWithRTCPPacket:(tagRTCPPACKET *)a3
{
  AVCRTCPSenderReport *v5;
  AVCRTCPSenderReport *v6;
  __int16 v7;
  objc_super v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  _BYTE v13[1004];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(v13, 170, sizeof(v13));
  v9.receiver = self;
  v9.super_class = (Class)AVCRTCPSenderReport;
  v5 = -[AVCRTCPPacket initWithRTCPPacket:](&v9, sel_initWithRTCPPacket_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_NTPMostSignificantWord = a3->var1.var0.var1;
    v5->_NTPLeastSignificantWord = a3->var1.var0.var2;
    v5->_RTPTimestamp = a3->var1.var0.var3;
    v5->_packetsSent = a3->var1.var0.var4;
    v5->_octetsSent = a3->var1.var0.var5;
    if ((*(_BYTE *)&a3->var0 & 0x1F) != 0)
    {
      v7 = *(_QWORD *)&a3->var0 | 0xC900;
      v10 = *(_QWORD *)&a3->var0;
      LOWORD(v10) = v7;
      v11 = *(_OWORD *)&a3->var1.var22.var1.var0[16];
      v12 = *((_QWORD *)&a3->var1.var22 + 5);
      v5->_receiverReport = -[AVCRTCPReceiverReport initWithRTCPPacket:]([AVCRTCPReceiverReport alloc], "initWithRTCPPacket:", &v10);
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVCRTCPSenderReport;
  -[AVCRTCPSenderReport dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)AVCRTCPSenderReport;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, NTPMostSignificantWord:%u, NTPLeastSignificantWord:%u, RTPTimestamp:%u, packetsSent:%u, octetsSent:%u, receiverReport:%@"), -[AVCRTCPPacket description](&v3, sel_description), -[AVCRTCPSenderReport NTPMostSignificantWord](self, "NTPMostSignificantWord"), -[AVCRTCPSenderReport NTPLeastSignificantWord](self, "NTPLeastSignificantWord"), -[AVCRTCPSenderReport RTPTimestamp](self, "RTPTimestamp"), -[AVCRTCPSenderReport packetsSent](self, "packetsSent"), -[AVCRTCPSenderReport octetsSent](self, "octetsSent"), -[AVCRTCPSenderReport receiverReport](self, "receiverReport"));
}

- (unsigned)NTPMostSignificantWord
{
  return self->_NTPMostSignificantWord;
}

- (void)setNTPMostSignificantWord:(unsigned int)a3
{
  self->_NTPMostSignificantWord = a3;
}

- (unsigned)NTPLeastSignificantWord
{
  return self->_NTPLeastSignificantWord;
}

- (void)setNTPLeastSignificantWord:(unsigned int)a3
{
  self->_NTPLeastSignificantWord = a3;
}

- (unsigned)RTPTimestamp
{
  return self->_RTPTimestamp;
}

- (void)setRTPTimestamp:(unsigned int)a3
{
  self->_RTPTimestamp = a3;
}

- (unsigned)packetsSent
{
  return self->_packetsSent;
}

- (void)setPacketsSent:(unsigned int)a3
{
  self->_packetsSent = a3;
}

- (unsigned)octetsSent
{
  return self->_octetsSent;
}

- (void)setOctetsSent:(unsigned int)a3
{
  self->_octetsSent = a3;
}

- (AVCRTCPReceiverReport)receiverReport
{
  return self->_receiverReport;
}

- (void)setReceiverReport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
