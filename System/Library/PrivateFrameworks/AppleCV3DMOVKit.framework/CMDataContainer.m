@implementation CMDataContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)versionS
{
  return CFSTR("1.1.0");
}

+ (id)classes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[11];

  v6[10] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  v6[8] = objc_opt_class();
  v6[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)resetReader
{
  self->nextEvent = 0;
  *(_OWORD *)&self->nextMsgSent = 0u;
  *(_OWORD *)&self->nextDataSent = 0u;
}

- (CMDataContainer)init
{
  CMDataContainer *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMDataContainer;
  v2 = -[CMDataContainer init](&v10, sel_init);
  if (v2)
  {
    +[CMDataContainer versionS](CMDataContainer, "versionS");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDataContainer setVersion:](v2, "setVersion:", v3);

    v4 = (void *)objc_opt_new();
    -[CMDataContainer setCmDataSent:](v2, "setCmDataSent:", v4);

    v5 = (void *)objc_opt_new();
    -[CMDataContainer setCmDataRecv:](v2, "setCmDataRecv:", v5);

    v6 = (void *)objc_opt_new();
    -[CMDataContainer setCmMsgSent:](v2, "setCmMsgSent:", v6);

    v7 = (void *)objc_opt_new();
    -[CMDataContainer setCmMsgRecv:](v2, "setCmMsgRecv:", v7);

    v8 = (void *)objc_opt_new();
    -[CMDataContainer setCmEvents:](v2, "setCmEvents:", v8);

  }
  return v2;
}

- (CMDataContainer)initWithCoder:(id)a3
{
  id v4;
  CMDataContainer *v5;
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
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CMDataContainer;
  v5 = -[CMDataContainer init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("v"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDataContainer setVersion:](v5, "setVersion:", v7);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("cv"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDataContainer setCvPlayerVersion:](v5, "setCvPlayerVersion:", v8);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("cv3d"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDataContainer setCv3dVersion:](v5, "setCv3dVersion:", v9);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("iOS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDataContainer setIOSVersion:](v5, "setIOSVersion:", v10);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("macOS"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDataContainer setMacOSVersion:](v5, "setMacOSVersion:", v11);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("hw"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDataContainer setDeviceString:](v5, "setDeviceString:", v12);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("sid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDataContainer setSessionID:](v5, "setSessionID:", v13);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("dsd"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDataContainer setCmDataSent:](v5, "setCmDataSent:", v14);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("drv"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDataContainer setCmDataRecv:](v5, "setCmDataRecv:", v15);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ds"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDataContainer setCmMsgSent:](v5, "setCmMsgSent:", v16);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("dr"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDataContainer setCmMsgRecv:](v5, "setCmMsgRecv:", v17);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("e"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDataContainer setCmEvents:](v5, "setCmEvents:", v18);

    objc_autoreleasePoolPop(v6);
    -[CMDataContainer resetReader](v5, "resetReader");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
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
  id v17;

  v17 = a3;
  v4 = (void *)MEMORY[0x212BC8864]();
  -[CMDataContainer version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v5, CFSTR("v"));

  -[CMDataContainer cvPlayerVersion](self, "cvPlayerVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v6, CFSTR("cv"));

  -[CMDataContainer cv3dVersion](self, "cv3dVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v7, CFSTR("cv3d"));

  -[CMDataContainer iOSVersion](self, "iOSVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v8, CFSTR("ios"));

  -[CMDataContainer macOSVersion](self, "macOSVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v9, CFSTR("macOS"));

  -[CMDataContainer deviceString](self, "deviceString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v10, CFSTR("hw"));

  -[CMDataContainer sessionID](self, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v11, CFSTR("sid"));

  -[CMDataContainer cmDataSent](self, "cmDataSent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v12, CFSTR("dsd"));

  -[CMDataContainer cmDataRecv](self, "cmDataRecv");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v13, CFSTR("drv"));

  -[CMDataContainer cmMsgSent](self, "cmMsgSent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v14, CFSTR("ds"));

  -[CMDataContainer cmMsgRecv](self, "cmMsgRecv");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v15, CFSTR("dr"));

  -[CMDataContainer cmEvents](self, "cmEvents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v16, CFSTR("e"));

  objc_autoreleasePoolPop(v4);
}

- (void)appendCMData:(id)a3 sending:(BOOL)a4
{
  _BOOL4 v4;
  CMDataContainer *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (v4)
    -[CMDataContainer cmDataSent](v6, "cmDataSent");
  else
    -[CMDataContainer cmDataRecv](v6, "cmDataRecv");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  objc_sync_exit(v6);
}

- (void)appendCMMessage:(id)a3 sending:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  if (v4)
    -[CMDataContainer cmMsgSent](self, "cmMsgSent");
  else
    -[CMDataContainer cmMsgRecv](self, "cmMsgRecv");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

- (void)appendCMEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CMDataContainer cmEvents](self, "cmEvents");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)grabNextDataRecv
{
  unint64_t nextDataRecv;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  nextDataRecv = self->nextDataRecv;
  -[CMDataContainer cmDataRecv](self, "cmDataRecv");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (nextDataRecv >= v5)
    return 0;
  -[CMDataContainer cmDataRecv](self, "cmDataRecv");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ++self->nextDataRecv;
  objc_msgSend(v6, "objectAtIndexedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setIsSent:", 0);
  return v7;
}

- (id)grabNextDataSent
{
  unint64_t nextDataSent;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  nextDataSent = self->nextDataSent;
  -[CMDataContainer cmDataSent](self, "cmDataSent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (nextDataSent >= v5)
    return 0;
  -[CMDataContainer cmDataSent](self, "cmDataSent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ++self->nextDataSent;
  objc_msgSend(v6, "objectAtIndexedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setIsSent:", 1);
  return v7;
}

- (id)grabNextMessageRecv
{
  unint64_t nextMsgRecv;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  nextMsgRecv = self->nextMsgRecv;
  -[CMDataContainer cmMsgRecv](self, "cmMsgRecv");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (nextMsgRecv >= v5)
    return 0;
  -[CMDataContainer cmMsgRecv](self, "cmMsgRecv");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ++self->nextMsgRecv;
  objc_msgSend(v6, "objectAtIndexedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setIsSent:", 0);
  return v7;
}

- (id)grabNextMessageSent
{
  unint64_t nextMsgSent;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  nextMsgSent = self->nextMsgSent;
  -[CMDataContainer cmMsgSent](self, "cmMsgSent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (nextMsgSent >= v5)
    return 0;
  -[CMDataContainer cmMsgSent](self, "cmMsgSent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ++self->nextMsgSent;
  objc_msgSend(v6, "objectAtIndexedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setIsSent:", 1);
  return v7;
}

- (id)grabNextEvent
{
  unint64_t nextEvent;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  nextEvent = self->nextEvent;
  -[CMDataContainer cmEvents](self, "cmEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (nextEvent >= v5)
    return 0;
  -[CMDataContainer cmEvents](self, "cmEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ++self->nextEvent;
  objc_msgSend(v6, "objectAtIndexedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSString)cv3dVersion
{
  return self->_cv3dVersion;
}

- (void)setCv3dVersion:(id)a3
{
  objc_storeStrong((id *)&self->_cv3dVersion, a3);
}

- (NSString)iOSVersion
{
  return self->_iOSVersion;
}

- (void)setIOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_iOSVersion, a3);
}

- (NSString)macOSVersion
{
  return self->_macOSVersion;
}

- (void)setMacOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_macOSVersion, a3);
}

- (NSString)cvPlayerVersion
{
  return self->_cvPlayerVersion;
}

- (void)setCvPlayerVersion:(id)a3
{
  objc_storeStrong((id *)&self->_cvPlayerVersion, a3);
}

- (NSString)deviceString
{
  return self->_deviceString;
}

- (void)setDeviceString:(id)a3
{
  objc_storeStrong((id *)&self->_deviceString, a3);
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSMutableArray)cmDataSent
{
  return self->_cmDataSent;
}

- (void)setCmDataSent:(id)a3
{
  objc_storeStrong((id *)&self->_cmDataSent, a3);
}

- (NSMutableArray)cmDataRecv
{
  return self->_cmDataRecv;
}

- (void)setCmDataRecv:(id)a3
{
  objc_storeStrong((id *)&self->_cmDataRecv, a3);
}

- (NSMutableArray)cmMsgSent
{
  return self->_cmMsgSent;
}

- (void)setCmMsgSent:(id)a3
{
  objc_storeStrong((id *)&self->_cmMsgSent, a3);
}

- (NSMutableArray)cmMsgRecv
{
  return self->_cmMsgRecv;
}

- (void)setCmMsgRecv:(id)a3
{
  objc_storeStrong((id *)&self->_cmMsgRecv, a3);
}

- (NSMutableArray)cmEvents
{
  return self->_cmEvents;
}

- (void)setCmEvents:(id)a3
{
  objc_storeStrong((id *)&self->_cmEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmEvents, 0);
  objc_storeStrong((id *)&self->_cmMsgRecv, 0);
  objc_storeStrong((id *)&self->_cmMsgSent, 0);
  objc_storeStrong((id *)&self->_cmDataRecv, 0);
  objc_storeStrong((id *)&self->_cmDataSent, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_deviceString, 0);
  objc_storeStrong((id *)&self->_cvPlayerVersion, 0);
  objc_storeStrong((id *)&self->_macOSVersion, 0);
  objc_storeStrong((id *)&self->_iOSVersion, 0);
  objc_storeStrong((id *)&self->_cv3dVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
