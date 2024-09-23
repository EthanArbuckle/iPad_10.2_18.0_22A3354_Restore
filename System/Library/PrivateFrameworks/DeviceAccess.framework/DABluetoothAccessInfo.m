@implementation DABluetoothAccessInfo

- (DABluetoothAccessInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DABluetoothAccessInfo *v7;
  DABluetoothAccessInfo *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DABluetoothAccessInfo;
  v7 = -[DABluetoothAccessInfo init](&v17, sel_init);
  if (!v7)
  {
    if (a4)
    {
      v10 = objc_opt_class();
      DAErrorF(350001, (uint64_t)"%@ super init failed", v11, v12, v13, v14, v15, v16, v10);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
LABEL_7:
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (!CUXPCDecodeNSArrayOfClass())
    goto LABEL_7;
  v8 = v7;
LABEL_4:

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
  CUXPCEncodeNSArrayOfObjects();
}

- (id)description
{
  return -[DABluetoothAccessInfo descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  __CFString *v4;
  NSArray *bluetoothDevices;
  NSArray *v6;
  __CFString *v7;
  NSArray *bluetoothScanCompanyIdentifiers;
  NSArray *v9;
  __CFString *v10;
  NSArray *bluetoothScanServices;
  NSArray *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v17;
  void *v18;
  void *v19;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v4 = (__CFString *)0;
  }
  bluetoothDevices = self->_bluetoothDevices;
  if (bluetoothDevices)
  {
    v6 = bluetoothDevices;
    CUPrintNSObjectOneLine();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v7 = v4;

    v4 = v7;
  }
  bluetoothScanCompanyIdentifiers = self->_bluetoothScanCompanyIdentifiers;
  if (bluetoothScanCompanyIdentifiers)
  {
    v9 = bluetoothScanCompanyIdentifiers;
    CUPrintNSObjectOneLine();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v10 = v4;

    v4 = v10;
  }
  bluetoothScanServices = self->_bluetoothScanServices;
  if (bluetoothScanServices)
  {
    v12 = bluetoothScanServices;
    CUPrintNSObjectOneLine();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v13 = v4;

    v4 = v13;
  }
  v14 = &stru_24D169BB8;
  if (v4)
    v14 = v4;
  v15 = v14;

  return v15;
}

- (NSArray)bluetoothDevices
{
  return self->_bluetoothDevices;
}

- (void)setBluetoothDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)bluetoothScanCompanyIdentifiers
{
  return self->_bluetoothScanCompanyIdentifiers;
}

- (NSArray)bluetoothScanServices
{
  return self->_bluetoothScanServices;
}

- (void)setBluetoothScanServices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothScanServices, 0);
  objc_storeStrong((id *)&self->_bluetoothScanCompanyIdentifiers, 0);
  objc_storeStrong((id *)&self->_bluetoothDevices, 0);
}

@end
