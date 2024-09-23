@implementation MSPSerializer

- (id)dataFromChange:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  id v5;
  MSPCompanionSyncedItem *v6;

  v5 = a3;
  v6 = -[MSPCompanionSyncedItem initWithData:]([MSPCompanionSyncedItem alloc], "initWithData:", v5);

  -[MSPCompanionSyncedItem setSyChangeType:](v6, "setSyChangeType:", a4);
  return v6;
}

@end
