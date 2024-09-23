@implementation HMAccessoryInfoProtoNetworkServiceEvent

- (BOOL)hasIfaceName
{
  return self->_ifaceName != 0;
}

- (BOOL)hasMacAddress
{
  return self->_macAddress != 0;
}

- (void)setIsPrimary:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isPrimary = a3;
}

- (void)setHasIsPrimary:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsPrimary
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasConfirmedIfaceName
{
  return self->_confirmedIfaceName != 0;
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

- (BOOL)hasNetworkSignatureV4
{
  return self->_networkSignatureV4 != 0;
}

- (BOOL)hasRouterIPv4
{
  return self->_routerIPv4 != 0;
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

- (BOOL)hasNetworkSignatureV6
{
  return self->_networkSignatureV6 != 0;
}

- (BOOL)hasRouterIPv6
{
  return self->_routerIPv6 != 0;
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
  v8.super_class = (Class)HMAccessoryInfoProtoNetworkServiceEvent;
  -[HMAccessoryInfoProtoNetworkServiceEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoNetworkServiceEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  NSString *confirmedIfaceName;
  NSMutableArray *ipv4Addresses;
  NSString *networkSignatureV4;
  NSString *routerIPv4;
  NSMutableArray *ipv6Addresses;
  NSString *networkSignatureV6;
  NSString *routerIPv6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  ifaceName = self->_ifaceName;
  if (ifaceName)
    objc_msgSend(v3, "setObject:forKey:", ifaceName, CFSTR("ifaceName"));
  macAddress = self->_macAddress;
  if (macAddress)
    objc_msgSend(v4, "setObject:forKey:", macAddress, CFSTR("macAddress"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPrimary);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("isPrimary"));

  }
  confirmedIfaceName = self->_confirmedIfaceName;
  if (confirmedIfaceName)
    objc_msgSend(v4, "setObject:forKey:", confirmedIfaceName, CFSTR("confirmedIfaceName"));
  ipv4Addresses = self->_ipv4Addresses;
  if (ipv4Addresses)
    objc_msgSend(v4, "setObject:forKey:", ipv4Addresses, CFSTR("ipv4Addresses"));
  networkSignatureV4 = self->_networkSignatureV4;
  if (networkSignatureV4)
    objc_msgSend(v4, "setObject:forKey:", networkSignatureV4, CFSTR("networkSignatureV4"));
  routerIPv4 = self->_routerIPv4;
  if (routerIPv4)
    objc_msgSend(v4, "setObject:forKey:", routerIPv4, CFSTR("routerIPv4"));
  ipv6Addresses = self->_ipv6Addresses;
  if (ipv6Addresses)
    objc_msgSend(v4, "setObject:forKey:", ipv6Addresses, CFSTR("ipv6Addresses"));
  networkSignatureV6 = self->_networkSignatureV6;
  if (networkSignatureV6)
    objc_msgSend(v4, "setObject:forKey:", networkSignatureV6, CFSTR("networkSignatureV6"));
  routerIPv6 = self->_routerIPv6;
  if (routerIPv6)
    objc_msgSend(v4, "setObject:forKey:", routerIPv6, CFSTR("routerIPv6"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryInfoProtoNetworkServiceEventReadFrom(self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_confirmedIfaceName)
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

  if (self->_networkSignatureV4)
    PBDataWriterWriteStringField();
  if (self->_routerIPv4)
    PBDataWriterWriteStringField();
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

  if (self->_networkSignatureV6)
    PBDataWriterWriteStringField();
  if (self->_routerIPv6)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  _BYTE *v14;

  v4 = a3;
  v14 = v4;
  if (self->_ifaceName)
  {
    objc_msgSend(v4, "setIfaceName:");
    v4 = v14;
  }
  if (self->_macAddress)
  {
    objc_msgSend(v14, "setMacAddress:");
    v4 = v14;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[80] = self->_isPrimary;
    v4[84] |= 1u;
  }
  if (self->_confirmedIfaceName)
    objc_msgSend(v14, "setConfirmedIfaceName:");
  if (-[HMAccessoryInfoProtoNetworkServiceEvent ipv4AddressesCount](self, "ipv4AddressesCount"))
  {
    objc_msgSend(v14, "clearIpv4Addresses");
    v5 = -[HMAccessoryInfoProtoNetworkServiceEvent ipv4AddressesCount](self, "ipv4AddressesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[HMAccessoryInfoProtoNetworkServiceEvent ipv4AddressesAtIndex:](self, "ipv4AddressesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addIpv4Addresses:", v8);

      }
    }
  }
  if (self->_networkSignatureV4)
    objc_msgSend(v14, "setNetworkSignatureV4:");
  if (self->_routerIPv4)
    objc_msgSend(v14, "setRouterIPv4:");
  if (-[HMAccessoryInfoProtoNetworkServiceEvent ipv6AddressesCount](self, "ipv6AddressesCount"))
  {
    objc_msgSend(v14, "clearIpv6Addresses");
    v9 = -[HMAccessoryInfoProtoNetworkServiceEvent ipv6AddressesCount](self, "ipv6AddressesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[HMAccessoryInfoProtoNetworkServiceEvent ipv6AddressesAtIndex:](self, "ipv6AddressesAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addIpv6Addresses:", v12);

      }
    }
  }
  if (self->_networkSignatureV6)
    objc_msgSend(v14, "setNetworkSignatureV6:");
  v13 = v14;
  if (self->_routerIPv6)
  {
    objc_msgSend(v14, "setRouterIPv6:");
    v13 = v14;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
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
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_ifaceName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_macAddress, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 80) = self->_isPrimary;
    *(_BYTE *)(v5 + 84) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_confirmedIfaceName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v12 = self->_ipv4Addresses;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v38;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIpv4Addresses:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v14);
  }

  v18 = -[NSString copyWithZone:](self->_networkSignatureV4, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v18;

  v20 = -[NSString copyWithZone:](self->_routerIPv4, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v20;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = self->_ipv6Addresses;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v34;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v26), "copyWithZone:", a3, (_QWORD)v33);
        objc_msgSend((id)v5, "addIpv6Addresses:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v24);
  }

  v28 = -[NSString copyWithZone:](self->_networkSignatureV6, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v28;

  v30 = -[NSString copyWithZone:](self->_routerIPv6, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v30;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *ifaceName;
  NSString *macAddress;
  NSString *confirmedIfaceName;
  NSMutableArray *ipv4Addresses;
  NSString *networkSignatureV4;
  NSString *routerIPv4;
  NSMutableArray *ipv6Addresses;
  NSString *networkSignatureV6;
  NSString *routerIPv6;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  ifaceName = self->_ifaceName;
  if ((unint64_t)ifaceName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](ifaceName, "isEqual:"))
      goto LABEL_28;
  }
  macAddress = self->_macAddress;
  if ((unint64_t)macAddress | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](macAddress, "isEqual:"))
      goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) != 0)
    {
      if (self->_isPrimary)
      {
        if (!*((_BYTE *)v4 + 80))
          goto LABEL_28;
        goto LABEL_14;
      }
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_14;
    }
LABEL_28:
    v14 = 0;
    goto LABEL_29;
  }
  if ((*((_BYTE *)v4 + 84) & 1) != 0)
    goto LABEL_28;
LABEL_14:
  confirmedIfaceName = self->_confirmedIfaceName;
  if ((unint64_t)confirmedIfaceName | *((_QWORD *)v4 + 1)
    && !-[NSString isEqual:](confirmedIfaceName, "isEqual:"))
  {
    goto LABEL_28;
  }
  ipv4Addresses = self->_ipv4Addresses;
  if ((unint64_t)ipv4Addresses | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](ipv4Addresses, "isEqual:"))
      goto LABEL_28;
  }
  networkSignatureV4 = self->_networkSignatureV4;
  if ((unint64_t)networkSignatureV4 | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](networkSignatureV4, "isEqual:"))
      goto LABEL_28;
  }
  routerIPv4 = self->_routerIPv4;
  if ((unint64_t)routerIPv4 | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](routerIPv4, "isEqual:"))
      goto LABEL_28;
  }
  ipv6Addresses = self->_ipv6Addresses;
  if ((unint64_t)ipv6Addresses | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](ipv6Addresses, "isEqual:"))
      goto LABEL_28;
  }
  networkSignatureV6 = self->_networkSignatureV6;
  if ((unint64_t)networkSignatureV6 | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](networkSignatureV6, "isEqual:"))
      goto LABEL_28;
  }
  routerIPv6 = self->_routerIPv6;
  if ((unint64_t)routerIPv6 | *((_QWORD *)v4 + 9))
    v14 = -[NSString isEqual:](routerIPv6, "isEqual:");
  else
    v14 = 1;
LABEL_29:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;

  v3 = -[NSString hash](self->_ifaceName, "hash");
  v4 = -[NSString hash](self->_macAddress, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_isPrimary;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_confirmedIfaceName, "hash");
  v7 = -[NSMutableArray hash](self->_ipv4Addresses, "hash");
  v8 = v7 ^ -[NSString hash](self->_networkSignatureV4, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_routerIPv4, "hash");
  v10 = -[NSMutableArray hash](self->_ipv6Addresses, "hash");
  v11 = v10 ^ -[NSString hash](self->_networkSignatureV6, "hash");
  return v9 ^ v11 ^ -[NSString hash](self->_routerIPv6, "hash");
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
  if (*((_QWORD *)v4 + 2))
    -[HMAccessoryInfoProtoNetworkServiceEvent setIfaceName:](self, "setIfaceName:");
  if (*((_QWORD *)v4 + 5))
    -[HMAccessoryInfoProtoNetworkServiceEvent setMacAddress:](self, "setMacAddress:");
  if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    self->_isPrimary = *((_BYTE *)v4 + 80);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
    -[HMAccessoryInfoProtoNetworkServiceEvent setConfirmedIfaceName:](self, "setConfirmedIfaceName:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[HMAccessoryInfoProtoNetworkServiceEvent addIpv4Addresses:](self, "addIpv4Addresses:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 6))
    -[HMAccessoryInfoProtoNetworkServiceEvent setNetworkSignatureV4:](self, "setNetworkSignatureV4:");
  if (*((_QWORD *)v4 + 8))
    -[HMAccessoryInfoProtoNetworkServiceEvent setRouterIPv4:](self, "setRouterIPv4:");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[HMAccessoryInfoProtoNetworkServiceEvent addIpv6Addresses:](self, "addIpv6Addresses:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 7))
    -[HMAccessoryInfoProtoNetworkServiceEvent setNetworkSignatureV6:](self, "setNetworkSignatureV6:");
  if (*((_QWORD *)v4 + 9))
    -[HMAccessoryInfoProtoNetworkServiceEvent setRouterIPv6:](self, "setRouterIPv6:");

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

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (NSString)confirmedIfaceName
{
  return self->_confirmedIfaceName;
}

- (void)setConfirmedIfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_confirmedIfaceName, a3);
}

- (NSMutableArray)ipv4Addresses
{
  return self->_ipv4Addresses;
}

- (void)setIpv4Addresses:(id)a3
{
  objc_storeStrong((id *)&self->_ipv4Addresses, a3);
}

- (NSString)networkSignatureV4
{
  return self->_networkSignatureV4;
}

- (void)setNetworkSignatureV4:(id)a3
{
  objc_storeStrong((id *)&self->_networkSignatureV4, a3);
}

- (NSString)routerIPv4
{
  return self->_routerIPv4;
}

- (void)setRouterIPv4:(id)a3
{
  objc_storeStrong((id *)&self->_routerIPv4, a3);
}

- (NSMutableArray)ipv6Addresses
{
  return self->_ipv6Addresses;
}

- (void)setIpv6Addresses:(id)a3
{
  objc_storeStrong((id *)&self->_ipv6Addresses, a3);
}

- (NSString)networkSignatureV6
{
  return self->_networkSignatureV6;
}

- (void)setNetworkSignatureV6:(id)a3
{
  objc_storeStrong((id *)&self->_networkSignatureV6, a3);
}

- (NSString)routerIPv6
{
  return self->_routerIPv6;
}

- (void)setRouterIPv6:(id)a3
{
  objc_storeStrong((id *)&self->_routerIPv6, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routerIPv6, 0);
  objc_storeStrong((id *)&self->_routerIPv4, 0);
  objc_storeStrong((id *)&self->_networkSignatureV6, 0);
  objc_storeStrong((id *)&self->_networkSignatureV4, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_ipv6Addresses, 0);
  objc_storeStrong((id *)&self->_ipv4Addresses, 0);
  objc_storeStrong((id *)&self->_ifaceName, 0);
  objc_storeStrong((id *)&self->_confirmedIfaceName, 0);
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
