@implementation HMDVideoCodecConfiguration

- (HMDVideoCodecConfiguration)initWithCodec:(id)a3 codecParameters:(id)a4 attributes:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDVideoCodecConfiguration *v12;
  HMDVideoCodecConfiguration *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDVideoCodecConfiguration;
  v12 = -[HMDVideoCodecConfiguration init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_videoCodec, a3);
    objc_storeStrong((id *)&v13->_codecParameters, a4);
    objc_storeStrong((id *)&v13->_videoAttributes, a5);
  }

  return v13;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDVideoCodec *v7;
  void *v8;
  HMDVideoCodec *v9;
  HMDVideoCodec *videoCodec;
  HMDVideoCodecParameters *v11;
  void *v12;
  HMDVideoCodecParameters *v13;
  HMDVideoCodecParameters *codecParameters;
  NSArray *v15;
  NSArray *videoAttributes;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BB90], "wrappertlv:name:", 1, CFSTR("kVideoCodecConfiguration__CodecType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1BAC8], "wrappertlv:name:", 2, CFSTR("kVideoCodecConfiguration__CodecParameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B9F0], "wrappertlv:name:objectCreator:", 3, CFSTR("kVideoCodecConfiguration__Attributes"), &__block_literal_global_230);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v3;
  v27[1] = v4;
  v27[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HAPTLVBase _parse:](self, "_parse:", v6))
  {
    v7 = [HMDVideoCodec alloc];
    objc_msgSend(v3, "field");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDVideoCodec initWithCodec:](v7, "initWithCodec:", objc_msgSend(v8, "unsignedIntegerValue"));
    videoCodec = self->_videoCodec;
    self->_videoCodec = v9;

    v11 = [HMDVideoCodecParameters alloc];
    objc_msgSend(v4, "field");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HAPTLVBase initWithTLVData:](v11, "initWithTLVData:", v12);
    codecParameters = self->_codecParameters;
    self->_codecParameters = v13;

    objc_msgSend(v5, "field");
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    videoAttributes = self->_videoAttributes;
    self->_videoAttributes = v15;

    v24 = checkForParseResult(1, v17, v18, v19, v20, v21, v22, v23, (uint64_t)self->_codecParameters, v26);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (NSData)tlvData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BE1BC10], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[HMDVideoCodecConfiguration videoCodec](self, "videoCodec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "codecType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 1, v6);

  -[HMDVideoCodecConfiguration codecParameters](self, "codecParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tlvData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 2, v8);
  -[HMDVideoCodecConfiguration videoAttributes](self, "videoAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tlvData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 3, v11);
  objc_msgSend(v3, "serialize");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v12;
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
  id v14;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ tlvDatablob = %@ "), v6, v8);

  -[HMDVideoCodecConfiguration videoCodec](self, "videoCodec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptionWithIndent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ videoCodec = %@ "), v6, v10);

  -[HMDVideoCodecConfiguration codecParameters](self, "codecParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptionWithIndent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ codecParameters = %@ "), v6, v12);

  -[HMDVideoCodecConfiguration videoAttributes](self, "videoAttributes");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  arrayToString(v14, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ attributes = %@ "), v6, v13);

}

- (HMDVideoCodecConfiguration)initWithCoder:(id)a3
{
  id v4;
  HMDVideoCodecConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HMDVideoCodec *videoCodec;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HMDVideoCodecParameters *codecParameters;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *videoAttributes;
  objc_super v22;
  _QWORD v23[2];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDVideoCodecConfiguration;
  v5 = -[HMDVideoCodecConfiguration init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v25[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kVideoCodecConfiguration__CodecType"));
    v9 = objc_claimAutoreleasedReturnValue();
    videoCodec = v5->_videoCodec;
    v5->_videoCodec = (HMDVideoCodec *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v24 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kVideoCodecConfiguration__CodecParameters"));
    v14 = objc_claimAutoreleasedReturnValue();
    codecParameters = v5->_codecParameters;
    v5->_codecParameters = (HMDVideoCodecParameters *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kVideoCodecConfiguration__Attributes"));
    v19 = objc_claimAutoreleasedReturnValue();
    videoAttributes = v5->_videoAttributes;
    v5->_videoAttributes = (NSArray *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDVideoCodecConfiguration videoCodec](self, "videoCodec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kVideoCodecConfiguration__CodecType"));

  -[HMDVideoCodecConfiguration codecParameters](self, "codecParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kVideoCodecConfiguration__CodecParameters"));

  -[HMDVideoCodecConfiguration videoAttributes](self, "videoAttributes");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kVideoCodecConfiguration__Attributes"));

}

- (HMDVideoCodec)videoCodec
{
  return self->_videoCodec;
}

- (HMDVideoCodecParameters)codecParameters
{
  return self->_codecParameters;
}

- (NSArray)videoAttributes
{
  return self->_videoAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoAttributes, 0);
  objc_storeStrong((id *)&self->_codecParameters, 0);
  objc_storeStrong((id *)&self->_videoCodec, 0);
}

HMDVideoAttributes *__47__HMDVideoCodecConfiguration__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDVideoAttributes *v3;

  v2 = a2;
  v3 = -[HAPTLVBase initWithTLVData:]([HMDVideoAttributes alloc], "initWithTLVData:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
