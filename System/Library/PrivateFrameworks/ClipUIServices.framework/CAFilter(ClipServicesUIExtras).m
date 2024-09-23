@implementation CAFilter(ClipServicesUIExtras)

+ (id)cps_filterWithType:()ClipServicesUIExtras value:forKey:
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "filterWithType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v10, v7);

  return v9;
}

@end
