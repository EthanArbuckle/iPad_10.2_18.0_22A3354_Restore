@implementation SOSCCSendToPeerIsPending

uint64_t __SOSCCSendToPeerIsPending_block_invoke(uint64_t a1)
{
  uint64_t (*v1)(_QWORD, _QWORD);

  if (gSecurityd && (v1 = *(uint64_t (**)(_QWORD, _QWORD))(gSecurityd + 640)) != 0)
    return v1(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  else
    return peer_info_to_BOOL_error_request(0x6Cu, *(_QWORD *)(a1 + 32), *(CFTypeRef **)(a1 + 40));
}

@end
