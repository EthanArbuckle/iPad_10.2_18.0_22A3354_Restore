@implementation MTSThreadScanResult

- (MTSThreadScanResult)initWithNetworkName:(id)a3 panID:(id)a4 extendedPANID:(id)a5 channel:(id)a6 extendedAddress:(id)a7 rssi:(id)a8 version:(id)a9 lqi:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  MTSThreadScanResult *v23;
  uint64_t v24;
  NSString *networkName;
  uint64_t v26;
  NSData *extendedAddress;
  MTSThreadScanResult *v29;
  SEL v30;
  _NSZone *v31;
  id obj;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v16 = a3;
  v17 = a4;
  v35 = a5;
  obj = a6;
  v34 = a6;
  v18 = a7;
  v33 = a8;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v17)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v35)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v34)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v18)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v19)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v20)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  v22 = v21;
  if (!v21)
  {
LABEL_19:
    v29 = (MTSThreadScanResult *)_HMFPreconditionFailure();
    return (MTSThreadScanResult *)-[MTSThreadScanResult copyWithZone:](v29, v30, v31);
  }
  v36.receiver = self;
  v36.super_class = (Class)MTSThreadScanResult;
  v23 = -[MTSThreadScanResult init](&v36, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    networkName = v23->_networkName;
    v23->_networkName = (NSString *)v24;

    objc_storeStrong((id *)&v23->_panID, a4);
    objc_storeStrong((id *)&v23->_extendedPANID, a5);
    objc_storeStrong((id *)&v23->_channel, obj);
    v26 = objc_msgSend(v18, "copy");
    extendedAddress = v23->_extendedAddress;
    v23->_extendedAddress = (NSData *)v26;

    objc_storeStrong((id *)&v23->_rssi, v33);
    objc_storeStrong((id *)&v23->_version, a9);
    objc_storeStrong((id *)&v23->_lqi, a10);
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[MTSThreadScanResult networkName](self, "networkName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "networkName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[MTSThreadScanResult panID](self, "panID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "panID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToNumber:", v10))
      {
        -[MTSThreadScanResult extendedPANID](self, "extendedPANID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "extendedPANID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToNumber:", v12))
        {
          -[MTSThreadScanResult channel](self, "channel");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "channel");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v13;
          if (objc_msgSend(v13, "isEqualToNumber:", v29))
          {
            -[MTSThreadScanResult extendedAddress](self, "extendedAddress");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "extendedAddress");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v14;
            if (objc_msgSend(v14, "isEqualToData:", v27))
            {
              -[MTSThreadScanResult rssi](self, "rssi");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "rssi");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v15;
              if (objc_msgSend(v15, "isEqualToNumber:", v25))
              {
                -[MTSThreadScanResult version](self, "version");
                v16 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "version");
                v17 = objc_claimAutoreleasedReturnValue();
                v24 = (void *)v16;
                v18 = (void *)v16;
                v19 = (void *)v17;
                if (objc_msgSend(v18, "isEqualToNumber:", v17))
                {
                  -[MTSThreadScanResult lqi](self, "lqi");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "lqi");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v23, "isEqualToNumber:", v22);

                }
                else
                {
                  v20 = 0;
                }

              }
              else
              {
                v20 = 0;
              }

            }
            else
            {
              v20 = 0;
            }

          }
          else
          {
            v20 = 0;
          }

        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;

  -[MTSThreadScanResult panID](self, "panID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MTSThreadScanResult extendedPANID](self, "extendedPANID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[MTSThreadScanResult networkName](self, "networkName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[MTSThreadScanResult channel](self, "channel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[MTSThreadScanResult extendedAddress](self, "extendedAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[MTSThreadScanResult rssi](self, "rssi");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[MTSThreadScanResult version](self, "version");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");
  -[MTSThreadScanResult lqi](self, "lqi");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (MTSThreadScanResult)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MTSThreadScanResult *v18;
  MTSThreadScanResult *v19;
  NSObject *v20;
  void *context;
  void *v23;
  MTSThreadScanResult *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSTSR.ck.networkName"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSTSR.ck.panID"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSTSR.ck.extendedPANID"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSTSR.ck.channel"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSTSR.ck.extendedAddress"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSTSR.ck.rssi"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSTSR.ck.version"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSTSR.ck.lqi"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v8;
  v13 = (void *)v7;
  v14 = (void *)v6;
  v15 = (void *)v5;
  v16 = (void *)v4;
  v17 = (void *)v11;
  if (v16 && v15 && v14 && v13 && v12 && v9 && v10 && v11)
  {
    v18 = -[MTSThreadScanResult initWithNetworkName:panID:extendedPANID:channel:extendedAddress:rssi:version:lqi:](self, "initWithNetworkName:panID:extendedPANID:channel:extendedAddress:rssi:version:lqi:", v16, v15, v14, v13, v12, v9, v10, v11);
    v25 = v18;
  }
  else
  {
    v23 = v10;
    context = (void *)MEMORY[0x23493F978]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545410;
      v28 = v26;
      v29 = 2112;
      v30 = v16;
      v31 = 2112;
      v32 = v15;
      v33 = 2112;
      v34 = v14;
      v35 = 2112;
      v36 = v13;
      v37 = 2112;
      v38 = v12;
      v39 = 2112;
      v40 = v9;
      v41 = 2112;
      v42 = v23;
      v43 = 2112;
      v44 = v17;
      _os_log_impl(&dword_2344FE000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded networkName: %@, panID: %@, extendedPANID: %@, channel: %@, extendedAddress: %@, rssi: %@, version: %@, lqi: %@", buf, 0x5Cu);

    }
    v25 = v19;

    objc_autoreleasePoolPop(context);
    v18 = 0;
    v10 = v23;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[MTSThreadScanResult networkName](self, "networkName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MTSTSR.ck.networkName"));

  -[MTSThreadScanResult panID](self, "panID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MTSTSR.ck.panID"));

  -[MTSThreadScanResult extendedPANID](self, "extendedPANID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MTSTSR.ck.extendedPANID"));

  -[MTSThreadScanResult channel](self, "channel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("MTSTSR.ck.channel"));

  -[MTSThreadScanResult extendedAddress](self, "extendedAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("MTSTSR.ck.extendedAddress"));

  -[MTSThreadScanResult rssi](self, "rssi");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("MTSTSR.ck.rssi"));

  -[MTSThreadScanResult version](self, "version");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("MTSTSR.ck.version"));

  -[MTSThreadScanResult lqi](self, "lqi");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("MTSTSR.ck.lqi"));

}

- (NSString)networkName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)panID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)extendedPANID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)channel
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)extendedAddress
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)rssi
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)lqi
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lqi, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_extendedAddress, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_extendedPANID, 0);
  objc_storeStrong((id *)&self->_panID, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
