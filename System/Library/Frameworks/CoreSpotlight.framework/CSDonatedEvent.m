@implementation CSDonatedEvent

- (CSDonatedEvent)initWithType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CSDonatedEvent *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("type");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CSDonatedEvent initWithAttributes:](self, "initWithAttributes:", v6);
  return v7;
}

- (CSDonatedEvent)initWithAttributes:(id)a3
{
  id v4;
  CSDonatedEvent *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSDonatedEvent;
  v5 = -[CSDonatedEvent init](&v8, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    -[CSDonatedEvent setMutableAttributes:](v5, "setMutableAttributes:", v6);

  }
  return v5;
}

- (CSDonatedEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  CSDonatedEvent *v7;
  id v9;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0;
  v10[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, v10, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v6)
    v7 = 0;
  else
    v7 = -[CSDonatedEvent initWithAttributes:]([CSDonatedEvent alloc], "initWithAttributes:", v5);

  return v7;
}

- (id)data
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v7;

  v2 = (void *)MEMORY[0x1E0CB38B0];
  -[CSDonatedEvent attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v2, "dataWithPropertyList:format:options:error:", v3, 200, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;

  if (v5)
  {

    v4 = 0;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[CSDonatedEvent attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAttributes:", v5);

  return v6;
}

- (NSDictionary)attributes
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)eventFromData:(id)a3
{
  id v3;
  CSDonatedEvent *v4;

  v3 = a3;
  v4 = -[CSDonatedEvent initWithData:]([CSDonatedEvent alloc], "initWithData:", v3);

  return v4;
}

- (void)setType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("type"));

}

- (NSString)type
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAdditionalInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("additionalInfo"));

}

- (NSDictionary)additionalInfo
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("additionalInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setDocIDs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("docIDs"));

}

- (NSArray)docIDs
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("docIDs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setFlightNumber:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("flightNumber"));

}

- (id)flightNumber
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("flightNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setFlightCarrier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("flightCarrier"));

}

- (id)flightCarrier
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("flightCarrier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setFlightStatus:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("flightStatus"));

}

- (id)flightStatus
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("flightStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCheckInUrl:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("checkInUrl"));

}

- (id)checkInUrl
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("checkInUrl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setBookingInfoUrl:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("bookingInfoUrl"));

}

- (id)bookingInfoUrl
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("bookingInfoUrl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setArrivalAirportCode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("arrivalAirportCode"));

}

- (id)arrivalAirportCode
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("arrivalAirportCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDepartureAirportCode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("departureAirportCode"));

}

- (id)departureAirportCode
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("departureAirportCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setArrivalAirportName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("arrivalAirportName"));

}

- (id)arrivalAirportName
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("arrivalAirportName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDepartureAirportName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("departureAirportName"));

}

- (id)departureAirportName
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("departureAirportName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setArrivalTerminal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("arrivalTerminal"));

}

- (id)arrivalTerminal
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("arrivalTerminal"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDepartureTerminal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("departureTerminal"));

}

- (id)departureTerminal
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("departureTerminal"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setArrivalDateTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("arrivalDateTime"));

}

- (id)arrivalDateTime
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("arrivalDateTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDepartureDateTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("departureDateTime"));

}

- (id)departureDateTime
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("departureDateTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setConfirmationNumber:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("confirmationNumber"));

}

- (id)confirmationNumber
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("confirmationNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTrackingUrl:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("trackingUrl"));

}

- (id)trackingUrl
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("trackingUrl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTrackingNumber:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("trackingNumber"));

}

- (id)trackingNumber
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("trackingNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setOrderDateTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("orderDateTime"));

}

- (id)orderDateTime
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("orderDateTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDeliveryDateTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("deliveryDateTime"));

}

- (id)deliveryDateTime
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("deliveryDateTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCourierName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("courierName"));

}

- (id)courierName
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("courierName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setMerchantName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("merchantName"));

}

- (id)merchantName
{
  void *v2;
  void *v3;

  -[CSDonatedEvent mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("merchantName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSenderIsCourier:(BOOL)a3
{
  NSMutableDictionary *mutableAttributes;
  id v4;

  mutableAttributes = self->_mutableAttributes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](mutableAttributes, "setValue:forKey:", v4, CFSTR("senderIsCourier"));

}

- (BOOL)senderIsCourier
{
  void *v2;
  BOOL v3;

  -[NSMutableDictionary valueForKey:](self->_mutableAttributes, "valueForKey:", CFSTR("senderIsCourier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setFromAllowListedSender:(BOOL)a3
{
  NSMutableDictionary *mutableAttributes;
  id v4;

  mutableAttributes = self->_mutableAttributes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](mutableAttributes, "setValue:forKey:", v4, CFSTR("fromAllowListedSender"));

}

- (BOOL)fromAllowListedSender
{
  void *v2;
  BOOL v3;

  -[NSMutableDictionary valueForKey:](self->_mutableAttributes, "valueForKey:", CFSTR("fromAllowListedSender"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSMutableDictionary)mutableAttributes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMutableAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAttributes, 0);
}

@end
