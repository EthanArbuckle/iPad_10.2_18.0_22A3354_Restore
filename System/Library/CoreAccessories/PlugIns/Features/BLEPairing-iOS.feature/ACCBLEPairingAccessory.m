@implementation ACCBLEPairingAccessory

- (ACCBLEPairingAccessory)init
{
  ACCBLEPairingAccessory *v2;
  ACCBLEPairingAccessory *v3;
  ACCiAP2ShimAccessory *iap2ShimAccessory;
  NSData *blePairingUUID;
  NSData *supportedPairTypes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ACCBLEPairingAccessory;
  v2 = -[ACCBLEPairingAccessory init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    iap2ShimAccessory = v2->_iap2ShimAccessory;
    v2->_iap2ShimAccessory = 0;

    blePairingUUID = v3->_blePairingUUID;
    v3->_blePairingUUID = 0;

    supportedPairTypes = v3->_supportedPairTypes;
    v3->_supportedPairTypes = 0;

    v3->_selectedPairType = 2;
  }
  return v3;
}

- (void)dealloc
{
  ACCiAP2ShimAccessory *iap2ShimAccessory;
  NSData *blePairingUUID;
  NSData *supportedPairTypes;
  objc_super v6;

  iap2ShimAccessory = self->_iap2ShimAccessory;
  self->_iap2ShimAccessory = 0;

  blePairingUUID = self->_blePairingUUID;
  self->_blePairingUUID = 0;

  supportedPairTypes = self->_supportedPairTypes;
  self->_supportedPairTypes = 0;

  self->_selectedPairType = 2;
  v6.receiver = self;
  v6.super_class = (Class)ACCBLEPairingAccessory;
  -[ACCBLEPairingAccessory dealloc](&v6, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCBLEPairingAccessory> [\n    _iap2ShimAccessory=%@;\n    _blePairingUUID=%@;\n    _supportedPairTypes=%@;\n    _selectedPairType=%d\n]"),
               self->_iap2ShimAccessory,
               self->_blePairingUUID,
               self->_supportedPairTypes,
               self->_selectedPairType);
}

- (ACCiAP2ShimAccessory)iap2ShimAccessory
{
  return self->_iap2ShimAccessory;
}

- (void)setIap2ShimAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_iap2ShimAccessory, a3);
}

- (NSData)blePairingUUID
{
  return self->_blePairingUUID;
}

- (void)setBlePairingUUID:(id)a3
{
  objc_storeStrong((id *)&self->_blePairingUUID, a3);
}

- (NSData)supportedPairTypes
{
  return self->_supportedPairTypes;
}

- (void)setSupportedPairTypes:(id)a3
{
  objc_storeStrong((id *)&self->_supportedPairTypes, a3);
}

- (int)selectedPairType
{
  return self->_selectedPairType;
}

- (void)setSelectedPairType:(int)a3
{
  self->_selectedPairType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPairTypes, 0);
  objc_storeStrong((id *)&self->_blePairingUUID, 0);
  objc_storeStrong((id *)&self->_iap2ShimAccessory, 0);
}

@end
