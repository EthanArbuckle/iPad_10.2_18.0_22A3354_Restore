@implementation BMPBPhotosKnowledgeGraphEnrichmentEntity

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setScore:(double)a3
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

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)setCategory:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_category = a3;
}

- (void)setHasCategory:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCategory
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)BMPBPhotosKnowledgeGraphEnrichmentEntity;
  -[BMPBPhotosKnowledgeGraphEnrichmentEntity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBPhotosKnowledgeGraphEnrichmentEntity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  void *v6;
  NSString *language;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("score"));

  }
  language = self->_language;
  if (language)
    objc_msgSend(v4, "setObject:forKey:", language, CFSTR("language"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_category);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("category"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBPhotosKnowledgeGraphEnrichmentEntityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_score;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_language)
  {
    objc_msgSend(v5, "setLanguage:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_category;
    *((_BYTE *)v4 + 40) |= 2u;
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
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_score;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_category;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  char has;
  NSString *language;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_16;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_score != *((double *)v4 + 1))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_16;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](language, "isEqual:"))
    {
LABEL_16:
      v8 = 0;
      goto LABEL_17;
    }
    has = (char)self->_has;
  }
  v8 = (*((_BYTE *)v4 + 40) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_category != *((_DWORD *)v4 + 4))
      goto LABEL_16;
    v8 = 1;
  }
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  double score;
  double v6;
  long double v7;
  double v8;
  NSUInteger v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    score = self->_score;
    v6 = -score;
    if (score >= 0.0)
      v6 = self->_score;
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
  v9 = -[NSString hash](self->_language, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v10 = 2654435761 * self->_category;
  else
    v10 = 0;
  return v4 ^ v3 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBPhotosKnowledgeGraphEnrichmentEntity setName:](self, "setName:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_score = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[BMPBPhotosKnowledgeGraphEnrichmentEntity setLanguage:](self, "setLanguage:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    self->_category = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (double)score
{
  return self->_score;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (unsigned)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
