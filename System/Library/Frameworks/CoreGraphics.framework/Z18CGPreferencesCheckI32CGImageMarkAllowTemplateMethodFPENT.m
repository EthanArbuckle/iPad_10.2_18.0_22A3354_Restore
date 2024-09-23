@implementation Z18CGPreferencesCheckI32CGImageMarkAllowTemplateMethodFPENT

const void *___Z18CGPreferencesCheckI32CGImageMarkAllowTemplateMethodFPENT_10ResultTypeEv_block_invoke()
{
  const void *result;

  result = get_BOOLean_property("CGImageMarkAllowTemplateMethodFP", copy_preference_value, (BOOL *)&CGPreferencesCheck<CGImageMarkAllowTemplateMethodFP>(void)::result);
  if ((result & 1) == 0)
    CGPreferencesCheck<CGImageMarkAllowTemplateMethodFP>(void)::result = 1;
  return result;
}

@end
