@implementation CESRPhoneticEmbedder

- (void).cxx_destruct
{
  swift_getObjectType();
  swift_release();
  sub_1B3E6818C();
}

- (CESRPhoneticEmbedder)initWithLocaleIdentifier:(id)a3 clientID:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  CESRPhoneticEmbedder *v14;

  swift_getObjectType();
  v4 = a3;
  v5 = a4;
  v10 = sub_1B3F6FA64();
  v11 = v6;
  v7 = sub_1B3F6FA64();
  v14 = (CESRPhoneticEmbedder *)CESRPhoneticEmbedder.init(localeIdentifier:clientID:)(v10, v11, v7, v8);

  return v14;
}

- (void)findAlternativesForString:(NSString *)a3 maxResults:(int64_t)a4 completion:(id)a5
{
  NSString *v5;
  CESRPhoneticEmbedder *v6;
  _QWORD *v7;
  void *v11;

  swift_getObjectType();
  v5 = a3;
  v11 = _Block_copy(a5);
  v6 = self;
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = a4;
  v7[4] = v11;
  v7[5] = self;
  sub_1B3F2B84C((uint64_t)&unk_1EF085B50, (uint64_t)v7);
}

- (CESRPhoneticEmbedder)init
{
  swift_getObjectType();
  return (CESRPhoneticEmbedder *)CESRPhoneticEmbedder.init()();
}

@end
