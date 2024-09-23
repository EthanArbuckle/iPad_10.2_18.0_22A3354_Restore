@implementation XRNetworkingServiceObservationTuple

- (XRNetworkingServiceObservationTuple)initWithKind:(int)a3 count:(unsigned __int8)a4
{
  unsigned int v4;
  XRNetworkingServiceObservationTuple *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a4;
  v14.receiver = self;
  v14.super_class = (Class)XRNetworkingServiceObservationTuple;
  v6 = -[XRNetworkingServiceObservationTuple init](&v14, sel_init);
  if (!v6)
    return v6;
  if (v4 >= 0x32)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[XRNetworkingServiceObservationTuple initWithKind:count:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("DTNetworkingService.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count < 50"));
  }
  else
  {
    if (v4)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[XRNetworkingServiceObservationTuple initWithKind:count:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("DTNetworkingService.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));
  }

LABEL_4:
  v6->_kind = a3;
  v6->_count = v4;
  v7 = v4;
  v6->data = (id *)malloc_type_calloc(8uLL, v4, 0xFF5361C2uLL);
  if (v4)
  {
    v8 = 0;
    v9 = (void *)*MEMORY[0x24BDBD430];
    v10 = 8 * v7;
    do
    {
      objc_storeStrong(&v6->data[v8 / 8], v9);
      v8 += 8;
    }
    while (v10 != v8);
  }
  return v6;
}

- (XRNetworkingServiceObservationTuple)initWithKind:(int)a3 count:(unsigned __int8)a4 source:(__CFDictionary *)a5 indexToKeyMap:(const __CFString *)a6
{
  unsigned int v8;
  XRNetworkingServiceObservationTuple *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const void **v14;
  void *v15;
  uint64_t v16;
  id *data;
  id v18;
  id *v19;
  void *v21;
  void *v22;
  objc_super v23;

  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)XRNetworkingServiceObservationTuple;
  v10 = -[XRNetworkingServiceObservationTuple init](&v23, sel_init);
  if (!v10)
    return v10;
  if (v8 >= 0x32)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[XRNetworkingServiceObservationTuple initWithKind:count:source:indexToKeyMap:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("DTNetworkingService.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count < 50"));
  }
  else
  {
    if (v8)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[XRNetworkingServiceObservationTuple initWithKind:count:source:indexToKeyMap:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("DTNetworkingService.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));
  }

LABEL_4:
  v10->_kind = a3;
  v10->_count = v8;
  v11 = v8;
  v10->data = (id *)malloc_type_calloc(8uLL, v8, 0x15BB445CuLL);
  if (v8)
  {
    v12 = 0;
    v13 = (void *)*MEMORY[0x24BDBD430];
    do
    {
      v14 = (const void **)a6[v12];
      if (v14)
      {
        CFDictionaryGetValue(a5, *v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "copy");
        data = v10->data;
        v18 = data[v12];
        data[v12] = (id)v16;

      }
      v19 = &v10->data[v12];
      if (!*v19)
        objc_storeStrong(v19, v13);
      ++v12;
    }
    while (v11 != v12);
  }
  return v10;
}

- (void)dealloc
{
  unint64_t v3;
  id *data;
  id v5;
  objc_super v6;

  if (self->_count)
  {
    v3 = 0;
    do
    {
      data = self->data;
      v5 = data[v3];
      data[v3] = 0;

      ++v3;
    }
    while (v3 < self->_count);
  }
  free(self->data);
  v6.receiver = self;
  v6.super_class = (Class)XRNetworkingServiceObservationTuple;
  -[XRNetworkingServiceObservationTuple dealloc](&v6, sel_dealloc);
}

- (int)kind
{
  return self->_kind;
}

- (void)setKind:(int)a3
{
  self->_kind = a3;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned __int8)a3
{
  self->_count = a3;
}

@end
