@implementation NTPBDevicePushTokenUpdateRequest

- (BOOL)hasNotificationUserId
{
  return self->_notificationUserId != 0;
}

- (BOOL)hasDeviceInfoToAdd
{
  return self->_deviceInfoToAdd != 0;
}

- (BOOL)hasDeviceInfoToRemove
{
  return self->_deviceInfoToRemove != 0;
}

- (BOOL)hasUserStorefrontId
{
  return self->_userStorefrontId != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBDevicePushTokenUpdateRequest;
  -[NTPBDevicePushTokenUpdateRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBDevicePushTokenUpdateRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *notificationUserId;
  NTPBDeviceInfo *deviceInfoToAdd;
  void *v7;
  NTPBDeviceInfo *deviceInfoToRemove;
  void *v9;
  NSString *userStorefrontId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  notificationUserId = self->_notificationUserId;
  if (notificationUserId)
    objc_msgSend(v3, "setObject:forKey:", notificationUserId, CFSTR("notification_user_id"));
  deviceInfoToAdd = self->_deviceInfoToAdd;
  if (deviceInfoToAdd)
  {
    -[NTPBDeviceInfo dictionaryRepresentation](deviceInfoToAdd, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("device_info_to_add"));

  }
  deviceInfoToRemove = self->_deviceInfoToRemove;
  if (deviceInfoToRemove)
  {
    -[NTPBDeviceInfo dictionaryRepresentation](deviceInfoToRemove, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("device_info_to_remove"));

  }
  userStorefrontId = self->_userStorefrontId;
  if (userStorefrontId)
    objc_msgSend(v4, "setObject:forKey:", userStorefrontId, CFSTR("user_storefront_id"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBDevicePushTokenUpdateRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_notificationUserId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_deviceInfoToAdd)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_deviceInfoToRemove)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userStorefrontId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_notificationUserId, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NTPBDeviceInfo copyWithZone:](self->_deviceInfoToAdd, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NTPBDeviceInfo copyWithZone:](self->_deviceInfoToRemove, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_userStorefrontId, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *notificationUserId;
  NTPBDeviceInfo *deviceInfoToAdd;
  NTPBDeviceInfo *deviceInfoToRemove;
  NSString *userStorefrontId;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((notificationUserId = self->_notificationUserId, !((unint64_t)notificationUserId | v4[3]))
     || -[NSString isEqual:](notificationUserId, "isEqual:"))
    && ((deviceInfoToAdd = self->_deviceInfoToAdd, !((unint64_t)deviceInfoToAdd | v4[1]))
     || -[NTPBDeviceInfo isEqual:](deviceInfoToAdd, "isEqual:"))
    && ((deviceInfoToRemove = self->_deviceInfoToRemove, !((unint64_t)deviceInfoToRemove | v4[2]))
     || -[NTPBDeviceInfo isEqual:](deviceInfoToRemove, "isEqual:")))
  {
    userStorefrontId = self->_userStorefrontId;
    if ((unint64_t)userStorefrontId | v4[4])
      v9 = -[NSString isEqual:](userStorefrontId, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_notificationUserId, "hash");
  v4 = -[NTPBDeviceInfo hash](self->_deviceInfoToAdd, "hash") ^ v3;
  v5 = -[NTPBDeviceInfo hash](self->_deviceInfoToRemove, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_userStorefrontId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NTPBDeviceInfo *deviceInfoToAdd;
  uint64_t v6;
  NTPBDeviceInfo *deviceInfoToRemove;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v9 = v4;
  if (v4[3])
  {
    -[NTPBDevicePushTokenUpdateRequest setNotificationUserId:](self, "setNotificationUserId:");
    v4 = v9;
  }
  deviceInfoToAdd = self->_deviceInfoToAdd;
  v6 = v4[1];
  if (deviceInfoToAdd)
  {
    if (!v6)
      goto LABEL_9;
    -[NTPBDeviceInfo mergeFrom:](deviceInfoToAdd, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[NTPBDevicePushTokenUpdateRequest setDeviceInfoToAdd:](self, "setDeviceInfoToAdd:");
  }
  v4 = v9;
LABEL_9:
  deviceInfoToRemove = self->_deviceInfoToRemove;
  v8 = v4[2];
  if (deviceInfoToRemove)
  {
    if (!v8)
      goto LABEL_15;
    -[NTPBDeviceInfo mergeFrom:](deviceInfoToRemove, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[NTPBDevicePushTokenUpdateRequest setDeviceInfoToRemove:](self, "setDeviceInfoToRemove:");
  }
  v4 = v9;
LABEL_15:
  if (v4[4])
  {
    -[NTPBDevicePushTokenUpdateRequest setUserStorefrontId:](self, "setUserStorefrontId:");
    v4 = v9;
  }

}

- (NSString)notificationUserId
{
  return self->_notificationUserId;
}

- (void)setNotificationUserId:(id)a3
{
  objc_storeStrong((id *)&self->_notificationUserId, a3);
}

- (NTPBDeviceInfo)deviceInfoToAdd
{
  return self->_deviceInfoToAdd;
}

- (void)setDeviceInfoToAdd:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfoToAdd, a3);
}

- (NTPBDeviceInfo)deviceInfoToRemove
{
  return self->_deviceInfoToRemove;
}

- (void)setDeviceInfoToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfoToRemove, a3);
}

- (NSString)userStorefrontId
{
  return self->_userStorefrontId;
}

- (void)setUserStorefrontId:(id)a3
{
  objc_storeStrong((id *)&self->_userStorefrontId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStorefrontId, 0);
  objc_storeStrong((id *)&self->_notificationUserId, 0);
  objc_storeStrong((id *)&self->_deviceInfoToRemove, 0);
  objc_storeStrong((id *)&self->_deviceInfoToAdd, 0);
}

@end
