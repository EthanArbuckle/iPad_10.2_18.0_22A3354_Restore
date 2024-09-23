@implementation ECEmailAddressLists

+ (id)addressListFromHeaderValue:(id)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  v3 = +[ECEmailAddressParser parseString:emailAddressList:](ECEmailAddressParser, "parseString:emailAddressList:", a3, &v8);
  v4 = v8;
  v5 = v4;
  v6 = 0;
  if (v3)
    v6 = v4;

  return v6;
}

@end
