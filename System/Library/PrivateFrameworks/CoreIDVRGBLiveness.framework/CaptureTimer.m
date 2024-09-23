@implementation CaptureTimer

- (void)scheduledTimerComplete
{
  void (*v3)(uint64_t);
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = &self->completion[7];
  v3 = *(void (**)(uint64_t))&self->completion[7];
  swift_retain();
  if (v3)
  {
    v5 = sub_2139907F4((uint64_t)v3);
    v3(v5);
    sub_2139907E4((uint64_t)v3);
    v6 = *(_QWORD *)&self->completion[7];
  }
  else
  {
    v6 = 0;
  }
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  sub_2139907E4(v6);
  swift_release();
}

@end
