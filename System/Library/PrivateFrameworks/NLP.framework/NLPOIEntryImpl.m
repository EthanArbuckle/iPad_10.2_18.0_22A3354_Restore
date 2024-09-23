@implementation NLPOIEntryImpl

- (void)dealloc
{
  objc_super v3;

  -[NLPOIEntryImpl setName:](self, "setName:", 0);
  -[NLPOIEntryImpl setDomain:](self, "setDomain:", 0);
  -[NLPOIEntryImpl setCategory:](self, "setCategory:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NLPOIEntryImpl;
  -[NLPOIEntryImpl dealloc](&v3, sel_dealloc);
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (void)setScore:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NLPOIEntryImpl;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[NLPOIEntryImpl description](&v3, sel_description), -[NLPOIEntryImpl dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *name;
  NSString *domain;
  NSString *category;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  domain = self->_domain;
  if (domain)
    objc_msgSend(v5, "setObject:forKey:", domain, CFSTR("domain"));
  category = self->_category;
  if (category)
    objc_msgSend(v5, "setObject:forKey:", category, CFSTR("category"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)&v4 = self->_score;
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4), CFSTR("score"));
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return NLPOIEntryImplReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_domain)
    PBDataWriterWriteStringField();
  if (self->_category)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  if (self->_name)
    objc_msgSend(a3, "setName:");
  if (self->_domain)
    objc_msgSend(a3, "setDomain:");
  if (self->_category)
    objc_msgSend(a3, "setCategory:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 8) = LODWORD(self->_score);
    *((_BYTE *)a3 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 8) = -[NSString copyWithZone:](self->_category, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)(v5 + 32) = self->_score;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *name;
  NSString *domain;
  NSString *category;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    name = self->_name;
    if (!((unint64_t)name | *((_QWORD *)a3 + 3)) || (v5 = -[NSString isEqual:](name, "isEqual:")) != 0)
    {
      domain = self->_domain;
      if (!((unint64_t)domain | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](domain, "isEqual:")) != 0)
      {
        category = self->_category;
        if (!((unint64_t)category | *((_QWORD *)a3 + 1))
          || (v5 = -[NSString isEqual:](category, "isEqual:")) != 0)
        {
          LOBYTE(v5) = (*((_BYTE *)a3 + 36) & 1) == 0;
          if ((*(_BYTE *)&self->_has & 1) != 0)
            LOBYTE(v5) = (*((_BYTE *)a3 + 36) & 1) != 0 && self->_score == *((float *)a3 + 8);
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  float score;
  double v8;
  long double v9;
  double v10;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_domain, "hash");
  v5 = -[NSString hash](self->_category, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    score = self->_score;
    v8 = score;
    if (score < 0.0)
      v8 = -score;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 3))
    -[NLPOIEntryImpl setName:](self, "setName:");
  if (*((_QWORD *)a3 + 2))
    -[NLPOIEntryImpl setDomain:](self, "setDomain:");
  if (*((_QWORD *)a3 + 1))
    -[NLPOIEntryImpl setCategory:](self, "setCategory:");
  if ((*((_BYTE *)a3 + 36) & 1) != 0)
  {
    self->_score = *((float *)a3 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (float)score
{
  return self->_score;
}

@end
