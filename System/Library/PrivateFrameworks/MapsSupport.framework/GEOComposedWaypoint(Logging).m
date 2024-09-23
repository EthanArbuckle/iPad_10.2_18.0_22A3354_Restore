@implementation GEOComposedWaypoint(Logging)

- (id)shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v15 = objc_opt_class();
  v14 = objc_msgSend(a1, "muid");
  objc_msgSend(a1, "timezone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "navDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "navDisplayAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "directionsListAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "waypointCategory");
  if (v8 >= 0xE)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E66546D8[(int)v8];
  }
  v10 = objc_msgSend(a1, "type");
  if (v10 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E6654748[(int)v10];
  }
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@:%p, muid: %llu, timezone: %@, location: %@, name: %@, navDisplayName: %@, navDisplayAddress: %@, directionsListAddress: %@, waypointCategory: %@, waypointType: %@, isCurrentLocation: %d, isServerProvidedWaypoint: %d>"), v15, a1, v14, v2, v3, v4, v5, v6, v7, v9, v11, objc_msgSend(a1, "isCurrentLocation"), objc_msgSend(a1, "isServerProvidedWaypoint"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (__CFString)hawkQueryRepresentation
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a1, "navDisplayAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "bestLatLng");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "coordinate");
      v8 = v7;
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v9, "stringWithFormat:", CFSTR("%@, %@"), v10, v11);

    }
    v4 = CFSTR("<invalid>");
  }

  return v4;
}

@end
