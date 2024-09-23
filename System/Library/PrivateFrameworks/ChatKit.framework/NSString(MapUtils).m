@implementation NSString(MapUtils)

+ (id)__ck_appleMapsURLStringForCoordinate:()MapUtils coordinateName:
{
  void *v7;
  id v8;
  void *v9;
  __CFString *v10;
  void *v11;

  if (a5)
  {
    v7 = (void *)MEMORY[0x1E0CB3500];
    v8 = a5;
    objc_msgSend(v7, "URLPathAllowedCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("ll");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("http://%@/?%@=%f,%f"), CFSTR("maps.apple.com"), v10, *(_QWORD *)&a1, *(_QWORD *)&a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
