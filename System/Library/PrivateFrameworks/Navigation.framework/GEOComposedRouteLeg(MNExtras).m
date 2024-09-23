@implementation GEOComposedRouteLeg(MNExtras)

- (id)originListInstructionString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "originListInstruction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "origin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "waypointSubstitutedComposedStringForString:waypoint:useWaypointAddress:", v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithDefaultOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)destinationListInstructionString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "destinationListInstruction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "waypointSubstitutedComposedStringForString:waypoint:useWaypointAddress:", v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithDefaultOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)waypointSubstitutedComposedStringForString:()MNExtras waypoint:useWaypointAddress:
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  char v18;

  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (a3 && v7)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __104__GEOComposedRouteLeg_MNExtras__waypointSubstitutedComposedStringForString_waypoint_useWaypointAddress___block_invoke;
    v16 = &unk_1E61D8498;
    v18 = a5;
    v17 = v7;
    v10 = a3;
    objc_msgSend(v10, "optionsWithArgumentHandler:", &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "composedStringWithOptions:", v11, v13, v14, v15, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

@end
