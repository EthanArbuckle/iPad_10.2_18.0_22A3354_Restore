@implementation CHSRemoteDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_relationshipID, CFSTR("relationshipID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceID, CFSTR("deviceID"));
  objc_msgSend(v4, "encodeInt32:forKey:", LODWORD(self->_currentSupportedVersion), CFSTR("currentSupportedVersion"));
  objc_msgSend(v4, "encodeInt32:forKey:", LODWORD(self->_minSupportedVersion), CFSTR("minSupportedVersion"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isPossibleSource, CFSTR("isPossibleSource"));
  objc_msgSend(v4, "encodeInt32:forKey:", LODWORD(self->_pairingState), CFSTR("pairingState"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastConnectionDate, CFSTR("lastConnectionDate"));

}

- (CHSRemoteDevice)initWithName:(id)a3 relationshipID:(id)a4 deviceID:(id)a5 currentSupportedVersion:(int64_t)a6 minSupportedVersion:(int64_t)a7 isPossibleSource:(BOOL)a8 pairingState:(int64_t)a9 lastConnectionDate:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  CHSRemoteDevice *v20;
  uint64_t v21;
  NSString *name;
  uint64_t v23;
  NSUUID *relationshipID;
  uint64_t v25;
  NSString *deviceID;
  uint64_t v27;
  NSDate *lastConnectionDate;
  objc_super v30;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a10;
  v30.receiver = self;
  v30.super_class = (Class)CHSRemoteDevice;
  v20 = -[CHSRemoteDevice init](&v30, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v16, "copy");
    name = v20->_name;
    v20->_name = (NSString *)v21;

    v23 = objc_msgSend(v17, "copy");
    relationshipID = v20->_relationshipID;
    v20->_relationshipID = (NSUUID *)v23;

    v25 = objc_msgSend(v18, "copy");
    deviceID = v20->_deviceID;
    v20->_deviceID = (NSString *)v25;

    v20->_currentSupportedVersion = a6;
    v20->_minSupportedVersion = a7;
    v20->_isPossibleSource = a8;
    v20->_pairingState = a9;
    v27 = objc_msgSend(v19, "copy");
    lastConnectionDate = v20->_lastConnectionDate;
    v20->_lastConnectionDate = (NSDate *)v27;

  }
  return v20;
}

- (CHSRemoteDevice)initWithCoder:(id)a3
{
  id v4;
  CHSRemoteDevice *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSUUID *relationshipID;
  uint64_t v10;
  NSString *deviceID;
  uint64_t v12;
  NSDate *lastConnectionDate;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CHSRemoteDevice;
  v5 = -[CHSRemoteDevice init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relationshipID"));
    v8 = objc_claimAutoreleasedReturnValue();
    relationshipID = v5->_relationshipID;
    v5->_relationshipID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceID"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceID = v5->_deviceID;
    v5->_deviceID = (NSString *)v10;

    v5->_currentSupportedVersion = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("currentSupportedVersion"));
    v5->_minSupportedVersion = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("minSupportedVersion"));
    v5->_isPossibleSource = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPossibleSource"));
    v5->_pairingState = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pairingState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastConnectionDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastConnectionDate = v5->_lastConnectionDate;
    v5->_lastConnectionDate = (NSDate *)v12;

  }
  return v5;
}

- (id)_initWithDevice:(id)a3
{
  id *v4;
  CHSRemoteDevice *v5;
  CHSRemoteDevice *v6;
  objc_super v8;

  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CHSRemoteDevice;
  v5 = -[CHSRemoteDevice init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_name, v4[1]);
    objc_storeStrong((id *)&v6->_relationshipID, v4[2]);
    objc_storeStrong((id *)&v6->_deviceID, v4[3]);
    v6->_currentSupportedVersion = (int64_t)v4[4];
    v6->_minSupportedVersion = (int64_t)v4[5];
    v6->_isPossibleSource = *((_BYTE *)v4 + 48);
    v6->_pairingState = (int64_t)v4[7];
    objc_storeStrong((id *)&v6->_lastConnectionDate, v4[8]);
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  _BOOL8 v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CHSRemoteDevice name](self, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSRemoteDevice relationshipID](self, "relationshipID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSRemoteDevice deviceID](self, "deviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CHSRemoteDevice currentSupportedVersion](self, "currentSupportedVersion");
  v8 = -[CHSRemoteDevice minSupportedVersion](self, "minSupportedVersion");
  v9 = -[CHSRemoteDevice isPossibleSource](self, "isPossibleSource");
  v10 = -[CHSRemoteDevice pairingState](self, "pairingState");
  -[CHSRemoteDevice lastConnectionDate](self, "lastConnectionDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("name: %@, relationshipID: %@, deviceID: %@, currentSupportedVersion: %lu, minSupportedVersion: %lu, isPossibleSource: %u, pairingState: %lu, lastConnectionDate: %@"), v15, v5, v6, v7, v8, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  NSString *name;
  uint64_t v11;
  id v12;
  id v13;
  NSUUID *relationshipID;
  id v15;
  id v16;
  NSString *deviceID;
  id v18;
  id v19;
  int64_t currentSupportedVersion;
  id v21;
  id v22;
  int64_t minSupportedVersion;
  id v24;
  id v25;
  _BOOL8 isPossibleSource;
  id v27;
  id v28;
  int64_t pairingState;
  id v30;
  id v31;
  NSDate *lastConnectionDate;
  id v33;
  id v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v4;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  name = self->_name;
  v11 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __27__CHSRemoteDevice_isEqual___block_invoke;
  v53[3] = &unk_1E2A5A5A8;
  v12 = v9;
  v54 = v12;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", name, v53);
  relationshipID = self->_relationshipID;
  v51[0] = v11;
  v51[1] = 3221225472;
  v51[2] = __27__CHSRemoteDevice_isEqual___block_invoke_2;
  v51[3] = &unk_1E2A5B080;
  v15 = v12;
  v52 = v15;
  v16 = (id)objc_msgSend(v5, "appendObject:counterpart:", relationshipID, v51);
  deviceID = self->_deviceID;
  v49[0] = v11;
  v49[1] = 3221225472;
  v49[2] = __27__CHSRemoteDevice_isEqual___block_invoke_3;
  v49[3] = &unk_1E2A5A5A8;
  v18 = v15;
  v50 = v18;
  v19 = (id)objc_msgSend(v5, "appendObject:counterpart:", deviceID, v49);
  currentSupportedVersion = self->_currentSupportedVersion;
  v47[0] = v11;
  v47[1] = 3221225472;
  v47[2] = __27__CHSRemoteDevice_isEqual___block_invoke_4;
  v47[3] = &unk_1E2A5A5D0;
  v21 = v18;
  v48 = v21;
  v22 = (id)objc_msgSend(v5, "appendInteger:counterpart:", currentSupportedVersion, v47);
  minSupportedVersion = self->_minSupportedVersion;
  v45[0] = v11;
  v45[1] = 3221225472;
  v45[2] = __27__CHSRemoteDevice_isEqual___block_invoke_5;
  v45[3] = &unk_1E2A5A5D0;
  v24 = v21;
  v46 = v24;
  v25 = (id)objc_msgSend(v5, "appendInteger:counterpart:", minSupportedVersion, v45);
  isPossibleSource = self->_isPossibleSource;
  v43[0] = v11;
  v43[1] = 3221225472;
  v43[2] = __27__CHSRemoteDevice_isEqual___block_invoke_6;
  v43[3] = &unk_1E2A5A508;
  v27 = v24;
  v44 = v27;
  v28 = (id)objc_msgSend(v5, "appendBool:counterpart:", isPossibleSource, v43);
  pairingState = self->_pairingState;
  v41[0] = v11;
  v41[1] = 3221225472;
  v41[2] = __27__CHSRemoteDevice_isEqual___block_invoke_7;
  v41[3] = &unk_1E2A5A5D0;
  v30 = v27;
  v42 = v30;
  v31 = (id)objc_msgSend(v5, "appendInteger:counterpart:", pairingState, v41);
  lastConnectionDate = self->_lastConnectionDate;
  v36 = v11;
  v37 = 3221225472;
  v38 = __27__CHSRemoteDevice_isEqual___block_invoke_8;
  v39 = &unk_1E2A5B0A8;
  v33 = v30;
  v40 = v33;
  v34 = (id)objc_msgSend(v5, "appendObject:counterpart:", lastConnectionDate, &v36);
  LOBYTE(v30) = objc_msgSend(v5, "isEqual", v36, v37, v38, v39);

  return (char)v30;
}

uint64_t __27__CHSRemoteDevice_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "name");
}

uint64_t __27__CHSRemoteDevice_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relationshipID");
}

uint64_t __27__CHSRemoteDevice_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deviceID");
}

uint64_t __27__CHSRemoteDevice_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "currentSupportedVersion");
}

uint64_t __27__CHSRemoteDevice_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "minSupportedVersion");
}

uint64_t __27__CHSRemoteDevice_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isPossibleSource");
}

uint64_t __27__CHSRemoteDevice_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pairingState");
}

uint64_t __27__CHSRemoteDevice_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "lastConnectionDate");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHSRemoteDevice _initWithDevice:](+[CHSRemoteDevice allocWithZone:](CHSRemoteDevice, "allocWithZone:", a3), "_initWithDevice:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CHSRemoteDevice _initWithDevice:](+[CHSMutableRemoteDevice allocWithZone:](CHSMutableRemoteDevice, "allocWithZone:", a3), "_initWithDevice:", self);
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)relationshipID
{
  return self->_relationshipID;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (int64_t)currentSupportedVersion
{
  return self->_currentSupportedVersion;
}

- (int64_t)minSupportedVersion
{
  return self->_minSupportedVersion;
}

- (BOOL)isPossibleSource
{
  return self->_isPossibleSource;
}

- (int64_t)pairingState
{
  return self->_pairingState;
}

- (NSDate)lastConnectionDate
{
  return self->_lastConnectionDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastConnectionDate, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_relationshipID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
