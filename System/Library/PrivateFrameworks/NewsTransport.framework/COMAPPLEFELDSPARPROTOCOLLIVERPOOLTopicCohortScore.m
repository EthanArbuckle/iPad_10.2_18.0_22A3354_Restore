@implementation COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicCohortScore

- (BOOL)hasTagId
{
  return self->_tagId != 0;
}

- (BOOL)hasCohorts
{
  return self->_cohorts != 0;
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
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicCohortScore;
  -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicCohortScore description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicCohortScore dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *tagId;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *cohorts;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  tagId = self->_tagId;
  if (tagId)
    objc_msgSend(v3, "setObject:forKey:", tagId, CFSTR("tag_id"));
  cohorts = self->_cohorts;
  if (cohorts)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList dictionaryRepresentation](cohorts, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("cohorts"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicCohortScoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_tagId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_cohorts)
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
  if (self->_tagId)
  {
    objc_msgSend(v4, "setTagId:");
    v4 = v5;
  }
  if (self->_cohorts)
  {
    objc_msgSend(v5, "setCohorts:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_tagId, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList copyWithZone:](self->_cohorts, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *tagId;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *cohorts;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((tagId = self->_tagId, !((unint64_t)tagId | v4[2]))
     || -[NSString isEqual:](tagId, "isEqual:")))
  {
    cohorts = self->_cohorts;
    if ((unint64_t)cohorts | v4[1])
      v7 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](cohorts, "isEqual:");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_tagId, "hash");
  return -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList hash](self->_cohorts, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *cohorts;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicCohortScore setTagId:](self, "setTagId:");
    v4 = v7;
  }
  cohorts = self->_cohorts;
  v6 = v4[1];
  if (cohorts)
  {
    if (v6)
    {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](cohorts, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicCohortScore setCohorts:](self, "setCohorts:");
    goto LABEL_8;
  }

}

- (NSString)tagId
{
  return self->_tagId;
}

- (void)setTagId:(id)a3
{
  objc_storeStrong((id *)&self->_tagId, a3);
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)cohorts
{
  return self->_cohorts;
}

- (void)setCohorts:(id)a3
{
  objc_storeStrong((id *)&self->_cohorts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagId, 0);
  objc_storeStrong((id *)&self->_cohorts, 0);
}

@end
