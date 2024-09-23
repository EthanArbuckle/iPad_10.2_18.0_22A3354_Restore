@implementation FBKContentItem

- (UIColor)needsActionTintColor
{
  return (UIColor *)-[FBKContentItem colorForActive:](self, "colorForActive:", -[FBKContentItem canResolveNeedsAction](self, "canResolveNeedsAction"));
}

- (BOOL)canResolveNeedsAction
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  BOOL v10;

  if (-[FBKContentItem itemType](self, "itemType") != (id)4)
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBKContentItem singleTeam](self, "singleTeam"));
  v4 = objc_msgSend(v3, "teamType");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBKContentItem assignee](self, "assignee"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBKContentItem user](self, "user"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ID"));
  v9 = objc_msgSend(v6, "isEqualToNumber:", v8);

  if (v4)
    v10 = v9;
  else
    v10 = 1;
  if (-[FBKContentItem isOrphaned](self, "isOrphaned") && objc_msgSend(v3, "role") == (id)2)
    v10 = 1;

  return v10;
}

- (UIColor)orphanBadgeTintColor
{
  return (UIColor *)-[FBKContentItem colorForActive:](self, "colorForActive:", -[FBKContentItem canReassignFeedback](self, "canReassignFeedback"));
}

- (id)colorForActive:(BOOL)a3
{
  void *v3;

  if (a3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[iFBAConstants tintColor](iFBAConstants, "tintColor"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemFillColor](UIColor, "systemFillColor"));
  return v3;
}

- (UIImage)imageForNeedsAction
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", FBKSystemImageNameUnread);
}

- (id)keyPathsForValuesAffectingItemTitleColor
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("type"), CFSTR("closed"), 0);
}

- (UIColor)itemTitleColor
{
  void *v2;

  if (-[FBKContentItem isClosedFeedback](self, "isClosedFeedback"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  return (UIColor *)v2;
}

- (id)keyPathsForValuesAffectingSecondaryTextColor
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("closed"), 0);
}

- (UIColor)secondaryTextColor
{
  void *v2;

  if (-[FBKContentItem isClosedFeedback](self, "isClosedFeedback"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  return (UIColor *)v2;
}

+ (id)filterGroupsForTeam:(id)a3
{
  id v3;
  _QWORD *v4;
  Class isa;

  v3 = a3;
  v4 = sub_100084C5C(v3);

  type metadata accessor for FBAFilterGroup();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

+ (id)filterGroupsForAll
{
  uint64_t v2;
  uint64_t v3;
  Class isa;

  sub_1000853AC();
  v3 = v2;
  type metadata accessor for FBAFilterGroup();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

+ (id)assignedToMeFilter
{
  id v2;

  sub_100083750();
  return v2;
}

+ (id)originatedByMeFilter
{
  id v2;

  sub_100083984();
  return v2;
}

+ (id)responsePendingFilter
{
  return sub_1000834C0();
}

+ (id)orphanedFilter
{
  return sub_100083C94();
}

+ (id)openFilter
{
  return sub_1000835FC();
}

+ (id)closedFilter
{
  return sub_1000855FC();
}

+ (id)teamActionsFilterGroupWithTeam:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = sub_100083EC8(a3);

  return v5;
}

+ (id)personalActionsFilterGroup
{
  return sub_100085830();
}

+ (id)teamsFilterGroup
{
  return (id)sub_100084E2C();
}

+ (id)areaFilterGroupWithContentItems:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = sub_100053458(0, (unint64_t *)&qword_100116990, FBKContentItem_ptr);
  v5 = sub_10008536C((unint64_t *)&qword_100116998, (unint64_t *)&qword_100116990, FBKContentItem_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v4, v5);
  v7 = (void *)sub_100084740(v6);
  swift_bridgeObjectRelease(v6);
  return v7;
}

@end
