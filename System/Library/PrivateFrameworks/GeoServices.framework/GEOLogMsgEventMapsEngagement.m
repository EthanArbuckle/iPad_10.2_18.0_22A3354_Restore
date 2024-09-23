@implementation GEOLogMsgEventMapsEngagement

- (int)reportingChannel
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_reportingChannel;
  else
    return 0;
}

- (void)setReportingChannel:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_reportingChannel = a3;
}

- (void)setHasReportingChannel:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasReportingChannel
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)reportingChannelAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C225C8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReportingChannel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EngagementReportingChannel_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EngagementReportingChannel_IN_PROCESS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EngagementReportingChannel_GEOANALYTICSD")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasSummaryDate
{
  return self->_summaryDate != 0;
}

- (NSString)summaryDate
{
  return self->_summaryDate;
}

- (void)setSummaryDate:(id)a3
{
  objc_storeStrong((id *)&self->_summaryDate, a3);
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
  v8.super_class = (Class)GEOLogMsgEventMapsEngagement;
  -[GEOLogMsgEventMapsEngagement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventMapsEngagement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventMapsEngagement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      v5 = *(int *)(a1 + 16);
      if (v5 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C225C8[v5];
      }
      if (a2)
        v7 = CFSTR("reportingChannel");
      else
        v7 = CFSTR("reporting_channel");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

    }
    objc_msgSend((id)a1, "summaryDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (a2)
        v9 = CFSTR("summaryDate");
      else
        v9 = CFSTR("summary_date");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventMapsEngagement _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventMapsEngagement)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventMapsEngagement *)-[GEOLogMsgEventMapsEngagement _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v5 = a2;
  if (!a1)
    goto LABEL_24;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_24;
  if (a3)
    v6 = CFSTR("reportingChannel");
  else
    v6 = CFSTR("reporting_channel");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("EngagementReportingChannel_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("EngagementReportingChannel_IN_PROCESS")) & 1) != 0)
    {
      v9 = 1;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("EngagementReportingChannel_GEOANALYTICSD")))
    {
      v9 = 2;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_17:
    objc_msgSend(a1, "setReportingChannel:", v9);
  }

  if (a3)
    v10 = CFSTR("summaryDate");
  else
    v10 = CFSTR("summary_date");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(a1, "setSummaryDate:", v12);

  }
LABEL_24:

  return a1;
}

- (GEOLogMsgEventMapsEngagement)initWithJSON:(id)a3
{
  return (GEOLogMsgEventMapsEngagement *)-[GEOLogMsgEventMapsEngagement _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventMapsEngagementIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventMapsEngagementReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_summaryDate)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GEOLogMsgEventMapsEngagement readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_reportingChannel;
    *((_BYTE *)v5 + 20) |= 1u;
  }
  if (self->_summaryDate)
  {
    objc_msgSend(v5, "setSummaryDate:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_reportingChannel;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_summaryDate, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *summaryDate;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEOLogMsgEventMapsEngagement readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_reportingChannel != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  summaryDate = self->_summaryDate;
  if ((unint64_t)summaryDate | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](summaryDate, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOLogMsgEventMapsEngagement readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_reportingChannel;
  else
    v3 = 0;
  return -[NSString hash](self->_summaryDate, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if ((v5[5] & 1) != 0)
  {
    self->_reportingChannel = v5[4];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v5 + 1))
  {
    -[GEOLogMsgEventMapsEngagement setSummaryDate:](self, "setSummaryDate:");
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryDate, 0);
}

@end
