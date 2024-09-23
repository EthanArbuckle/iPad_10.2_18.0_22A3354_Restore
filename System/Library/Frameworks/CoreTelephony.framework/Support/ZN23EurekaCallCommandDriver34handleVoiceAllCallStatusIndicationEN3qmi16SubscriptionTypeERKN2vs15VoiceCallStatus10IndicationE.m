@implementation ZN23EurekaCallCommandDriver34handleVoiceAllCallStatusIndicationEN3qmi16SubscriptionTypeERKN2vs15VoiceCallStatus10IndicationE

char *___ZN23EurekaCallCommandDriver34handleVoiceAllCallStatusIndicationEN3qmi16SubscriptionTypeERKN2vs15VoiceCallStatus10IndicationE_block_invoke(uint64_t a1, uint64_t a2)
{
  char *result;

  result = (char *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (result != (char *)a2)
    return std::vector<vs::tlv::CallListItem>::__assign_with_size[abi:ne180100]<vs::tlv::CallListItem*,vs::tlv::CallListItem*>(result, *(char **)a2, *(_QWORD *)(a2 + 8), 0x6DB6DB6DB6DB6DB7 * (*(_QWORD *)(a2 + 8) - *(_QWORD *)a2));
  return result;
}

@end
