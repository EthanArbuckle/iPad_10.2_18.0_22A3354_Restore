@implementation CLPLOGENTRYVISIONLSLHeadingSupplInfo

- (BOOL)hasRoadSegment
{
  return self->_roadSegment != 0;
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
  v8.super_class = (Class)CLPLOGENTRYVISIONLSLHeadingSupplInfo;
  -[CLPLOGENTRYVISIONLSLHeadingSupplInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPLOGENTRYVISIONLSLHeadingSupplInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  CLPLOGENTRYVISIONLSLMapRoadSegment *roadSegment;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  roadSegment = self->_roadSegment;
  if (roadSegment)
  {
    -[CLPLOGENTRYVISIONLSLMapRoadSegment dictionaryRepresentation](roadSegment, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("road_segment"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONLSLHeadingSupplInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_roadSegment)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  CLPLOGENTRYVISIONLSLMapRoadSegment *roadSegment;

  roadSegment = self->_roadSegment;
  if (roadSegment)
    objc_msgSend(a3, "setRoadSegment:", roadSegment);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CLPLOGENTRYVISIONLSLMapRoadSegment copyWithZone:](self->_roadSegment, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  CLPLOGENTRYVISIONLSLMapRoadSegment *roadSegment;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    roadSegment = self->_roadSegment;
    if ((unint64_t)roadSegment | v4[1])
      v6 = -[CLPLOGENTRYVISIONLSLMapRoadSegment isEqual:](roadSegment, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[CLPLOGENTRYVISIONLSLMapRoadSegment hash](self->_roadSegment, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CLPLOGENTRYVISIONLSLMapRoadSegment *roadSegment;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  roadSegment = self->_roadSegment;
  v6 = v4[1];
  if (roadSegment)
  {
    if (v6)
    {
      v7 = v4;
      -[CLPLOGENTRYVISIONLSLMapRoadSegment mergeFrom:](roadSegment, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[CLPLOGENTRYVISIONLSLHeadingSupplInfo setRoadSegment:](self, "setRoadSegment:");
    goto LABEL_6;
  }

}

- (CLPLOGENTRYVISIONLSLMapRoadSegment)roadSegment
{
  return self->_roadSegment;
}

- (void)setRoadSegment:(id)a3
{
  objc_storeStrong((id *)&self->_roadSegment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roadSegment, 0);
}

@end
