@implementation ENAdvertisement

- (ENAdvertisement)initWithStructRepresentation:(id *)a3
{
  void *v5;
  void *v6;
  ENAdvertisement *v7;
  uint64_t v9;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D58]), "initWithBytes:length:", a3, 16);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D58]), "initWithBytes:length:", &a3->var1, 4);
  LOBYTE(v9) = HIBYTE(a3->var5);
  v7 = -[ENAdvertisement initWithRPI:encryptedAEM:timestamp:scanInterval:typicalRSSI:maxRSSI:saturated:counter:](self, "initWithRPI:encryptedAEM:timestamp:scanInterval:typicalRSSI:maxRSSI:saturated:counter:", v5, v6, HIWORD(a3->var3), SLOBYTE(a3->var4), SHIBYTE(a3->var4), LOBYTE(a3->var5), *(double *)(&a3->var1 + 1), v9);

  return v7;
}

- (ENAdvertisement)initWithRPI:(id)a3 encryptedAEM:(id)a4 timestamp:(double)a5 scanInterval:(unsigned __int16)a6 typicalRSSI:(char)a7 maxRSSI:(char)a8 saturated:(BOOL)a9 counter:(unsigned __int8)a10
{
  id v18;
  id v19;
  ENAdvertisement *v20;
  ENAdvertisement *v21;
  objc_super v23;

  v18 = a3;
  v19 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ENAdvertisement;
  v20 = -[ENAdvertisement init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_rpi, a3);
    objc_storeStrong((id *)&v21->_encryptedAEM, a4);
    v21->_timestamp = a5;
    v21->_scanInterval = a6;
    v21->_typicalRSSI = a7;
    v21->_maxRSSI = a8;
    v21->_saturated = a9;
    v21->_counter = a10;
  }

  return v21;
}

- ($8B507D830E6EE36862B76123793C2CB9)structRepresentation
{
  $A0BF7C2F34202597F9F30F6CD4123348 *p_var1;

  *(_QWORD *)retstr->var0.var0 = 0;
  *(_QWORD *)&retstr->var0.var0[8] = 0;
  retstr->var1 = 0;
  p_var1 = &retstr->var1;
  *(double *)(&retstr->var1 + 1) = self->_timestamp;
  HIDWORD(retstr->var2) = 0;
  LOWORD(retstr->var3) = 0;
  HIWORD(retstr->var3) = self->_scanInterval;
  *(_DWORD *)&retstr->var4 = *(_DWORD *)&self->_typicalRSSI;
  -[NSData getBytes:length:](self->_rpi, "getBytes:length:");
  return ($8B507D830E6EE36862B76123793C2CB9 *)-[NSData getBytes:length:](self->_encryptedAEM, "getBytes:length:", p_var1, 4);
}

- (void)combineWithAdvertisement:(id)a3
{
  id v4;
  unsigned __int8 counter;
  unsigned __int8 v6;
  int v7;
  int typicalRSSI;
  int v9;
  int v10;
  int v11;
  int maxRSSI;
  char v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  counter = self->_counter;
  v16 = v4;
  v6 = objc_msgSend(v4, "counter") + counter;
  if (!v6)
  {
    if (gLogCategory__ENAdvertisement <= 115
      && (gLogCategory__ENAdvertisement != -1 || _LogCategory_Initialize()))
    {
      v14 = self->_counter;
      v15 = objc_msgSend(v16, "counter");
      LogPrintF_safe();
    }
    v6 = 1;
  }
  v7 = objc_msgSend(v16, "typicalRSSI", v14, v15);
  typicalRSSI = self->_typicalRSSI;
  if (v7 == 127)
  {
    if (typicalRSSI < (int)objc_msgSend(v16, "typicalRSSI"))
    {
      LOBYTE(v9) = self->_typicalRSSI;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (typicalRSSI == 127)
  {
    objc_msgSend(v16, "typicalRSSI");
LABEL_12:
    LOBYTE(v9) = objc_msgSend(v16, "typicalRSSI");
    goto LABEL_14;
  }
  v10 = self->_counter * typicalRSSI;
  v11 = objc_msgSend(v16, "typicalRSSI");
  v9 = (int)(v10 + objc_msgSend(v16, "counter") * v11) / v6;
LABEL_14:
  self->_typicalRSSI = v9;
  maxRSSI = self->_maxRSSI;
  if (maxRSSI <= (int)objc_msgSend(v16, "maxRSSI"))
    v13 = objc_msgSend(v16, "maxRSSI");
  else
    v13 = self->_maxRSSI;
  self->_maxRSSI = v13;
  self->_saturated = self->_typicalRSSI == 127;
  self->_counter = v6;

}

- (id)decryptedMetadataForTemporaryExposureKey:(id)a3
{
  id v4;
  void *v5;
  int v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSData length](self->_encryptedAEM, "length") == 4 && -[NSData length](self->_rpi, "length") == 16)
  {
    v8[0] = 0;
    v8[1] = 0;
    -[NSData getBytes:length:](self->_rpi, "getBytes:length:", v8, 16);
    v7 = 0;
    -[NSData getBytes:length:](self->_encryptedAEM, "getBytes:length:", &v7, 4);
    objc_msgSend((id)objc_opt_class(), "decryptedMetadataForTemporaryExposureKey:encryptedAEM:RPI:", v4, &v7, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)decryptedMetadataForTemporaryExposureKey:(id)a3 encryptedAEM:(id *)a4 RPI:(id *)a5
{
  uint64_t v5;
  ENAdvertisementMetadata *v6;
  uint64_t v8;

  v8 = 0;
  objc_msgSend(a3, "getAEMBytes:input:length:RPI:", &v8, a4, 4, a5);
  ENRPIMetadataDeserialize();
  if (BYTE4(v8) == 1)
  {
    if (BYTE5(v8))
      v5 = 2 * (BYTE5(v8) == 1);
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  v6 = [ENAdvertisementMetadata alloc];
  return -[ENAdvertisementMetadata initWithVersion:txPower:calibrationConfidence:](v6, "initWithVersion:txPower:calibrationConfidence:", v5, SBYTE6(v8), HIBYTE(v8));
}

- (id)description
{
  objc_class *v3;
  id v4;
  const void *v5;
  NSUInteger v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v17;
  const void *v18;
  NSUInteger v19;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v4 = 0;

  v5 = -[NSData bytes](self->_rpi, "bytes", v17);
  v6 = -[NSData length](self->_rpi, "length");
  v19 = -[NSData length](self->_rpi, "length");
  v18 = v5;
  NSAppendPrintF();
  v7 = v4;

  -[NSData bytes](self->_encryptedAEM, "bytes", v18, v6, v19);
  -[NSData length](self->_encryptedAEM, "length");
  -[NSData length](self->_encryptedAEM, "length");
  NSAppendPrintF();
  v8 = v7;

  CUPrintDateCF();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v10 = v8;

  NSAppendPrintF_safe();
  v11 = v10;

  NSAppendPrintF_safe();
  v12 = v11;

  NSAppendPrintF_safe();
  v13 = v12;

  NSAppendPrintF_safe();
  v14 = v13;

  if (self->_saturated)
  {
    NSAppendPrintF_safe();
    v15 = v14;

    v14 = v15;
  }
  return v14;
}

- (NSData)rpi
{
  return self->_rpi;
}

- (void)setRpi:(id)a3
{
  objc_storeStrong((id *)&self->_rpi, a3);
}

- (NSData)encryptedAEM
{
  return self->_encryptedAEM;
}

- (void)setEncryptedAEM:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedAEM, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unsigned)scanInterval
{
  return self->_scanInterval;
}

- (void)setScanInterval:(unsigned __int16)a3
{
  self->_scanInterval = a3;
}

- (char)typicalRSSI
{
  return self->_typicalRSSI;
}

- (void)setTypicalRSSI:(char)a3
{
  self->_typicalRSSI = a3;
}

- (char)maxRSSI
{
  return self->_maxRSSI;
}

- (void)setMaxRSSI:(char)a3
{
  self->_maxRSSI = a3;
}

- (BOOL)saturated
{
  return self->_saturated;
}

- (void)setSaturated:(BOOL)a3
{
  self->_saturated = a3;
}

- (unsigned)counter
{
  return self->_counter;
}

- (void)setCounter:(unsigned __int8)a3
{
  self->_counter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedAEM, 0);
  objc_storeStrong((id *)&self->_rpi, 0);
}

@end
