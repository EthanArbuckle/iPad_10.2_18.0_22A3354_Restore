@implementation SecureButtonContentDelegate

- (id)currentTagForSlotView:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag));
}

- (BOOL)slotView:(id)a3 shouldSetInitialContentForStyle:(id)a4 tag:(id)a5
{
  return 0;
}

- (id)slotView:(id)a3 initialContentForStyle:(id)a4 tag:(id)a5
{
  return 0;
}

- (BOOL)slotView:(id)a3 shouldSetFinalContentForStyle:(id)a4 tag:(id)a5
{
  return 1;
}

- (id)slotMachineForFinalContentInSlotView:(id)a3
{
  return (id)sub_2355E1DC4();
}

- (BOOL)shouldGetFinalContentSynchronouslyInSlotView:(id)a3
{
  return 1;
}

- (id)slotView:(id)a3 replacementForFinalContent:(id)a4 style:(id)a5 tag:(id)a6
{
  return (id)swift_unknownObjectRetain();
}

- (_TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate)init
{
  _TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate *result;

  result = (_TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag));
}

@end
