@implementation PHAsset(Investigation_)

- (id)cls_localDateComponents
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "creationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localCreationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSCalendar dateComponentsWithUTCDate:localDate:](CLSCalendar, "dateComponentsWithUTCDate:localDate:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
