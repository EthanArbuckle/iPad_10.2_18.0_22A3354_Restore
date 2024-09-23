@implementation NTKProtoCollectionBySlot

- (BOOL)hasSlot
{
  return self->_slot != 0;
}

- (BOOL)hasCollection
{
  return self->_collection != 0;
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
  v8.super_class = (Class)NTKProtoCollectionBySlot;
  -[NTKProtoCollectionBySlot description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKProtoCollectionBySlot dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *slot;
  NTKProtoPigmentCollection *collection;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  slot = self->_slot;
  if (slot)
    objc_msgSend(v3, "setObject:forKey:", slot, CFSTR("slot"));
  collection = self->_collection;
  if (collection)
  {
    -[NTKProtoPigmentCollection dictionaryRepresentation](collection, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("collection"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTKProtoCollectionBySlotReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_slot)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_collection)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_slot)
  {
    objc_msgSend(v4, "setSlot:");
    v4 = v5;
  }
  if (self->_collection)
  {
    objc_msgSend(v5, "setCollection:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_slot, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NTKProtoPigmentCollection copyWithZone:](self->_collection, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *slot;
  NTKProtoPigmentCollection *collection;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((slot = self->_slot, !((unint64_t)slot | v4[2])) || -[NSString isEqual:](slot, "isEqual:")))
  {
    collection = self->_collection;
    if ((unint64_t)collection | v4[1])
      v7 = -[NTKProtoPigmentCollection isEqual:](collection, "isEqual:");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_slot, "hash");
  return -[NTKProtoPigmentCollection hash](self->_collection, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NTKProtoPigmentCollection *collection;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[NTKProtoCollectionBySlot setSlot:](self, "setSlot:");
    v4 = v7;
  }
  collection = self->_collection;
  v6 = v4[1];
  if (collection)
  {
    if (v6)
    {
      -[NTKProtoPigmentCollection mergeFrom:](collection, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[NTKProtoCollectionBySlot setCollection:](self, "setCollection:");
    goto LABEL_8;
  }

}

- (NSString)slot
{
  return self->_slot;
}

- (void)setSlot:(id)a3
{
  objc_storeStrong((id *)&self->_slot, a3);
}

- (NTKProtoPigmentCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slot, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
