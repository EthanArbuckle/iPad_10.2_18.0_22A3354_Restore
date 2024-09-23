@implementation DUFoundInEventClientAbstractResult

- (DUFoundInEventClientAbstractResult)initWithFields:(BOOL)a3 reservationIdError:(id)a4 reservationId:(id)a5 reservationNameError:(id)a6 reservationName:(id)a7 startAddressError:(id)a8 startAddress:(id)a9 startAddressComponents:(id)a10 endAddressError:(id)a11 endAddress:(id)a12 endAddressComponents:(id)a13 startPlaceError:(id)a14 startPlace:(id)a15 endPlaceError:(id)a16 endPlace:(id)a17 startDateError:(id)a18 startDate:(id)a19 endDateError:(id)a20 endDate:(id)a21 hotelNameError:(id)a22 hotelName:(id)a23 guestNameError:(id)a24 guestName:(id)a25 movieNameError:(id)a26 movieName:(id)a27
{
  NSString *v32;
  NSError *v33;
  NSString *v34;
  NSError *v35;
  NSError *v36;
  NSString *v37;
  NSError *v38;
  NSString *v39;
  NSError *reservationIdError;
  NSString *reservationId;
  NSError *reservationNameError;
  NSString *reservationName;
  NSError *startAddressError;
  NSString *startAddress;
  NSDictionary *startAddressComponents;
  NSError *endAddressError;
  NSString *endAddress;
  NSDictionary *endAddressComponents;
  NSError *startPlaceError;
  NSString *startPlace;
  NSError *endPlaceError;
  NSString *endPlace;
  NSError *startDateError;
  NSString *startDate;
  NSString *v56;
  NSError *endDateError;
  NSError *v58;
  NSString *endDate;
  NSString *v60;
  NSError *hotelNameError;
  NSError *v62;
  NSString *hotelName;
  NSString *v64;
  NSError *guestNameError;
  NSError *v66;
  NSString *guestName;
  NSString *v68;
  NSError *movieNameError;
  NSError *v70;
  NSString *movieName;
  NSError *v73;
  NSString *v74;
  NSString *v75;
  NSError *v76;
  NSError *v77;
  NSError *v78;
  NSError *v79;
  NSString *v80;
  NSString *v81;
  NSError *v82;
  NSError *v83;
  NSString *v84;
  NSDictionary *v85;
  NSDictionary *v86;
  NSString *v87;
  NSString *v88;
  NSError *v89;
  NSError *v90;
  NSError *v91;
  NSString *v92;
  NSError *v93;
  NSDictionary *v94;
  NSDictionary *v95;
  NSString *v96;
  NSString *v97;
  NSString *v98;
  NSError *v99;
  NSString *v100;
  NSError *v101;
  NSString *v102;
  NSError *v104;

  v73 = (NSError *)a4;
  v32 = (NSString *)a5;
  v33 = (NSError *)a6;
  v34 = (NSString *)a7;
  v35 = (NSError *)a8;
  v97 = (NSString *)a9;
  v94 = (NSDictionary *)a10;
  v90 = (NSError *)a11;
  v87 = (NSString *)a12;
  v85 = (NSDictionary *)a13;
  v78 = (NSError *)a14;
  v74 = (NSString *)a15;
  v76 = (NSError *)a16;
  v80 = (NSString *)a17;
  v82 = (NSError *)a18;
  v84 = (NSString *)a19;
  v36 = (NSError *)a20;
  v37 = (NSString *)a21;
  v38 = (NSError *)a22;
  v39 = (NSString *)a23;
  v89 = (NSError *)a24;
  v92 = (NSString *)a25;
  v93 = (NSError *)a26;
  v96 = (NSString *)a27;
  self->_detectedEventPolarity = a3;
  reservationIdError = self->_reservationIdError;
  self->_reservationIdError = v73;
  v104 = v73;

  reservationId = self->_reservationId;
  self->_reservationId = v32;
  v102 = v32;

  reservationNameError = self->_reservationNameError;
  self->_reservationNameError = v33;
  v101 = v33;

  reservationName = self->_reservationName;
  self->_reservationName = v34;
  v100 = v34;

  startAddressError = self->_startAddressError;
  self->_startAddressError = v35;
  v99 = v35;

  startAddress = self->_startAddress;
  self->_startAddress = v97;
  v98 = v97;

  startAddressComponents = self->_startAddressComponents;
  self->_startAddressComponents = v94;
  v95 = v94;

  endAddressError = self->_endAddressError;
  self->_endAddressError = v90;
  v91 = v90;

  endAddress = self->_endAddress;
  self->_endAddress = v87;
  v88 = v87;

  endAddressComponents = self->_endAddressComponents;
  self->_endAddressComponents = v85;
  v86 = v85;

  startPlaceError = self->_startPlaceError;
  self->_startPlaceError = v78;
  v79 = v78;

  startPlace = self->_startPlace;
  self->_startPlace = v74;
  v75 = v74;

  endPlaceError = self->_endPlaceError;
  self->_endPlaceError = v76;
  v77 = v76;

  endPlace = self->_endPlace;
  self->_endPlace = v80;
  v81 = v80;

  startDateError = self->_startDateError;
  self->_startDateError = v82;
  v83 = v82;

  startDate = self->_startDate;
  self->_startDate = v84;
  v56 = v84;

  endDateError = self->_endDateError;
  self->_endDateError = v36;
  v58 = v36;

  endDate = self->_endDate;
  self->_endDate = v37;
  v60 = v37;

  hotelNameError = self->_hotelNameError;
  self->_hotelNameError = v38;
  v62 = v38;

  hotelName = self->_hotelName;
  self->_hotelName = v39;
  v64 = v39;

  guestNameError = self->_guestNameError;
  self->_guestNameError = v89;
  v66 = v89;

  guestName = self->_guestName;
  self->_guestName = v92;
  v68 = v92;

  movieNameError = self->_movieNameError;
  self->_movieNameError = v93;
  v70 = v93;

  movieName = self->_movieName;
  self->_movieName = v96;

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 detectedEventPolarity;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  detectedEventPolarity = self->_detectedEventPolarity;
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", detectedEventPolarity);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("detectedEventPolarity"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_reservationIdError, CFSTR("reservationIdError"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_reservationId, CFSTR("reservationId"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_reservationNameError, CFSTR("reservationNameError"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_reservationName, CFSTR("reservationName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_startAddressError, CFSTR("startAddressError"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_startAddress, CFSTR("startAddress"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_startAddressComponents, CFSTR("startAddressComponents"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_endAddressError, CFSTR("endAddressError"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_endAddress, CFSTR("endAddress"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_endAddressComponents, CFSTR("endAddressComponents"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_startPlaceError, CFSTR("startPlaceError"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_startPlace, CFSTR("startPlace"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_endPlaceError, CFSTR("endPlaceError"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_endPlace, CFSTR("endPlace"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_startDateError, CFSTR("startDateError"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_endDateError, CFSTR("endDateError"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_hotelNameError, CFSTR("hotelNameError"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_hotelName, CFSTR("hotelName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_guestNameError, CFSTR("guestNameError"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_guestName, CFSTR("guestName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_movieNameError, CFSTR("movieNameError"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_movieName, CFSTR("movieName"));

}

- (DUFoundInEventClientAbstractResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSError *v6;
  NSError *reservationIdError;
  NSString *v8;
  NSString *reservationId;
  NSError *v10;
  NSError *reservationNameError;
  NSString *v12;
  NSString *reservationName;
  NSError *v14;
  NSError *startAddressError;
  NSString *v16;
  NSString *startAddress;
  NSDictionary *v18;
  NSDictionary *startAddressComponents;
  NSError *v20;
  NSError *endAddressError;
  NSString *v22;
  NSString *endAddress;
  NSDictionary *v24;
  NSDictionary *endAddressComponents;
  NSError *v26;
  NSError *startPlaceError;
  NSString *v28;
  NSString *startPlace;
  NSError *v30;
  NSError *endPlaceError;
  NSString *v32;
  NSString *endPlace;
  NSError *v34;
  NSError *startDateError;
  NSString *v36;
  NSString *startDate;
  NSError *v38;
  NSError *endDateError;
  NSString *v40;
  NSString *endDate;
  NSError *v42;
  NSError *hotelNameError;
  NSString *v44;
  NSString *hotelName;
  NSError *v46;
  NSError *guestNameError;
  NSString *v48;
  NSString *guestName;
  NSError *v50;
  NSError *movieNameError;
  NSString *v52;
  NSString *movieName;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detectedEventPolarity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_detectedEventPolarity = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reservationIdError"));
  v6 = (NSError *)objc_claimAutoreleasedReturnValue();
  reservationIdError = self->_reservationIdError;
  self->_reservationIdError = v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reservationId"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  reservationId = self->_reservationId;
  self->_reservationId = v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reservationNameError"));
  v10 = (NSError *)objc_claimAutoreleasedReturnValue();
  reservationNameError = self->_reservationNameError;
  self->_reservationNameError = v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reservationName"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  reservationName = self->_reservationName;
  self->_reservationName = v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startAddressError"));
  v14 = (NSError *)objc_claimAutoreleasedReturnValue();
  startAddressError = self->_startAddressError;
  self->_startAddressError = v14;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startAddress"));
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  startAddress = self->_startAddress;
  self->_startAddress = v16;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startAddressComponents"));
  v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  startAddressComponents = self->_startAddressComponents;
  self->_startAddressComponents = v18;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endAddressError"));
  v20 = (NSError *)objc_claimAutoreleasedReturnValue();
  endAddressError = self->_endAddressError;
  self->_endAddressError = v20;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endAddress"));
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  endAddress = self->_endAddress;
  self->_endAddress = v22;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endAddressComponents"));
  v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  endAddressComponents = self->_endAddressComponents;
  self->_endAddressComponents = v24;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startPlaceError"));
  v26 = (NSError *)objc_claimAutoreleasedReturnValue();
  startPlaceError = self->_startPlaceError;
  self->_startPlaceError = v26;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startPlace"));
  v28 = (NSString *)objc_claimAutoreleasedReturnValue();
  startPlace = self->_startPlace;
  self->_startPlace = v28;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endPlaceError"));
  v30 = (NSError *)objc_claimAutoreleasedReturnValue();
  endPlaceError = self->_endPlaceError;
  self->_endPlaceError = v30;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endPlace"));
  v32 = (NSString *)objc_claimAutoreleasedReturnValue();
  endPlace = self->_endPlace;
  self->_endPlace = v32;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDateError"));
  v34 = (NSError *)objc_claimAutoreleasedReturnValue();
  startDateError = self->_startDateError;
  self->_startDateError = v34;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v36 = (NSString *)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  self->_startDate = v36;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDateError"));
  v38 = (NSError *)objc_claimAutoreleasedReturnValue();
  endDateError = self->_endDateError;
  self->_endDateError = v38;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v40 = (NSString *)objc_claimAutoreleasedReturnValue();
  endDate = self->_endDate;
  self->_endDate = v40;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hotelNameError"));
  v42 = (NSError *)objc_claimAutoreleasedReturnValue();
  hotelNameError = self->_hotelNameError;
  self->_hotelNameError = v42;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hotelName"));
  v44 = (NSString *)objc_claimAutoreleasedReturnValue();
  hotelName = self->_hotelName;
  self->_hotelName = v44;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guestNameError"));
  v46 = (NSError *)objc_claimAutoreleasedReturnValue();
  guestNameError = self->_guestNameError;
  self->_guestNameError = v46;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guestName"));
  v48 = (NSString *)objc_claimAutoreleasedReturnValue();
  guestName = self->_guestName;
  self->_guestName = v48;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("movieNameError"));
  v50 = (NSError *)objc_claimAutoreleasedReturnValue();
  movieNameError = self->_movieNameError;
  self->_movieNameError = v50;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("movieName"));
  v52 = (NSString *)objc_claimAutoreleasedReturnValue();

  movieName = self->_movieName;
  self->_movieName = v52;

  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DUFoundInEventClientAbstractResult initWithFields:reservationIdError:reservationId:reservationNameError:reservationName:startAddressError:startAddress:startAddressComponents:endAddressError:endAddress:endAddressComponents:startPlaceError:startPlace:endPlaceError:endPlace:startDateError:startDate:endDateError:endDate:hotelNameError:hotelName:guestNameError:guestName:movieNameError:movieName:]([DUFoundInEventClientAbstractResult alloc], "initWithFields:reservationIdError:reservationId:reservationNameError:reservationName:startAddressError:startAddress:startAddressComponents:endAddressError:endAddress:endAddressComponents:startPlaceError:startPlace:endPlaceError:endPlace:startDateError:startDate:endDateError:endDate:hotelNameError:hotelName:guestNameError:guestName:movieNameError:movieName:", self->_detectedEventPolarity, self->_reservationIdError, self->_reservationId, self->_reservationNameError, self->_reservationName, self->_startAddressError, self->_startAddress, self->_startAddressComponents, self->_endAddressError, self->_endAddress, self->_endAddressComponents, self->_startPlaceError, self->_startPlace, self->_endPlaceError,
           self->_endPlace,
           self->_startDateError,
           self->_startDate,
           self->_endDateError,
           self->_endDate,
           self->_hotelNameError,
           self->_hotelName,
           self->_guestNameError,
           self->_guestName,
           self->_movieNameError,
           self->_movieName);
}

- (BOOL)detectedEventPolarity
{
  return self->_detectedEventPolarity;
}

- (NSError)reservationIdError
{
  return self->_reservationIdError;
}

- (NSString)reservationId
{
  return self->_reservationId;
}

- (NSError)reservationNameError
{
  return self->_reservationNameError;
}

- (NSString)reservationName
{
  return self->_reservationName;
}

- (NSError)startAddressError
{
  return self->_startAddressError;
}

- (NSString)startAddress
{
  return self->_startAddress;
}

- (NSDictionary)startAddressComponents
{
  return self->_startAddressComponents;
}

- (NSError)endAddressError
{
  return self->_endAddressError;
}

- (NSString)endAddress
{
  return self->_endAddress;
}

- (NSDictionary)endAddressComponents
{
  return self->_endAddressComponents;
}

- (NSError)startPlaceError
{
  return self->_startPlaceError;
}

- (NSString)startPlace
{
  return self->_startPlace;
}

- (NSError)endPlaceError
{
  return self->_endPlaceError;
}

- (NSString)endPlace
{
  return self->_endPlace;
}

- (NSError)startDateError
{
  return self->_startDateError;
}

- (NSString)startDate
{
  return self->_startDate;
}

- (NSError)endDateError
{
  return self->_endDateError;
}

- (NSString)endDate
{
  return self->_endDate;
}

- (NSError)hotelNameError
{
  return self->_hotelNameError;
}

- (NSString)hotelName
{
  return self->_hotelName;
}

- (NSError)guestNameError
{
  return self->_guestNameError;
}

- (NSString)guestName
{
  return self->_guestName;
}

- (NSError)movieNameError
{
  return self->_movieNameError;
}

- (NSString)movieName
{
  return self->_movieName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieName, 0);
  objc_storeStrong((id *)&self->_movieNameError, 0);
  objc_storeStrong((id *)&self->_guestName, 0);
  objc_storeStrong((id *)&self->_guestNameError, 0);
  objc_storeStrong((id *)&self->_hotelName, 0);
  objc_storeStrong((id *)&self->_hotelNameError, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_endDateError, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_startDateError, 0);
  objc_storeStrong((id *)&self->_endPlace, 0);
  objc_storeStrong((id *)&self->_endPlaceError, 0);
  objc_storeStrong((id *)&self->_startPlace, 0);
  objc_storeStrong((id *)&self->_startPlaceError, 0);
  objc_storeStrong((id *)&self->_endAddressComponents, 0);
  objc_storeStrong((id *)&self->_endAddress, 0);
  objc_storeStrong((id *)&self->_endAddressError, 0);
  objc_storeStrong((id *)&self->_startAddressComponents, 0);
  objc_storeStrong((id *)&self->_startAddress, 0);
  objc_storeStrong((id *)&self->_startAddressError, 0);
  objc_storeStrong((id *)&self->_reservationName, 0);
  objc_storeStrong((id *)&self->_reservationNameError, 0);
  objc_storeStrong((id *)&self->_reservationId, 0);
  objc_storeStrong((id *)&self->_reservationIdError, 0);
}

@end
