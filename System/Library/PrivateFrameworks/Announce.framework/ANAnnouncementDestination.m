@implementation ANAnnouncementDestination

- (ANAnnouncementDestination)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ANAnnouncementDestination;
  return -[ANAnnouncementDestination init](&v3, sel_init);
}

+ (ANAnnouncementDestination)destinationWithHomeName:(id)a3
{
  return +[ANAnnouncementDestination destinationWithHomeName:zoneNames:roomNames:](ANAnnouncementDestination, "destinationWithHomeName:zoneNames:roomNames:", a3, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8]);
}

+ (ANAnnouncementDestination)destinationWithHomeName:(id)a3 zoneNames:(id)a4 roomNames:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setType:", 0);
  objc_msgSend(v10, "setHomeObject:", v9);

  objc_msgSend(v10, "setZoneObjects:", v8);
  objc_msgSend(v10, "setRoomObjects:", v7);

  return (ANAnnouncementDestination *)v10;
}

+ (ANAnnouncementDestination)destinationWithHomeIdentifier:(id)a3
{
  return +[ANAnnouncementDestination destinationWithHomeIdentifier:zoneIdentifiers:roomIdentifiers:](ANAnnouncementDestination, "destinationWithHomeIdentifier:zoneIdentifiers:roomIdentifiers:", a3, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8]);
}

+ (ANAnnouncementDestination)destinationWithHomeIdentifier:(id)a3 zoneIdentifiers:(id)a4 roomIdentifiers:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setType:", 1);
  objc_msgSend(v10, "setHomeObject:", v9);

  objc_msgSend(v10, "setZoneObjects:", v8);
  objc_msgSend(v10, "setRoomObjects:", v7);

  return (ANAnnouncementDestination *)v10;
}

+ (ANAnnouncementDestination)destinationWithReplyToAnnouncementIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setType:", 2);
  objc_msgSend(v4, "setHomeObject:", &stru_24D370F00);
  v5 = MEMORY[0x24BDBD1A8];
  objc_msgSend(v4, "setZoneObjects:", MEMORY[0x24BDBD1A8]);
  objc_msgSend(v4, "setRoomObjects:", v5);
  objc_msgSend(v4, "setAnnouncementIdentifier:", v3);

  return (ANAnnouncementDestination *)v4;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[ANAnnouncementDestination type](self, "type");
  +[ANAnnouncementDestination stringFromAnnouncementDestinationType:](ANAnnouncementDestination, "stringFromAnnouncementDestinationType:", -[ANAnnouncementDestination type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementDestination homeObject](self, "homeObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementDestination zoneObjects](self, "zoneObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementDestination roomObjects](self, "roomObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementDestination announcementIdentifier](self, "announcementIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Type = [%lu - %@], Home = %@, Zones = %@, Rooms = %@, Replying to AnnouncementID = %@, Replying to Sender = %d"), v4, v5, v6, v7, v8, v9, -[ANAnnouncementDestination replyToSender](self, "replyToSender"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)replyToSender
{
  return self->_replyToSender;
}

- (void)setReplyToSender:(BOOL)a3
{
  self->_replyToSender = a3;
}

+ (id)stringFromAnnouncementDestinationType:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Unknown");
  else
    return off_24D3705E0[a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[ANAnnouncementDestination type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("Type"));

  -[ANAnnouncementDestination homeObject](self, "homeObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("Home"));

  -[ANAnnouncementDestination zoneObjects](self, "zoneObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("Zones"));

  -[ANAnnouncementDestination roomObjects](self, "roomObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("Rooms"));

  -[ANAnnouncementDestination announcementIdentifier](self, "announcementIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("AnnouncementIdentifier"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ANAnnouncementDestination replyToSender](self, "replyToSender"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("ReplyToSender"));

}

- (ANAnnouncementDestination)initWithCoder:(id)a3
{
  id v4;
  ANAnnouncementDestination *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id homeObject;
  NSArray *zoneObjects;
  NSArray *v11;
  void *roomObjects;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *announcementIdentifier;
  void *v26;
  ANAnnouncementDestination *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ANAnnouncementDestination;
  v5 = -[ANAnnouncementDestination init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v5->_type = objc_msgSend(v6, "unsignedIntValue");
    v8 = -[ANAnnouncementDestination type](v5, "type");
    if (v8 == 2)
    {
      homeObject = v5->_homeObject;
      v5->_homeObject = &stru_24D370F00;

      zoneObjects = v5->_zoneObjects;
      v11 = (NSArray *)MEMORY[0x24BDBD1A8];
      v5->_zoneObjects = (NSArray *)MEMORY[0x24BDBD1A8];

      roomObjects = v5->_roomObjects;
      v5->_roomObjects = v11;
    }
    else
    {
      if (v8 > 1)
      {

        v27 = 0;
        goto LABEL_17;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Home"));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v5->_homeObject;
      v5->_homeObject = (id)v13;

      v15 = (void *)MEMORY[0x24BDBCF20];
      v16 = objc_opt_class();
      objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
      roomObjects = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", roomObjects, CFSTR("Zones"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = (void *)MEMORY[0x24BDBD1A8];
      if (v17)
        v20 = (void *)v17;
      else
        v20 = (void *)MEMORY[0x24BDBD1A8];
      objc_storeStrong((id *)&v5->_zoneObjects, v20);

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", roomObjects, CFSTR("Rooms"));
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
        v23 = (void *)v21;
      else
        v23 = v19;
      objc_storeStrong((id *)&v5->_roomObjects, v23);

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnnouncementIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    announcementIdentifier = v5->_announcementIdentifier;
    v5->_announcementIdentifier = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReplyToSender"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_replyToSender = objc_msgSend(v26, "BOOLValue");

  }
  v27 = v5;
LABEL_17:

  return v27;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (id)homeObject
{
  return self->_homeObject;
}

- (void)setHomeObject:(id)a3
{
  objc_storeStrong(&self->_homeObject, a3);
}

- (NSArray)zoneObjects
{
  return self->_zoneObjects;
}

- (void)setZoneObjects:(id)a3
{
  objc_storeStrong((id *)&self->_zoneObjects, a3);
}

- (NSArray)roomObjects
{
  return self->_roomObjects;
}

- (void)setRoomObjects:(id)a3
{
  objc_storeStrong((id *)&self->_roomObjects, a3);
}

- (NSString)announcementIdentifier
{
  return self->_announcementIdentifier;
}

- (void)setAnnouncementIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_announcementIdentifier, a3);
}

- (ANAnnouncement)announcement
{
  return self->_announcement;
}

- (void)setAnnouncement:(id)a3
{
  objc_storeStrong((id *)&self->_announcement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_announcement, 0);
  objc_storeStrong((id *)&self->_announcementIdentifier, 0);
  objc_storeStrong((id *)&self->_roomObjects, 0);
  objc_storeStrong((id *)&self->_zoneObjects, 0);
  objc_storeStrong(&self->_homeObject, 0);
}

@end
