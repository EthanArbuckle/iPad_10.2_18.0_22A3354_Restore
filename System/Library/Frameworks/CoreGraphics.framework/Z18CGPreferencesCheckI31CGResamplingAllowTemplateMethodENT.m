@implementation Z18CGPreferencesCheckI31CGResamplingAllowTemplateMethodENT

const void *___Z18CGPreferencesCheckI31CGResamplingAllowTemplateMethodENT_10ResultTypeEv_block_invoke()
{
  const void *result;

  result = get_BOOLean_property("CGResamplingAllowTemplateMethod", copy_preference_value, (BOOL *)&CGPreferencesCheck<CGResamplingAllowTemplateMethod>(void)::result);
  if ((result & 1) == 0)
    CGPreferencesCheck<CGResamplingAllowTemplateMethod>(void)::result = 1;
  return result;
}

@end
