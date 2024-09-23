@implementation CoreIDVUIButton

- (BOOL)isHighlighted
{
  return sub_2139F5A50(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  unsigned int v5;
  double v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CoreIDVUIButton();
  v4 = v7.receiver;
  -[CoreIDVUIButton setHighlighted:](&v7, sel_setHighlighted_, v3);
  v5 = objc_msgSend(v4, sel_isHighlighted, v7.receiver, v7.super_class);
  v6 = 0.6;
  if (!v5)
    v6 = 1.0;
  objc_msgSend(v4, sel_setAlpha_, v6);

}

- (BOOL)isEnabled
{
  return sub_2139F5A50(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CoreIDVUIButton();
  v4 = v5.receiver;
  -[CoreIDVUIButton setEnabled:](&v5, sel_setEnabled_, v3);
  sub_2139F5EA4();

}

- (_TtC18CoreIDVRGBLiveness15CoreIDVUIButton)initWithFrame:(CGRect)a3
{
  return (_TtC18CoreIDVRGBLiveness15CoreIDVUIButton *)sub_2139F5AEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18CoreIDVRGBLiveness15CoreIDVUIButton)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC18CoreIDVRGBLiveness15CoreIDVUIButton *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC18CoreIDVRGBLiveness15CoreIDVUIButton_originalButtonText);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18CoreIDVRGBLiveness15CoreIDVUIButton____lazy_storage___activityIndicator) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC18CoreIDVRGBLiveness15CoreIDVUIButton_style) = 3;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC18CoreIDVRGBLiveness15CoreIDVUIButton_useWatchScheme) = 0;
  v5 = a3;

  result = (_TtC18CoreIDVRGBLiveness15CoreIDVUIButton *)sub_213A146FC();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness15CoreIDVUIButton____lazy_storage___activityIndicator));
}

@end
