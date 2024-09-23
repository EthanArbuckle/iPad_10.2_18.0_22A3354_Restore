@implementation Z18CGPreferencesCheckI37CGImageMarkAllowTemplateMethodIntegerENT

const void *___Z18CGPreferencesCheckI37CGImageMarkAllowTemplateMethodIntegerENT_10ResultTypeEv_block_invoke()
{
  const void *result;

  result = get_BOOLean_property("CGImageMarkAllowTemplateMethodInteger", copy_preference_value, (BOOL *)&CGPreferencesCheck<CGImageMarkAllowTemplateMethodInteger>(void)::result);
  if ((result & 1) == 0)
    CGPreferencesCheck<CGImageMarkAllowTemplateMethodInteger>(void)::result = 1;
  return result;
}

@end
