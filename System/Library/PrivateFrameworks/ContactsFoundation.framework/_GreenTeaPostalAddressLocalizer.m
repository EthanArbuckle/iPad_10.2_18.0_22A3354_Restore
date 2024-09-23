@implementation _GreenTeaPostalAddressLocalizer

- (id)localizedStringForPostalAddressString:(id)a3 returningNilIfNotFound:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  if (GetBundle_cn_once_token_1 != -1)
    dispatch_once(&GetBundle_cn_once_token_1, &__block_literal_global_56);
  +[CNLocalization localizedStringForString:bundle:table:returningNilIfNotFound:](CNLocalization, "localizedStringForString:bundle:table:returningNilIfNotFound:", v5, GetBundle_cn_once_object_1, CFSTR("CNPostalAddressValues_cn"), 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    if (GetBundle_cn_once_token_1 != -1)
      dispatch_once(&GetBundle_cn_once_token_1, &__block_literal_global_56);
    +[CNLocalization localizedStringForString:bundle:table:returningNilIfNotFound:](CNLocalization, "localizedStringForString:bundle:table:returningNilIfNotFound:", v5, GetBundle_cn_once_object_1, CFSTR("CNPostalAddressValues"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
