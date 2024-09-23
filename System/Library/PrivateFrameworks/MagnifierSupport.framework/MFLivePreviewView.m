@implementation MFLivePreviewView

+ (Class)layerClass
{
  sub_22738B7A8();
  return (Class)swift_getObjCClassFromMetadata();
}

- (NSString)accessibilityLabel
{
  uint64_t v2;
  void *v3;

  sub_227381830();
  if (v2)
  {
    v3 = (void *)sub_22758E1B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)accessibilityPerformEscape
{
  char v2;

  sub_22738B128();
  return v2 & 1;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (id)accessibilityExpandedTextValue
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_22758E1B4();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtC16MagnifierSupport17MFLivePreviewView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport17MFLivePreviewView_textValue);
  *v9 = 0;
  v9[1] = 0xE000000000000000;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[MFLivePreviewView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC16MagnifierSupport17MFLivePreviewView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  _QWORD *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport17MFLivePreviewView_textValue);
  *v6 = 0;
  v6[1] = 0xE000000000000000;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[MFLivePreviewView initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (uint64_t)_accessibilityMediaAnalysisOptions
{
  return 299007;
}

@end
