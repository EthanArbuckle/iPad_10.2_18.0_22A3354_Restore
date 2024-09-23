@implementation ZN27URLConnectionLoader

RedirectionRecorder *___ZN27URLConnectionLoader_Classic24protocolDidFinishLoadingEv_block_invoke(uint64_t a1)
{
  return URLConnectionLoader::protocolDidFinishLoading(*(URLConnectionLoader **)(a1 + 32));
}

URLConnectionLoader *___ZN27URLConnectionLoader_Classic38protocolConditionalRequirementsChangedEh_block_invoke(uint64_t a1)
{
  return URLConnectionLoader::protocolConditionalRequirementsChanged(*(URLConnectionLoader **)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

_QWORD *___ZN27URLConnectionLoader_Classic25protocolConnectionWaitingE40tcp_connection_unmet_conditions_reason_t_block_invoke(uint64_t a1)
{
  return URLConnectionLoader::protocolConnectionWaiting(*(_QWORD **)(a1 + 32), *(_QWORD *)(a1 + 40));
}

URLConnectionLoader *___ZN27URLConnectionLoader_Classic35protocolNeedNewBodyStreamFromOffsetEx_block_invoke(uint64_t a1)
{
  return URLConnectionLoader::protocolNeedNewBodyStreamFromOffset(*(URLConnectionLoader **)(a1 + 32), *(_QWORD *)(a1 + 40));
}

URLConnectionLoader *___ZN27URLConnectionLoader_Classic25protocolNeedNewBodyStreamEv_block_invoke(uint64_t a1)
{
  return URLConnectionLoader::protocolNeedNewBodyStream(*(URLConnectionLoader **)(a1 + 32));
}

@end
