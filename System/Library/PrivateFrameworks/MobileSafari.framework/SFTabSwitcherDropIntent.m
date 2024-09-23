@implementation SFTabSwitcherDropIntent

- (SFTabSwitcherDropDestination)destination
{
  SFTabSwitcherDropIntent *v2;
  id v3;

  v2 = self;
  v3 = sub_18B98BB30();

  return (SFTabSwitcherDropDestination *)v3;
}

- (UIDropProposal)proposal
{
  return (UIDropProposal *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.isa
                                                                              + OBJC_IVAR___SFTabSwitcherDropIntent__internal)
                                                                   + OBJC_IVAR____TtC12MobileSafari31SFTabSwitcherDropIntentInternal_wrapped
                                                                   + *(int *)(_s10DropIntentVMa_0(0) + 20)));
}

- (UIDropSession)session
{
  _s10DropIntentVMa_0(0);
  return (UIDropSession *)(id)swift_unknownObjectRetain();
}

- (SFTabSwitcherDropIntent)init
{
  SFTabSwitcherDropIntent *result;

  result = (SFTabSwitcherDropIntent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
