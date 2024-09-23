@implementation CVACLLocation

- (CVACLLocation)initWithDictionary:(id)a3
{
  id v4;
  CVACLLocation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CVACLLocation;
  v5 = -[CVACLLocation init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("t"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    -[CVACLLocation setTimestamp:](v5, "setTimestamp:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ts"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    -[CVACLLocation setTimestampSince1970:](v5, "setTimestampSince1970:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lat"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    -[CVACLLocation setLatitude:](v5, "setLatitude:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("long"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    -[CVACLLocation setLongitude:](v5, "setLongitude:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alt"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    -[CVACLLocation setAltitude:](v5, "setAltitude:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("h_acc"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    -[CVACLLocation setHorizontalAccuracy:](v5, "setHorizontalAccuracy:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("v_acc"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    -[CVACLLocation setVerticalAccuracy:](v5, "setVerticalAccuracy:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    -[CVACLLocation setSpeed:](v5, "setSpeed:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("course"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    -[CVACLLocation setCourse:](v5, "setCourse:");

  }
  return v5;
}

- (CVACLLocation)initWithCLLocation:(id)a3 timestamp:(double)a4
{
  id v6;
  CVACLLocation *v7;
  CVACLLocation *v8;
  void *v9;
  double v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CVACLLocation;
  v7 = -[CVACLLocation init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CVACLLocation setTimestamp:](v7, "setTimestamp:", a4);
    objc_msgSend(v6, "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    -[CVACLLocation setTimestampSince1970:](v8, "setTimestampSince1970:");

    objc_msgSend(v6, "coordinate");
    -[CVACLLocation setLatitude:](v8, "setLatitude:");
    objc_msgSend(v6, "coordinate");
    -[CVACLLocation setLongitude:](v8, "setLongitude:", v10);
    objc_msgSend(v6, "altitude");
    -[CVACLLocation setAltitude:](v8, "setAltitude:");
    objc_msgSend(v6, "horizontalAccuracy");
    -[CVACLLocation setHorizontalAccuracy:](v8, "setHorizontalAccuracy:");
    objc_msgSend(v6, "verticalAccuracy");
    -[CVACLLocation setVerticalAccuracy:](v8, "setVerticalAccuracy:");
    objc_msgSend(v6, "speed");
    -[CVACLLocation setSpeed:](v8, "setSpeed:");
    objc_msgSend(v6, "course");
    -[CVACLLocation setCourse:](v8, "setCourse:");
  }

  return v8;
}

- (id)dictionary
{
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[9];
  _QWORD v24[11];

  v24[9] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[CVACLLocation timestamp](self, "timestamp", CFSTR("t"));
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v4;
  v23[1] = CFSTR("ts");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[CVACLLocation timestampSince1970](self, "timestampSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v6;
  v23[2] = CFSTR("lat");
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[CVACLLocation latitude](self, "latitude");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v8;
  v23[3] = CFSTR("long");
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[CVACLLocation longitude](self, "longitude");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v10;
  v23[4] = CFSTR("alt");
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[CVACLLocation altitude](self, "altitude");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v12;
  v23[5] = CFSTR("h_acc");
  v13 = (void *)MEMORY[0x24BDD16E0];
  -[CVACLLocation horizontalAccuracy](self, "horizontalAccuracy");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v14;
  v23[6] = CFSTR("v_acc");
  v15 = (void *)MEMORY[0x24BDD16E0];
  -[CVACLLocation verticalAccuracy](self, "verticalAccuracy");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v16;
  v23[7] = CFSTR("speed");
  v17 = (void *)MEMORY[0x24BDD16E0];
  -[CVACLLocation speed](self, "speed");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v18;
  v23[8] = CFSTR("course");
  v19 = (void *)MEMORY[0x24BDD16E0];
  -[CVACLLocation course](self, "course");
  objc_msgSend(v19, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)timestampSince1970
{
  return self->_timestampSince1970;
}

- (void)setTimestampSince1970:(double)a3
{
  self->_timestampSince1970 = a3;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_horizontalAccuracy = a3;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  self->_verticalAccuracy = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (double)course
{
  return self->_course;
}

- (void)setCourse:(double)a3
{
  self->_course = a3;
}

@end
