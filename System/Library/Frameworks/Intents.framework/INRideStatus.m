@implementation INRideStatus

- (id)_intents_cacheableObjects
{
  id v3;
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
  void *v16;
  id v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[INRideStatus vehicle](self, "vehicle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_intents_cacheableObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  -[INRideStatus driver](self, "driver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_intents_cacheableObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v7);

  -[INRideStatus rideOption](self, "rideOption");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_intents_cacheableObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v9);

  -[INRideStatus userActivityForCancelingInApplication](self, "userActivityForCancelingInApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[INRideStatus userActivityForCancelingInApplication](self, "userActivityForCancelingInApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  -[INRideStatus completionStatus](self, "completionStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_intents_cacheableObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v13);

  -[INRideStatus additionalActionActivities](self, "additionalActionActivities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[INRideStatus additionalActionActivities](self, "additionalActionActivities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v15);

  }
  if (objc_msgSend(v3, "count"))
    v16 = v3;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[INRideStatus vehicle](self, "vehicle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);

  -[INRideStatus driver](self, "driver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_intents_updateContainerWithCache:", v4);

  -[INRideStatus rideOption](self, "rideOption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_intents_updateContainerWithCache:", v4);

  -[INRideStatus completionStatus](self, "completionStatus");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_intents_updateContainerWithCache:", v4);

}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(NSArray *)waypoints
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;

  v4 = waypoints;
  v7 = v4;
  if (v4)
  {
    if (-[NSArray count](v4, "count"))
    {
      v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v7, 1);
      v6 = self->_waypoints;
      self->_waypoints = v5;
    }
    else
    {
      v6 = self->_waypoints;
      self->_waypoints = (NSArray *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v6 = self->_waypoints;
    self->_waypoints = 0;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setRideIdentifier:", self->_rideIdentifier);
  objc_msgSend(v4, "setPhase:", self->_phase);
  objc_msgSend(v4, "setVehicle:", self->_vehicle);
  objc_msgSend(v4, "setDriver:", self->_driver);
  objc_msgSend(v4, "setEstimatedPickupDate:", self->_estimatedPickupDate);
  objc_msgSend(v4, "setEstimatedDropOffDate:", self->_estimatedDropOffDate);
  objc_msgSend(v4, "setEstimatedPickupEndDate:", self->_estimatedPickupEndDate);
  objc_msgSend(v4, "setPickupLocation:", self->_pickupLocation);
  objc_msgSend(v4, "setWaypoints:", self->_waypoints);
  objc_msgSend(v4, "setDropOffLocation:", self->_dropOffLocation);
  objc_msgSend(v4, "setRideOption:", self->_rideOption);
  objc_msgSend(v4, "setCompletionStatus:", self->_completionStatus);
  objc_msgSend(v4, "setUserActivityForCancelingInApplication:", self->_userActivityForCancelingInApplication);
  objc_msgSend(v4, "setAdditionalActionActivities:", self->_additionalActionActivities);
  objc_msgSend(v4, "setScheduledPickupTime:", self->_scheduledPickupTime);
  return v4;
}

- (INRideStatus)initWithCoder:(id)a3
{
  id v4;
  INRideStatus *v5;
  uint64_t v6;
  NSString *rideIdentifier;
  uint64_t v8;
  INRideVehicle *vehicle;
  uint64_t v10;
  INRideDriver *driver;
  uint64_t v12;
  NSDate *estimatedPickupDate;
  uint64_t v14;
  NSDate *estimatedDropOffDate;
  uint64_t v16;
  NSDate *estimatedPickupEndDate;
  uint64_t v18;
  CLPlacemark *pickupLocation;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *waypoints;
  uint64_t v25;
  CLPlacemark *dropOffLocation;
  uint64_t v27;
  INRideOption *rideOption;
  uint64_t v29;
  INRideCompletionStatus *completionStatus;
  uint64_t v31;
  INDateComponentsRange *scheduledPickupTime;
  void *v33;
  uint64_t v34;
  NSUserActivity *userActivityForCancelingInApplication;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  uint64_t v48;
  NSArray *additionalActionActivities;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _BYTE v56[128];
  _QWORD v57[2];
  _QWORD v58[4];

  v58[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)INRideStatus;
  v5 = -[INRideStatus init](&v55, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rideIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    rideIdentifier = v5->_rideIdentifier;
    v5->_rideIdentifier = (NSString *)v6;

    v5->_phase = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("phase"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vehicle"));
    v8 = objc_claimAutoreleasedReturnValue();
    vehicle = v5->_vehicle;
    v5->_vehicle = (INRideVehicle *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("driver"));
    v10 = objc_claimAutoreleasedReturnValue();
    driver = v5->_driver;
    v5->_driver = (INRideDriver *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("estimatedPickupDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    estimatedPickupDate = v5->_estimatedPickupDate;
    v5->_estimatedPickupDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("estimatedDropOffDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    estimatedDropOffDate = v5->_estimatedDropOffDate;
    v5->_estimatedDropOffDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("estimatedPickupEndDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    estimatedPickupEndDate = v5->_estimatedPickupEndDate;
    v5->_estimatedPickupEndDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pickupLocation"));
    v18 = objc_claimAutoreleasedReturnValue();
    pickupLocation = v5->_pickupLocation;
    v5->_pickupLocation = (CLPlacemark *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v58[0] = objc_opt_class();
    v58[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("waypoints"));
    v23 = objc_claimAutoreleasedReturnValue();
    waypoints = v5->_waypoints;
    v5->_waypoints = (NSArray *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dropOffLocation"));
    v25 = objc_claimAutoreleasedReturnValue();
    dropOffLocation = v5->_dropOffLocation;
    v5->_dropOffLocation = (CLPlacemark *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rideOption"));
    v27 = objc_claimAutoreleasedReturnValue();
    rideOption = v5->_rideOption;
    v5->_rideOption = (INRideOption *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("completionStatus"));
    v29 = objc_claimAutoreleasedReturnValue();
    completionStatus = v5->_completionStatus;
    v5->_completionStatus = (INRideCompletionStatus *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scheduledPickupTime"));
    v31 = objc_claimAutoreleasedReturnValue();
    scheduledPickupTime = v5->_scheduledPickupTime;
    v5->_scheduledPickupTime = (INDateComponentsRange *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivityForCancelingInApplication"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    INUserActivityDeserializeFromData(v33);
    v34 = objc_claimAutoreleasedReturnValue();
    userActivityForCancelingInApplication = v5->_userActivityForCancelingInApplication;
    v5->_userActivityForCancelingInApplication = (NSUserActivity *)v34;

    v36 = (void *)MEMORY[0x1E0C99E60];
    v57[0] = objc_opt_class();
    v57[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setWithArray:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("additionalActionActivities"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v40 = v39;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v41)
    {
      v42 = v41;
      v43 = 0;
      v44 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v52 != v44)
            objc_enumerationMutation(v40);
          v46 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if (!v43)
            v43 = (void *)objc_opt_new();
          INUserActivityDeserializeFromData(v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (v47)
            objc_msgSend(v43, "addObject:", v47, (_QWORD)v51);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v42);
    }
    else
    {
      v43 = 0;
    }

    v48 = objc_msgSend(v43, "copy");
    additionalActionActivities = v5->_additionalActionActivities;
    v5->_additionalActionActivities = (NSArray *)v48;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_rideIdentifier, CFSTR("rideIdentifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_phase, CFSTR("phase"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_vehicle, CFSTR("vehicle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_driver, CFSTR("driver"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_estimatedPickupDate, CFSTR("estimatedPickupDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_estimatedDropOffDate, CFSTR("estimatedDropOffDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_estimatedPickupEndDate, CFSTR("estimatedPickupEndDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pickupLocation, CFSTR("pickupLocation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_waypoints, CFSTR("waypoints"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dropOffLocation, CFSTR("dropOffLocation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_rideOption, CFSTR("rideOption"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_completionStatus, CFSTR("completionStatus"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_scheduledPickupTime, CFSTR("scheduledPickupTime"));
  INUserActivitySerializeToData(self->_userActivityForCancelingInApplication);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("userActivityForCancelingInApplication"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_additionalActionActivities;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        INUserActivitySerializeToData(*(void **)(*((_QWORD *)&v14 + 1) + 8 * i));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          if (!v9)
            v9 = (void *)objc_opt_new();
          objc_msgSend(v9, "addObject:", v12, (_QWORD)v14);
        }

      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v13 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("additionalActionActivities"));

}

- (NSString)description
{
  return (NSString *)-[INRideStatus descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INRideStatus;
  -[INRideStatus description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRideStatus _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INRidePhase v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t rideIdentifier;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  CLPlacemark *pickupLocation;
  uint64_t v15;
  NSArray *waypoints;
  uint64_t v17;
  CLPlacemark *dropOffLocation;
  uint64_t v19;
  INRideOption *rideOption;
  void *v21;
  NSUserActivity *userActivityForCancelingInApplication;
  void *v23;
  NSArray *additionalActionActivities;
  void *v25;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  INDateComponentsRange *scheduledPickupTime;
  NSDate *estimatedPickupEndDate;
  NSDate *estimatedDropOffDate;
  void *v38;
  NSDate *estimatedPickupDate;
  void *v40;
  INRideDriver *driver;
  void *v42;
  INRideVehicle *vehicle;
  void *v44;
  INRideCompletionStatus *completionStatus;
  uint64_t v46;
  __CFString *v47;
  _QWORD v48[15];
  _QWORD v49[17];

  v49[15] = *MEMORY[0x1E0C80C00];
  v3 = -[INRideStatus phase](self, "phase");
  if ((unint64_t)(v3 - 1) > 5)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E228BA68[v3 - 1];
  v5 = v4;
  v48[0] = CFSTR("rideIdentifier");
  rideIdentifier = (uint64_t)self->_rideIdentifier;
  v46 = rideIdentifier;
  if (!rideIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    rideIdentifier = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)rideIdentifier;
  v49[0] = rideIdentifier;
  v49[1] = v5;
  v48[1] = CFSTR("phase");
  v48[2] = CFSTR("completionStatus");
  completionStatus = self->_completionStatus;
  v7 = (uint64_t)completionStatus;
  if (!completionStatus)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v49[2] = v7;
  v48[3] = CFSTR("vehicle");
  vehicle = self->_vehicle;
  v8 = (uint64_t)vehicle;
  if (!vehicle)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v49[3] = v8;
  v48[4] = CFSTR("driver");
  driver = self->_driver;
  v9 = (uint64_t)driver;
  if (!driver)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v49[4] = v9;
  v48[5] = CFSTR("estimatedPickupDate");
  estimatedPickupDate = self->_estimatedPickupDate;
  v10 = (uint64_t)estimatedPickupDate;
  if (!estimatedPickupDate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v49[5] = v10;
  v48[6] = CFSTR("estimatedDropOffDate");
  estimatedDropOffDate = self->_estimatedDropOffDate;
  v11 = estimatedDropOffDate;
  if (!estimatedDropOffDate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v49[6] = v11;
  v48[7] = CFSTR("estimatedPickupEndDate");
  estimatedPickupEndDate = self->_estimatedPickupEndDate;
  v12 = (uint64_t)estimatedPickupEndDate;
  if (!estimatedPickupEndDate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v7;
  v49[7] = v12;
  v48[8] = CFSTR("scheduledPickupTime");
  scheduledPickupTime = self->_scheduledPickupTime;
  v13 = (uint64_t)scheduledPickupTime;
  if (!scheduledPickupTime)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v47 = v5;
  v31 = (void *)v13;
  v49[8] = v13;
  v48[9] = CFSTR("pickupLocation");
  pickupLocation = self->_pickupLocation;
  v15 = (uint64_t)pickupLocation;
  if (!pickupLocation)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v8;
  v30 = (void *)v15;
  v49[9] = v15;
  v48[10] = CFSTR("waypoints");
  waypoints = self->_waypoints;
  v17 = (uint64_t)waypoints;
  if (!waypoints)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v9;
  v29 = (void *)v17;
  v49[10] = v17;
  v48[11] = CFSTR("dropOffLocation");
  dropOffLocation = self->_dropOffLocation;
  v19 = (uint64_t)dropOffLocation;
  if (!dropOffLocation)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v12;
  v38 = (void *)v10;
  v27 = v19;
  v49[11] = v19;
  v48[12] = CFSTR("rideOption");
  rideOption = self->_rideOption;
  v21 = rideOption;
  if (!rideOption)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v19, v29, v30, v31, v32, v33);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v49[12] = v21;
  v48[13] = CFSTR("userActivityForCancelingInApplication");
  userActivityForCancelingInApplication = self->_userActivityForCancelingInApplication;
  v23 = userActivityForCancelingInApplication;
  if (!userActivityForCancelingInApplication)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v49[13] = v23;
  v48[14] = CFSTR("additionalActionActivities");
  additionalActionActivities = self->_additionalActionActivities;
  v25 = additionalActionActivities;
  if (!additionalActionActivities)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v49[14] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 15, v27);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (additionalActionActivities)
  {
    if (userActivityForCancelingInApplication)
      goto LABEL_34;
LABEL_59:

    if (rideOption)
      goto LABEL_35;
    goto LABEL_60;
  }

  if (!userActivityForCancelingInApplication)
    goto LABEL_59;
LABEL_34:
  if (rideOption)
    goto LABEL_35;
LABEL_60:

LABEL_35:
  if (!dropOffLocation)

  if (!waypoints)
  if (!pickupLocation)

  if (!scheduledPickupTime)
  if (!estimatedPickupEndDate)

  if (!estimatedDropOffDate)
  if (!estimatedPickupDate)

  if (!driver)
  if (!vehicle)

  if (!completionStatus)
  if (!v46)

  return v34;
}

- (NSString)rideIdentifier
{
  return self->_rideIdentifier;
}

- (void)setRideIdentifier:(NSString *)rideIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, rideIdentifier, 16);
}

- (INRidePhase)phase
{
  return self->_phase;
}

- (void)setPhase:(INRidePhase)phase
{
  self->_phase = phase;
}

- (INRideCompletionStatus)completionStatus
{
  return self->_completionStatus;
}

- (void)setCompletionStatus:(INRideCompletionStatus *)completionStatus
{
  objc_setProperty_nonatomic_copy(self, a2, completionStatus, 32);
}

- (INRideVehicle)vehicle
{
  return self->_vehicle;
}

- (void)setVehicle:(INRideVehicle *)vehicle
{
  objc_setProperty_nonatomic_copy(self, a2, vehicle, 40);
}

- (INRideDriver)driver
{
  return self->_driver;
}

- (void)setDriver:(INRideDriver *)driver
{
  objc_setProperty_nonatomic_copy(self, a2, driver, 48);
}

- (NSDate)estimatedPickupDate
{
  return self->_estimatedPickupDate;
}

- (void)setEstimatedPickupDate:(NSDate *)estimatedPickupDate
{
  objc_setProperty_nonatomic_copy(self, a2, estimatedPickupDate, 56);
}

- (NSDate)estimatedDropOffDate
{
  return self->_estimatedDropOffDate;
}

- (void)setEstimatedDropOffDate:(NSDate *)estimatedDropOffDate
{
  objc_setProperty_nonatomic_copy(self, a2, estimatedDropOffDate, 64);
}

- (NSDate)estimatedPickupEndDate
{
  return self->_estimatedPickupEndDate;
}

- (void)setEstimatedPickupEndDate:(NSDate *)estimatedPickupEndDate
{
  objc_setProperty_nonatomic_copy(self, a2, estimatedPickupEndDate, 72);
}

- (INDateComponentsRange)scheduledPickupTime
{
  return self->_scheduledPickupTime;
}

- (void)setScheduledPickupTime:(INDateComponentsRange *)scheduledPickupTime
{
  objc_setProperty_nonatomic_copy(self, a2, scheduledPickupTime, 80);
}

- (CLPlacemark)pickupLocation
{
  return self->_pickupLocation;
}

- (void)setPickupLocation:(CLPlacemark *)pickupLocation
{
  objc_setProperty_nonatomic_copy(self, a2, pickupLocation, 88);
}

- (CLPlacemark)dropOffLocation
{
  return self->_dropOffLocation;
}

- (void)setDropOffLocation:(CLPlacemark *)dropOffLocation
{
  objc_setProperty_nonatomic_copy(self, a2, dropOffLocation, 96);
}

- (INRideOption)rideOption
{
  return self->_rideOption;
}

- (void)setRideOption:(INRideOption *)rideOption
{
  objc_setProperty_nonatomic_copy(self, a2, rideOption, 104);
}

- (NSUserActivity)userActivityForCancelingInApplication
{
  return self->_userActivityForCancelingInApplication;
}

- (void)setUserActivityForCancelingInApplication:(NSUserActivity *)userActivityForCancelingInApplication
{
  objc_storeStrong((id *)&self->_userActivityForCancelingInApplication, userActivityForCancelingInApplication);
}

- (NSArray)additionalActionActivities
{
  return self->_additionalActionActivities;
}

- (void)setAdditionalActionActivities:(NSArray *)additionalActionActivities
{
  objc_setProperty_nonatomic_copy(self, a2, additionalActionActivities, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalActionActivities, 0);
  objc_storeStrong((id *)&self->_userActivityForCancelingInApplication, 0);
  objc_storeStrong((id *)&self->_rideOption, 0);
  objc_storeStrong((id *)&self->_dropOffLocation, 0);
  objc_storeStrong((id *)&self->_pickupLocation, 0);
  objc_storeStrong((id *)&self->_scheduledPickupTime, 0);
  objc_storeStrong((id *)&self->_estimatedPickupEndDate, 0);
  objc_storeStrong((id *)&self->_estimatedDropOffDate, 0);
  objc_storeStrong((id *)&self->_estimatedPickupDate, 0);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_completionStatus, 0);
  objc_storeStrong((id *)&self->_rideIdentifier, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  INImageProxyInjectionOperation *v15;
  void *v16;
  INImageProxyInjectionOperation *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)-[INRideStatus copy](self, "copy");
    v9 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    INImageProxyInjectionQueue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUnderlyingQueue:", v10);

    objc_msgSend(v9, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(v9, "setSuspended:", 1);
    v11 = (void *)MEMORY[0x1E0CB34C8];
    v12 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __74__INRideStatus_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
    v20[3] = &unk_1E2293BE8;
    v20[4] = v8;
    v21 = v7;
    objc_msgSend(v11, "blockOperationWithBlock:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[INRideStatus vehicle](self, "vehicle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = objc_alloc_init(INImageProxyInjectionOperation);
      -[INImageProxyInjectionOperation setInjector:](v15, "setInjector:", v14);
      -[INImageProxyInjectionOperation setImageProxyRequestBlock:](v15, "setImageProxyRequestBlock:", v6);
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __74__INRideStatus_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2;
      v19[3] = &unk_1E22924C0;
      v19[4] = v8;
      -[INImageProxyInjectionOperation setCopyReturnBlock:](v15, "setCopyReturnBlock:", v19);
      objc_msgSend(v13, "addDependency:", v15);
      objc_msgSend(v9, "addOperation:", v15);

    }
    -[INRideStatus driver](self, "driver");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = objc_alloc_init(INImageProxyInjectionOperation);
      -[INImageProxyInjectionOperation setInjector:](v17, "setInjector:", v16);
      -[INImageProxyInjectionOperation setImageProxyRequestBlock:](v17, "setImageProxyRequestBlock:", v6);
      v18[0] = v12;
      v18[1] = 3221225472;
      v18[2] = __74__INRideStatus_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3;
      v18[3] = &unk_1E22924C0;
      v18[4] = v8;
      -[INImageProxyInjectionOperation setCopyReturnBlock:](v17, "setCopyReturnBlock:", v18);
      objc_msgSend(v13, "addDependency:", v17);
      objc_msgSend(v9, "addOperation:", v17);

    }
    objc_msgSend(v9, "addOperation:", v13);
    objc_msgSend(v9, "setSuspended:", 0);

  }
}

uint64_t __74__INRideStatus_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __74__INRideStatus_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setVehicle:", a2);
  return result;
}

uint64_t __74__INRideStatus_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setDriver:", a2);
  return result;
}

@end
