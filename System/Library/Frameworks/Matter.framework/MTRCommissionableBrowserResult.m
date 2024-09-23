@implementation MTRCommissionableBrowserResult

- (NSString)instanceName
{
  return self->_instanceName;
}

- (void)setInstanceName:(id)a3
{
  objc_storeStrong((id *)&self->_instanceName, a3);
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
  objc_storeStrong((id *)&self->_vendorID, a3);
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
  objc_storeStrong((id *)&self->_productID, a3);
}

- (NSNumber)discriminator
{
  return self->_discriminator;
}

- (void)setDiscriminator:(id)a3
{
  objc_storeStrong((id *)&self->_discriminator, a3);
}

- (BOOL)commissioningMode
{
  return self->_commissioningMode;
}

- (void)setCommissioningMode:(BOOL)a3
{
  self->_commissioningMode = a3;
}

- (NSMutableDictionary)interfaces
{
  return self->_interfaces;
}

- (void)setInterfaces:(id)a3
{
  objc_storeStrong((id *)&self->_interfaces, a3);
}

- (Optional<chip::Controller::SetUpCodePairerParameters>)params
{
  uint64_t v2;
  _BOOL4 mHasValue;
  int instanceName_high;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  int v8;
  __int128 v9;

  mHasValue = self->_params.mHasValue;
  *(_BYTE *)v2 = mHasValue;
  if (mHasValue)
  {
    *(_OWORD *)(v2 + 8) = *(_OWORD *)&self[1].super.isa;
    instanceName_high = HIDWORD(self[1]._instanceName);
    *(_DWORD *)(v2 + 24) = self[1]._instanceName;
    *(_DWORD *)(v2 + 28) = instanceName_high;
    v5 = *(_OWORD *)&self[2]._commissioningMode;
    v6 = *(_OWORD *)&self[2]._discriminator;
    *(_OWORD *)(v2 + 96) = *(_OWORD *)&self[2]._vendorID;
    *(_OWORD *)(v2 + 112) = v6;
    *(_OWORD *)(v2 + 124) = *(_OWORD *)((char *)&self[2]._interfaces + 4);
    v7 = *(_OWORD *)&self[1]._discriminator;
    *(_OWORD *)(v2 + 32) = *(_OWORD *)&self[1]._vendorID;
    *(_OWORD *)(v2 + 48) = v7;
    *(_OWORD *)(v2 + 64) = *(_OWORD *)&self[1]._params.mHasValue;
    *(_OWORD *)(v2 + 80) = v5;
    v8 = BYTE4(self[3].super.isa);
    *(_BYTE *)(v2 + 140) = v8;
    if (v8)
    {
      *(_QWORD *)(v2 + 144) = *(_QWORD *)&self[3]._commissioningMode;
      *(_DWORD *)(v2 + 152) = self[3]._instanceName;
    }
    *(_OWORD *)(v2 + 160) = *(_OWORD *)&self[3]._vendorID;
    *(_QWORD *)(v2 + 176) = self[3]._discriminator;
    v9 = *(_OWORD *)&self[4].super.isa;
    *(_OWORD *)(v2 + 184) = *(_OWORD *)&self[3]._interfaces;
    *(_OWORD *)(v2 + 200) = v9;
    *(_OWORD *)(v2 + 209) = *(_OWORD *)(&self[4]._commissioningMode + 1);
    *(_DWORD *)(v2 + 228) = HIDWORD(self[4]._vendorID);
  }
  return (Optional<chip::Controller::SetUpCodePairerParameters>)self;
}

- (void)setParams:(Optional<chip::Controller::SetUpCodePairerParameters>)a3
{
  int v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  int v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v3 = **(unsigned __int8 **)&a3.mHasValue;
  self->_params.mHasValue = v3;
  if (v3)
  {
    v4 = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 8);
    LODWORD(self[1]._instanceName) = *(_DWORD *)(*(_QWORD *)&a3.mHasValue + 24);
    *(_OWORD *)&self[1].super.isa = v4;
    HIDWORD(self[1]._instanceName) = *(_DWORD *)(*(_QWORD *)&a3.mHasValue + 28);
    v5 = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 32);
    v6 = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 48);
    *(_OWORD *)&self[1]._params.mHasValue = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 64);
    *(_OWORD *)&self[1]._discriminator = v6;
    *(_OWORD *)&self[1]._vendorID = v5;
    v7 = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 80);
    v8 = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 96);
    v9 = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 112);
    *(_OWORD *)((char *)&self[2]._interfaces + 4) = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 124);
    *(_OWORD *)&self[2]._discriminator = v9;
    *(_OWORD *)&self[2]._vendorID = v8;
    *(_OWORD *)&self[2]._commissioningMode = v7;
    v10 = *(unsigned __int8 *)(*(_QWORD *)&a3.mHasValue + 140);
    BYTE4(self[3].super.isa) = v10;
    if (v10)
    {
      v11 = *(_QWORD *)(*(_QWORD *)&a3.mHasValue + 144);
      LODWORD(self[3]._instanceName) = *(_DWORD *)(*(_QWORD *)&a3.mHasValue + 152);
      *(_QWORD *)&self[3]._commissioningMode = v11;
    }
    v12 = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 160);
    self[3]._discriminator = *(NSNumber **)(*(_QWORD *)&a3.mHasValue + 176);
    *(_OWORD *)&self[3]._vendorID = v12;
    v13 = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 184);
    v14 = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 200);
    *(_OWORD *)(&self[4]._commissioningMode + 1) = *(_OWORD *)(*(_QWORD *)&a3.mHasValue + 209);
    *(_OWORD *)&self[3]._interfaces = v13;
    *(_OWORD *)&self[4].super.isa = v14;
    HIDWORD(self[4]._vendorID) = *(_DWORD *)(*(_QWORD *)&a3.mHasValue + 228);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaces, 0);
  objc_storeStrong((id *)&self->_discriminator, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_instanceName, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 56) = 0;
  return self;
}

@end
