@implementation SidecarDisplaySession.SessionVideoClientDelegate

- (void)remoteVideoClientDidReceiveFirstFrame:(id)a3
{
  id v4;
  _TtCC17ContinuityDisplay21SidecarDisplaySessionP33_72778A0D8780EB3FED7F582200B6777426SessionVideoClientDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100017470(v4);

}

- (void)remoteVideoClient:(id)a3 remoteVideoDidPause:(BOOL)a4
{
  id v6;
  _TtCC17ContinuityDisplay21SidecarDisplaySessionP33_72778A0D8780EB3FED7F582200B6777426SessionVideoClientDelegate *v7;

  v6 = a3;
  v7 = self;
  sub_100017644(v6, a4);

}

- (void)remoteVideoClient:(id)a3 remoteMediaDidStall:(BOOL)a4
{
  id v6;
  _TtCC17ContinuityDisplay21SidecarDisplaySessionP33_72778A0D8780EB3FED7F582200B6777426SessionVideoClientDelegate *v7;

  v6 = a3;
  v7 = self;
  sub_1000176AC(v6, a4);

}

- (void)remoteVideoClient:(id)a3 videoDidDegrade:(BOOL)a4
{
  id v6;
  _TtCC17ContinuityDisplay21SidecarDisplaySessionP33_72778A0D8780EB3FED7F582200B6777426SessionVideoClientDelegate *v7;

  v6 = a3;
  v7 = self;
  sub_100017714(v6, a4);

}

- (void)remoteVideoClient:(id)a3 videoDidSuspend:(BOOL)a4
{
  id v6;
  _TtCC17ContinuityDisplay21SidecarDisplaySessionP33_72778A0D8780EB3FED7F582200B6777426SessionVideoClientDelegate *v7;

  v6 = a3;
  v7 = self;
  sub_10001777C(v6, a4);

}

- (void)remoteVideoClientDidReceiveLastFrame:(id)a3
{
  id v4;
  _TtCC17ContinuityDisplay21SidecarDisplaySessionP33_72778A0D8780EB3FED7F582200B6777426SessionVideoClientDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000178FC(v4);

}

- (void)remoteVideoServerDidDie:(id)a3
{
  id v4;
  _TtCC17ContinuityDisplay21SidecarDisplaySessionP33_72778A0D8780EB3FED7F582200B6777426SessionVideoClientDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100017A68(v4);

}

- (void)remoteVideoClient:(id)a3 remoteScreenAttributesDidChange:(id)a4
{
  id v6;
  id v7;
  _TtCC17ContinuityDisplay21SidecarDisplaySessionP33_72778A0D8780EB3FED7F582200B6777426SessionVideoClientDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100017CA8(v6, (uint64_t)v7);

}

- (void)remoteVideoClient:(id)a3 remoteVideoAttributesDidChange:(id)a4
{
  id v6;
  id v7;
  _TtCC17ContinuityDisplay21SidecarDisplaySessionP33_72778A0D8780EB3FED7F582200B6777426SessionVideoClientDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100017D1C(v6, (uint64_t)v7);

}

- (_TtCC17ContinuityDisplay21SidecarDisplaySessionP33_72778A0D8780EB3FED7F582200B6777426SessionVideoClientDelegate)init
{
  sub_100017E74();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtCC17ContinuityDisplay21SidecarDisplaySessionP33_72778A0D8780EB3FED7F582200B6777426SessionVideoClientDelegate_owner, a2);
  v3 = (char *)self
     + OBJC_IVAR____TtCC17ContinuityDisplay21SidecarDisplaySessionP33_72778A0D8780EB3FED7F582200B6777426SessionVideoClientDelegate_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
