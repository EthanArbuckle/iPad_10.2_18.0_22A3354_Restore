@implementation CLFindMyAccessoryFirmwareVersion

- (CLFindMyAccessoryFirmwareVersion)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  CLFindMyAccessoryFirmwareVersion *v6;
  CLFindMyAccessoryFirmwareVersion *v7;
  $383407B5A962737AD9715A0074609918 *v8;
  __int16 v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLFindMyAccessoryFirmwareVersion;
  v6 = -[CLFindMyAccessoryFirmwareVersion init](&v11, sel_init);
  v7 = v6;
  if (a4 >= 0x12 && v6)
  {
    v8 = ($383407B5A962737AD9715A0074609918 *)malloc_type_malloc(0x12uLL, 0x1000040B88D2812uLL);
    v7->_version = v8;
    v9 = *((_WORD *)a3 + 8);
    *(_OWORD *)&v8->var0 = *(_OWORD *)a3;
    *(_WORD *)&v8->var7 = v9;
  }
  return v7;
}

- (CLFindMyAccessoryFirmwareVersion)initWithData:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;

  v6 = objc_msgSend_bytes(a3, a2, (uint64_t)a3, v3);
  v10 = objc_msgSend_length(a3, v7, v8, v9);
  return (CLFindMyAccessoryFirmwareVersion *)objc_msgSend_initWithBytes_length_(self, v11, v6, v10);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_version);
  v3.receiver = self;
  v3.super_class = (Class)CLFindMyAccessoryFirmwareVersion;
  -[CLFindMyAccessoryFirmwareVersion dealloc](&v3, sel_dealloc);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_vanBurenVersion(self, a2, v2, v3);
  v10 = objc_msgSend_rtKitVersion(self, v7, v8, v9);
  v14 = objc_msgSend_roseAPVersion(self, v11, v12, v13);
  v18 = objc_msgSend_roseDSPVersion(self, v15, v16, v17);
  v22 = objc_msgSend_calibrationDataVersion(self, v19, v20, v21);
  return (id)objc_msgSend_stringWithFormat_(v5, v23, (uint64_t)CFSTR("CLFindMyAccessoryFirmwareVersion <%p> VanBurenVersion: %@, RTKitVersion: %@, RoseAPVersion: %lu, RoseDSPVersion: %lu, CalibrationDataVersion: %lu"), v24, self, v6, v10, v14, v18, v22);
}

- (NSString)vanBurenVersion
{
  uint64_t v2;

  return (NSString *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%u%c%u"), v2, (self->_version->var0 >> 20) & 0xF, (HIWORD(self->_version->var0) & 0xF) + 65, (unsigned __int16)self->_version->var0 >> 4);
}

- (NSString)rtKitVersion
{
  uint64_t v2;

  return (NSString *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%u.%u"), v2, self->_version->var1, self->_version->var2);
}

- (NSString)specificationVersion
{
  uint64_t v2;

  return (NSString *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%u.%u"), v2, self->_version->var7, self->_version->var8);
}

- (unint64_t)roseAPVersion
{
  return self->_version->var3;
}

- (unint64_t)roseDSPVersion
{
  return self->_version->var4;
}

- (unint64_t)hardwareVersion
{
  return self->_version->var5;
}

- (unint64_t)calibrationDataVersion
{
  return self->_version->var6;
}

@end
