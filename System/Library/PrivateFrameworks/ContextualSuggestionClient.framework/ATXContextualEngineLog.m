@implementation ATXContextualEngineLog

+ (OS_os_log)oslog
{
  if (qword_2542CE158 != -1)
    swift_once();
  return (OS_os_log *)(id)qword_2542CE150;
}

- (ATXContextualEngineLog)init
{
  ATXContextualEngineLog *result;

  result = (ATXContextualEngineLog *)sub_2384DFD30();
  __break(1u);
  return result;
}

@end
