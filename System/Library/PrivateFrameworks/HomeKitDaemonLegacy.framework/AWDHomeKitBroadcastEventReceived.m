@implementation AWDHomeKitBroadcastEventReceived

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

- (void)setIsExpectedGSN:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isExpectedGSN = a3;
}

- (void)setHasIsExpectedGSN:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsExpectedGSN
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasVendorDetails
{
  return self->_vendorDetails != 0;
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
    return off_1E89A8270[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AWDHomeKitBroadcastEventReceived;
  -[AWDHomeKitBroadcastEventReceived description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitBroadcastEventReceived dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  AWDHomeKitVendorInformation *vendorDetails;
  void *v8;
  uint64_t certified;
  __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isExpectedGSN);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("isExpectedGSN"));

  }
  vendorDetails = self->_vendorDetails;
  if (vendorDetails)
  {
    -[AWDHomeKitVendorInformation dictionaryRepresentation](vendorDetails, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("vendorDetails"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    certified = self->_certified;
    if (certified >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_certified);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E89A8270[certified];
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("certified"));

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
  uint64_t v35;
  unint64_t v36;
  char v37;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
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
              goto LABEL_46;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_48;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_46:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_48:
          self->_timestamp = v20;
          goto LABEL_57;
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
                  v27 = 0;
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v27 = 0;
LABEL_52:
          self->_isExpectedGSN = v27 != 0;
          goto LABEL_57;
        case 3u:
          v31 = objc_alloc_init(AWDHomeKitVendorInformation);
          objc_storeStrong((id *)&self->_vendorDetails, v31);
          if (!PBReaderPlaceMark() || !AWDHomeKitVendorInformationReadFrom((uint64_t)v31, (uint64_t)a3))
          {

            LOBYTE(v24) = 0;
            return v24;
          }
          PBReaderRecallMark();

LABEL_57:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_58;
          break;
        case 4u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)&self->_has |= 2u;
          while (2)
          {
            v35 = *v4;
            v36 = *(_QWORD *)((char *)a3 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v36);
              *(_QWORD *)((char *)a3 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v15 = v33++ >= 9;
                if (v15)
                {
                  LODWORD(v34) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v34) = 0;
LABEL_56:
          self->_certified = v34;
          goto LABEL_57;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          goto LABEL_57;
      }
    }
  }
LABEL_58:
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_vendorDetails)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_BYTE *)v4 + 32) = self->_isExpectedGSN;
    *((_BYTE *)v4 + 36) |= 4u;
  }
  if (self->_vendorDetails)
  {
    v6 = v4;
    objc_msgSend(v4, "setVendorDetails:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_certified;
    *((_BYTE *)v4 + 36) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_isExpectedGSN;
    *(_BYTE *)(v5 + 36) |= 4u;
  }
  v8 = -[AWDHomeKitVendorInformation copyWithZone:](self->_vendorDetails, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_certified;
    *(_BYTE *)(v6 + 36) |= 2u;
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
    goto LABEL_22;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 36);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0)
      goto LABEL_22;
    if (self->_isExpectedGSN)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_22;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_22;
  }
  vendorDetails = self->_vendorDetails;
  if (!((unint64_t)vendorDetails | *((_QWORD *)v4 + 3)))
    goto LABEL_18;
  if (!-[AWDHomeKitVendorInformation isEqual:](vendorDetails, "isEqual:"))
  {
LABEL_22:
    v8 = 0;
    goto LABEL_23;
  }
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 36);
LABEL_18:
  v8 = (v6 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_certified != *((_DWORD *)v4 + 4))
      goto LABEL_22;
    v8 = 1;
  }
LABEL_23:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

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
      v4 = 2654435761 * self->_isExpectedGSN;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[AWDHomeKitVendorInformation hash](self->_vendorDetails, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_certified;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  AWDHomeKitVendorInformation *vendorDetails;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 36);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 36);
  }
  if ((v6 & 4) != 0)
  {
    self->_isExpectedGSN = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 4u;
  }
  vendorDetails = self->_vendorDetails;
  v8 = *((_QWORD *)v5 + 3);
  if (vendorDetails)
  {
    if (!v8)
      goto LABEL_11;
    v9 = v5;
    -[AWDHomeKitVendorInformation mergeFrom:](vendorDetails, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    v9 = v5;
    -[AWDHomeKitBroadcastEventReceived setVendorDetails:](self, "setVendorDetails:");
  }
  v5 = v9;
LABEL_11:
  if ((*((_BYTE *)v5 + 36) & 2) != 0)
  {
    self->_certified = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)isExpectedGSN
{
  return self->_isExpectedGSN;
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
