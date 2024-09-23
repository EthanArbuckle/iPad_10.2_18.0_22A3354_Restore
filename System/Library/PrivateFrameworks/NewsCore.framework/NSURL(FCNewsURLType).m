@implementation NSURL(FCNewsURLType)

- (uint64_t)fc_newsURLType
{
  if ((objc_msgSend(a1, "fc_isNewsTagURL") & 1) != 0)
    return 3;
  if ((objc_msgSend(a1, "fc_isNewsArticleURL") & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "fc_isNewsIssueURL") & 1) != 0)
    return 2;
  if ((objc_msgSend(a1, "fc_isNewsPuzzleURL") & 1) != 0)
    return 5;
  if ((objc_msgSend(a1, "fc_isNewsPuzzleTypeURL") & 1) != 0)
    return 6;
  if (objc_msgSend(a1, "fc_isNewsSportsEventURL"))
    return 4;
  return 0;
}

@end
