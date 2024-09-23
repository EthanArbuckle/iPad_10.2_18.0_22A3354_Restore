@implementation NSURL(MapUtils)

+ (id)__ck_appleMapsURLForCoordinate:()MapUtils coordinateName:
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "__ck_appleMapsURLStringForCoordinate:coordinateName:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
