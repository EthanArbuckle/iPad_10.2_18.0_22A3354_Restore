@implementation CLPLOGENTRYVISIONSimdFloatM

- (void)dealloc
{
  objc_super v3;

  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)CLPLOGENTRYVISIONSimdFloatM;
  -[CLPLOGENTRYVISIONSimdFloatM dealloc](&v3, sel_dealloc);
}

- (unint64_t)valuesCount
{
  return self->_values.count;
}

- (float)values
{
  return self->_values.list;
}

- (void)clearValues
{
  PBRepeatedFloatClear();
}

- (void)addValues:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)valuesAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_values;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_values = &self->_values;
  count = self->_values.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_values->list[a3];
}

- (void)setValues:(float *)a3 count:(unint64_t)a4
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
  v8.super_class = (Class)CLPLOGENTRYVISIONSimdFloatM;
  -[CLPLOGENTRYVISIONSimdFloatM description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPLOGENTRYVISIONSimdFloatM dictionaryRepresentation](self, "dictionaryRepresentation");
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
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("values"));

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONSimdFloatMReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $7401700F6E393C0442CED440453508D3 *p_values;
  unint64_t v4;

  p_values = &self->_values;
  if (self->_values.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v4;
    }
    while (v4 < p_values->count);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  if (-[CLPLOGENTRYVISIONSimdFloatM valuesCount](self, "valuesCount"))
  {
    objc_msgSend(v7, "clearValues");
    v4 = -[CLPLOGENTRYVISIONSimdFloatM valuesCount](self, "valuesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[CLPLOGENTRYVISIONSimdFloatM valuesAtIndex:](self, "valuesAtIndex:", i);
        objc_msgSend(v7, "addValues:");
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
  v4 = objc_msgSend(v7, "valuesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v7, "valuesAtIndex:", i);
      -[CLPLOGENTRYVISIONSimdFloatM addValues:](self, "addValues:");
    }
  }

}

@end
