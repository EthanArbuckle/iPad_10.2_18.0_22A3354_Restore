@implementation IMSPICollaborationMessageListener

- (IMSPICollaborationMessageListenerDelegate)delegate
{
  return (IMSPICollaborationMessageListenerDelegate *)(id)MEMORY[0x1A85833E8]((char *)self+ OBJC_IVAR___IMSPICollaborationMessageListener_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (IMSPICollaborationMessageListener)initWithListenerID:(id)a3
{
  sub_1A2199764();
  return (IMSPICollaborationMessageListener *)sub_1A218CB48();
}

- (void)startListening
{
  IMSPICollaborationMessageListener *v2;

  v2 = self;
  sub_1A218CC50();

}

- (void)stopListening
{
  IMSPICollaborationMessageListener *v2;
  id v3;
  id v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMSPICollaborationMessageListener_connection) = 0;
  v2 = self;
  swift_unknownObjectRelease();
  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedController);
  v4 = objc_msgSend(v3, sel_listener);

  objc_msgSend(v4, sel_removeHandler_, v2);
}

- (void)didReceiveCollaborationMessage:(id)a3 inChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  uint64_t v6;
  id v9;
  IMSPICollaborationMessageListenerDelegate *v10;
  IMSPICollaborationMessageListenerDelegate *v11;
  void *v12;
  void *v13;
  IMSPICollaborationMessageListener *v14;

  v6 = a5;
  sub_1A2199764();
  sub_1A2199764();
  v9 = a3;
  v14 = self;
  v10 = -[IMSPICollaborationMessageListener delegate](v14, sel_delegate);
  if (v10)
  {
    v11 = v10;
    if ((-[IMSPICollaborationMessageListenerDelegate respondsToSelector:](v10, sel_respondsToSelector_, sel_collaborationMessageListener_receivedMessage_inChat_style_accountID_) & 1) != 0)
    {
      v12 = (void *)sub_1A2199758();
      v13 = (void *)sub_1A2199758();
      -[IMSPICollaborationMessageListenerDelegate collaborationMessageListener:receivedMessage:inChat:style:accountID:](v11, sel_collaborationMessageListener_receivedMessage_inChat_style_accountID_, v14, v9, v12, v6, v13);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();

    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

}

- (IMSPICollaborationMessageListener)init
{
  IMSPICollaborationMessageListener *result;

  result = (IMSPICollaborationMessageListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A218D06C((uint64_t)self + OBJC_IVAR___IMSPICollaborationMessageListener_delegate);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end
