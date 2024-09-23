@implementation NSMapObservationTransformer

- (NSMapObservationTransformer)initWithBlock:(id)a3 tag:(int)a4
{
  NSMapObservationTransformer *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSMapObservationTransformer;
  v6 = -[NSMapObservationTransformer init](&v8, sel_init);
  if (v6)
  {
    v6->_block = (id)objc_msgSend(a3, "copy");
    v6->_tag = a4;
  }
  return v6;
}

- (void)_receiveBox:(id)a3
{
  int tag;
  uint64_t v7;
  int v8;
  objc_super v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  tag = self->_tag;
  if (*((_DWORD *)a3 + 6) == tag && tag != 3)
  {
    v7 = (*((uint64_t (**)(void))self->_block + 2))();
    v8 = *((_DWORD *)a3 + 6);
    if (v8 == 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a3, "setError:", v7);
        goto LABEL_11;
      }
      v8 = *((_DWORD *)a3 + 6);
    }
    if (v8 == 1)
      objc_msgSend(a3, "setValue:", v7);
  }
LABEL_11:
  v9.receiver = self;
  v9.super_class = (Class)NSMapObservationTransformer;
  -[NSMapObservationTransformer _receiveBox:](&v9, sel__receiveBox_, a3);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSMapObservationTransformer;
  -[NSObservationSource dealloc](&v3, sel_dealloc);
}

@end
