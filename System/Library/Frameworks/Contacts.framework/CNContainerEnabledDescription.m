@implementation CNContainerEnabledDescription

- (int)abPropertyID
{
  return *MEMORY[0x1E0CF62E0];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setEnabled:", objc_msgSend(a3, "BOOLValue"));

}

- (id)key
{
  return CFSTR("enabled");
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isWritable
{
  return 1;
}

- (id)CNValueForContainer:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isEnabled"));
}

@end
