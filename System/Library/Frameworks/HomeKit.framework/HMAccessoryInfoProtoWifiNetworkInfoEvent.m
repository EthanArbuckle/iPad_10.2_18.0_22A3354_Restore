@implementation HMAccessoryInfoProtoWifiNetworkInfoEvent

- (BOOL)hasMacAddress
{
  return self->_macAddress != 0;
}

- (BOOL)hasNetworkSSID
{
  return self->_networkSSID != 0;
}

- (BOOL)hasNetworkGatewayIPAddress
{
  return self->_networkGatewayIPAddress != 0;
}

- (BOOL)hasNetworkBSSID
{
  return self->_networkBSSID != 0;
}

- (BOOL)hasNetworkGatewayMacAddress
{
  return self->_networkGatewayMacAddress != 0;
}

- (void)setNetworkRSSI:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_networkRSSI = a3;
}

- (void)setHasNetworkRSSI:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNetworkRSSI
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)HMAccessoryInfoProtoWifiNetworkInfoEvent;
  -[HMAccessoryInfoProtoWifiNetworkInfoEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoWifiNetworkInfoEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *macAddress;
  NSString *networkSSID;
  NSString *networkGatewayIPAddress;
  NSString *networkBSSID;
  NSString *networkGatewayMacAddress;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  macAddress = self->_macAddress;
  if (macAddress)
    objc_msgSend(v3, "setObject:forKey:", macAddress, CFSTR("macAddress"));
  networkSSID = self->_networkSSID;
  if (networkSSID)
    objc_msgSend(v4, "setObject:forKey:", networkSSID, CFSTR("networkSSID"));
  networkGatewayIPAddress = self->_networkGatewayIPAddress;
  if (networkGatewayIPAddress)
    objc_msgSend(v4, "setObject:forKey:", networkGatewayIPAddress, CFSTR("networkGatewayIPAddress"));
  networkBSSID = self->_networkBSSID;
  if (networkBSSID)
    objc_msgSend(v4, "setObject:forKey:", networkBSSID, CFSTR("networkBSSID"));
  networkGatewayMacAddress = self->_networkGatewayMacAddress;
  if (networkGatewayMacAddress)
    objc_msgSend(v4, "setObject:forKey:", networkGatewayMacAddress, CFSTR("networkGatewayMacAddress"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_networkRSSI);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("networkRSSI"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryInfoProtoWifiNetworkInfoEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_macAddress)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_networkSSID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_networkGatewayIPAddress)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_networkBSSID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_networkGatewayMacAddress)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_macAddress)
  {
    objc_msgSend(v4, "setMacAddress:");
    v4 = v5;
  }
  if (self->_networkSSID)
  {
    objc_msgSend(v5, "setNetworkSSID:");
    v4 = v5;
  }
  if (self->_networkGatewayIPAddress)
  {
    objc_msgSend(v5, "setNetworkGatewayIPAddress:");
    v4 = v5;
  }
  if (self->_networkBSSID)
  {
    objc_msgSend(v5, "setNetworkBSSID:");
    v4 = v5;
  }
  if (self->_networkGatewayMacAddress)
  {
    objc_msgSend(v5, "setNetworkGatewayMacAddress:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_networkRSSI;
    *((_BYTE *)v4 + 56) |= 1u;
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_macAddress, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_networkSSID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[NSString copyWithZone:](self->_networkGatewayIPAddress, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_networkBSSID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  v14 = -[NSString copyWithZone:](self->_networkGatewayMacAddress, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_networkRSSI;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *macAddress;
  NSString *networkSSID;
  NSString *networkGatewayIPAddress;
  NSString *networkBSSID;
  NSString *networkGatewayMacAddress;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  macAddress = self->_macAddress;
  if ((unint64_t)macAddress | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](macAddress, "isEqual:"))
      goto LABEL_16;
  }
  networkSSID = self->_networkSSID;
  if ((unint64_t)networkSSID | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](networkSSID, "isEqual:"))
      goto LABEL_16;
  }
  networkGatewayIPAddress = self->_networkGatewayIPAddress;
  if ((unint64_t)networkGatewayIPAddress | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](networkGatewayIPAddress, "isEqual:"))
      goto LABEL_16;
  }
  networkBSSID = self->_networkBSSID;
  if ((unint64_t)networkBSSID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](networkBSSID, "isEqual:"))
      goto LABEL_16;
  }
  networkGatewayMacAddress = self->_networkGatewayMacAddress;
  if ((unint64_t)networkGatewayMacAddress | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](networkGatewayMacAddress, "isEqual:"))
      goto LABEL_16;
  }
  v10 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) != 0 && self->_networkRSSI == *((_DWORD *)v4 + 10))
    {
      v10 = 1;
      goto LABEL_17;
    }
LABEL_16:
    v10 = 0;
  }
LABEL_17:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_macAddress, "hash");
  v4 = -[NSString hash](self->_networkSSID, "hash");
  v5 = -[NSString hash](self->_networkGatewayIPAddress, "hash");
  v6 = -[NSString hash](self->_networkBSSID, "hash");
  v7 = -[NSString hash](self->_networkGatewayMacAddress, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_networkRSSI;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[HMAccessoryInfoProtoWifiNetworkInfoEvent setMacAddress:](self, "setMacAddress:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[HMAccessoryInfoProtoWifiNetworkInfoEvent setNetworkSSID:](self, "setNetworkSSID:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HMAccessoryInfoProtoWifiNetworkInfoEvent setNetworkGatewayIPAddress:](self, "setNetworkGatewayIPAddress:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[HMAccessoryInfoProtoWifiNetworkInfoEvent setNetworkBSSID:](self, "setNetworkBSSID:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[HMAccessoryInfoProtoWifiNetworkInfoEvent setNetworkGatewayMacAddress:](self, "setNetworkGatewayMacAddress:");
    v4 = v5;
  }
  if ((v4[14] & 1) != 0)
  {
    self->_networkRSSI = v4[10];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
  objc_storeStrong((id *)&self->_macAddress, a3);
}

- (NSString)networkSSID
{
  return self->_networkSSID;
}

- (void)setNetworkSSID:(id)a3
{
  objc_storeStrong((id *)&self->_networkSSID, a3);
}

- (NSString)networkGatewayIPAddress
{
  return self->_networkGatewayIPAddress;
}

- (void)setNetworkGatewayIPAddress:(id)a3
{
  objc_storeStrong((id *)&self->_networkGatewayIPAddress, a3);
}

- (NSString)networkBSSID
{
  return self->_networkBSSID;
}

- (void)setNetworkBSSID:(id)a3
{
  objc_storeStrong((id *)&self->_networkBSSID, a3);
}

- (NSString)networkGatewayMacAddress
{
  return self->_networkGatewayMacAddress;
}

- (void)setNetworkGatewayMacAddress:(id)a3
{
  objc_storeStrong((id *)&self->_networkGatewayMacAddress, a3);
}

- (int)networkRSSI
{
  return self->_networkRSSI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkSSID, 0);
  objc_storeStrong((id *)&self->_networkGatewayMacAddress, 0);
  objc_storeStrong((id *)&self->_networkGatewayIPAddress, 0);
  objc_storeStrong((id *)&self->_networkBSSID, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
}

@end
