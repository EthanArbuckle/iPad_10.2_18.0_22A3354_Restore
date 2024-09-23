@implementation MXRecognitionChoice

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)MXRecognitionChoice;
  -[MXRecognitionChoice dealloc](&v3, sel_dealloc);
}

- (unint64_t)alternativeIndexsCount
{
  return self->_alternativeIndexs.count;
}

- (int)alternativeIndexs
{
  return self->_alternativeIndexs.list;
}

- (void)clearAlternativeIndexs
{
  PBRepeatedInt32Clear();
}

- (void)addAlternativeIndex:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)alternativeIndexAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_alternativeIndexs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_alternativeIndexs = &self->_alternativeIndexs;
  count = self->_alternativeIndexs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_alternativeIndexs->list[a3];
}

- (void)setAlternativeIndexs:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)setConfidence:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)MXRecognitionChoice;
  -[MXRecognitionChoice description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXRecognitionChoice dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedInt32NSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("alternative_index"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_confidence);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("confidence"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXRecognitionChoiceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_alternativeIndexs.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v6;
      ++v5;
    }
    while (v5 < self->_alternativeIndexs.count);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  if (-[MXRecognitionChoice alternativeIndexsCount](self, "alternativeIndexsCount"))
  {
    objc_msgSend(v7, "clearAlternativeIndexs");
    v4 = -[MXRecognitionChoice alternativeIndexsCount](self, "alternativeIndexsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addAlternativeIndex:", -[MXRecognitionChoice alternativeIndexAtIndex:](self, "alternativeIndexAtIndex:", i));
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v7 + 8) = self->_confidence;
    *((_BYTE *)v7 + 36) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v4 + 32) = self->_confidence;
    *(_BYTE *)(v4 + 36) |= 1u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || !PBRepeatedInt32IsEqual())
    goto LABEL_7;
  v5 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) != 0 && self->_confidence == *((_DWORD *)v4 + 8))
    {
      v5 = 1;
      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_confidence;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  int *v7;

  v7 = (int *)a3;
  v4 = objc_msgSend(v7, "alternativeIndexsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[MXRecognitionChoice addAlternativeIndex:](self, "addAlternativeIndex:", objc_msgSend(v7, "alternativeIndexAtIndex:", i));
  }
  if ((v7[9] & 1) != 0)
  {
    self->_confidence = v7[8];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (int)confidence
{
  return self->_confidence;
}

@end
