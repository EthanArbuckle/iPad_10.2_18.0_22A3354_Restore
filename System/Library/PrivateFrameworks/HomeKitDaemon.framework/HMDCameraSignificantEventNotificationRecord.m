@implementation HMDCameraSignificantEventNotificationRecord

- (HMDCameraSignificantEventNotificationRecord)initWithUUID:(id)a3 notificationReasons:(unint64_t)a4 date:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDCameraSignificantEventNotificationRecord *v11;
  uint64_t v12;
  NSUUID *UUID;
  uint64_t v14;
  NSDate *date;
  HMDCameraSignificantEventNotificationRecord *v17;
  SEL v18;
  id v19;
  objc_super v20;

  v8 = a3;
  v9 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_7:
    v17 = (HMDCameraSignificantEventNotificationRecord *)_HMFPreconditionFailure();
    return (HMDCameraSignificantEventNotificationRecord *)-[HMDCameraSignificantEventNotificationRecord isEqual:](v17, v18, v19);
  }
  v20.receiver = self;
  v20.super_class = (Class)HMDCameraSignificantEventNotificationRecord;
  v11 = -[HMDCameraSignificantEventNotificationRecord init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    UUID = v11->_UUID;
    v11->_UUID = (NSUUID *)v12;

    v11->_notificationReasons = a4;
    v14 = objc_msgSend(v10, "copy");
    date = v11->_date;
    v11->_date = (NSDate *)v14;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDCameraSignificantEventNotificationRecord UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8)
      && (v9 = -[HMDCameraSignificantEventNotificationRecord notificationReasons](self, "notificationReasons"),
          v9 == objc_msgSend(v6, "notificationReasons")))
    {
      -[HMDCameraSignificantEventNotificationRecord date](self, "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToDate:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDCameraSignificantEventNotificationRecord UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)notificationReasons
{
  return self->_notificationReasons;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
