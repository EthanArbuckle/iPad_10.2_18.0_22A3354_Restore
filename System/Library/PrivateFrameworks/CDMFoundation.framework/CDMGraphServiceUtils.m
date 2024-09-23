@implementation CDMGraphServiceUtils

+ (void)setupGraphServices:(NSArray *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSArray *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)OUTLINED_FUNCTION_28_1();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = a1;
  v8 = a3;
  sub_21A37FC8C((uint64_t)&unk_2550D6F08, (uint64_t)v7);
}

- (CDMGraphServiceUtils)init
{
  return (CDMGraphServiceUtils *)sub_21A37FD64();
}

@end
