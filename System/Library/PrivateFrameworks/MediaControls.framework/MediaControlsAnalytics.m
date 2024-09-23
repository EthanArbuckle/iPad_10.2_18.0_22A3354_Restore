@implementation MediaControlsAnalytics

+ (void)coreAnalyticsPostAnalyticKind:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 9:
      AnalyticsSendEventLazy();
      break;
    default:
      return;
  }
}

void *__56__MediaControlsAnalytics_coreAnalyticsPostAnalyticKind___block_invoke()
{
  return &unk_1E5878660;
}

void *__56__MediaControlsAnalytics_coreAnalyticsPostAnalyticKind___block_invoke_2()
{
  return &unk_1E5878688;
}

void *__56__MediaControlsAnalytics_coreAnalyticsPostAnalyticKind___block_invoke_3()
{
  return &unk_1E58786B0;
}

void *__56__MediaControlsAnalytics_coreAnalyticsPostAnalyticKind___block_invoke_4()
{
  return &unk_1E58786D8;
}

void *__56__MediaControlsAnalytics_coreAnalyticsPostAnalyticKind___block_invoke_5()
{
  return &unk_1E5878700;
}

void *__56__MediaControlsAnalytics_coreAnalyticsPostAnalyticKind___block_invoke_6()
{
  return &unk_1E5878728;
}

void *__56__MediaControlsAnalytics_coreAnalyticsPostAnalyticKind___block_invoke_7()
{
  return &unk_1E5878750;
}

void *__56__MediaControlsAnalytics_coreAnalyticsPostAnalyticKind___block_invoke_8()
{
  return &unk_1E5878778;
}

+ (void)postAnalyticKind:(int64_t)a3
{
  __CFString *v4;

  +[MediaControlsAnalytics coreAnalyticsPostAnalyticKind:](MediaControlsAnalytics, "coreAnalyticsPostAnalyticKind:");
  if ((unint64_t)a3 > 9)
    v4 = 0;
  else
    v4 = off_1E5819FF8[a3];
  if (-[__CFString length](v4, "length"))
    ADClientAddValueForScalarKey();
}

@end
