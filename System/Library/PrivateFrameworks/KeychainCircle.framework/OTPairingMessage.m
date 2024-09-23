@implementation OTPairingMessage

- (BOOL)hasEpoch
{
  return self->_epoch != 0;
}

- (BOOL)hasPrepare
{
  return self->_prepare != 0;
}

- (BOOL)hasVoucher
{
  return self->_voucher != 0;
}

- (BOOL)hasSupportsOctagon
{
  return self->_supportsOctagon != 0;
}

- (BOOL)hasSupportsSOS
{
  return self->_supportsSOS != 0;
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
  v8.super_class = (Class)OTPairingMessage;
  -[OTPairingMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTPairingMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  OTSponsorToApplicantRound1M2 *epoch;
  void *v5;
  OTApplicantToSponsorRound2M1 *prepare;
  void *v7;
  OTSponsorToApplicantRound2M2 *voucher;
  void *v9;
  OTSupportOctagonMessage *supportsOctagon;
  void *v11;
  OTSupportSOSMessage *supportsSOS;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  epoch = self->_epoch;
  if (epoch)
  {
    -[OTSponsorToApplicantRound1M2 dictionaryRepresentation](epoch, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("epoch"));

  }
  prepare = self->_prepare;
  if (prepare)
  {
    -[OTApplicantToSponsorRound2M1 dictionaryRepresentation](prepare, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("prepare"));

  }
  voucher = self->_voucher;
  if (voucher)
  {
    -[OTSponsorToApplicantRound2M2 dictionaryRepresentation](voucher, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("voucher"));

  }
  supportsOctagon = self->_supportsOctagon;
  if (supportsOctagon)
  {
    -[OTSupportOctagonMessage dictionaryRepresentation](supportsOctagon, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("supportsOctagon"));

  }
  supportsSOS = self->_supportsSOS;
  if (supportsSOS)
  {
    -[OTSupportSOSMessage dictionaryRepresentation](supportsSOS, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("supportsSOS"));

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
  int v16;
  OTSponsorToApplicantRound1M2 *v18;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
    return *((_BYTE *)a3 + *v6) == 0;
  v8 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*((_BYTE *)a3 + *v6))
      return *((_BYTE *)a3 + *v6) == 0;
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
      if (v10++ >= 9)
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
      return *((_BYTE *)a3 + *v6) == 0;
    switch((v11 >> 3))
    {
      case 1u:
        v18 = objc_alloc_init(OTSponsorToApplicantRound1M2);
        objc_storeStrong((id *)&self->_epoch, v18);
        if (PBReaderPlaceMark()
          && (OTSponsorToApplicantRound1M2ReadFrom((uint64_t)v18, (uint64_t)a3) & 1) != 0)
        {
          goto LABEL_35;
        }
        goto LABEL_39;
      case 2u:
        v18 = objc_alloc_init(OTApplicantToSponsorRound2M1);
        objc_storeStrong((id *)&self->_prepare, v18);
        if (!PBReaderPlaceMark() || !OTApplicantToSponsorRound2M1ReadFrom((uint64_t)v18, (uint64_t)a3))
          goto LABEL_39;
        goto LABEL_35;
      case 3u:
        v18 = objc_alloc_init(OTSponsorToApplicantRound2M2);
        objc_storeStrong((id *)&self->_voucher, v18);
        if (!PBReaderPlaceMark() || !OTSponsorToApplicantRound2M2ReadFrom((uint64_t)v18, (uint64_t)a3))
          goto LABEL_39;
        goto LABEL_35;
      case 5u:
        v18 = objc_alloc_init(OTSupportOctagonMessage);
        objc_storeStrong((id *)&self->_supportsOctagon, v18);
        if (!PBReaderPlaceMark() || (OTSupportOctagonMessageReadFrom((uint64_t)v18, (uint64_t)a3) & 1) == 0)
          goto LABEL_39;
        goto LABEL_35;
      case 6u:
        v18 = objc_alloc_init(OTSupportSOSMessage);
        objc_storeStrong((id *)&self->_supportsSOS, v18);
        if (PBReaderPlaceMark() && (OTSupportSOSMessageReadFrom((uint64_t)v18, (uint64_t)a3) & 1) != 0)
        {
LABEL_35:
          PBReaderRecallMark();

LABEL_36:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            return *((_BYTE *)a3 + *v6) == 0;
          continue;
        }
LABEL_39:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_36;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_epoch)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_prepare)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_voucher)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_supportsOctagon)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_supportsSOS)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_epoch)
  {
    objc_msgSend(v4, "setEpoch:");
    v4 = v5;
  }
  if (self->_prepare)
  {
    objc_msgSend(v5, "setPrepare:");
    v4 = v5;
  }
  if (self->_voucher)
  {
    objc_msgSend(v5, "setVoucher:");
    v4 = v5;
  }
  if (self->_supportsOctagon)
  {
    objc_msgSend(v5, "setSupportsOctagon:");
    v4 = v5;
  }
  if (self->_supportsSOS)
  {
    objc_msgSend(v5, "setSupportsSOS:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[OTSponsorToApplicantRound1M2 copyWithZone:](self->_epoch, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[OTApplicantToSponsorRound2M1 copyWithZone:](self->_prepare, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[OTSponsorToApplicantRound2M2 copyWithZone:](self->_voucher, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[OTSupportOctagonMessage copyWithZone:](self->_supportsOctagon, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v14 = -[OTSupportSOSMessage copyWithZone:](self->_supportsSOS, "copyWithZone:", a3);
  v15 = (void *)v5[4];
  v5[4] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  OTSponsorToApplicantRound1M2 *epoch;
  OTApplicantToSponsorRound2M1 *prepare;
  OTSponsorToApplicantRound2M2 *voucher;
  OTSupportOctagonMessage *supportsOctagon;
  OTSupportSOSMessage *supportsSOS;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((epoch = self->_epoch, !((unint64_t)epoch | v4[1]))
     || -[OTSponsorToApplicantRound1M2 isEqual:](epoch, "isEqual:"))
    && ((prepare = self->_prepare, !((unint64_t)prepare | v4[2]))
     || -[OTApplicantToSponsorRound2M1 isEqual:](prepare, "isEqual:"))
    && ((voucher = self->_voucher, !((unint64_t)voucher | v4[5]))
     || -[OTSponsorToApplicantRound2M2 isEqual:](voucher, "isEqual:"))
    && ((supportsOctagon = self->_supportsOctagon, !((unint64_t)supportsOctagon | v4[3]))
     || -[OTSupportOctagonMessage isEqual:](supportsOctagon, "isEqual:")))
  {
    supportsSOS = self->_supportsSOS;
    if ((unint64_t)supportsSOS | v4[4])
      v10 = -[OTSupportSOSMessage isEqual:](supportsSOS, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[OTSponsorToApplicantRound1M2 hash](self->_epoch, "hash");
  v4 = -[OTApplicantToSponsorRound2M1 hash](self->_prepare, "hash") ^ v3;
  v5 = -[OTSponsorToApplicantRound2M2 hash](self->_voucher, "hash");
  v6 = v4 ^ v5 ^ -[OTSupportOctagonMessage hash](self->_supportsOctagon, "hash");
  return v6 ^ -[OTSupportSOSMessage hash](self->_supportsSOS, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  OTSponsorToApplicantRound1M2 *epoch;
  uint64_t v6;
  OTApplicantToSponsorRound2M1 *prepare;
  uint64_t v8;
  OTSponsorToApplicantRound2M2 *voucher;
  uint64_t v10;
  OTSupportOctagonMessage *supportsOctagon;
  uint64_t v12;
  OTSupportSOSMessage *supportsSOS;
  uint64_t v14;
  _QWORD *v15;

  v4 = a3;
  epoch = self->_epoch;
  v15 = v4;
  v6 = v4[1];
  if (epoch)
  {
    if (v6)
      -[OTSponsorToApplicantRound1M2 mergeFrom:](epoch, "mergeFrom:");
  }
  else if (v6)
  {
    -[OTPairingMessage setEpoch:](self, "setEpoch:");
  }
  prepare = self->_prepare;
  v8 = v15[2];
  if (prepare)
  {
    if (v8)
      -[OTApplicantToSponsorRound2M1 mergeFrom:](prepare, "mergeFrom:");
  }
  else if (v8)
  {
    -[OTPairingMessage setPrepare:](self, "setPrepare:");
  }
  voucher = self->_voucher;
  v10 = v15[5];
  if (voucher)
  {
    if (v10)
      -[OTSponsorToApplicantRound2M2 mergeFrom:](voucher, "mergeFrom:");
  }
  else if (v10)
  {
    -[OTPairingMessage setVoucher:](self, "setVoucher:");
  }
  supportsOctagon = self->_supportsOctagon;
  v12 = v15[3];
  if (supportsOctagon)
  {
    if (v12)
      -[OTSupportOctagonMessage mergeFrom:](supportsOctagon, "mergeFrom:");
  }
  else if (v12)
  {
    -[OTPairingMessage setSupportsOctagon:](self, "setSupportsOctagon:");
  }
  supportsSOS = self->_supportsSOS;
  v14 = v15[4];
  if (supportsSOS)
  {
    if (v14)
      -[OTSupportSOSMessage mergeFrom:](supportsSOS, "mergeFrom:");
  }
  else if (v14)
  {
    -[OTPairingMessage setSupportsSOS:](self, "setSupportsSOS:");
  }

}

- (OTSponsorToApplicantRound1M2)epoch
{
  return self->_epoch;
}

- (void)setEpoch:(id)a3
{
  objc_storeStrong((id *)&self->_epoch, a3);
}

- (OTApplicantToSponsorRound2M1)prepare
{
  return self->_prepare;
}

- (void)setPrepare:(id)a3
{
  objc_storeStrong((id *)&self->_prepare, a3);
}

- (OTSponsorToApplicantRound2M2)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_voucher, a3);
}

- (OTSupportOctagonMessage)supportsOctagon
{
  return self->_supportsOctagon;
}

- (void)setSupportsOctagon:(id)a3
{
  objc_storeStrong((id *)&self->_supportsOctagon, a3);
}

- (OTSupportSOSMessage)supportsSOS
{
  return self->_supportsSOS;
}

- (void)setSupportsSOS:(id)a3
{
  objc_storeStrong((id *)&self->_supportsSOS, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_supportsSOS, 0);
  objc_storeStrong((id *)&self->_supportsOctagon, 0);
  objc_storeStrong((id *)&self->_prepare, 0);
  objc_storeStrong((id *)&self->_epoch, 0);
}

@end
