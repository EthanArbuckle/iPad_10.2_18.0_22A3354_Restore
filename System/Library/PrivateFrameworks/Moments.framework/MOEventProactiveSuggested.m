@implementation MOEventProactiveSuggested

+ (id)describeCategory:(unint64_t)a3
{
  if (a3 > 0xC)
    return CFSTR("Unknown");
  else
    return off_1E85438B0[a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *suggestedEventTitle;
  id v5;

  suggestedEventTitle = self->_suggestedEventTitle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", suggestedEventTitle, CFSTR("suggestedEventTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestedEventIdentifier, CFSTR("suggestedEventIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_suggestedEventCategory, CFSTR("suggestedEventCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestedEvent, CFSTR("suggestedEvent"));

}

- (MOEventProactiveSuggested)initWithCoder:(id)a3
{
  id v4;
  MOEventProactiveSuggested *v5;
  uint64_t v6;
  NSString *suggestedEventTitle;
  uint64_t v8;
  NSString *suggestedEventIdentifier;
  uint64_t v10;
  PPEvent *suggestedEvent;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MOEventProactiveSuggested;
  v5 = -[MOEventProactiveSuggested init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestedEventTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    suggestedEventTitle = v5->_suggestedEventTitle;
    v5->_suggestedEventTitle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestedEventIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    suggestedEventIdentifier = v5->_suggestedEventIdentifier;
    v5->_suggestedEventIdentifier = (NSString *)v8;

    v5->_suggestedEventCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("suggestedEventCategory"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestedEvent"));
    v10 = objc_claimAutoreleasedReturnValue();
    suggestedEvent = v5->_suggestedEvent;
    v5->_suggestedEvent = (PPEvent *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventProactiveSuggested *v4;

  v4 = objc_alloc_init(MOEventProactiveSuggested);
  objc_storeStrong((id *)&v4->_suggestedEvent, self->_suggestedEvent);
  objc_storeStrong((id *)&v4->_suggestedEventTitle, self->_suggestedEventTitle);
  v4->_suggestedEventCategory = self->_suggestedEventCategory;
  objc_storeStrong((id *)&v4->_suggestedEventIdentifier, self->_suggestedEventIdentifier);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString mask](self->_suggestedEventTitle, "mask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("suggestedEventTitle, %@, suggestedEventIdentifier, %@"), v4, self->_suggestedEventIdentifier);

  return v5;
}

- (NSString)suggestedEventTitle
{
  return self->_suggestedEventTitle;
}

- (void)setSuggestedEventTitle:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedEventTitle, a3);
}

- (NSString)suggestedEventIdentifier
{
  return self->_suggestedEventIdentifier;
}

- (void)setSuggestedEventIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedEventIdentifier, a3);
}

- (unint64_t)suggestedEventCategory
{
  return self->_suggestedEventCategory;
}

- (void)setSuggestedEventCategory:(unint64_t)a3
{
  self->_suggestedEventCategory = a3;
}

- (PPEvent)suggestedEvent
{
  return self->_suggestedEvent;
}

- (void)setSuggestedEvent:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedEvent, 0);
  objc_storeStrong((id *)&self->_suggestedEventIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestedEventTitle, 0);
}

@end
