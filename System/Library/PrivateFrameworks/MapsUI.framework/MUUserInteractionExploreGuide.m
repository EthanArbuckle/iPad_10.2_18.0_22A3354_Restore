@implementation MUUserInteractionExploreGuide

- (BOOL)hasGuidesLocationEntry
{
  return self->_guidesLocationEntry != 0;
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
  v8.super_class = (Class)MUUserInteractionExploreGuide;
  -[MUUserInteractionExploreGuide description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUUserInteractionExploreGuide dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *guidesLocationEntry;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  guidesLocationEntry = self->_guidesLocationEntry;
  if (guidesLocationEntry)
    objc_msgSend(v3, "setObject:forKey:", guidesLocationEntry, CFSTR("guidesLocationEntry"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MUUserInteractionExploreGuideReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_guidesLocationEntry)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  NSString *guidesLocationEntry;

  guidesLocationEntry = self->_guidesLocationEntry;
  if (guidesLocationEntry)
    objc_msgSend(a3, "setGuidesLocationEntry:", guidesLocationEntry);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_guidesLocationEntry, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *guidesLocationEntry;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    guidesLocationEntry = self->_guidesLocationEntry;
    if ((unint64_t)guidesLocationEntry | v4[1])
      v6 = -[NSString isEqual:](guidesLocationEntry, "isEqual:");
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
  return -[NSString hash](self->_guidesLocationEntry, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[MUUserInteractionExploreGuide setGuidesLocationEntry:](self, "setGuidesLocationEntry:");
}

- (NSString)guidesLocationEntry
{
  return self->_guidesLocationEntry;
}

- (void)setGuidesLocationEntry:(id)a3
{
  objc_storeStrong((id *)&self->_guidesLocationEntry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidesLocationEntry, 0);
}

@end
