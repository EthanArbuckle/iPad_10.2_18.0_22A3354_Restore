@implementation DASharedTestStatusHelper

+ (id)statusCodeForArchiveError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  char *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  v5 = -999;
  if (v3)
  {
    v6 = (char *)objc_msgSend(v3, "code");
    if ((unint64_t)(v6 - 1) < 0xA)
      v5 = (uint64_t)(v6 - 2010);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));

  return v7;
}

@end
