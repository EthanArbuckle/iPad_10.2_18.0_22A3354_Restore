@implementation TextEditorTextView

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  id v6;
  id v7;
  _TtC7SwiftUI18TextEditorTextView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  TextEditorTextView.findInteraction(_:didBegin:)((uint64_t)v6, (uint64_t)v7, (SEL *)&selRef_findInteraction_didBeginFindSession_);

}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  id v6;
  id v7;
  _TtC7SwiftUI18TextEditorTextView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  TextEditorTextView.findInteraction(_:didBegin:)((uint64_t)v6, (uint64_t)v7, (SEL *)&selRef_findInteraction_didEndFindSession_);

}

- (BOOL)supportsTextReplacement
{
  if (*(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC7SwiftUI18TextEditorTextView_findContext) == 1)
    return 0;
  else
    return *((_BYTE *)&self->super.super.super.super.super.__layeringSceneIdentity
           + OBJC_IVAR____TtC7SwiftUI18TextEditorTextView_findContext
           + 2);
}

- (_TtC7SwiftUI18TextEditorTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v11 = (char *)self + OBJC_IVAR____TtC7SwiftUI18TextEditorTextView_findContext;
  *(_OWORD *)v11 = xmmword_187BF9840;
  v11[18] = 0;
  *((_WORD *)v11 + 8) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI18TextEditorTextView____lazy_storage___helper) = 0;
  v13.receiver = self;
  v13.super_class = ObjectType;
  return -[UIKitTextView initWithFrame:textContainer:](&v13, sel_initWithFrame_textContainer_, a4, x, y, width, height);
}

- (_TtC7SwiftUI18TextEditorTextView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC7SwiftUI18TextEditorTextView_findContext;
  *(_OWORD *)v6 = xmmword_187BF9840;
  v6[18] = 0;
  *((_WORD *)v6 + 8) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI18TextEditorTextView____lazy_storage___helper) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[UIKitTextView initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  outlined consume of FindContext?(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC7SwiftUI18TextEditorTextView_findContext), *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags+ OBJC_IVAR____TtC7SwiftUI18TextEditorTextView_findContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI18TextEditorTextView____lazy_storage___helper));
}

@end
