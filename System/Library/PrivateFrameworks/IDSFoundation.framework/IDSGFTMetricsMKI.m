@implementation IDSGFTMetricsMKI

- (void)receivedFromPush
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("recvPush"), v2);
}

- (void)receivedFromQR
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("recvQR"), v2);
}

- (void)receivedFromRatcheting
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("recvRcht"), v2);
}

- (void)receivedFromGFT2
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("recvGFT2"), v2);
}

- (void)receivedFirstPacketTime:(double)a3
{
  MEMORY[0x1E0DE7D20](self, sel_event_time_, CFSTR("pkt"), a3);
}

@end
