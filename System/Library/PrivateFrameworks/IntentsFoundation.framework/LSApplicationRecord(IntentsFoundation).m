@implementation LSApplicationRecord(IntentsFoundation)

- (id)if_userActivityTypes
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:ofClass:", CFSTR("NSUserActivityTypes"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_objectsPassingTest:", &__block_literal_global_127);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
