@implementation NSLocale

- (BOOL)isCJKLocale
{
  void *v3;
  unsigned __int8 v4;

  if (qword_100088D28 != -1)
    dispatch_once(&qword_100088D28, &stru_100068F48);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSLocale localeIdentifier](self, "localeIdentifier"));
  v4 = objc_msgSend((id)qword_100088D20, "containsObject:", v3);

  return v4;
}

@end
