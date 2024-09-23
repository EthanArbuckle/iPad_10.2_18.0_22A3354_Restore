@implementation SOSCCRejectApplicants

uint64_t __SOSCCRejectApplicants_block_invoke(uint64_t a1)
{
  uint64_t (*v1)(_QWORD, _QWORD);

  if (gSecurityd && (v1 = *(uint64_t (**)(_QWORD, _QWORD))(gSecurityd + 368)) != 0)
    return v1(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  else
    return info_array_to_BOOL_error_request(0x3Eu, *(_QWORD *)(a1 + 32), *(CFTypeRef **)(a1 + 40));
}

@end
