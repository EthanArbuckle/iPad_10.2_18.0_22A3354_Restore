@implementation HKCodableSummaryTrendLineViewModel

- (BOOL)hasDateInterval
{
  return self->_dateInterval != 0;
}

- (void)setAverage:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_average = a3;
}

- (void)setHasAverage:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAverage
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasXAxisLabel
{
  return self->_xAxisLabel != 0;
}

- (BOOL)hasLineLabel
{
  return self->_lineLabel != 0;
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
  v8.super_class = (Class)HKCodableSummaryTrendLineViewModel;
  -[HKCodableSummaryTrendLineViewModel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryTrendLineViewModel dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableDateInterval *dateInterval;
  void *v5;
  void *v6;
  NSString *xAxisLabel;
  NSString *lineLabel;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dateInterval = self->_dateInterval;
  if (dateInterval)
  {
    -[HKCodableDateInterval dictionaryRepresentation](dateInterval, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("dateInterval"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_average);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("average"));

  }
  xAxisLabel = self->_xAxisLabel;
  if (xAxisLabel)
    objc_msgSend(v3, "setObject:forKey:", xAxisLabel, CFSTR("xAxisLabel"));
  lineLabel = self->_lineLabel;
  if (lineLabel)
    objc_msgSend(v3, "setObject:forKey:", lineLabel, CFSTR("lineLabel"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryTrendLineViewModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_dateInterval)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_xAxisLabel)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_lineLabel)
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
  if (self->_dateInterval)
  {
    objc_msgSend(v4, "setDateInterval:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_average;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_xAxisLabel)
  {
    objc_msgSend(v5, "setXAxisLabel:");
    v4 = v5;
  }
  if (self->_lineLabel)
  {
    objc_msgSend(v5, "setLineLabel:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableDateInterval copyWithZone:](self->_dateInterval, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_average;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_xAxisLabel, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_lineLabel, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableDateInterval *dateInterval;
  NSString *xAxisLabel;
  NSString *lineLabel;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  dateInterval = self->_dateInterval;
  if ((unint64_t)dateInterval | *((_QWORD *)v4 + 2))
  {
    if (!-[HKCodableDateInterval isEqual:](dateInterval, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_average != *((double *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  xAxisLabel = self->_xAxisLabel;
  if ((unint64_t)xAxisLabel | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](xAxisLabel, "isEqual:"))
    goto LABEL_13;
  lineLabel = self->_lineLabel;
  if ((unint64_t)lineLabel | *((_QWORD *)v4 + 3))
    v8 = -[NSString isEqual:](lineLabel, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  double average;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  NSUInteger v10;

  v3 = -[HKCodableDateInterval hash](self->_dateInterval, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    average = self->_average;
    v6 = -average;
    if (average >= 0.0)
      v6 = self->_average;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  v9 = v4 ^ v3;
  v10 = -[NSString hash](self->_xAxisLabel, "hash");
  return v9 ^ v10 ^ -[NSString hash](self->_lineLabel, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HKCodableDateInterval *dateInterval;
  uint64_t v6;
  id v7;

  v4 = a3;
  dateInterval = self->_dateInterval;
  v6 = *((_QWORD *)v4 + 2);
  v7 = v4;
  if (dateInterval)
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableDateInterval mergeFrom:](dateInterval, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableSummaryTrendLineViewModel setDateInterval:](self, "setDateInterval:");
  }
  v4 = v7;
LABEL_7:
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_average = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[HKCodableSummaryTrendLineViewModel setXAxisLabel:](self, "setXAxisLabel:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HKCodableSummaryTrendLineViewModel setLineLabel:](self, "setLineLabel:");
    v4 = v7;
  }

}

- (HKCodableDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_dateInterval, a3);
}

- (double)average
{
  return self->_average;
}

- (NSString)xAxisLabel
{
  return self->_xAxisLabel;
}

- (void)setXAxisLabel:(id)a3
{
  objc_storeStrong((id *)&self->_xAxisLabel, a3);
}

- (NSString)lineLabel
{
  return self->_lineLabel;
}

- (void)setLineLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lineLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xAxisLabel, 0);
  objc_storeStrong((id *)&self->_lineLabel, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
