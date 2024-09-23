@implementation SNError

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 message:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  id v15;

  v8 = sub_1D451A6EC();
  v10 = v9;
  v11 = sub_1D451A6EC();
  v13 = v12;
  v14 = a5;
  v15 = sub_1D43EC59C(v8, v10, a4, a5, v11, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 message:(id)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  id v11;

  v7 = sub_1D451A6EC();
  v9 = v8;
  v10 = a4;
  v11 = sub_1D43ECAB8(a3, a4, v7, v9);

  swift_bridgeObjectRelease();
  return v11;
}

+ (void)populateClientError:(id *)a3 withDomain:(id)a4 code:(int64_t)a5 underlyingError:(id)a6 message:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;

  v10 = sub_1D451A6EC();
  v12 = v11;
  v13 = sub_1D451A6EC();
  v15 = v14;
  v16 = a6;
  sub_1D43ECB64(a3, v10, v12, a5, a6, v13, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)wrapClientError:(id *)a3 withDomain:(id)a4 code:(int64_t)a5 message:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v8 = sub_1D451A6EC();
  v10 = v9;
  v11 = sub_1D451A6EC();
  sub_1D43ECC44(a3, v8, v10, a5, v11, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)populateClientError:(id *)a3 withCode:(int64_t)a4 underlyingError:(id)a5 message:(id)a6
{
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v9 = sub_1D451A6EC();
  v11 = v10;
  v12 = a5;
  sub_1D43ECD40(a3, a4, a5, v9, v11);

  swift_bridgeObjectRelease();
}

+ (void)autoreleasepoolWithError:(id *)a3 action:(id)a4
{
  void *v5;
  uint64_t ObjCClassMetadata;

  v5 = _Block_copy(a4);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_1D43ECDE8(a3, ObjCClassMetadata, (void (**)(_QWORD, _QWORD))v5);
}

- (SNError)init
{
  return (SNError *)sub_1D43ECEDC();
}

+ (id)exceptionFromError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = sub_1D4473C08(a3);

  return v5;
}

@end
