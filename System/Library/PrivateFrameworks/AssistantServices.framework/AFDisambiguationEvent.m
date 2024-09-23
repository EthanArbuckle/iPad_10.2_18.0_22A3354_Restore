@implementation AFDisambiguationEvent

- (AFDisambiguationEvent)initWithCoder:(id)a3
{
  id v4;
  AFDisambiguationEvent *v5;
  uint64_t v6;
  NSString *itemIdentifier;
  uint64_t v8;
  NSDate *date;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFDisambiguationEvent;
  v5 = -[AFDisambiguationEvent init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_itemIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    v5->_selectionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_selectionType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_date"));
    v8 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *itemIdentifier;
  id v5;

  itemIdentifier = self->_itemIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemIdentifier, CFSTR("_itemIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_selectionType, CFSTR("_selectionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("_date"));

}

- (id)description
{
  unint64_t selectionType;
  const __CFString *v3;

  selectionType = self->_selectionType;
  if (selectionType > 2)
    v3 = CFSTR("Unknown");
  else
    v3 = off_1E3A2DA40[selectionType];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Identifier: %@, Selection Type: %@, Date: %@"), self->_itemIdentifier, v3, self->_date);
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)selectionType
{
  return self->_selectionType;
}

- (void)setSelectionType:(int64_t)a3
{
  self->_selectionType = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
