@implementation SOSViewsGetAllCurrent

void __SOSViewsGetAllCurrent_block_invoke()
{
  _QWORD context[5];

  sosAllViews = (uint64_t)SOSViewCopyViewSet(0);
  CFSetAddValue((CFMutableSetRef)sosAllViews, CFSTR("KeychainV0"));
  if (sTestViewSet)
  {
    context[0] = MEMORY[0x1E0C809B0];
    context[1] = 3221225472;
    context[2] = __CFSetUnion_block_invoke_6232;
    context[3] = &__block_descriptor_40_e10_v16__0r_v8l;
    context[4] = sosAllViews;
    CFSetApplyFunction((CFSetRef)sTestViewSet, (CFSetApplierFunction)apply_block_1_6233, context);
  }
}

@end
