@implementation APSPubSubPowerLog

void __APSPubSubPowerLog_block_invoke()
{
  if (PowerLogSubsystem_block_invoke__pred_PPSCreateTelemetryIdentifierPowerLog != -1)
    dispatch_once(&PowerLogSubsystem_block_invoke__pred_PPSCreateTelemetryIdentifierPowerLog, &__block_literal_global_124);
  if (PowerLogSubsystem_block_invoke__PPSCreateTelemetryIdentifier)
    APSPubSubPowerLog_streamID = PowerLogSubsystem_block_invoke__PPSCreateTelemetryIdentifier(CFSTR("APSD"), CFSTR("PubSub"));
}

uint64_t (*__APSPubSubPowerLog_block_invoke_2())(_QWORD, _QWORD)
{
  uint64_t (*result)(_QWORD, _QWORD);

  result = (uint64_t (*)(_QWORD, _QWORD))CUTWeakLinkSymbol();
  PowerLogSubsystem_block_invoke__PPSCreateTelemetryIdentifier = result;
  return result;
}

uint64_t (*__APSPubSubPowerLog_block_invoke_3())(_QWORD, _QWORD)
{
  uint64_t (*result)(_QWORD, _QWORD);

  result = (uint64_t (*)(_QWORD, _QWORD))CUTWeakLinkSymbol();
  APSPubSubPowerLog__PPSSendTelemetry = result;
  return result;
}

@end
