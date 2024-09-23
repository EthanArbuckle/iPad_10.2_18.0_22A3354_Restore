@implementation ICCalculateAccessibilityController

- (ICNote)note
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___ICCalculateAccessibilityController_note;
  swift_beginAccess();
  return (ICNote *)(id)MEMORY[0x1AF446658](v2);
}

- (void)setNote:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (ICCalculateAccessibilityController)initWithNote:(id)a3
{
  return (ICCalculateAccessibilityController *)sub_1AC9927C8(a3);
}

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  ICCalculateAccessibilityController *v5;
  id v6;
  ICCalculateAccessibilityController *v7;
  objc_super v8;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___ICCalculateAccessibilityController_didUpdateDocumentNotificationObserver);
  if (v3)
  {
    v4 = (void *)objc_opt_self();
    v5 = self;
    swift_unknownObjectRetain();
    v6 = objc_msgSend(v4, sel_defaultCenter);
    objc_msgSend(v6, sel_removeObserver_, v3);
    swift_unknownObjectRelease();

  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = (Class)ICCalculateAccessibilityController;
  -[ICCalculateAccessibilityController dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)getValueForPencilKitAttachmentAtRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  ICCalculateAccessibilityController *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  length = a3.length;
  location = a3.location;
  v5 = self;
  sub_1AC993794(location, length);
  v7 = v6;

  if (v7)
  {
    v8 = (void *)sub_1ACA42090();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (ICCalculateAccessibilityController)init
{
  ICCalculateAccessibilityController *result;

  result = (ICCalculateAccessibilityController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
