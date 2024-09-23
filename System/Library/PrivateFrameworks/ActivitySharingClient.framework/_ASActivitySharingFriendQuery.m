@implementation _ASActivitySharingFriendQuery

- (_ASActivitySharingFriendQuery)initWithActivitySharingClient:(id)a3 updateHandler:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  return (_ASActivitySharingFriendQuery *)ActivitySharingFriendQuery.init(activitySharingClient:updateHandler:)(a3, (uint64_t)sub_235E91964, v6);
}

- (void)handleFriendListUpdate
{
  uint64_t v2;
  uint64_t v3;
  _ASActivitySharingFriendQuery *v4;

  v2 = qword_25429CF60;
  v4 = self;
  if (v2 != -1)
    swift_once();
  v3 = sub_235EE5CF8();
  __swift_project_value_buffer(v3, (uint64_t)qword_25429CF70);
  sub_235E9105C(0xD00000000000006CLL, 0x8000000235EEC520, 0xD000000000000018, 0x8000000235EEC590);
  _s21ActivitySharingClient0aB11FriendQueryC24fitnessAppsStateObserver_018applicationInstallH29DidChangeForBundleIdentifiersySo09FIFitnessghI0C_SaySSGtF_0();

}

- (_ASActivitySharingFriendQuery)init
{
  _ASActivitySharingFriendQuery *result;

  result = (_ASActivitySharingFriendQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
}

- (void)fitnessAppsStateObserver:(id)a3 applicationInstallStateDidChangeForBundleIdentifiers:(id)a4
{
  id v5;
  _ASActivitySharingFriendQuery *v6;

  v5 = a3;
  v6 = self;
  _s21ActivitySharingClient0aB11FriendQueryC24fitnessAppsStateObserver_018applicationInstallH29DidChangeForBundleIdentifiersySo09FIFitnessghI0C_SaySSGtF_0();

}

@end
