@implementation NPKProtoCanSendMessage

void __NPKProtoCanSendMessage_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  id v7;

  v7 = a2;
  v6 = objc_msgSend(v7, "isActive");
  if (v6)
    LOBYTE(v6) = objc_msgSend(v7, "isConnected");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

@end
