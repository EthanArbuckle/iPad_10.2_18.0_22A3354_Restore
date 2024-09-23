@implementation OTApplicantToSponsorRound2M1

- (BOOL)hasPeerID
{
  return self->_peerID != 0;
}

- (BOOL)hasPermanentInfo
{
  return self->_permanentInfo != 0;
}

- (BOOL)hasPermanentInfoSig
{
  return self->_permanentInfoSig != 0;
}

- (BOOL)hasStableInfo
{
  return self->_stableInfo != 0;
}

- (BOOL)hasStableInfoSig
{
  return self->_stableInfoSig != 0;
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
  v8.super_class = (Class)OTApplicantToSponsorRound2M1;
  -[OTApplicantToSponsorRound2M1 description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTApplicantToSponsorRound2M1 dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *peerID;
  NSData *permanentInfo;
  NSData *permanentInfoSig;
  NSData *stableInfo;
  NSData *stableInfoSig;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  peerID = self->_peerID;
  if (peerID)
    objc_msgSend(v3, "setObject:forKey:", peerID, CFSTR("peerID"));
  permanentInfo = self->_permanentInfo;
  if (permanentInfo)
    objc_msgSend(v4, "setObject:forKey:", permanentInfo, CFSTR("permanentInfo"));
  permanentInfoSig = self->_permanentInfoSig;
  if (permanentInfoSig)
    objc_msgSend(v4, "setObject:forKey:", permanentInfoSig, CFSTR("permanentInfoSig"));
  stableInfo = self->_stableInfo;
  if (stableInfo)
    objc_msgSend(v4, "setObject:forKey:", stableInfo, CFSTR("stableInfo"));
  stableInfoSig = self->_stableInfoSig;
  if (stableInfoSig)
    objc_msgSend(v4, "setObject:forKey:", stableInfoSig, CFSTR("StableInfoSig"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return OTApplicantToSponsorRound2M1ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_peerID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_permanentInfo)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_permanentInfoSig)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_stableInfo)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_stableInfoSig)
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
  if (self->_peerID)
  {
    objc_msgSend(v4, "setPeerID:");
    v4 = v5;
  }
  if (self->_permanentInfo)
  {
    objc_msgSend(v5, "setPermanentInfo:");
    v4 = v5;
  }
  if (self->_permanentInfoSig)
  {
    objc_msgSend(v5, "setPermanentInfoSig:");
    v4 = v5;
  }
  if (self->_stableInfo)
  {
    objc_msgSend(v5, "setStableInfo:");
    v4 = v5;
  }
  if (self->_stableInfoSig)
  {
    objc_msgSend(v5, "setStableInfoSig:");
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_peerID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_permanentInfo, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSData copyWithZone:](self->_permanentInfoSig, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSData copyWithZone:](self->_stableInfo, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSData copyWithZone:](self->_stableInfoSig, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *peerID;
  NSData *permanentInfo;
  NSData *permanentInfoSig;
  NSData *stableInfo;
  NSData *stableInfoSig;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((peerID = self->_peerID, !((unint64_t)peerID | v4[1]))
     || -[NSString isEqual:](peerID, "isEqual:"))
    && ((permanentInfo = self->_permanentInfo, !((unint64_t)permanentInfo | v4[2]))
     || -[NSData isEqual:](permanentInfo, "isEqual:"))
    && ((permanentInfoSig = self->_permanentInfoSig, !((unint64_t)permanentInfoSig | v4[3]))
     || -[NSData isEqual:](permanentInfoSig, "isEqual:"))
    && ((stableInfo = self->_stableInfo, !((unint64_t)stableInfo | v4[4]))
     || -[NSData isEqual:](stableInfo, "isEqual:")))
  {
    stableInfoSig = self->_stableInfoSig;
    if ((unint64_t)stableInfoSig | v4[5])
      v10 = -[NSData isEqual:](stableInfoSig, "isEqual:");
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
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_peerID, "hash");
  v4 = -[NSData hash](self->_permanentInfo, "hash") ^ v3;
  v5 = -[NSData hash](self->_permanentInfoSig, "hash");
  v6 = v4 ^ v5 ^ -[NSData hash](self->_stableInfo, "hash");
  return v6 ^ -[NSData hash](self->_stableInfoSig, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[OTApplicantToSponsorRound2M1 setPeerID:](self, "setPeerID:");
  if (v4[2])
    -[OTApplicantToSponsorRound2M1 setPermanentInfo:](self, "setPermanentInfo:");
  if (v4[3])
    -[OTApplicantToSponsorRound2M1 setPermanentInfoSig:](self, "setPermanentInfoSig:");
  if (v4[4])
    -[OTApplicantToSponsorRound2M1 setStableInfo:](self, "setStableInfo:");
  if (v4[5])
    -[OTApplicantToSponsorRound2M1 setStableInfoSig:](self, "setStableInfoSig:");

}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_peerID, a3);
}

- (NSData)permanentInfo
{
  return self->_permanentInfo;
}

- (void)setPermanentInfo:(id)a3
{
  objc_storeStrong((id *)&self->_permanentInfo, a3);
}

- (NSData)permanentInfoSig
{
  return self->_permanentInfoSig;
}

- (void)setPermanentInfoSig:(id)a3
{
  objc_storeStrong((id *)&self->_permanentInfoSig, a3);
}

- (NSData)stableInfo
{
  return self->_stableInfo;
}

- (void)setStableInfo:(id)a3
{
  objc_storeStrong((id *)&self->_stableInfo, a3);
}

- (NSData)stableInfoSig
{
  return self->_stableInfoSig;
}

- (void)setStableInfoSig:(id)a3
{
  objc_storeStrong((id *)&self->_stableInfoSig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableInfoSig, 0);
  objc_storeStrong((id *)&self->_stableInfo, 0);
  objc_storeStrong((id *)&self->_permanentInfoSig, 0);
  objc_storeStrong((id *)&self->_permanentInfo, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
}

@end
