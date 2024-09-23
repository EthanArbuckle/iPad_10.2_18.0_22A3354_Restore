@implementation MSPLowFuelDetails

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSPLowFuelDetails)initWithTitle:(id)a3 subtitle:(id)a4 engineType:(id)a5
{
  id v9;
  id v10;
  id v11;
  MSPLowFuelDetails *v12;
  MSPLowFuelDetails *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MSPLowFuelDetails;
  v12 = -[MSPLowFuelDetails init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_subtitle, a4);
    objc_storeStrong((id *)&v13->_engineType, a5);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *iconData;
  NSData *iconDataCarPlay;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_engineType, CFSTR("engineType"));
  iconData = self->_iconData;
  if (iconData)
    objc_msgSend(v6, "encodeObject:forKey:", iconData, CFSTR("iconData"));
  iconDataCarPlay = self->_iconDataCarPlay;
  if (iconDataCarPlay)
    objc_msgSend(v6, "encodeObject:forKey:", iconDataCarPlay, CFSTR("iconDataCarPlay"));

}

- (MSPLowFuelDetails)initWithCoder:(id)a3
{
  id v4;
  MSPLowFuelDetails *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  NSNumber *engineType;
  uint64_t v12;
  NSData *iconData;
  uint64_t v14;
  NSData *iconDataCarPlay;

  v4 = a3;
  v5 = -[MSPLowFuelDetails init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("engineType"));
    v10 = objc_claimAutoreleasedReturnValue();
    engineType = v5->_engineType;
    v5->_engineType = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconData"));
    v12 = objc_claimAutoreleasedReturnValue();
    iconData = v5->_iconData;
    v5->_iconData = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconDataCarPlay"));
    v14 = objc_claimAutoreleasedReturnValue();
    iconDataCarPlay = v5->_iconDataCarPlay;
    v5->_iconDataCarPlay = (NSData *)v14;

  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)iconData
{
  return self->_iconData;
}

- (void)setIconData:(id)a3
{
  objc_storeStrong((id *)&self->_iconData, a3);
}

- (NSData)iconDataCarPlay
{
  return self->_iconDataCarPlay;
}

- (void)setIconDataCarPlay:(id)a3
{
  objc_storeStrong((id *)&self->_iconDataCarPlay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDataCarPlay, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_engineType, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
