@implementation DUFoundInEventResultObjC

- (DUFoundInEventResultObjC)initWithDUFoundInEventResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  DUFoundInEventResultObjC *v9;
  DUFoundInEventResultObjC *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  unsigned int v21;
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
  objc_super v33;

  v3 = a3;
  v21 = objc_msgSend(v3, "detectedEventPolarity");
  objc_msgSend(v3, "reservationIdError");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reservationId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reservationNameError");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reservationName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAddressError");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAddress");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAddressComponents");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endAddressError");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endAddress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endAddressComponents");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startPlaceError");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startPlace");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endPlaceError");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endPlace");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDateError");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDateError");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hotelNameError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hotelName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "guestNameError");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "guestName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "movieNameError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "movieName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v33.receiver = self;
  v33.super_class = (Class)DUFoundInEventResultObjC;
  v9 = -[DUFoundInEventClientAbstractResult initWithFields:reservationIdError:reservationId:reservationNameError:reservationName:startAddressError:startAddress:startAddressComponents:endAddressError:endAddress:endAddressComponents:startPlaceError:startPlace:endPlaceError:endPlace:startDateError:startDate:endDateError:endDate:hotelNameError:hotelName:guestNameError:guestName:movieNameError:movieName:](&v33, sel_initWithFields_reservationIdError_reservationId_reservationNameError_reservationName_startAddressError_startAddress_startAddressComponents_endAddressError_endAddress_endAddressComponents_startPlaceError_startPlace_endPlaceError_endPlace_startDateError_startDate_endDateError_endDate_hotelNameError_hotelName_guestNameError_guestName_movieNameError_movieName_, v21, v32, v31, v29, v20, v18, v30, v28, v27, v17, v26, v25, v24, v16, v23, v22, v15,
         v14,
         v4,
         v5,
         v13,
         v12,
         v6,
         v7,
         v8);

  if (v9)
    v10 = v9;

  return v9;
}

@end
