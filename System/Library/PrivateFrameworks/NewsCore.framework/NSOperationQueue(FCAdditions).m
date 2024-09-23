@implementation NSOperationQueue(FCAdditions)

+ (id)fc_sharedConcurrentQueue
{
  if (qword_1ED0F8900 != -1)
    dispatch_once(&qword_1ED0F8900, &__block_literal_global_191);
  return (id)_MergedGlobals_222;
}

+ (id)fc_throttledCKRequestOperationQueue
{
  if (qword_1ED0F8930 != -1)
    dispatch_once(&qword_1ED0F8930, &__block_literal_global_8_7);
  return (id)qword_1ED0F8928;
}

+ (id)fc_prewarmQueue
{
  if (qword_1ED0F8920 != -1)
    dispatch_once(&qword_1ED0F8920, &__block_literal_global_5_4);
  return (id)qword_1ED0F8918;
}

+ (id)fc_sharedSerialQueue
{
  if (qword_1ED0F8910 != -1)
    dispatch_once(&qword_1ED0F8910, &__block_literal_global_2_4);
  return (id)qword_1ED0F8908;
}

- (void)fc_addMainThreadOperationWithBlock:()FCAdditions
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__NSOperationQueue_FCAdditions__fc_addMainThreadOperationWithBlock___block_invoke;
  v6[3] = &unk_1E463DD48;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "fc_addAsyncOperationWithBlock:", v6);

}

@end
