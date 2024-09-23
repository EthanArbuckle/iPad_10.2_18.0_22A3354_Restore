@implementation LSPropertyList(_EXDictionaryLike)

- (id)_EX_dictionaryForKey:()_EXDictionaryLike
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
