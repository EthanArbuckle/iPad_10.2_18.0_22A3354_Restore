@implementation NSString(AppleMediaServicesUI)

- (uint64_t)ams_enumerateRangesOfString:()AppleMediaServicesUI usingBlock:
{
  return objc_msgSend(a1, "ams_enumerateRangesOfString:options:usingBlock:", a3, 0, a4);
}

- (void)ams_enumerateRangesOfString:()AppleMediaServicesUI options:usingBlock:
{
  id v8;
  void (**v9)(id, uint64_t, uint64_t, char *);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v8 = a3;
  v9 = a5;
  v18 = 0;
  v10 = objc_msgSend(a1, "length");
  v11 = 0;
  v12 = v10;
  do
  {
    v13 = objc_msgSend(a1, "rangeOfString:options:range:", v8, a4, v11, v12);
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    v15 = v13;
    v16 = v14;
    v9[2](v9, v13, v14, &v18);
    v11 = v15 + v16;
    v12 = v10 - (v15 + v16);
  }
  while (!v18 && v10 != v15 + v16);

}

@end
