@implementation BBBulletin(Date)

- (id)dateOrRecencyDate
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "recencyDate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)publishDate
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "recencyDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "date");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

@end
