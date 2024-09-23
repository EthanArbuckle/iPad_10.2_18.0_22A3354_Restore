@implementation DAEventDeviceBluetoothPairingRequest

- (DAEventDeviceBluetoothPairingRequest)initWithEventType:(int64_t)a3 pairingInfo:(id)a4
{
  id v6;
  DAEventDeviceBluetoothPairingRequest *v7;
  DAEventDeviceBluetoothPairingRequest *v8;
  DAEventDeviceBluetoothPairingRequest *v9;

  v6 = a4;
  v7 = -[DAEvent initWithEventType:](self, "initWithEventType:", 55);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_pairingInfo, a4);
    v9 = v8;
  }

  return v8;
}

- (DAEventDeviceBluetoothPairingRequest)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DAEventDeviceBluetoothPairingRequest *v7;
  DAEventDeviceBluetoothPairingRequest *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DAEventDeviceBluetoothPairingRequest;
  v7 = -[DAEvent initWithXPCObject:error:](&v10, sel_initWithXPCObject_error_, v6, a4);
  if (v7 && (objc_opt_class(), CUXPCDecodeObject()))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DAEventDeviceBluetoothPairingRequest;
  v3 = a3;
  -[DAEvent encodeWithXPCObject:](&v4, sel_encodeWithXPCObject_, v3);
  CUXPCEncodeObject();

}

- (id)descriptionWithLevel:(int)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  if ((a3 & 0x8000000) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v3 = 0;
  }
  CUAppendF();
  v4 = (__CFString *)v3;

  v5 = &stru_24D169BB8;
  if (v4)
    v5 = v4;
  v6 = v5;

  return v6;
}

- (DABluetoothPairingInfo)pairingInfo
{
  return self->_pairingInfo;
}

- (void)setPairingInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingInfo, 0);
}

@end
