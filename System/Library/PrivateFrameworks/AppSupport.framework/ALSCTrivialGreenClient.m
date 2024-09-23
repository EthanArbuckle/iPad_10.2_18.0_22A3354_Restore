@implementation ALSCTrivialGreenClient

+ (id)_skuRegionCode
{
  return (id)MGCopyAnswer();
}

- (ALSCTrivialGreenClient)init
{
  return (ALSCTrivialGreenClient *)-[ALSCTrivialGreenClient _initWithSKURegionCode:key2EnablingSKURegionCodes:](self, "_initWithSKURegionCode:key2EnablingSKURegionCodes:", +[ALSCTrivialGreenClient _skuRegionCode](ALSCTrivialGreenClient, "_skuRegionCode"), &unk_1E2889DF0);
}

- (id)_initWithSKURegionCode:(id)a3 key2EnablingSKURegionCodes:(id)a4
{
  ALSCTrivialGreenClient *v6;
  uint64_t v7;
  _BOOL4 v8;
  objc_super v10;
  uint8_t buf[4];
  _BOOL4 v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)ALSCTrivialGreenClient;
  v6 = -[ALSCTrivialGreenClient init](&v10, sel_init);
  if (v6)
  {
    if (a3)
      v7 = objc_msgSend(a4, "containsObject:", a3);
    else
      v7 = 0;
    -[ALSCTrivialGreenClient setCalculatedKey2Value:](v6, "setCalculatedKey2Value:", v7);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[ALSCTrivialGreenClient calculatedKey2Value](v6, "calculatedKey2Value");
      *(_DWORD *)buf = 67109378;
      v12 = v8;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Trivial green calculated value %d for region code %@", buf, 0x12u);
    }
  }
  return v6;
}

- (BOOL)valuesFinalized
{
  return 1;
}

- (BOOL)key1Value
{
  return 0;
}

- (BOOL)key3Value
{
  return 0;
}

- (BOOL)calculatedKey2Value
{
  return self->_calculatedKey2Value;
}

- (void)setCalculatedKey2Value:(BOOL)a3
{
  self->_calculatedKey2Value = a3;
}

@end
