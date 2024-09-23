@implementation InCallControlsPTTLeaveChannelCell

- (_TtC15ConversationKit33InCallControlsPTTLeaveChannelCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit33InCallControlsPTTLeaveChannelCell *)InCallControlsPTTLeaveChannelCell.init(frame:)();
}

- (_TtC15ConversationKit33InCallControlsPTTLeaveChannelCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  InCallControlsPTTLeaveChannelCell.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33InCallControlsPTTLeaveChannelCell_leaveChannelButton));
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit33InCallControlsPTTLeaveChannelCell____lazy_storage___leaveChannelButtonConfiguration, &demangling cache variable for type metadata for UIButton.Configuration?);
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit33InCallControlsPTTLeaveChannelCell____lazy_storage___leaveButtonAccessory, &demangling cache variable for type metadata for UICellAccessory?);
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit33InCallControlsPTTLeaveChannelCell____lazy_storage___cellContentConfiguration, &demangling cache variable for type metadata for UIListContentConfiguration?);
}

@end
