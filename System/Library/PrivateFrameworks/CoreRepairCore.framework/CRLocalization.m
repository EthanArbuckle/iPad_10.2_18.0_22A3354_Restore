@implementation CRLocalization

+ (id)localizedStringWithKey:(id)a3
{
  const char *v3;
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (qword_254D7B0E8 != -1)
    dispatch_once(&qword_254D7B0E8, &unk_24D1AA8A0);
  if (qword_254D7B0E0)
  {
    objc_msgSend_localizedStringForKey_value_table_((void *)qword_254D7B0E0, v3, (uint64_t)v4, (uint64_t)&stru_24D1AB488, CFSTR("Localizable-Release"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

@end
