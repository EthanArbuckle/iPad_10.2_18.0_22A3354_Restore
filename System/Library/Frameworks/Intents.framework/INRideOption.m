@implementation INRideOption

- (INRideOption)initWithName:(NSString *)name estimatedPickupDate:(NSDate *)estimatedPickupDate
{
  NSString *v6;
  NSDate *v7;
  INRideOption *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSDate *v12;
  objc_super v14;

  v6 = name;
  v7 = estimatedPickupDate;
  v14.receiver = self;
  v14.super_class = (Class)INRideOption;
  v8 = -[INRideOption init](&v14, sel_init);
  if (v8)
  {
    v9 = -[NSString copy](v6, "copy");
    v10 = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = -[NSDate copy](v7, "copy");
    v12 = v8->_estimatedPickupDate;
    v8->_estimatedPickupDate = (NSDate *)v11;

  }
  return v8;
}

- (NSArray)availablePartySizeOptions
{
  return self->_availablePartySizeOptions;
}

- (void)setAvailablePartySizeOptions:(NSArray *)availablePartySizeOptions
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;

  v4 = availablePartySizeOptions;
  v7 = v4;
  if (v4)
  {
    if (-[NSArray count](v4, "count"))
    {
      v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v7, 1);
      v6 = self->_availablePartySizeOptions;
      self->_availablePartySizeOptions = v5;
    }
    else
    {
      v6 = self->_availablePartySizeOptions;
      self->_availablePartySizeOptions = (NSArray *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v6 = self->_availablePartySizeOptions;
    self->_availablePartySizeOptions = 0;
  }

}

- (NSArray)fareLineItems
{
  return self->_fareLineItems;
}

- (void)setFareLineItems:(NSArray *)fareLineItems
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;

  v4 = fareLineItems;
  v7 = v4;
  if (v4)
  {
    if (-[NSArray count](v4, "count"))
    {
      v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v7, 1);
      v6 = self->_fareLineItems;
      self->_fareLineItems = v5;
    }
    else
    {
      v6 = self->_fareLineItems;
      self->_fareLineItems = (NSArray *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v6 = self->_fareLineItems;
    self->_fareLineItems = 0;
  }

}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSDate hash](self->_estimatedPickupDate, "hash") ^ v3;
  v5 = -[INPriceRange hash](self->_priceRange, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_disclaimerMessage, "hash");
  v7 = -[NSArray hash](self->_availablePartySizeOptions, "hash");
  v8 = v7 ^ -[NSString hash](self->_availablePartySizeOptionsSelectionPrompt, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_specialPricing, "hash");
  v10 = -[INImage hash](self->_specialPricingBadgeImage, "hash");
  v11 = v10 ^ -[NSArray hash](self->_fareLineItems, "hash");
  v12 = v11 ^ -[NSUserActivity hash](self->_userActivityForBookingInApplication, "hash");
  v13 = v9 ^ v12 ^ -[NSNumber hash](self->_usesMeteredFare, "hash");
  return v13 ^ -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *name;
  NSDate *estimatedPickupDate;
  INPriceRange *priceRange;
  NSString *disclaimerMessage;
  NSString *availablePartySizeOptionsSelectionPrompt;
  NSArray *availablePartySizeOptions;
  NSString *specialPricing;
  INImage *specialPricingBadgeImage;
  NSArray *fareLineItems;
  NSUserActivity *userActivityForBookingInApplication;
  NSNumber *usesMeteredFare;
  NSString *identifier;
  BOOL v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    name = self->_name;
    if (name != (NSString *)v5[4] && !-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_28;
    estimatedPickupDate = self->_estimatedPickupDate;
    if (estimatedPickupDate != (NSDate *)v5[5] && !-[NSDate isEqual:](estimatedPickupDate, "isEqual:"))
      goto LABEL_28;
    priceRange = self->_priceRange;
    if (priceRange != (INPriceRange *)v5[6] && !-[INPriceRange isEqual:](priceRange, "isEqual:"))
      goto LABEL_28;
    disclaimerMessage = self->_disclaimerMessage;
    if (disclaimerMessage != (NSString *)v5[8] && !-[NSString isEqual:](disclaimerMessage, "isEqual:"))
      goto LABEL_28;
    availablePartySizeOptionsSelectionPrompt = self->_availablePartySizeOptionsSelectionPrompt;
    if (availablePartySizeOptionsSelectionPrompt != (NSString *)v5[9]
      && !-[NSString isEqual:](availablePartySizeOptionsSelectionPrompt, "isEqual:"))
    {
      goto LABEL_28;
    }
    if (((availablePartySizeOptions = self->_availablePartySizeOptions, availablePartySizeOptions == (NSArray *)v5[2])
       || -[NSArray isEqual:](availablePartySizeOptions, "isEqual:"))
      && ((specialPricing = self->_specialPricing, specialPricing == (NSString *)v5[10])
       || -[NSString isEqual:](specialPricing, "isEqual:"))
      && ((specialPricingBadgeImage = self->_specialPricingBadgeImage, specialPricingBadgeImage == (INImage *)v5[11])
       || -[INImage isEqual:](specialPricingBadgeImage, "isEqual:"))
      && ((fareLineItems = self->_fareLineItems, fareLineItems == (NSArray *)v5[3])
       || -[NSArray isEqual:](fareLineItems, "isEqual:"))
      && ((userActivityForBookingInApplication = self->_userActivityForBookingInApplication,
           userActivityForBookingInApplication == (NSUserActivity *)v5[12])
       || -[NSUserActivity isEqual:](userActivityForBookingInApplication, "isEqual:"))
      && ((usesMeteredFare = self->_usesMeteredFare, usesMeteredFare == (NSNumber *)v5[7])
       || -[NSNumber isEqual:](usesMeteredFare, "isEqual:"))
      && ((identifier = self->_identifier, identifier == (NSString *)v5[1])
       || -[NSString isEqual:](identifier, "isEqual:")))
    {
      v18 = 1;
    }
    else
    {
LABEL_28:
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithName:estimatedPickupDate:", self->_name, self->_estimatedPickupDate);
  objc_msgSend(v4, "setPriceRange:", self->_priceRange);
  objc_msgSend(v4, "setDisclaimerMessage:", self->_disclaimerMessage);
  objc_msgSend(v4, "setAvailablePartySizeOptions:", self->_availablePartySizeOptions);
  objc_msgSend(v4, "setAvailablePartySizeOptionsSelectionPrompt:", self->_availablePartySizeOptionsSelectionPrompt);
  objc_msgSend(v4, "setSpecialPricing:", self->_specialPricing);
  objc_msgSend(v4, "setSpecialPricingBadgeImage:", self->_specialPricingBadgeImage);
  objc_msgSend(v4, "setFareLineItems:", self->_fareLineItems);
  objc_msgSend(v4, "setUserActivityForBookingInApplication:", self->_userActivityForBookingInApplication);
  objc_msgSend(v4, "setUsesMeteredFare:", self->_usesMeteredFare);
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  return v4;
}

- (INRideOption)initWithCoder:(NSCoder *)decoder
{
  NSCoder *v4;
  INRideOption *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSDate *estimatedPickupDate;
  uint64_t v10;
  INPriceRange *priceRange;
  uint64_t v12;
  NSString *disclaimerMessage;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *availablePartySizeOptions;
  uint64_t v19;
  NSString *availablePartySizeOptionsSelectionPrompt;
  uint64_t v21;
  NSString *specialPricing;
  uint64_t v23;
  INImage *specialPricingBadgeImage;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSArray *fareLineItems;
  uint64_t v30;
  NSNumber *usesMeteredFare;
  void *v32;
  uint64_t v33;
  NSUserActivity *userActivityForBookingInApplication;
  uint64_t v35;
  NSString *identifier;
  objc_super v38;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v4 = decoder;
  v38.receiver = self;
  v38.super_class = (Class)INRideOption;
  v5 = -[INRideOption init](&v38, sel_init);
  if (v5)
  {
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("estimatedPickupDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    estimatedPickupDate = v5->_estimatedPickupDate;
    v5->_estimatedPickupDate = (NSDate *)v8;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("priceRange"));
    v10 = objc_claimAutoreleasedReturnValue();
    priceRange = v5->_priceRange;
    v5->_priceRange = (INPriceRange *)v10;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disclaimerMessage"));
    v12 = objc_claimAutoreleasedReturnValue();
    disclaimerMessage = v5->_disclaimerMessage;
    v5->_disclaimerMessage = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("availablePartySizeOptions"));
    v17 = objc_claimAutoreleasedReturnValue();
    availablePartySizeOptions = v5->_availablePartySizeOptions;
    v5->_availablePartySizeOptions = (NSArray *)v17;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("availablePartySizeOptionsSelectionPrompt"));
    v19 = objc_claimAutoreleasedReturnValue();
    availablePartySizeOptionsSelectionPrompt = v5->_availablePartySizeOptionsSelectionPrompt;
    v5->_availablePartySizeOptionsSelectionPrompt = (NSString *)v19;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("specialPricing"));
    v21 = objc_claimAutoreleasedReturnValue();
    specialPricing = v5->_specialPricing;
    v5->_specialPricing = (NSString *)v21;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("specialPricingBadgeImage"));
    v23 = objc_claimAutoreleasedReturnValue();
    specialPricingBadgeImage = v5->_specialPricingBadgeImage;
    v5->_specialPricingBadgeImage = (INImage *)v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("fareLineItems"));
    v28 = objc_claimAutoreleasedReturnValue();
    fareLineItems = v5->_fareLineItems;
    v5->_fareLineItems = (NSArray *)v28;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usesMeteredFare"));
    v30 = objc_claimAutoreleasedReturnValue();
    usesMeteredFare = v5->_usesMeteredFare;
    v5->_usesMeteredFare = (NSNumber *)v30;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivityForBookingInApplication"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    INUserActivityDeserializeFromData(v32);
    v33 = objc_claimAutoreleasedReturnValue();
    userActivityForBookingInApplication = v5->_userActivityForBookingInApplication;
    v5->_userActivityForBookingInApplication = (NSUserActivity *)v33;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v35 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v35;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;
  id v6;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_estimatedPickupDate, CFSTR("estimatedPickupDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_priceRange, CFSTR("priceRange"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_disclaimerMessage, CFSTR("disclaimerMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availablePartySizeOptions, CFSTR("availablePartySizeOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availablePartySizeOptionsSelectionPrompt, CFSTR("availablePartySizeOptionsSelectionPrompt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_specialPricing, CFSTR("specialPricing"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_specialPricingBadgeImage, CFSTR("specialPricingBadgeImage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fareLineItems, CFSTR("fareLineItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_usesMeteredFare, CFSTR("usesMeteredFare"));
  INUserActivitySerializeToData(self->_userActivityForBookingInApplication);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("userActivityForBookingInApplication"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (NSString)description
{
  return (NSString *)-[INRideOption descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INRideOption;
  -[INRideOption description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRideOption _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  uint64_t estimatedPickupDate;
  uint64_t priceRange;
  uint64_t usesMeteredFare;
  uint64_t disclaimerMessage;
  NSArray *availablePartySizeOptions;
  uint64_t v9;
  NSString *availablePartySizeOptionsSelectionPrompt;
  uint64_t v11;
  NSString *specialPricing;
  uint64_t v13;
  INImage *specialPricingBadgeImage;
  void *v15;
  void *v16;
  NSArray *fareLineItems;
  void *v18;
  NSUserActivity *userActivityForBookingInApplication;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSString *name;
  _QWORD v35[11];
  _QWORD v36[13];

  v36[11] = *MEMORY[0x1E0C80C00];
  name = self->_name;
  v3 = (uint64_t)name;
  v35[0] = CFSTR("name");
  if (!name)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v36[0] = v3;
  v35[1] = CFSTR("estimatedPickupDate");
  estimatedPickupDate = (uint64_t)self->_estimatedPickupDate;
  v32 = estimatedPickupDate;
  if (!estimatedPickupDate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    estimatedPickupDate = objc_claimAutoreleasedReturnValue();
  }
  v36[1] = estimatedPickupDate;
  v35[2] = CFSTR("priceRange");
  priceRange = (uint64_t)self->_priceRange;
  v31 = priceRange;
  if (!priceRange)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    priceRange = objc_claimAutoreleasedReturnValue();
  }
  v36[2] = priceRange;
  v35[3] = CFSTR("usesMeteredFare");
  usesMeteredFare = (uint64_t)self->_usesMeteredFare;
  v30 = usesMeteredFare;
  if (!usesMeteredFare)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    usesMeteredFare = objc_claimAutoreleasedReturnValue();
  }
  v36[3] = usesMeteredFare;
  v35[4] = CFSTR("disclaimerMessage");
  disclaimerMessage = (uint64_t)self->_disclaimerMessage;
  v29 = disclaimerMessage;
  if (!disclaimerMessage)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    disclaimerMessage = objc_claimAutoreleasedReturnValue();
  }
  v36[4] = disclaimerMessage;
  v35[5] = CFSTR("availablePartySizeOptions");
  availablePartySizeOptions = self->_availablePartySizeOptions;
  v9 = (uint64_t)availablePartySizeOptions;
  if (!availablePartySizeOptions)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v9;
  v36[5] = v9;
  v35[6] = CFSTR("availablePartySizeOptionsSelectionPrompt");
  availablePartySizeOptionsSelectionPrompt = self->_availablePartySizeOptionsSelectionPrompt;
  v11 = (uint64_t)availablePartySizeOptionsSelectionPrompt;
  if (!availablePartySizeOptionsSelectionPrompt)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v11;
  v36[6] = v11;
  v35[7] = CFSTR("specialPricing");
  specialPricing = self->_specialPricing;
  v13 = (uint64_t)specialPricing;
  if (!specialPricing)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)disclaimerMessage;
  v26 = (void *)usesMeteredFare;
  v27 = (void *)priceRange;
  v33 = (void *)v3;
  v22 = (void *)v13;
  v36[7] = v13;
  v35[8] = CFSTR("specialPricingBadgeImage");
  specialPricingBadgeImage = self->_specialPricingBadgeImage;
  v15 = specialPricingBadgeImage;
  if (!specialPricingBadgeImage)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)estimatedPickupDate;
  v36[8] = v15;
  v35[9] = CFSTR("fareLineItems");
  fareLineItems = self->_fareLineItems;
  v18 = fareLineItems;
  if (!fareLineItems)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36[9] = v18;
  v35[10] = CFSTR("userActivityForBookingInApplication");
  userActivityForBookingInApplication = self->_userActivityForBookingInApplication;
  v20 = userActivityForBookingInApplication;
  if (!userActivityForBookingInApplication)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36[10] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 11);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (userActivityForBookingInApplication)
  {
    if (fareLineItems)
      goto LABEL_25;
LABEL_41:

    if (specialPricingBadgeImage)
      goto LABEL_26;
    goto LABEL_42;
  }

  if (!fareLineItems)
    goto LABEL_41;
LABEL_25:
  if (specialPricingBadgeImage)
    goto LABEL_26;
LABEL_42:

LABEL_26:
  if (specialPricing)
  {
    if (availablePartySizeOptionsSelectionPrompt)
      goto LABEL_28;
LABEL_44:

    if (availablePartySizeOptions)
      goto LABEL_29;
    goto LABEL_45;
  }

  if (!availablePartySizeOptionsSelectionPrompt)
    goto LABEL_44;
LABEL_28:
  if (availablePartySizeOptions)
    goto LABEL_29;
LABEL_45:

LABEL_29:
  if (!v29)

  if (!v30)
  if (!v31)

  if (!v32)
  if (!name)

  return v28;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 32);
}

- (NSDate)estimatedPickupDate
{
  return self->_estimatedPickupDate;
}

- (void)setEstimatedPickupDate:(NSDate *)estimatedPickupDate
{
  objc_setProperty_nonatomic_copy(self, a2, estimatedPickupDate, 40);
}

- (INPriceRange)priceRange
{
  return self->_priceRange;
}

- (void)setPriceRange:(INPriceRange *)priceRange
{
  objc_setProperty_nonatomic_copy(self, a2, priceRange, 48);
}

- (NSNumber)usesMeteredFare
{
  return self->_usesMeteredFare;
}

- (void)setUsesMeteredFare:(NSNumber *)usesMeteredFare
{
  objc_setProperty_nonatomic_copy(self, a2, usesMeteredFare, 56);
}

- (NSString)disclaimerMessage
{
  return self->_disclaimerMessage;
}

- (void)setDisclaimerMessage:(NSString *)disclaimerMessage
{
  objc_setProperty_nonatomic_copy(self, a2, disclaimerMessage, 64);
}

- (NSString)availablePartySizeOptionsSelectionPrompt
{
  return self->_availablePartySizeOptionsSelectionPrompt;
}

- (void)setAvailablePartySizeOptionsSelectionPrompt:(NSString *)availablePartySizeOptionsSelectionPrompt
{
  objc_setProperty_nonatomic_copy(self, a2, availablePartySizeOptionsSelectionPrompt, 72);
}

- (NSString)specialPricing
{
  return self->_specialPricing;
}

- (void)setSpecialPricing:(NSString *)specialPricing
{
  objc_setProperty_nonatomic_copy(self, a2, specialPricing, 80);
}

- (INImage)specialPricingBadgeImage
{
  return self->_specialPricingBadgeImage;
}

- (void)setSpecialPricingBadgeImage:(INImage *)specialPricingBadgeImage
{
  objc_setProperty_nonatomic_copy(self, a2, specialPricingBadgeImage, 88);
}

- (NSUserActivity)userActivityForBookingInApplication
{
  return self->_userActivityForBookingInApplication;
}

- (void)setUserActivityForBookingInApplication:(NSUserActivity *)userActivityForBookingInApplication
{
  objc_storeStrong((id *)&self->_userActivityForBookingInApplication, userActivityForBookingInApplication);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityForBookingInApplication, 0);
  objc_storeStrong((id *)&self->_specialPricingBadgeImage, 0);
  objc_storeStrong((id *)&self->_specialPricing, 0);
  objc_storeStrong((id *)&self->_availablePartySizeOptionsSelectionPrompt, 0);
  objc_storeStrong((id *)&self->_disclaimerMessage, 0);
  objc_storeStrong((id *)&self->_usesMeteredFare, 0);
  objc_storeStrong((id *)&self->_priceRange, 0);
  objc_storeStrong((id *)&self->_estimatedPickupDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fareLineItems, 0);
  objc_storeStrong((id *)&self->_availablePartySizeOptions, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(NSString *)identifier
{
  NSString *v4;
  NSString *v5;

  v4 = (NSString *)-[NSString copy](identifier, "copy");
  v5 = self->_identifier;
  self->_identifier = v4;

}

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[INRideOption specialPricingBadgeImage](self, "specialPricingBadgeImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INRideOption specialPricingBadgeImage](self, "specialPricingBadgeImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[INRideOption userActivityForBookingInApplication](self, "userActivityForBookingInApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[INRideOption userActivityForBookingInApplication](self, "userActivityForBookingInApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  if (objc_msgSend(v3, "count"))
    v8 = v3;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[INRideOption specialPricingBadgeImage](self, "specialPricingBadgeImage");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[INRideOption specialPricingBadgeImage](self, "specialPricingBadgeImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cacheableObjectForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[INRideOption specialPricingBadgeImage](self, "specialPricingBadgeImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cacheableObjectForIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[INRideOption specialPricingBadgeImage](self, "specialPricingBadgeImage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_imageSize");
        objc_msgSend(v12, "_setImageSize:");

      }
    }
  }

}

@end
