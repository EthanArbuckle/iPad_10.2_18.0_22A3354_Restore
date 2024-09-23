@implementation CPManeuver

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPManeuver)init
{
  CPManeuver *v2;
  uint64_t v3;
  NSUUID *identifier;
  NSArray *instructionVariants;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPManeuver;
  v2 = -[CPManeuver init](&v7, sel_init);
  if (v2)
  {
    +[CPAccNavUpdate resetUpdate:](CPAccNavUpdate, "resetUpdate:", v2);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

    instructionVariants = v2->_instructionVariants;
    v2->_instructionVariants = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v2;
}

- (CPManeuver)initWithCoder:(id)a3
{
  id v4;
  CPManeuver *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIColor *cardBackgroundColor;
  uint64_t v10;
  NSUUID *identifier;
  uint64_t v12;
  CPImageSet *symbolSet;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *attributedInstructionVariants;
  uint64_t v20;
  CPTravelEstimates *initialTravelEstimates;
  uint64_t v22;
  CPImageSet *junctionImageSet;
  uint64_t v24;
  CPImageSet *dashboardSymbolImageSet;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *dashboardInstructionVariants;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSArray *dashboardAttributedInstructionVariants;
  uint64_t v37;
  CPImageSet *dashboardJunctionImageSet;
  uint64_t v39;
  CPImageSet *notificationSymbolImageSet;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSArray *notificationInstructionVariants;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  NSArray *notificationAttributedInstructionVariants;

  v4 = a3;
  v5 = -[CPManeuver init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPManeuverCardBackgroundColorKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      CPSanitizedBackgroundColor(v6);
      v8 = objc_claimAutoreleasedReturnValue();
      cardBackgroundColor = v5->_cardBackgroundColor;
      v5->_cardBackgroundColor = (UIColor *)v8;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPIdentifierKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPManeuverSymbolKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    symbolSet = v5->_symbolSet;
    v5->_symbolSet = (CPImageSet *)v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("kCPManeuverAttributedInstructionVariantsKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    attributedInstructionVariants = v5->_attributedInstructionVariants;
    v5->_attributedInstructionVariants = (NSArray *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPManeuverInitialTravelEstimatesKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    initialTravelEstimates = v5->_initialTravelEstimates;
    v5->_initialTravelEstimates = (CPTravelEstimates *)v20;

    v5->_displayStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCPManeuverStyleKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPManeuverJunctionImageKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    junctionImageSet = v5->_junctionImageSet;
    v5->_junctionImageSet = (CPImageSet *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPManeuverDashboardSymbolKey"));
    v24 = objc_claimAutoreleasedReturnValue();
    dashboardSymbolImageSet = v5->_dashboardSymbolImageSet;
    v5->_dashboardSymbolImageSet = (CPImageSet *)v24;

    v26 = (void *)MEMORY[0x24BDBCF20];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("kCPManeuverDashboardInstructionVariantsKey"));
    v29 = objc_claimAutoreleasedReturnValue();
    dashboardInstructionVariants = v5->_dashboardInstructionVariants;
    v5->_dashboardInstructionVariants = (NSArray *)v29;

    v31 = (void *)MEMORY[0x24BDBCF20];
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("kCPManeuverDashboardAttributedInstructionVariantsKey"));
    v35 = objc_claimAutoreleasedReturnValue();
    dashboardAttributedInstructionVariants = v5->_dashboardAttributedInstructionVariants;
    v5->_dashboardAttributedInstructionVariants = (NSArray *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPManeuverDashboardJunctionImageKey"));
    v37 = objc_claimAutoreleasedReturnValue();
    dashboardJunctionImageSet = v5->_dashboardJunctionImageSet;
    v5->_dashboardJunctionImageSet = (CPImageSet *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPManeuverNotificationSymbolKey"));
    v39 = objc_claimAutoreleasedReturnValue();
    notificationSymbolImageSet = v5->_notificationSymbolImageSet;
    v5->_notificationSymbolImageSet = (CPImageSet *)v39;

    v41 = (void *)MEMORY[0x24BDBCF20];
    v42 = objc_opt_class();
    objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v43, CFSTR("kCPManeuverNotificationInstructionVariantsKey"));
    v44 = objc_claimAutoreleasedReturnValue();
    notificationInstructionVariants = v5->_notificationInstructionVariants;
    v5->_notificationInstructionVariants = (NSArray *)v44;

    v46 = (void *)MEMORY[0x24BDBCF20];
    v47 = objc_opt_class();
    v48 = objc_opt_class();
    objc_msgSend(v46, "setWithObjects:", v47, v48, objc_opt_class(), 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, CFSTR("kCPManeuverNotificationAttributedInstructionVariantsKey"));
    v50 = objc_claimAutoreleasedReturnValue();
    notificationAttributedInstructionVariants = v5->_notificationAttributedInstructionVariants;
    v5->_notificationAttributedInstructionVariants = (NSArray *)v50;

    +[CPAccNavUpdate decodeUpdate:withCoder:](CPAccNavUpdate, "decodeUpdate:withCoder:", v5, v4);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[CPManeuver cardBackgroundColor](self, "cardBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v4, CFSTR("kCPManeuverCardBackgroundColorKey"));

  -[CPManeuver identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v5, CFSTR("kCPIdentifierKey"));

  -[CPManeuver symbolSet](self, "symbolSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v6, CFSTR("kCPManeuverSymbolKey"));

  -[CPManeuver attributedInstructionVariants](self, "attributedInstructionVariants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v7, CFSTR("kCPManeuverAttributedInstructionVariantsKey"));

  -[CPManeuver initialTravelEstimates](self, "initialTravelEstimates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v8, CFSTR("kCPManeuverInitialTravelEstimatesKey"));

  objc_msgSend(v17, "encodeInteger:forKey:", -[CPManeuver displayStyle](self, "displayStyle"), CFSTR("kCPManeuverStyleKey"));
  -[CPManeuver junctionImageSet](self, "junctionImageSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v9, CFSTR("kCPManeuverJunctionImageKey"));

  -[CPManeuver dashboardSymbolImageSet](self, "dashboardSymbolImageSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v10, CFSTR("kCPManeuverDashboardSymbolKey"));

  -[CPManeuver dashboardInstructionVariants](self, "dashboardInstructionVariants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v11, CFSTR("kCPManeuverDashboardInstructionVariantsKey"));

  -[CPManeuver dashboardAttributedInstructionVariants](self, "dashboardAttributedInstructionVariants");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v12, CFSTR("kCPManeuverDashboardAttributedInstructionVariantsKey"));

  -[CPManeuver dashboardJunctionImageSet](self, "dashboardJunctionImageSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v13, CFSTR("kCPManeuverDashboardJunctionImageKey"));

  -[CPManeuver notificationSymbolImageSet](self, "notificationSymbolImageSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v14, CFSTR("kCPManeuverNotificationSymbolKey"));

  -[CPManeuver notificationInstructionVariants](self, "notificationInstructionVariants");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v15, CFSTR("kCPManeuverNotificationInstructionVariantsKey"));

  -[CPManeuver notificationAttributedInstructionVariants](self, "notificationAttributedInstructionVariants");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v16, CFSTR("kCPManeuverNotificationAttributedInstructionVariantsKey"));

  +[CPAccNavUpdate encodeUpdate:withCoder:](CPAccNavUpdate, "encodeUpdate:withCoder:", self, v17);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = +[CPAccNavUpdate copyUpdate:](CPAccNavUpdate, "copyUpdate:", self);
  -[CPManeuver identifier](self, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[2];
  v4[2] = v5;

  -[CPManeuver symbolSet](self, "symbolSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSymbolSet:", v7);

  -[CPManeuver junctionImageSet](self, "junctionImageSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setJunctionImageSet:", v8);

  -[CPManeuver attributedInstructionVariants](self, "attributedInstructionVariants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedInstructionVariants:", v9);

  -[CPManeuver initialTravelEstimates](self, "initialTravelEstimates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInitialTravelEstimates:", v10);

  objc_msgSend(v4, "setDisplayStyle:", -[CPManeuver displayStyle](self, "displayStyle"));
  -[CPManeuver dashboardSymbolImageSet](self, "dashboardSymbolImageSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDashboardSymbolImageSet:", v11);

  -[CPManeuver dashboardInstructionVariants](self, "dashboardInstructionVariants");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDashboardInstructionVariants:", v12);

  -[CPManeuver dashboardAttributedInstructionVariants](self, "dashboardAttributedInstructionVariants");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDashboardAttributedInstructionVariants:", v13);

  -[CPManeuver dashboardJunctionImageSet](self, "dashboardJunctionImageSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDashboardJunctionImageSet:", v14);

  -[CPManeuver notificationSymbolImageSet](self, "notificationSymbolImageSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotificationSymbolImageSet:", v15);

  -[CPManeuver notificationInstructionVariants](self, "notificationInstructionVariants");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotificationInstructionVariants:", v16);

  -[CPManeuver notificationAttributedInstructionVariants](self, "notificationAttributedInstructionVariants");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotificationAttributedInstructionVariants:", v17);

  -[CPManeuver cardBackgroundColor](self, "cardBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCardBackgroundColor:", v18);

  return v4;
}

- (NSArray)stringInstructionVariants
{
  void *v3;
  void *v4;
  void *v5;

  -[CPManeuver attributedInstructionVariants](self, "attributedInstructionVariants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CPManeuver attributedInstructionVariants](self, "attributedInstructionVariants");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cps_map:", &__block_literal_global_9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CPManeuver instructionVariants](self, "instructionVariants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v5;
}

uint64_t __39__CPManeuver_stringInstructionVariants__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "string");
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  CPTravelEstimates *initialTravelEstimates;
  NSArray *roadFollowingManeuverVariants;
  NSArray *instructionVariants;
  void *v8;
  void *v9;
  NSSet *junctionElementAngles;
  NSMeasurement *junctionExitAngle;
  void *v12;
  void *v13;
  NSArray *attributedInstructionVariants;
  CPImageSet *junctionImageSet;
  CPImageSet *symbolSet;
  NSUUID *identifier;
  void *v19;
  void *v20;
  objc_super v21;

  v20 = (void *)MEMORY[0x24BDD17C8];
  v21.receiver = self;
  v21.super_class = (Class)CPManeuver;
  -[CPManeuver description](&v21, sel_description);
  v3 = objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  v19 = (void *)v3;
  objc_msgSend((id)objc_opt_class(), "_descriptionForManeuverType:", self->_maneuverType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  symbolSet = self->_symbolSet;
  initialTravelEstimates = self->_initialTravelEstimates;
  attributedInstructionVariants = self->_attributedInstructionVariants;
  junctionImageSet = self->_junctionImageSet;
  roadFollowingManeuverVariants = self->_roadFollowingManeuverVariants;
  instructionVariants = self->_instructionVariants;
  objc_msgSend((id)objc_opt_class(), "_descriptionForTrafficSide:", self->_trafficSide);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_descriptionForJunctionType:", self->_junctionType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  junctionExitAngle = self->_junctionExitAngle;
  junctionElementAngles = self->_junctionElementAngles;
  +[CPAccNavUpdate description:](CPAccNavUpdate, "description:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ {identifier: %@, maneuverType: %@, symbol: %@, junction image: %@, instructionVariants: %@, attributedInstructionVariants: %@, roadFollowingManeuverVariants:%@, initialTravelEstimates: %@, trafficSide: %@, junctionType: %@, junctionExitAngle: %@, junctionElementAngles: %@, cardBackgroundColor: %@}\n{\n%@\n}"), v19, identifier, v4, symbolSet, junctionImageSet, instructionVariants, attributedInstructionVariants, roadFollowingManeuverVariants, initialTravelEstimates, v8, v9, junctionExitAngle, junctionElementAngles, v12, self->_cardBackgroundColor);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

+ (id)_descriptionForManeuverType:(unint64_t)a3
{
  if (a3 > 4)
    return 0;
  else
    return off_24C77D690[a3];
}

+ (id)_descriptionForTrafficSide:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("right");
  if (a3)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("left");
  else
    return (id)v3;
}

+ (id)_descriptionForJunctionType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("intersection");
  if (a3)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("roundabout");
  else
    return (id)v3;
}

- (void)setCardBackgroundColor:(UIColor *)cardBackgroundColor
{
  UIColor *v4;
  UIColor *v5;

  if (self->_cardBackgroundColor != cardBackgroundColor)
  {
    CPSanitizedBackgroundColor(cardBackgroundColor);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cardBackgroundColor;
    self->_cardBackgroundColor = v4;

  }
}

- (void)setSymbolSet:(CPImageSet *)symbolSet
{
  CPImageSet *v4;
  CPImageSet *v5;

  v4 = symbolSet;
  -[CPImageSet swapStyles](v4, "swapStyles");
  v5 = self->_symbolSet;
  self->_symbolSet = v4;

}

- (void)setSymbolImage:(UIImage *)symbolImage
{
  CPImageSet *v4;
  CPImageSet *symbolSet;
  UIImage *v6;

  v6 = symbolImage;
  if (v6)
  {
    v4 = -[CPImageSet initWithImage:]([CPImageSet alloc], "initWithImage:", v6);
    symbolSet = self->_symbolSet;
    self->_symbolSet = v4;
  }
  else
  {
    symbolSet = self->_symbolSet;
    self->_symbolSet = 0;
  }

}

- (UIImage)symbolImage
{
  void *v2;
  void *v3;

  -[CPManeuver symbolSet](self, "symbolSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setJunctionImage:(UIImage *)junctionImage
{
  CPImageSet *v4;
  CPImageSet *junctionImageSet;
  UIImage *v6;

  v6 = junctionImage;
  if (v6)
  {
    v4 = -[CPImageSet initWithImage:]([CPImageSet alloc], "initWithImage:", v6);
    junctionImageSet = self->_junctionImageSet;
    self->_junctionImageSet = v4;
  }
  else
  {
    junctionImageSet = self->_junctionImageSet;
    self->_junctionImageSet = 0;
  }

}

- (UIImage)junctionImage
{
  void *v2;
  void *v3;

  -[CPManeuver junctionImageSet](self, "junctionImageSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UIImage)dashboardSymbolImage
{
  void *v2;
  void *v3;

  -[CPManeuver dashboardSymbolImageSet](self, "dashboardSymbolImageSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setDashboardSymbolImage:(UIImage *)dashboardSymbolImage
{
  CPImageSet *v4;
  CPImageSet *dashboardSymbolImageSet;
  UIImage *v6;

  v6 = dashboardSymbolImage;
  if (v6)
  {
    v4 = -[CPImageSet initWithImage:]([CPImageSet alloc], "initWithImage:", v6);
    dashboardSymbolImageSet = self->_dashboardSymbolImageSet;
    self->_dashboardSymbolImageSet = v4;
  }
  else
  {
    dashboardSymbolImageSet = self->_dashboardSymbolImageSet;
    self->_dashboardSymbolImageSet = 0;
  }

}

- (UIImage)dashboardJunctionImage
{
  void *v2;
  void *v3;

  -[CPManeuver dashboardJunctionImageSet](self, "dashboardJunctionImageSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setDashboardJunctionImage:(UIImage *)dashboardJunctionImage
{
  CPImageSet *v4;
  CPImageSet *dashboardJunctionImageSet;
  UIImage *v6;

  v6 = dashboardJunctionImage;
  if (v6)
  {
    v4 = -[CPImageSet initWithImage:]([CPImageSet alloc], "initWithImage:", v6);
    dashboardJunctionImageSet = self->_dashboardJunctionImageSet;
    self->_dashboardJunctionImageSet = v4;
  }
  else
  {
    dashboardJunctionImageSet = self->_dashboardJunctionImageSet;
    self->_dashboardJunctionImageSet = 0;
  }

}

- (UIImage)notificationSymbolImage
{
  void *v2;
  void *v3;

  -[CPManeuver notificationSymbolImageSet](self, "notificationSymbolImageSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setNotificationSymbolImage:(UIImage *)notificationSymbolImage
{
  CPImageSet *v4;
  CPImageSet *notificationSymbolImageSet;
  UIImage *v6;

  v6 = notificationSymbolImage;
  if (v6)
  {
    v4 = -[CPImageSet initWithImage:]([CPImageSet alloc], "initWithImage:", v6);
    notificationSymbolImageSet = self->_notificationSymbolImageSet;
    self->_notificationSymbolImageSet = v4;
  }
  else
  {
    notificationSymbolImageSet = self->_notificationSymbolImageSet;
    self->_notificationSymbolImageSet = 0;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CPManeuver *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  v5 = (CPManeuver *)v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v5 == self)
    {
      v10 = 1;
    }
    else if (v5)
    {
      -[CPManeuver junctionImage](self, "junctionImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[CPManeuver junctionImage](v5, "junctionImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[CPManeuver identifier](v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPManeuver identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9)
         && (v6 == 0) != (v7 != 0)
         && +[CPAccNavUpdate isUpdate:equalTo:](CPAccNavUpdate, "isUpdate:equalTo:", self, v5);

      self = v5;
    }
    else
    {
      self = 0;
      v10 = 0;
    }
  }
  else
  {

    v11 = self == 0;
    self = 0;
    v10 = v11;
  }

  return v10;
}

- (void)setLinkedLaneGuidance:(id)a3
{
  self->_linkedLaneGuidance = (CPLaneGuidance *)a3;
  self->_linkedLaneGuidanceIndex = objc_msgSend(a3, "index");
}

- (void)setLinkedLaneGuidanceIndex:(unsigned __int16)a3
{
  self->_linkedLaneGuidance = 0;
  self->_linkedLaneGuidanceIndex = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (CPImageSet)symbolSet
{
  return self->_symbolSet;
}

- (UIColor)cardBackgroundColor
{
  return self->_cardBackgroundColor;
}

- (NSArray)instructionVariants
{
  return self->_instructionVariants;
}

- (void)setInstructionVariants:(NSArray *)instructionVariants
{
  objc_setProperty_nonatomic_copy(self, a2, instructionVariants, 40);
}

- (CPTravelEstimates)initialTravelEstimates
{
  return self->_initialTravelEstimates;
}

- (void)setInitialTravelEstimates:(CPTravelEstimates *)initialTravelEstimates
{
  objc_storeStrong((id *)&self->_initialTravelEstimates, initialTravelEstimates);
}

- (NSArray)attributedInstructionVariants
{
  return self->_attributedInstructionVariants;
}

- (void)setAttributedInstructionVariants:(NSArray *)attributedInstructionVariants
{
  objc_setProperty_nonatomic_copy(self, a2, attributedInstructionVariants, 56);
}

- (NSArray)dashboardInstructionVariants
{
  return self->_dashboardInstructionVariants;
}

- (void)setDashboardInstructionVariants:(NSArray *)dashboardInstructionVariants
{
  objc_setProperty_nonatomic_copy(self, a2, dashboardInstructionVariants, 64);
}

- (NSArray)dashboardAttributedInstructionVariants
{
  return self->_dashboardAttributedInstructionVariants;
}

- (void)setDashboardAttributedInstructionVariants:(NSArray *)dashboardAttributedInstructionVariants
{
  objc_setProperty_nonatomic_copy(self, a2, dashboardAttributedInstructionVariants, 72);
}

- (NSArray)notificationInstructionVariants
{
  return self->_notificationInstructionVariants;
}

- (void)setNotificationInstructionVariants:(NSArray *)notificationInstructionVariants
{
  objc_setProperty_nonatomic_copy(self, a2, notificationInstructionVariants, 80);
}

- (NSArray)notificationAttributedInstructionVariants
{
  return self->_notificationAttributedInstructionVariants;
}

- (void)setNotificationAttributedInstructionVariants:(NSArray *)notificationAttributedInstructionVariants
{
  objc_setProperty_nonatomic_copy(self, a2, notificationAttributedInstructionVariants, 88);
}

- (unint64_t)maneuverType
{
  return self->_maneuverType;
}

- (void)setManeuverType:(unint64_t)a3
{
  self->_maneuverType = a3;
}

- (NSArray)roadFollowingManeuverVariants
{
  return self->_roadFollowingManeuverVariants;
}

- (void)setRoadFollowingManeuverVariants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)trafficSide
{
  return self->_trafficSide;
}

- (void)setTrafficSide:(unint64_t)a3
{
  self->_trafficSide = a3;
}

- (unint64_t)junctionType
{
  return self->_junctionType;
}

- (void)setJunctionType:(unint64_t)a3
{
  self->_junctionType = a3;
}

- (NSMeasurement)junctionExitAngle
{
  return self->_junctionExitAngle;
}

- (void)setJunctionExitAngle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSSet)junctionElementAngles
{
  return self->_junctionElementAngles;
}

- (void)setJunctionElementAngles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (CPLaneGuidance)linkedLaneGuidance
{
  return self->_linkedLaneGuidance;
}

- (NSString)highwayExitLabel
{
  return self->_highwayExitLabel;
}

- (void)setHighwayExitLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)userInfo
{
  objc_storeStrong(&self->_userInfo, userInfo);
}

- (void)setStringInstructionVariants:(id)a3
{
  objc_storeStrong((id *)&self->_stringInstructionVariants, a3);
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(int64_t)a3
{
  self->_displayStyle = a3;
}

- (CPImageSet)junctionImageSet
{
  return self->_junctionImageSet;
}

- (void)setJunctionImageSet:(id)a3
{
  objc_storeStrong((id *)&self->_junctionImageSet, a3);
}

- (CPImageSet)dashboardSymbolImageSet
{
  return self->_dashboardSymbolImageSet;
}

- (void)setDashboardSymbolImageSet:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardSymbolImageSet, a3);
}

- (CPImageSet)dashboardJunctionImageSet
{
  return self->_dashboardJunctionImageSet;
}

- (void)setDashboardJunctionImageSet:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardJunctionImageSet, a3);
}

- (CPImageSet)notificationSymbolImageSet
{
  return self->_notificationSymbolImageSet;
}

- (void)setNotificationSymbolImageSet:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSymbolImageSet, a3);
}

- (unsigned)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(unsigned __int16)a3
{
  self->_componentID = a3;
}

- (unsigned)linkedLaneGuidanceIndex
{
  return self->_linkedLaneGuidanceIndex;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned __int16)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSymbolImageSet, 0);
  objc_storeStrong((id *)&self->_dashboardJunctionImageSet, 0);
  objc_storeStrong((id *)&self->_dashboardSymbolImageSet, 0);
  objc_storeStrong((id *)&self->_junctionImageSet, 0);
  objc_storeStrong((id *)&self->_stringInstructionVariants, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_highwayExitLabel, 0);
  objc_storeStrong((id *)&self->_junctionElementAngles, 0);
  objc_storeStrong((id *)&self->_junctionExitAngle, 0);
  objc_storeStrong((id *)&self->_roadFollowingManeuverVariants, 0);
  objc_storeStrong((id *)&self->_notificationAttributedInstructionVariants, 0);
  objc_storeStrong((id *)&self->_notificationInstructionVariants, 0);
  objc_storeStrong((id *)&self->_dashboardAttributedInstructionVariants, 0);
  objc_storeStrong((id *)&self->_dashboardInstructionVariants, 0);
  objc_storeStrong((id *)&self->_attributedInstructionVariants, 0);
  objc_storeStrong((id *)&self->_initialTravelEstimates, 0);
  objc_storeStrong((id *)&self->_instructionVariants, 0);
  objc_storeStrong((id *)&self->_cardBackgroundColor, 0);
  objc_storeStrong((id *)&self->_symbolSet, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSMeasurement)initialDistance
{
  void *v2;
  void *v3;

  -[CPManeuver initialTravelEstimates](self, "initialTravelEstimates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distanceRemaining");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v3;
}

- (void)setInitialDistance:(id)a3
{
  id v4;
  CPTravelEstimates *v5;
  void *v6;
  void *v7;
  void *v8;
  CPTravelEstimates *v9;

  v4 = a3;
  v5 = [CPTravelEstimates alloc];
  -[CPManeuver initialTravelEstimates](self, "initialTravelEstimates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "distanceRemainingToDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPManeuver initialTravelEstimates](self, "initialTravelEstimates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeRemaining");
  v9 = -[CPTravelEstimates initWithDistanceRemaining:distanceRemainingToDisplay:timeRemaining:](v5, "initWithDistanceRemaining:distanceRemainingToDisplay:timeRemaining:", v4, v7);

  -[CPManeuver setInitialTravelEstimates:](self, "setInitialTravelEstimates:", v9);
}

- (NSMeasurement)initialDistanceDisplay
{
  void *v2;
  void *v3;

  -[CPManeuver initialTravelEstimates](self, "initialTravelEstimates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distanceRemainingToDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v3;
}

- (void)setInitialDistanceDisplay:(id)a3
{
  id v4;
  CPTravelEstimates *v5;
  void *v6;
  void *v7;
  void *v8;
  CPTravelEstimates *v9;

  v4 = a3;
  v5 = [CPTravelEstimates alloc];
  -[CPManeuver initialTravelEstimates](self, "initialTravelEstimates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "distanceRemaining");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPManeuver initialTravelEstimates](self, "initialTravelEstimates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeRemaining");
  v9 = -[CPTravelEstimates initWithDistanceRemaining:distanceRemainingToDisplay:timeRemaining:](v5, "initWithDistanceRemaining:distanceRemainingToDisplay:timeRemaining:", v7, v4);

  -[CPManeuver setInitialTravelEstimates:](self, "setInitialTravelEstimates:", v9);
}

+ (NSArray)accNavParameters
{
  if (accNavParameters_onceToken != -1)
    dispatch_once(&accNavParameters_onceToken, &__block_literal_global_261);
  return (NSArray *)(id)accNavParameters__accNavParameters;
}

void __46__CPManeuver_CPAccNavUpdate__accNavParameters__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _QWORD v81[2];
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  _QWORD v88[15];

  v88[13] = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(sel_componentID);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)objc_msgSend(v74, "copySettingIsIntegerValue:", 1);
  v87 = v73;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v87, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v72, v71);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v70;
  NSStringFromSelector(sel_index);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v69, "copySettingIsIntegerValue:", 1);
  v86 = v68;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v86, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v67, v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v65;
  NSStringFromSelector(sel_instructionVariants);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend(v64, "copySettingHasVariants:", 1);
  v85 = v63;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v62, v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend(v60, "copySettingCollectionGeneric:", objc_opt_class());
  v88[2] = v59;
  NSStringFromSelector(sel_maneuverType);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v58, "copySettingEnumType:", 1);
  v84 = v57;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v84, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v56, v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v88[3] = v54;
  NSStringFromSelector(sel_roadFollowingManeuverVariants);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 4);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v53, "copySettingHasVariants:", 1);
  v83 = v52;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v83, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v51, v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v49, "copySettingCollectionGeneric:", objc_opt_class());
  v88[4] = v48;
  NSStringFromSelector(sel_initialDistance);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1928], "meters");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v47, "copySettingDimension:", v46);
  v82 = v45;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v82, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v44, v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v42, "copySettingEncodeable:", 0);
  v88[5] = v41;
  NSStringFromSelector(sel_initialDistanceDisplay);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 6);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v40;
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 7);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v39, "copySettingEnumType:", 5);
  v81[1] = v38;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v37, v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v35, "copySettingEncodeable:", 0);
  v88[6] = v34;
  NSStringFromSelector(sel_trafficSide);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v33, "copySettingEnumType:", 3);
  v80 = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v80, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v31, v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v88[7] = v29;
  NSStringFromSelector(sel_junctionType);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v28, "copySettingEnumType:", 2);
  v79 = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v79, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v26, v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v88[8] = v24;
  NSStringFromSelector(sel_junctionElementAngles);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD18B0], "degrees");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v23, "copySettingDimension:", v22);
  v78 = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v78, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v21, v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v18, "copySettingCollectionGeneric:", objc_opt_class());
  v88[9] = v17;
  NSStringFromSelector(sel_junctionExitAngle);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD18B0], "degrees");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v16, "copySettingDimension:", v15);
  v77 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v13, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v88[10] = v11;
  NSStringFromSelector(sel_linkedLaneGuidanceIndex);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 12);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copySettingIsIntegerValue:", 1);
  v76 = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v76, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v88[11] = v4;
  NSStringFromSelector(sel_highwayExitLabel);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v75, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v88[12] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 13);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)accNavParameters__accNavParameters;
  accNavParameters__accNavParameters = v9;

}

+ (NSDictionary)accNavParametersIndexed
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__CPManeuver_CPAccNavUpdate__accNavParametersIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParametersIndexed_onceToken != -1)
    dispatch_once(&accNavParametersIndexed_onceToken, block);
  return (NSDictionary *)(id)accNavParametersIndexed__accNavParametersIndexed;
}

void __53__CPManeuver_CPAccNavUpdate__accNavParametersIndexed__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[CPAccNavUpdate accNavParametersIndexedForUpdate:](CPAccNavUpdate, "accNavParametersIndexedForUpdate:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)accNavParametersIndexed__accNavParametersIndexed;
  accNavParametersIndexed__accNavParametersIndexed = v1;

}

+ (NSDictionary)accNavParameterKeysIndexed
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CPManeuver_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParameterKeysIndexed_onceToken != -1)
    dispatch_once(&accNavParameterKeysIndexed_onceToken, block);
  return (NSDictionary *)(id)accNavParameterKeysIndexed__accNavParameterKeysIndexed;
}

void __56__CPManeuver_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[CPAccNavUpdate accNavParameterKeysIndexedForUpdate:](CPAccNavUpdate, "accNavParameterKeysIndexedForUpdate:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)accNavParameterKeysIndexed__accNavParameterKeysIndexed;
  accNavParameterKeysIndexed__accNavParameterKeysIndexed = v1;

}

- (void)clearValueForKey:(id)a3
{
  +[CPAccNavUpdate update:resetValueForProperty:](CPAccNavUpdate, "update:resetValueForProperty:", self, a3);
}

- (CPManeuver)maneuverWithComponent:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x24BE00BC8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "component");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithManeuver:component:", self, v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE152A8]), "initWithComponent:accNavInfo:", v5, v8);
  return (CPManeuver *)v9;
}

@end
