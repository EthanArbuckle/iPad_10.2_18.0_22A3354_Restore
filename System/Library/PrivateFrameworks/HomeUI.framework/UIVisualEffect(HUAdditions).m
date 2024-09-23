@implementation UIVisualEffect(HUAdditions)

+ (id)hu_dashboardBarEffects
{
  if (_MergedGlobals_636 != -1)
    dispatch_once(&_MergedGlobals_636, &__block_literal_global_5_2);
  return (id)qword_1ED580C08;
}

+ (id)hu_gridCellBackgroundOffEffects
{
  if (qword_1ED580C20 != -1)
    dispatch_once(&qword_1ED580C20, &__block_literal_global_20_4);
  return (id)qword_1ED580C28;
}

+ (id)hu_gridCellBackgroundOnEffects
{
  if (qword_1ED580C30 != -1)
    dispatch_once(&qword_1ED580C30, &__block_literal_global_24_4);
  return (id)qword_1ED580C38;
}

+ (id)hu_categoryDashboardBackgroundEffects
{
  if (qword_1ED580C10 != -1)
    dispatch_once(&qword_1ED580C10, &__block_literal_global_13_2);
  return (id)qword_1ED580C18;
}

@end
