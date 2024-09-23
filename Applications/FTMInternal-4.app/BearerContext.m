@implementation BearerContext

- (void)setCid:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cid = a3;
}

- (void)setHasCid:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCid
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNsapi:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_nsapi = a3;
}

- (void)setHasNsapi:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNsapi
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasApn
{
  return self->_apn != 0;
}

- (int)pdpType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_pdpType;
  else
    return 0;
}

- (void)setPdpType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_pdpType = a3;
}

- (void)setHasPdpType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPdpType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)pdpTypeAsString:(int)a3
{
  if (a3 >= 8)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_10025FFE8[a3];
}

- (int)StringAsPdpType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv4")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv6")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv4v6")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv4_PDN")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv6_PDN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv4v6_PDN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_PPP")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_NONE")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasPdpAddr
{
  return self->_pdpAddr != 0;
}

- (int)primaryDnsType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_primaryDnsType;
  else
    return 0;
}

- (void)setPrimaryDnsType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_primaryDnsType = a3;
}

- (void)setHasPrimaryDnsType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPrimaryDnsType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)primaryDnsTypeAsString:(int)a3
{
  if (a3 >= 8)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_10025FFE8[a3];
}

- (int)StringAsPrimaryDnsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv4")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv6")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv4v6")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv4_PDN")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv6_PDN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv4v6_PDN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_PPP")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_NONE")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasPrimaryDnsAddr
{
  return self->_primaryDnsAddr != 0;
}

- (int)secondaryDnsType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_secondaryDnsType;
  else
    return 0;
}

- (void)setSecondaryDnsType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_secondaryDnsType = a3;
}

- (void)setHasSecondaryDnsType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSecondaryDnsType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)secondaryDnsTypeAsString:(int)a3
{
  if (a3 >= 8)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_10025FFE8[a3];
}

- (int)StringAsSecondaryDnsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv4")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv6")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv4v6")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv4_PDN")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv6_PDN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_IPv4v6_PDN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_PPP")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PDP_TYPE_NONE")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasSecondaryDnsAddr
{
  return self->_secondaryDnsAddr != 0;
}

- (void)setIsAddrIratMobile:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isAddrIratMobile = a3;
}

- (void)setHasIsAddrIratMobile:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsAddrIratMobile
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BearerContext;
  v3 = -[BearerContext description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BearerContext dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *apn;
  uint64_t pdpType;
  __CFString *v9;
  NSData *pdpAddr;
  uint64_t primaryDnsType;
  __CFString *v12;
  NSData *primaryDnsAddr;
  uint64_t secondaryDnsType;
  __CFString *v15;
  NSData *secondaryDnsAddr;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cid));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("cid"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nsapi));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("nsapi"));

  }
  apn = self->_apn;
  if (apn)
    objc_msgSend(v3, "setObject:forKey:", apn, CFSTR("apn"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    pdpType = self->_pdpType;
    if (pdpType >= 8)
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_pdpType));
    else
      v9 = off_10025FFE8[pdpType];
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("pdp_type"));

  }
  pdpAddr = self->_pdpAddr;
  if (pdpAddr)
    objc_msgSend(v3, "setObject:forKey:", pdpAddr, CFSTR("pdp_addr"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    primaryDnsType = self->_primaryDnsType;
    if (primaryDnsType >= 8)
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_primaryDnsType));
    else
      v12 = off_10025FFE8[primaryDnsType];
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("primary_dns_type"));

  }
  primaryDnsAddr = self->_primaryDnsAddr;
  if (primaryDnsAddr)
    objc_msgSend(v3, "setObject:forKey:", primaryDnsAddr, CFSTR("primary_dns_addr"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    secondaryDnsType = self->_secondaryDnsType;
    if (secondaryDnsType >= 8)
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_secondaryDnsType));
    else
      v15 = off_10025FFE8[secondaryDnsType];
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("secondary_dns_type"));

  }
  secondaryDnsAddr = self->_secondaryDnsAddr;
  if (secondaryDnsAddr)
    objc_msgSend(v3, "setObject:forKey:", secondaryDnsAddr, CFSTR("secondary_dns_addr"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isAddrIratMobile));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("is_addr_irat_mobile"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100136A98((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSString *apn;
  NSData *pdpAddr;
  NSData *primaryDnsAddr;
  NSData *secondaryDnsAddr;
  id v9;

  v9 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v9, self->_cid, 1);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field(v9, self->_nsapi, 2);
  apn = self->_apn;
  if (apn)
    PBDataWriterWriteStringField(v9, apn, 3);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field(v9, self->_pdpType, 4);
  pdpAddr = self->_pdpAddr;
  if (pdpAddr)
    PBDataWriterWriteDataField(v9, pdpAddr, 5);
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field(v9, self->_primaryDnsType, 6);
  primaryDnsAddr = self->_primaryDnsAddr;
  if (primaryDnsAddr)
    PBDataWriterWriteDataField(v9, primaryDnsAddr, 7);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field(v9, self->_secondaryDnsType, 8);
  secondaryDnsAddr = self->_secondaryDnsAddr;
  if (secondaryDnsAddr)
    PBDataWriterWriteDataField(v9, secondaryDnsAddr, 9);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteBOOLField(v9, self->_isAddrIratMobile, 10);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[4] = self->_cid;
    *((_BYTE *)v4 + 72) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[5] = self->_nsapi;
    *((_BYTE *)v4 + 72) |= 2u;
  }
  v6 = v4;
  if (self->_apn)
  {
    objc_msgSend(v4, "setApn:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[8] = self->_pdpType;
    *((_BYTE *)v4 + 72) |= 4u;
  }
  if (self->_pdpAddr)
  {
    objc_msgSend(v6, "setPdpAddr:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4[12] = self->_primaryDnsType;
    *((_BYTE *)v4 + 72) |= 8u;
  }
  if (self->_primaryDnsAddr)
  {
    objc_msgSend(v6, "setPrimaryDnsAddr:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v4[16] = self->_secondaryDnsType;
    *((_BYTE *)v4 + 72) |= 0x10u;
  }
  if (self->_secondaryDnsAddr)
  {
    objc_msgSend(v6, "setSecondaryDnsAddr:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_BYTE *)v4 + 68) = self->_isAddrIratMobile;
    *((_BYTE *)v4 + 72) |= 0x20u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[4] = self->_cid;
    *((_BYTE *)v5 + 72) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[5] = self->_nsapi;
    *((_BYTE *)v5 + 72) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_apn, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_pdpType;
    *((_BYTE *)v6 + 72) |= 4u;
  }
  v10 = -[NSData copyWithZone:](self->_pdpAddr, "copyWithZone:", a3);
  v11 = (void *)v6[3];
  v6[3] = v10;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_primaryDnsType;
    *((_BYTE *)v6 + 72) |= 8u;
  }
  v12 = -[NSData copyWithZone:](self->_primaryDnsAddr, "copyWithZone:", a3);
  v13 = (void *)v6[5];
  v6[5] = v12;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_secondaryDnsType;
    *((_BYTE *)v6 + 72) |= 0x10u;
  }
  v14 = -[NSData copyWithZone:](self->_secondaryDnsAddr, "copyWithZone:", a3);
  v15 = (void *)v6[7];
  v6[7] = v14;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_BYTE *)v6 + 68) = self->_isAddrIratMobile;
    *((_BYTE *)v6 + 72) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char has;
  NSString *apn;
  NSData *pdpAddr;
  NSData *primaryDnsAddr;
  NSData *secondaryDnsAddr;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_41;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_cid != *((_DWORD *)v4 + 4))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_nsapi != *((_DWORD *)v4 + 5))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_41;
  }
  apn = self->_apn;
  if ((unint64_t)apn | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](apn, "isEqual:"))
      goto LABEL_41;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_pdpType != *((_DWORD *)v4 + 8))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_41;
  }
  pdpAddr = self->_pdpAddr;
  if ((unint64_t)pdpAddr | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](pdpAddr, "isEqual:"))
      goto LABEL_41;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 8) == 0 || self->_primaryDnsType != *((_DWORD *)v4 + 12))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 72) & 8) != 0)
  {
    goto LABEL_41;
  }
  primaryDnsAddr = self->_primaryDnsAddr;
  if ((unint64_t)primaryDnsAddr | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](primaryDnsAddr, "isEqual:"))
      goto LABEL_41;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x10) == 0 || self->_secondaryDnsType != *((_DWORD *)v4 + 16))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  secondaryDnsAddr = self->_secondaryDnsAddr;
  if ((unint64_t)secondaryDnsAddr | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](secondaryDnsAddr, "isEqual:"))
      goto LABEL_41;
    has = (char)self->_has;
  }
  v11 = (*((_BYTE *)v4 + 72) & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x20) != 0)
    {
      if (self->_isAddrIratMobile)
      {
        if (!*((_BYTE *)v4 + 68))
          goto LABEL_41;
      }
      else if (*((_BYTE *)v4 + 68))
      {
        goto LABEL_41;
      }
      v11 = 1;
      goto LABEL_42;
    }
LABEL_41:
    v11 = 0;
  }
LABEL_42:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v13 = 2654435761 * self->_cid;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v13 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_nsapi;
      goto LABEL_6;
    }
  }
  v3 = 0;
LABEL_6:
  v4 = -[NSString hash](self->_apn, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v5 = 2654435761 * self->_pdpType;
  else
    v5 = 0;
  v6 = (unint64_t)-[NSData hash](self->_pdpAddr, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v7 = 2654435761 * self->_primaryDnsType;
  else
    v7 = 0;
  v8 = (unint64_t)-[NSData hash](self->_primaryDnsAddr, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v9 = 2654435761 * self->_secondaryDnsType;
  else
    v9 = 0;
  v10 = (unint64_t)-[NSData hash](self->_secondaryDnsAddr, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v11 = 2654435761 * self->_isAddrIratMobile;
  else
    v11 = 0;
  return v3 ^ v13 ^ v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 1) != 0)
  {
    self->_cid = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 72);
  }
  if ((v5 & 2) != 0)
  {
    self->_nsapi = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[BearerContext setApn:](self, "setApn:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    self->_pdpType = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[BearerContext setPdpAddr:](self, "setPdpAddr:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 72) & 8) != 0)
  {
    self->_primaryDnsType = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[BearerContext setPrimaryDnsAddr:](self, "setPrimaryDnsAddr:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 72) & 0x10) != 0)
  {
    self->_secondaryDnsType = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[BearerContext setSecondaryDnsAddr:](self, "setSecondaryDnsAddr:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 72) & 0x20) != 0)
  {
    self->_isAddrIratMobile = *((_BYTE *)v4 + 68);
    *(_BYTE *)&self->_has |= 0x20u;
  }

}

- (unsigned)cid
{
  return self->_cid;
}

- (unsigned)nsapi
{
  return self->_nsapi;
}

- (NSString)apn
{
  return self->_apn;
}

- (void)setApn:(id)a3
{
  objc_storeStrong((id *)&self->_apn, a3);
}

- (NSData)pdpAddr
{
  return self->_pdpAddr;
}

- (void)setPdpAddr:(id)a3
{
  objc_storeStrong((id *)&self->_pdpAddr, a3);
}

- (NSData)primaryDnsAddr
{
  return self->_primaryDnsAddr;
}

- (void)setPrimaryDnsAddr:(id)a3
{
  objc_storeStrong((id *)&self->_primaryDnsAddr, a3);
}

- (NSData)secondaryDnsAddr
{
  return self->_secondaryDnsAddr;
}

- (void)setSecondaryDnsAddr:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryDnsAddr, a3);
}

- (BOOL)isAddrIratMobile
{
  return self->_isAddrIratMobile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryDnsAddr, 0);
  objc_storeStrong((id *)&self->_primaryDnsAddr, 0);
  objc_storeStrong((id *)&self->_pdpAddr, 0);
  objc_storeStrong((id *)&self->_apn, 0);
}

@end
