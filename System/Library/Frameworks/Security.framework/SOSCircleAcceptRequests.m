@implementation SOSCircleAcceptRequests

void __SOSCircleAcceptRequests_block_invoke(uint64_t a1, void *value)
{
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = SOSCircleAcceptRequest(*(const __CFSet ***)(a1 + 40), *(__SecKey **)(a1 + 48), *(_QWORD *)(a1 + 56), value, *(CFTypeRef **)(a1 + 64));
  v5 = secLogObjForScope("circle");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      v7 = 138412290;
      v8 = value;
      _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "Accepted peer: %@", (uint8_t *)&v7, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else if (v6)
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "error in SOSCircleAcceptRequest\n", (uint8_t *)&v7, 2u);
  }
}

@end
