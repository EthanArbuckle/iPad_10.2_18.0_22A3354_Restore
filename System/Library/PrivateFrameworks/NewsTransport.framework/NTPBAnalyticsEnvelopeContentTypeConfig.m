@implementation NTPBAnalyticsEnvelopeContentTypeConfig

- (void)dealloc
{
  objc_super v3;

  -[NTPBAnalyticsEnvelopeContentTypeConfig setEndpointURLString:](self, "setEndpointURLString:", 0);
  -[NTPBAnalyticsEnvelopeContentTypeConfig setContentHeaderName:](self, "setContentHeaderName:", 0);
  -[NTPBAnalyticsEnvelopeContentTypeConfig setContentHeaderValue:](self, "setContentHeaderValue:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBAnalyticsEnvelopeContentTypeConfig;
  -[NTPBAnalyticsEnvelopeContentTypeConfig dealloc](&v3, sel_dealloc);
}

- (void)setContentHeaderValue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setContentHeaderName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setEndpointURLString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setSamplingFloor:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_samplingFloor = a3;
}

- (void)setSamplingCeiling:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_samplingCeiling = a3;
}

- (void)setSeedTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_seedTime = a3;
}

- (void)setGroupingTag:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_groupingTag = a3;
}

- (BOOL)hasEndpointURLString
{
  return self->_endpointURLString != 0;
}

- (void)setHasSeedTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSeedTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasContentHeaderName
{
  return self->_contentHeaderName != 0;
}

- (BOOL)hasContentHeaderValue
{
  return self->_contentHeaderValue != 0;
}

- (void)setHasSamplingFloor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSamplingFloor
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasSamplingCeiling:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSamplingCeiling
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasGroupingTag:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGroupingTag
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBAnalyticsEnvelopeContentTypeConfig;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBAnalyticsEnvelopeContentTypeConfig description](&v3, sel_description), -[NTPBAnalyticsEnvelopeContentTypeConfig dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *endpointURLString;
  NSString *contentHeaderName;
  NSString *contentHeaderValue;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  endpointURLString = self->_endpointURLString;
  if (endpointURLString)
    objc_msgSend(v3, "setObject:forKey:", endpointURLString, CFSTR("endpoint_URL_string"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_seedTime), CFSTR("seed_time"));
  contentHeaderName = self->_contentHeaderName;
  if (contentHeaderName)
    objc_msgSend(v4, "setObject:forKey:", contentHeaderName, CFSTR("content_header_name"));
  contentHeaderValue = self->_contentHeaderValue;
  if (contentHeaderValue)
    objc_msgSend(v4, "setObject:forKey:", contentHeaderValue, CFSTR("content_header_value"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_11;
LABEL_15:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_samplingCeiling), CFSTR("sampling_ceiling"));
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v4;
    goto LABEL_12;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_samplingFloor), CFSTR("sampling_floor"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_15;
LABEL_11:
  if ((has & 1) != 0)
LABEL_12:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_groupingTag), CFSTR("grouping_tag"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAnalyticsEnvelopeContentTypeConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if (self->_endpointURLString)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_contentHeaderName)
    PBDataWriterWriteStringField();
  if (self->_contentHeaderValue)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_11:
      if ((has & 1) == 0)
        return;
LABEL_15:
      PBDataWriterWriteUint64Field();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 40) = -[NSString copyWithZone:](self->_endpointURLString, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_seedTime;
    *(_BYTE *)(v5 + 56) |= 2u;
  }

  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_contentHeaderName, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 32) = -[NSString copyWithZone:](self->_contentHeaderValue, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    *(_DWORD *)(v5 + 48) = self->_samplingCeiling;
    *(_BYTE *)(v5 + 56) |= 4u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return (id)v5;
    goto LABEL_6;
  }
  *(_DWORD *)(v5 + 52) = self->_samplingFloor;
  *(_BYTE *)(v5 + 56) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    *(_QWORD *)(v5 + 8) = self->_groupingTag;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *endpointURLString;
  NSString *contentHeaderName;
  NSString *contentHeaderValue;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    endpointURLString = self->_endpointURLString;
    if (!((unint64_t)endpointURLString | *((_QWORD *)a3 + 5))
      || (v5 = -[NSString isEqual:](endpointURLString, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 56) & 2) == 0 || self->_seedTime != *((_QWORD *)a3 + 2))
          goto LABEL_27;
      }
      else if ((*((_BYTE *)a3 + 56) & 2) != 0)
      {
LABEL_27:
        LOBYTE(v5) = 0;
        return v5;
      }
      contentHeaderName = self->_contentHeaderName;
      if (!((unint64_t)contentHeaderName | *((_QWORD *)a3 + 3))
        || (v5 = -[NSString isEqual:](contentHeaderName, "isEqual:")) != 0)
      {
        contentHeaderValue = self->_contentHeaderValue;
        if (!((unint64_t)contentHeaderValue | *((_QWORD *)a3 + 4))
          || (v5 = -[NSString isEqual:](contentHeaderValue, "isEqual:")) != 0)
        {
          if ((*(_BYTE *)&self->_has & 8) != 0)
          {
            if ((*((_BYTE *)a3 + 56) & 8) == 0 || self->_samplingFloor != *((_DWORD *)a3 + 13))
              goto LABEL_27;
          }
          else if ((*((_BYTE *)a3 + 56) & 8) != 0)
          {
            goto LABEL_27;
          }
          if ((*(_BYTE *)&self->_has & 4) != 0)
          {
            if ((*((_BYTE *)a3 + 56) & 4) == 0 || self->_samplingCeiling != *((_DWORD *)a3 + 12))
              goto LABEL_27;
          }
          else if ((*((_BYTE *)a3 + 56) & 4) != 0)
          {
            goto LABEL_27;
          }
          LOBYTE(v5) = (*((_BYTE *)a3 + 56) & 1) == 0;
          if ((*(_BYTE *)&self->_has & 1) != 0)
          {
            if ((*((_BYTE *)a3 + 56) & 1) == 0 || self->_groupingTag != *((_QWORD *)a3 + 1))
              goto LABEL_27;
            LOBYTE(v5) = 1;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v3 = -[NSString hash](self->_endpointURLString, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761u * self->_seedTime;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_contentHeaderName, "hash");
  v6 = -[NSString hash](self->_contentHeaderValue, "hash");
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_7;
LABEL_10:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  v7 = 2654435761 * self->_samplingFloor;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v8 = 2654435761 * self->_samplingCeiling;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_7:
  v9 = 2654435761u * self->_groupingTag;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 5))
    -[NTPBAnalyticsEnvelopeContentTypeConfig setEndpointURLString:](self, "setEndpointURLString:");
  if ((*((_BYTE *)a3 + 56) & 2) != 0)
  {
    self->_seedTime = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)a3 + 3))
    -[NTPBAnalyticsEnvelopeContentTypeConfig setContentHeaderName:](self, "setContentHeaderName:");
  if (*((_QWORD *)a3 + 4))
    -[NTPBAnalyticsEnvelopeContentTypeConfig setContentHeaderValue:](self, "setContentHeaderValue:");
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 8) != 0)
  {
    self->_samplingFloor = *((_DWORD *)a3 + 13);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)a3 + 56);
    if ((v5 & 4) == 0)
    {
LABEL_11:
      if ((v5 & 1) == 0)
        return;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)a3 + 56) & 4) == 0)
  {
    goto LABEL_11;
  }
  self->_samplingCeiling = *((_DWORD *)a3 + 12);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 56) & 1) == 0)
    return;
LABEL_12:
  self->_groupingTag = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
}

- (NSString)endpointURLString
{
  return self->_endpointURLString;
}

- (unint64_t)seedTime
{
  return self->_seedTime;
}

- (NSString)contentHeaderName
{
  return self->_contentHeaderName;
}

- (NSString)contentHeaderValue
{
  return self->_contentHeaderValue;
}

- (unsigned)samplingFloor
{
  return self->_samplingFloor;
}

- (unsigned)samplingCeiling
{
  return self->_samplingCeiling;
}

- (unint64_t)groupingTag
{
  return self->_groupingTag;
}

@end
