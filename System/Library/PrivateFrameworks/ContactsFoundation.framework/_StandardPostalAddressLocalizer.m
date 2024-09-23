@implementation _StandardPostalAddressLocalizer

- (id)localizedStringForPostalAddressString:(id)a3 returningNilIfNotFound:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;

  v4 = a4;
  v5 = GetBundle_cn_once_token_1;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&GetBundle_cn_once_token_1, &__block_literal_global_56);
  v7 = (id)GetBundle_cn_once_object_1;
  +[CNLocalization localizedStringForString:bundle:table:returningNilIfNotFound:](CNLocalization, "localizedStringForString:bundle:table:returningNilIfNotFound:", v6, v7, CFSTR("CNPostalAddressValues"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
