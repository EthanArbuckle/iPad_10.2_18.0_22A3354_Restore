@implementation _AppIntentsUserActivityHelper

+ (void)associateAppIntentWithUserActivity:(NSUserActivity *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSUserActivity *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = a1;
  v8 = a3;
  sub_227EDA224((uint64_t)&unk_25593F8E8, (uint64_t)v7);
}

- (_AppIntentsUserActivityHelper)init
{
  return (_AppIntentsUserActivityHelper *)UserActivityHelper.init()();
}

@end
