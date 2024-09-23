@implementation GEOComposedRouteLeg

void __104__GEOComposedRouteLeg_MNExtras__waypointSubstitutedComposedStringForString_waypoint_useWaypointAddress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  char v8;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 18)
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = 7;
    else
      v4 = objc_msgSend(*(id *)(a1 + 32), "waypointCategory");
    objc_msgSend(v3, "substitutionFormat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __104__GEOComposedRouteLeg_MNExtras__waypointSubstitutedComposedStringForString_waypoint_useWaypointAddress___block_invoke_2;
    v6[3] = &unk_1E61D8470;
    v8 = *(_BYTE *)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "setSubstitutionForWaypointCategory:handler:", v4, v6);

  }
}

id __104__GEOComposedRouteLeg_MNExtras__waypointSubstitutedComposedStringForString_waypoint_useWaypointAddress___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v7, "navDisplayAddress");
  else
    objc_msgSend(v7, "bestDisplayName:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOverrideValue:", v8);

    v11 = v5;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
