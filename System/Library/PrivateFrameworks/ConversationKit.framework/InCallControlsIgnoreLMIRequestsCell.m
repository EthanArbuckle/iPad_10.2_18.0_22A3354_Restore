@implementation InCallControlsIgnoreLMIRequestsCell

- (_TtC15ConversationKit35InCallControlsIgnoreLMIRequestsCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit35InCallControlsIgnoreLMIRequestsCell *)InCallControlsIgnoreLMIRequestsCell.init(frame:)();
}

- (_TtC15ConversationKit35InCallControlsIgnoreLMIRequestsCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  InCallControlsIgnoreLMIRequestsCell.init(coder:)();
}

- (void)didToggleMuteState:(id)a3
{
  id v4;
  _TtC15ConversationKit35InCallControlsIgnoreLMIRequestsCell *v5;

  v4 = a3;
  v5 = self;
  InCallControlsIgnoreLMIRequestsCell.didToggleMuteState(_:)();

}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit35InCallControlsIgnoreLMIRequestsCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit35InCallControlsIgnoreLMIRequestsCell____lazy_storage___ignoreLMIRequestsSwitch));
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit35InCallControlsIgnoreLMIRequestsCell____lazy_storage___switchAccessory, &demangling cache variable for type metadata for UICellAccessory?);
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit35InCallControlsIgnoreLMIRequestsCell____lazy_storage___cellContentConfiguration, &demangling cache variable for type metadata for UIListContentConfiguration?);
}

@end
