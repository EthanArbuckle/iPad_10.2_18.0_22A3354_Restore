@implementation PlatformDisplayLink.DisplayLinkTarget

- (void)frame:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void (*v8)(double, double);
  double v9;
  uint64_t v10;

  v4 = a3;
  swift_retain(self);
  objc_msgSend(v4, "timestamp");
  v6 = v5;
  objc_msgSend(v4, "duration");
  v8 = *(void (**)(double, double))self->callback;
  if (v8)
  {
    v9 = v7;
    v10 = *(_QWORD *)&self->callback[8];
    swift_retain(v10);
    v8(v6, v9);
    sub_100010630((uint64_t)v8, v10);
  }

  swift_release(self);
}

@end
