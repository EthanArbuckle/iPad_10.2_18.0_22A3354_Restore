@implementation LSPropertyList(Helpers)

- (uint64_t)BOOLForKey:()Helpers
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

@end
