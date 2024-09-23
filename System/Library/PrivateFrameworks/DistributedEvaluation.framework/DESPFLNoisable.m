@implementation DESPFLNoisable

- (void)dealloc
{
  objc_super v3;

  PBRepeatedDoubleClear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)DESPFLNoisable;
  -[DESPFLNoisable dealloc](&v3, sel_dealloc);
}

- (void)setVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasRecipeId
{
  return self->_recipeId != 0;
}

- (void)setIteration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_iteration = a3;
}

- (void)setHasIteration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIteration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setWeight:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_weight = a3;
}

- (void)setHasWeight:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWeight
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)datasCount
{
  return self->_datas.count;
}

- (double)datas
{
  return self->_datas.list;
}

- (void)clearDatas
{
  PBRepeatedDoubleClear();
}

- (void)addData:(double)a3
{
  PBRepeatedDoubleAdd();
}

- (double)dataAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_datas;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_datas = &self->_datas;
  count = self->_datas.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_datas->list[a3];
}

- (void)setDatas:(double *)a3 count:(unint64_t)a4
{
  PBRepeatedDoubleSet();
}

- (unint64_t)data32sCount
{
  return self->_data32s.count;
}

- (float)data32s
{
  return self->_data32s.list;
}

- (void)clearData32s
{
  PBRepeatedFloatClear();
}

- (void)addData32:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)data32AtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_data32s;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_data32s = &self->_data32s;
  count = self->_data32s.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_data32s->list[a3];
}

- (void)setData32s:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasDataTransport
{
  return self->_dataTransport != 0;
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
  v8.super_class = (Class)DESPFLNoisable;
  -[DESPFLNoisable description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESPFLNoisable dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *recipeId;
  char has;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *uuid;
  DESDataTransport *dataTransport;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_version);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  recipeId = self->_recipeId;
  if (recipeId)
    objc_msgSend(v3, "setObject:forKey:", recipeId, CFSTR("recipe_id"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_iteration);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("iteration"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_weight);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("weight"));

  }
  PBRepeatedDoubleNSArray();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("data"));

  PBRepeatedFloatNSArray();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("data32"));

  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  dataTransport = self->_dataTransport;
  if (dataTransport)
  {
    -[DESDataTransport dictionaryRepresentation](dataTransport, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("data_transport"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DESPFLNoisableReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_recipeId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_datas.count)
  {
    PBDataWriterPlaceMark();
    if (self->_datas.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteDoubleField();
        ++v6;
      }
      while (v6 < self->_datas.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_data32s.count)
  {
    PBDataWriterPlaceMark();
    if (self->_data32s.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v7;
      }
      while (v7 < self->_data32s.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_uuid)
    PBDataWriterWriteStringField();
  if (self->_dataTransport)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  _DWORD *v13;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[24] = self->_version;
    *((_BYTE *)v4 + 100) |= 4u;
  }
  v13 = v4;
  if (self->_recipeId)
  {
    objc_msgSend(v4, "setRecipeId:");
    v4 = v13;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[18] = self->_iteration;
    *((_BYTE *)v4 + 100) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_weight;
    *((_BYTE *)v4 + 100) |= 1u;
  }
  if (-[DESPFLNoisable datasCount](self, "datasCount"))
  {
    objc_msgSend(v13, "clearDatas");
    v6 = -[DESPFLNoisable datasCount](self, "datasCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[DESPFLNoisable dataAtIndex:](self, "dataAtIndex:", i);
        objc_msgSend(v13, "addData:");
      }
    }
  }
  if (-[DESPFLNoisable data32sCount](self, "data32sCount"))
  {
    objc_msgSend(v13, "clearData32s");
    v9 = -[DESPFLNoisable data32sCount](self, "data32sCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[DESPFLNoisable data32AtIndex:](self, "data32AtIndex:", j);
        objc_msgSend(v13, "addData32:");
      }
    }
  }
  if (self->_uuid)
    objc_msgSend(v13, "setUuid:");
  v12 = v13;
  if (self->_dataTransport)
  {
    objc_msgSend(v13, "setDataTransport:");
    v12 = v13;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_version;
    *(_BYTE *)(v5 + 100) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_recipeId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v7;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_iteration;
    *(_BYTE *)(v6 + 100) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v6 + 56) = self->_weight;
    *(_BYTE *)(v6 + 100) |= 1u;
  }
  PBRepeatedDoubleCopy();
  PBRepeatedFloatCopy();
  v10 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v10;

  v12 = -[DESDataTransport copyWithZone:](self->_dataTransport, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v12;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *recipeId;
  NSString *uuid;
  DESDataTransport *dataTransport;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 4) == 0 || self->_version != *((_DWORD *)v4 + 24))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 100) & 4) != 0)
  {
    goto LABEL_26;
  }
  recipeId = self->_recipeId;
  if ((unint64_t)recipeId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](recipeId, "isEqual:"))
    {
LABEL_26:
      v9 = 0;
      goto LABEL_27;
    }
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 2) == 0 || self->_iteration != *((_DWORD *)v4 + 18))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 100) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 1) == 0 || self->_weight != *((double *)v4 + 7))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 100) & 1) != 0)
  {
    goto LABEL_26;
  }
  if (!PBRepeatedDoubleIsEqual())
    goto LABEL_26;
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_26;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
      goto LABEL_26;
  }
  dataTransport = self->_dataTransport;
  if ((unint64_t)dataTransport | *((_QWORD *)v4 + 8))
    v9 = -[DESDataTransport isEqual:](dataTransport, "isEqual:");
  else
    v9 = 1;
LABEL_27:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  double weight;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_recipeId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_iteration;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_11:
    v10 = 0;
    goto LABEL_14;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_11;
LABEL_6:
  weight = self->_weight;
  v7 = -weight;
  if (weight >= 0.0)
    v7 = self->_weight;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_14:
  v11 = v4 ^ v3;
  v12 = v5 ^ v10 ^ PBRepeatedDoubleHash();
  v13 = v12 ^ PBRepeatedFloatHash();
  v14 = v11 ^ v13 ^ -[NSString hash](self->_uuid, "hash");
  return v14 ^ -[DESDataTransport hash](self->_dataTransport, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  _QWORD *v12;
  DESDataTransport *dataTransport;
  uint64_t v14;
  _QWORD *v15;

  v4 = a3;
  if ((*((_BYTE *)v4 + 100) & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 24);
    *(_BYTE *)&self->_has |= 4u;
  }
  v15 = v4;
  if (*((_QWORD *)v4 + 10))
  {
    -[DESPFLNoisable setRecipeId:](self, "setRecipeId:");
    v4 = v15;
  }
  v5 = *((_BYTE *)v4 + 100);
  if ((v5 & 2) != 0)
  {
    self->_iteration = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 100);
  }
  if ((v5 & 1) != 0)
  {
    self->_weight = *((double *)v4 + 7);
    *(_BYTE *)&self->_has |= 1u;
  }
  v6 = objc_msgSend(v4, "datasCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v15, "dataAtIndex:", i);
      -[DESPFLNoisable addData:](self, "addData:");
    }
  }
  v9 = objc_msgSend(v15, "data32sCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
    {
      objc_msgSend(v15, "data32AtIndex:", j);
      -[DESPFLNoisable addData32:](self, "addData32:");
    }
  }
  v12 = v15;
  if (v15[11])
  {
    -[DESPFLNoisable setUuid:](self, "setUuid:");
    v12 = v15;
  }
  dataTransport = self->_dataTransport;
  v14 = v12[8];
  if (dataTransport)
  {
    if (v14)
    {
      -[DESDataTransport mergeFrom:](dataTransport, "mergeFrom:");
LABEL_22:
      v12 = v15;
    }
  }
  else if (v14)
  {
    -[DESPFLNoisable setDataTransport:](self, "setDataTransport:");
    goto LABEL_22;
  }

}

- (int)version
{
  return self->_version;
}

- (NSString)recipeId
{
  return self->_recipeId;
}

- (void)setRecipeId:(id)a3
{
  objc_storeStrong((id *)&self->_recipeId, a3);
}

- (unsigned)iteration
{
  return self->_iteration;
}

- (double)weight
{
  return self->_weight;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (DESDataTransport)dataTransport
{
  return self->_dataTransport;
}

- (void)setDataTransport:(id)a3
{
  objc_storeStrong((id *)&self->_dataTransport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_recipeId, 0);
  objc_storeStrong((id *)&self->_dataTransport, 0);
}

@end
