@implementation HMAccessoryInfoProtoNetworkInfoEvent

- (BOOL)hasIfaceName
{
  return self->_ifaceName != 0;
}

- (BOOL)hasMacAddress
{
  return self->_macAddress != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (void)clearIpv4Addresses
{
  -[NSMutableArray removeAllObjects](self->_ipv4Addresses, "removeAllObjects");
}

- (void)addIpv4Addresses:(id)a3
{
  id v4;
  NSMutableArray *ipv4Addresses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  ipv4Addresses = self->_ipv4Addresses;
  v8 = v4;
  if (!ipv4Addresses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_ipv4Addresses;
    self->_ipv4Addresses = v6;

    v4 = v8;
    ipv4Addresses = self->_ipv4Addresses;
  }
  -[NSMutableArray addObject:](ipv4Addresses, "addObject:", v4);

}

- (unint64_t)ipv4AddressesCount
{
  return -[NSMutableArray count](self->_ipv4Addresses, "count");
}

- (id)ipv4AddressesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_ipv4Addresses, "objectAtIndex:", a3);
}

- (void)clearIpv6Addresses
{
  -[NSMutableArray removeAllObjects](self->_ipv6Addresses, "removeAllObjects");
}

- (void)addIpv6Addresses:(id)a3
{
  id v4;
  NSMutableArray *ipv6Addresses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  ipv6Addresses = self->_ipv6Addresses;
  v8 = v4;
  if (!ipv6Addresses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_ipv6Addresses;
    self->_ipv6Addresses = v6;

    v4 = v8;
    ipv6Addresses = self->_ipv6Addresses;
  }
  -[NSMutableArray addObject:](ipv6Addresses, "addObject:", v4);

}

- (unint64_t)ipv6AddressesCount
{
  return -[NSMutableArray count](self->_ipv6Addresses, "count");
}

- (id)ipv6AddressesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_ipv6Addresses, "objectAtIndex:", a3);
}

- (BOOL)hasWifiInfo
{
  return self->_wifiInfo != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryInfoProtoNetworkInfoEvent;
  -[HMAccessoryInfoProtoNetworkInfoEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoNetworkInfoEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *ifaceName;
  NSString *macAddress;
  NSString *type;
  NSMutableArray *ipv4Addresses;
  NSMutableArray *ipv6Addresses;
  HMAccessoryInfoProtoAirportInfoEvent *wifiInfo;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  ifaceName = self->_ifaceName;
  if (ifaceName)
    objc_msgSend(v3, "setObject:forKey:", ifaceName, CFSTR("ifaceName"));
  macAddress = self->_macAddress;
  if (macAddress)
    objc_msgSend(v4, "setObject:forKey:", macAddress, CFSTR("macAddress"));
  type = self->_type;
  if (type)
    objc_msgSend(v4, "setObject:forKey:", type, CFSTR("type"));
  ipv4Addresses = self->_ipv4Addresses;
  if (ipv4Addresses)
    objc_msgSend(v4, "setObject:forKey:", ipv4Addresses, CFSTR("ipv4Addresses"));
  ipv6Addresses = self->_ipv6Addresses;
  if (ipv6Addresses)
    objc_msgSend(v4, "setObject:forKey:", ipv6Addresses, CFSTR("ipv6Addresses"));
  wifiInfo = self->_wifiInfo;
  if (wifiInfo)
  {
    -[HMAccessoryInfoProtoAirportInfoEvent dictionaryRepresentation](wifiInfo, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("wifiInfo"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryInfoProtoNetworkInfoEventReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_ifaceName)
    PBDataWriterWriteStringField();
  if (self->_macAddress)
    PBDataWriterWriteStringField();
  if (self->_type)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_ipv4Addresses;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_ipv6Addresses;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (self->_wifiInfo)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id v12;

  v12 = a3;
  if (self->_ifaceName)
    objc_msgSend(v12, "setIfaceName:");
  if (self->_macAddress)
    objc_msgSend(v12, "setMacAddress:");
  if (self->_type)
    objc_msgSend(v12, "setType:");
  if (-[HMAccessoryInfoProtoNetworkInfoEvent ipv4AddressesCount](self, "ipv4AddressesCount"))
  {
    objc_msgSend(v12, "clearIpv4Addresses");
    v4 = -[HMAccessoryInfoProtoNetworkInfoEvent ipv4AddressesCount](self, "ipv4AddressesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HMAccessoryInfoProtoNetworkInfoEvent ipv4AddressesAtIndex:](self, "ipv4AddressesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addIpv4Addresses:", v7);

      }
    }
  }
  if (-[HMAccessoryInfoProtoNetworkInfoEvent ipv6AddressesCount](self, "ipv6AddressesCount"))
  {
    objc_msgSend(v12, "clearIpv6Addresses");
    v8 = -[HMAccessoryInfoProtoNetworkInfoEvent ipv6AddressesCount](self, "ipv6AddressesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[HMAccessoryInfoProtoNetworkInfoEvent ipv6AddressesAtIndex:](self, "ipv6AddressesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addIpv6Addresses:", v11);

      }
    }
  }
  if (self->_wifiInfo)
    objc_msgSend(v12, "setWifiInfo:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_ifaceName, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_macAddress, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = self->_ipv4Addresses;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addIpv4Addresses:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v14);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = self->_ipv6Addresses;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v22), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend(v5, "addIpv6Addresses:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v20);
  }

  v24 = -[HMAccessoryInfoProtoAirportInfoEvent copyWithZone:](self->_wifiInfo, "copyWithZone:", a3);
  v25 = (void *)v5[6];
  v5[6] = v24;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *ifaceName;
  NSString *macAddress;
  NSString *type;
  NSMutableArray *ipv4Addresses;
  NSMutableArray *ipv6Addresses;
  HMAccessoryInfoProtoAirportInfoEvent *wifiInfo;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((ifaceName = self->_ifaceName, !((unint64_t)ifaceName | v4[1]))
     || -[NSString isEqual:](ifaceName, "isEqual:"))
    && ((macAddress = self->_macAddress, !((unint64_t)macAddress | v4[4]))
     || -[NSString isEqual:](macAddress, "isEqual:"))
    && ((type = self->_type, !((unint64_t)type | v4[5])) || -[NSString isEqual:](type, "isEqual:"))
    && ((ipv4Addresses = self->_ipv4Addresses, !((unint64_t)ipv4Addresses | v4[2]))
     || -[NSMutableArray isEqual:](ipv4Addresses, "isEqual:"))
    && ((ipv6Addresses = self->_ipv6Addresses, !((unint64_t)ipv6Addresses | v4[3]))
     || -[NSMutableArray isEqual:](ipv6Addresses, "isEqual:")))
  {
    wifiInfo = self->_wifiInfo;
    if ((unint64_t)wifiInfo | v4[6])
      v11 = -[HMAccessoryInfoProtoAirportInfoEvent isEqual:](wifiInfo, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_ifaceName, "hash");
  v4 = -[NSString hash](self->_macAddress, "hash") ^ v3;
  v5 = -[NSString hash](self->_type, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_ipv4Addresses, "hash");
  v7 = -[NSMutableArray hash](self->_ipv6Addresses, "hash");
  return v6 ^ v7 ^ -[HMAccessoryInfoProtoAirportInfoEvent hash](self->_wifiInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  HMAccessoryInfoProtoAirportInfoEvent *wifiInfo;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 1))
    -[HMAccessoryInfoProtoNetworkInfoEvent setIfaceName:](self, "setIfaceName:");
  if (*((_QWORD *)v4 + 4))
    -[HMAccessoryInfoProtoNetworkInfoEvent setMacAddress:](self, "setMacAddress:");
  if (*((_QWORD *)v4 + 5))
    -[HMAccessoryInfoProtoNetworkInfoEvent setType:](self, "setType:");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        -[HMAccessoryInfoProtoNetworkInfoEvent addIpv4Addresses:](self, "addIpv4Addresses:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = *((id *)v4 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        -[HMAccessoryInfoProtoNetworkInfoEvent addIpv6Addresses:](self, "addIpv6Addresses:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  wifiInfo = self->_wifiInfo;
  v16 = *((_QWORD *)v4 + 6);
  if (wifiInfo)
  {
    if (v16)
      -[HMAccessoryInfoProtoAirportInfoEvent mergeFrom:](wifiInfo, "mergeFrom:");
  }
  else if (v16)
  {
    -[HMAccessoryInfoProtoNetworkInfoEvent setWifiInfo:](self, "setWifiInfo:");
  }

}

- (NSString)ifaceName
{
  return self->_ifaceName;
}

- (void)setIfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_ifaceName, a3);
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
  objc_storeStrong((id *)&self->_macAddress, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSMutableArray)ipv4Addresses
{
  return self->_ipv4Addresses;
}

- (void)setIpv4Addresses:(id)a3
{
  objc_storeStrong((id *)&self->_ipv4Addresses, a3);
}

- (NSMutableArray)ipv6Addresses
{
  return self->_ipv6Addresses;
}

- (void)setIpv6Addresses:(id)a3
{
  objc_storeStrong((id *)&self->_ipv6Addresses, a3);
}

- (HMAccessoryInfoProtoAirportInfoEvent)wifiInfo
{
  return self->_wifiInfo;
}

- (void)setWifiInfo:(id)a3
{
  objc_storeStrong((id *)&self->_wifiInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiInfo, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_ipv6Addresses, 0);
  objc_storeStrong((id *)&self->_ipv4Addresses, 0);
  objc_storeStrong((id *)&self->_ifaceName, 0);
}

+ (Class)ipv4AddressesType
{
  return (Class)objc_opt_class();
}

+ (Class)ipv6AddressesType
{
  return (Class)objc_opt_class();
}

@end
