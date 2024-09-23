@implementation _CPUsageEnvelope

- (void)clearKind
{
  _CPUsageSinceLookback *usageSinceLookback;
  _CPSafariUsagePropensity *safariUsagePropensity;
  _CPSpotlightUsagePropensity *spotlightUsagePropensity;
  _CPImagesUsagePropensity *imagesUsagePropensity;
  _CPNewsUsagePropensity *newsUsagePropensity;

  self->_whichKind = 0;
  usageSinceLookback = self->_usageSinceLookback;
  self->_usageSinceLookback = 0;

  safariUsagePropensity = self->_safariUsagePropensity;
  self->_safariUsagePropensity = 0;

  spotlightUsagePropensity = self->_spotlightUsagePropensity;
  self->_spotlightUsagePropensity = 0;

  imagesUsagePropensity = self->_imagesUsagePropensity;
  self->_imagesUsagePropensity = 0;

  newsUsagePropensity = self->_newsUsagePropensity;
  self->_newsUsagePropensity = 0;

}

- (void)setUsageSinceLookback:(id)a3
{
  _CPUsageSinceLookback *v4;
  _CPUsageSinceLookback *usageSinceLookback;

  v4 = (_CPUsageSinceLookback *)a3;
  -[_CPUsageEnvelope clearKind](self, "clearKind");
  self->_whichKind = v4 != 0;
  usageSinceLookback = self->_usageSinceLookback;
  self->_usageSinceLookback = v4;

}

- (_CPUsageSinceLookback)usageSinceLookback
{
  if (self->_whichKind == 1)
    return self->_usageSinceLookback;
  else
    return (_CPUsageSinceLookback *)0;
}

- (void)setSafariUsagePropensity:(id)a3
{
  _CPSafariUsagePropensity *v4;
  _CPSafariUsagePropensity *safariUsagePropensity;

  v4 = (_CPSafariUsagePropensity *)a3;
  -[_CPUsageEnvelope clearKind](self, "clearKind");
  self->_whichKind = 2 * (v4 != 0);
  safariUsagePropensity = self->_safariUsagePropensity;
  self->_safariUsagePropensity = v4;

}

- (_CPSafariUsagePropensity)safariUsagePropensity
{
  if (self->_whichKind == 2)
    return self->_safariUsagePropensity;
  else
    return (_CPSafariUsagePropensity *)0;
}

- (void)setSpotlightUsagePropensity:(id)a3
{
  _CPSpotlightUsagePropensity *v4;
  unint64_t v5;
  _CPSpotlightUsagePropensity *spotlightUsagePropensity;

  v4 = (_CPSpotlightUsagePropensity *)a3;
  -[_CPUsageEnvelope clearKind](self, "clearKind");
  v5 = 3;
  if (!v4)
    v5 = 0;
  self->_whichKind = v5;
  spotlightUsagePropensity = self->_spotlightUsagePropensity;
  self->_spotlightUsagePropensity = v4;

}

- (_CPSpotlightUsagePropensity)spotlightUsagePropensity
{
  if (self->_whichKind == 3)
    return self->_spotlightUsagePropensity;
  else
    return (_CPSpotlightUsagePropensity *)0;
}

- (void)setImagesUsagePropensity:(id)a3
{
  _CPImagesUsagePropensity *v4;
  _CPImagesUsagePropensity *imagesUsagePropensity;

  v4 = (_CPImagesUsagePropensity *)a3;
  -[_CPUsageEnvelope clearKind](self, "clearKind");
  self->_whichKind = 4 * (v4 != 0);
  imagesUsagePropensity = self->_imagesUsagePropensity;
  self->_imagesUsagePropensity = v4;

}

- (_CPImagesUsagePropensity)imagesUsagePropensity
{
  if (self->_whichKind == 4)
    return self->_imagesUsagePropensity;
  else
    return (_CPImagesUsagePropensity *)0;
}

- (void)setNewsUsagePropensity:(id)a3
{
  _CPNewsUsagePropensity *v4;
  unint64_t v5;
  _CPNewsUsagePropensity *newsUsagePropensity;

  v4 = (_CPNewsUsagePropensity *)a3;
  -[_CPUsageEnvelope clearKind](self, "clearKind");
  v5 = 5;
  if (!v4)
    v5 = 0;
  self->_whichKind = v5;
  newsUsagePropensity = self->_newsUsagePropensity;
  self->_newsUsagePropensity = v4;

}

- (_CPNewsUsagePropensity)newsUsagePropensity
{
  if (self->_whichKind == 5)
    return self->_newsUsagePropensity;
  else
    return (_CPNewsUsagePropensity *)0;
}

- (BOOL)readFrom:(id)a3
{
  return _CPUsageEnvelopeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[_CPUsageEnvelope usageSinceLookback](self, "usageSinceLookback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPUsageEnvelope usageSinceLookback](self, "usageSinceLookback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPUsageEnvelope safariUsagePropensity](self, "safariUsagePropensity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_CPUsageEnvelope safariUsagePropensity](self, "safariUsagePropensity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPUsageEnvelope spotlightUsagePropensity](self, "spotlightUsagePropensity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_CPUsageEnvelope spotlightUsagePropensity](self, "spotlightUsagePropensity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPUsageEnvelope imagesUsagePropensity](self, "imagesUsagePropensity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_CPUsageEnvelope imagesUsagePropensity](self, "imagesUsagePropensity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPUsageEnvelope newsUsagePropensity](self, "newsUsagePropensity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_CPUsageEnvelope newsUsagePropensity](self, "newsUsagePropensity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPUsageEnvelope collectionStartTimestamp](self, "collectionStartTimestamp"))
    PBDataWriterWriteInt64Field();
  if (-[_CPUsageEnvelope collectionEndTimestamp](self, "collectionEndTimestamp"))
    PBDataWriterWriteInt64Field();
  if (-[_CPUsageEnvelope configuredLookbackTimeInDays](self, "configuredLookbackTimeInDays"))
    PBDataWriterWriteInt32Field();
  if (-[_CPUsageEnvelope totalSessions](self, "totalSessions"))
    PBDataWriterWriteInt32Field();
  -[_CPUsageEnvelope context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_CPUsageEnvelope context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPUsageEnvelope uuidBytes](self, "uuidBytes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v18;
  if (v16)
  {
    PBDataWriterWriteDataField();
    v17 = v18;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int64_t collectionStartTimestamp;
  int64_t collectionEndTimestamp;
  int configuredLookbackTimeInDays;
  int totalSessions;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  BOOL v46;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  -[_CPUsageEnvelope usageSinceLookback](self, "usageSinceLookback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usageSinceLookback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_CPUsageEnvelope usageSinceLookback](self, "usageSinceLookback");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_CPUsageEnvelope usageSinceLookback](self, "usageSinceLookback");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "usageSinceLookback");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_41;
  }
  else
  {

  }
  -[_CPUsageEnvelope safariUsagePropensity](self, "safariUsagePropensity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safariUsagePropensity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_CPUsageEnvelope safariUsagePropensity](self, "safariUsagePropensity");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_CPUsageEnvelope safariUsagePropensity](self, "safariUsagePropensity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safariUsagePropensity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_41;
  }
  else
  {

  }
  -[_CPUsageEnvelope spotlightUsagePropensity](self, "spotlightUsagePropensity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spotlightUsagePropensity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_CPUsageEnvelope spotlightUsagePropensity](self, "spotlightUsagePropensity");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_CPUsageEnvelope spotlightUsagePropensity](self, "spotlightUsagePropensity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spotlightUsagePropensity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_41;
  }
  else
  {

  }
  -[_CPUsageEnvelope imagesUsagePropensity](self, "imagesUsagePropensity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imagesUsagePropensity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_CPUsageEnvelope imagesUsagePropensity](self, "imagesUsagePropensity");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_CPUsageEnvelope imagesUsagePropensity](self, "imagesUsagePropensity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imagesUsagePropensity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_41;
  }
  else
  {

  }
  -[_CPUsageEnvelope newsUsagePropensity](self, "newsUsagePropensity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "newsUsagePropensity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_CPUsageEnvelope newsUsagePropensity](self, "newsUsagePropensity");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_CPUsageEnvelope newsUsagePropensity](self, "newsUsagePropensity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "newsUsagePropensity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_41;
  }
  else
  {

  }
  collectionStartTimestamp = self->_collectionStartTimestamp;
  if (collectionStartTimestamp != objc_msgSend(v4, "collectionStartTimestamp"))
    goto LABEL_41;
  collectionEndTimestamp = self->_collectionEndTimestamp;
  if (collectionEndTimestamp != objc_msgSend(v4, "collectionEndTimestamp"))
    goto LABEL_41;
  configuredLookbackTimeInDays = self->_configuredLookbackTimeInDays;
  if (configuredLookbackTimeInDays != objc_msgSend(v4, "configuredLookbackTimeInDays"))
    goto LABEL_41;
  totalSessions = self->_totalSessions;
  if (totalSessions != objc_msgSend(v4, "totalSessions"))
    goto LABEL_41;
  -[_CPUsageEnvelope context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_CPUsageEnvelope context](self, "context");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_CPUsageEnvelope context](self, "context");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_41;
  }
  else
  {

  }
  -[_CPUsageEnvelope uuidBytes](self, "uuidBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuidBytes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_CPUsageEnvelope uuidBytes](self, "uuidBytes");
    v41 = objc_claimAutoreleasedReturnValue();
    if (!v41)
    {

LABEL_44:
      v46 = 1;
      goto LABEL_42;
    }
    v42 = (void *)v41;
    -[_CPUsageEnvelope uuidBytes](self, "uuidBytes");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuidBytes");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if ((v45 & 1) != 0)
      goto LABEL_44;
  }
  else
  {
LABEL_40:

  }
LABEL_41:
  v46 = 0;
LABEL_42:

  return v46;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v3 = -[_CPUsageSinceLookback hash](self->_usageSinceLookback, "hash");
  v4 = -[_CPSafariUsagePropensity hash](self->_safariUsagePropensity, "hash") ^ v3;
  v5 = -[_CPSpotlightUsagePropensity hash](self->_spotlightUsagePropensity, "hash");
  v6 = v4 ^ v5 ^ -[_CPImagesUsagePropensity hash](self->_imagesUsagePropensity, "hash");
  v7 = v6 ^ -[_CPNewsUsagePropensity hash](self->_newsUsagePropensity, "hash") ^ (2654435761
                                                                                * self->_collectionStartTimestamp) ^ (2654435761 * self->_collectionEndTimestamp) ^ (2654435761 * self->_configuredLookbackTimeInDays);
  v8 = 2654435761 * self->_totalSessions;
  v9 = v8 ^ -[_CPDeviceContext hash](self->_context, "hash");
  return v7 ^ v9 ^ -[NSData hash](self->_uuidBytes, "hash");
}

- (int64_t)collectionStartTimestamp
{
  return self->_collectionStartTimestamp;
}

- (void)setCollectionStartTimestamp:(int64_t)a3
{
  self->_collectionStartTimestamp = a3;
}

- (int64_t)collectionEndTimestamp
{
  return self->_collectionEndTimestamp;
}

- (void)setCollectionEndTimestamp:(int64_t)a3
{
  self->_collectionEndTimestamp = a3;
}

- (int)configuredLookbackTimeInDays
{
  return self->_configuredLookbackTimeInDays;
}

- (void)setConfiguredLookbackTimeInDays:(int)a3
{
  self->_configuredLookbackTimeInDays = a3;
}

- (int)totalSessions
{
  return self->_totalSessions;
}

- (void)setTotalSessions:(int)a3
{
  self->_totalSessions = a3;
}

- (_CPDeviceContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSData)uuidBytes
{
  return self->_uuidBytes;
}

- (void)setUuidBytes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)whichKind
{
  return self->_whichKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidBytes, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_newsUsagePropensity, 0);
  objc_storeStrong((id *)&self->_imagesUsagePropensity, 0);
  objc_storeStrong((id *)&self->_spotlightUsagePropensity, 0);
  objc_storeStrong((id *)&self->_safariUsagePropensity, 0);
  objc_storeStrong((id *)&self->_usageSinceLookback, 0);
}

@end
