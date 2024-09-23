@implementation SGEKEventStoreProvider

+ (id)defaultEKStoreProvider
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithNewEKEventStoreGetter:callBlockWithEKEventStoreForReading:", &__block_literal_global_3500, &__block_literal_global_158);
}

- (SGEKEventStoreProvider)initWithNewEKEventStoreGetter:(id)a3 callBlockWithEKEventStoreForReading:(id)a4
{
  id v6;
  id v7;
  SGEKEventStoreProvider *v8;
  uint64_t v9;
  id newEKEventStoreGetter;
  uint64_t v11;
  id callBlockWithEKEventStoreForReading;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SGEKEventStoreProvider;
  v8 = -[SGEKEventStoreProvider init](&v14, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x1C3BD5158](v6);
    newEKEventStoreGetter = v8->_newEKEventStoreGetter;
    v8->_newEKEventStoreGetter = (id)v9;

    v11 = MEMORY[0x1C3BD5158](v7);
    callBlockWithEKEventStoreForReading = v8->_callBlockWithEKEventStoreForReading;
    v8->_callBlockWithEKEventStoreForReading = (id)v11;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callBlockWithEKEventStoreForReading, 0);
  objc_storeStrong(&self->_newEKEventStoreGetter, 0);
}

uint64_t __48__SGEKEventStoreProvider_defaultEKStoreProvider__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CAA078], "sg_usingSharedStoreForReadingOnly:", a2);
}

uint64_t __48__SGEKEventStoreProvider_defaultEKStoreProvider__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CAA078], "sg_newStore");
}

@end
