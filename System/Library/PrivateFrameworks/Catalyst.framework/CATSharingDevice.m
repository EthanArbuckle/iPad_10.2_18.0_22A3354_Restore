@implementation CATSharingDevice

- (CATSharingDevice)initWithIdentifier:(id)a3 modelIdentifier:(id)a4 RSSI:(int64_t)a5 paired:(BOOL)a6 pairingState:(unint64_t)a7 detectionTime:(id)a8
{
  id v15;
  id v16;
  id v17;
  CATSharingDevice *v18;
  CATSharingDevice *v19;
  uint64_t v20;
  NSString *modelIdentifier;
  objc_super v23;

  v15 = a3;
  v16 = a4;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)CATSharingDevice;
  v18 = -[CATSharingDevice init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    v20 = objc_msgSend(v16, "copy");
    modelIdentifier = v19->_modelIdentifier;
    v19->_modelIdentifier = (NSString *)v20;

    v19->_paired = a6;
    v19->_RSSI = a5;
    v19->_pairingState = a7;
    objc_storeStrong((id *)&v19->_detectionTime, a8);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  CATSharingDevice *v4;
  CATSharingDevice *v5;
  CATSharingDevice *v6;
  BOOL v7;

  v4 = (CATSharingDevice *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = -[CATSharingDevice isEqualToDevice:](self, "isEqualToDevice:", v6);

  }
  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CATSharingDevice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CATSharingDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATSharingDevice modelIdentifier](self, "modelIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CATSharingDevice RSSI](self, "RSSI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CATSharingDevice isPaired](self, "isPaired"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CATSharingDevice unlocalizedDescriptivePairingStateForPairingState:](CATSharingDevice, "unlocalizedDescriptivePairingStateForPairingState:", -[CATSharingDevice pairingState](self, "pairingState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATSharingDevice detectionTime](self, "detectionTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> identifier: %@, modelIdentifier: %@, RSSI: %@, paired: %@, pairingState: %@, detectionTime: %@"), v4, self, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[CATSharingDevice identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v8))
    {
      -[CATSharingDevice modelIdentifier](self, "modelIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "modelIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)unlocalizedDescriptivePairingStateForPairingState:(unint64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;

  if (a3 >= 4)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Unknown pairingState: %@"), v5);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = off_24C1C6090[a3];
  }
  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (int64_t)RSSI
{
  return self->_RSSI;
}

- (BOOL)isPaired
{
  return self->_paired;
}

- (unint64_t)pairingState
{
  return self->_pairingState;
}

- (NSDate)detectionTime
{
  return self->_detectionTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionTime, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
