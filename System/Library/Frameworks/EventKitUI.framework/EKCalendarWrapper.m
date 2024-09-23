@implementation EKCalendarWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  EKObjectID *calendarObjectID;
  NSString *calendarIdentifier;
  EKSourceConstraints *constraints;
  id v8;

  v4 = a3;
  calendarObjectID = self->_calendarObjectID;
  v8 = v4;
  if (calendarObjectID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", calendarObjectID, CFSTR("objectID"));
    v4 = v8;
  }
  calendarIdentifier = self->_calendarIdentifier;
  if (calendarIdentifier)
  {
    objc_msgSend(v8, "encodeObject:forKey:", calendarIdentifier, CFSTR("calendarIdentifier"));
    v4 = v8;
  }
  constraints = self->_constraints;
  if (constraints)
  {
    objc_msgSend(v8, "encodeObject:forKey:", constraints, CFSTR("constraints"));
    v4 = v8;
  }

}

- (EKCalendarWrapper)initWithCoder:(id)a3
{
  id v4;
  EKCalendarWrapper *v5;
  uint64_t v6;
  EKObjectID *calendarObjectID;
  uint64_t v8;
  NSString *calendarIdentifier;
  uint64_t v10;
  EKSourceConstraints *constraints;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EKCalendarWrapper;
  v5 = -[EKCalendarWrapper init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
    v6 = objc_claimAutoreleasedReturnValue();
    calendarObjectID = v5->_calendarObjectID;
    v5->_calendarObjectID = (EKObjectID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calendarIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    calendarIdentifier = v5->_calendarIdentifier;
    v5->_calendarIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("constraints"));
    v10 = objc_claimAutoreleasedReturnValue();
    constraints = v5->_constraints;
    v5->_constraints = (EKSourceConstraints *)v10;

  }
  return v5;
}

- (EKCalendarWrapper)initWithCalendar:(id)a3
{
  id v4;
  EKCalendarWrapper *v5;
  uint64_t v6;
  EKObjectID *calendarObjectID;
  uint64_t v8;
  void *constraints;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKCalendarWrapper;
  v5 = -[EKCalendarWrapper init](&v12, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "allowEvents"))
    {
      objc_msgSend(v4, "objectID");
      v6 = objc_claimAutoreleasedReturnValue();
      calendarObjectID = v5->_calendarObjectID;
      v5->_calendarObjectID = (EKObjectID *)v6;

      objc_msgSend(v4, "constraints");
      v8 = objc_claimAutoreleasedReturnValue();
      constraints = v5->_constraints;
      v5->_constraints = (EKSourceConstraints *)v8;
    }
    else
    {
      objc_msgSend(v4, "calendarIdentifier");
      v10 = objc_claimAutoreleasedReturnValue();
      constraints = v5->_calendarIdentifier;
      v5->_calendarIdentifier = (NSString *)v10;
    }

  }
  return v5;
}

- (id)calendarInEventStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  EKSourceConstraints *constraints;
  void *v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (self->_calendarObjectID)
  {
    objc_msgSend(v4, "publicObjectWithObjectID:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      constraints = self->_constraints;
      if (constraints)
      {
        objc_msgSend(v6, "CADObjectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "cacheConstraints:forObjectWithCADObjectID:", constraints, v9);

      }
      v10 = v7;
    }

  }
  else
  {
    objc_msgSend(v4, "calendarWithIdentifier:", self->_calendarIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_calendarObjectID, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
}

@end
