@implementation GEODirectionIntent

- (GEODirectionIntent)initWithDirectionIntent:(id)a3
{
  id *v4;
  GEODirectionIntent *v5;
  GEODirectionIntent *v6;
  GEOResolvedItem *v7;
  void *v8;
  uint64_t v9;
  GEOResolvedItem *origin;
  GEOResolvedItem *v11;
  void *v12;
  uint64_t v13;
  GEOResolvedItem *destination;
  objc_super v16;

  v4 = (id *)a3;
  v16.receiver = self;
  v16.super_class = (Class)GEODirectionIntent;
  v5 = -[GEODirectionIntent init](&v16, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    -[GEOPDDirectionIntent _readOrigin]((uint64_t)v4);
    if (v4[4])
    {
      v7 = [GEOResolvedItem alloc];
      -[GEOPDDirectionIntent origin](v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[GEOResolvedItem initWithResolvedItem:](v7, "initWithResolvedItem:", v8);
      origin = v6->_origin;
      v6->_origin = (GEOResolvedItem *)v9;

    }
    -[GEOPDDirectionIntent _readDestination]((uint64_t)v4);
    if (v4[3])
    {
      v11 = [GEOResolvedItem alloc];
      -[GEOPDDirectionIntent destination](v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[GEOResolvedItem initWithResolvedItem:](v11, "initWithResolvedItem:", v12);
      destination = v6->_destination;
      v6->_destination = (GEOResolvedItem *)v13;

    }
    if (((_BYTE)v4[7] & 1) != 0)
      v6->_transportType = -[GEOPDDirectionIntent transportType]((uint64_t)v4);
  }

  return v6;
}

- (GEOResolvedItem)origin
{
  return self->_origin;
}

- (GEOResolvedItem)destination
{
  return self->_destination;
}

- (int)transportType
{
  return self->_transportType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_origin, 0);
}

@end
