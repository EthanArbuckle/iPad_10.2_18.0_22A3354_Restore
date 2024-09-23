@implementation WFShazamMediaActionView.ListeningView

+ (Class)layerClass
{
  swift_getObjCClassMetadata();
  sub_21EB86994();
  return (Class)swift_getObjCClassFromMetadata();
}

- (SHListeningLayer)layer
{
  _TtCC11ActionKitUI23WFShazamMediaActionViewP33_6EAF142696076E68A50FC830706E4C9D13ListeningView *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21EB869EC();

  return (SHListeningLayer *)v3;
}

- (_TtCC11ActionKitUI23WFShazamMediaActionViewP33_6EAF142696076E68A50FC830706E4C9D13ListeningView)initWithFrame:(CGRect)a3
{
  return (_TtCC11ActionKitUI23WFShazamMediaActionViewP33_6EAF142696076E68A50FC830706E4C9D13ListeningView *)sub_21EB86A58(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC11ActionKitUI23WFShazamMediaActionViewP33_6EAF142696076E68A50FC830706E4C9D13ListeningView)initWithCoder:(id)a3
{
  return (_TtCC11ActionKitUI23WFShazamMediaActionViewP33_6EAF142696076E68A50FC830706E4C9D13ListeningView *)sub_21EB86ADC(a3);
}

@end
