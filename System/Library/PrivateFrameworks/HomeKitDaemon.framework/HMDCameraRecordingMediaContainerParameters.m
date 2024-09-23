@implementation HMDCameraRecordingMediaContainerParameters

- (HMDCameraRecordingMediaContainerParameters)initWithFragmentLength:(id)a3
{
  id v5;
  HMDCameraRecordingMediaContainerParameters *v6;
  HMDCameraRecordingMediaContainerParameters *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraRecordingMediaContainerParameters;
  v6 = -[HMDCameraRecordingMediaContainerParameters init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fragmentLength, a3);

  return v7;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  NSNumber *v6;
  NSNumber *fragmentLength;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BB90], "wrappertlv:name:", 1, CFSTR("kMediaContainerParametersFragmentLength"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HAPTLVBase _parse:](self, "_parse:", v4);
  if (v5)
  {
    objc_msgSend(v3, "field");
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    fragmentLength = self->_fragmentLength;
    self->_fragmentLength = v6;

  }
  return v5;
}

- (NSData)tlvData
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE1BC10], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingMediaContainerParameters fragmentLength](self, "fragmentLength");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 1, 4, v4);

  objc_msgSend(v3, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@tlvDatablob = %@ "), v6, v8);

  -[HMDCameraRecordingMediaContainerParameters fragmentLength](self, "fragmentLength");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@fragmentLength = %@ "), v6, v9);

}

- (HMDCameraRecordingMediaContainerParameters)initWithCoder:(id)a3
{
  id v4;
  HMDCameraRecordingMediaContainerParameters *v5;
  uint64_t v6;
  NSNumber *fragmentLength;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraRecordingMediaContainerParameters;
  v5 = -[HMDCameraRecordingMediaContainerParameters init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMediaContainerParametersFragmentLength"));
    v6 = objc_claimAutoreleasedReturnValue();
    fragmentLength = v5->_fragmentLength;
    v5->_fragmentLength = (NSNumber *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCameraRecordingMediaContainerParameters fragmentLength](self, "fragmentLength");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kMediaContainerParametersFragmentLength"));

}

- (NSNumber)fragmentLength
{
  return self->_fragmentLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragmentLength, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
