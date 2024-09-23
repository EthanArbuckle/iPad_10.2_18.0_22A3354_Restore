@implementation GEOPDSearchBrandTrigger

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchBrandTrigger;
  -[GEOPDSearchBrandTrigger description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchBrandTrigger dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 16);
    if (v4)
      objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("trigger"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("relevance"));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchBrandTriggerReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_trigger, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(double *)(v5 + 8) = self->_relevance;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *trigger;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((trigger = self->_trigger, !((unint64_t)trigger | *((_QWORD *)v4 + 2)))
     || -[NSString isEqual:](trigger, "isEqual:"))
    && self->_relevance == *((double *)v4 + 1);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  double relevance;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  unint64_t v11;

  v3 = -[NSString hash](self->_trigger, "hash");
  relevance = self->_relevance;
  v5 = -relevance;
  if (relevance >= 0.0)
    v5 = self->_relevance;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  v9 = v8 + (unint64_t)v7;
  v10 = fabs(v7);
  if (v7 <= 0.0)
    v9 = v8;
  v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0)
    v11 = v9;
  return v11 ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
}

@end
