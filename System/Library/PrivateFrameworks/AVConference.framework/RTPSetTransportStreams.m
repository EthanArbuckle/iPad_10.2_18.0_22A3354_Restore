@implementation RTPSetTransportStreams

void __RTPSetTransportStreams_block_invoke(uint64_t a1, uint64_t a2)
{
  _RTPTransportStreamRTPAndBBNoteCallback(*(_QWORD *)(a1 + 32), a2, 0);
}

uint64_t __RTPSetTransportStreams_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return _RTPTransportStreamRTCPCallback(*(_QWORD *)(a1 + 32), a2);
}

void __RTPSetTransportStreams_block_invoke_3(uint64_t a1, uint64_t a2)
{
  _RTPTransportStreamRTPAndBBNoteCallback(*(_QWORD *)(a1 + 32), a2, 1);
}

@end
