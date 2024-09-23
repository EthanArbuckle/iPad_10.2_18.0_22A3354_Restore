@implementation COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSPurchaseOffersItem

- (BOOL)hasPurchaseId
{
  return self->_purchaseId != 0;
}

- (int)purchaseType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_purchaseType;
  else
    return 0;
}

- (void)setPurchaseType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_purchaseType = a3;
}

- (void)setHasPurchaseType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPurchaseType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)purchaseTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD50A30[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPurchaseType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PURCHASE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AL_A_CARTE_PURCHASE_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUNDLE_PURCHASE_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("S_BUNDLE_PURCHASE_TYPE")))
  {
    v4 = 3;
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
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSPurchaseOffersItem;
  -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSPurchaseOffersItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSPurchaseOffersItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *purchaseId;
  uint64_t purchaseType;
  __CFString *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  purchaseId = self->_purchaseId;
  if (purchaseId)
    objc_msgSend(v3, "setObject:forKey:", purchaseId, CFSTR("purchase_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    purchaseType = self->_purchaseType;
    if (purchaseType >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_purchaseType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_24CD50A30[purchaseType];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("purchase_type"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSPurchaseOffersItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_purchaseId)
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
  if (self->_purchaseId)
  {
    v5 = v4;
    objc_msgSend(v4, "setPurchaseId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_purchaseType;
    *((_BYTE *)v4 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_purchaseId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_purchaseType;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *purchaseId;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  purchaseId = self->_purchaseId;
  if ((unint64_t)purchaseId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](purchaseId, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_purchaseType == *((_DWORD *)v4 + 4))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_purchaseId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_purchaseType;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSPurchaseOffersItem setPurchaseId:](self, "setPurchaseId:");
    v4 = v5;
  }
  if ((v4[5] & 1) != 0)
  {
    self->_purchaseType = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)purchaseId
{
  return self->_purchaseId;
}

- (void)setPurchaseId:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseId, 0);
}

@end
