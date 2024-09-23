@implementation WKRemoteObjectRegistry

void __41___WKRemoteObjectRegistry__invokeMethod___block_invoke(_QWORD *a1, uint64_t a2)
{
  WKRemoteObjectEncoder *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];
  __int128 v13;
  _QWORD v14[2];

  v4 = objc_alloc_init(WKRemoteObjectEncoder);
  -[WKRemoteObjectEncoder encodeObject:forKey:](v4, "encodeObject:forKey:", a2, CFSTR("invocation"));
  v5 = *(_QWORD *)(a1[5] + 8);
  if (v5)
  {
    v6 = a1[6];
    v7 = -[WKRemoteObjectEncoder rootObjectDictionary](v4, "rootObjectDictionary");
    v8 = v7;
    if (v7)
      CFRetain(*(CFTypeRef *)(v7 + 8));
    v11 = v8;
    v12[0] = v6;
    v12[1] = &v11;
    v14[0] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 56))(v5);
    v14[1] = v9;
    *(_QWORD *)&v13 = v12;
    *((_QWORD *)&v13 + 1) = v5;
    WTF::switchOn<std::variant<std::reference_wrapper<WebKit::WebProcessProxy>,std::reference_wrapper<WebKit::WebPage>>,void WebKit::RemoteObjectRegistry::send<Messages::RemoteObjectRegistry::CallReplyBlock>(Messages::RemoteObjectRegistry::CallReplyBlock &&)::{lambda(Messages::RemoteObjectRegistry::CallReplyBlock)#1}>((uint64_t)v14, &v13);
    v10 = v11;
    v11 = 0;
    if (v10)
      CFRelease(*(CFTypeRef *)(v10 + 8));
  }
  *(_BYTE *)(a1[7] + 24) = 1;
  if (v4)
    CFRelease(v4);
}

@end
