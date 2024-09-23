@implementation GEOPDClientRankingFeatureFunctionTypeLinear

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDClientRankingFeatureFunctionTypeLinear;
  -[GEOPDClientRankingFeatureFunctionTypeLinear description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDClientRankingFeatureFunctionTypeLinear dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDClientRankingFeatureFunctionTypeLinear _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  double v5;
  char v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(a1 + 28);
  if ((v6 & 4) == 0)
  {
    if ((*(_BYTE *)(a1 + 28) & 1) == 0)
      goto LABEL_4;
LABEL_19:
    LODWORD(v5) = *(_DWORD *)(a1 + 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("featureMaxRelativeValue");
    else
      v19 = CFSTR("feature_max_relative_value");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

    if ((*(_BYTE *)(a1 + 28) & 2) == 0)
      goto LABEL_9;
    goto LABEL_5;
  }
  LODWORD(v5) = *(_DWORD *)(a1 + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v17 = CFSTR("featureWeight");
  else
    v17 = CFSTR("feature_weight");
  objc_msgSend(v4, "setObject:forKey:", v16, v17);

  v6 = *(_BYTE *)(a1 + 28);
  if ((v6 & 1) != 0)
    goto LABEL_19;
LABEL_4:
  if ((v6 & 2) != 0)
  {
LABEL_5:
    LODWORD(v5) = *(_DWORD *)(a1 + 20);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("featureMeanValue");
    else
      v8 = CFSTR("feature_mean_value");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
LABEL_9:
  v9 = *(void **)(a1 + 8);
  if (v9)
  {
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __73__GEOPDClientRankingFeatureFunctionTypeLinear__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v13 = v12;
      v21 = v13;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v20);
      v14 = v13;

      v11 = v14;
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDClientRankingFeatureFunctionTypeLinear _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __73__GEOPDClientRankingFeatureFunctionTypeLinear__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  void *v14;
  int v15;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("featureWeight");
    else
      v7 = CFSTR("feature_weight");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      *(_BYTE *)(v6 + 28) |= 4u;
      *(_DWORD *)(v6 + 24) = v9;
    }

    if (a3)
      v10 = CFSTR("featureMaxRelativeValue");
    else
      v10 = CFSTR("feature_max_relative_value");
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "floatValue");
      *(_BYTE *)(v6 + 28) |= 1u;
      *(_DWORD *)(v6 + 16) = v12;
    }

    if (a3)
      v13 = CFSTR("featureMeanValue");
    else
      v13 = CFSTR("feature_mean_value");
    objc_msgSend(v5, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "floatValue");
      *(_BYTE *)(v6 + 28) |= 2u;
      *(_DWORD *)(v6 + 20) = v15;
    }

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDClientRankingFeatureFunctionTypeLinearReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteFloatField();
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteFloatField();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 2) != 0)
LABEL_4:
    PBDataWriterWriteFloatField();
LABEL_5:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(float *)(v4 + 16) = self->_featureMaxRelativeValue;
    *(_BYTE *)(v4 + 28) |= 1u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(float *)(v4 + 24) = self->_featureWeight;
  *(_BYTE *)(v4 + 28) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    *(float *)(v4 + 20) = self->_featureMeanValue;
    *(_BYTE *)(v4 + 28) |= 2u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_featureWeight != *((float *)v4 + 6))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_featureMaxRelativeValue != *((float *)v4 + 4))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_featureMeanValue != *((float *)v4 + 5))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  char flags;
  unint64_t v4;
  float featureWeight;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float featureMaxRelativeValue;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  float featureMeanValue;
  double v16;
  long double v17;
  double v18;

  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    featureWeight = self->_featureWeight;
    v6 = featureWeight;
    if (featureWeight < 0.0)
      v6 = -featureWeight;
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
  if ((flags & 1) != 0)
  {
    featureMaxRelativeValue = self->_featureMaxRelativeValue;
    v11 = featureMaxRelativeValue;
    if (featureMaxRelativeValue < 0.0)
      v11 = -featureMaxRelativeValue;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((flags & 2) != 0)
  {
    featureMeanValue = self->_featureMeanValue;
    v16 = featureMeanValue;
    if (featureMeanValue < 0.0)
      v16 = -featureMeanValue;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  return v9 ^ v4 ^ v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
