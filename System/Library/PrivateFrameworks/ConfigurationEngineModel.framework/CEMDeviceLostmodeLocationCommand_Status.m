@implementation CEMDeviceLostmodeLocationCommand_Status

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Latitude");
  v6[1] = CFSTR("Longitude");
  v6[2] = CFSTR("HorizontalAccuracy");
  v6[3] = CFSTR("VerticalAccuracy");
  v6[4] = CFSTR("Altitude");
  v6[5] = CFSTR("Speed");
  v6[6] = CFSTR("Course");
  v6[7] = CFSTR("Timestamp");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (NSSet)allowedReasons
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("NotInLostMode");
  v6[1] = CFSTR("CannotDetermineLocation");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithLatitude:(id)a3 withLongitude:(id)a4 withHorizontalAccuracy:(id)a5 withVerticalAccuracy:(id)a6 withAltitude:(id)a7 withSpeed:(id)a8 withCourse:(id)a9 withTimestamp:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setStatusLatitude:", v23);

  objc_msgSend(v24, "setStatusLongitude:", v22);
  objc_msgSend(v24, "setStatusHorizontalAccuracy:", v21);

  objc_msgSend(v24, "setStatusVerticalAccuracy:", v20);
  objc_msgSend(v24, "setStatusAltitude:", v19);

  objc_msgSend(v24, "setStatusSpeed:", v18);
  objc_msgSend(v24, "setStatusCourse:", v17);

  objc_msgSend(v24, "setStatusTimestamp:", v16);
  return v24;
}

+ (id)buildRequiredOnlyWithLatitude:(id)a3 withLongitude:(id)a4 withHorizontalAccuracy:(id)a5 withVerticalAccuracy:(id)a6 withAltitude:(id)a7 withSpeed:(id)a8 withCourse:(id)a9 withTimestamp:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setStatusLatitude:", v23);

  objc_msgSend(v24, "setStatusLongitude:", v22);
  objc_msgSend(v24, "setStatusHorizontalAccuracy:", v21);

  objc_msgSend(v24, "setStatusVerticalAccuracy:", v20);
  objc_msgSend(v24, "setStatusAltitude:", v19);

  objc_msgSend(v24, "setStatusSpeed:", v18);
  objc_msgSend(v24, "setStatusCourse:", v17);

  objc_msgSend(v24, "setStatusTimestamp:", v16);
  return v24;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  NSNumber *v15;
  NSNumber *statusLatitude;
  NSNumber *v17;
  NSNumber *statusLongitude;
  NSNumber *v19;
  NSNumber *statusHorizontalAccuracy;
  NSNumber *v21;
  NSNumber *statusVerticalAccuracy;
  NSNumber *v23;
  NSNumber *statusAltitude;
  NSNumber *v25;
  NSNumber *statusSpeed;
  NSNumber *v27;
  NSNumber *statusCourse;
  NSString *v29;
  NSString *statusTimestamp;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMDeviceLostmodeLocationCommand_Status allowedStatusKeys](CEMDeviceLostmodeLocationCommand_Status, "allowedStatusKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  if (objc_msgSend(v9, "count"))
  {
    if (!a4)
    {
      v14 = 0;
      goto LABEL_17;
    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v40 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected payload keys: %@"), v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v41[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  else
  {
    v39 = 0;
    -[CEMPayloadBase loadFloatFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadFloatFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Latitude"), 1, 0, &v39);
    v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v12 = v39;
    statusLatitude = self->_statusLatitude;
    self->_statusLatitude = v15;

    if (!v12)
    {
      v38 = 0;
      -[CEMPayloadBase loadFloatFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadFloatFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Longitude"), 1, 0, &v38);
      v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v12 = v38;
      statusLongitude = self->_statusLongitude;
      self->_statusLongitude = v17;

      if (!v12)
      {
        v37 = 0;
        -[CEMPayloadBase loadFloatFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadFloatFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HorizontalAccuracy"), 1, 0, &v37);
        v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v12 = v37;
        statusHorizontalAccuracy = self->_statusHorizontalAccuracy;
        self->_statusHorizontalAccuracy = v19;

        if (!v12)
        {
          v36 = 0;
          -[CEMPayloadBase loadFloatFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadFloatFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("VerticalAccuracy"), 1, 0, &v36);
          v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v12 = v36;
          statusVerticalAccuracy = self->_statusVerticalAccuracy;
          self->_statusVerticalAccuracy = v21;

          if (!v12)
          {
            v35 = 0;
            -[CEMPayloadBase loadFloatFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadFloatFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Altitude"), 1, 0, &v35);
            v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v12 = v35;
            statusAltitude = self->_statusAltitude;
            self->_statusAltitude = v23;

            if (!v12)
            {
              v34 = 0;
              -[CEMPayloadBase loadFloatFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadFloatFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Speed"), 1, 0, &v34);
              v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v12 = v34;
              statusSpeed = self->_statusSpeed;
              self->_statusSpeed = v25;

              if (!v12)
              {
                v33 = 0;
                -[CEMPayloadBase loadFloatFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadFloatFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Course"), 1, 0, &v33);
                v27 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v12 = v33;
                statusCourse = self->_statusCourse;
                self->_statusCourse = v27;

                if (!v12)
                {
                  v32 = 0;
                  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Timestamp"), 1, 0, &v32);
                  v29 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v12 = v32;
                  statusTimestamp = self->_statusTimestamp;
                  self->_statusTimestamp = v29;

                }
              }
            }
          }
        }
      }
    }
    v14 = v12 == 0;
    if (a4 && v12)
    {
      v12 = objc_retainAutorelease(v12);
      v14 = 0;
      *a4 = v12;
    }
  }

LABEL_17:
  return v14;
}

- (id)serializePayload
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Latitude"), self->_statusLatitude, 1, 0);
  -[CEMPayloadBase serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Longitude"), self->_statusLongitude, 1, 0);
  -[CEMPayloadBase serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("HorizontalAccuracy"), self->_statusHorizontalAccuracy, 1, 0);
  -[CEMPayloadBase serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("VerticalAccuracy"), self->_statusVerticalAccuracy, 1, 0);
  -[CEMPayloadBase serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Altitude"), self->_statusAltitude, 1, 0);
  -[CEMPayloadBase serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Speed"), self->_statusSpeed, 1, 0);
  -[CEMPayloadBase serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Course"), self->_statusCourse, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Timestamp"), self->_statusTimestamp, 1, 0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSNumber)statusLatitude
{
  return self->_statusLatitude;
}

- (void)setStatusLatitude:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)statusLongitude
{
  return self->_statusLongitude;
}

- (void)setStatusLongitude:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)statusHorizontalAccuracy
{
  return self->_statusHorizontalAccuracy;
}

- (void)setStatusHorizontalAccuracy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)statusVerticalAccuracy
{
  return self->_statusVerticalAccuracy;
}

- (void)setStatusVerticalAccuracy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)statusAltitude
{
  return self->_statusAltitude;
}

- (void)setStatusAltitude:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)statusSpeed
{
  return self->_statusSpeed;
}

- (void)setStatusSpeed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)statusCourse
{
  return self->_statusCourse;
}

- (void)setStatusCourse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)statusTimestamp
{
  return self->_statusTimestamp;
}

- (void)setStatusTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusTimestamp, 0);
  objc_storeStrong((id *)&self->_statusCourse, 0);
  objc_storeStrong((id *)&self->_statusSpeed, 0);
  objc_storeStrong((id *)&self->_statusAltitude, 0);
  objc_storeStrong((id *)&self->_statusVerticalAccuracy, 0);
  objc_storeStrong((id *)&self->_statusHorizontalAccuracy, 0);
  objc_storeStrong((id *)&self->_statusLongitude, 0);
  objc_storeStrong((id *)&self->_statusLatitude, 0);
}

@end
