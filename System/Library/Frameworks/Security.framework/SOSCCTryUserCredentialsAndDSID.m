@implementation SOSCCTryUserCredentialsAndDSID

uint64_t __SOSCCTryUserCredentialsAndDSID_internal_block_invoke(uint64_t a1)
{
  uint64_t (*v1)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;

  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(gSecurityd + 192);
    if (v1)
      return v1(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
  {
    SOSErrorCreate(1045, *(CFTypeRef **)(a1 + 56), 0, CFSTR("user_label is nil"));
    return 0;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (!v4)
  {
    SOSErrorCreate(1045, *(CFTypeRef **)(a1 + 56), 0, CFSTR("user_password is nil"));
    return 0;
  }
  if (*(_QWORD *)(a1 + 48))
    v5 = *(const __CFString **)(a1 + 48);
  else
    v5 = &stru_1E1FDD448;
  return label_and_password_and_dsid_to_BOOL_error_request(0x2Cu, v3, v4, (uint64_t)v5, *(CFTypeRef **)(a1 + 56));
}

@end
