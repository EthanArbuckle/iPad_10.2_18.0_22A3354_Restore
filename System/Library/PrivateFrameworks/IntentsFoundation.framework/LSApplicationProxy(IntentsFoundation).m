@implementation LSApplicationProxy(IntentsFoundation)

- (id)if_userActivityTypes
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "objectForInfoDictionaryKey:ofClass:", CFSTR("NSUserActivityTypes"), objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "filteredArrayUsingPredicate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

@end
