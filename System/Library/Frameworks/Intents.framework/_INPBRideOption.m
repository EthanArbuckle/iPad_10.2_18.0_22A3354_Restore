@implementation _INPBRideOption

- (void)setAvailablePartySizeOptions:(id)a3
{
  NSArray *v4;
  NSArray *availablePartySizeOptions;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  availablePartySizeOptions = self->_availablePartySizeOptions;
  self->_availablePartySizeOptions = v4;

}

- (void)clearAvailablePartySizeOptions
{
  -[NSArray removeAllObjects](self->_availablePartySizeOptions, "removeAllObjects");
}

- (void)addAvailablePartySizeOptions:(id)a3
{
  id v4;
  NSArray *availablePartySizeOptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  availablePartySizeOptions = self->_availablePartySizeOptions;
  v8 = v4;
  if (!availablePartySizeOptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_availablePartySizeOptions;
    self->_availablePartySizeOptions = v6;

    v4 = v8;
    availablePartySizeOptions = self->_availablePartySizeOptions;
  }
  -[NSArray addObject:](availablePartySizeOptions, "addObject:", v4);

}

- (unint64_t)availablePartySizeOptionsCount
{
  return -[NSArray count](self->_availablePartySizeOptions, "count");
}

- (id)availablePartySizeOptionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_availablePartySizeOptions, "objectAtIndexedSubscript:", a3);
}

- (void)setAvailablePartySizeOptionsSelectionPrompt:(id)a3
{
  NSString *v4;
  NSString *availablePartySizeOptionsSelectionPrompt;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  availablePartySizeOptionsSelectionPrompt = self->_availablePartySizeOptionsSelectionPrompt;
  self->_availablePartySizeOptionsSelectionPrompt = v4;

}

- (BOOL)hasAvailablePartySizeOptionsSelectionPrompt
{
  return self->_availablePartySizeOptionsSelectionPrompt != 0;
}

- (void)setDisclaimerMessage:(id)a3
{
  NSString *v4;
  NSString *disclaimerMessage;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  disclaimerMessage = self->_disclaimerMessage;
  self->_disclaimerMessage = v4;

}

- (BOOL)hasDisclaimerMessage
{
  return self->_disclaimerMessage != 0;
}

- (void)setEstimatedPickupDate:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedPickupDate, a3);
}

- (BOOL)hasEstimatedPickupDate
{
  return self->_estimatedPickupDate != 0;
}

- (void)setFareLineItems:(id)a3
{
  NSArray *v4;
  NSArray *fareLineItems;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  fareLineItems = self->_fareLineItems;
  self->_fareLineItems = v4;

}

- (void)clearFareLineItems
{
  -[NSArray removeAllObjects](self->_fareLineItems, "removeAllObjects");
}

- (void)addFareLineItems:(id)a3
{
  id v4;
  NSArray *fareLineItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  fareLineItems = self->_fareLineItems;
  v8 = v4;
  if (!fareLineItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_fareLineItems;
    self->_fareLineItems = v6;

    v4 = v8;
    fareLineItems = self->_fareLineItems;
  }
  -[NSArray addObject:](fareLineItems, "addObject:", v4);

}

- (unint64_t)fareLineItemsCount
{
  return -[NSArray count](self->_fareLineItems, "count");
}

- (id)fareLineItemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_fareLineItems, "objectAtIndexedSubscript:", a3);
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setPriceRange:(id)a3
{
  objc_storeStrong((id *)&self->_priceRange, a3);
}

- (BOOL)hasPriceRange
{
  return self->_priceRange != 0;
}

- (void)setSpecialPricing:(id)a3
{
  NSString *v4;
  NSString *specialPricing;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  specialPricing = self->_specialPricing;
  self->_specialPricing = v4;

}

- (BOOL)hasSpecialPricing
{
  return self->_specialPricing != 0;
}

- (void)setSpecialPricingBadgeImage:(id)a3
{
  objc_storeStrong((id *)&self->_specialPricingBadgeImage, a3);
}

- (BOOL)hasSpecialPricingBadgeImage
{
  return self->_specialPricingBadgeImage != 0;
}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  NSString *subtitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subtitle = self->_subtitle;
  self->_subtitle = v4;

}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (void)setUserActivityForBookingInApplication:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityForBookingInApplication, a3);
}

- (BOOL)hasUserActivityForBookingInApplication
{
  return self->_userActivityForBookingInApplication != 0;
}

- (void)setUsesMeteredFare:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_usesMeteredFare = a3;
}

- (BOOL)hasUsesMeteredFare
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasUsesMeteredFare:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRideOptionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = self->_availablePartySizeOptions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v7);
  }

  -[_INPBRideOption availablePartySizeOptionsSelectionPrompt](self, "availablePartySizeOptionsSelectionPrompt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[_INPBRideOption disclaimerMessage](self, "disclaimerMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  -[_INPBRideOption estimatedPickupDate](self, "estimatedPickupDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBRideOption estimatedPickupDate](self, "estimatedPickupDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = self->_fareLineItems;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v16);
  }

  -[_INPBRideOption name](self, "name", v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    PBDataWriterWriteStringField();
  -[_INPBRideOption priceRange](self, "priceRange");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[_INPBRideOption priceRange](self, "priceRange");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRideOption specialPricing](self, "specialPricing");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    PBDataWriterWriteStringField();
  -[_INPBRideOption specialPricingBadgeImage](self, "specialPricingBadgeImage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[_INPBRideOption specialPricingBadgeImage](self, "specialPricingBadgeImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRideOption subtitle](self, "subtitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    PBDataWriterWriteStringField();
  -[_INPBRideOption userActivityForBookingInApplication](self, "userActivityForBookingInApplication");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[_INPBRideOption userActivityForBookingInApplication](self, "userActivityForBookingInApplication");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBRideOption hasUsesMeteredFare](self, "hasUsesMeteredFare"))
    PBDataWriterWriteBOOLField();

}

- (_INPBRideOption)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRideOption *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRideOption *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRideOption *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRideOption initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBRideOption data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRideOption *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v5 = -[_INPBRideOption init](+[_INPBRideOption allocWithZone:](_INPBRideOption, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_availablePartySizeOptions, "copyWithZone:", a3);
  -[_INPBRideOption setAvailablePartySizeOptions:](v5, "setAvailablePartySizeOptions:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_availablePartySizeOptionsSelectionPrompt, "copyWithZone:", a3);
  -[_INPBRideOption setAvailablePartySizeOptionsSelectionPrompt:](v5, "setAvailablePartySizeOptionsSelectionPrompt:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_disclaimerMessage, "copyWithZone:", a3);
  -[_INPBRideOption setDisclaimerMessage:](v5, "setDisclaimerMessage:", v8);

  v9 = -[_INPBTimestamp copyWithZone:](self->_estimatedPickupDate, "copyWithZone:", a3);
  -[_INPBRideOption setEstimatedPickupDate:](v5, "setEstimatedPickupDate:", v9);

  v10 = (void *)-[NSArray copyWithZone:](self->_fareLineItems, "copyWithZone:", a3);
  -[_INPBRideOption setFareLineItems:](v5, "setFareLineItems:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  -[_INPBRideOption setName:](v5, "setName:", v11);

  v12 = -[_INPBPriceRangeValue copyWithZone:](self->_priceRange, "copyWithZone:", a3);
  -[_INPBRideOption setPriceRange:](v5, "setPriceRange:", v12);

  v13 = (void *)-[NSString copyWithZone:](self->_specialPricing, "copyWithZone:", a3);
  -[_INPBRideOption setSpecialPricing:](v5, "setSpecialPricing:", v13);

  v14 = -[_INPBImageValue copyWithZone:](self->_specialPricingBadgeImage, "copyWithZone:", a3);
  -[_INPBRideOption setSpecialPricingBadgeImage:](v5, "setSpecialPricingBadgeImage:", v14);

  v15 = (void *)-[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  -[_INPBRideOption setSubtitle:](v5, "setSubtitle:", v15);

  v16 = -[_INPBUserActivity copyWithZone:](self->_userActivityForBookingInApplication, "copyWithZone:", a3);
  -[_INPBRideOption setUserActivityForBookingInApplication:](v5, "setUserActivityForBookingInApplication:", v16);

  if (-[_INPBRideOption hasUsesMeteredFare](self, "hasUsesMeteredFare"))
    -[_INPBRideOption setUsesMeteredFare:](v5, "setUsesMeteredFare:", -[_INPBRideOption usesMeteredFare](self, "usesMeteredFare"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  BOOL v62;
  int v64;
  int usesMeteredFare;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_57;
  -[_INPBRideOption availablePartySizeOptions](self, "availablePartySizeOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availablePartySizeOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_INPBRideOption availablePartySizeOptions](self, "availablePartySizeOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBRideOption availablePartySizeOptions](self, "availablePartySizeOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "availablePartySizeOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_57;
  }
  else
  {

  }
  -[_INPBRideOption availablePartySizeOptionsSelectionPrompt](self, "availablePartySizeOptionsSelectionPrompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availablePartySizeOptionsSelectionPrompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_INPBRideOption availablePartySizeOptionsSelectionPrompt](self, "availablePartySizeOptionsSelectionPrompt");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBRideOption availablePartySizeOptionsSelectionPrompt](self, "availablePartySizeOptionsSelectionPrompt");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "availablePartySizeOptionsSelectionPrompt");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_57;
  }
  else
  {

  }
  -[_INPBRideOption disclaimerMessage](self, "disclaimerMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disclaimerMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_INPBRideOption disclaimerMessage](self, "disclaimerMessage");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBRideOption disclaimerMessage](self, "disclaimerMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disclaimerMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_57;
  }
  else
  {

  }
  -[_INPBRideOption estimatedPickupDate](self, "estimatedPickupDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "estimatedPickupDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_INPBRideOption estimatedPickupDate](self, "estimatedPickupDate");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBRideOption estimatedPickupDate](self, "estimatedPickupDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "estimatedPickupDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_57;
  }
  else
  {

  }
  -[_INPBRideOption fareLineItems](self, "fareLineItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fareLineItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_INPBRideOption fareLineItems](self, "fareLineItems");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBRideOption fareLineItems](self, "fareLineItems");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fareLineItems");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_57;
  }
  else
  {

  }
  -[_INPBRideOption name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_INPBRideOption name](self, "name");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBRideOption name](self, "name");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_57;
  }
  else
  {

  }
  -[_INPBRideOption priceRange](self, "priceRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "priceRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_INPBRideOption priceRange](self, "priceRange");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_INPBRideOption priceRange](self, "priceRange");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "priceRange");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_57;
  }
  else
  {

  }
  -[_INPBRideOption specialPricing](self, "specialPricing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specialPricing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_INPBRideOption specialPricing](self, "specialPricing");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_INPBRideOption specialPricing](self, "specialPricing");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "specialPricing");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_57;
  }
  else
  {

  }
  -[_INPBRideOption specialPricingBadgeImage](self, "specialPricingBadgeImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specialPricingBadgeImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_INPBRideOption specialPricingBadgeImage](self, "specialPricingBadgeImage");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_INPBRideOption specialPricingBadgeImage](self, "specialPricingBadgeImage");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "specialPricingBadgeImage");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_57;
  }
  else
  {

  }
  -[_INPBRideOption subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_INPBRideOption subtitle](self, "subtitle");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_INPBRideOption subtitle](self, "subtitle");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subtitle");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_57;
  }
  else
  {

  }
  -[_INPBRideOption userActivityForBookingInApplication](self, "userActivityForBookingInApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userActivityForBookingInApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_56:

    goto LABEL_57;
  }
  -[_INPBRideOption userActivityForBookingInApplication](self, "userActivityForBookingInApplication");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[_INPBRideOption userActivityForBookingInApplication](self, "userActivityForBookingInApplication");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userActivityForBookingInApplication");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_57;
  }
  else
  {

  }
  v64 = -[_INPBRideOption hasUsesMeteredFare](self, "hasUsesMeteredFare");
  if (v64 == objc_msgSend(v4, "hasUsesMeteredFare"))
  {
    if (!-[_INPBRideOption hasUsesMeteredFare](self, "hasUsesMeteredFare")
      || !objc_msgSend(v4, "hasUsesMeteredFare")
      || (usesMeteredFare = self->_usesMeteredFare, usesMeteredFare == objc_msgSend(v4, "usesMeteredFare")))
    {
      v62 = 1;
      goto LABEL_58;
    }
  }
LABEL_57:
  v62 = 0;
LABEL_58:

  return v62;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  NSUInteger v10;
  unint64_t v11;
  uint64_t v12;
  NSUInteger v14;
  uint64_t v15;

  v15 = -[NSArray hash](self->_availablePartySizeOptions, "hash");
  v14 = -[NSString hash](self->_availablePartySizeOptionsSelectionPrompt, "hash");
  v3 = -[NSString hash](self->_disclaimerMessage, "hash");
  v4 = -[_INPBTimestamp hash](self->_estimatedPickupDate, "hash");
  v5 = -[NSArray hash](self->_fareLineItems, "hash");
  v6 = -[NSString hash](self->_name, "hash");
  v7 = -[_INPBPriceRangeValue hash](self->_priceRange, "hash");
  v8 = -[NSString hash](self->_specialPricing, "hash");
  v9 = -[_INPBImageValue hash](self->_specialPricingBadgeImage, "hash");
  v10 = -[NSString hash](self->_subtitle, "hash");
  v11 = -[_INPBUserActivity hash](self->_userActivityForBookingInApplication, "hash");
  if (-[_INPBRideOption hasUsesMeteredFare](self, "hasUsesMeteredFare"))
    v12 = 2654435761 * self->_usesMeteredFare;
  else
    v12 = 0;
  return v14 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
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
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_availablePartySizeOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v5 = self->_availablePartySizeOptions;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v43;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v43 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("availablePartySizeOptions"));
  }
  if (self->_availablePartySizeOptionsSelectionPrompt)
  {
    -[_INPBRideOption availablePartySizeOptionsSelectionPrompt](self, "availablePartySizeOptionsSelectionPrompt");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("availablePartySizeOptionsSelectionPrompt"));

  }
  if (self->_disclaimerMessage)
  {
    -[_INPBRideOption disclaimerMessage](self, "disclaimerMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("disclaimerMessage"));

  }
  -[_INPBRideOption estimatedPickupDate](self, "estimatedPickupDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("estimatedPickupDate"));

  if (-[NSArray count](self->_fareLineItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v18 = self->_fareLineItems;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v39;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v39 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v22), "dictionaryRepresentation", (_QWORD)v38);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v20);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("fareLineItems"));
  }
  if (self->_name)
  {
    -[_INPBRideOption name](self, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("name"));

  }
  -[_INPBRideOption priceRange](self, "priceRange", (_QWORD)v38);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryRepresentation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("priceRange"));

  if (self->_specialPricing)
  {
    -[_INPBRideOption specialPricing](self, "specialPricing");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("specialPricing"));

  }
  -[_INPBRideOption specialPricingBadgeImage](self, "specialPricingBadgeImage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dictionaryRepresentation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("specialPricingBadgeImage"));

  if (self->_subtitle)
  {
    -[_INPBRideOption subtitle](self, "subtitle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("subtitle"));

  }
  -[_INPBRideOption userActivityForBookingInApplication](self, "userActivityForBookingInApplication");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "dictionaryRepresentation");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("userActivityForBookingInApplication"));

  if (-[_INPBRideOption hasUsesMeteredFare](self, "hasUsesMeteredFare"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBRideOption usesMeteredFare](self, "usesMeteredFare"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("usesMeteredFare"));

  }
  return v3;
}

- (NSArray)availablePartySizeOptions
{
  return self->_availablePartySizeOptions;
}

- (NSString)availablePartySizeOptionsSelectionPrompt
{
  return self->_availablePartySizeOptionsSelectionPrompt;
}

- (NSString)disclaimerMessage
{
  return self->_disclaimerMessage;
}

- (_INPBTimestamp)estimatedPickupDate
{
  return self->_estimatedPickupDate;
}

- (NSArray)fareLineItems
{
  return self->_fareLineItems;
}

- (NSString)name
{
  return self->_name;
}

- (_INPBPriceRangeValue)priceRange
{
  return self->_priceRange;
}

- (NSString)specialPricing
{
  return self->_specialPricing;
}

- (_INPBImageValue)specialPricingBadgeImage
{
  return self->_specialPricingBadgeImage;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (_INPBUserActivity)userActivityForBookingInApplication
{
  return self->_userActivityForBookingInApplication;
}

- (BOOL)usesMeteredFare
{
  return self->_usesMeteredFare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityForBookingInApplication, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_specialPricingBadgeImage, 0);
  objc_storeStrong((id *)&self->_specialPricing, 0);
  objc_storeStrong((id *)&self->_priceRange, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fareLineItems, 0);
  objc_storeStrong((id *)&self->_estimatedPickupDate, 0);
  objc_storeStrong((id *)&self->_disclaimerMessage, 0);
  objc_storeStrong((id *)&self->_availablePartySizeOptionsSelectionPrompt, 0);
  objc_storeStrong((id *)&self->_availablePartySizeOptions, 0);
}

+ (Class)availablePartySizeOptionsType
{
  return (Class)objc_opt_class();
}

+ (Class)fareLineItemsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
