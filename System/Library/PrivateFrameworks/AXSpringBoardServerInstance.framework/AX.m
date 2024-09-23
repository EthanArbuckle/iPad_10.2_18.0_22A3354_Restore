@implementation AX

uint64_t __95__AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride__processEventForVOSpeakage___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetBoolValue:forKey:", 1, CFSTR("TripleClickSpeakWaited"));
  return objc_msgSend(*(id *)(a1 + 32), "_tripleClickSpeakMenuProcessTouch:", *(_QWORD *)(a1 + 40));
}

@end
