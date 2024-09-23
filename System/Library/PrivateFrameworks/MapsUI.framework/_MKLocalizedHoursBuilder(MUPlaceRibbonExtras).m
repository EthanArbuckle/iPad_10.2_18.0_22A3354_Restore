@implementation _MKLocalizedHoursBuilder(MUPlaceRibbonExtras)

- (__CFString)ribbonSummaryForOpeningState
{
  unint64_t v2;
  __CFString *v3;

  v2 = objc_msgSend(a1, "state");
  if (v2 < 5 || v2 == 6)
  {
    objc_msgSend(a1, "localizedOperatingHours");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v2 == 5)
  {
    _MULocalizedStringFromThisBundle(CFSTR("Open [Ribbon]"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E2E05448;
  }
  return v3;
}

@end
