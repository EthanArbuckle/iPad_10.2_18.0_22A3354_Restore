@implementation NSDictionary(FCAccountActionQueue)

- (uint64_t)fc_actionTypes
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("FCFileCoordinatedAccountActionQueueActionTypesKey"));
}

- (uint64_t)fc_localDataHint
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("FCFileCoordinatedAccountActionQueueLocalDataHintKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end
