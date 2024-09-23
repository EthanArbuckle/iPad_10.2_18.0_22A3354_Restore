@implementation CHSWidgetRelevanceGroupAttribute

- (CHSWidgetRelevanceGroupAttribute)initWithNamedGroupIdentifier:(id)a3 groupType:(unint64_t)a4
{
  id v6;
  CHSWidgetRelevanceGroupAttribute *v7;
  CHSWidgetRelevanceGroupAttribute *v8;
  uint64_t v9;
  NSString *groupIdentifier;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CHSWidgetRelevanceGroupAttribute;
  v7 = -[CHSWidgetRelevanceAttribute _init](&v12, sel__init);
  v8 = v7;
  if (v7)
  {
    v7->_groupType = a4;
    v9 = objc_msgSend(v6, "copy");
    groupIdentifier = v8->_groupIdentifier;
    v8->_groupIdentifier = (NSString *)v9;

  }
  return v8;
}

- (CHSWidgetRelevanceGroupAttribute)initWithNamedGroupIdentifier:(id)a3
{
  return -[CHSWidgetRelevanceGroupAttribute initWithNamedGroupIdentifier:groupType:](self, "initWithNamedGroupIdentifier:groupType:", a3, 1);
}

+ (CHSWidgetRelevanceGroupAttribute)ungrouped
{
  return (CHSWidgetRelevanceGroupAttribute *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithNamedGroupIdentifier:groupType:", 0, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_groupType)
    v5 = CFSTR("named");
  else
    v5 = CFSTR("ungrouped");
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("groupType"));
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", self->_groupIdentifier, CFSTR("groupIdentifier"), 1);
  objc_msgSend(v4, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  return self->_groupType ^ -[NSString hash](self->_groupIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  CHSWidgetRelevanceGroupAttribute *v4;
  char v5;

  v4 = (CHSWidgetRelevanceGroupAttribute *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v4->_groupType == self->_groupType)
      v5 = BSEqualObjects();
    else
      v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHSWidgetRelevanceGroupAttribute)initWithCoder:(id)a3
{
  id v4;
  CHSWidgetRelevanceGroupAttribute *v5;
  uint64_t v6;
  NSString *groupIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSWidgetRelevanceGroupAttribute;
  v5 = -[CHSWidgetRelevanceAttribute initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_groupType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_groupType, CFSTR("type"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupIdentifier, CFSTR("groupIdentifier"));

}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (unint64_t)groupType
{
  return self->_groupType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end
