@implementation FCPromoteHeadlines

uint64_t __FCPromoteHeadlines_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "usesImageOnTopLayout");
}

BOOL __FCPromoteHeadlines_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  _BOOL8 v5;

  v2 = a2;
  if (objc_msgSend(v2, "hasThumbnail"))
  {
    objc_msgSend(v2, "publishDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fc_timeIntervalUntilNow");
    v5 = v4 <= 86400.0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

double __FCPromoteHeadlines_block_invoke_3(uint64_t a1, void *a2)
{
  return FCScoreForHeadline(a2, 1);
}

uint64_t __FCPromoteHeadlines_block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasThumbnail");
}

uint64_t __FCPromoteHeadlines_block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tileProminenceScore");
}

@end
