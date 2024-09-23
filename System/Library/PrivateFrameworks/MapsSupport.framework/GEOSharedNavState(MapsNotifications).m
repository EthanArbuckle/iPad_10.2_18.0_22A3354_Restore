@implementation GEOSharedNavState(MapsNotifications)

- (id)senderNameIncludingHandleIfNecessary
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "senderInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasLocalContactIdentifier");

  if (v3)
  {
    objc_msgSend(a1, "senderName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "senderName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "senderInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fromIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (%@)"), v6, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)initialNotificationSubtitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  MSPBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's subtitle when sharing"), CFSTR("%@ is sharing ETA"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "senderName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)initialNotificationBody
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "finalETAInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "etaTimestamp");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(a1, "numberOfIntermediateStopsRemaining");
  objc_msgSend(a1, "destinationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  MSPBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's body when sharing (with destination name)"), CFSTR("localized string not found"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "senderNameIncludingHandleIfNecessary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v13, v8, v14, v9, v7);
  }
  else
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's body when sharing (no destination name)"), CFSTR("localized string not found"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "senderNameIncludingHandleIfNecessary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v13, v8, v14, v7, v17);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)initialMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "finalETAInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "etaTimestamp");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(a1, "numberOfIntermediateStopsRemaining");
  objc_msgSend(a1, "destinationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  MSPBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] text message body (with destination name)"), CFSTR("localized string not found"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v13, v8, v9, v7);
  }
  else
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] text message body (no destination name)"), CFSTR("localized string not found"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v13, v8, v7, v16);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)updateNotificationSubtitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  MSPBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] update Notification's subtitle when sharing"), CFSTR("%@’s ETA has changed"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "senderName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)updateNotificationBody
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "etaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "etaTimestamp");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nextWaypointInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  MSPBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] update Notification's body when sharing (with destination)"), CFSTR("%1$@ will now arrive at %2$@ around %3$@"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "senderNameIncludingHandleIfNecessary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v13, v14, v9, v7);
  }
  else
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] update Notification's body when sharing (without destination)"), CFSTR("%1$@ will now arrive around %2$@"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "senderNameIncludingHandleIfNecessary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v13, v14, v7, v17);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)updateMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "etaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "etaTimestamp");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nextWaypointInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  MSPBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] update text message body (with destination)"), CFSTR("My updated arrival time to %1$@ is now around %2$@."), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v13, v9, v7);
  }
  else
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] update text message body (without destination)"), CFSTR("My updated arrival time is now around %@."), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v13, v7, v16);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)chargingStopNotificationSubtitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  MSPBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's subtitle when stopping at a charger"), CFSTR("%@ is making a stop"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "senderName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)chargingStopNotificationBody
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "nextWaypointInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  MSPBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's body when stopping at a charger"), CFSTR("%@ has stopped at a charging station in %@."), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "senderNameIncludingHandleIfNecessary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)chargingStopMessage
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "nextWaypointInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x1E0CB3940];
  MSPBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] text message body when stopping at a charger"), CFSTR("I have stopped at a charging station in %@."), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)intermediateArrivalNotificationSubtitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  MSPBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's subtitle when stopping at an intermediate waypoint"), CFSTR("%@ is making a stop"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "senderName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)intermediateArrivalNotificationBody
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  objc_msgSend(a1, "nextWaypointInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "destinationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  MSPBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's body when stopping at an intermediate waypoint"), CFSTR("%@ is stopping at %@ before continuing to %@."), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "senderNameIncludingHandleIfNecessary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v8, v9, v3, v4);
  }
  else
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's body when stopping at an intermediate waypoint, generic"), CFSTR("%@ is stopping at %@ before continuing to their destination."), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "senderNameIncludingHandleIfNecessary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v8, v9, v3, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)intermediateArrivalMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  objc_msgSend(a1, "nextWaypointInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "destinationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  MSPBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] text message body when stopping at an intermediate waypoint"), CFSTR("I’m making a stop at %@ before continuing to %@."), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v8, v3, v4);
  }
  else
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] text message body when stopping at an intermediate waypoint, generic"), CFSTR("I’m making a stop at %@ before continuing to my destination."), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v8, v3, v11);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)waypointResumeNotificationSubtitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  MSPBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's subtitle when resuming sharing"), CFSTR("%@ has resumed the route"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "senderName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)waypointResumeNotificationBody
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "finalETAInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "etaTimestamp");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "destinationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  MSPBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's body when resuming sharing"), CFSTR("%@ will arrive at %@ around %@. Follow along in Maps."), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "senderNameIncludingHandleIfNecessary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v12, v13, v8, v7);
  }
  else
  {
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's body when resuming sharing, generic"), CFSTR("%@ will arrive at their destination around %@. Follow along in Maps."), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "senderNameIncludingHandleIfNecessary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v12, v13, v7, v16);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)waypointResumeMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "finalETAInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "etaTimestamp");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "destinationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  MSPBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Text message body when resuming sharing"), CFSTR("I will arrive at %@ around %@. I’ll let you know if I’m running late."), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v12, v8, v7);
  }
  else
  {
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Text message body when resuming sharing, generic"), CFSTR("I will arrive at my destination around %@. I’ll let you know if I’m running late."), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v12, v7, v15);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)arrivalNotificationSubtitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  MSPBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] arrival notification subtitle"), CFSTR("%@ is arriving"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "senderName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)arrivalNotificationBody
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  objc_msgSend(a1, "nextWaypointInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  MSPBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] arrival notification body"), CFSTR("%@ is arriving at %@."), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "senderNameIncludingHandleIfNecessary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v7, v8, v3);
  }
  else
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] arrival notification body, generic"), CFSTR("%@ is arriving at their destination."), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "senderNameIncludingHandleIfNecessary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v7, v8, v11);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)arrivalMessage
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  objc_msgSend(a1, "nextWaypointInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x1E0CB3940];
  MSPBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] arrival text message body"), CFSTR("I’m arriving at %@ soon."), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v6, v2);
  }
  else
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] arrival text message body, generic"), CFSTR("I’m arriving at my destination soon."), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v6, v9);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
