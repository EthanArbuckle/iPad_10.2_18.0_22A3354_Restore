@implementation CLSEvent

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("<CLSEvent>"));
  if (self->_title)
    objc_msgSend(v3, "appendFormat:", CFSTR(" title:[%@]"), self->_title);
  if (self->_startDate)
    objc_msgSend(v3, "appendFormat:", CFSTR(" dates:[%@"), self->_startDate);
  if (self->_endDate)
    objc_msgSend(v3, "appendFormat:", CFSTR("- %@]"), self->_endDate);
  if (-[NSArray count](self->_attendees, "count"))
  {
    -[NSArray valueForKeyPath:](self->_attendees, "valueForKeyPath:", CFSTR("name"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tpeople:[%@]"), v5);

  }
  if (-[NSArray count](self->_performers, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_performers, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tpeople:[%@]"), v6);

  }
  if (self->_location)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CLLocation name](self->_location, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tlocation:[%@]"), v7);

    }
    else
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tlocation:[%@]"), self->_location);
    }
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attendees, CFSTR("attendees"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_performers, CFSTR("performers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_meetingRoom, CFSTR("meetingRoom"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_organizedByMe, CFSTR("organizedByMe"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_accepted, CFSTR("accepted"));

}

- (CLSEvent)initWithCoder:(id)a3
{
  id v4;
  CLSEvent *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  CLLocation *location;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *attendees;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *performers;
  uint64_t v22;
  NSDate *startDate;
  uint64_t v24;
  NSDate *endDate;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CLSEvent;
  v5 = -[CLSEvent init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v8 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (CLLocation *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("attendees"));
    v15 = objc_claimAutoreleasedReturnValue();
    attendees = v5->_attendees;
    v5->_attendees = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("performers"));
    v20 = objc_claimAutoreleasedReturnValue();
    performers = v5->_performers;
    v5->_performers = (NSArray *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v24;

    v5->_meetingRoom = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("meetingRoom"));
    v5->_organizedByMe = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("organizedByMe"));
    v5->_accepted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accepted"));
  }

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSArray)attendees
{
  return self->_attendees;
}

- (void)setAttendees:(id)a3
{
  objc_storeStrong((id *)&self->_attendees, a3);
}

- (NSArray)performers
{
  return self->_performers;
}

- (void)setPerformers:(id)a3
{
  objc_storeStrong((id *)&self->_performers, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (BOOL)hasMeetingRoom
{
  return self->_meetingRoom;
}

- (void)setMeetingRoom:(BOOL)a3
{
  self->_meetingRoom = a3;
}

- (BOOL)isOrganizedByMe
{
  return self->_organizedByMe;
}

- (void)setOrganizedByMe:(BOOL)a3
{
  self->_organizedByMe = a3;
}

- (BOOL)isAccepted
{
  return self->_accepted;
}

- (void)setAccepted:(BOOL)a3
{
  self->_accepted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_performers, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
