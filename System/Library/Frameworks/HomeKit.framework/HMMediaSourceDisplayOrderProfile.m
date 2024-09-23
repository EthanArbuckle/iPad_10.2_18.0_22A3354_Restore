@implementation HMMediaSourceDisplayOrderProfile

- (_TtC7HomeKit32HMMediaSourceDisplayOrderProfile)initWithTelevisionProfile:(id)a3
{
  id v3;
  char *v4;

  v3 = a3;
  v4 = sub_19B1E82C4(v3);

  return (_TtC7HomeKit32HMMediaSourceDisplayOrderProfile *)v4;
}

- (_TtC7HomeKit32HMMediaSourceDisplayOrderProfile)initWithAccessoryProfile:(id)a3
{
  id v3;

  v3 = a3;
  sub_19B1E8404();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_televisionProfile));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_displayOrderProfileDelegateAdaptor));
  sub_19B1E8498((uint64_t)self + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate);
}

@end
