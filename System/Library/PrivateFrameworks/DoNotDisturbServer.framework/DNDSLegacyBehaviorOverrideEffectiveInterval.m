@implementation DNDSLegacyBehaviorOverrideEffectiveInterval

- (DNDSLegacyBehaviorOverrideEffectiveInterval)initWithStartComponents:(id)a3 endComponents:(id)a4 calendarIdentifier:(id)a5 repeatInterval:(unint64_t)a6 identifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  DNDSLegacyBehaviorOverrideEffectiveInterval *v16;
  uint64_t v17;
  NSDateComponents *startComponents;
  uint64_t v19;
  NSDateComponents *endComponents;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSUUID *identifier;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)DNDSLegacyBehaviorOverrideEffectiveInterval;
  v16 = -[DNDSLegacyBehaviorOverrideEffectiveInterval init](&v27, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    startComponents = v16->_startComponents;
    v16->_startComponents = (NSDateComponents *)v17;

    v19 = objc_msgSend(v13, "copy");
    endComponents = v16->_endComponents;
    v16->_endComponents = (NSDateComponents *)v19;

    v21 = objc_msgSend(v14, "copy");
    v22 = (void *)v21;
    if (v21)
      v23 = (void *)v21;
    else
      v23 = (void *)*MEMORY[0x1E0C996C8];
    objc_storeStrong((id *)&v16->_calendarIdentifier, v23);

    v16->_repeatInterval = a6;
    v24 = objc_msgSend(v15, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (NSUUID *)v24;

  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDSLegacyBehaviorOverrideEffectiveInterval)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  DNDSLegacyBehaviorOverrideEffectiveInterval *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startComponents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endComponents"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("repeatInterval"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[DNDSLegacyBehaviorOverrideEffectiveInterval initWithStartComponents:endComponents:calendarIdentifier:repeatInterval:identifier:](self, "initWithStartComponents:endComponents:calendarIdentifier:repeatInterval:identifier:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[DNDSLegacyBehaviorOverrideEffectiveInterval startComponents](self, "startComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("startComponents"));

  -[DNDSLegacyBehaviorOverrideEffectiveInterval endComponents](self, "endComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("endComponents"));

  -[DNDSLegacyBehaviorOverrideEffectiveInterval calendarIdentifier](self, "calendarIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("calendar"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDSLegacyBehaviorOverrideEffectiveInterval repeatInterval](self, "repeatInterval"), CFSTR("repeatInterval"));
  -[DNDSLegacyBehaviorOverrideEffectiveInterval identifier](self, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("identifier"));

}

- (NSDateComponents)startComponents
{
  return self->_startComponents;
}

- (NSDateComponents)endComponents
{
  return self->_endComponents;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (unint64_t)repeatInterval
{
  return self->_repeatInterval;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_endComponents, 0);
  objc_storeStrong((id *)&self->_startComponents, 0);
}

@end
