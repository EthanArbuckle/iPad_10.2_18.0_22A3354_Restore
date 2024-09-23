@implementation CTLazuliSuggestedActionCalendar

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliSuggestedActionCalendar event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", event = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionCalendar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliSuggestedActionCalendar event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToCTLazuliChatBotCreateCalendarEvent:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliSuggestedActionCalendar *v4;
  CTLazuliSuggestedActionCalendar *v5;
  BOOL v6;

  v4 = (CTLazuliSuggestedActionCalendar *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliSuggestedActionCalendar isEqualToCTLazuliSuggestedActionCalendar:](self, "isEqualToCTLazuliSuggestedActionCalendar:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliSuggestedActionCalendar *v4;

  v4 = +[CTLazuliSuggestedActionCalendar allocWithZone:](CTLazuliSuggestedActionCalendar, "allocWithZone:", a3);
  -[CTLazuliSuggestedActionCalendar setEvent:](v4, "setEvent:", self->_event);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_event, CFSTR("kEventKey"));
}

- (CTLazuliSuggestedActionCalendar)initWithCoder:(id)a3
{
  id v4;
  CTLazuliSuggestedActionCalendar *v5;
  uint64_t v6;
  CTLazuliChatBotCreateCalendarEvent *event;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliSuggestedActionCalendar;
  v5 = -[CTLazuliSuggestedActionCalendar init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kEventKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    event = v5->_event;
    v5->_event = (CTLazuliChatBotCreateCalendarEvent *)v6;

  }
  return v5;
}

- (CTLazuliSuggestedActionCalendar)initWithReflection:(const void *)a3
{
  CTLazuliSuggestedActionCalendar *v4;
  CTLazuliChatBotCreateCalendarEvent *v5;
  CTLazuliChatBotCreateCalendarEvent *event;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CTLazuliSuggestedActionCalendar;
  v4 = -[CTLazuliSuggestedActionCalendar init](&v8, sel_init);
  if (v4)
  {
    v5 = -[CTLazuliChatBotCreateCalendarEvent initWithReflection:]([CTLazuliChatBotCreateCalendarEvent alloc], "initWithReflection:", a3);
    event = v4->_event;
    v4->_event = v5;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotCreateCalendarEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
