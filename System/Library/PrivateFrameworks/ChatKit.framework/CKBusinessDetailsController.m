@implementation CKBusinessDetailsController

- (CKDetailsControllerDelegate)detailsControllerDelegate
{
  swift_beginAccess();
  return (CKDetailsControllerDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDetailsControllerDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_detailsControllerDelegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (CKConversation)conversation
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_conversation);
  swift_beginAccess();
  return (CKConversation *)*v2;
}

- (void)setConversation:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_conversation);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)isShowingAddMemberPopover
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKBusinessDetailsController_isShowingAddMemberPopover;
  swift_beginAccess();
  return *v2;
}

- (void)setIsShowingAddMemberPopover:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___CKBusinessDetailsController_isShowingAddMemberPopover;
  swift_beginAccess();
  *v4 = a3;
}

- (CKBusinessDetailsController)initWithConversation:(id)a3 detailsControllerDelegate:(id)a4
{
  id v5;
  objc_super v7;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_isShowingAddMemberPopover) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_conversation) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_detailsControllerDelegate) = (Class)a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BusinessDetailsController();
  v5 = a3;
  swift_unknownObjectRetain();
  return -[CKBusinessDetailsController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0);
}

- (CKBusinessDetailsController)initWithCoder:(id)a3
{
  id v4;
  CKBusinessDetailsController *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_isShowingAddMemberPopover) = 0;
  v4 = a3;

  result = (CKBusinessDetailsController *)sub_18E769320();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  CKBusinessDetailsController *v2;

  v2 = self;
  sub_18E662B28();

}

- (void)dismissDetailsController
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_detailsControllerDelegate);
  swift_beginAccess();
  objc_msgSend(*v2, sel_dismissDetailsNavigationController);
}

- (CKBusinessDetailsController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CKBusinessDetailsController *result;

  v4 = a4;
  result = (CKBusinessDetailsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

}

@end
