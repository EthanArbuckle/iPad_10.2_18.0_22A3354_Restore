@implementation MOSuggestionAssetWorkout

- (id)init:(id)a3 route:(id)a4 icon:(id)a5
{
  return -[MOSuggestionAssetWorkout init:route:renderedRouteMap:icon:iconURL:](self, "init:route:renderedRouteMap:icon:iconURL:", a3, a4, 0, a5, 0);
}

- (id)init:(id)a3 route:(id)a4 renderedRouteMap:(id)a5 icon:(id)a6
{
  return -[MOSuggestionAssetWorkout init:route:renderedRouteMap:icon:iconURL:](self, "init:route:renderedRouteMap:icon:iconURL:", a3, a4, a5, a6, 0);
}

- (id)init:(id)a3 route:(id)a4 iconURL:(id)a5
{
  return -[MOSuggestionAssetWorkout init:route:renderedRouteMap:icon:iconURL:](self, "init:route:renderedRouteMap:icon:iconURL:", a3, a4, 0, 0, a5);
}

- (id)init:(id)a3 route:(id)a4 renderedRouteMap:(id)a5 icon:(id)a6 iconURL:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MOSuggestionAssetWorkout *v17;
  id *p_isa;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MOSuggestionAssetWorkout;
  v17 = -[MOSuggestionAssetWorkout init](&v21, sel_init);
  p_isa = (id *)&v17->super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_activityRings, a3);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 6, a6);
    objc_storeStrong(p_isa + 8, a5);
    objc_storeStrong(p_isa + 7, a7);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKActivitySummary *activityRings;
  id v5;

  activityRings = self->_activityRings;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", activityRings, CFSTR("coderKeyMOSuggestionAssetWorkoutActivitySummary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_route, CFSTR("coderKeyMOSuggestionAssetWorkoutRoute"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_icon, CFSTR("coderKeyMOSuggestionAssetWorkoutIcon"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconURL, CFSTR("coderKeyMOSuggestionAssetWorkoutIconURL"));

}

- (MOSuggestionAssetWorkout)initWithCoder:(id)a3
{
  id v4;
  MOSuggestionAssetWorkout *v5;
  uint64_t v6;
  HKActivitySummary *activityRings;
  uint64_t v8;
  MOSuggestionAssetWorkoutRoute *route;
  uint64_t v10;
  UIImage *icon;
  uint64_t v12;
  NSURL *iconURL;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MOSuggestionAssetWorkout;
  v5 = -[MOSuggestionAssetWorkout init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coderKeyMOSuggestionAssetWorkoutActivitySummary"));
    v6 = objc_claimAutoreleasedReturnValue();
    activityRings = v5->_activityRings;
    v5->_activityRings = (HKActivitySummary *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coderKeyMOSuggestionAssetWorkoutRoute"));
    v8 = objc_claimAutoreleasedReturnValue();
    route = v5->_route;
    v5->_route = (MOSuggestionAssetWorkoutRoute *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coderKeyMOSuggestionAssetWorkoutIcon"));
    v10 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (UIImage *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coderKeyMOSuggestionAssetWorkoutIconURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    iconURL = v5->_iconURL;
    v5->_iconURL = (NSURL *)v12;

  }
  return v5;
}

- (NSString)activityRingsAssetIdentifier
{
  return self->activityRingsAssetIdentifier;
}

- (void)setActivityRingsAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->activityRingsAssetIdentifier, a3);
}

- (NSString)routeAssetIdentifier
{
  return self->routeAssetIdentifier;
}

- (void)setRouteAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->routeAssetIdentifier, a3);
}

- (NSString)iconAssetIdentifier
{
  return self->iconAssetIdentifier;
}

- (void)setIconAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->iconAssetIdentifier, a3);
}

- (HKActivitySummary)activityRings
{
  return self->_activityRings;
}

- (MOSuggestionAssetWorkoutRoute)route
{
  return self->_route;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (UIImage)renderedRouteMap
{
  return self->_renderedRouteMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedRouteMap, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_activityRings, 0);
  objc_storeStrong((id *)&self->iconAssetIdentifier, 0);
  objc_storeStrong((id *)&self->routeAssetIdentifier, 0);
  objc_storeStrong((id *)&self->activityRingsAssetIdentifier, 0);
}

@end
