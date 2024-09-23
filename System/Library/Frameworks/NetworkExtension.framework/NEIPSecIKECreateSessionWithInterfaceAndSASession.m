@implementation NEIPSecIKECreateSessionWithInterfaceAndSASession

uint64_t __NEIPSecIKECreateSessionWithInterfaceAndSASession_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, a3, a4, a5);
}

uint64_t __NEIPSecIKECreateSessionWithInterfaceAndSASession_block_invoke_238(_QWORD *a1)
{
  NEIKEv2Session *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = [NEIKEv2Session alloc];
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = NEIPSecIKECopyDefaultSessionQueue();
  v7 = -[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saSession:packetDelegate:](v2, "initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saSession:packetDelegate:", v3, v4, v5, v6, a1[10], a1[8], a1[7], 0);
  v8 = *(_QWORD *)(a1[9] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "setClientCallback:", a1[11]);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "setClientCallbackInfo:", a1[12]);
}

@end
