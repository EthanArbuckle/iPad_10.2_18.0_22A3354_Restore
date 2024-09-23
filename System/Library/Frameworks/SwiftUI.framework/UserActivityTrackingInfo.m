@implementation UserActivityTrackingInfo

- (void)userActivityWillSave:(id)a3
{
  id v4;
  _TtC7SwiftUI24UserActivityTrackingInfo *v5;

  v4 = a3;
  v5 = self;
  UserActivityTrackingInfo.userActivityWillSave(_:)((NSUserActivity)v4);

}

- (NSString)description
{
  _TtC7SwiftUI24UserActivityTrackingInfo *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = UserActivityTrackingInfo.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x18D75CC88](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC7SwiftUI24UserActivityTrackingInfo)init
{
  _TtC7SwiftUI24UserActivityTrackingInfo *result;

  result = (_TtC7SwiftUI24UserActivityTrackingInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_weakDestroy();
  swift_bridgeObjectRelease();
}

@end
