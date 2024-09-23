@implementation CertUITrustManager

- (unsigned)rawTrustResultForSSLTrust:(__SecTrust *)a3 hostname:(id)a4 service:(id)a5
{
  id v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __SecTrust *v12;
  unsigned int v13;

  v5 = a5;
  if (!a4)
  {
    v7 = 0;
    v9 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v7 = sub_1A594B40C();
  v9 = v8;
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v10 = sub_1A594B40C();
  v5 = v11;
LABEL_6:
  v12 = a3;
  swift_retain();
  v13 = CertUITrustManager.rawTrustResult(forSSLTrust:hostname:service:)((uint64_t)a3, v7, v9, v10, v5);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13;
}

- (void)allowTrust:(__SecTrust *)a3 forHost:(id)a4 service:(id)a5
{
  id v5;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __SecTrust *v12;
  Swift::String_optional v13;
  Swift::String_optional v14;

  v5 = a5;
  if (!a4)
  {
    v7 = 0;
    v9 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v7 = sub_1A594B40C();
  v9 = v8;
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v10 = sub_1A594B40C();
  v5 = v11;
LABEL_6:
  v12 = a3;
  swift_retain();
  v13.value._countAndFlagsBits = v7;
  v13.value._object = v9;
  v14.value._countAndFlagsBits = v10;
  v14.value._object = v5;
  CertUITrustManager.allow(_:forHost:service:)((SecTrustRef_optional)a3, v13, v14);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
