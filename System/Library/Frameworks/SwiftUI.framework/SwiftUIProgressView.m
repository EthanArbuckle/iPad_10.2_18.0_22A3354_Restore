@implementation SwiftUIProgressView

- (SwiftUIProgressView)initWithFrame:(CGRect)a3
{
  return (SwiftUIProgressView *)@objc LinearUIKitProgressView.Base.SwiftUIProgressView.init(frame:)(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for LinearUIKitProgressView.Base.SwiftUIProgressView);
}

- (SwiftUIProgressView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LinearUIKitProgressView.Base.SwiftUIProgressView();
  return -[SwiftUIProgressView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
