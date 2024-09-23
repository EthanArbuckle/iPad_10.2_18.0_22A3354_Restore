@implementation BuddySetupAnalytics

- (BuddySetupAnalytics)initWithPreferences:(id)a3
{
  id v3;
  BuddySetupAnalytics *v4;
  objc_super v6;
  id location[2];
  id v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BuddySetupAnalytics;
  v8 = -[BuddySetupAnalytics init](&v6, "init");
  objc_storeStrong(&v8, v8);
  if (v8)
    objc_storeStrong((id *)v8 + 8, location[0]);
  v4 = (BuddySetupAnalytics *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

+ (id)loadFromDiskWithPreferences:(id)a3
{
  uint64_t v3;
  BuddySetupAnalytics *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  id v18;
  int v19;
  id v20;
  id location[3];
  id v22;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = objc_msgSend(location[0], "objectForKey:includeCache:", CFSTR("setupAnalytics"), 0);
  v3 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v20, v3) & 1) != 0)
  {
    v4 = [BuddySetupAnalytics alloc];
    v18 = -[BuddySetupAnalytics initWithPreferences:](v4, "initWithPreferences:", location[0]);
    v5 = objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("hasCompletedInitialSetup"));
    objc_msgSend(v18, "setHasCompletedInitialSetup:", (unint64_t)objc_msgSend(v5, "BOOLValue") & 1);

    v6 = objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("usedProximitySetup"));
    objc_msgSend(v18, "setUsedProximitySetup:", (unint64_t)objc_msgSend(v6, "BOOLValue") & 1);

    v7 = objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("dataTransferMethod"));
    objc_msgSend(v18, "setDataTransferMethod:", objc_msgSend(v7, "unsignedIntegerValue"));

    v8 = objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("inAppleStore"));
    objc_msgSend(v18, "setInAppleStore:", (unint64_t)objc_msgSend(v8, "BOOLValue") & 1);

    v9 = objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("softwareUpdatePerformed"));
    objc_msgSend(v18, "setSoftwareUpdatePerformed:", (unint64_t)objc_msgSend(v9, "BOOLValue") & 1);

    v10 = objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("numberOfPanesPresented"));
    objc_msgSend(v18, "setNumberOfPanesPresented:", objc_msgSend(v10, "unsignedIntegerValue"));

    v11 = objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("activeDuration"));
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(v18, "setActiveDuration:");

    v12 = objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("backgroundDuration"));
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v18, "setBackgroundDuration:");

    v13 = objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("otherDuration"));
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(v18, "setOtherDuration:");

    v14 = objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("isSignedIntoAppleID"));
    objc_msgSend(v18, "setIsSignedIntoAppleID:", (unint64_t)objc_msgSend(v14, "BOOLValue") & 1);

    v15 = objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("followUpItemsCount"));
    objc_msgSend(v15, "doubleValue");
    objc_msgSend(v18, "setFollowUpItemsCount:", (unint64_t)v16);

    v22 = v18;
    v19 = 1;
    objc_storeStrong(&v18, 0);
  }
  else
  {
    v22 = 0;
    v19 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v22;
}

- (void)persist
{
  BYPreferencesController *v2;
  id v3;

  v2 = -[BuddySetupAnalytics preferences](self, "preferences", a2);
  v3 = -[BuddySetupAnalytics _dictionaryRepresentation](self, "_dictionaryRepresentation");
  -[BYPreferencesController setObject:forKey:persistImmediately:](v2, "setObject:forKey:persistImmediately:", v3, CFSTR("setupAnalytics"), 1);

}

+ (void)removeFromDiskWithPreferences:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "removeObjectForKey:onlyFromMemory:", CFSTR("setupAnalytics"), 0);
  objc_storeStrong(location, 0);
}

- (void)addEventUsingAnalyticsManager:(id)a3
{
  id v3;
  id v4;
  id location[2];
  BuddySetupAnalytics *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = -[BuddySetupAnalytics _dictionaryRepresentation](v6, "_dictionaryRepresentation");
  objc_msgSend(v3, "addEvent:withPayload:persist:", CFSTR("com.apple.setupassistant.ios.setup"), v4, 0);

  objc_storeStrong(location, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  id location[2];
  BuddySetupAnalytics *v7;
  char v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v7 == location[0])
  {
    v8 = 1;
  }
  else
  {
    v3 = location[0];
    v4 = objc_opt_class(BuddySetupAnalytics);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
      v8 = -[BuddySetupAnalytics isEqualToAnalytics:](v7, "isEqualToAnalytics:", location[0]);
    else
      v8 = 0;
  }
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (BOOL)isEqualToAnalytics:(id)a3
{
  int v3;
  int v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  id location[2];
  BuddySetupAnalytics *v29;

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddySetupAnalytics hasCompletedInitialSetup](v29, "hasCompletedInitialSetup");
  v18 = v3 == (objc_msgSend(location[0], "hasCompletedInitialSetup") & 1);
  v4 = -[BuddySetupAnalytics usedProximitySetup](v29, "usedProximitySetup");
  v19 = (v18 & (v4 == (objc_msgSend(location[0], "usedProximitySetup") & 1))) != 0;
  v5 = -[BuddySetupAnalytics dataTransferMethod](v29, "dataTransferMethod");
  v20 = (v19 & (v5 == objc_msgSend(location[0], "dataTransferMethod"))) != 0;
  LODWORD(v5) = -[BuddySetupAnalytics inAppleStore](v29, "inAppleStore");
  v21 = (v20 & ((_DWORD)v5 == (objc_msgSend(location[0], "inAppleStore") & 1))) != 0;
  LODWORD(v5) = -[BuddySetupAnalytics softwareUpdatePerformed](v29, "softwareUpdatePerformed");
  v22 = (v21 & ((_DWORD)v5 == (objc_msgSend(location[0], "softwareUpdatePerformed") & 1))) != 0;
  v6 = -[BuddySetupAnalytics numberOfPanesPresented](v29, "numberOfPanesPresented");
  v23 = (v22 & (v6 == objc_msgSend(location[0], "numberOfPanesPresented"))) != 0;
  -[BuddySetupAnalytics activeDuration](v29, "activeDuration");
  v8 = v7;
  objc_msgSend(location[0], "activeDuration");
  v24 = v23 && v8 == v9;
  -[BuddySetupAnalytics backgroundDuration](v29, "backgroundDuration");
  v11 = v10;
  objc_msgSend(location[0], "backgroundDuration");
  v25 = v24 && v11 == v12;
  -[BuddySetupAnalytics otherDuration](v29, "otherDuration");
  v14 = v13;
  objc_msgSend(location[0], "otherDuration");
  v26 = v25 && v14 == v15;
  LODWORD(v6) = -[BuddySetupAnalytics isSignedIntoAppleID](v29, "isSignedIntoAppleID");
  v27 = (v26 & ((_DWORD)v6 == (objc_msgSend(location[0], "isSignedIntoAppleID") & 1))) != 0;
  v16 = -[BuddySetupAnalytics followUpItemsCount](v29, "followUpItemsCount");
  LOBYTE(v16) = (v27 & (v16 == objc_msgSend(location[0], "followUpItemsCount"))) != 0;
  objc_storeStrong(location, 0);
  return v16 & 1;
}

- (id)_dictionaryRepresentation
{
  NSNumber *v2;
  NSNumber *v3;
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *v6;
  NSNumber *v7;
  NSNumber *v8;
  NSNumber *v9;
  NSNumber *v10;
  NSNumber *v11;
  NSNumber *v12;
  id v13;
  id location[2];
  BuddySetupAnalytics *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)NSMutableDictionary);
  v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BuddySetupAnalytics hasCompletedInitialSetup](v16, "hasCompletedInitialSetup"));
  objc_msgSend(location[0], "setObject:forKeyedSubscript:", v2, CFSTR("hasCompletedInitialSetup"));

  v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BuddySetupAnalytics usedProximitySetup](v16, "usedProximitySetup"));
  objc_msgSend(location[0], "setObject:forKeyedSubscript:", v3, CFSTR("usedProximitySetup"));

  v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BuddySetupAnalytics dataTransferMethod](v16, "dataTransferMethod"));
  objc_msgSend(location[0], "setObject:forKeyedSubscript:", v4, CFSTR("dataTransferMethod"));

  v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BuddySetupAnalytics inAppleStore](v16, "inAppleStore"));
  objc_msgSend(location[0], "setObject:forKeyedSubscript:", v5, CFSTR("inAppleStore"));

  v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BuddySetupAnalytics softwareUpdatePerformed](v16, "softwareUpdatePerformed"));
  objc_msgSend(location[0], "setObject:forKeyedSubscript:", v6, CFSTR("softwareUpdatePerformed"));

  v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BuddySetupAnalytics numberOfPanesPresented](v16, "numberOfPanesPresented"));
  objc_msgSend(location[0], "setObject:forKeyedSubscript:", v7, CFSTR("numberOfPanesPresented"));

  -[BuddySetupAnalytics activeDuration](v16, "activeDuration");
  v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  objc_msgSend(location[0], "setObject:forKeyedSubscript:", v8, CFSTR("activeDuration"));

  -[BuddySetupAnalytics backgroundDuration](v16, "backgroundDuration");
  v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  objc_msgSend(location[0], "setObject:forKeyedSubscript:", v9, CFSTR("backgroundDuration"));

  -[BuddySetupAnalytics otherDuration](v16, "otherDuration");
  v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  objc_msgSend(location[0], "setObject:forKeyedSubscript:", v10, CFSTR("otherDuration"));

  v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BuddySetupAnalytics isSignedIntoAppleID](v16, "isSignedIntoAppleID"));
  objc_msgSend(location[0], "setObject:forKeyedSubscript:", v11, CFSTR("isSignedIntoAppleID"));

  v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BuddySetupAnalytics followUpItemsCount](v16, "followUpItemsCount"));
  objc_msgSend(location[0], "setObject:forKeyedSubscript:", v12, CFSTR("followUpItemsCount"));

  v13 = location[0];
  objc_storeStrong(location, 0);
  return v13;
}

- (BOOL)hasCompletedInitialSetup
{
  return self->_hasCompletedInitialSetup;
}

- (void)setHasCompletedInitialSetup:(BOOL)a3
{
  self->_hasCompletedInitialSetup = a3;
}

- (BOOL)usedProximitySetup
{
  return self->_usedProximitySetup;
}

- (void)setUsedProximitySetup:(BOOL)a3
{
  self->_usedProximitySetup = a3;
}

- (BOOL)isSignedIntoAppleID
{
  return self->_isSignedIntoAppleID;
}

- (void)setIsSignedIntoAppleID:(BOOL)a3
{
  self->_isSignedIntoAppleID = a3;
}

- (unint64_t)dataTransferMethod
{
  return self->_dataTransferMethod;
}

- (void)setDataTransferMethod:(unint64_t)a3
{
  self->_dataTransferMethod = a3;
}

- (BOOL)inAppleStore
{
  return self->_inAppleStore;
}

- (void)setInAppleStore:(BOOL)a3
{
  self->_inAppleStore = a3;
}

- (BOOL)softwareUpdatePerformed
{
  return self->_softwareUpdatePerformed;
}

- (void)setSoftwareUpdatePerformed:(BOOL)a3
{
  self->_softwareUpdatePerformed = a3;
}

- (unint64_t)numberOfPanesPresented
{
  return self->_numberOfPanesPresented;
}

- (void)setNumberOfPanesPresented:(unint64_t)a3
{
  self->_numberOfPanesPresented = a3;
}

- (unint64_t)followUpItemsCount
{
  return self->_followUpItemsCount;
}

- (void)setFollowUpItemsCount:(unint64_t)a3
{
  self->_followUpItemsCount = a3;
}

- (double)activeDuration
{
  return self->_activeDuration;
}

- (void)setActiveDuration:(double)a3
{
  self->_activeDuration = a3;
}

- (double)backgroundDuration
{
  return self->_backgroundDuration;
}

- (void)setBackgroundDuration:(double)a3
{
  self->_backgroundDuration = a3;
}

- (double)otherDuration
{
  return self->_otherDuration;
}

- (void)setOtherDuration:(double)a3
{
  self->_otherDuration = a3;
}

- (BYPreferencesController)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
