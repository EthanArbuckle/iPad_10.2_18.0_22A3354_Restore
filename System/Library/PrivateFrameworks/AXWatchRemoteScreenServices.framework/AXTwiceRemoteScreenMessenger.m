@implementation AXTwiceRemoteScreenMessenger

+ (_TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger)sharedInstance
{
  if (qword_2553A5A00 != -1)
    swift_once();
  return (_TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *)(id)qword_2553A5D90;
}

- (AXTwiceRemoteScreenMessengerDelegateProtocolObjc)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger_delegate;
  swift_beginAccess();
  return (AXTwiceRemoteScreenMessengerDelegateProtocolObjc *)(id)MEMORY[0x22079C78C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger)init
{
  objc_class *ObjectType;
  _TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *v4;
  void *v5;
  _TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *v6;
  _TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *result;
  _TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v4 = -[AXTwiceRemoteScreenMessenger init](&v9, sel_init);
  v5 = (void *)objc_opt_self();
  v6 = v4;
  result = (_TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *)objc_msgSend(v5, sel_sharedInstance);
  if (result)
  {
    v8 = result;
    -[AXTwiceRemoteScreenMessenger registerForIncomingData:](result, sel_registerForIncomingData_, v6);

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *v5;
  id v6;
  void *v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_sharedInstance);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_deregisterForIncomingData_, v5);

    v8.receiver = v5;
    v8.super_class = ObjectType;
    -[AXTwiceRemoteScreenMessenger dealloc](&v8, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  sub_21DBFD90C((uint64_t)self + OBJC_IVAR____TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger_delegate);
}

- (void)reconnectToAXUIServerIfNeeded
{
  _TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *v2;

  v2 = self;
  AXTwiceRemoteScreenMessenger.reconnectToAXUIServerIfNeeded()();

}

- (id)sendMessage:(id)a3
{
  uint64_t v4;
  _TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = sub_21DC00888();
  v5 = self;
  _s27AXWatchRemoteScreenServices07AXTwicebC9MessengerC11sendMessageySSSgSDys11AnyHashableVypGF_0(v4);
  v7 = v6;

  swift_bridgeObjectRelease();
  if (v7)
  {
    v8 = (void *)sub_21DC008A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)receiveMessage:(id)a3
{
  uint64_t v4;
  _TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *v5;

  v4 = sub_21DC00888();
  v5 = self;
  AXTwiceRemoteScreenMessenger.receiveMessage(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)cleanup
{
  void *v3;
  _TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_sharedInstance);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_deregisterForIncomingData_, v4);

  }
  else
  {
    __break(1u);
  }
}

- (void)didReceiveIncomingData:(id)a3
{
  uint64_t v4;
  _TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *v5;

  if (a3)
  {
    v4 = sub_21DC00888();
    v5 = self;
    AXTwiceRemoteScreenMessenger.receiveMessage(_:)((Swift::OpaquePointer)v4);

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)connectedDevicesDidChange:(id)a3
{
  void *v4;
  _TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *v5;
  Swift::OpaquePointer_optional v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2553A5DA0);
    v4 = (void *)sub_21DC0093C();
  }
  else
  {
    v4 = 0;
  }
  v5 = self;
  v6.value._rawValue = v4;
  AXTwiceRemoteScreenMessenger.connectedDevicesDidChange(_:)(v6);

  swift_bridgeObjectRelease();
}

- (void)serverConnectionWasInterrupted
{
  _TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *v2;

  v2 = self;
  AXTwiceRemoteScreenMessenger.serverConnectionWasInterrupted()();

}

@end
