@implementation NTKMonogramComplication

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return a3 != 3;
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;

  v5 = a4;
  objc_msgSend(a3, "monogram");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "monogram");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    LOBYTE(v8) = 0;
  else
    v8 = objc_msgSend(v6, "isEqualToString:", v7) ^ 1;

  return v8;
}

- (id)ntk_sectionIdentifier
{
  return CFSTR("com.apple.nanotimekit.personalization");
}

@end
