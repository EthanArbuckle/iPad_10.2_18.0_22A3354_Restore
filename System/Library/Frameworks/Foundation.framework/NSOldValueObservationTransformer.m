@implementation NSOldValueObservationTransformer

+ (id)oldValuesTransformer
{
  return objc_alloc_init((Class)a1);
}

- (void)_receiveBox:(id)a3
{
  id v5;
  id lastValue;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*((_DWORD *)a3 + 6) == 1)
  {
    v5 = (id)objc_msgSend(a3, "value");
    lastValue = self->_lastValue;
    if (lastValue)
    {
      v7 = lastValue;
      self->_lastValue = v7;
      v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a3, CFSTR("new"), v7, CFSTR("old"), 0);
    }
    else
    {
      v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a3, CFSTR("new"), 0, v9, v10);
    }
    objc_msgSend(a3, "setValue:", v8);
    self->_lastValue = v5;
  }
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSOldValueObservationTransformer;
  -[NSObservationSource dealloc](&v3, sel_dealloc);
}

@end
