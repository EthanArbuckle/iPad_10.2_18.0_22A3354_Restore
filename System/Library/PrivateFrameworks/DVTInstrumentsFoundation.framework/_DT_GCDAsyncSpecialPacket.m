@implementation _DT_GCDAsyncSpecialPacket

- (_DT_GCDAsyncSpecialPacket)initWithTLSSettings:(id)a3
{
  id v4;
  _DT_GCDAsyncSpecialPacket *v5;
  uint64_t v6;
  NSDictionary *tlsSettings;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DT_GCDAsyncSpecialPacket;
  v5 = -[_DT_GCDAsyncSpecialPacket init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    tlsSettings = v5->tlsSettings;
    v5->tlsSettings = (NSDictionary *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tlsSettings, 0);
}

@end
