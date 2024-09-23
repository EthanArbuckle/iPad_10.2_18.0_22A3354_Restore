@implementation RTWiFiAccessPoint

- (RTWiFiAccessPoint)initWithMac:(id)a3 rssi:(int64_t)a4 channel:(int64_t)a5 age:(double)a6 date:(id)a7
{
  id v12;
  id v13;
  void *v14;
  RTWiFiAccessPoint *v15;
  uint64_t v16;
  NSString *mac;
  RTWiFiAccessPoint *v18;
  NSObject *v19;
  const char *v20;
  objc_super v22;
  uint8_t buf[16];

  v12 = a3;
  v13 = a7;
  v14 = v13;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v18 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: mac";
LABEL_12:
    _os_log_error_impl(&dword_1A5E26000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_9;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: date";
    goto LABEL_12;
  }
  v22.receiver = self;
  v22.super_class = (Class)RTWiFiAccessPoint;
  v15 = -[RTWiFiAccessPoint init](&v22, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    mac = v15->_mac;
    v15->_mac = (NSString *)v16;

    v15->_rssi = a4;
    v15->_channel = a5;
    v15->_age = a6;
    objc_storeStrong((id *)&v15->_date, a7);
  }
  self = v15;
  v18 = self;
LABEL_10:

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTWiFiAccessPoint)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMac_rssi_channel_age_date_);
}

- (RTWiFiAccessPoint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  RTWiFiAccessPoint *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mac"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rssi"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("channel"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("age"));
  v9 = v8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[RTWiFiAccessPoint initWithMac:rssi:channel:age:date:](self, "initWithMac:rssi:channel:age:date:", v5, v6, v7, v10, v9);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *mac;
  id v5;

  mac = self->_mac;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mac, CFSTR("mac"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_rssi, CFSTR("rssi"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_channel, CFSTR("channel"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("age"), self->_age);
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));

}

- (id)description
{
  void *v2;
  int64_t channel;
  double age;
  void *v5;
  void *v6;
  __int128 v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v8 = *(_OWORD *)&self->_mac;
  channel = self->_channel;
  age = self->_age;
  -[NSDate stringFromDate](self->_date, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("mac, %@, rssi, %ld, channel, %ld, age, %.2f, date, %@"), v8, channel, *(_QWORD *)&age, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  v3 = -[NSString hash](self->_mac, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_rssi);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_channel);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_age);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[NSDate hash](self->_date, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RTWiFiAccessPoint *v5;
  RTWiFiAccessPoint *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  void *v26;
  char v27;
  char v28;
  uint64_t v30;
  void *v31;
  RTWiFiAccessPoint *v32;

  v5 = (RTWiFiAccessPoint *)a3;
  if (self == v5)
  {
    v11 = 1;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_25;
  }
  v6 = v5;
  -[RTWiFiAccessPoint mac](self, "mac");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[RTWiFiAccessPoint mac](v6, "mac");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v10 = 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  -[RTWiFiAccessPoint mac](self, "mac");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWiFiAccessPoint mac](v6, "mac");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (!v7)
    goto LABEL_10;
LABEL_11:

  v12 = -[RTWiFiAccessPoint rssi](self, "rssi");
  v13 = -[RTWiFiAccessPoint rssi](v6, "rssi");
  v14 = -[RTWiFiAccessPoint channel](self, "channel");
  v15 = -[RTWiFiAccessPoint channel](v6, "channel");
  -[RTWiFiAccessPoint age](self, "age");
  v17 = v16;
  -[RTWiFiAccessPoint age](v6, "age");
  v19 = v18;
  -[RTWiFiAccessPoint date](self, "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v6;
  if (!v20)
  {
    -[RTWiFiAccessPoint date](v6, "date");
    v30 = objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      v31 = 0;
      v27 = 1;
LABEL_16:

      goto LABEL_17;
    }
  }
  -[RTWiFiAccessPoint date](self, "date", v30, v6);
  v21 = v10;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWiFiAccessPoint date](v6, "date");
  v23 = v15;
  v24 = v14;
  v25 = v12;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v22, "isEqualToDate:", v26);

  v12 = v25;
  v14 = v24;
  v15 = v23;

  v10 = v21;
  if (!v20)
    goto LABEL_16;
LABEL_17:

  if (v12 == v13)
    v28 = v10;
  else
    v28 = 0;
  if (v14 != v15)
    v28 = 0;
  if (v17 != v19)
    v28 = 0;
  v11 = v28 & v27;

LABEL_25:
  return v11;
}

- (NSString)mac
{
  return self->_mac;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (int64_t)channel
{
  return self->_channel;
}

- (double)age
{
  return self->_age;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_mac, 0);
}

@end
