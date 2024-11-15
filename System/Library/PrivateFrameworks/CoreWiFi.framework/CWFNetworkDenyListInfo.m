@implementation CWFNetworkDenyListInfo

- (CWFNetworkDenyListInfo)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CWFNetworkDenyListInfo;
  return -[CWFNetworkDenyListInfo init](&v3, sel_init);
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (int64_t)reasonData
{
  return self->_reasonData;
}

- (void)setReasonData:(int64_t)a3
{
  self->_reasonData = a3;
}

- (NSString)reasonString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReasonString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (double)reasonTimestamp
{
  return self->_reasonTimestamp;
}

- (void)setReasonTimestamp:(double)a3
{
  self->_reasonTimestamp = a3;
}

- (double)stateTimestamp
{
  return self->_stateTimestamp;
}

- (void)setStateTimestamp:(double)a3
{
  self->_stateTimestamp = a3;
}

- (NSString)BSSID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBSSID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)stateString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStateString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateString, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);
  objc_storeStrong((id *)&self->_reasonString, 0);
}

@end
