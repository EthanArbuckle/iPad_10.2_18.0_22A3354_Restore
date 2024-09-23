@implementation NTKProtoPigment

- (BOOL)hasOptionName
{
  return self->_optionName != 0;
}

- (BOOL)hasCollectionName
{
  return self->_collectionName != 0;
}

- (void)setColorFraction:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_colorFraction = a3;
}

- (void)setHasColorFraction:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasColorFraction
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsAddable:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isAddable = a3;
}

- (void)setHasIsAddable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsAddable
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSupportsSlider:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_supportsSlider = a3;
}

- (void)setHasSupportsSlider:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsSlider
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasAlternativeLocalizedStringTableName
{
  return self->_alternativeLocalizedStringTableName != 0;
}

- (BOOL)hasBundlePrincipalClassName
{
  return self->_bundlePrincipalClassName != 0;
}

- (void)setFromStore:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_fromStore = a3;
}

- (void)setHasFromStore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFromStore
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
  v8.super_class = (Class)NTKProtoPigment;
  -[NTKProtoPigment description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKProtoPigment dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *optionName;
  NSString *collectionName;
  char has;
  void *v9;
  NSString *alternativeLocalizedStringTableName;
  NSString *bundlePrincipalClassName;
  void *v12;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  optionName = self->_optionName;
  if (optionName)
    objc_msgSend(v3, "setObject:forKey:", optionName, CFSTR("optionName"));
  collectionName = self->_collectionName;
  if (collectionName)
    objc_msgSend(v5, "setObject:forKey:", collectionName, CFSTR("collectionName"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(float *)&v4 = self->_colorFraction;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("colorFraction"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAddable);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("isAddable"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsSlider);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("supportsSlider"));

  }
LABEL_9:
  alternativeLocalizedStringTableName = self->_alternativeLocalizedStringTableName;
  if (alternativeLocalizedStringTableName)
    objc_msgSend(v5, "setObject:forKey:", alternativeLocalizedStringTableName, CFSTR("alternativeLocalizedStringTableName"));
  bundlePrincipalClassName = self->_bundlePrincipalClassName;
  if (bundlePrincipalClassName)
    objc_msgSend(v5, "setObject:forKey:", bundlePrincipalClassName, CFSTR("bundlePrincipalClassName"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fromStore);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("fromStore"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return NTKProtoPigmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_optionName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_collectionName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_9:
  if (self->_alternativeLocalizedStringTableName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_bundlePrincipalClassName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_optionName)
  {
    objc_msgSend(v4, "setOptionName:");
    v4 = v6;
  }
  if (self->_collectionName)
  {
    objc_msgSend(v6, "setCollectionName:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = LODWORD(self->_colorFraction);
    *((_BYTE *)v4 + 52) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_BYTE *)v4 + 49) = self->_isAddable;
  *((_BYTE *)v4 + 52) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_8:
    *((_BYTE *)v4 + 50) = self->_supportsSlider;
    *((_BYTE *)v4 + 52) |= 8u;
  }
LABEL_9:
  if (self->_alternativeLocalizedStringTableName)
  {
    objc_msgSend(v6, "setAlternativeLocalizedStringTableName:");
    v4 = v6;
  }
  if (self->_bundlePrincipalClassName)
  {
    objc_msgSend(v6, "setBundlePrincipalClassName:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 48) = self->_fromStore;
    *((_BYTE *)v4 + 52) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_optionName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_collectionName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(float *)(v5 + 32) = self->_colorFraction;
    *(_BYTE *)(v5 + 52) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 49) = self->_isAddable;
  *(_BYTE *)(v5 + 52) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 50) = self->_supportsSlider;
    *(_BYTE *)(v5 + 52) |= 8u;
  }
LABEL_5:
  v11 = -[NSString copyWithZone:](self->_alternativeLocalizedStringTableName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v11;

  v13 = -[NSString copyWithZone:](self->_bundlePrincipalClassName, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 48) = self->_fromStore;
    *(_BYTE *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *optionName;
  NSString *collectionName;
  NSString *alternativeLocalizedStringTableName;
  NSString *bundlePrincipalClassName;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  optionName = self->_optionName;
  if ((unint64_t)optionName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](optionName, "isEqual:"))
      goto LABEL_33;
  }
  collectionName = self->_collectionName;
  if ((unint64_t)collectionName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](collectionName, "isEqual:"))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_colorFraction != *((float *)v4 + 8))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0)
      goto LABEL_33;
    if (self->_isAddable)
    {
      if (!*((_BYTE *)v4 + 49))
        goto LABEL_33;
    }
    else if (*((_BYTE *)v4 + 49))
    {
      goto LABEL_33;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0)
      goto LABEL_33;
    if (self->_supportsSlider)
    {
      if (!*((_BYTE *)v4 + 50))
        goto LABEL_33;
    }
    else if (*((_BYTE *)v4 + 50))
    {
      goto LABEL_33;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_33;
  }
  alternativeLocalizedStringTableName = self->_alternativeLocalizedStringTableName;
  if ((unint64_t)alternativeLocalizedStringTableName | *((_QWORD *)v4 + 1)
    && !-[NSString isEqual:](alternativeLocalizedStringTableName, "isEqual:"))
  {
    goto LABEL_33;
  }
  bundlePrincipalClassName = self->_bundlePrincipalClassName;
  if ((unint64_t)bundlePrincipalClassName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundlePrincipalClassName, "isEqual:"))
      goto LABEL_33;
  }
  v9 = (*((_BYTE *)v4 + 52) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) != 0)
    {
      if (self->_fromStore)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_33;
      }
      else if (*((_BYTE *)v4 + 48))
      {
        goto LABEL_33;
      }
      v9 = 1;
      goto LABEL_34;
    }
LABEL_33:
    v9 = 0;
  }
LABEL_34:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  char has;
  unint64_t v6;
  float colorFraction;
  float v8;
  float v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;

  v3 = -[NSString hash](self->_optionName, "hash");
  v4 = -[NSString hash](self->_collectionName, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    colorFraction = self->_colorFraction;
    v8 = -colorFraction;
    if (colorFraction >= 0.0)
      v8 = self->_colorFraction;
    v9 = floorf(v8 + 0.5);
    v10 = (float)(v8 - v9) * 1.8447e19;
    v6 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabsf(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 4) != 0)
  {
    v11 = 2654435761 * self->_isAddable;
    if ((has & 8) != 0)
      goto LABEL_11;
  }
  else
  {
    v11 = 0;
    if ((has & 8) != 0)
    {
LABEL_11:
      v12 = 2654435761 * self->_supportsSlider;
      goto LABEL_14;
    }
  }
  v12 = 0;
LABEL_14:
  v13 = -[NSString hash](self->_alternativeLocalizedStringTableName, "hash");
  v14 = -[NSString hash](self->_bundlePrincipalClassName, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v15 = 2654435761 * self->_fromStore;
  else
    v15 = 0;
  return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[NTKProtoPigment setOptionName:](self, "setOptionName:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NTKProtoPigment setCollectionName:](self, "setCollectionName:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 1) != 0)
  {
    self->_colorFraction = *((float *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 52);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_isAddable = *((_BYTE *)v4 + 49);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
LABEL_8:
    self->_supportsSlider = *((_BYTE *)v4 + 50);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_9:
  if (*((_QWORD *)v4 + 1))
  {
    -[NTKProtoPigment setAlternativeLocalizedStringTableName:](self, "setAlternativeLocalizedStringTableName:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NTKProtoPigment setBundlePrincipalClassName:](self, "setBundlePrincipalClassName:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    self->_fromStore = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)optionName
{
  return self->_optionName;
}

- (void)setOptionName:(id)a3
{
  objc_storeStrong((id *)&self->_optionName, a3);
}

- (NSString)collectionName
{
  return self->_collectionName;
}

- (void)setCollectionName:(id)a3
{
  objc_storeStrong((id *)&self->_collectionName, a3);
}

- (float)colorFraction
{
  return self->_colorFraction;
}

- (BOOL)isAddable
{
  return self->_isAddable;
}

- (BOOL)supportsSlider
{
  return self->_supportsSlider;
}

- (NSString)alternativeLocalizedStringTableName
{
  return self->_alternativeLocalizedStringTableName;
}

- (void)setAlternativeLocalizedStringTableName:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeLocalizedStringTableName, a3);
}

- (NSString)bundlePrincipalClassName
{
  return self->_bundlePrincipalClassName;
}

- (void)setBundlePrincipalClassName:(id)a3
{
  objc_storeStrong((id *)&self->_bundlePrincipalClassName, a3);
}

- (BOOL)fromStore
{
  return self->_fromStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionName, 0);
  objc_storeStrong((id *)&self->_collectionName, 0);
  objc_storeStrong((id *)&self->_bundlePrincipalClassName, 0);
  objc_storeStrong((id *)&self->_alternativeLocalizedStringTableName, 0);
}

@end
