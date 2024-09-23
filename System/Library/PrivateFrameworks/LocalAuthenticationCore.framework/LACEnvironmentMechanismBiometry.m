@implementation LACEnvironmentMechanismBiometry

- (LACEnvironmentMechanismBiometry)initWithAvailabilityError:(id)a3 biometryType:(int64_t)a4 enrolled:(BOOL)a5 lockedOut:(BOOL)a6 stateHash:(id)a7 sensorInaccessible:(BOOL)a8 approvalState:(int64_t)a9
{
  id v16;
  id v17;
  void *v18;
  const __CFString *v19;
  LACEnvironmentMechanismBiometry *v20;
  objc_super v22;

  v16 = a7;
  v17 = a3;
  NSLocalizedStringFromLACBiometryType(a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a4)
  {
    case 1:
      v19 = CFSTR("touchid");
      break;
    case 2:
      v19 = CFSTR("faceid");
      break;
    case 4:
      v19 = CFSTR("opticid");
      break;
    default:
      v19 = CFSTR("questionmark");
      break;
  }
  v22.receiver = self;
  v22.super_class = (Class)LACEnvironmentMechanismBiometry;
  v20 = -[LACEnvironmentMechanism initWithAvailabilityError:localizedName:iconSystemName:](&v22, sel_initWithAvailabilityError_localizedName_iconSystemName_, v17, v18, v19);

  if (v20)
  {
    v20->_biometryType = a4;
    v20->_enrolled = a5;
    v20->_lockedOut = a6;
    objc_storeStrong((id *)&v20->_stateHash, a7);
    v20->_sensorInaccessible = a8;
    v20->_approvalState = a9;
  }

  return v20;
}

+ (id)environmentMechanismForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6
{
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  LACEnvironmentMechanismBiometry *v17;
  void *v18;
  int v19;
  id v20;
  __int128 v21;
  int64_t v22;
  void *v23;
  void *v24;
  LACEnvironmentMechanismBiometry *v25;
  void *v26;
  unsigned int v28;
  id v29;
  id v30;
  id v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v7 = *(_QWORD *)&a3;
  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_msgSend(v8, "biometryHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v17 = 0;
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v11 = objc_msgSend(v9, "isEnrolled:error:", v10, &v31);
  v12 = v31;
  if (!(_DWORD)v11)
    goto LABEL_5;
  v13 = (void *)objc_opt_new();
  v30 = v12;
  v14 = objc_msgSend(v9, "isLockedOutForUser:request:error:", v10, v13, &v30);
  v15 = v30;

  if (v14)
  {
    v12 = v15;
LABEL_5:
    v15 = v12;
    v28 = v11;
    v16 = v15;
    goto LABEL_8;
  }
  v28 = 0;
  v16 = 0;
LABEL_8:
  objc_msgSend(v8, "onenessSessionMonitor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isSessionActive");

  if (v19 && !v16)
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -6, CFSTR("Companion session is active"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = v9;
  v21 = *(_OWORD *)&a4->var0[4];
  v33 = *(_OWORD *)a4->var0;
  v34 = v21;
  if (objc_msgSend(v20, "biometryType") == 2)
  {
    v32[0] = v33;
    v32[1] = v34;
    v22 = +[LACTCCHelper approvalStateOfFaceIDSeviceForAuditToken:](LACTCCHelper, "approvalStateOfFaceIDSeviceForAuditToken:", v32);
  }
  else
  {
    v22 = 1;
  }
  if (!v22 && !v16)
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1018, CFSTR("User has denied the use of biometry for this app."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = v8;
  v23 = (void *)v10;
  if ((_DWORD)v11)
  {
    objc_msgSend(v20, "biometryDatabaseHashForUser:error:", v10, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  v25 = [LACEnvironmentMechanismBiometry alloc];
  v26 = v16;
  if (!v16)
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1004, CFSTR("User interaction is required"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = -[LACEnvironmentMechanismBiometry initWithAvailabilityError:biometryType:enrolled:lockedOut:stateHash:sensorInaccessible:approvalState:](v25, "initWithAvailabilityError:biometryType:enrolled:lockedOut:stateHash:sensorInaccessible:approvalState:", v26, objc_msgSend(v20, "biometryType"), v11, v28, v24, 0, v22);
  if (!v16)

  v8 = v29;
LABEL_25:

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  int64_t v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)LACEnvironmentMechanismBiometry;
  v4 = a3;
  -[LACEnvironmentMechanism encodeWithCoder:](&v17, sel_encodeWithCoder_, v4);
  v5 = -[LACEnvironmentMechanismBiometry biometryType](self, "biometryType", v17.receiver, v17.super_class);
  NSStringFromSelector(sel_biometryType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  v7 = -[LACEnvironmentMechanismBiometry enrolled](self, "enrolled");
  NSStringFromSelector(sel_enrolled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v7, v8);

  v9 = -[LACEnvironmentMechanismBiometry lockedOut](self, "lockedOut");
  NSStringFromSelector(sel_lockedOut);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v9, v10);

  -[LACEnvironmentMechanismBiometry stateHash](self, "stateHash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_stateHash);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  v13 = -[LACEnvironmentMechanismBiometry sensorInaccessible](self, "sensorInaccessible");
  NSStringFromSelector(sel_sensorInaccessible);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v13, v14);

  v15 = -[LACEnvironmentMechanismBiometry approvalState](self, "approvalState");
  NSStringFromSelector(sel_approvalState);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt:forKey:", v15, v16);

}

- (LACEnvironmentMechanismBiometry)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  LACEnvironmentMechanismBiometry *v13;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v19;
  void *v20;

  v3 = a3;
  NSStringFromSelector(sel_availabilityError);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_biometryType);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "decodeIntegerForKey:", v19);
  NSStringFromSelector(sel_enrolled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "decodeBoolForKey:", v4);
  NSStringFromSelector(sel_lockedOut);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "decodeBoolForKey:", v5);
  NSStringFromSelector(sel_stateHash);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sensorInaccessible);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "decodeBoolForKey:", v9);
  NSStringFromSelector(sel_approvalState);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "decodeIntForKey:", v11);

  v13 = -[LACEnvironmentMechanismBiometry initWithAvailabilityError:biometryType:enrolled:lockedOut:stateHash:sensorInaccessible:approvalState:](self, "initWithAvailabilityError:biometryType:enrolled:lockedOut:stateHash:sensorInaccessible:approvalState:", v17, v16, v15, v6, v8, v10, v12);
  return v13;
}

- (id)descriptionDetails
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("biometryType: %d"), -[LACEnvironmentMechanismBiometry biometryType](self, "biometryType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  if (!-[LACEnvironmentMechanismBiometry enrolled](self, "enrolled"))
    objc_msgSend(v3, "addObject:", CFSTR("not enrolled"));
  if (-[LACEnvironmentMechanismBiometry lockedOut](self, "lockedOut"))
    objc_msgSend(v3, "addObject:", CFSTR("locked out"));
  if (-[LACEnvironmentMechanismBiometry sensorInaccessible](self, "sensorInaccessible"))
    objc_msgSend(v3, "addObject:", CFSTR("sensor inaccessible"));
  if (-[LACEnvironmentMechanismBiometry approvalState](self, "approvalState") != 1)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromLACEnvironmentMechanismApprovalState(-[LACEnvironmentMechanismBiometry approvalState](self, "approvalState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("approvalState: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LACEnvironmentMechanismBiometry *v4;
  LACEnvironmentMechanismBiometry *v5;
  int64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  _BOOL4 v17;
  objc_super v18;

  v4 = (LACEnvironmentMechanismBiometry *)a3;
  if (v4 == self)
  {
    LOBYTE(v15) = 1;
    goto LABEL_13;
  }
  v18.receiver = self;
  v18.super_class = (Class)LACEnvironmentMechanismBiometry;
  if (!-[LACEnvironmentMechanism isEqual:](&v18, sel_isEqual_, v4)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v15) = 0;
    goto LABEL_13;
  }
  v5 = v4;
  v6 = -[LACEnvironmentMechanismBiometry biometryType](self, "biometryType");
  if (v6 != -[LACEnvironmentMechanismBiometry biometryType](v5, "biometryType"))
    goto LABEL_9;
  v7 = -[LACEnvironmentMechanismBiometry enrolled](self, "enrolled");
  if (v7 != -[LACEnvironmentMechanismBiometry enrolled](v5, "enrolled"))
    goto LABEL_9;
  v8 = -[LACEnvironmentMechanismBiometry lockedOut](self, "lockedOut");
  if (v8 != -[LACEnvironmentMechanismBiometry lockedOut](v5, "lockedOut"))
    goto LABEL_9;
  -[LACEnvironmentMechanismBiometry stateHash](self, "stateHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACEnvironmentMechanismBiometry stateHash](v5, "stateHash");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v9 == (void *)v10)
  {

    goto LABEL_15;
  }
  v11 = (void *)v10;
  -[LACEnvironmentMechanismBiometry stateHash](self, "stateHash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACEnvironmentMechanismBiometry stateHash](v5, "stateHash");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToData:", v13);

  if (v14)
  {
LABEL_15:
    v17 = -[LACEnvironmentMechanismBiometry sensorInaccessible](self, "sensorInaccessible");
    v15 = v17 ^ -[LACEnvironmentMechanismBiometry sensorInaccessible](v5, "sensorInaccessible") ^ 1;
    goto LABEL_10;
  }
LABEL_9:
  LOBYTE(v15) = 0;
LABEL_10:

LABEL_13:
  return v15;
}

- (int64_t)biometryType
{
  return self->_biometryType;
}

- (BOOL)enrolled
{
  return self->_enrolled;
}

- (BOOL)lockedOut
{
  return self->_lockedOut;
}

- (NSData)stateHash
{
  return self->_stateHash;
}

- (BOOL)sensorInaccessible
{
  return self->_sensorInaccessible;
}

- (int64_t)approvalState
{
  return self->_approvalState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateHash, 0);
}

@end
