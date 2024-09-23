@implementation CLPLOGENTRYVISIONVLLocalizationDebugInfo

- (BOOL)hasMaps488Details
{
  return self->_maps488Details != 0;
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
  v8.super_class = (Class)CLPLOGENTRYVISIONVLLocalizationDebugInfo;
  -[CLPLOGENTRYVISIONVLLocalizationDebugInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPLOGENTRYVISIONVLLocalizationDebugInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  CLPLOGENTRYVISIONVLLocalizationMaps488Details *maps488Details;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  maps488Details = self->_maps488Details;
  if (maps488Details)
  {
    -[CLPLOGENTRYVISIONVLLocalizationMaps488Details dictionaryRepresentation](maps488Details, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("maps488_details"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONVLLocalizationDebugInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_maps488Details)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  CLPLOGENTRYVISIONVLLocalizationMaps488Details *maps488Details;

  maps488Details = self->_maps488Details;
  if (maps488Details)
    objc_msgSend(a3, "setMaps488Details:", maps488Details);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details copyWithZone:](self->_maps488Details, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  CLPLOGENTRYVISIONVLLocalizationMaps488Details *maps488Details;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    maps488Details = self->_maps488Details;
    if ((unint64_t)maps488Details | v4[1])
      v6 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details isEqual:](maps488Details, "isEqual:");
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
  return -[CLPLOGENTRYVISIONVLLocalizationMaps488Details hash](self->_maps488Details, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CLPLOGENTRYVISIONVLLocalizationMaps488Details *maps488Details;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  maps488Details = self->_maps488Details;
  v6 = v4[1];
  if (maps488Details)
  {
    if (v6)
    {
      v7 = v4;
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details mergeFrom:](maps488Details, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[CLPLOGENTRYVISIONVLLocalizationDebugInfo setMaps488Details:](self, "setMaps488Details:");
    goto LABEL_6;
  }

}

- (CLPLOGENTRYVISIONVLLocalizationMaps488Details)maps488Details
{
  return self->_maps488Details;
}

- (void)setMaps488Details:(id)a3
{
  objc_storeStrong((id *)&self->_maps488Details, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maps488Details, 0);
}

@end
