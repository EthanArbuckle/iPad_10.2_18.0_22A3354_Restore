@implementation CTXPCFirmwareUpdateInfoResponse

- (CTXPCFirmwareUpdateInfoResponse)initWithFimwareUpdateInfo:(id)a3
{
  id v5;
  CTXPCFirmwareUpdateInfoResponse *v6;
  CTXPCFirmwareUpdateInfoResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTXPCFirmwareUpdateInfoResponse;
  v6 = -[CTXPCMessage initWithNamedArguments:](&v9, sel_initWithNamedArguments_, MEMORY[0x1E0C9AA70]);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_firmwareInfo, a3);

  return v7;
}

- (NSDictionary)firmwareInfo
{
  return self->_firmwareInfo;
}

- (CTXPCFirmwareUpdateInfoResponse)initWithCoder:(id)a3
{
  id v4;
  CTXPCFirmwareUpdateInfoResponse *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *firmwareInfo;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTXPCFirmwareUpdateInfoResponse;
  v5 = -[CTXPCMessage initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("firmware-update-info"));
    v11 = objc_claimAutoreleasedReturnValue();
    firmwareInfo = v5->_firmwareInfo;
    v5->_firmwareInfo = (NSDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CTXPCFirmwareUpdateInfoResponse;
  -[CTXPCMessage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_firmwareInfo, CFSTR("firmware-update-info"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setFirmwareInfo:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareInfo, 0);
}

@end
