@implementation HFNetworkRouterServiceState

+ (id)stateClassIdentifier
{
  return CFSTR("NetworkRouter");
}

+ (id)optionalCharacteristicTypes
{
  if (qword_1ED3787D0 != -1)
    dispatch_once(&qword_1ED3787D0, &__block_literal_global_164_2);
  return (id)qword_1ED3787D8;
}

void __58__HFNetworkRouterServiceState_optionalCharacteristicTypes__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8B50];
  v5[0] = *MEMORY[0x1E0CB89F8];
  v5[1] = v1;
  v5[2] = *MEMORY[0x1E0CB8B40];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED3787D8;
  qword_1ED3787D8 = v3;

}

+ (unint64_t)_typeForStatus:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 1;
  v4 = 3;
  if ((a3 & 0x20000000) == 0)
    v4 = 4;
  v5 = 2;
  if ((a3 & 0x40000002) == 0)
    v5 = v4;
  if ((a3 & 1) == 0)
    v3 = v5;
  if (a3)
    return v3;
  else
    return 0;
}

- (HFNetworkRouterServiceState)initWithBatchReadResponse:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  HFNetworkRouterServiceState *v24;
  uint64_t v25;
  unint64_t v26;
  HFNetworkRouterServiceState *v27;
  HFNetworkRouterServiceState *v28;
  objc_super v30;

  v4 = *MEMORY[0x1E0CB89F8];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = *MEMORY[0x1E0CB9B18];
  v7 = a3;
  objc_msgSend(v5, "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "responseForCharacteristicType:inServicesOfTypes:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueWithExpectedClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0CB8B50];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9B20]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "responseForCharacteristicType:inServicesOfTypes:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueWithExpectedClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *MEMORY[0x1E0CB8B40];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "responseForCharacteristicType:inServicesOfTypes:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "valueWithExpectedClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v19 = v18 == 0;
  else
    v19 = 1;
  v20 = v19;
  if (v20 == 1 && v14 == 0)
  {
    v24 = 0;
  }
  else
  {
    if ((v20 & 1) != 0)
    {
      v22 = objc_msgSend(v14, "integerValue");
      v23 = objc_msgSend(MEMORY[0x1E0CBA1A8], "networkRouterStatusFromWiFiSatelliteStatus:", v22);
    }
    else
    {
      v25 = objc_msgSend(v10, "integerValue");
      v23 = objc_msgSend(MEMORY[0x1E0CBA1A8], "networkRouterStatusFromRouterStatus:wanStatusListData:", v25, v18);
    }
    v26 = v23;
    v30.receiver = self;
    v30.super_class = (Class)HFNetworkRouterServiceState;
    v27 = -[HFNetworkRouterServiceState init](&v30, sel_init);
    v28 = v27;
    if (v27)
    {
      v27->_underlyingStatus = v26;
      v27->_type = objc_msgSend((id)objc_opt_class(), "_typeForStatus:", v26);
    }
    self = v28;
    v24 = self;
  }

  return v24;
}

+ (unint64_t)combinedType
{
  return 4;
}

+ (NSString)combinedStateTypeIdentifier
{
  return (NSString *)CFSTR("NoInternet");
}

- (id)stateTypeIdentifier
{
  id result;

  switch(-[HFNetworkRouterServiceState type](self, "type"))
  {
    case 1uLL:
      result = CFSTR("Unknown");
      break;
    case 2uLL:
      result = CFSTR("NotConnected");
      break;
    case 3uLL:
      result = CFSTR("NotReady");
      break;
    case 4uLL:
      +[HFNetworkRouterServiceState combinedStateTypeIdentifier](HFNetworkRouterServiceState, "combinedStateTypeIdentifier");
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      result = CFSTR("Connected");
      break;
  }
  return result;
}

- (int64_t)primaryState
{
  if (-[HFNetworkRouterServiceState type](self, "type"))
    return 2;
  else
    return 1;
}

- (int64_t)priority
{
  if (-[HFNetworkRouterServiceState type](self, "type"))
    return 1;
  else
    return -1;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)underlyingStatus
{
  return self->_underlyingStatus;
}

@end
