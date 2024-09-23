@implementation RemoteSetupClientManager

- (_TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDevice) = 0;
  *(_DWORD *)((char *)&self->super.isa
            + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass) = -1;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_clientSideAuth) = 1;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_reverseFlowForDevices) = (Class)&_swiftEmptySetSingleton;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RemoteSetupClientManager();
  return -[RemoteSetupClientManager init](&v3, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDevice));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_reverseFlowForDevices));
}

@end
