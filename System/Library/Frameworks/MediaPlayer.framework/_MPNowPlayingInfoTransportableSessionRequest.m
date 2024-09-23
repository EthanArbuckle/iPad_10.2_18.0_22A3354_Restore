@implementation _MPNowPlayingInfoTransportableSessionRequest

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)preferredSessionType
{
  return self->_preferredSessionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSessionType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)requestWithIdentifier:(id)a3 preferredSessionType:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  v9 = objc_msgSend(v7, "copy");

  v10 = (void *)v8[1];
  v8[1] = v9;

  v11 = objc_msgSend(v6, "copy");
  v12 = (void *)v8[2];
  v8[2] = v11;

  return v8;
}

@end
