@implementation AVResourceReclamationEvent

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVResourceReclamationEvent;
  -[AVResourceReclamationEvent dealloc](&v3, sel_dealloc);
}

- (AVResourceReclamationEvent)initWithEventIdentifier:(id)a3
{
  AVResourceReclamationEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVResourceReclamationEvent;
  v4 = -[AVResourceReclamationEvent init](&v6, sel_init);
  if (v4)
    v4->_eventIdentifier = (NSNumber *)objc_msgSend(a3, "copy");
  return v4;
}

- (id)copy
{
  return -[AVResourceReclamationEvent copyWithZone:](self, "copyWithZone:", 0);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[NSNumber isEqual:](self->_eventIdentifier, "isEqual:", *((_QWORD *)a3 + 1));
  }
  return 0;
}

- (unint64_t)hash
{
  return -[NSNumber hash](self->_eventIdentifier, "hash");
}

- (id)eventIdentifier
{
  return self->_eventIdentifier;
}

- (BOOL)happenedAfter:(id)a3
{
  unint64_t v4;

  if (!a3)
    return 1;
  v4 = -[NSNumber unsignedLongLongValue](self->_eventIdentifier, "unsignedLongLongValue");
  return v4 > objc_msgSend((id)objc_msgSend(a3, "eventIdentifier"), "unsignedLongLongValue");
}

- (BOOL)happenedBefore:(id)a3
{
  unint64_t v4;

  if (!a3)
    return 0;
  v4 = -[NSNumber unsignedLongLongValue](self->_eventIdentifier, "unsignedLongLongValue");
  return v4 < objc_msgSend((id)objc_msgSend(a3, "eventIdentifier"), "unsignedLongLongValue");
}

@end
