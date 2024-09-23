@implementation AXRuntimeClient

- (_TtC11HoverTextUI15AXRuntimeClient)init
{
  _TtC11HoverTextUI15AXRuntimeClient *result;

  result = (_TtC11HoverTextUI15AXRuntimeClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_logger;
  v4 = sub_21A7CF750();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  sub_21A795888(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange));
  sub_21A795888(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged));
  sub_21A795888(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_elementVisualsUpdated));
  sub_21A795888(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_focusedApplicationsDidChange));
  sub_21A795888(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveAnnouncement));
  sub_21A795888(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillHide));
  sub_21A795888(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_currentInputModeDidChange));
  sub_21A795888(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillChangeFrame));
  sub_21A795888(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_loupeStateChanged));
  sub_21A795888(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_updateTypingDisplayMode));
  sub_21A795888(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification));

}

@end
