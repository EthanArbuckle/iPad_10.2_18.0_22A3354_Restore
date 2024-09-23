@implementation Z15CGDefaultsCheckI37CGPDFPageLayoutSimpleSelectionEnabledENT

const void *___Z15CGDefaultsCheckI37CGPDFPageLayoutSimpleSelectionEnabledENT_10ResultTypeEv_block_invoke()
{
  const void *result;

  result = get_BOOLean_property("CGPDFPageLayoutSimpleSelectionEnabled", (const void *(*)(const char *))copy_local_domain_value, (BOOL *)&CGDefaultsCheck<CGPDFPageLayoutSimpleSelectionEnabled>(void)::result);
  if ((result & 1) == 0)
    CGDefaultsCheck<CGPDFPageLayoutSimpleSelectionEnabled>(void)::result = 1;
  return result;
}

@end
