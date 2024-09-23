@implementation CODiscoveryRecord

- (id)_initWithConstituent:(id)a3 rapportIdentifier:(id)a4 IDSIdentifier:(id)a5 destinations:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CODiscoveryRecord *v15;
  CODiscoveryRecord *v16;
  uint64_t v17;
  id companionLinkProvider;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CODiscoveryRecord;
  v15 = -[CODiscoveryRecord init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_constituent, a3);
    objc_storeStrong((id *)&v16->_rapportIdentifier, a4);
    objc_storeStrong((id *)&v16->_IDSIdentifier, a5);
    objc_storeStrong((id *)&v16->_destinations, a6);
    objc_initWeak(&location, v16);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __87__CODiscoveryRecord__initWithConstituent_rapportIdentifier_IDSIdentifier_destinations___block_invoke;
    v20[3] = &unk_24D4B4370;
    objc_copyWeak(&v21, &location);
    v17 = MEMORY[0x2199F3D40](v20);
    companionLinkProvider = v16->_companionLinkProvider;
    v16->_companionLinkProvider = (id)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v16;
}

id __87__CODiscoveryRecord__initWithConstituent_rapportIdentifier_IDSIdentifier_destinations___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x24BE7CBF0];
    objc_msgSend(WeakRetained, "companionLinkDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sourceTransport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dispatchQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "co_companionLinkClientToDevice:dispatchQueue:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (CODiscoveryRecord)discoveryRecordWithNodeController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_msgSend(v4, "node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rapportTransport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destinationDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "idsDeviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ipAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "listeningPort");
  if (v13 < 1)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(a1, "_destinationForPeerAddress:listeningPort:", v12, (unsigned __int16)v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = 0;
  if (v6 && v10 && v11 && v14)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF00]), "initWithObject:", v14);
    v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithConstituent:rapportIdentifier:IDSIdentifier:destinations:", v6, v10, v11, v16);

  }
  return (CODiscoveryRecord *)v15;
}

+ (CODiscoveryRecord)discoveryRecordWithNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "remote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destinationDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IDSIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ipAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "listeningPort");
  if (v11 < 1)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(a1, "_destinationForPeerAddress:listeningPort:", v10, (unsigned __int16)v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = 0;
  if (v5 && v8 && v9 && v12)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF00]), "initWithObject:", v12);
    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithConstituent:rapportIdentifier:IDSIdentifier:destinations:", v5, v8, v9, v14);

  }
  return (CODiscoveryRecord *)v13;
}

+ (CODiscoveryRecord)discoveryRecordWithConstituent:(id)a3 rapportIdentifier:(id)a4 IDSIdentifier:(id)a5 peerAddress:(id)a6 port:(int)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(a1, "_destinationForPeerAddress:listeningPort:", a6, (unsigned __int16)a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");
  if (!a7 || v16)
  {
    if (v15)
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF00]), "initWithObject:", v15);
    else
      v18 = objc_alloc_init(MEMORY[0x24BDBCF00]);
    v19 = v18;
    v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithConstituent:rapportIdentifier:IDSIdentifier:destinations:", v12, v13, v14, v18);

  }
  else
  {
    v17 = 0;
  }

  return (CODiscoveryRecord *)v17;
}

- (CODiscoveryRecord)initWithDiscoveryRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CODiscoveryRecord *v13;

  v4 = a3;
  objc_msgSend(v4, "constituent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "rapportIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "IDSIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "destinations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v11, "copy");
  v13 = -[CODiscoveryRecord _initWithConstituent:rapportIdentifier:IDSIdentifier:destinations:](self, "_initWithConstituent:rapportIdentifier:IDSIdentifier:destinations:", v6, v8, v10, v12);

  return v13;
}

- (CODiscoveryRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  CODiscoveryRecord *v17;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")) == 1)
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("constituent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rapportIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IDSIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("destinations"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v12 = (void *)objc_msgSend(v11, "copy");
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
      {
        v14 = v13;
        v19 = v7;
        v20 = v8;
        v15 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v11 = 0;
              goto LABEL_16;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v14)
            continue;
          break;
        }
LABEL_16:
        v7 = v19;
        v8 = v20;
      }

      if (!v8)
        goto LABEL_22;
    }
    else
    {

      v11 = 0;
      if (!v8)
        goto LABEL_22;
    }
    if (v9 && v10 && v11)
    {
      v17 = -[CODiscoveryRecord _initWithConstituent:rapportIdentifier:IDSIdentifier:destinations:](self, "_initWithConstituent:rapportIdentifier:IDSIdentifier:destinations:", v8, v9, v10, v11);
LABEL_23:

      goto LABEL_24;
    }
LABEL_22:

    v17 = 0;
    goto LABEL_23;
  }

  v17 = 0;
LABEL_24:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("version"));
  -[CODiscoveryRecord constituent](self, "constituent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("constituent"));

  -[CODiscoveryRecord rapportIdentifier](self, "rapportIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("rapportIdentifier"));

  -[CODiscoveryRecord IDSIdentifier](self, "IDSIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("IDSIdentifier"));

  -[CODiscoveryRecord destinations](self, "destinations");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("destinations"));

}

- (void)setCompanionLinkProvider:(id)a3
{
  void *v4;
  id companionLinkProvider;

  v4 = (void *)MEMORY[0x2199F3D40](a3, a2);
  companionLinkProvider = self->_companionLinkProvider;
  self->_companionLinkProvider = v4;

}

- (id)companionLinkProvider
{
  return (id)MEMORY[0x2199F3D40](self->_companionLinkProvider, a2);
}

- (NSUUID)HomeKitIdentifier
{
  NSUUID *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSUUID *i;
  void *v10;
  void *v11;
  NSUUID *v12;
  NSUUID *HomeKitIdentifier;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = self->_HomeKitIdentifier;
  if (!v3)
  {
    -[CODiscoveryRecord IDSIdentifier](self, "IDSIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[CODiscoveryRecord sourceTransport](self, "sourceTransport", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = (NSUUID *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v3)
    {
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v3; i = (NSUUID *)((char *)i + 1))
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v7);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "idsDeviceIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 && !objc_msgSend(v4, "compare:options:", v11, 1))
          {
            objc_msgSend(v10, "homeKitIdentifier");
            v12 = (NSUUID *)objc_claimAutoreleasedReturnValue();
            HomeKitIdentifier = self->_HomeKitIdentifier;
            self->_HomeKitIdentifier = v12;

            v3 = v12;
            goto LABEL_13;
          }

        }
        v3 = (NSUUID *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v3;
}

- (BOOL)producesElectionCapableTransport
{
  void *v2;
  void *v3;
  char v4;

  -[CODiscoveryRecord sourceTransport](self, "sourceTransport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "leaderElectionConfigured");

  return v4;
}

- (BOOL)requiresInquiry
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CODiscoveryRecord initWithDiscoveryRecord:]([COMutableDiscoveryRecord alloc], "initWithDiscoveryRecord:", self);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CODiscoveryRecord constituent](self, "constituent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CODiscoveryRecord rapportIdentifier](self, "rapportIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CODiscoveryRecord IDSIdentifier](self, "IDSIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CODiscoveryRecord destinations](self, "destinations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, c(%@) r(%@) i(%@) d(%@)>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CODiscoveryRecord constituent](self, "constituent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CODiscoveryRecord *v4;
  CODiscoveryRecord *v5;
  BOOL v6;

  v4 = (CODiscoveryRecord *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[CODiscoveryRecord isEqualToDiscoveryRecord:](self, "isEqualToDiscoveryRecord:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)hasSameBackingDeviceAs:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CODiscoveryRecord IDSIdentifier](self, "IDSIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IDSIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (id)newTransportWithExecutionContext:(id)a3
{
  id v4;
  CORapportTransport *v5;
  void *v6;

  v4 = a3;
  v5 = -[CORapportTransport initWithDiscoveryRecord:executionContext:]([CORapportTransport alloc], "initWithDiscoveryRecord:executionContext:", self, v4);

  -[CODiscoveryRecord sourceTransport](self, "sourceTransport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAsSink:", v5);

  return v5;
}

- (BOOL)isEqualToDiscoveryRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  -[CODiscoveryRecord constituent](self, "constituent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constituent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[CODiscoveryRecord rapportIdentifier](self, "rapportIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rapportIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[CODiscoveryRecord IDSIdentifier](self, "IDSIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "IDSIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        -[CODiscoveryRecord destinations](self, "destinations");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "destinations");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToOrderedSet:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)shouldAdvertise
{
  void *v2;
  BOOL v3;

  -[CODiscoveryRecord destinations](self, "destinations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (RPCompanionLinkDevice)companionLinkDevice
{
  RPCompanionLinkDevice *companionLinkDevice;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  RPCompanionLinkDevice *v8;

  companionLinkDevice = self->_companionLinkDevice;
  if (!companionLinkDevice)
  {
    v4 = objc_alloc_init(MEMORY[0x24BE7CBF8]);
    -[CODiscoveryRecord rapportIdentifier](self, "rapportIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", v5);

    -[CODiscoveryRecord destinations](self, "destinations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIpAddress:", v7);

    v8 = self->_companionLinkDevice;
    self->_companionLinkDevice = (RPCompanionLinkDevice *)v4;

    companionLinkDevice = self->_companionLinkDevice;
  }
  return companionLinkDevice;
}

+ (id)_destinationForPeerAddress:(id)a3 listeningPort:(unsigned __int16)a4
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  v7 = 0;
  if ((_DWORD)v4 && v6)
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(":"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      objc_msgSend(v9, "removeLastObject");
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(":"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(":%hu"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (COConstituent)constituent
{
  return self->_constituent;
}

- (void)setConstituent:(id)a3
{
  objc_storeStrong((id *)&self->_constituent, a3);
}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (NSString)IDSIdentifier
{
  return self->_IDSIdentifier;
}

- (NSOrderedSet)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_destinations, a3);
}

- (CORapportTransport)sourceTransport
{
  return self->_sourceTransport;
}

- (void)setSourceTransport:(id)a3
{
  objc_storeStrong((id *)&self->_sourceTransport, a3);
}

- (COUnhandledRapportRequest)unhandledRequest
{
  return self->_unhandledRequest;
}

- (void)setUnhandledRequest:(id)a3
{
  objc_storeStrong((id *)&self->_unhandledRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unhandledRequest, 0);
  objc_storeStrong((id *)&self->_sourceTransport, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_IDSIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportIdentifier, 0);
  objc_storeStrong((id *)&self->_constituent, 0);
  objc_storeStrong(&self->_companionLinkProvider, 0);
  objc_storeStrong((id *)&self->_HomeKitIdentifier, 0);
  objc_storeStrong((id *)&self->_companionLinkDevice, 0);
}

@end
