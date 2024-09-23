@implementation _PHMeCardGeocoderAddress

- (_PHMeCardGeocoderAddress)initWithLabeledValue:(id)a3 entityID:(id)a4
{
  id v7;
  id v8;
  _PHMeCardGeocoderAddress *v9;
  NSString *v10;
  NSString *entityID;
  CLGeocoder *v12;
  CLGeocoder *geocoder;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_PHMeCardGeocoderAddress;
  v9 = -[_PHMeCardGeocoderAddress init](&v15, "init");
  if (v9)
  {
    v10 = (NSString *)objc_msgSend(v8, "copy");
    entityID = v9->_entityID;
    v9->_entityID = v10;

    objc_storeStrong((id *)&v9->_labeledValue, a3);
    v12 = (CLGeocoder *)objc_alloc_init((Class)CLGeocoder);
    geocoder = v9->_geocoder;
    v9->_geocoder = v12;

    v9->_state = 0;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[CLGeocoder cancelGeocode](self->_geocoder, "cancelGeocode");
  v3.receiver = self;
  v3.super_class = (Class)_PHMeCardGeocoderAddress;
  -[_PHMeCardGeocoderAddress dealloc](&v3, "dealloc");
}

+ (BOOL)supportsSecureCoding
{
  return a1 != 0;
}

- (_PHMeCardGeocoderAddress)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  _PHMeCardGeocoderAddress *v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  NSString *v11;
  void *v12;
  CNLabeledValue *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSString *entityID;
  CNLabeledValue *labeledValue;
  CNLabeledValue *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  NSDate *lastGeocodeAttempt;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_PHMeCardGeocoderAddress;
  v6 = -[_PHMeCardGeocoderAddress init](&v34, "init");
  if (v6)
  {
    v7 = objc_opt_class(CNLabeledValue, v5);
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(CNPostalAddress, v8), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = NSStringFromSelector("labeledValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (CNLabeledValue *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, v12));

    if (!v13)
    {
      v15 = objc_opt_class(NSDictionary, v14);
      v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, objc_opt_class(NSString, v16), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("AddressDictionary")));

      if (v19)
      {
        v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v20), CFSTR("Label"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[CNPostalAddress postalAddressWithAddressBookDictionaryRepresentation:](CNPostalAddress, "postalAddressWithAddressBookDictionaryRepresentation:", v19));
        if (v23)
          v13 = (CNLabeledValue *)objc_msgSend(objc_alloc((Class)CNLabeledValue), "initWithLabel:value:", v22, v23);
        else
          v13 = 0;

      }
      else
      {
        v13 = 0;
      }

    }
    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v14), CFSTR("EntityID"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    entityID = v6->_entityID;
    v6->_entityID = (NSString *)v25;

    labeledValue = v6->_labeledValue;
    v6->_labeledValue = v13;
    v28 = v13;

    v6->_state = objc_msgSend(v4, "decodeIntForKey:", CFSTR("State"));
    v6->_tries = objc_msgSend(v4, "decodeIntForKey:", CFSTR("Tries"));
    v30 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v29), CFSTR("LastGeocodeAttempt"));
    v31 = objc_claimAutoreleasedReturnValue(v30);
    lastGeocodeAttempt = v6->_lastGeocodeAttempt;
    v6->_lastGeocodeAttempt = (NSDate *)v31;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *entityID;
  CNLabeledValue *labeledValue;
  NSString *v6;
  void *v7;
  id v8;

  entityID = self->_entityID;
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", entityID, CFSTR("EntityID"));
  labeledValue = self->_labeledValue;
  v6 = NSStringFromSelector("labeledValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v8, "encodeObject:forKey:", labeledValue, v7);

  objc_msgSend(v8, "encodeInt:forKey:", self->_state, CFSTR("State"));
  objc_msgSend(v8, "encodeInt:forKey:", self->_tries, CFSTR("Tries"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_lastGeocodeAttempt, CFSTR("LastGeocodeAttempt"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_locationDictionary, CFSTR("LocationDictionary"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_geocodeAfter, CFSTR("GeocodeAfter"));

}

- (id)createGeocodeAfterDate
{
  void *v2;
  id v3;
  NSObject *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v20;
  void *v21;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Our date is between start and end dates for geocoder, so we're throttling", (uint8_t *)&v20, 2u);
  }

  v5 = time(0);
  srandom(v5);
  v6 = random();
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_PHMeCardGeocoderPreferences sharedPreferences](_PHMeCardGeocoderPreferences, "sharedPreferences"));
  v8 = objc_msgSend(v7, "isActivelyUsing");

  v9 = sub_1000C5588();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "User has been actively using feature, so using active period length", (uint8_t *)&v20, 2u);
    }

    v12 = (double)v6 / 2147483650.0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[_PHMeCardGeocoderPreferences sharedPreferences](_PHMeCardGeocoderPreferences, "sharedPreferences"));
    objc_msgSend(v13, "activeUsagePeriodLength");
  }
  else
  {
    if (v11)
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "User has not yet used the feature, so using normal period length", (uint8_t *)&v20, 2u);
    }

    v12 = (double)v6 / 2147483650.0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[_PHMeCardGeocoderPreferences sharedPreferences](_PHMeCardGeocoderPreferences, "sharedPreferences"));
    objc_msgSend(v13, "periodLength");
  }
  v15 = v12 * v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v2, v15));
  v17 = sub_1000C5588();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Created geocode-after date of: %@", (uint8_t *)&v20, 0xCu);
  }

  return v16;
}

- (BOOL)checkGeocodeAfterDateForSanity
{
  void *v3;
  unsigned int v4;
  NSDate *geocodeAfter;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  NSObject *v14;
  NSDate *v15;
  const char *v16;
  double v17;
  double v18;
  id v19;
  NSDate *v20;
  int v22;
  NSDate *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_PHMeCardGeocoderPreferences sharedPreferences](_PHMeCardGeocoderPreferences, "sharedPreferences"));
  v4 = objc_msgSend(v3, "isActivelyUsing");

  geocodeAfter = self->_geocodeAfter;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[NSDate timeIntervalSinceDate:](geocodeAfter, "timeIntervalSinceDate:", v6);
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_PHMeCardGeocoderPreferences sharedPreferences](_PHMeCardGeocoderPreferences, "sharedPreferences"));
  v10 = v9;
  if (v4)
  {
    objc_msgSend(v9, "activeUsagePeriodLength");
    v12 = v11;

    if (v8 > v12)
    {
      v13 = sub_1000C5588();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->_geocodeAfter;
        v22 = 138412290;
        v23 = v15;
        v16 = "Geocode-after date had insane value for active use: %@";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(v9, "periodLength");
    v18 = v17;

    if (v8 > v18)
    {
      v19 = sub_1000C5588();
      v14 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v20 = self->_geocodeAfter;
        v22 = 138412290;
        v23 = v20;
        v16 = "Geocode-after date had insane value: %@";
        goto LABEL_8;
      }
LABEL_9:

      -[_PHMeCardGeocoderAddress recalculateGeocodeAfterDate](self, "recalculateGeocodeAfterDate");
      return 1;
    }
  }
  return 0;
}

- (void)recalculateGeocodeAfterDate
{
  NSDate *v3;
  NSDate *geocodeAfter;

  v3 = -[_PHMeCardGeocoderAddress createGeocodeAfterDate](self, "createGeocodeAfterDate");
  geocodeAfter = self->_geocodeAfter;
  self->_geocodeAfter = v3;

}

- (void)attemptGeocodeWithCompletionBlock:(id)a3
{
  void (**v4)(id, _QWORD, _PHMeCardGeocoderAddress *);
  NSDate *v5;
  NSDate *lastGeocodeAttempt;
  void ***v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  _PHMeCardGeocoderAddress *v14;
  void (**v15)(id, _QWORD, _PHMeCardGeocoderAddress *);

  v4 = (void (**)(id, _QWORD, _PHMeCardGeocoderAddress *))a3;
  if (-[CLGeocoder isGeocoding](self->_geocoder, "isGeocoding"))
  {
    v4[2](v4, 0, self);
  }
  else if (self->_state == 2)
  {
    v4[2](v4, 1, self);
  }
  else
  {
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    lastGeocodeAttempt = self->_lastGeocodeAttempt;
    self->_lastGeocodeAttempt = v5;

    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_10008A36C;
    v13 = &unk_100286C28;
    v14 = self;
    v15 = v4;
    v7 = objc_retainBlock(&v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_PHMeCardGeocoderAddress geocoder](self, "geocoder", v10, v11, v12, v13, v14));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_PHMeCardGeocoderAddress postalAddress](self, "postalAddress"));
    objc_msgSend(v8, "geocodePostalAddress:completionHandler:", v9, v7);

  }
}

- (void)cancelGeocode
{
  self->_cancelingGeocode = 1;
  -[CLGeocoder cancelGeocode](self->_geocoder, "cancelGeocode");
}

- (id)nextGeocodeAttempt
{
  NSDate *v3;
  NSDate *lastGeocodeAttempt;
  int tries;
  double v7;
  NSDate *v8;
  NSDate *geocodeAfter;
  void *v10;
  NSDate *v11;
  NSDate *v12;

  if (self->_state == 2 || -[CLGeocoder isGeocoding](self->_geocoder, "isGeocoding"))
  {
    v3 = 0;
  }
  else
  {
    lastGeocodeAttempt = self->_lastGeocodeAttempt;
    if (lastGeocodeAttempt)
    {
      tries = self->_tries;
      if (tries < 7)
      {
        if (tries)
          v7 = (double)(60 * dword_10023FE50[tries - 1]);
        else
          v7 = 60.0;
      }
      else
      {
        v7 = 21600.0;
      }
      v3 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](lastGeocodeAttempt, "dateByAddingTimeInterval:", v7));
    }
    else
    {
      if (!self->_geocodeAfter)
      {
        v8 = -[_PHMeCardGeocoderAddress createGeocodeAfterDate](self, "createGeocodeAfterDate");
        geocodeAfter = self->_geocodeAfter;
        self->_geocodeAfter = v8;

        if (!self->_geocodeAfter)
          goto LABEL_11;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v11 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "laterDate:", self->_geocodeAfter));
      v12 = self->_geocodeAfter;

      if (v11 == v12)
        v3 = self->_geocodeAfter;
      else
LABEL_11:
        v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    }
  }
  return v3;
}

- (BOOL)expired
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_PHMeCardGeocoderAddress lastGeocodeAttempt](self, "lastGeocodeAttempt"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_PHMeCardGeocoderAddress lastGeocodeAttempt](self, "lastGeocodeAttempt"));
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6 > 2592000.0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)debugDescription
{
  unsigned int v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  unsigned int v22;
  const __CFString *v23;
  NSString *v24;
  void *v25;
  void *v26;
  id v27;

  v3 = -[_PHMeCardGeocoderAddress state](self, "state");
  if (v3 > 2)
    v4 = 0;
  else
    v4 = (uint64_t)*(&off_100286CE0 + (int)v3);
  v5 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v5, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(self, v6), self);
  v7 = NSStringFromSelector("labeledValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_PHMeCardGeocoderAddress labeledValue](self, "labeledValue"));
  objc_msgSend(v5, "appendFormat:", CFSTR("%@=%@"), v8, v9);

  objc_msgSend(v5, "appendFormat:", CFSTR(", "));
  v10 = NSStringFromSelector("state");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v5, "appendFormat:", CFSTR("%@=%@"), v11, v4);

  objc_msgSend(v5, "appendFormat:", CFSTR(", "));
  v12 = NSStringFromSelector("tries");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v5, "appendFormat:", CFSTR("%@=%d"), v13, -[_PHMeCardGeocoderAddress tries](self, "tries"));

  objc_msgSend(v5, "appendFormat:", CFSTR(", "));
  v14 = NSStringFromSelector("lastGeocodeAttempt");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_PHMeCardGeocoderAddress lastGeocodeAttempt](self, "lastGeocodeAttempt"));
  objc_msgSend(v5, "appendFormat:", CFSTR("%@=%@"), v15, v16);

  objc_msgSend(v5, "appendFormat:", CFSTR(", "));
  v17 = NSStringFromSelector("geocodeAfter");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_PHMeCardGeocoderAddress geocodeAfter](self, "geocodeAfter"));
  objc_msgSend(v5, "appendFormat:", CFSTR("%@=%@"), v18, v19);

  objc_msgSend(v5, "appendFormat:", CFSTR(", "));
  v20 = NSStringFromSelector("expired");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = -[_PHMeCardGeocoderAddress expired](self, "expired");
  v23 = CFSTR("NO");
  if (v22)
    v23 = CFSTR("YES");
  objc_msgSend(v5, "appendFormat:", CFSTR("%@=%@"), v21, v23);

  objc_msgSend(v5, "appendFormat:", CFSTR(", "));
  v24 = NSStringFromSelector("locationDictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[_PHMeCardGeocoderAddress locationDictionary](self, "locationDictionary"));
  objc_msgSend(v5, "appendFormat:", CFSTR("%@=%@"), v25, v26);

  objc_msgSend(v5, "appendFormat:", CFSTR(">"));
  v27 = objc_msgSend(v5, "copy");

  return v27;
}

- (CNLabeledValue)labeledValue
{
  return (CNLabeledValue *)objc_getProperty(self, a2, 24, 1);
}

- (CNPostalAddress)postalAddress
{
  return (CNPostalAddress *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)entityID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (CLGeocoder)geocoder
{
  return (CLGeocoder *)objc_getProperty(self, a2, 48, 1);
}

- (int)tries
{
  return self->_tries;
}

- (NSDictionary)locationDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)lastGeocodeAttempt
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (int)state
{
  return self->_state;
}

- (BOOL)cancelingGeocode
{
  return self->_cancelingGeocode;
}

- (NSDate)geocodeAfter
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geocodeAfter, 0);
  objc_storeStrong((id *)&self->_lastGeocodeAttempt, 0);
  objc_storeStrong((id *)&self->_locationDictionary, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_entityID, 0);
  objc_storeStrong((id *)&self->_postalAddress, 0);
  objc_storeStrong((id *)&self->_labeledValue, 0);
}

@end
