@implementation DKNetworkQualityMonitor

uint64_t __48___DKNetworkQualityMonitor_didStartTrackingNOI___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateInstantQuality");
  objc_msgSend(*(id *)(a1 + 32), "updatePredictionAsync");
  return objc_msgSend(*(id *)(a1 + 32), "updateInterfaceClass");
}

uint64_t __75___DKNetworkQualityMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("predictionsGeneratedAt")))
    return objc_msgSend(*(id *)(a1 + 40), "updatePredictionAsync");
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("discretionaryTrafficInvited")))
    return objc_msgSend(*(id *)(a1 + 40), "updateDiscretionaryTrafficInvited");
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("linkQuality")))
    return objc_msgSend(*(id *)(a1 + 40), "updateInstantQuality");
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("powerCostDL")))
    return objc_msgSend(*(id *)(a1 + 40), "updatePowerCostDL");
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("powerCostUL")))
    return objc_msgSend(*(id *)(a1 + 40), "updatePowerCostUL");
  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("interfaceClass"));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "updateInterfaceClass");
  return result;
}

uint64_t __60___DKNetworkQualityMonitor_synchronouslyReflectCurrentValue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateInstantQuality");
}

@end
