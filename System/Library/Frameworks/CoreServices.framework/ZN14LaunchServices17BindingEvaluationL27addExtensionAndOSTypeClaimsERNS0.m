@implementation ZN14LaunchServices17BindingEvaluationL27addExtensionAndOSTypeClaimsERNS0

uint64_t **___ZN14LaunchServices17BindingEvaluationL27addExtensionAndOSTypeClaimsERNS0_5StateE_block_invoke(uint64_t **result, int a2, int a3)
{
  uint64_t **v4;
  uint64_t v5;
  unsigned int v6;

  v4 = result;
  v5 = result[4][1];
  if (*(_DWORD *)(v5 + 24) != a2)
  {
    *(_DWORD *)(v5 + 24) = a2;
    result = (uint64_t **)_LSDatabaseFindBindingMapIndex(*(_QWORD *)*result[6], a2);
    *(_DWORD *)(v4[5][1] + 24) = (_DWORD)result;
  }
  v6 = *(_DWORD *)(v4[5][1] + 24);
  if (v6 != -1 && v6 != 2)
    return LaunchServices::BindingEvaluation::addClaimsInBindingMap((uint64_t **)v4[6], v6, a3);
  return result;
}

@end
