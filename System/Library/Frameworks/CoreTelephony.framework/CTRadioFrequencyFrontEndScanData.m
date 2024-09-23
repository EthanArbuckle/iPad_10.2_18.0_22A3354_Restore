@implementation CTRadioFrequencyFrontEndScanData

- (CTRadioFrequencyFrontEndScanData)init
{
  CTRadioFrequencyFrontEndScanData *v2;
  CTRadioFrequencyFrontEndScanData *v3;
  NSMutableArray *rffeScanInfo;
  NSMutableArray *missingRffeDevices;
  NSMutableArray *missingAtDevices;
  NSMutableArray *missingMmwDevices;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTRadioFrequencyFrontEndScanData;
  v2 = -[CTRadioFrequencyFrontEndScanData init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_rfcInitPass = 0;
    *(_OWORD *)&v2->_version = 0u;
    *(_OWORD *)&v2->_hwSku = 0u;
    *(_OWORD *)&v2->_hwHousing = 0u;
    *(_OWORD *)&v2->_rfcRev = 0u;
    *(_OWORD *)&v2->_rfcMmwRev = 0u;
    *(_OWORD *)&v2->_numExpectedDevices = 0u;
    rffeScanInfo = v2->_rffeScanInfo;
    v2->_numMissingDevices = 0;
    v2->_rffeScanInfo = 0;

    missingRffeDevices = v3->_missingRffeDevices;
    v3->_missingRffeDevices = 0;

    missingAtDevices = v3->_missingAtDevices;
    v3->_missingAtDevices = 0;

    missingMmwDevices = v3->_missingMmwDevices;
    v3->_missingMmwDevices = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("version=%lu\n"), -[CTRadioFrequencyFrontEndScanData version](self, "version"));
  objc_msgSend(v3, "appendFormat:", CFSTR("hwPrdId=%lu\n"), -[CTRadioFrequencyFrontEndScanData hwPrdId](self, "hwPrdId"));
  objc_msgSend(v3, "appendFormat:", CFSTR("hwSku=%lu\n"), -[CTRadioFrequencyFrontEndScanData hwSku](self, "hwSku"));
  objc_msgSend(v3, "appendFormat:", CFSTR("hwRev=%lu\n"), -[CTRadioFrequencyFrontEndScanData hwRev](self, "hwRev"));
  objc_msgSend(v3, "appendFormat:", CFSTR("hwHousing=%lu\n"), -[CTRadioFrequencyFrontEndScanData hwHousing](self, "hwHousing"));
  objc_msgSend(v3, "appendFormat:", CFSTR("rfcInitPass=%d\n"), -[CTRadioFrequencyFrontEndScanData rfcInitPass](self, "rfcInitPass"));
  objc_msgSend(v3, "appendFormat:", CFSTR("rfcHwid=0x%02x\n"), -[CTRadioFrequencyFrontEndScanData rfcHwid](self, "rfcHwid"));
  objc_msgSend(v3, "appendFormat:", CFSTR("rfcRev=%lu\n"), -[CTRadioFrequencyFrontEndScanData rfcRev](self, "rfcRev"));
  objc_msgSend(v3, "appendFormat:", CFSTR("rfcMmwHwid=0x%02x\n"), -[CTRadioFrequencyFrontEndScanData rfcMmwHwid](self, "rfcMmwHwid"));
  objc_msgSend(v3, "appendFormat:", CFSTR("rfcMmwRev=%lu\n"), -[CTRadioFrequencyFrontEndScanData rfcMmwRev](self, "rfcMmwRev"));
  objc_msgSend(v3, "appendFormat:", CFSTR("fr2TrxRev=%lu\n"), -[CTRadioFrequencyFrontEndScanData fr2TrxRev](self, "fr2TrxRev"));
  objc_msgSend(v3, "appendFormat:", CFSTR("rffeScanPass=%d\n"), -[CTRadioFrequencyFrontEndScanData rffeScanPass](self, "rffeScanPass"));
  objc_msgSend(v3, "appendFormat:", CFSTR("numExpectedDevices=%lu\n"), -[CTRadioFrequencyFrontEndScanData numExpectedDevices](self, "numExpectedDevices"));
  objc_msgSend(v3, "appendFormat:", CFSTR("numDetectedDevices=%lu\n"), -[CTRadioFrequencyFrontEndScanData numDetectedDevices](self, "numDetectedDevices"));
  objc_msgSend(v3, "appendFormat:", CFSTR("numMissingDevices=%lu\n"), -[CTRadioFrequencyFrontEndScanData numMissingDevices](self, "numMissingDevices"));
  -[CTRadioFrequencyFrontEndScanData rffeScanInfo](self, "rffeScanInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rffeScanInfo=%@\n"), v4);

  -[CTRadioFrequencyFrontEndScanData missingRffeDevices](self, "missingRffeDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("missingRffeDevices=%@\n"), v5);

  -[CTRadioFrequencyFrontEndScanData missingAtDevices](self, "missingAtDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("missingAtDevices=%@\n"), v6);

  -[CTRadioFrequencyFrontEndScanData missingMmwDevices](self, "missingMmwDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("missingMmwDevices=%@\n"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setVersion:", -[CTRadioFrequencyFrontEndScanData version](self, "version"));
  objc_msgSend(v5, "setHwPrdId:", -[CTRadioFrequencyFrontEndScanData hwPrdId](self, "hwPrdId"));
  objc_msgSend(v5, "setHwSku:", -[CTRadioFrequencyFrontEndScanData hwSku](self, "hwSku"));
  objc_msgSend(v5, "setHwRev:", -[CTRadioFrequencyFrontEndScanData hwRev](self, "hwRev"));
  objc_msgSend(v5, "setHwHousing:", -[CTRadioFrequencyFrontEndScanData hwHousing](self, "hwHousing"));
  objc_msgSend(v5, "setRfcInitPass:", -[CTRadioFrequencyFrontEndScanData rfcInitPass](self, "rfcInitPass"));
  objc_msgSend(v5, "setRfcHwid:", -[CTRadioFrequencyFrontEndScanData rfcHwid](self, "rfcHwid"));
  objc_msgSend(v5, "setRfcRev:", -[CTRadioFrequencyFrontEndScanData rfcRev](self, "rfcRev"));
  objc_msgSend(v5, "setRfcMmwHwid:", -[CTRadioFrequencyFrontEndScanData rfcMmwHwid](self, "rfcMmwHwid"));
  objc_msgSend(v5, "setRfcMmwRev:", -[CTRadioFrequencyFrontEndScanData rfcMmwRev](self, "rfcMmwRev"));
  objc_msgSend(v5, "setFr2TrxRev:", -[CTRadioFrequencyFrontEndScanData fr2TrxRev](self, "fr2TrxRev"));
  objc_msgSend(v5, "setRffeScanPass:", -[CTRadioFrequencyFrontEndScanData rffeScanPass](self, "rffeScanPass"));
  objc_msgSend(v5, "setNumExpectedDevices:", -[CTRadioFrequencyFrontEndScanData numExpectedDevices](self, "numExpectedDevices"));
  objc_msgSend(v5, "setNumDetectedDevices:", -[CTRadioFrequencyFrontEndScanData numDetectedDevices](self, "numDetectedDevices"));
  objc_msgSend(v5, "setNumMissingDevices:", -[CTRadioFrequencyFrontEndScanData numMissingDevices](self, "numMissingDevices"));
  -[CTRadioFrequencyFrontEndScanData rffeScanInfo](self, "rffeScanInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setRffeScanInfo:", v7);

  -[CTRadioFrequencyFrontEndScanData missingRffeDevices](self, "missingRffeDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setMissingRffeDevices:", v9);

  -[CTRadioFrequencyFrontEndScanData missingAtDevices](self, "missingAtDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setMissingAtDevices:", v11);

  -[CTRadioFrequencyFrontEndScanData missingMmwDevices](self, "missingMmwDevices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setMissingMmwDevices:", v13);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData version](self, "version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("kVersionKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData hwPrdId](self, "hwPrdId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("kHwPrdIdKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData hwSku](self, "hwSku"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("kHwSkuKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData hwRev](self, "hwRev"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("kHwRevKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData hwHousing](self, "hwHousing"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("kHwHousingKey"));

  objc_msgSend(v5, "encodeBool:forKey:", -[CTRadioFrequencyFrontEndScanData rfcInitPass](self, "rfcInitPass"), CFSTR("kRfcInitPassKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData rfcHwid](self, "rfcHwid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("kRfcHwidKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData rfcRev](self, "rfcRev"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("kRfcRevKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData rfcMmwHwid](self, "rfcMmwHwid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("kRfcMmwHwidKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData rfcMmwRev](self, "rfcMmwRev"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("kRfcMmwRevKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData fr2TrxRev](self, "fr2TrxRev"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("kFr2TrxRevKey"));

  objc_msgSend(v5, "encodeBool:forKey:", -[CTRadioFrequencyFrontEndScanData rffeScanPass](self, "rffeScanPass"), CFSTR("kRffeScanPassKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData numExpectedDevices](self, "numExpectedDevices"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v16, CFSTR("kNumExpectedDevicesKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData numDetectedDevices](self, "numDetectedDevices"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v17, CFSTR("kNumDetectedDevicesKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData numMissingDevices](self, "numMissingDevices"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v18, CFSTR("kNumMissingDevicesKey"));

  -[CTRadioFrequencyFrontEndScanData rffeScanInfo](self, "rffeScanInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v19, CFSTR("kRffeScanInfoKey"));

  -[CTRadioFrequencyFrontEndScanData missingRffeDevices](self, "missingRffeDevices");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v20, CFSTR("kMissingRffeDevicesKey"));

  -[CTRadioFrequencyFrontEndScanData missingAtDevices](self, "missingAtDevices");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v21, CFSTR("kMissingAtDevicesKey"));

  -[CTRadioFrequencyFrontEndScanData missingMmwDevices](self, "missingMmwDevices");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v22, CFSTR("kMissingMmwDevicesKey"));

}

- (CTRadioFrequencyFrontEndScanData)initWithCoder:(id)a3
{
  id v4;
  CTRadioFrequencyFrontEndScanData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSMutableArray *rffeScanInfo;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSMutableArray *missingRffeDevices;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSMutableArray *missingAtDevices;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSMutableArray *missingMmwDevices;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CTRadioFrequencyFrontEndScanData;
  v5 = -[CTRadioFrequencyFrontEndScanData init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kVersionKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_version = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kHwPrdIdKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hwPrdId = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kHwSkuKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hwSku = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kHwRevKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hwRev = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kHwHousingKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hwHousing = objc_msgSend(v10, "unsignedIntegerValue");

    v5->_rfcInitPass = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kRfcInitPassKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRfcHwidKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_rfcHwid = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRfcRevKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_rfcRev = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRfcMmwHwidKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_rfcMmwHwid = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRfcMmwRevKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_rfcMmwRev = objc_msgSend(v14, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFr2TrxRevKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_fr2TrxRev = objc_msgSend(v15, "unsignedIntegerValue");

    v5->_rffeScanPass = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kRffeScanPassKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNumExpectedDevicesKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_numExpectedDevices = objc_msgSend(v16, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNumDetectedDevicesKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_numDetectedDevices = objc_msgSend(v17, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNumMissingDevicesKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_numMissingDevices = objc_msgSend(v18, "unsignedIntegerValue");

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("kRffeScanInfoKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    rffeScanInfo = v5->_rffeScanInfo;
    v5->_rffeScanInfo = (NSMutableArray *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("kMissingRffeDevicesKey"));
    v27 = objc_claimAutoreleasedReturnValue();
    missingRffeDevices = v5->_missingRffeDevices;
    v5->_missingRffeDevices = (NSMutableArray *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("kMissingAtDevicesKey"));
    v32 = objc_claimAutoreleasedReturnValue();
    missingAtDevices = v5->_missingAtDevices;
    v5->_missingAtDevices = (NSMutableArray *)v32;

    v34 = (void *)MEMORY[0x1E0C99E60];
    v35 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("kMissingMmwDevicesKey"));
    v37 = objc_claimAutoreleasedReturnValue();
    missingMmwDevices = v5->_missingMmwDevices;
    v5->_missingMmwDevices = (NSMutableArray *)v37;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)hwPrdId
{
  return self->_hwPrdId;
}

- (void)setHwPrdId:(unint64_t)a3
{
  self->_hwPrdId = a3;
}

- (unint64_t)hwSku
{
  return self->_hwSku;
}

- (void)setHwSku:(unint64_t)a3
{
  self->_hwSku = a3;
}

- (unint64_t)hwRev
{
  return self->_hwRev;
}

- (void)setHwRev:(unint64_t)a3
{
  self->_hwRev = a3;
}

- (unint64_t)hwHousing
{
  return self->_hwHousing;
}

- (void)setHwHousing:(unint64_t)a3
{
  self->_hwHousing = a3;
}

- (BOOL)rfcInitPass
{
  return self->_rfcInitPass;
}

- (void)setRfcInitPass:(BOOL)a3
{
  self->_rfcInitPass = a3;
}

- (unint64_t)rfcHwid
{
  return self->_rfcHwid;
}

- (void)setRfcHwid:(unint64_t)a3
{
  self->_rfcHwid = a3;
}

- (unint64_t)rfcRev
{
  return self->_rfcRev;
}

- (void)setRfcRev:(unint64_t)a3
{
  self->_rfcRev = a3;
}

- (unint64_t)rfcMmwHwid
{
  return self->_rfcMmwHwid;
}

- (void)setRfcMmwHwid:(unint64_t)a3
{
  self->_rfcMmwHwid = a3;
}

- (unint64_t)rfcMmwRev
{
  return self->_rfcMmwRev;
}

- (void)setRfcMmwRev:(unint64_t)a3
{
  self->_rfcMmwRev = a3;
}

- (unint64_t)fr2TrxRev
{
  return self->_fr2TrxRev;
}

- (void)setFr2TrxRev:(unint64_t)a3
{
  self->_fr2TrxRev = a3;
}

- (BOOL)rffeScanPass
{
  return self->_rffeScanPass;
}

- (void)setRffeScanPass:(BOOL)a3
{
  self->_rffeScanPass = a3;
}

- (unint64_t)numExpectedDevices
{
  return self->_numExpectedDevices;
}

- (void)setNumExpectedDevices:(unint64_t)a3
{
  self->_numExpectedDevices = a3;
}

- (unint64_t)numDetectedDevices
{
  return self->_numDetectedDevices;
}

- (void)setNumDetectedDevices:(unint64_t)a3
{
  self->_numDetectedDevices = a3;
}

- (unint64_t)numMissingDevices
{
  return self->_numMissingDevices;
}

- (void)setNumMissingDevices:(unint64_t)a3
{
  self->_numMissingDevices = a3;
}

- (NSMutableArray)rffeScanInfo
{
  return self->_rffeScanInfo;
}

- (void)setRffeScanInfo:(id)a3
{
  objc_storeStrong((id *)&self->_rffeScanInfo, a3);
}

- (NSMutableArray)missingRffeDevices
{
  return self->_missingRffeDevices;
}

- (void)setMissingRffeDevices:(id)a3
{
  objc_storeStrong((id *)&self->_missingRffeDevices, a3);
}

- (NSMutableArray)missingAtDevices
{
  return self->_missingAtDevices;
}

- (void)setMissingAtDevices:(id)a3
{
  objc_storeStrong((id *)&self->_missingAtDevices, a3);
}

- (NSMutableArray)missingMmwDevices
{
  return self->_missingMmwDevices;
}

- (void)setMissingMmwDevices:(id)a3
{
  objc_storeStrong((id *)&self->_missingMmwDevices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missingMmwDevices, 0);
  objc_storeStrong((id *)&self->_missingAtDevices, 0);
  objc_storeStrong((id *)&self->_missingRffeDevices, 0);
  objc_storeStrong((id *)&self->_rffeScanInfo, 0);
}

@end
