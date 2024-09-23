@implementation AMSRBSKeepAlive

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_2_26();
}

+ (id)keepAliveWithName:(id)a3 style:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = sub_18CEC181C();
  v7 = v6;
  swift_getObjCClassMetadata();
  sub_18C894A80(v5, v7, a4);
  v9 = v8;
  swift_bridgeObjectRelease();
  return v9;
}

- (void)invalidate
{
  AMSRBSKeepAlive *v2;

  v2 = self;
  sub_18C894DE0();

}

- (NSString)name
{
  void *v2;

  sub_18C966B08();
  v2 = (void *)sub_18CEC17F8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)style
{
  return sub_18C966B60();
}

+ (id)keepAliveWithName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = sub_18CEC181C();
  v5 = v4;
  swift_getObjCClassMetadata();
  sub_18C966B70(v3, v5);
  v7 = v6;
  swift_bridgeObjectRelease();
  return v7;
}

+ (void)keepAliveWithName:(id)a3 style:(int64_t)a4 block:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];

  v6 = _Block_copy(a5);
  v7 = sub_18CEC181C();
  v9[2] = v6;
  sub_18C966C10(v7, v8, a4, (void (*)(uint64_t))sub_18C8CDCFC, (uint64_t)v9);
  _Block_release(v6);
  swift_bridgeObjectRelease();
}

+ (void)keepAliveWithName:(id)a3 style:(int64_t)a4 qosOverrideIfRBManaged:(unsigned int)a5 relativePriority:(int64_t)a6 block:(id)a7
{
  uint64_t v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];

  v8 = *(_QWORD *)&a5;
  v10 = _Block_copy(a7);
  v11 = sub_18CEC181C();
  v13[2] = v10;
  sub_18C966D60(v11, v12, a4, v8, a6, (void (*)(uint64_t))sub_18C8CDD28, (uint64_t)v13);
  _Block_release(v10);
  swift_bridgeObjectRelease();
}

- (AMSRBSKeepAlive)init
{
  sub_18C966F38();
}

@end
