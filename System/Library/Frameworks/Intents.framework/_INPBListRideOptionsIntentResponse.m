@implementation _INPBListRideOptionsIntentResponse

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (BOOL)hasExpirationDate
{
  return self->_expirationDate != 0;
}

- (void)setPaymentMethods:(id)a3
{
  NSArray *v4;
  NSArray *paymentMethods;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  paymentMethods = self->_paymentMethods;
  self->_paymentMethods = v4;

}

- (void)clearPaymentMethods
{
  -[NSArray removeAllObjects](self->_paymentMethods, "removeAllObjects");
}

- (void)addPaymentMethods:(id)a3
{
  id v4;
  NSArray *paymentMethods;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  paymentMethods = self->_paymentMethods;
  v8 = v4;
  if (!paymentMethods)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_paymentMethods;
    self->_paymentMethods = v6;

    v4 = v8;
    paymentMethods = self->_paymentMethods;
  }
  -[NSArray addObject:](paymentMethods, "addObject:", v4);

}

- (unint64_t)paymentMethodsCount
{
  return -[NSArray count](self->_paymentMethods, "count");
}

- (id)paymentMethodsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_paymentMethods, "objectAtIndexedSubscript:", a3);
}

- (void)setRideOptions:(id)a3
{
  NSArray *v4;
  NSArray *rideOptions;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  rideOptions = self->_rideOptions;
  self->_rideOptions = v4;

}

- (void)clearRideOptions
{
  -[NSArray removeAllObjects](self->_rideOptions, "removeAllObjects");
}

- (void)addRideOptions:(id)a3
{
  id v4;
  NSArray *rideOptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  rideOptions = self->_rideOptions;
  v8 = v4;
  if (!rideOptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_rideOptions;
    self->_rideOptions = v6;

    v4 = v8;
    rideOptions = self->_rideOptions;
  }
  -[NSArray addObject:](rideOptions, "addObject:", v4);

}

- (unint64_t)rideOptionsCount
{
  return -[NSArray count](self->_rideOptions, "count");
}

- (id)rideOptionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_rideOptions, "objectAtIndexedSubscript:", a3);
}

- (void)setSupportsApplePayForPayment:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_supportsApplePayForPayment = a3;
}

- (BOOL)hasSupportsApplePayForPayment
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSupportsApplePayForPayment:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBListRideOptionsIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBListRideOptionsIntentResponse expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBListRideOptionsIntentResponse expirationDate](self, "expirationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_paymentMethods;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_rideOptions;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

  if (-[_INPBListRideOptionsIntentResponse hasSupportsApplePayForPayment](self, "hasSupportsApplePayForPayment", v17))
    PBDataWriterWriteBOOLField();

}

- (_INPBListRideOptionsIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBListRideOptionsIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBListRideOptionsIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBListRideOptionsIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBListRideOptionsIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBListRideOptionsIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBListRideOptionsIntentResponse *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = -[_INPBListRideOptionsIntentResponse init](+[_INPBListRideOptionsIntentResponse allocWithZone:](_INPBListRideOptionsIntentResponse, "allocWithZone:"), "init");
  v6 = -[_INPBTimestamp copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
  -[_INPBListRideOptionsIntentResponse setExpirationDate:](v5, "setExpirationDate:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_paymentMethods, "copyWithZone:", a3);
  -[_INPBListRideOptionsIntentResponse setPaymentMethods:](v5, "setPaymentMethods:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_rideOptions, "copyWithZone:", a3);
  -[_INPBListRideOptionsIntentResponse setRideOptions:](v5, "setRideOptions:", v8);

  if (-[_INPBListRideOptionsIntentResponse hasSupportsApplePayForPayment](self, "hasSupportsApplePayForPayment"))
    -[_INPBListRideOptionsIntentResponse setSupportsApplePayForPayment:](v5, "setSupportsApplePayForPayment:", -[_INPBListRideOptionsIntentResponse supportsApplePayForPayment](self, "supportsApplePayForPayment"));
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
  BOOL v22;
  int v24;
  int supportsApplePayForPayment;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBListRideOptionsIntentResponse expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBListRideOptionsIntentResponse expirationDate](self, "expirationDate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBListRideOptionsIntentResponse expirationDate](self, "expirationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expirationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBListRideOptionsIntentResponse paymentMethods](self, "paymentMethods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentMethods");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBListRideOptionsIntentResponse paymentMethods](self, "paymentMethods");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBListRideOptionsIntentResponse paymentMethods](self, "paymentMethods");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentMethods");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBListRideOptionsIntentResponse rideOptions](self, "rideOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rideOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[_INPBListRideOptionsIntentResponse rideOptions](self, "rideOptions");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBListRideOptionsIntentResponse rideOptions](self, "rideOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rideOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  v24 = -[_INPBListRideOptionsIntentResponse hasSupportsApplePayForPayment](self, "hasSupportsApplePayForPayment");
  if (v24 == objc_msgSend(v4, "hasSupportsApplePayForPayment"))
  {
    if (!-[_INPBListRideOptionsIntentResponse hasSupportsApplePayForPayment](self, "hasSupportsApplePayForPayment")
      || !objc_msgSend(v4, "hasSupportsApplePayForPayment")
      || (supportsApplePayForPayment = self->_supportsApplePayForPayment,
          supportsApplePayForPayment == objc_msgSend(v4, "supportsApplePayForPayment")))
    {
      v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[_INPBTimestamp hash](self->_expirationDate, "hash");
  v4 = -[NSArray hash](self->_paymentMethods, "hash");
  v5 = -[NSArray hash](self->_rideOptions, "hash");
  if (-[_INPBListRideOptionsIntentResponse hasSupportsApplePayForPayment](self, "hasSupportsApplePayForPayment"))
    v6 = 2654435761 * self->_supportsApplePayForPayment;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBListRideOptionsIntentResponse expirationDate](self, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("expirationDate"));

  if (-[NSArray count](self->_paymentMethods, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = self->_paymentMethods;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v11), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("paymentMethods"));
  }
  if (-[NSArray count](self->_rideOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = self->_rideOptions;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18), "dictionaryRepresentation", (_QWORD)v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("rideOptions"));
  }
  if (-[_INPBListRideOptionsIntentResponse hasSupportsApplePayForPayment](self, "hasSupportsApplePayForPayment", (_QWORD)v22))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBListRideOptionsIntentResponse supportsApplePayForPayment](self, "supportsApplePayForPayment"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("supportsApplePayForPayment"));

  }
  return v3;
}

- (_INPBTimestamp)expirationDate
{
  return self->_expirationDate;
}

- (NSArray)paymentMethods
{
  return self->_paymentMethods;
}

- (NSArray)rideOptions
{
  return self->_rideOptions;
}

- (BOOL)supportsApplePayForPayment
{
  return self->_supportsApplePayForPayment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideOptions, 0);
  objc_storeStrong((id *)&self->_paymentMethods, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

+ (Class)paymentMethodsType
{
  return (Class)objc_opt_class();
}

+ (Class)rideOptionsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
