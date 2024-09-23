@implementation COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicConversionStats

- (BOOL)hasConversionStats
{
  return self->_conversionStats != 0;
}

- (BOOL)hasTagId
{
  return self->_tagId != 0;
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
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicConversionStats;
  -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicConversionStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicConversionStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *conversionStats;
  void *v5;
  NSString *tagId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  conversionStats = self->_conversionStats;
  if (conversionStats)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats dictionaryRepresentation](conversionStats, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("conversion_stats"));

  }
  tagId = self->_tagId;
  if (tagId)
    objc_msgSend(v3, "setObject:forKey:", tagId, CFSTR("tag_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicConversionStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_conversionStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_tagId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_conversionStats)
  {
    objc_msgSend(v4, "setConversionStats:");
    v4 = v5;
  }
  if (self->_tagId)
  {
    objc_msgSend(v5, "setTagId:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats copyWithZone:](self->_conversionStats, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_tagId, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *conversionStats;
  NSString *tagId;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((conversionStats = self->_conversionStats, !((unint64_t)conversionStats | v4[1]))
     || -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](conversionStats, "isEqual:")))
  {
    tagId = self->_tagId;
    if ((unint64_t)tagId | v4[2])
      v7 = -[NSString isEqual:](tagId, "isEqual:");
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
  unint64_t v3;

  v3 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats hash](self->_conversionStats, "hash");
  return -[NSString hash](self->_tagId, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *conversionStats;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  conversionStats = self->_conversionStats;
  v6 = v4[1];
  v7 = v4;
  if (conversionStats)
  {
    if (!v6)
      goto LABEL_7;
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](conversionStats, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicConversionStats setConversionStats:](self, "setConversionStats:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicConversionStats setTagId:](self, "setTagId:");
    v4 = v7;
  }

}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)conversionStats
{
  return self->_conversionStats;
}

- (void)setConversionStats:(id)a3
{
  objc_storeStrong((id *)&self->_conversionStats, a3);
}

- (NSString)tagId
{
  return self->_tagId;
}

- (void)setTagId:(id)a3
{
  objc_storeStrong((id *)&self->_tagId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagId, 0);
  objc_storeStrong((id *)&self->_conversionStats, 0);
}

@end
