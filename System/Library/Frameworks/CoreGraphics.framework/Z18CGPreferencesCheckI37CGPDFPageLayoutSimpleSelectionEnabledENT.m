@implementation Z18CGPreferencesCheckI37CGPDFPageLayoutSimpleSelectionEnabledENT

const void *___Z18CGPreferencesCheckI37CGPDFPageLayoutSimpleSelectionEnabledENT_10ResultTypeEv_block_invoke()
{
  const void *result;

  result = get_BOOLean_property("CGPDFPageLayoutSimpleSelectionEnabled", copy_preference_value, (BOOL *)&CGPreferencesCheck<CGPDFPageLayoutSimpleSelectionEnabled>(void)::result);
  if ((result & 1) == 0)
    CGPreferencesCheck<CGPDFPageLayoutSimpleSelectionEnabled>(void)::result = 1;
  return result;
}

@end
