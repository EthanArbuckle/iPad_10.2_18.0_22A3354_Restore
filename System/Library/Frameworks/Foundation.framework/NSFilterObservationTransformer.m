@implementation NSFilterObservationTransformer

+ (id)filterWithBlock:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithBlock:", a3);
}

- (void)_receiveBox:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*((_DWORD *)a3 + 6) != 1 || (*((unsigned int (**)(void))self->_predicate + 2))())
  {
    v5.receiver = self;
    v5.super_class = (Class)NSFilterObservationTransformer;
    -[NSFilterObservationTransformer _receiveBox:](&v5, sel__receiveBox_, a3);
  }
}

- (NSFilterObservationTransformer)initWithBlock:(id)a3
{
  NSFilterObservationTransformer *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSFilterObservationTransformer;
  v4 = -[NSFilterObservationTransformer init](&v6, sel_init);
  if (v4)
    v4->_predicate = (id)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFilterObservationTransformer;
  -[NSObservationSource dealloc](&v3, sel_dealloc);
}

@end
