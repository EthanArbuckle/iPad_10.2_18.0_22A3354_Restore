@implementation ANAnnouncementResult

- (ANAnnouncementResult)initWithAnnouncementID:(id)a3 destination:(id)a4
{
  id v7;
  id v8;
  ANAnnouncementResult *v9;
  ANAnnouncementResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ANAnnouncementResult;
  v9 = -[ANAnnouncementResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deliveredAnnouncementID, a3);
    objc_storeStrong((id *)&v10->_destination, a4);
  }

  return v10;
}

+ (id)resultWithAnnouncementID:(id)a3 destination:(id)a4
{
  id v5;
  id v6;
  ANAnnouncementResult *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ANAnnouncementResult initWithAnnouncementID:destination:]([ANAnnouncementResult alloc], "initWithAnnouncementID:destination:", v6, v5);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ANAnnouncementResult deliveredAnnouncementID](self, "deliveredAnnouncementID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementResult destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Delivered Announcement ID = %@, Destination = %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ANAnnouncementResult deliveredAnnouncementID](self, "deliveredAnnouncementID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AnnouncmentID"));

  -[ANAnnouncementResult destination](self, "destination");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Destination"));

}

- (ANAnnouncementResult)initWithCoder:(id)a3
{
  id v4;
  ANAnnouncementResult *v5;
  uint64_t v6;
  NSString *deliveredAnnouncementID;
  uint64_t v8;
  ANAnnouncementDestination *destination;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ANAnnouncementResult;
  v5 = -[ANAnnouncementResult init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnnouncmentID"));
    v6 = objc_claimAutoreleasedReturnValue();
    deliveredAnnouncementID = v5->_deliveredAnnouncementID;
    v5->_deliveredAnnouncementID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Destination"));
    v8 = objc_claimAutoreleasedReturnValue();
    destination = v5->_destination;
    v5->_destination = (ANAnnouncementDestination *)v8;

  }
  return v5;
}

- (NSString)deliveredAnnouncementID
{
  return self->_deliveredAnnouncementID;
}

- (ANAnnouncementDestination)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_deliveredAnnouncementID, 0);
}

@end
