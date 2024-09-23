@implementation HMDSessionControl

- (HMDSessionControl)initWithCommand:(unint64_t)a3 sessionIdentifier:(id)a4
{
  id v7;
  HMDSessionControl *v8;
  HMDSessionControl *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDSessionControl;
  v8 = -[HMDSessionControl init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_controlCommand = a3;
    objc_storeStrong((id *)&v8->_sessionID, a4);
  }

  return v9;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  NSUUID *v8;
  NSUUID *sessionID;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BB90], "wrappertlv:name:", 2, CFSTR("kSessionControl__Command"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1BC38], "wrappertlv:name:", 1, CFSTR("kSessionControl__SessionIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v11[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HAPTLVBase _parse:](self, "_parse:", v5);
  if (v6)
  {
    objc_msgSend(v3, "field");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_controlCommand = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "field");
    v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    sessionID = self->_sessionID;
    self->_sessionID = v8;

  }
  return v6;
}

- (NSData)tlvData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE1BC10], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDSessionControl controlCommand](self, "controlCommand"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 2, v4);

  -[HMDSessionControl sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:uuid:", 1, v5);

  objc_msgSend(v3, "serialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v6;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ tlvDatablob = %@ "), v6, v8);

  v9 = -[HMDSessionControl controlCommand](self, "controlCommand");
  if (v9 >= 5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown HMDSessionControlCommand %tu"), v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_24E7880E8[v9];
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ controlCommand = %@ "), v6, v10);

  -[HMDSessionControl sessionID](self, "sessionID");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ sessionID = %@ "), v6, v11);

}

- (HMDSessionControl)initWithCoder:(id)a3
{
  id v4;
  HMDSessionControl *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSUUID *sessionID;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDSessionControl;
  v5 = -[HMDSessionControl init](&v12, sel_init);
  if (v5)
  {
    v5->_controlCommand = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("kSessionControl__Command"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v13[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kSessionControl__SessionIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSUUID *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[HMDSessionControl controlCommand](self, "controlCommand"), CFSTR("kSessionControl__Command"));
  -[HMDSessionControl sessionID](self, "sessionID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kSessionControl__SessionIdentifier"));

}

- (unint64_t)controlCommand
{
  return self->_controlCommand;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
