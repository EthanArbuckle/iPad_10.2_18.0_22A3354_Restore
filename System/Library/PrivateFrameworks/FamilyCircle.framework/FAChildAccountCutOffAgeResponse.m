@implementation FAChildAccountCutOffAgeResponse

- (NSString)childCutOffAgeLocalized
{
  FAChildAccountCutOffAgeResponse *v2;
  void *v3;

  v2 = self;
  sub_1CAEF3610();

  v3 = (void *)sub_1CAF203DC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)childCutOffAge
{
  FAChildAccountCutOffAgeResponse *v2;
  id v3;

  v2 = self;
  v3 = sub_1CAEF3774();

  return (int64_t)v3;
}

- (FAChildAccountCutOffAgeResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  void *v4;
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v4 = a4;
  if (a4)
  {
    v6 = a3;
    v7 = v4;
    v4 = (void *)sub_1CAF200F4();
    v9 = v8;

  }
  else
  {
    v10 = a3;
    v9 = 0xF000000000000000;
  }
  return (FAChildAccountCutOffAgeResponse *)FAChildAccountCutOffAgeResponse.init(httpResponse:data:)(a3, (uint64_t)v4, v9);
}

- (FAChildAccountCutOffAgeResponse)initWithHTTPResponse:(id)a3 data:(id)a4 bodyIsPlist:(BOOL)a5
{
  void *v6;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v6 = a4;
  if (a4)
  {
    v8 = a3;
    v9 = v6;
    v6 = (void *)sub_1CAF200F4();
    v11 = v10;

  }
  else
  {
    v12 = a3;
    v11 = 0xF000000000000000;
  }
  return (FAChildAccountCutOffAgeResponse *)FAChildAccountCutOffAgeResponse.init(httpResponse:data:bodyIsPlist:)(a3, (uint64_t)v6, v11, a5);
}

- (FAChildAccountCutOffAgeResponse)initWithHTTPResponse:(id)a3 data:(id)a4 mediaType:(id)a5
{
  void *v6;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;

  v6 = a4;
  if (!a4)
  {
    v16 = a3;
    v17 = a5;
    v12 = 0xF000000000000000;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    v15 = 0;
    return (FAChildAccountCutOffAgeResponse *)FAChildAccountCutOffAgeResponse.init(httpResponse:data:mediaType:)(a3, (uint64_t)v6, v12, v13, v15);
  }
  v8 = a3;
  v9 = a5;
  v10 = v6;
  v6 = (void *)sub_1CAF200F4();
  v12 = v11;

  if (!a5)
    goto LABEL_5;
LABEL_3:
  v13 = sub_1CAF20400();
  v15 = v14;

  return (FAChildAccountCutOffAgeResponse *)FAChildAccountCutOffAgeResponse.init(httpResponse:data:mediaType:)(a3, (uint64_t)v6, v12, v13, v15);
}

- (FAChildAccountCutOffAgeResponse)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FAChildAccountCutOffAgeResponse();
  return -[FAChildAccountCutOffAgeResponse init](&v3, sel_init);
}

@end
