@implementation AWDHomeKitTargetControllerError

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)error
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_error;
  else
    return 0;
}

- (void)setError:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasError
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)errorAsString:(int)a3
{
  if (a3 < 4)
    return off_24E77DB88[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsError:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTargetControllerErrorType_InvalidButton")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTargetControllerErrorType_InvalidState")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTargetControllerErrorType_InvalidTimestamp")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTargetControllerErrorType_SiriFailed")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasVendorDetails
{
  return self->_vendorDetails != 0;
}

- (int)transportType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_transportType;
  else
    return 0;
}

- (void)setTransportType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTransportType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 < 8)
    return off_24E77DBA8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransportType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTransportType_Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTransportType_IP")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTransportType_BTLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTransportType_Relay")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTransportType_TunnelBTLE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTransportType_IDS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTransportType_LoXY")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTransportType_Rapport")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)certified
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_certified;
  else
    return 0;
}

- (void)setCertified:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_certified = a3;
}

- (void)setHasCertified:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCertified
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)certifiedAsString:(int)a3
{
  if (a3 < 3)
    return off_24E77DBE8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCertified:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitCertificationStatus_Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitCertificationStatus_NotCertified")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitCertificationStatus_Certified")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AWDHomeKitTargetControllerError;
  -[AWDHomeKitTargetControllerError description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitTargetControllerError dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  uint64_t error;
  __CFString *v7;
  AWDHomeKitVendorInformation *vendorDetails;
  void *v9;
  char v10;
  uint64_t transportType;
  __CFString *v12;
  uint64_t certified;
  __CFString *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    error = self->_error;
    if (error >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_error);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_24E77DB88[error];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("error"));

  }
  vendorDetails = self->_vendorDetails;
  if (vendorDetails)
  {
    -[AWDHomeKitVendorInformation dictionaryRepresentation](vendorDetails, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("vendorDetails"));

  }
  v10 = (char)self->_has;
  if ((v10 & 8) != 0)
  {
    transportType = self->_transportType;
    if (transportType >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transportType);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_24E77DBA8[transportType];
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("transportType"));

    v10 = (char)self->_has;
  }
  if ((v10 & 2) != 0)
  {
    certified = self->_certified;
    if (certified >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_certified);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_24E77DBE8[certified];
    }
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("certified"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  AWDHomeKitVendorInformation *v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
  {
    v8 = (int *)MEMORY[0x24BE7AF30];
    while (!*((_BYTE *)a3 + *v6))
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        break;
      switch((v11 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (1)
          {
            v21 = *v4;
            v22 = *(_QWORD *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v22);
            *(_QWORD *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_53;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_55;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_53:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_55:
          self->_timestamp = v20;
          goto LABEL_69;
        case 2u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 4u;
          while (2)
          {
            v28 = *v4;
            v29 = *(_QWORD *)((char *)a3 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v29);
              *(_QWORD *)((char *)a3 + v28) = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v15 = v26++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_59:
          v42 = 20;
          goto LABEL_68;
        case 3u:
          v31 = objc_alloc_init(AWDHomeKitVendorInformation);
          objc_storeStrong((id *)&self->_vendorDetails, v31);
          if (!PBReaderPlaceMark() || !AWDHomeKitVendorInformationReadFrom((uint64_t)v31, (uint64_t)a3))
          {

            LOBYTE(v24) = 0;
            return v24;
          }
          PBReaderRecallMark();

LABEL_69:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_70;
          break;
        case 4u:
          v32 = 0;
          v33 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 8u;
          while (2)
          {
            v34 = *v4;
            v35 = *(_QWORD *)((char *)a3 + v34);
            if (v35 == -1 || v35 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v35);
              *(_QWORD *)((char *)a3 + v34) = v35 + 1;
              v27 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                v15 = v33++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_63:
          v42 = 24;
          goto LABEL_68;
        case 5u:
          v37 = 0;
          v38 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 2u;
          while (2)
          {
            v39 = *v4;
            v40 = *(_QWORD *)((char *)a3 + v39);
            if (v40 == -1 || v40 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v40);
              *(_QWORD *)((char *)a3 + v39) = v40 + 1;
              v27 |= (unint64_t)(v41 & 0x7F) << v37;
              if (v41 < 0)
              {
                v37 += 7;
                v15 = v38++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_67;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_67:
          v42 = 16;
LABEL_68:
          *(_DWORD *)((char *)&self->super.super.isa + v42) = v27;
          goto LABEL_69;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          goto LABEL_69;
      }
    }
  }
LABEL_70:
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_vendorDetails)
    PBDataWriterWriteSubmessage();
  v5 = (char)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = (char)self->_has;
  }
  if ((v5 & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  _QWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_error;
    *((_BYTE *)v4 + 40) |= 4u;
  }
  if (self->_vendorDetails)
  {
    v7 = v4;
    objc_msgSend(v4, "setVendorDetails:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_transportType;
    *((_BYTE *)v4 + 40) |= 8u;
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_certified;
    *((_BYTE *)v4 + 40) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  id v8;
  void *v9;
  char v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_error;
    *(_BYTE *)(v5 + 40) |= 4u;
  }
  v8 = -[AWDHomeKitVendorInformation copyWithZone:](self->_vendorDetails, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v8;

  v10 = (char)self->_has;
  if ((v10 & 8) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_transportType;
    *(_BYTE *)(v6 + 40) |= 8u;
    v10 = (char)self->_has;
  }
  if ((v10 & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_certified;
    *(_BYTE *)(v6 + 40) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  AWDHomeKitVendorInformation *vendorDetails;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 40);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_error != *((_DWORD *)v4 + 5))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_24;
  }
  vendorDetails = self->_vendorDetails;
  if ((unint64_t)vendorDetails | *((_QWORD *)v4 + 4))
  {
    if (!-[AWDHomeKitVendorInformation isEqual:](vendorDetails, "isEqual:"))
    {
LABEL_24:
      v8 = 0;
      goto LABEL_25;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 40);
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_transportType != *((_DWORD *)v4 + 6))
      goto LABEL_24;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_24;
  }
  v8 = (v6 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_certified != *((_DWORD *)v4 + 4))
      goto LABEL_24;
    v8 = 1;
  }
LABEL_25:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_error;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[AWDHomeKitVendorInformation hash](self->_vendorDetails, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v6 = 2654435761 * self->_transportType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_8;
LABEL_10:
    v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_8:
  v7 = 2654435761 * self->_certified;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  AWDHomeKitVendorInformation *vendorDetails;
  uint64_t v8;
  char v9;
  id v10;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 40);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 40);
  }
  if ((v6 & 4) != 0)
  {
    self->_error = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 4u;
  }
  vendorDetails = self->_vendorDetails;
  v8 = *((_QWORD *)v5 + 4);
  if (vendorDetails)
  {
    if (!v8)
      goto LABEL_11;
    v10 = v5;
    -[AWDHomeKitVendorInformation mergeFrom:](vendorDetails, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    v10 = v5;
    -[AWDHomeKitTargetControllerError setVendorDetails:](self, "setVendorDetails:");
  }
  v5 = v10;
LABEL_11:
  v9 = *((_BYTE *)v5 + 40);
  if ((v9 & 8) != 0)
  {
    self->_transportType = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_has |= 8u;
    v9 = *((_BYTE *)v5 + 40);
  }
  if ((v9 & 2) != 0)
  {
    self->_certified = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDHomeKitVendorInformation)vendorDetails
{
  return self->_vendorDetails;
}

- (void)setVendorDetails:(id)a3
{
  objc_storeStrong((id *)&self->_vendorDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorDetails, 0);
}

@end
