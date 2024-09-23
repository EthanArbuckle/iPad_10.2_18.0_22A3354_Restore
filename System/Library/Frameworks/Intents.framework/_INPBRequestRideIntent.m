@implementation _INPBRequestRideIntent

- (void)setDropOffLocation:(id)a3
{
  objc_storeStrong((id *)&self->_dropOffLocation, a3);
}

- (BOOL)hasDropOffLocation
{
  return self->_dropOffLocation != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setPartySize:(id)a3
{
  objc_storeStrong((id *)&self->_partySize, a3);
}

- (BOOL)hasPartySize
{
  return self->_partySize != 0;
}

- (void)setPaymentMethod:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethod, a3);
}

- (BOOL)hasPaymentMethod
{
  return self->_paymentMethod != 0;
}

- (void)setPaymentMethodName:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethodName, a3);
}

- (BOOL)hasPaymentMethodName
{
  return self->_paymentMethodName != 0;
}

- (void)setPickupLocation:(id)a3
{
  objc_storeStrong((id *)&self->_pickupLocation, a3);
}

- (BOOL)hasPickupLocation
{
  return self->_pickupLocation != 0;
}

- (void)setPickupTime:(id)a3
{
  objc_storeStrong((id *)&self->_pickupTime, a3);
}

- (BOOL)hasPickupTime
{
  return self->_pickupTime != 0;
}

- (void)setRideOptionName:(id)a3
{
  objc_storeStrong((id *)&self->_rideOptionName, a3);
}

- (BOOL)hasRideOptionName
{
  return self->_rideOptionName != 0;
}

- (void)setScheduledPickupTime:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledPickupTime, a3);
}

- (BOOL)hasScheduledPickupTime
{
  return self->_scheduledPickupTime != 0;
}

- (void)setUsesApplePayForPayment:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_usesApplePayForPayment = a3;
}

- (BOOL)hasUsesApplePayForPayment
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasUsesApplePayForPayment:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRequestRideIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  -[_INPBRequestRideIntent dropOffLocation](self, "dropOffLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBRequestRideIntent dropOffLocation](self, "dropOffLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRequestRideIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBRequestRideIntent intentMetadata](self, "intentMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRequestRideIntent partySize](self, "partySize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBRequestRideIntent partySize](self, "partySize");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRequestRideIntent paymentMethod](self, "paymentMethod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBRequestRideIntent paymentMethod](self, "paymentMethod");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRequestRideIntent paymentMethodName](self, "paymentMethodName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBRequestRideIntent paymentMethodName](self, "paymentMethodName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRequestRideIntent pickupLocation](self, "pickupLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBRequestRideIntent pickupLocation](self, "pickupLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRequestRideIntent pickupTime](self, "pickupTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBRequestRideIntent pickupTime](self, "pickupTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRequestRideIntent rideOptionName](self, "rideOptionName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[_INPBRequestRideIntent rideOptionName](self, "rideOptionName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRequestRideIntent scheduledPickupTime](self, "scheduledPickupTime");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[_INPBRequestRideIntent scheduledPickupTime](self, "scheduledPickupTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBRequestRideIntent hasUsesApplePayForPayment](self, "hasUsesApplePayForPayment"))
    PBDataWriterWriteBOOLField();

}

- (_INPBRequestRideIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRequestRideIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRequestRideIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRequestRideIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRequestRideIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBRequestRideIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRequestRideIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = -[_INPBRequestRideIntent init](+[_INPBRequestRideIntent allocWithZone:](_INPBRequestRideIntent, "allocWithZone:"), "init");
  v6 = -[_INPBLocation copyWithZone:](self->_dropOffLocation, "copyWithZone:", a3);
  -[_INPBRequestRideIntent setDropOffLocation:](v5, "setDropOffLocation:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBRequestRideIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  v8 = -[_INPBInteger copyWithZone:](self->_partySize, "copyWithZone:", a3);
  -[_INPBRequestRideIntent setPartySize:](v5, "setPartySize:", v8);

  v9 = -[_INPBPaymentMethod copyWithZone:](self->_paymentMethod, "copyWithZone:", a3);
  -[_INPBRequestRideIntent setPaymentMethod:](v5, "setPaymentMethod:", v9);

  v10 = -[_INPBDataString copyWithZone:](self->_paymentMethodName, "copyWithZone:", a3);
  -[_INPBRequestRideIntent setPaymentMethodName:](v5, "setPaymentMethodName:", v10);

  v11 = -[_INPBLocation copyWithZone:](self->_pickupLocation, "copyWithZone:", a3);
  -[_INPBRequestRideIntent setPickupLocation:](v5, "setPickupLocation:", v11);

  v12 = -[_INPBDateTimeRange copyWithZone:](self->_pickupTime, "copyWithZone:", a3);
  -[_INPBRequestRideIntent setPickupTime:](v5, "setPickupTime:", v12);

  v13 = -[_INPBDataString copyWithZone:](self->_rideOptionName, "copyWithZone:", a3);
  -[_INPBRequestRideIntent setRideOptionName:](v5, "setRideOptionName:", v13);

  v14 = -[_INPBDateTimeRange copyWithZone:](self->_scheduledPickupTime, "copyWithZone:", a3);
  -[_INPBRequestRideIntent setScheduledPickupTime:](v5, "setScheduledPickupTime:", v14);

  if (-[_INPBRequestRideIntent hasUsesApplePayForPayment](self, "hasUsesApplePayForPayment"))
    -[_INPBRequestRideIntent setUsesApplePayForPayment:](v5, "setUsesApplePayForPayment:", -[_INPBRequestRideIntent usesApplePayForPayment](self, "usesApplePayForPayment"));
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
  BOOL v52;
  int v54;
  int usesApplePayForPayment;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[_INPBRequestRideIntent dropOffLocation](self, "dropOffLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dropOffLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBRequestRideIntent dropOffLocation](self, "dropOffLocation");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBRequestRideIntent dropOffLocation](self, "dropOffLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dropOffLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBRequestRideIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBRequestRideIntent intentMetadata](self, "intentMetadata");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBRequestRideIntent intentMetadata](self, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBRequestRideIntent partySize](self, "partySize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "partySize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBRequestRideIntent partySize](self, "partySize");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBRequestRideIntent partySize](self, "partySize");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "partySize");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBRequestRideIntent paymentMethod](self, "paymentMethod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentMethod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBRequestRideIntent paymentMethod](self, "paymentMethod");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBRequestRideIntent paymentMethod](self, "paymentMethod");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentMethod");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBRequestRideIntent paymentMethodName](self, "paymentMethodName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentMethodName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBRequestRideIntent paymentMethodName](self, "paymentMethodName");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBRequestRideIntent paymentMethodName](self, "paymentMethodName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentMethodName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBRequestRideIntent pickupLocation](self, "pickupLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pickupLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBRequestRideIntent pickupLocation](self, "pickupLocation");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBRequestRideIntent pickupLocation](self, "pickupLocation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pickupLocation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBRequestRideIntent pickupTime](self, "pickupTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pickupTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBRequestRideIntent pickupTime](self, "pickupTime");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_INPBRequestRideIntent pickupTime](self, "pickupTime");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pickupTime");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBRequestRideIntent rideOptionName](self, "rideOptionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rideOptionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBRequestRideIntent rideOptionName](self, "rideOptionName");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_INPBRequestRideIntent rideOptionName](self, "rideOptionName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rideOptionName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBRequestRideIntent scheduledPickupTime](self, "scheduledPickupTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduledPickupTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_46:

    goto LABEL_47;
  }
  -[_INPBRequestRideIntent scheduledPickupTime](self, "scheduledPickupTime");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_INPBRequestRideIntent scheduledPickupTime](self, "scheduledPickupTime");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheduledPickupTime");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_47;
  }
  else
  {

  }
  v54 = -[_INPBRequestRideIntent hasUsesApplePayForPayment](self, "hasUsesApplePayForPayment");
  if (v54 == objc_msgSend(v4, "hasUsesApplePayForPayment"))
  {
    if (!-[_INPBRequestRideIntent hasUsesApplePayForPayment](self, "hasUsesApplePayForPayment")
      || !objc_msgSend(v4, "hasUsesApplePayForPayment")
      || (usesApplePayForPayment = self->_usesApplePayForPayment,
          usesApplePayForPayment == objc_msgSend(v4, "usesApplePayForPayment")))
    {
      v52 = 1;
      goto LABEL_48;
    }
  }
LABEL_47:
  v52 = 0;
LABEL_48:

  return v52;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v3 = -[_INPBLocation hash](self->_dropOffLocation, "hash");
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v5 = -[_INPBInteger hash](self->_partySize, "hash");
  v6 = -[_INPBPaymentMethod hash](self->_paymentMethod, "hash");
  v7 = -[_INPBDataString hash](self->_paymentMethodName, "hash");
  v8 = -[_INPBLocation hash](self->_pickupLocation, "hash");
  v9 = -[_INPBDateTimeRange hash](self->_pickupTime, "hash");
  v10 = -[_INPBDataString hash](self->_rideOptionName, "hash");
  v11 = -[_INPBDateTimeRange hash](self->_scheduledPickupTime, "hash");
  if (-[_INPBRequestRideIntent hasUsesApplePayForPayment](self, "hasUsesApplePayForPayment"))
    v12 = 2654435761 * self->_usesApplePayForPayment;
  else
    v12 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (id)dictionaryRepresentation
{
  void *v3;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBRequestRideIntent dropOffLocation](self, "dropOffLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dropOffLocation"));

  -[_INPBRequestRideIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  -[_INPBRequestRideIntent partySize](self, "partySize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("partySize"));

  -[_INPBRequestRideIntent paymentMethod](self, "paymentMethod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("paymentMethod"));

  -[_INPBRequestRideIntent paymentMethodName](self, "paymentMethodName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("paymentMethodName"));

  -[_INPBRequestRideIntent pickupLocation](self, "pickupLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("pickupLocation"));

  -[_INPBRequestRideIntent pickupTime](self, "pickupTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("pickupTime"));

  -[_INPBRequestRideIntent rideOptionName](self, "rideOptionName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("rideOptionName"));

  -[_INPBRequestRideIntent scheduledPickupTime](self, "scheduledPickupTime");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryRepresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("scheduledPickupTime"));

  if (-[_INPBRequestRideIntent hasUsesApplePayForPayment](self, "hasUsesApplePayForPayment"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBRequestRideIntent usesApplePayForPayment](self, "usesApplePayForPayment"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("usesApplePayForPayment"));

  }
  return v3;
}

- (_INPBLocation)dropOffLocation
{
  return self->_dropOffLocation;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBInteger)partySize
{
  return self->_partySize;
}

- (_INPBPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (_INPBDataString)paymentMethodName
{
  return self->_paymentMethodName;
}

- (_INPBLocation)pickupLocation
{
  return self->_pickupLocation;
}

- (_INPBDateTimeRange)pickupTime
{
  return self->_pickupTime;
}

- (_INPBDataString)rideOptionName
{
  return self->_rideOptionName;
}

- (_INPBDateTimeRange)scheduledPickupTime
{
  return self->_scheduledPickupTime;
}

- (BOOL)usesApplePayForPayment
{
  return self->_usesApplePayForPayment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledPickupTime, 0);
  objc_storeStrong((id *)&self->_rideOptionName, 0);
  objc_storeStrong((id *)&self->_pickupTime, 0);
  objc_storeStrong((id *)&self->_pickupLocation, 0);
  objc_storeStrong((id *)&self->_paymentMethodName, 0);
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_partySize, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_dropOffLocation, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
