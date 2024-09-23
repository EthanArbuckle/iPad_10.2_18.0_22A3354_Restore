@implementation CrashDetector

- (void)willTerminate
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = qword_1ED1CFC08;
  swift_retain();
  if (v3 != -1)
    swift_once();
  v4 = (id)qword_1ED1CE7B0;
  sub_1A5F64454();
  sub_1A5F63F80();

  v5 = *(void **)self->userDefaults;
  v6 = (id)sub_1A5F6410C();
  objc_msgSend(v5, sel_setBool_forKey_, 1, v6);
  swift_release();

}

@end
