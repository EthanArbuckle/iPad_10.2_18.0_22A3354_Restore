@implementation CABTMIDIIncompleteConnectionInfo

- (CABTMIDIIncompleteConnectionInfo)initWithPeripheral:(id)a3 isConnecting:(BOOL)a4
{
  _BOOL8 v4;
  CABTMIDIIncompleteConnectionInfo *v6;
  CABTMIDIIncompleteConnectionInfo *v7;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CABTMIDIIncompleteConnectionInfo;
  v6 = -[CABTMIDIIncompleteConnectionInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[CABTMIDIIncompleteConnectionInfo setConnecting:](v6, "setConnecting:", v4);
    -[CABTMIDIIncompleteConnectionInfo setPeripheral:](v7, "setPeripheral:", a3);
    -[CABTMIDIIncompleteConnectionInfo setTimeOutInterval:](v7, "setTimeOutInterval:", 10);
    objc_msgSend(a3, "setChangingState:", 1);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CABTMIDIIncompleteConnectionInfo;
  -[CABTMIDIIncompleteConnectionInfo dealloc](&v3, sel_dealloc);
}

- (void)setPeripheral:(id)a3
{
  id v5;
  AMSBTLEPeripheral *peripheral;

  v5 = a3;
  peripheral = self->_peripheral;
  if (peripheral)

  self->_peripheral = (AMSBTLEPeripheral *)a3;
}

- (BOOL)isConnecting
{
  return self->_connecting;
}

- (void)setConnecting:(BOOL)a3
{
  self->_connecting = a3;
}

- (unint64_t)timeOutInterval
{
  return self->_timeOutInterval;
}

- (void)setTimeOutInterval:(unint64_t)a3
{
  self->_timeOutInterval = a3;
}

- (AMSBTLEPeripheral)peripheral
{
  return self->_peripheral;
}

@end
