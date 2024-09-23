@implementation HoverTextServiceAXUIService

- (_TtC17HoverTextServices27HoverTextServiceAXUIService)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService__client) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService_hoverTextEnabled) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService_hoverTextTypingEnabled) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HoverTextServiceAXUIService();
  return -[HoverTextServiceAXUIService init](&v3, sel_init);
}

- (void)dealloc
{
  _TtC17HoverTextServices27HoverTextServiceAXUIService *v2;

  v2 = self;
  sub_1C88FCEEC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService__client));
}

- (id)userInterfaceClient:(id)a3 accessQueueForProcessingMessageWithIdentifier:(int64_t)a4
{
  return objc_msgSend((id)objc_opt_self(), sel_mainAccessQueue);
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  id v5;
  _TtC17HoverTextServices27HoverTextServiceAXUIService *v6;

  v5 = a3;
  v6 = self;
  sub_1C88FE31C((uint64_t)a3);

}

@end
