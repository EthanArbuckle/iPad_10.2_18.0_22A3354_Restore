@implementation HMDSelectedRTPParameters

- (HMDSelectedRTPParameters)initWithPayloadType:(id)a3 maximumBitrate:(id)a4 minimumBitrate:(id)a5 rtcpInterval:(id)a6 comfortNoisePayloadType:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDSelectedRTPParameters *v17;
  HMDSelectedRTPParameters *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDSelectedRTPParameters;
  v17 = -[HMDSelectedRTPParameters init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_payloadType, a3);
    objc_storeStrong((id *)&v18->_maximumBitrate, a4);
    objc_storeStrong((id *)&v18->_minimumBitrate, a5);
    objc_storeStrong((id *)&v18->_rtcpInterval, a6);
    objc_storeStrong((id *)&v18->_comfortNoisePayloadType, a7);
  }

  return v18;
}

- (NSData)tlvData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D165F8], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSelectedRTPParameters payloadType](self, "payloadType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 1, 1, v4);

  -[HMDSelectedRTPParameters synchronizationSource](self, "synchronizationSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 2, 4, v5);

  -[HMDSelectedRTPParameters minimumBitrate](self, "minimumBitrate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue") / 0x3E8uLL;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 3, 2, v8);

  -[HMDSelectedRTPParameters rtcpInterval](self, "rtcpInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:floatNumber:", 4, 4, v9);

  -[HMDSelectedRTPParameters maxMTU](self, "maxMTU");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 5, 2, v10);

  -[HMDSelectedRTPParameters comfortNoisePayloadType](self, "comfortNoisePayloadType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 6, 1, v11);

  objc_msgSend(v3, "serialize");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v12;
}

- (BOOL)_parseFromTLVData
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSNumber *v13;
  NSNumber *synchronizationSource;
  NSNumber *v15;
  NSNumber *payloadType;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  NSNumber *v22;
  NSNumber *minimumBitrate;
  NSNumber *v24;
  NSNumber *rtcpInterval;
  NSNumber *v26;
  NSNumber *maxMTU;
  NSNumber *v28;
  NSNumber *comfortNoisePayloadType;
  void *v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 1, CFSTR("kRTPParameters_PayloadType"));
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 2, CFSTR("kRTPParameters_SynchronizationSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 3, CFSTR("kRTPParameters_MinimumVideoBandwidth"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 4, CFSTR("kRTPParameters_RTCPInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 5, CFSTR("kRTPParameters_MaxMTU"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 6, CFSTR("kRTPParameters_ComfortNoisePayloadType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v3;
  v34[0] = v3;
  v34[1] = v4;
  v9 = v4;
  v34[2] = v5;
  v34[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v7;
  v33[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = -[HAPTLVBase _parseMandatory:optional:](self, "_parseMandatory:optional:", v10, v11);
  if ((_DWORD)v12)
  {
    objc_msgSend(v4, "field");
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    synchronizationSource = self->_synchronizationSource;
    self->_synchronizationSource = v13;

    objc_msgSend(v32, "field");
    v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    payloadType = self->_payloadType;
    self->_payloadType = v15;

    objc_msgSend(v5, "field");
    v17 = v11;
    v18 = v8;
    v19 = (char)v12;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v7;
    v20 = objc_msgSend(v12, "unsignedIntegerValue");

    LOBYTE(v12) = v19;
    v8 = v18;
    v11 = v17;
    v21 = 1000 * v20;
    v9 = v4;
    v7 = v31;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
    v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    minimumBitrate = self->_minimumBitrate;
    self->_minimumBitrate = v22;

    objc_msgSend(v6, "field");
    v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    rtcpInterval = self->_rtcpInterval;
    self->_rtcpInterval = v24;

    objc_msgSend(v31, "field");
    v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    maxMTU = self->_maxMTU;
    self->_maxMTU = v26;

    objc_msgSend(v8, "field");
    v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    comfortNoisePayloadType = self->_comfortNoisePayloadType;
    self->_comfortNoisePayloadType = v28;

  }
  return (char)v12;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ tlvDatablob = %@ "), v6, v8);

  -[HMDSelectedRTPParameters synchronizationSource](self, "synchronizationSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ syncSource = %@ "), v6, v9);

  -[HMDSelectedRTPParameters payloadType](self, "payloadType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ payloadType = %@ "), v6, v10);

  -[HMDSelectedRTPParameters minimumBitrate](self, "minimumBitrate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ minimumBitrate = %@ "), v6, v11);

  -[HMDSelectedRTPParameters maximumBitrate](self, "maximumBitrate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ maximumBitrate = %@ "), v6, v12);

  -[HMDSelectedRTPParameters rtcpInterval](self, "rtcpInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ rtcpInterval = %@ "), v6, v13);

  -[HMDSelectedRTPParameters maxMTU](self, "maxMTU");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ maxMTU = %@ "), v6, v14);

  -[HMDSelectedRTPParameters comfortNoisePayloadType](self, "comfortNoisePayloadType");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ comfortNoisePayloadType = %@ "), v6, v15);

}

- (HMDSelectedRTPParameters)initWithCoder:(id)a3
{
  id v4;
  HMDSelectedRTPParameters *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSNumber *payloadType;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSNumber *synchronizationSource;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSNumber *minimumBitrate;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSNumber *maximumBitrate;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSNumber *rtcpInterval;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSNumber *maxMTU;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSNumber *comfortNoisePayloadType;
  objc_super v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)HMDSelectedRTPParameters;
  v5 = -[HMDSelectedRTPParameters init](&v42, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v49[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kRTPParameters_PayloadType"));
    v9 = objc_claimAutoreleasedReturnValue();
    payloadType = v5->_payloadType;
    v5->_payloadType = (NSNumber *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v48 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kRTPParameters_SynchronizationSource"));
    v14 = objc_claimAutoreleasedReturnValue();
    synchronizationSource = v5->_synchronizationSource;
    v5->_synchronizationSource = (NSNumber *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v47 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kRTPParameters_MinimumVideoBandwidth"));
    v19 = objc_claimAutoreleasedReturnValue();
    minimumBitrate = v5->_minimumBitrate;
    v5->_minimumBitrate = (NSNumber *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v46 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("kRTPParameters_MaximumVideoBandwidth"));
    v24 = objc_claimAutoreleasedReturnValue();
    maximumBitrate = v5->_maximumBitrate;
    v5->_maximumBitrate = (NSNumber *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v45 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setWithArray:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("kRTPParameters_RTCPInterval"));
    v29 = objc_claimAutoreleasedReturnValue();
    rtcpInterval = v5->_rtcpInterval;
    v5->_rtcpInterval = (NSNumber *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v44 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setWithArray:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("kRTPParameters_MaxMTU"));
    v34 = objc_claimAutoreleasedReturnValue();
    maxMTU = v5->_maxMTU;
    v5->_maxMTU = (NSNumber *)v34;

    v36 = (void *)MEMORY[0x1E0C99E60];
    v43 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setWithArray:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("kRTPParameters_ComfortNoisePayloadType"));
    v39 = objc_claimAutoreleasedReturnValue();
    comfortNoisePayloadType = v5->_comfortNoisePayloadType;
    v5->_comfortNoisePayloadType = (NSNumber *)v39;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[HMDSelectedRTPParameters payloadType](self, "payloadType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kRTPParameters_PayloadType"));

  -[HMDSelectedRTPParameters synchronizationSource](self, "synchronizationSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kRTPParameters_SynchronizationSource"));

  -[HMDSelectedRTPParameters minimumBitrate](self, "minimumBitrate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kRTPParameters_MinimumVideoBandwidth"));

  -[HMDSelectedRTPParameters maximumBitrate](self, "maximumBitrate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kRTPParameters_MaximumVideoBandwidth"));

  -[HMDSelectedRTPParameters rtcpInterval](self, "rtcpInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("kRTPParameters_RTCPInterval"));

  -[HMDSelectedRTPParameters maxMTU](self, "maxMTU");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("kRTPParameters_MaxMTU"));

  -[HMDSelectedRTPParameters comfortNoisePayloadType](self, "comfortNoisePayloadType");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("kRTPParameters_ComfortNoisePayloadType"));

}

- (NSNumber)payloadType
{
  return self->_payloadType;
}

- (NSNumber)synchronizationSource
{
  return self->_synchronizationSource;
}

- (void)setSynchronizationSource:(id)a3
{
  objc_storeStrong((id *)&self->_synchronizationSource, a3);
}

- (NSNumber)maximumBitrate
{
  return self->_maximumBitrate;
}

- (NSNumber)minimumBitrate
{
  return self->_minimumBitrate;
}

- (NSNumber)rtcpInterval
{
  return self->_rtcpInterval;
}

- (NSNumber)maxMTU
{
  return self->_maxMTU;
}

- (void)setMaxMTU:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)comfortNoisePayloadType
{
  return self->_comfortNoisePayloadType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comfortNoisePayloadType, 0);
  objc_storeStrong((id *)&self->_maxMTU, 0);
  objc_storeStrong((id *)&self->_rtcpInterval, 0);
  objc_storeStrong((id *)&self->_minimumBitrate, 0);
  objc_storeStrong((id *)&self->_maximumBitrate, 0);
  objc_storeStrong((id *)&self->_synchronizationSource, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
