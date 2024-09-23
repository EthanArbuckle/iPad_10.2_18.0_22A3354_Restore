@implementation _DKEventData

- (id)toPBCodable
{
  _DKPREventData *v3;
  int v4;
  void *v5;
  uint64_t v6;

  if (-[_DKEventData version]((uint64_t)self))
  {
    -[_DKSyncWindow startDate]((uint64_t)self);
    v3 = (_DKPREventData *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v3 = objc_alloc_init(_DKPREventData);
      v4 = -[_DKEventData version]((uint64_t)self);
      -[_DKPREventData setVersion:]((uint64_t)v3, v4);
      -[_DKSyncWindow startDate]((uint64_t)self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKPREventData setEvent:]((uint64_t)v3, v5);

      if (-[_DKEventData version]((uint64_t)self) == 2)
      {
        -[_DKPREventData setHasUncompressedLength:]((uint64_t)v3, 1);
        v6 = -[_DKSyncType urgency]((uint64_t)self);
        -[_DKPREventData setUncompressedLength:]((uint64_t)v3, v6);
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)fromPBCodable:(id)a3
{
  id v3;
  id v4;
  void *v5;
  int v6;
  _DKEventData *v7;
  void *v8;
  unint64_t v9;
  unsigned int v10;
  id *v11;
  id *v12;
  unsigned int v13;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    -[_DKPREventData event]((uint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = -[_DKPREventData version]((uint64_t)v4);
      v7 = [_DKEventData alloc];
      -[_DKPREventData event]((uint64_t)v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == 2)
      {
        v9 = -[_DKPREventData uncompressedLength]((uint64_t)v4);
        v10 = -[_DKPREventData version]((uint64_t)v4);
        v11 = -[_DKEventData initWithCompressedData:uncompressedLength:version:]((id *)&v7->super.isa, v8, (void *)v9, (void *)v10);
      }
      else
      {
        v13 = -[_DKPREventData version]((uint64_t)v4);
        v11 = -[_DKEventData initWithData:version:]((id *)&v7->super.isa, v8, (void *)v13);
      }
      v12 = v11;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)initWithData:(void *)a3 version:
{
  id v6;
  id *v7;
  objc_super v9;

  v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_DKEventData;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      v7[1] = a3;
      objc_storeStrong(v7 + 2, a2);
    }
  }

  return a1;
}

- (id)initWithCompressedData:(void *)a3 uncompressedLength:(void *)a4 version:
{
  id v8;
  id *v9;
  objc_super v11;

  v8 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)_DKEventData;
    v9 = (id *)objc_msgSendSuper2(&v11, sel_init);
    a1 = v9;
    if (v9)
    {
      v9[1] = a4;
      v9[3] = a3;
      objc_storeStrong(v9 + 2, a2);
    }
  }

  return a1;
}

- (id)asData
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "toPBCodable");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "data");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)version
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
