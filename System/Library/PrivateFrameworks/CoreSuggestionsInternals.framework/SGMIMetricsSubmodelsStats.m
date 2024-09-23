@implementation SGMIMetricsSubmodelsStats

- (BOOL)hasPersonFromSenderStats
{
  return self->_personFromSenderStats != 0;
}

- (BOOL)hasPersonFromSenderInDyadicConversationStats
{
  return self->_personFromSenderInDyadicConversationStats != 0;
}

- (BOOL)hasSubjectContentStats
{
  return self->_subjectContentStats != 0;
}

- (BOOL)hasPersonToRecipientsStats
{
  return self->_personToRecipientsStats != 0;
}

- (BOOL)hasPersonCCRecipientsStats
{
  return self->_personCCRecipientsStats != 0;
}

- (BOOL)hasDomainFromSenderStats
{
  return self->_domainFromSenderStats != 0;
}

- (BOOL)hasConversationStats
{
  return self->_conversationStats != 0;
}

- (BOOL)hasListIdStats
{
  return self->_listIdStats != 0;
}

- (BOOL)hasAttachmentsStats
{
  return self->_attachmentsStats != 0;
}

- (BOOL)hasSubjectCountStatsStats
{
  return self->_subjectCountStatsStats != 0;
}

- (BOOL)hasStandardMailRulesStats
{
  return self->_standardMailRulesStats != 0;
}

- (BOOL)hasMailboxStats
{
  return self->_mailboxStats != 0;
}

- (BOOL)hasMailboxTypeStats
{
  return self->_mailboxTypeStats != 0;
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
  v8.super_class = (Class)SGMIMetricsSubmodelsStats;
  -[SGMIMetricsSubmodelsStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIMetricsSubmodelsStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SGMIMetricsSubmodelStats *personFromSenderStats;
  void *v5;
  SGMIMetricsSubmodelStats *personFromSenderInDyadicConversationStats;
  void *v7;
  SGMIMetricsSubmodelStats *subjectContentStats;
  void *v9;
  SGMIMetricsSubmodelStats *personToRecipientsStats;
  void *v11;
  SGMIMetricsSubmodelStats *personCCRecipientsStats;
  void *v13;
  SGMIMetricsSubmodelStats *domainFromSenderStats;
  void *v15;
  SGMIMetricsSubmodelStats *conversationStats;
  void *v17;
  SGMIMetricsSubmodelStats *listIdStats;
  void *v19;
  SGMIMetricsSubmodelStats *attachmentsStats;
  void *v21;
  SGMIMetricsSubmodelStats *subjectCountStatsStats;
  void *v23;
  SGMIMetricsSubmodelStats *standardMailRulesStats;
  void *v25;
  SGMIMetricsSubmodelStats *mailboxStats;
  void *v27;
  SGMIMetricsSubmodelStats *mailboxTypeStats;
  void *v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  personFromSenderStats = self->_personFromSenderStats;
  if (personFromSenderStats)
  {
    -[SGMIMetricsSubmodelStats dictionaryRepresentation](personFromSenderStats, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("personFromSenderStats"));

  }
  personFromSenderInDyadicConversationStats = self->_personFromSenderInDyadicConversationStats;
  if (personFromSenderInDyadicConversationStats)
  {
    -[SGMIMetricsSubmodelStats dictionaryRepresentation](personFromSenderInDyadicConversationStats, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("personFromSenderInDyadicConversationStats"));

  }
  subjectContentStats = self->_subjectContentStats;
  if (subjectContentStats)
  {
    -[SGMIMetricsSubmodelStats dictionaryRepresentation](subjectContentStats, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("subjectContentStats"));

  }
  personToRecipientsStats = self->_personToRecipientsStats;
  if (personToRecipientsStats)
  {
    -[SGMIMetricsSubmodelStats dictionaryRepresentation](personToRecipientsStats, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("personToRecipientsStats"));

  }
  personCCRecipientsStats = self->_personCCRecipientsStats;
  if (personCCRecipientsStats)
  {
    -[SGMIMetricsSubmodelStats dictionaryRepresentation](personCCRecipientsStats, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("personCCRecipientsStats"));

  }
  domainFromSenderStats = self->_domainFromSenderStats;
  if (domainFromSenderStats)
  {
    -[SGMIMetricsSubmodelStats dictionaryRepresentation](domainFromSenderStats, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("domainFromSenderStats"));

  }
  conversationStats = self->_conversationStats;
  if (conversationStats)
  {
    -[SGMIMetricsSubmodelStats dictionaryRepresentation](conversationStats, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("conversationStats"));

  }
  listIdStats = self->_listIdStats;
  if (listIdStats)
  {
    -[SGMIMetricsSubmodelStats dictionaryRepresentation](listIdStats, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("listIdStats"));

  }
  attachmentsStats = self->_attachmentsStats;
  if (attachmentsStats)
  {
    -[SGMIMetricsSubmodelStats dictionaryRepresentation](attachmentsStats, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("attachmentsStats"));

  }
  subjectCountStatsStats = self->_subjectCountStatsStats;
  if (subjectCountStatsStats)
  {
    -[SGMIMetricsSubmodelStats dictionaryRepresentation](subjectCountStatsStats, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("subjectCountStatsStats"));

  }
  standardMailRulesStats = self->_standardMailRulesStats;
  if (standardMailRulesStats)
  {
    -[SGMIMetricsSubmodelStats dictionaryRepresentation](standardMailRulesStats, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("standardMailRulesStats"));

  }
  mailboxStats = self->_mailboxStats;
  if (mailboxStats)
  {
    -[SGMIMetricsSubmodelStats dictionaryRepresentation](mailboxStats, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("mailboxStats"));

  }
  mailboxTypeStats = self->_mailboxTypeStats;
  if (mailboxTypeStats)
  {
    -[SGMIMetricsSubmodelStats dictionaryRepresentation](mailboxTypeStats, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("mailboxTypeStats"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsSubmodelsStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_personFromSenderStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_personFromSenderInDyadicConversationStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_subjectContentStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_personToRecipientsStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_personCCRecipientsStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_domainFromSenderStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_conversationStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_listIdStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_attachmentsStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_subjectCountStatsStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_standardMailRulesStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mailboxStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mailboxTypeStats)
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
  if (self->_personFromSenderStats)
  {
    objc_msgSend(v4, "setPersonFromSenderStats:");
    v4 = v5;
  }
  if (self->_personFromSenderInDyadicConversationStats)
  {
    objc_msgSend(v5, "setPersonFromSenderInDyadicConversationStats:");
    v4 = v5;
  }
  if (self->_subjectContentStats)
  {
    objc_msgSend(v5, "setSubjectContentStats:");
    v4 = v5;
  }
  if (self->_personToRecipientsStats)
  {
    objc_msgSend(v5, "setPersonToRecipientsStats:");
    v4 = v5;
  }
  if (self->_personCCRecipientsStats)
  {
    objc_msgSend(v5, "setPersonCCRecipientsStats:");
    v4 = v5;
  }
  if (self->_domainFromSenderStats)
  {
    objc_msgSend(v5, "setDomainFromSenderStats:");
    v4 = v5;
  }
  if (self->_conversationStats)
  {
    objc_msgSend(v5, "setConversationStats:");
    v4 = v5;
  }
  if (self->_listIdStats)
  {
    objc_msgSend(v5, "setListIdStats:");
    v4 = v5;
  }
  if (self->_attachmentsStats)
  {
    objc_msgSend(v5, "setAttachmentsStats:");
    v4 = v5;
  }
  if (self->_subjectCountStatsStats)
  {
    objc_msgSend(v5, "setSubjectCountStatsStats:");
    v4 = v5;
  }
  if (self->_standardMailRulesStats)
  {
    objc_msgSend(v5, "setStandardMailRulesStats:");
    v4 = v5;
  }
  if (self->_mailboxStats)
  {
    objc_msgSend(v5, "setMailboxStats:");
    v4 = v5;
  }
  if (self->_mailboxTypeStats)
  {
    objc_msgSend(v5, "setMailboxTypeStats:");
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
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SGMIMetricsSubmodelStats copyWithZone:](self->_personFromSenderStats, "copyWithZone:", a3);
  v7 = (void *)v5[9];
  v5[9] = v6;

  v8 = -[SGMIMetricsSubmodelStats copyWithZone:](self->_personFromSenderInDyadicConversationStats, "copyWithZone:", a3);
  v9 = (void *)v5[8];
  v5[8] = v8;

  v10 = -[SGMIMetricsSubmodelStats copyWithZone:](self->_subjectContentStats, "copyWithZone:", a3);
  v11 = (void *)v5[12];
  v5[12] = v10;

  v12 = -[SGMIMetricsSubmodelStats copyWithZone:](self->_personToRecipientsStats, "copyWithZone:", a3);
  v13 = (void *)v5[10];
  v5[10] = v12;

  v14 = -[SGMIMetricsSubmodelStats copyWithZone:](self->_personCCRecipientsStats, "copyWithZone:", a3);
  v15 = (void *)v5[7];
  v5[7] = v14;

  v16 = -[SGMIMetricsSubmodelStats copyWithZone:](self->_domainFromSenderStats, "copyWithZone:", a3);
  v17 = (void *)v5[3];
  v5[3] = v16;

  v18 = -[SGMIMetricsSubmodelStats copyWithZone:](self->_conversationStats, "copyWithZone:", a3);
  v19 = (void *)v5[2];
  v5[2] = v18;

  v20 = -[SGMIMetricsSubmodelStats copyWithZone:](self->_listIdStats, "copyWithZone:", a3);
  v21 = (void *)v5[4];
  v5[4] = v20;

  v22 = -[SGMIMetricsSubmodelStats copyWithZone:](self->_attachmentsStats, "copyWithZone:", a3);
  v23 = (void *)v5[1];
  v5[1] = v22;

  v24 = -[SGMIMetricsSubmodelStats copyWithZone:](self->_subjectCountStatsStats, "copyWithZone:", a3);
  v25 = (void *)v5[13];
  v5[13] = v24;

  v26 = -[SGMIMetricsSubmodelStats copyWithZone:](self->_standardMailRulesStats, "copyWithZone:", a3);
  v27 = (void *)v5[11];
  v5[11] = v26;

  v28 = -[SGMIMetricsSubmodelStats copyWithZone:](self->_mailboxStats, "copyWithZone:", a3);
  v29 = (void *)v5[5];
  v5[5] = v28;

  v30 = -[SGMIMetricsSubmodelStats copyWithZone:](self->_mailboxTypeStats, "copyWithZone:", a3);
  v31 = (void *)v5[6];
  v5[6] = v30;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SGMIMetricsSubmodelStats *personFromSenderStats;
  SGMIMetricsSubmodelStats *personFromSenderInDyadicConversationStats;
  SGMIMetricsSubmodelStats *subjectContentStats;
  SGMIMetricsSubmodelStats *personToRecipientsStats;
  SGMIMetricsSubmodelStats *personCCRecipientsStats;
  SGMIMetricsSubmodelStats *domainFromSenderStats;
  SGMIMetricsSubmodelStats *conversationStats;
  SGMIMetricsSubmodelStats *listIdStats;
  SGMIMetricsSubmodelStats *attachmentsStats;
  SGMIMetricsSubmodelStats *subjectCountStatsStats;
  SGMIMetricsSubmodelStats *standardMailRulesStats;
  SGMIMetricsSubmodelStats *mailboxStats;
  SGMIMetricsSubmodelStats *mailboxTypeStats;
  char v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  personFromSenderStats = self->_personFromSenderStats;
  if ((unint64_t)personFromSenderStats | v4[9])
  {
    if (!-[SGMIMetricsSubmodelStats isEqual:](personFromSenderStats, "isEqual:"))
      goto LABEL_28;
  }
  personFromSenderInDyadicConversationStats = self->_personFromSenderInDyadicConversationStats;
  if ((unint64_t)personFromSenderInDyadicConversationStats | v4[8]
    && !-[SGMIMetricsSubmodelStats isEqual:](personFromSenderInDyadicConversationStats, "isEqual:"))
  {
    goto LABEL_28;
  }
  subjectContentStats = self->_subjectContentStats;
  if ((unint64_t)subjectContentStats | v4[12]
    && !-[SGMIMetricsSubmodelStats isEqual:](subjectContentStats, "isEqual:"))
  {
    goto LABEL_28;
  }
  personToRecipientsStats = self->_personToRecipientsStats;
  if ((unint64_t)personToRecipientsStats | v4[10]
    && !-[SGMIMetricsSubmodelStats isEqual:](personToRecipientsStats, "isEqual:"))
  {
    goto LABEL_28;
  }
  personCCRecipientsStats = self->_personCCRecipientsStats;
  if ((unint64_t)personCCRecipientsStats | v4[7]
    && !-[SGMIMetricsSubmodelStats isEqual:](personCCRecipientsStats, "isEqual:"))
  {
    goto LABEL_28;
  }
  if (((domainFromSenderStats = self->_domainFromSenderStats, !((unint64_t)domainFromSenderStats | v4[3]))
     || -[SGMIMetricsSubmodelStats isEqual:](domainFromSenderStats, "isEqual:"))
    && ((conversationStats = self->_conversationStats, !((unint64_t)conversationStats | v4[2]))
     || -[SGMIMetricsSubmodelStats isEqual:](conversationStats, "isEqual:"))
    && ((listIdStats = self->_listIdStats, !((unint64_t)listIdStats | v4[4]))
     || -[SGMIMetricsSubmodelStats isEqual:](listIdStats, "isEqual:"))
    && ((attachmentsStats = self->_attachmentsStats, !((unint64_t)attachmentsStats | v4[1]))
     || -[SGMIMetricsSubmodelStats isEqual:](attachmentsStats, "isEqual:"))
    && ((subjectCountStatsStats = self->_subjectCountStatsStats, !((unint64_t)subjectCountStatsStats | v4[13]))
     || -[SGMIMetricsSubmodelStats isEqual:](subjectCountStatsStats, "isEqual:"))
    && ((standardMailRulesStats = self->_standardMailRulesStats, !((unint64_t)standardMailRulesStats | v4[11]))
     || -[SGMIMetricsSubmodelStats isEqual:](standardMailRulesStats, "isEqual:"))
    && ((mailboxStats = self->_mailboxStats, !((unint64_t)mailboxStats | v4[5]))
     || -[SGMIMetricsSubmodelStats isEqual:](mailboxStats, "isEqual:")))
  {
    mailboxTypeStats = self->_mailboxTypeStats;
    if ((unint64_t)mailboxTypeStats | v4[6])
      v18 = -[SGMIMetricsSubmodelStats isEqual:](mailboxTypeStats, "isEqual:");
    else
      v18 = 1;
  }
  else
  {
LABEL_28:
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v3 = -[SGMIMetricsSubmodelStats hash](self->_personFromSenderStats, "hash");
  v4 = -[SGMIMetricsSubmodelStats hash](self->_personFromSenderInDyadicConversationStats, "hash") ^ v3;
  v5 = -[SGMIMetricsSubmodelStats hash](self->_subjectContentStats, "hash");
  v6 = v4 ^ v5 ^ -[SGMIMetricsSubmodelStats hash](self->_personToRecipientsStats, "hash");
  v7 = -[SGMIMetricsSubmodelStats hash](self->_personCCRecipientsStats, "hash");
  v8 = v7 ^ -[SGMIMetricsSubmodelStats hash](self->_domainFromSenderStats, "hash");
  v9 = v6 ^ v8 ^ -[SGMIMetricsSubmodelStats hash](self->_conversationStats, "hash");
  v10 = -[SGMIMetricsSubmodelStats hash](self->_listIdStats, "hash");
  v11 = v10 ^ -[SGMIMetricsSubmodelStats hash](self->_attachmentsStats, "hash");
  v12 = v11 ^ -[SGMIMetricsSubmodelStats hash](self->_subjectCountStatsStats, "hash");
  v13 = v9 ^ v12 ^ -[SGMIMetricsSubmodelStats hash](self->_standardMailRulesStats, "hash");
  v14 = -[SGMIMetricsSubmodelStats hash](self->_mailboxStats, "hash");
  return v13 ^ v14 ^ -[SGMIMetricsSubmodelStats hash](self->_mailboxTypeStats, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SGMIMetricsSubmodelStats *personFromSenderStats;
  uint64_t v6;
  SGMIMetricsSubmodelStats *personFromSenderInDyadicConversationStats;
  uint64_t v8;
  SGMIMetricsSubmodelStats *subjectContentStats;
  uint64_t v10;
  SGMIMetricsSubmodelStats *personToRecipientsStats;
  uint64_t v12;
  SGMIMetricsSubmodelStats *personCCRecipientsStats;
  uint64_t v14;
  SGMIMetricsSubmodelStats *domainFromSenderStats;
  uint64_t v16;
  SGMIMetricsSubmodelStats *conversationStats;
  uint64_t v18;
  SGMIMetricsSubmodelStats *listIdStats;
  uint64_t v20;
  SGMIMetricsSubmodelStats *attachmentsStats;
  uint64_t v22;
  SGMIMetricsSubmodelStats *subjectCountStatsStats;
  uint64_t v24;
  SGMIMetricsSubmodelStats *standardMailRulesStats;
  uint64_t v26;
  SGMIMetricsSubmodelStats *mailboxStats;
  uint64_t v28;
  SGMIMetricsSubmodelStats *mailboxTypeStats;
  uint64_t v30;
  _QWORD *v31;

  v4 = a3;
  personFromSenderStats = self->_personFromSenderStats;
  v31 = v4;
  v6 = v4[9];
  if (personFromSenderStats)
  {
    if (v6)
      -[SGMIMetricsSubmodelStats mergeFrom:](personFromSenderStats, "mergeFrom:");
  }
  else if (v6)
  {
    -[SGMIMetricsSubmodelsStats setPersonFromSenderStats:](self, "setPersonFromSenderStats:");
  }
  personFromSenderInDyadicConversationStats = self->_personFromSenderInDyadicConversationStats;
  v8 = v31[8];
  if (personFromSenderInDyadicConversationStats)
  {
    if (v8)
      -[SGMIMetricsSubmodelStats mergeFrom:](personFromSenderInDyadicConversationStats, "mergeFrom:");
  }
  else if (v8)
  {
    -[SGMIMetricsSubmodelsStats setPersonFromSenderInDyadicConversationStats:](self, "setPersonFromSenderInDyadicConversationStats:");
  }
  subjectContentStats = self->_subjectContentStats;
  v10 = v31[12];
  if (subjectContentStats)
  {
    if (v10)
      -[SGMIMetricsSubmodelStats mergeFrom:](subjectContentStats, "mergeFrom:");
  }
  else if (v10)
  {
    -[SGMIMetricsSubmodelsStats setSubjectContentStats:](self, "setSubjectContentStats:");
  }
  personToRecipientsStats = self->_personToRecipientsStats;
  v12 = v31[10];
  if (personToRecipientsStats)
  {
    if (v12)
      -[SGMIMetricsSubmodelStats mergeFrom:](personToRecipientsStats, "mergeFrom:");
  }
  else if (v12)
  {
    -[SGMIMetricsSubmodelsStats setPersonToRecipientsStats:](self, "setPersonToRecipientsStats:");
  }
  personCCRecipientsStats = self->_personCCRecipientsStats;
  v14 = v31[7];
  if (personCCRecipientsStats)
  {
    if (v14)
      -[SGMIMetricsSubmodelStats mergeFrom:](personCCRecipientsStats, "mergeFrom:");
  }
  else if (v14)
  {
    -[SGMIMetricsSubmodelsStats setPersonCCRecipientsStats:](self, "setPersonCCRecipientsStats:");
  }
  domainFromSenderStats = self->_domainFromSenderStats;
  v16 = v31[3];
  if (domainFromSenderStats)
  {
    if (v16)
      -[SGMIMetricsSubmodelStats mergeFrom:](domainFromSenderStats, "mergeFrom:");
  }
  else if (v16)
  {
    -[SGMIMetricsSubmodelsStats setDomainFromSenderStats:](self, "setDomainFromSenderStats:");
  }
  conversationStats = self->_conversationStats;
  v18 = v31[2];
  if (conversationStats)
  {
    if (v18)
      -[SGMIMetricsSubmodelStats mergeFrom:](conversationStats, "mergeFrom:");
  }
  else if (v18)
  {
    -[SGMIMetricsSubmodelsStats setConversationStats:](self, "setConversationStats:");
  }
  listIdStats = self->_listIdStats;
  v20 = v31[4];
  if (listIdStats)
  {
    if (v20)
      -[SGMIMetricsSubmodelStats mergeFrom:](listIdStats, "mergeFrom:");
  }
  else if (v20)
  {
    -[SGMIMetricsSubmodelsStats setListIdStats:](self, "setListIdStats:");
  }
  attachmentsStats = self->_attachmentsStats;
  v22 = v31[1];
  if (attachmentsStats)
  {
    if (v22)
      -[SGMIMetricsSubmodelStats mergeFrom:](attachmentsStats, "mergeFrom:");
  }
  else if (v22)
  {
    -[SGMIMetricsSubmodelsStats setAttachmentsStats:](self, "setAttachmentsStats:");
  }
  subjectCountStatsStats = self->_subjectCountStatsStats;
  v24 = v31[13];
  if (subjectCountStatsStats)
  {
    if (v24)
      -[SGMIMetricsSubmodelStats mergeFrom:](subjectCountStatsStats, "mergeFrom:");
  }
  else if (v24)
  {
    -[SGMIMetricsSubmodelsStats setSubjectCountStatsStats:](self, "setSubjectCountStatsStats:");
  }
  standardMailRulesStats = self->_standardMailRulesStats;
  v26 = v31[11];
  if (standardMailRulesStats)
  {
    if (v26)
      -[SGMIMetricsSubmodelStats mergeFrom:](standardMailRulesStats, "mergeFrom:");
  }
  else if (v26)
  {
    -[SGMIMetricsSubmodelsStats setStandardMailRulesStats:](self, "setStandardMailRulesStats:");
  }
  mailboxStats = self->_mailboxStats;
  v28 = v31[5];
  if (mailboxStats)
  {
    if (v28)
      -[SGMIMetricsSubmodelStats mergeFrom:](mailboxStats, "mergeFrom:");
  }
  else if (v28)
  {
    -[SGMIMetricsSubmodelsStats setMailboxStats:](self, "setMailboxStats:");
  }
  mailboxTypeStats = self->_mailboxTypeStats;
  v30 = v31[6];
  if (mailboxTypeStats)
  {
    if (v30)
      -[SGMIMetricsSubmodelStats mergeFrom:](mailboxTypeStats, "mergeFrom:");
  }
  else if (v30)
  {
    -[SGMIMetricsSubmodelsStats setMailboxTypeStats:](self, "setMailboxTypeStats:");
  }

}

- (SGMIMetricsSubmodelStats)personFromSenderStats
{
  return self->_personFromSenderStats;
}

- (void)setPersonFromSenderStats:(id)a3
{
  objc_storeStrong((id *)&self->_personFromSenderStats, a3);
}

- (SGMIMetricsSubmodelStats)personFromSenderInDyadicConversationStats
{
  return self->_personFromSenderInDyadicConversationStats;
}

- (void)setPersonFromSenderInDyadicConversationStats:(id)a3
{
  objc_storeStrong((id *)&self->_personFromSenderInDyadicConversationStats, a3);
}

- (SGMIMetricsSubmodelStats)subjectContentStats
{
  return self->_subjectContentStats;
}

- (void)setSubjectContentStats:(id)a3
{
  objc_storeStrong((id *)&self->_subjectContentStats, a3);
}

- (SGMIMetricsSubmodelStats)personToRecipientsStats
{
  return self->_personToRecipientsStats;
}

- (void)setPersonToRecipientsStats:(id)a3
{
  objc_storeStrong((id *)&self->_personToRecipientsStats, a3);
}

- (SGMIMetricsSubmodelStats)personCCRecipientsStats
{
  return self->_personCCRecipientsStats;
}

- (void)setPersonCCRecipientsStats:(id)a3
{
  objc_storeStrong((id *)&self->_personCCRecipientsStats, a3);
}

- (SGMIMetricsSubmodelStats)domainFromSenderStats
{
  return self->_domainFromSenderStats;
}

- (void)setDomainFromSenderStats:(id)a3
{
  objc_storeStrong((id *)&self->_domainFromSenderStats, a3);
}

- (SGMIMetricsSubmodelStats)conversationStats
{
  return self->_conversationStats;
}

- (void)setConversationStats:(id)a3
{
  objc_storeStrong((id *)&self->_conversationStats, a3);
}

- (SGMIMetricsSubmodelStats)listIdStats
{
  return self->_listIdStats;
}

- (void)setListIdStats:(id)a3
{
  objc_storeStrong((id *)&self->_listIdStats, a3);
}

- (SGMIMetricsSubmodelStats)attachmentsStats
{
  return self->_attachmentsStats;
}

- (void)setAttachmentsStats:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentsStats, a3);
}

- (SGMIMetricsSubmodelStats)subjectCountStatsStats
{
  return self->_subjectCountStatsStats;
}

- (void)setSubjectCountStatsStats:(id)a3
{
  objc_storeStrong((id *)&self->_subjectCountStatsStats, a3);
}

- (SGMIMetricsSubmodelStats)standardMailRulesStats
{
  return self->_standardMailRulesStats;
}

- (void)setStandardMailRulesStats:(id)a3
{
  objc_storeStrong((id *)&self->_standardMailRulesStats, a3);
}

- (SGMIMetricsSubmodelStats)mailboxStats
{
  return self->_mailboxStats;
}

- (void)setMailboxStats:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxStats, a3);
}

- (SGMIMetricsSubmodelStats)mailboxTypeStats
{
  return self->_mailboxTypeStats;
}

- (void)setMailboxTypeStats:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxTypeStats, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectCountStatsStats, 0);
  objc_storeStrong((id *)&self->_subjectContentStats, 0);
  objc_storeStrong((id *)&self->_standardMailRulesStats, 0);
  objc_storeStrong((id *)&self->_personToRecipientsStats, 0);
  objc_storeStrong((id *)&self->_personFromSenderStats, 0);
  objc_storeStrong((id *)&self->_personFromSenderInDyadicConversationStats, 0);
  objc_storeStrong((id *)&self->_personCCRecipientsStats, 0);
  objc_storeStrong((id *)&self->_mailboxTypeStats, 0);
  objc_storeStrong((id *)&self->_mailboxStats, 0);
  objc_storeStrong((id *)&self->_listIdStats, 0);
  objc_storeStrong((id *)&self->_domainFromSenderStats, 0);
  objc_storeStrong((id *)&self->_conversationStats, 0);
  objc_storeStrong((id *)&self->_attachmentsStats, 0);
}

@end
