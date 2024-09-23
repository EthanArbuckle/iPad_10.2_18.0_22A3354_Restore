@implementation AudioSessionCreateCoreMXSession

uint64_t __AudioSessionCreateCoreMXSession_block_invoke(uint64_t a1)
{
  _OWORD *v2;
  __int128 v3;
  uint64_t v4;
  _QWORD *v5;
  _OWORD *v6;
  __int128 v7;
  uint64_t result;
  _OWORD v9[2];
  char v10;
  audit_token_t atoken;

  v2 = *(_OWORD **)(a1 + 40);
  v3 = v2[1];
  *(_OWORD *)atoken.val = *v2;
  *(_OWORD *)&atoken.val[4] = v3;
  v4 = audit_token_to_pid(&atoken);
  v6 = *(_OWORD **)(a1 + 40);
  v5 = *(_QWORD **)(a1 + 48);
  v7 = v6[1];
  v9[0] = *v6;
  v9[1] = v7;
  v10 = 1;
  result = AudioSessionCreateSession(v4, (uint64_t)v9, *(unsigned int *)(a1 + 64), v5, *(_DWORD **)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
