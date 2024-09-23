@implementation _INPBRideStatus

- (void)setAdditionalActionItems:(id)a3
{
  NSArray *v4;
  NSArray *additionalActionItems;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  additionalActionItems = self->_additionalActionItems;
  self->_additionalActionItems = v4;

}

- (void)clearAdditionalActionItems
{
  -[NSArray removeAllObjects](self->_additionalActionItems, "removeAllObjects");
}

- (void)addAdditionalActionItems:(id)a3
{
  id v4;
  NSArray *additionalActionItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  additionalActionItems = self->_additionalActionItems;
  v8 = v4;
  if (!additionalActionItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_additionalActionItems;
    self->_additionalActionItems = v6;

    v4 = v8;
    additionalActionItems = self->_additionalActionItems;
  }
  -[NSArray addObject:](additionalActionItems, "addObject:", v4);

}

- (unint64_t)additionalActionItemsCount
{
  return -[NSArray count](self->_additionalActionItems, "count");
}

- (id)additionalActionItemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_additionalActionItems, "objectAtIndexedSubscript:", a3);
}

- (void)setCompletionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_completionStatus, a3);
}

- (BOOL)hasCompletionStatus
{
  return self->_completionStatus != 0;
}

- (void)setDriver:(id)a3
{
  objc_storeStrong((id *)&self->_driver, a3);
}

- (BOOL)hasDriver
{
  return self->_driver != 0;
}

- (void)setDropOffLocation:(id)a3
{
  objc_storeStrong((id *)&self->_dropOffLocation, a3);
}

- (BOOL)hasDropOffLocation
{
  return self->_dropOffLocation != 0;
}

- (void)setEstimatedDropOffDate:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedDropOffDate, a3);
}

- (BOOL)hasEstimatedDropOffDate
{
  return self->_estimatedDropOffDate != 0;
}

- (void)setEstimatedPickupDate:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedPickupDate, a3);
}

- (BOOL)hasEstimatedPickupDate
{
  return self->_estimatedPickupDate != 0;
}

- (void)setEstimatedPickupEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedPickupEndDate, a3);
}

- (BOOL)hasEstimatedPickupEndDate
{
  return self->_estimatedPickupEndDate != 0;
}

- (void)setPhase:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_phase = a3;
  }
}

- (BOOL)hasPhase
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPhase:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)phaseAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((a3 - 1) < 7 && ((0x6Fu >> v3) & 1) != 0)
  {
    v4 = off_1E228E288[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsPhase:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECEIVED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONFIRMED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ONGOING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMPLETED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPROACHING_PICKUP")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PICKUP")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setPickupLocation:(id)a3
{
  objc_storeStrong((id *)&self->_pickupLocation, a3);
}

- (BOOL)hasPickupLocation
{
  return self->_pickupLocation != 0;
}

- (void)setRideIdentifier:(id)a3
{
  NSString *v4;
  NSString *rideIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  rideIdentifier = self->_rideIdentifier;
  self->_rideIdentifier = v4;

}

- (BOOL)hasRideIdentifier
{
  return self->_rideIdentifier != 0;
}

- (void)setRideOption:(id)a3
{
  objc_storeStrong((id *)&self->_rideOption, a3);
}

- (BOOL)hasRideOption
{
  return self->_rideOption != 0;
}

- (void)setScheduledPickupTime:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledPickupTime, a3);
}

- (BOOL)hasScheduledPickupTime
{
  return self->_scheduledPickupTime != 0;
}

- (void)setUserActivityForCancelingInApplication:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityForCancelingInApplication, a3);
}

- (BOOL)hasUserActivityForCancelingInApplication
{
  return self->_userActivityForCancelingInApplication != 0;
}

- (void)setVehicle:(id)a3
{
  objc_storeStrong((id *)&self->_vehicle, a3);
}

- (BOOL)hasVehicle
{
  return self->_vehicle != 0;
}

- (void)setWaypoints:(id)a3
{
  NSArray *v4;
  NSArray *waypoints;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  waypoints = self->_waypoints;
  self->_waypoints = v4;

}

- (void)clearWaypoints
{
  -[NSArray removeAllObjects](self->_waypoints, "removeAllObjects");
}

- (void)addWaypoints:(id)a3
{
  id v4;
  NSArray *waypoints;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  waypoints = self->_waypoints;
  v8 = v4;
  if (!waypoints)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_waypoints;
    self->_waypoints = v6;

    v4 = v8;
    waypoints = self->_waypoints;
  }
  -[NSArray addObject:](waypoints, "addObject:", v4);

}

- (unint64_t)waypointsCount
{
  return -[NSArray count](self->_waypoints, "count");
}

- (id)waypointsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_waypoints, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRideStatusReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v5 = self->_additionalActionItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v43;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v43 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v7);
  }

  -[_INPBRideStatus completionStatus](self, "completionStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBRideStatus completionStatus](self, "completionStatus");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRideStatus driver](self, "driver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBRideStatus driver](self, "driver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRideStatus dropOffLocation](self, "dropOffLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBRideStatus dropOffLocation](self, "dropOffLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRideStatus estimatedDropOffDate](self, "estimatedDropOffDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBRideStatus estimatedDropOffDate](self, "estimatedDropOffDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRideStatus estimatedPickupDate](self, "estimatedPickupDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[_INPBRideStatus estimatedPickupDate](self, "estimatedPickupDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRideStatus estimatedPickupEndDate](self, "estimatedPickupEndDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[_INPBRideStatus estimatedPickupEndDate](self, "estimatedPickupEndDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBRideStatus hasPhase](self, "hasPhase"))
    PBDataWriterWriteInt32Field();
  -[_INPBRideStatus pickupLocation](self, "pickupLocation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[_INPBRideStatus pickupLocation](self, "pickupLocation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRideStatus rideIdentifier](self, "rideIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    PBDataWriterWriteStringField();
  -[_INPBRideStatus rideOption](self, "rideOption");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[_INPBRideStatus rideOption](self, "rideOption");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRideStatus scheduledPickupTime](self, "scheduledPickupTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[_INPBRideStatus scheduledPickupTime](self, "scheduledPickupTime");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRideStatus userActivityForCancelingInApplication](self, "userActivityForCancelingInApplication");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[_INPBRideStatus userActivityForCancelingInApplication](self, "userActivityForCancelingInApplication");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRideStatus vehicle](self, "vehicle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[_INPBRideStatus vehicle](self, "vehicle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v33 = self->_waypoints;
  v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v39;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v39 != v36)
          objc_enumerationMutation(v33);
        PBDataWriterWriteSubmessage();
        ++v37;
      }
      while (v35 != v37);
      v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v35);
  }

}

- (_INPBRideStatus)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRideStatus *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRideStatus *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRideStatus *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRideStatus initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBRideStatus data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRideStatus *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v5 = -[_INPBRideStatus init](+[_INPBRideStatus allocWithZone:](_INPBRideStatus, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_additionalActionItems, "copyWithZone:", a3);
  -[_INPBRideStatus setAdditionalActionItems:](v5, "setAdditionalActionItems:", v6);

  v7 = -[_INPBRideCompletionStatus copyWithZone:](self->_completionStatus, "copyWithZone:", a3);
  -[_INPBRideStatus setCompletionStatus:](v5, "setCompletionStatus:", v7);

  v8 = -[_INPBRideDriver copyWithZone:](self->_driver, "copyWithZone:", a3);
  -[_INPBRideStatus setDriver:](v5, "setDriver:", v8);

  v9 = -[_INPBLocationValue copyWithZone:](self->_dropOffLocation, "copyWithZone:", a3);
  -[_INPBRideStatus setDropOffLocation:](v5, "setDropOffLocation:", v9);

  v10 = -[_INPBTimestamp copyWithZone:](self->_estimatedDropOffDate, "copyWithZone:", a3);
  -[_INPBRideStatus setEstimatedDropOffDate:](v5, "setEstimatedDropOffDate:", v10);

  v11 = -[_INPBTimestamp copyWithZone:](self->_estimatedPickupDate, "copyWithZone:", a3);
  -[_INPBRideStatus setEstimatedPickupDate:](v5, "setEstimatedPickupDate:", v11);

  v12 = -[_INPBTimestamp copyWithZone:](self->_estimatedPickupEndDate, "copyWithZone:", a3);
  -[_INPBRideStatus setEstimatedPickupEndDate:](v5, "setEstimatedPickupEndDate:", v12);

  if (-[_INPBRideStatus hasPhase](self, "hasPhase"))
    -[_INPBRideStatus setPhase:](v5, "setPhase:", -[_INPBRideStatus phase](self, "phase"));
  v13 = -[_INPBLocationValue copyWithZone:](self->_pickupLocation, "copyWithZone:", a3);
  -[_INPBRideStatus setPickupLocation:](v5, "setPickupLocation:", v13);

  v14 = (void *)-[NSString copyWithZone:](self->_rideIdentifier, "copyWithZone:", a3);
  -[_INPBRideStatus setRideIdentifier:](v5, "setRideIdentifier:", v14);

  v15 = -[_INPBRideOption copyWithZone:](self->_rideOption, "copyWithZone:", a3);
  -[_INPBRideStatus setRideOption:](v5, "setRideOption:", v15);

  v16 = -[_INPBDateTimeRangeValue copyWithZone:](self->_scheduledPickupTime, "copyWithZone:", a3);
  -[_INPBRideStatus setScheduledPickupTime:](v5, "setScheduledPickupTime:", v16);

  v17 = -[_INPBUserActivity copyWithZone:](self->_userActivityForCancelingInApplication, "copyWithZone:", a3);
  -[_INPBRideStatus setUserActivityForCancelingInApplication:](v5, "setUserActivityForCancelingInApplication:", v17);

  v18 = -[_INPBRideVehicle copyWithZone:](self->_vehicle, "copyWithZone:", a3);
  -[_INPBRideStatus setVehicle:](v5, "setVehicle:", v18);

  v19 = (void *)-[NSArray copyWithZone:](self->_waypoints, "copyWithZone:", a3);
  -[_INPBRideStatus setWaypoints:](v5, "setWaypoints:", v19);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  int v42;
  int phase;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  BOOL v79;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_76;
  -[_INPBRideStatus additionalActionItems](self, "additionalActionItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additionalActionItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBRideStatus additionalActionItems](self, "additionalActionItems");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBRideStatus additionalActionItems](self, "additionalActionItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "additionalActionItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_76;
  }
  else
  {

  }
  -[_INPBRideStatus completionStatus](self, "completionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBRideStatus completionStatus](self, "completionStatus");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBRideStatus completionStatus](self, "completionStatus");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "completionStatus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_76;
  }
  else
  {

  }
  -[_INPBRideStatus driver](self, "driver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "driver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBRideStatus driver](self, "driver");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBRideStatus driver](self, "driver");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "driver");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_76;
  }
  else
  {

  }
  -[_INPBRideStatus dropOffLocation](self, "dropOffLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dropOffLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBRideStatus dropOffLocation](self, "dropOffLocation");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBRideStatus dropOffLocation](self, "dropOffLocation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dropOffLocation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_76;
  }
  else
  {

  }
  -[_INPBRideStatus estimatedDropOffDate](self, "estimatedDropOffDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "estimatedDropOffDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBRideStatus estimatedDropOffDate](self, "estimatedDropOffDate");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBRideStatus estimatedDropOffDate](self, "estimatedDropOffDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "estimatedDropOffDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_76;
  }
  else
  {

  }
  -[_INPBRideStatus estimatedPickupDate](self, "estimatedPickupDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "estimatedPickupDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBRideStatus estimatedPickupDate](self, "estimatedPickupDate");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBRideStatus estimatedPickupDate](self, "estimatedPickupDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "estimatedPickupDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_76;
  }
  else
  {

  }
  -[_INPBRideStatus estimatedPickupEndDate](self, "estimatedPickupEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "estimatedPickupEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBRideStatus estimatedPickupEndDate](self, "estimatedPickupEndDate");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_INPBRideStatus estimatedPickupEndDate](self, "estimatedPickupEndDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "estimatedPickupEndDate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_76;
  }
  else
  {

  }
  v42 = -[_INPBRideStatus hasPhase](self, "hasPhase");
  if (v42 != objc_msgSend(v4, "hasPhase"))
    goto LABEL_76;
  if (-[_INPBRideStatus hasPhase](self, "hasPhase"))
  {
    if (objc_msgSend(v4, "hasPhase"))
    {
      phase = self->_phase;
      if (phase != objc_msgSend(v4, "phase"))
        goto LABEL_76;
    }
  }
  -[_INPBRideStatus pickupLocation](self, "pickupLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pickupLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBRideStatus pickupLocation](self, "pickupLocation");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    -[_INPBRideStatus pickupLocation](self, "pickupLocation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pickupLocation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "isEqual:", v47);

    if (!v48)
      goto LABEL_76;
  }
  else
  {

  }
  -[_INPBRideStatus rideIdentifier](self, "rideIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rideIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBRideStatus rideIdentifier](self, "rideIdentifier");
  v49 = objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v50 = (void *)v49;
    -[_INPBRideStatus rideIdentifier](self, "rideIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rideIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "isEqual:", v52);

    if (!v53)
      goto LABEL_76;
  }
  else
  {

  }
  -[_INPBRideStatus rideOption](self, "rideOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rideOption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBRideStatus rideOption](self, "rideOption");
  v54 = objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v55 = (void *)v54;
    -[_INPBRideStatus rideOption](self, "rideOption");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rideOption");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v56, "isEqual:", v57);

    if (!v58)
      goto LABEL_76;
  }
  else
  {

  }
  -[_INPBRideStatus scheduledPickupTime](self, "scheduledPickupTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduledPickupTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBRideStatus scheduledPickupTime](self, "scheduledPickupTime");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = (void *)v59;
    -[_INPBRideStatus scheduledPickupTime](self, "scheduledPickupTime");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheduledPickupTime");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "isEqual:", v62);

    if (!v63)
      goto LABEL_76;
  }
  else
  {

  }
  -[_INPBRideStatus userActivityForCancelingInApplication](self, "userActivityForCancelingInApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userActivityForCancelingInApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBRideStatus userActivityForCancelingInApplication](self, "userActivityForCancelingInApplication");
  v64 = objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v65 = (void *)v64;
    -[_INPBRideStatus userActivityForCancelingInApplication](self, "userActivityForCancelingInApplication");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userActivityForCancelingInApplication");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v66, "isEqual:", v67);

    if (!v68)
      goto LABEL_76;
  }
  else
  {

  }
  -[_INPBRideStatus vehicle](self, "vehicle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vehicle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_75;
  -[_INPBRideStatus vehicle](self, "vehicle");
  v69 = objc_claimAutoreleasedReturnValue();
  if (v69)
  {
    v70 = (void *)v69;
    -[_INPBRideStatus vehicle](self, "vehicle");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vehicle");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v71, "isEqual:", v72);

    if (!v73)
      goto LABEL_76;
  }
  else
  {

  }
  -[_INPBRideStatus waypoints](self, "waypoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "waypoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBRideStatus waypoints](self, "waypoints");
    v74 = objc_claimAutoreleasedReturnValue();
    if (!v74)
    {

LABEL_79:
      v79 = 1;
      goto LABEL_77;
    }
    v75 = (void *)v74;
    -[_INPBRideStatus waypoints](self, "waypoints");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "waypoints");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v76, "isEqual:", v77);

    if ((v78 & 1) != 0)
      goto LABEL_79;
  }
  else
  {
LABEL_75:

  }
LABEL_76:
  v79 = 0;
LABEL_77:

  return v79;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSUInteger v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v3 = -[NSArray hash](self->_additionalActionItems, "hash");
  v4 = -[_INPBRideCompletionStatus hash](self->_completionStatus, "hash");
  v5 = -[_INPBRideDriver hash](self->_driver, "hash");
  v6 = -[_INPBLocationValue hash](self->_dropOffLocation, "hash");
  v7 = -[_INPBTimestamp hash](self->_estimatedDropOffDate, "hash");
  v8 = -[_INPBTimestamp hash](self->_estimatedPickupDate, "hash");
  v9 = -[_INPBTimestamp hash](self->_estimatedPickupEndDate, "hash");
  if (-[_INPBRideStatus hasPhase](self, "hasPhase"))
    v10 = 2654435761 * self->_phase;
  else
    v10 = 0;
  v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v12 = v10 ^ -[_INPBLocationValue hash](self->_pickupLocation, "hash");
  v13 = v12 ^ -[NSString hash](self->_rideIdentifier, "hash");
  v14 = v11 ^ v13 ^ -[_INPBRideOption hash](self->_rideOption, "hash");
  v15 = -[_INPBDateTimeRangeValue hash](self->_scheduledPickupTime, "hash");
  v16 = v15 ^ -[_INPBUserActivity hash](self->_userActivityForCancelingInApplication, "hash");
  v17 = v16 ^ -[_INPBRideVehicle hash](self->_vehicle, "hash");
  return v14 ^ v17 ^ -[NSArray hash](self->_waypoints, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_additionalActionItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v5 = self->_additionalActionItems;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v51 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("additionalActionItems"));
  }
  -[_INPBRideStatus completionStatus](self, "completionStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("completionStatus"));

  -[_INPBRideStatus driver](self, "driver");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("driver"));

  -[_INPBRideStatus dropOffLocation](self, "dropOffLocation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("dropOffLocation"));

  -[_INPBRideStatus estimatedDropOffDate](self, "estimatedDropOffDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("estimatedDropOffDate"));

  -[_INPBRideStatus estimatedPickupDate](self, "estimatedPickupDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("estimatedPickupDate"));

  -[_INPBRideStatus estimatedPickupEndDate](self, "estimatedPickupEndDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dictionaryRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("estimatedPickupEndDate"));

  if (-[_INPBRideStatus hasPhase](self, "hasPhase"))
  {
    v23 = -[_INPBRideStatus phase](self, "phase");
    v24 = v23 - 1;
    if ((v23 - 1) < 7 && ((0x6Fu >> v24) & 1) != 0)
    {
      v25 = off_1E228E288[v24];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v23);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("phase"));

  }
  -[_INPBRideStatus pickupLocation](self, "pickupLocation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryRepresentation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("pickupLocation"));

  if (self->_rideIdentifier)
  {
    -[_INPBRideStatus rideIdentifier](self, "rideIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("rideIdentifier"));

  }
  -[_INPBRideStatus rideOption](self, "rideOption");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dictionaryRepresentation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("rideOption"));

  -[_INPBRideStatus scheduledPickupTime](self, "scheduledPickupTime");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "dictionaryRepresentation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("scheduledPickupTime"));

  -[_INPBRideStatus userActivityForCancelingInApplication](self, "userActivityForCancelingInApplication");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "dictionaryRepresentation");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("userActivityForCancelingInApplication"));

  -[_INPBRideStatus vehicle](self, "vehicle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "dictionaryRepresentation");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("vehicle"));

  if (-[NSArray count](self->_waypoints, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v39 = self->_waypoints;
    v40 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v47 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "dictionaryRepresentation");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v44);

        }
        v41 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v41);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("waypoints"));
  }
  return v3;
}

- (NSArray)additionalActionItems
{
  return self->_additionalActionItems;
}

- (_INPBRideCompletionStatus)completionStatus
{
  return self->_completionStatus;
}

- (_INPBRideDriver)driver
{
  return self->_driver;
}

- (_INPBLocationValue)dropOffLocation
{
  return self->_dropOffLocation;
}

- (_INPBTimestamp)estimatedDropOffDate
{
  return self->_estimatedDropOffDate;
}

- (_INPBTimestamp)estimatedPickupDate
{
  return self->_estimatedPickupDate;
}

- (_INPBTimestamp)estimatedPickupEndDate
{
  return self->_estimatedPickupEndDate;
}

- (int)phase
{
  return self->_phase;
}

- (_INPBLocationValue)pickupLocation
{
  return self->_pickupLocation;
}

- (NSString)rideIdentifier
{
  return self->_rideIdentifier;
}

- (_INPBRideOption)rideOption
{
  return self->_rideOption;
}

- (_INPBDateTimeRangeValue)scheduledPickupTime
{
  return self->_scheduledPickupTime;
}

- (_INPBUserActivity)userActivityForCancelingInApplication
{
  return self->_userActivityForCancelingInApplication;
}

- (_INPBRideVehicle)vehicle
{
  return self->_vehicle;
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_userActivityForCancelingInApplication, 0);
  objc_storeStrong((id *)&self->_scheduledPickupTime, 0);
  objc_storeStrong((id *)&self->_rideOption, 0);
  objc_storeStrong((id *)&self->_rideIdentifier, 0);
  objc_storeStrong((id *)&self->_pickupLocation, 0);
  objc_storeStrong((id *)&self->_estimatedPickupEndDate, 0);
  objc_storeStrong((id *)&self->_estimatedPickupDate, 0);
  objc_storeStrong((id *)&self->_estimatedDropOffDate, 0);
  objc_storeStrong((id *)&self->_dropOffLocation, 0);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_storeStrong((id *)&self->_completionStatus, 0);
  objc_storeStrong((id *)&self->_additionalActionItems, 0);
}

+ (Class)additionalActionItemsType
{
  return (Class)objc_opt_class();
}

+ (Class)waypointsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
