@implementation CTStewieConnectionAssistantEvent

- (id)description
{
  void *v3;
  int64_t v4;
  const char *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTStewieConnectionAssistantEvent eventType](self, "eventType");
  if ((unint64_t)(v4 - 1) > 7)
    v5 = "CTStewieConnectionAssistantEventTypeUnknown";
  else
    v5 = off_1E1534750[v4 - 1];
  objc_msgSend(v3, "appendFormat:", CFSTR(", eventType=%s"), v5);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieConnectionAssistantEvent *v4;
  int64_t v5;
  BOOL v6;

  v4 = (CTStewieConnectionAssistantEvent *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[CTStewieConnectionAssistantEvent eventType](self, "eventType");
      v6 = v5 == -[CTStewieConnectionAssistantEvent eventType](v4, "eventType");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setEventType:", -[CTStewieConnectionAssistantEvent eventType](self, "eventType"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieConnectionAssistantEvent eventType](self, "eventType"), CFSTR("eventType"));

}

- (CTStewieConnectionAssistantEvent)initWithCoder:(id)a3
{
  id v4;
  CTStewieConnectionAssistantEvent *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTStewieConnectionAssistantEvent;
  v5 = -[CTStewieConnectionAssistantEvent init](&v7, sel_init);
  if (v5)
    v5->_eventType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eventType"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

@end
