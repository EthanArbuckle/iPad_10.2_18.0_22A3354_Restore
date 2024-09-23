@implementation SGRealtimeReminder

- (SGRealtimeReminder)initWithReminder:(id)a3 notes:(id)a4
{
  id v7;
  id v8;
  SGRealtimeReminder *v9;
  SGRealtimeReminder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGRealtimeReminder;
  v9 = -[SGRealtimeReminder init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reminder, a3);
    objc_storeStrong((id *)&v10->_notes, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  SGReminder *reminder;
  id v5;

  reminder = self->_reminder;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", reminder, CFSTR("reminder"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_notes, CFSTR("notes"));

}

- (SGRealtimeReminder)initWithCoder:(id)a3
{
  id v4;
  SGRealtimeReminder *v5;
  void *v6;
  uint64_t v7;
  SGReminder *reminder;
  void *v9;
  uint64_t v10;
  NSString *notes;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SGRealtimeReminder;
  v5 = -[SGRealtimeReminder init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("reminder"));
    v7 = objc_claimAutoreleasedReturnValue();
    reminder = v5->_reminder;
    v5->_reminder = (SGReminder *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("notes"));
    v10 = objc_claimAutoreleasedReturnValue();
    notes = v5->_notes;
    v5->_notes = (NSString *)v10;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SGRealtimeReminder *v4;
  SGRealtimeReminder *v5;
  BOOL v6;

  v4 = (SGRealtimeReminder *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGRealtimeReminder isEqualToRealtimeReminder:](self, "isEqualToRealtimeReminder:", v5);

  return v6;
}

- (BOOL)isEqualToRealtimeReminder:(id)a3
{
  id *v4;
  SGReminder *reminder;
  SGReminder *v6;
  SGReminder *v7;
  SGReminder *v8;
  BOOL v9;
  char v10;
  NSString *v11;
  NSString *v12;

  v4 = (id *)a3;
  reminder = self->_reminder;
  v6 = (SGReminder *)v4[1];
  if (reminder == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = reminder;
    v9 = -[SGReminder isEqual:](v8, "isEqual:", v7);

    if (!v9)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_notes;
  v12 = v11;
  if (v11 == v4[2])
    v10 = 1;
  else
    v10 = -[NSString isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGRealtimeReminder reminder='%@'>"), self->_reminder);
}

- (SGReminder)reminder
{
  return self->_reminder;
}

- (NSString)notes
{
  return self->_notes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_reminder, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
