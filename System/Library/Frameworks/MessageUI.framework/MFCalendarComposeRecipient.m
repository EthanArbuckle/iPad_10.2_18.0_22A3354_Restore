@implementation MFCalendarComposeRecipient

- (MFCalendarComposeRecipient)initWithComposeRecipient:(id)a3
{
  id v4;
  void *v5;
  MFCalendarComposeRecipient *v6;
  uint64_t v7;
  NSString *displayString;

  v4 = a3;
  objc_msgSend(v4, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MFComposeRecipient initWithContact:address:kind:](self, "initWithContact:address:kind:", 0, v5, objc_msgSend(v4, "kind"));

  if (v6)
  {
    v6->super._property = *MEMORY[0x1E0CF5F98];
    objc_msgSend(v4, "displayString");
    v7 = objc_claimAutoreleasedReturnValue();
    displayString = v6->super._displayString;
    v6->super._displayString = (NSString *)v7;

    v6->super._sourceType = objc_msgSend(v4, "sourceType");
  }

  return v6;
}

- (void)setCalAttendeeName:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_calAttendeeName != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_calAttendeeName, a3);
    v5 = v6;
  }

}

- (void)setParticipant:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_participant != v5)
  {
    v6 = v5;
    objc_storeStrong(&self->_participant, a3);
    v5 = v6;
  }

}

- (id)participant
{
  return self->_participant;
}

- (id)displayString
{
  NSString *v3;
  NSString *calAttendeeName;
  objc_super v6;

  if (-[MFComposeRecipient record](self, "record") || (calAttendeeName = self->_calAttendeeName) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)MFCalendarComposeRecipient;
    -[MFComposeRecipient displayString](&v6, sel_displayString);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = calAttendeeName;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MFComposeRecipient uncommentedAddress](self, "uncommentedAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uncommentedAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  -[MFComposeRecipient uncommentedAddress](self, "uncommentedAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (id)objc_msgSend(v3, "hash");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MFCalendarComposeRecipient;
    v5 = -[MFComposeRecipient hash](&v8, sel_hash);
  }
  v6 = (unint64_t)v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_participant, 0);
  objc_storeStrong((id *)&self->_calAttendeeName, 0);
}

@end
