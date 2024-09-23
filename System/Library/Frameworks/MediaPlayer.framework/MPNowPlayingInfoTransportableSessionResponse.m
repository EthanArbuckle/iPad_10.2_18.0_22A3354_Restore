@implementation MPNowPlayingInfoTransportableSessionResponse

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPNowPlayingInfoTransportableSessionResponse;
  return -[MPNowPlayingInfoTransportableSessionResponse init](&v3, sel_init);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)sessionType
{
  return self->_sessionType;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_sessionType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)responseWithIdentifier:(id)a3 sessionType:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  v12 = objc_msgSend(v10, "copy");

  v13 = (void *)v11[1];
  v11[1] = v12;

  v14 = objc_msgSend(v9, "copy");
  v15 = (void *)v11[2];
  v11[2] = v14;

  v16 = (void *)v11[3];
  v11[3] = v8;

  return v11;
}

@end
