@implementation FCChannelsWithHeldRecords

FCTag *__FCChannelsWithHeldRecords_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCTag *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[FCTag initWithTagRecord:assetManager:interestToken:]([FCTag alloc], "initWithTagRecord:assetManager:interestToken:", v6, *(_QWORD *)(a1 + 32), v5);

  return v7;
}

@end
