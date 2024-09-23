@implementation CNLocalization

+ (id)localizedStringForString:(id)a3 class:(Class)a4 returningNilIfNotFound:(BOOL)a5
{
  return (id)objc_msgSend(a1, "localizedStringForString:class:lookupBlock:returningNilIfNotFound:", a3, a4, 0, a5);
}

+ (id)localizedStringForString:(id)a3 class:(Class)a4 lookupBlock:(id)a5 returningNilIfNotFound:(BOOL)a6
{
  _BOOL8 v6;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a6;
  v10 = (void *)MEMORY[0x1E0CB34D0];
  v11 = a5;
  v12 = a3;
  objc_msgSend(v10, "bundleForClass:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedStringForString:bundle:table:lookupBlock:returningNilIfNotFound:", v12, v13, v14, v11, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)localizedStringForString:(id)a3 bundle:(id)a4 table:(id)a5 lookupBlock:(id)a6 returningNilIfNotFound:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v14)
    (*((void (**)(id, id, id, id))v14 + 2))(v14, v12, v11, v13);
  else
    objc_msgSend(v12, "localizedStringForKey:value:table:", v11, CFSTR("__ABUnlocalizedString"), v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("__ABUnlocalizedString")))
  {
    if (a7)
      v17 = 0;
    else
      v17 = v11;

    v16 = v17;
  }

  return v16;
}

+ (id)localizedStringForString:(id)a3 bundle:(id)a4 table:(id)a5 returningNilIfNotFound:(BOOL)a6
{
  return (id)objc_msgSend(a1, "localizedStringForString:bundle:table:lookupBlock:returningNilIfNotFound:", a3, a4, a5, 0, a6);
}

+ (id)localizedStringForInteger:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringFromNumber:numberStyle:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
