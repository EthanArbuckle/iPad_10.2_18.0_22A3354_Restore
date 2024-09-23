@implementation AFLocationSnapshot

- (AFLocationSnapshot)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFLocationSnapshotMutation *);
  AFLocationSnapshot *v5;
  AFLocationSnapshot *v6;
  _AFLocationSnapshotMutation *v7;
  void *v8;
  uint64_t v9;
  NSNumber *latitude;
  void *v11;
  uint64_t v12;
  NSNumber *longitude;
  void *v14;
  uint64_t v15;
  NSNumber *altitude;
  void *v17;
  uint64_t v18;
  NSNumber *direction;
  void *v20;
  uint64_t v21;
  NSNumber *speed;
  void *v23;
  uint64_t v24;
  NSNumber *verticalAccuracy;
  void *v26;
  uint64_t v27;
  NSNumber *horizontalAccuracy;
  objc_super v30;

  v4 = (void (**)(id, _AFLocationSnapshotMutation *))a3;
  v30.receiver = self;
  v30.super_class = (Class)AFLocationSnapshot;
  v5 = -[AFLocationSnapshot init](&v30, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFLocationSnapshotMutation initWithBase:]([_AFLocationSnapshotMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFLocationSnapshotMutation isDirty](v7, "isDirty"))
    {
      -[_AFLocationSnapshotMutation getLatitude](v7, "getLatitude");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      latitude = v6->_latitude;
      v6->_latitude = (NSNumber *)v9;

      -[_AFLocationSnapshotMutation getLongitude](v7, "getLongitude");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      longitude = v6->_longitude;
      v6->_longitude = (NSNumber *)v12;

      -[_AFLocationSnapshotMutation getAltitude](v7, "getAltitude");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      altitude = v6->_altitude;
      v6->_altitude = (NSNumber *)v15;

      -[_AFLocationSnapshotMutation getDirection](v7, "getDirection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      direction = v6->_direction;
      v6->_direction = (NSNumber *)v18;

      -[_AFLocationSnapshotMutation getSpeed](v7, "getSpeed");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      speed = v6->_speed;
      v6->_speed = (NSNumber *)v21;

      -[_AFLocationSnapshotMutation getVerticalAccuracy](v7, "getVerticalAccuracy");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      verticalAccuracy = v6->_verticalAccuracy;
      v6->_verticalAccuracy = (NSNumber *)v24;

      -[_AFLocationSnapshotMutation getHorizontalAccuracy](v7, "getHorizontalAccuracy");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "copy");
      horizontalAccuracy = v6->_horizontalAccuracy;
      v6->_horizontalAccuracy = (NSNumber *)v27;

      v6->_preciseLocationEnabled = -[_AFLocationSnapshotMutation getPreciseLocationEnabled](v7, "getPreciseLocationEnabled");
      v6->_accessState = -[_AFLocationSnapshotMutation getAccessState](v7, "getAccessState");
    }

  }
  return v6;
}

- (AFLocationSnapshot)init
{
  return -[AFLocationSnapshot initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFLocationSnapshot)initWithLatitude:(id)a3 longitude:(id)a4 altitude:(id)a5 direction:(id)a6 speed:(id)a7 verticalAccuracy:(id)a8 horizontalAccuracy:(id)a9 preciseLocationEnabled:(BOOL)a10 accessState:(int64_t)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  AFLocationSnapshot *v30;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  int64_t v41;
  BOOL v42;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __145__AFLocationSnapshot_initWithLatitude_longitude_altitude_direction_speed_verticalAccuracy_horizontalAccuracy_preciseLocationEnabled_accessState___block_invoke;
  v33[3] = &unk_1E3A31FA8;
  v34 = v16;
  v35 = v17;
  v36 = v18;
  v37 = v19;
  v38 = v20;
  v39 = v21;
  v42 = a10;
  v40 = v22;
  v41 = a11;
  v23 = v22;
  v24 = v21;
  v25 = v20;
  v26 = v19;
  v27 = v18;
  v28 = v17;
  v29 = v16;
  v30 = -[AFLocationSnapshot initWithBuilder:](self, "initWithBuilder:", v33);

  return v30;
}

- (NSString)description
{
  return (NSString *)-[AFLocationSnapshot _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  void *v4;
  NSNumber *latitude;
  NSNumber *longitude;
  NSNumber *altitude;
  NSNumber *direction;
  NSNumber *speed;
  NSNumber *verticalAccuracy;
  unint64_t accessState;
  NSNumber *horizontalAccuracy;
  __CFString *v13;
  const __CFString *v14;
  __CFString *v15;
  void *v16;
  id v18;
  objc_super v19;

  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  v19.receiver = self;
  v19.super_class = (Class)AFLocationSnapshot;
  -[AFLocationSnapshot description](&v19, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  latitude = self->_latitude;
  longitude = self->_longitude;
  altitude = self->_altitude;
  direction = self->_direction;
  speed = self->_speed;
  verticalAccuracy = self->_verticalAccuracy;
  horizontalAccuracy = self->_horizontalAccuracy;
  accessState = self->_accessState;
  if (accessState > 3)
    v13 = CFSTR("(unknown)");
  else
    v13 = off_1E3A2CD20[accessState];
  if (self->_preciseLocationEnabled)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v15 = v13;
  v16 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("%@ {latitude = %@, longitude = %@, altitude = %@, direction = %@, speed = %@, verticalAccuracy = %@, horizontalAccuracy = %@, preciseLocationEnabled = %@, accessState = %@}"), v4, latitude, longitude, altitude, direction, speed, verticalAccuracy, horizontalAccuracy, v14, v15);

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;

  v3 = -[NSNumber hash](self->_latitude, "hash");
  v4 = -[NSNumber hash](self->_longitude, "hash") ^ v3;
  v5 = -[NSNumber hash](self->_altitude, "hash");
  v6 = v4 ^ v5 ^ -[NSNumber hash](self->_direction, "hash");
  v7 = -[NSNumber hash](self->_speed, "hash");
  v8 = v7 ^ -[NSNumber hash](self->_verticalAccuracy, "hash");
  v9 = v6 ^ v8 ^ -[NSNumber hash](self->_horizontalAccuracy, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preciseLocationEnabled);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_accessState);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v11 ^ objc_msgSend(v12, "hash");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  AFLocationSnapshot *v4;
  AFLocationSnapshot *v5;
  _BOOL4 preciseLocationEnabled;
  int64_t accessState;
  NSNumber *v8;
  NSNumber *latitude;
  NSNumber *v10;
  NSNumber *longitude;
  NSNumber *v12;
  NSNumber *altitude;
  NSNumber *v14;
  NSNumber *direction;
  NSNumber *v16;
  NSNumber *speed;
  NSNumber *v18;
  NSNumber *verticalAccuracy;
  NSNumber *v20;
  NSNumber *horizontalAccuracy;
  BOOL v22;

  v4 = (AFLocationSnapshot *)a3;
  if (self == v4)
  {
    v22 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      preciseLocationEnabled = self->_preciseLocationEnabled;
      if (preciseLocationEnabled == -[AFLocationSnapshot preciseLocationEnabled](v5, "preciseLocationEnabled")
        && (accessState = self->_accessState, accessState == -[AFLocationSnapshot accessState](v5, "accessState")))
      {
        -[AFLocationSnapshot latitude](v5, "latitude");
        v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        latitude = self->_latitude;
        if (latitude == v8 || -[NSNumber isEqual:](latitude, "isEqual:", v8))
        {
          -[AFLocationSnapshot longitude](v5, "longitude");
          v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          longitude = self->_longitude;
          if (longitude == v10 || -[NSNumber isEqual:](longitude, "isEqual:", v10))
          {
            -[AFLocationSnapshot altitude](v5, "altitude");
            v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            altitude = self->_altitude;
            if (altitude == v12 || -[NSNumber isEqual:](altitude, "isEqual:", v12))
            {
              -[AFLocationSnapshot direction](v5, "direction");
              v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              direction = self->_direction;
              if (direction == v14 || -[NSNumber isEqual:](direction, "isEqual:", v14))
              {
                -[AFLocationSnapshot speed](v5, "speed");
                v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                speed = self->_speed;
                if (speed == v16 || -[NSNumber isEqual:](speed, "isEqual:", v16))
                {
                  -[AFLocationSnapshot verticalAccuracy](v5, "verticalAccuracy");
                  v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  verticalAccuracy = self->_verticalAccuracy;
                  if (verticalAccuracy == v18 || -[NSNumber isEqual:](verticalAccuracy, "isEqual:", v18))
                  {
                    -[AFLocationSnapshot horizontalAccuracy](v5, "horizontalAccuracy");
                    v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    horizontalAccuracy = self->_horizontalAccuracy;
                    v22 = horizontalAccuracy == v20
                       || -[NSNumber isEqual:](horizontalAccuracy, "isEqual:", v20);

                  }
                  else
                  {
                    v22 = 0;
                  }

                }
                else
                {
                  v22 = 0;
                }

              }
              else
              {
                v22 = 0;
              }

            }
            else
            {
              v22 = 0;
            }

          }
          else
          {
            v22 = 0;
          }

        }
        else
        {
          v22 = 0;
        }

      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (AFLocationSnapshot)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  AFLocationSnapshot *v14;
  uint64_t v16;
  void *v17;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFLocationSnapshot::latitude"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFLocationSnapshot::longitude"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFLocationSnapshot::altitude"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFLocationSnapshot::direction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFLocationSnapshot::speed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFLocationSnapshot::verticalAccuracy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFLocationSnapshot::horizontalAccuracy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFLocationSnapshot::preciseLocationEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFLocationSnapshot::accessState"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "integerValue");
  LOBYTE(v16) = v11;
  v14 = -[AFLocationSnapshot initWithLatitude:longitude:altitude:direction:speed:verticalAccuracy:horizontalAccuracy:preciseLocationEnabled:accessState:](self, "initWithLatitude:longitude:altitude:direction:speed:verticalAccuracy:horizontalAccuracy:preciseLocationEnabled:accessState:", v17, v4, v5, v6, v7, v8, v9, v16, v13);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *latitude;
  id v5;
  void *v6;
  id v7;

  latitude = self->_latitude;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", latitude, CFSTR("AFLocationSnapshot::latitude"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_longitude, CFSTR("AFLocationSnapshot::longitude"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altitude, CFSTR("AFLocationSnapshot::altitude"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_direction, CFSTR("AFLocationSnapshot::direction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_speed, CFSTR("AFLocationSnapshot::speed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_verticalAccuracy, CFSTR("AFLocationSnapshot::verticalAccuracy"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_horizontalAccuracy, CFSTR("AFLocationSnapshot::horizontalAccuracy"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preciseLocationEnabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("AFLocationSnapshot::preciseLocationEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_accessState);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("AFLocationSnapshot::accessState"));

}

- (AFLocationSnapshot)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFLocationSnapshot *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v25;
  id v26;
  id v27;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("latitude"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v6;
    else
      v27 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("longitude"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v8;
    else
      v26 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("altitude"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("direction"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("speed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("verticalAccuracy"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("horizontalAccuracy"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("preciseLocationEnabled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;

    v21 = objc_msgSend(v20, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("accessState"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = AFLocationAccessStateGetFromName(v22);
    else
      v23 = 0;

    LOBYTE(v25) = v21;
    self = -[AFLocationSnapshot initWithLatitude:longitude:altitude:direction:speed:verticalAccuracy:horizontalAccuracy:preciseLocationEnabled:accessState:](self, "initWithLatitude:longitude:altitude:direction:speed:verticalAccuracy:horizontalAccuracy:preciseLocationEnabled:accessState:", v27, v26, v10, v12, v14, v16, v18, v25, v23);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSNumber *latitude;
  NSNumber *longitude;
  NSNumber *altitude;
  NSNumber *direction;
  NSNumber *speed;
  NSNumber *verticalAccuracy;
  NSNumber *horizontalAccuracy;
  void *v12;
  unint64_t accessState;
  __CFString *v14;
  __CFString *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  latitude = self->_latitude;
  if (latitude)
    objc_msgSend(v3, "setObject:forKey:", latitude, CFSTR("latitude"));
  longitude = self->_longitude;
  if (longitude)
    objc_msgSend(v4, "setObject:forKey:", longitude, CFSTR("longitude"));
  altitude = self->_altitude;
  if (altitude)
    objc_msgSend(v4, "setObject:forKey:", altitude, CFSTR("altitude"));
  direction = self->_direction;
  if (direction)
    objc_msgSend(v4, "setObject:forKey:", direction, CFSTR("direction"));
  speed = self->_speed;
  if (speed)
    objc_msgSend(v4, "setObject:forKey:", speed, CFSTR("speed"));
  verticalAccuracy = self->_verticalAccuracy;
  if (verticalAccuracy)
    objc_msgSend(v4, "setObject:forKey:", verticalAccuracy, CFSTR("verticalAccuracy"));
  horizontalAccuracy = self->_horizontalAccuracy;
  if (horizontalAccuracy)
    objc_msgSend(v4, "setObject:forKey:", horizontalAccuracy, CFSTR("horizontalAccuracy"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preciseLocationEnabled);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("preciseLocationEnabled"));

  accessState = self->_accessState;
  if (accessState > 3)
    v14 = CFSTR("(unknown)");
  else
    v14 = off_1E3A2CD20[accessState];
  v15 = v14;
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("accessState"));

  v16 = (void *)objc_msgSend(v4, "copy");
  return v16;
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (NSNumber)altitude
{
  return self->_altitude;
}

- (NSNumber)direction
{
  return self->_direction;
}

- (NSNumber)speed
{
  return self->_speed;
}

- (NSNumber)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (NSNumber)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (BOOL)preciseLocationEnabled
{
  return self->_preciseLocationEnabled;
}

- (int64_t)accessState
{
  return self->_accessState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalAccuracy, 0);
  objc_storeStrong((id *)&self->_verticalAccuracy, 0);
  objc_storeStrong((id *)&self->_speed, 0);
  objc_storeStrong((id *)&self->_direction, 0);
  objc_storeStrong((id *)&self->_altitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
}

void __145__AFLocationSnapshot_initWithLatitude_longitude_altitude_direction_speed_verticalAccuracy_horizontalAccuracy_preciseLocationEnabled_accessState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLatitude:", v3);
  objc_msgSend(v4, "setLongitude:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setAltitude:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setDirection:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setSpeed:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v4, "setVerticalAccuracy:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v4, "setHorizontalAccuracy:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v4, "setPreciseLocationEnabled:", *(unsigned __int8 *)(a1 + 96));
  objc_msgSend(v4, "setAccessState:", *(_QWORD *)(a1 + 88));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFLocationSnapshotMutation *);
  _AFLocationSnapshotMutation *v5;
  AFLocationSnapshot *v6;
  void *v7;
  uint64_t v8;
  NSNumber *latitude;
  void *v10;
  uint64_t v11;
  NSNumber *longitude;
  void *v13;
  uint64_t v14;
  NSNumber *altitude;
  void *v16;
  uint64_t v17;
  NSNumber *direction;
  void *v19;
  uint64_t v20;
  NSNumber *speed;
  void *v22;
  uint64_t v23;
  NSNumber *verticalAccuracy;
  void *v25;
  uint64_t v26;
  NSNumber *horizontalAccuracy;

  v4 = (void (**)(id, _AFLocationSnapshotMutation *))a3;
  if (v4)
  {
    v5 = -[_AFLocationSnapshotMutation initWithBase:]([_AFLocationSnapshotMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFLocationSnapshotMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFLocationSnapshot);
      -[_AFLocationSnapshotMutation getLatitude](v5, "getLatitude");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      latitude = v6->_latitude;
      v6->_latitude = (NSNumber *)v8;

      -[_AFLocationSnapshotMutation getLongitude](v5, "getLongitude");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      longitude = v6->_longitude;
      v6->_longitude = (NSNumber *)v11;

      -[_AFLocationSnapshotMutation getAltitude](v5, "getAltitude");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      altitude = v6->_altitude;
      v6->_altitude = (NSNumber *)v14;

      -[_AFLocationSnapshotMutation getDirection](v5, "getDirection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      direction = v6->_direction;
      v6->_direction = (NSNumber *)v17;

      -[_AFLocationSnapshotMutation getSpeed](v5, "getSpeed");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      speed = v6->_speed;
      v6->_speed = (NSNumber *)v20;

      -[_AFLocationSnapshotMutation getVerticalAccuracy](v5, "getVerticalAccuracy");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      verticalAccuracy = v6->_verticalAccuracy;
      v6->_verticalAccuracy = (NSNumber *)v23;

      -[_AFLocationSnapshotMutation getHorizontalAccuracy](v5, "getHorizontalAccuracy");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      horizontalAccuracy = v6->_horizontalAccuracy;
      v6->_horizontalAccuracy = (NSNumber *)v26;

      v6->_preciseLocationEnabled = -[_AFLocationSnapshotMutation getPreciseLocationEnabled](v5, "getPreciseLocationEnabled");
      v6->_accessState = -[_AFLocationSnapshotMutation getAccessState](v5, "getAccessState");
    }
    else
    {
      v6 = (AFLocationSnapshot *)-[AFLocationSnapshot copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFLocationSnapshot *)-[AFLocationSnapshot copy](self, "copy");
  }

  return v6;
}

- (id)ad_shortDescription
{
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  __CFString *v12;

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[AFLocationSnapshot latitude](self, "latitude");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = (int)v5;
    -[AFLocationSnapshot longitude](self, "longitude");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = (int)v8;
    -[AFLocationSnapshot horizontalAccuracy](self, "horizontalAccuracy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("([%d,%d], accuracy=%d)"), v6, v9, (int)v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = CFSTR("(private)");
  }
  return v12;
}

- (AFLocationSnapshot)initWithSerializedBackingStore:(id)a3
{
  id v4;
  AFLocationSnapshot *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self = -[AFLocationSnapshot initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)ace_setRequestOrigin
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
  int64_t v12;
  _QWORD *v13;
  _QWORD *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0D88450]);
  -[AFLocationSnapshot latitude](self, "latitude");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v3, "setLatitude:");

  -[AFLocationSnapshot longitude](self, "longitude");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  objc_msgSend(v3, "setLongitude:");

  -[AFLocationSnapshot altitude](self, "altitude");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v3, "setAltitude:");

  -[AFLocationSnapshot direction](self, "direction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v3, "setDirection:");

  -[AFLocationSnapshot speed](self, "speed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v3, "setSpeed:");

  -[AFLocationSnapshot verticalAccuracy](self, "verticalAccuracy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v3, "setVerticalAccuracy:");

  -[AFLocationSnapshot horizontalAccuracy](self, "horizontalAccuracy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  objc_msgSend(v3, "setHorizontalAccuracy:");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AFLocationSnapshot preciseLocationEnabled](self, "preciseLocationEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreciseLocationEnabled:", v11);

  v12 = -[AFLocationSnapshot accessState](self, "accessState");
  v13 = (_QWORD *)MEMORY[0x1E0D89118];
  v14 = (_QWORD *)MEMORY[0x1E0D89110];
  if (v12 != 3)
    v14 = (_QWORD *)MEMORY[0x1E0D89128];
  if (v12 != 2)
    v13 = v14;
  objc_msgSend(v3, "setStatus:", *v13);
  return v3;
}

@end
