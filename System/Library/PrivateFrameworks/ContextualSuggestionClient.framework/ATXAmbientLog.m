@implementation ATXAmbientLog

+ (OS_os_log)log
{
  if (qword_2542CE3A8 != -1)
    swift_once();
  return (OS_os_log *)(id)qword_2542CE3A0;
}

- (ATXAmbientLog)init
{
  ATXAmbientLog *result;

  result = (ATXAmbientLog *)sub_2384DFD30();
  __break(1u);
  return result;
}

@end
