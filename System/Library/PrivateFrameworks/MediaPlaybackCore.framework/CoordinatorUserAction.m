@implementation CoordinatorUserAction

- (id)identifier
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_9_0();
  return OUTLINED_FUNCTION_66_0(v0);
}

- (uint64_t)setIdentifier:
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 16) = OUTLINED_FUNCTION_87_3();
  *(_QWORD *)(v0 + 24) = v1;
  OUTLINED_FUNCTION_67_0();
  swift_release();
  return OUTLINED_FUNCTION_10_0();
}

- (id)options
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)sub_210E92B00();
  OUTLINED_FUNCTION_2_1();
  return OUTLINED_FUNCTION_66_0(v0);
}

- (uint64_t)setOptions:(uint64_t)a1
{
  *(_QWORD *)(a1 + 48) = sub_210E92B18();
  OUTLINED_FUNCTION_67_0();
  swift_release();
  return OUTLINED_FUNCTION_10_0();
}

- (id)sourceID
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_9_0();
  return OUTLINED_FUNCTION_66_0(v0);
}

- (uint64_t)setSourceID:
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 64) = OUTLINED_FUNCTION_87_3();
  *(_QWORD *)(v0 + 72) = v1;
  OUTLINED_FUNCTION_67_0();
  swift_release();
  return OUTLINED_FUNCTION_10_0();
}

@end
