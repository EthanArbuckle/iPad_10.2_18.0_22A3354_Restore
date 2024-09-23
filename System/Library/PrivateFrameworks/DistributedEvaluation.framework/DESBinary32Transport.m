@implementation DESBinary32Transport

- (void)dealloc
{
  objc_super v3;

  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)DESBinary32Transport;
  -[DESBinary32Transport dealloc](&v3, sel_dealloc);
}

- (unint64_t)datasCount
{
  return self->_datas.count;
}

- (float)datas
{
  return self->_datas.list;
}

- (void)clearDatas
{
  PBRepeatedFloatClear();
}

- (void)addData:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)dataAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_datas;
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

- (void)setDatas:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
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
  v8.super_class = (Class)DESBinary32Transport;
  -[DESBinary32Transport description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESBinary32Transport dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedFloatNSArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("data"));

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return DESBinary32TransportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $7401700F6E393C0442CED440453508D3 *p_datas;
  unint64_t v6;

  v4 = a3;
  p_datas = &self->_datas;
  if (p_datas->count)
  {
    PBDataWriterPlaceMark();
    if (p_datas->count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v6;
      }
      while (v6 < p_datas->count);
    }
    PBDataWriterRecallMark();
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  if (-[DESBinary32Transport datasCount](self, "datasCount"))
  {
    objc_msgSend(v7, "clearDatas");
    v4 = -[DESBinary32Transport datasCount](self, "datasCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[DESBinary32Transport dataAtIndex:](self, "dataAtIndex:", i);
        objc_msgSend(v7, "addData:");
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedFloatCopy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char IsEqual;

  v3 = a3;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
    IsEqual = PBRepeatedFloatIsEqual();
  else
    IsEqual = 0;

  return IsEqual;
}

- (unint64_t)hash
{
  return PBRepeatedFloatHash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "datasCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v7, "dataAtIndex:", i);
      -[DESBinary32Transport addData:](self, "addData:");
    }
  }

}

@end
