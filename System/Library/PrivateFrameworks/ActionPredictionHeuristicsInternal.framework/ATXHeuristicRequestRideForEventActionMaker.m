@implementation ATXHeuristicRequestRideForEventActionMaker

- (ATXHeuristicRequestRideForEventActionMaker)initWithTitle:(id)a3 subtitle:(id)a4 pickupLocation:(id)a5 dropoffEvent:(id)a6 preferredAppBundleID:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ATXHeuristicRequestRideForEventActionMaker *v17;
  ATXHeuristicRequestRideForEventActionMaker *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXHeuristicRequestRideForEventActionMaker;
  v17 = -[ATXHeuristicRequestRideForEventActionMaker init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->super._title, a3);
    objc_storeStrong((id *)&v18->super._subtitle, a4);
    objc_storeStrong((id *)&v18->_pickupLocation, a5);
    objc_storeStrong((id *)&v18->_dropoffEvent, a6);
    objc_storeStrong((id *)&v18->_preferredAppBundleID, a7);
  }

  return v18;
}

- (id)dropOffLocationFromEKEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    __atxlog_handle_heuristic();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[ATXHeuristicActionMaker heuristic](self, "heuristic");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1C99DF000, v7, OS_LOG_TYPE_DEFAULT, "Failed to create drop off location because of nil ekEvent. Heuristic: %@.", (uint8_t *)&v10, 0xCu);

    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_heuristic();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXHeuristicCreateCalendarEventActionMaker _makeAction].cold.4();
LABEL_8:

    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "structuredLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "geoLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v6;
}

- (BOOL)shouldPredictDropOffLocationGivenPickupLocation:(id)a3 andDropOffLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  int v16;
  double v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
    v9 = 1;
  else
    v9 = v7 == 0;
  v10 = !v9;
  if (v6 && v7)
  {
    -[CLLocation distanceFromLocation:](self->_pickupLocation, "distanceFromLocation:", v7);
    v12 = v11;
    if (v11 > 96600.0)
    {
      __atxlog_handle_heuristic();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[ATXHeuristicActionMaker heuristic](self, "heuristic");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 134218242;
        v17 = v12 / 1610.0;
        v18 = 2112;
        v19 = v14;
        _os_log_impl(&dword_1C99DF000, v13, OS_LOG_TYPE_DEFAULT, "Dropoff location of %f miles is more than 40 miles away from pickup location . Heuristic: %@.", (uint8_t *)&v16, 0x16u);

      }
      v10 = 0;
    }
    else
    {
      v10 = 1;
    }
  }

  return v10;
}

- (id)_makeAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CLLocation *pickupLocation;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[ATXHeuristicObjectHandle obj](self->_dropoffEvent, "obj");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeuristicRequestRideForEventActionMaker dropOffLocationFromEKEvent:](self, "dropOffLocationFromEKEvent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXHeuristicRequestRideForEventActionMaker shouldPredictDropOffLocationGivenPickupLocation:andDropOffLocation:](self, "shouldPredictDropOffLocationGivenPickupLocation:andDropOffLocation:", self->_pickupLocation, v4))
  {
    v5 = (void *)MEMORY[0x1E0C9E3F0];
    objc_msgSend(v3, "structuredLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placemarkWithLocation:name:postalAddress:", v4, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "eventIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v19 = *MEMORY[0x1E0CF8A40];
      objc_msgSend(v3, "eventIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  pickupLocation = self->_pickupLocation;
  if (pickupLocation)
  {
    objc_msgSend(MEMORY[0x1E0C9E3F0], "placemarkWithLocation:name:postalAddress:", pickupLocation, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDAE0]), "initWithPickupLocation:dropOffLocation:rideOptionName:partySize:paymentMethod:scheduledPickupTime:", v12, v8, 0, 0, 0, 0);
  objc_msgSend(v13, "_setLaunchId:", self->_preferredAppBundleID);
  v14 = objc_alloc(MEMORY[0x1E0CF8C20]);
  v15 = (void *)objc_opt_new();
  LOBYTE(v18) = 0;
  v16 = (void *)objc_msgSend(v14, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v13, v15, self->_preferredAppBundleID, 0, v9, 0, v18, self->super._title, self->super._subtitle);

  return v16;
}

- (id)actionTypeName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHeuristicRequestRideForEventActionMaker)initWithCoder:(id)a3
{
  id v4;
  ATXHeuristicRequestRideForEventActionMaker *v5;
  uint64_t v6;
  CLLocation *pickupLocation;
  uint64_t v8;
  ATXHeuristicObjectHandle *dropoffEvent;
  uint64_t v10;
  NSString *preferredAppBundleID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXHeuristicRequestRideForEventActionMaker;
  v5 = -[ATXHeuristicActionMaker initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pickupLocation"));
    v6 = objc_claimAutoreleasedReturnValue();
    pickupLocation = v5->_pickupLocation;
    v5->_pickupLocation = (CLLocation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dropoffEvent"));
    v8 = objc_claimAutoreleasedReturnValue();
    dropoffEvent = v5->_dropoffEvent;
    v5->_dropoffEvent = (ATXHeuristicObjectHandle *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredAppBundleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    preferredAppBundleID = v5->_preferredAppBundleID;
    v5->_preferredAppBundleID = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CLLocation *pickupLocation;
  ATXHeuristicObjectHandle *dropoffEvent;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ATXHeuristicRequestRideForEventActionMaker;
  -[ATXHeuristicActionMaker encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  pickupLocation = self->_pickupLocation;
  if (pickupLocation)
    objc_msgSend(v4, "encodeObject:forKey:", pickupLocation, CFSTR("pickupLocation"));
  dropoffEvent = self->_dropoffEvent;
  if (dropoffEvent)
    objc_msgSend(v4, "encodeObject:forKey:", dropoffEvent, CFSTR("dropoffEvent"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_preferredAppBundleID, CFSTR("preferredAppBundleID"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredAppBundleID, 0);
  objc_storeStrong((id *)&self->_dropoffEvent, 0);
  objc_storeStrong((id *)&self->_pickupLocation, 0);
}

@end
