@implementation MSPRegionBookmark

- (BOOL)hasRegion
{
  return self->_region != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
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
  v8.super_class = (Class)MSPRegionBookmark;
  -[MSPRegionBookmark description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPRegionBookmark dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  GEOMapRegion *region;
  void *v5;
  NSString *title;
  PBUnknownFields *unknownFields;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  region = self->_region;
  if (region)
  {
    -[GEOMapRegion dictionaryRepresentation](region, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("region"));

  }
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPRegionBookmarkReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_region)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_region)
  {
    objc_msgSend(v4, "setRegion:");
    v4 = v5;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOMapRegion copyWithZone:](self->_region, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOMapRegion *region;
  NSString *title;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((region = self->_region, !((unint64_t)region | v4[2]))
     || -[GEOMapRegion isEqual:](region, "isEqual:")))
  {
    title = self->_title;
    if ((unint64_t)title | v4[3])
      v7 = -[NSString isEqual:](title, "isEqual:");
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
  uint64_t v3;

  v3 = -[GEOMapRegion hash](self->_region, "hash");
  return -[NSString hash](self->_title, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOMapRegion *region;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  region = self->_region;
  v6 = v4[2];
  v7 = v4;
  if (region)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOMapRegion mergeFrom:](region, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[MSPRegionBookmark setRegion:](self, "setRegion:");
  }
  v4 = v7;
LABEL_7:
  if (v4[3])
  {
    -[MSPRegionBookmark setTitle:](self, "setTitle:");
    v4 = v7;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (GEOMapRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
