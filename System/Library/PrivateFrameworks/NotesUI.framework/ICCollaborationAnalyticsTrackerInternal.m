@implementation ICCollaborationAnalyticsTrackerInternal

- (ICCollaborationAnalyticsTrackerInternal)initWithDelegate:(id)a3
{
  ICCollaborationAnalyticsTrackerInternal *v4;

  swift_unknownObjectRetain();
  v4 = (ICCollaborationAnalyticsTrackerInternal *)sub_1AC94E6B8((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (void)trackShare:(id)a3 forNote:(id)a4
{
  id v7;
  id v8;
  ICCollaborationAnalyticsTrackerInternal *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  ICCollaborationAnalyticsTrackerInternal.track(share:note:)(a3, v8);

}

- (void)saveNewShare:(id)a3 forNote:(id)a4
{
  id v6;
  id v7;
  ICCollaborationAnalyticsTrackerInternal *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  ICCollaborationAnalyticsTrackerInternal.save(newShare:note:)(v6, v7);

}

- (void)saveActivityType:(id)a3 isCollaborationSelected:(BOOL)a4 error:(id)a5 completed:(BOOL)a6 forNote:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  ICCollaborationAnalyticsTrackerInternal *v17;

  if (a3)
  {
    v12 = sub_1ACA420C0();
    v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v15 = a5;
  v16 = a7;
  v17 = self;
  ICCollaborationAnalyticsTrackerInternal.save(activityType:collaborationSelected:error:completed:note:)(v12, v14, a4, a5, a6, v16);

  swift_bridgeObjectRelease();
}

- (void)unshareNote:(id)a3
{
  id v4;
  ICCollaborationAnalyticsTrackerInternal *v5;

  v4 = a3;
  v5 = self;
  ICCollaborationAnalyticsTrackerInternal.unshare(note:)(v4);

}

- (void)dealloc
{
  objc_class *ObjectType;
  ICCollaborationAnalyticsTrackerInternal *v4;
  unint64_t v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_beginAccess();
  v4 = self;
  v5 = swift_bridgeObjectRetain();
  sub_1AC94B0D0(v5);
  swift_bridgeObjectRelease();
  v6.receiver = v4;
  v6.super_class = ObjectType;
  -[ICCollaborationAnalyticsTrackerInternal dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

}

- (ICCollaborationAnalyticsTrackerInternal)init
{
  ICCollaborationAnalyticsTrackerInternal *result;

  result = (ICCollaborationAnalyticsTrackerInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
