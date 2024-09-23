@implementation CMSMAP

NSObject *__CMSMAP_StartDisconnectAirPlayScreenTimer_block_invoke(uint64_t a1)
{
  double v1;
  NSObject *v2;
  NSObject *result;

  v1 = *(float *)(a1 + 32);
  v2 = MXGetSerialQueue();
  result = FigRoutingManagerCreateOneShotTimer(v2, v1, (uint64_t)&__block_literal_global_25, 0, 0);
  qword_1EE2B3CB8 = (uint64_t)result;
  return result;
}

void __CMSMAP_StopDisconnectAirPlayScreenTimer_block_invoke()
{
  if (qword_1EE2B3CB8)
  {
    dispatch_source_cancel((dispatch_source_t)qword_1EE2B3CB8);
    if (qword_1EE2B3CB8)
    {
      dispatch_release((dispatch_object_t)qword_1EE2B3CB8);
      qword_1EE2B3CB8 = 0;
    }
  }
}

NSObject *__CMSMAP_StartRouteAwayFromAirPlayHandoffTimer_block_invoke(uint64_t a1)
{
  double v1;
  NSObject *v2;
  NSObject *result;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __CMSMAP_StartRouteAwayFromAirPlayHandoffTimer_block_invoke_2;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = *(_QWORD *)(a1 + 32);
  v1 = *(float *)(a1 + 40);
  v2 = MXGetSerialQueue();
  result = FigRoutingManagerCreateOneShotTimer(v2, v1, (uint64_t)v4, 0, 0);
  qword_1EE2B3CC0 = (uint64_t)result;
  return result;
}

uint64_t __CMSMAP_StartRouteAwayFromAirPlayHandoffTimer_block_invoke_2(uint64_t a1)
{
  return CMSMAP_MakeAirPlayHandOffPortRoutable(0, *(_QWORD *)(a1 + 32));
}

void __CMSMAP_StopRouteAwayFromAirPlayHandoffTimer_block_invoke()
{
  if (qword_1EE2B3CC0)
  {
    dispatch_source_cancel((dispatch_source_t)qword_1EE2B3CC0);
    if (qword_1EE2B3CC0)
    {
      dispatch_release((dispatch_object_t)qword_1EE2B3CC0);
      qword_1EE2B3CC0 = 0;
    }
  }
}

@end
