@implementation HKCodableSummaryCorrelatedTrendValue

- (BOOL)hasObjectTypeIdentifier
{
  return self->_objectTypeIdentifier != 0;
}

- (BOOL)hasTrendValue
{
  return self->_trendValue != 0;
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
  v8.super_class = (Class)HKCodableSummaryCorrelatedTrendValue;
  -[HKCodableSummaryCorrelatedTrendValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryCorrelatedTrendValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *objectTypeIdentifier;
  HKCodableSummaryTrendValue *trendValue;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  objectTypeIdentifier = self->_objectTypeIdentifier;
  if (objectTypeIdentifier)
    objc_msgSend(v3, "setObject:forKey:", objectTypeIdentifier, CFSTR("objectTypeIdentifier"));
  trendValue = self->_trendValue;
  if (trendValue)
  {
    -[HKCodableSummaryTrendValue dictionaryRepresentation](trendValue, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("trendValue"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryCorrelatedTrendValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_objectTypeIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_trendValue)
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
  if (self->_objectTypeIdentifier)
  {
    objc_msgSend(v4, "setObjectTypeIdentifier:");
    v4 = v5;
  }
  if (self->_trendValue)
  {
    objc_msgSend(v5, "setTrendValue:");
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
  v6 = -[NSString copyWithZone:](self->_objectTypeIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[HKCodableSummaryTrendValue copyWithZone:](self->_trendValue, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *objectTypeIdentifier;
  HKCodableSummaryTrendValue *trendValue;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((objectTypeIdentifier = self->_objectTypeIdentifier, !((unint64_t)objectTypeIdentifier | v4[1]))
     || -[NSString isEqual:](objectTypeIdentifier, "isEqual:")))
  {
    trendValue = self->_trendValue;
    if ((unint64_t)trendValue | v4[2])
      v7 = -[HKCodableSummaryTrendValue isEqual:](trendValue, "isEqual:");
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

  v3 = -[NSString hash](self->_objectTypeIdentifier, "hash");
  return -[HKCodableSummaryTrendValue hash](self->_trendValue, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableSummaryTrendValue *trendValue;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[1])
  {
    -[HKCodableSummaryCorrelatedTrendValue setObjectTypeIdentifier:](self, "setObjectTypeIdentifier:");
    v4 = v7;
  }
  trendValue = self->_trendValue;
  v6 = v4[2];
  if (trendValue)
  {
    if (v6)
    {
      -[HKCodableSummaryTrendValue mergeFrom:](trendValue, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[HKCodableSummaryCorrelatedTrendValue setTrendValue:](self, "setTrendValue:");
    goto LABEL_8;
  }

}

- (NSString)objectTypeIdentifier
{
  return self->_objectTypeIdentifier;
}

- (void)setObjectTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_objectTypeIdentifier, a3);
}

- (HKCodableSummaryTrendValue)trendValue
{
  return self->_trendValue;
}

- (void)setTrendValue:(id)a3
{
  objc_storeStrong((id *)&self->_trendValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendValue, 0);
  objc_storeStrong((id *)&self->_objectTypeIdentifier, 0);
}

@end
