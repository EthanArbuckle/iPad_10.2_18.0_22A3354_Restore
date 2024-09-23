@implementation OTSponsorToApplicantRound2M2

- (BOOL)hasVoucher
{
  return self->_voucher != 0;
}

- (BOOL)hasVoucherSignature
{
  return self->_voucherSignature != 0;
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
  v8.super_class = (Class)OTSponsorToApplicantRound2M2;
  -[OTSponsorToApplicantRound2M2 description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTSponsorToApplicantRound2M2 dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *voucher;
  NSData *voucherSignature;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  voucher = self->_voucher;
  if (voucher)
    objc_msgSend(v3, "setObject:forKey:", voucher, CFSTR("voucher"));
  voucherSignature = self->_voucherSignature;
  if (voucherSignature)
    objc_msgSend(v4, "setObject:forKey:", voucherSignature, CFSTR("voucherSignature"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return OTSponsorToApplicantRound2M2ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_voucher)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_voucherSignature)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_voucher)
  {
    objc_msgSend(v4, "setVoucher:");
    v4 = v5;
  }
  if (self->_voucherSignature)
  {
    objc_msgSend(v5, "setVoucherSignature:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_voucher, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_voucherSignature, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *voucher;
  NSData *voucherSignature;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((voucher = self->_voucher, !((unint64_t)voucher | v4[1]))
     || -[NSData isEqual:](voucher, "isEqual:")))
  {
    voucherSignature = self->_voucherSignature;
    if ((unint64_t)voucherSignature | v4[2])
      v7 = -[NSData isEqual:](voucherSignature, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSData hash](self->_voucher, "hash");
  return -[NSData hash](self->_voucherSignature, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[OTSponsorToApplicantRound2M2 setVoucher:](self, "setVoucher:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[OTSponsorToApplicantRound2M2 setVoucherSignature:](self, "setVoucherSignature:");
    v4 = v5;
  }

}

- (NSData)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_voucher, a3);
}

- (NSData)voucherSignature
{
  return self->_voucherSignature;
}

- (void)setVoucherSignature:(id)a3
{
  objc_storeStrong((id *)&self->_voucherSignature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucherSignature, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
}

@end
