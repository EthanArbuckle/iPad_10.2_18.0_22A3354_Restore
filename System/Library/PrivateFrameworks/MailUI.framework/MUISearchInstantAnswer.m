@implementation MUISearchInstantAnswer

+ (id)log
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__MUISearchInstantAnswer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (log_onceToken_7 != -1)
    dispatch_once(&log_onceToken_7, block);
  return (id)log_log_7;
}

void __29__MUISearchInstantAnswer_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_7;
  log_log_7 = (uint64_t)v1;

}

- (void)initSearchInstantAnswer:(_QWORD *)a1
{
  const char *v3;
  const char *v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (a1)
  {
    v3 = NSSelectorFromString(CFSTR("messageId"));
    v4 = NSSelectorFromString(CFSTR("groupId"));
    v5 = NSSelectorFromString(CFSTR("fallbackGroupId"));
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUISearchInstantAnswer initWithMessageId:groupId:fallbackGroupId:instantAnswerKind:]((uint64_t)a1, v6, v7, v8, objc_msgSend(v9, "instantAnswersKind"));

    }
    else
    {
      -[MUISearchInstantAnswer initWithInstantAnswerKind:](a1, objc_msgSend(v9, "instantAnswersKind"));
    }
  }

}

- (void)initWithMessageId:(void *)a3 groupId:(void *)a4 fallbackGroupId:(uint64_t)a5 instantAnswerKind:
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 240), a2);
    objc_storeStrong((id *)(a1 + 248), a3);
    objc_storeStrong((id *)(a1 + 256), a4);
    *(_QWORD *)(a1 + 232) = a5;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 264);
    *(_QWORD *)(a1 + 264) = v13;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(a1 + 272);
    *(_QWORD *)(a1 + 272) = v16;

  }
}

- (void)initWithInstantAnswerKind:(_QWORD *)a1
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a1)
  {
    a1[29] = a2;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)a1[33];
    a1[33] = v4;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)a1[34];
    a1[34] = v6;

  }
}

+ (id)utcFormatter
{
  objc_opt_self();
  if (utcFormatter_onceToken != -1)
    dispatch_once(&utcFormatter_onceToken, &__block_literal_global_28);
  return (id)utcFormatter_utcFormatter;
}

void __38__MUISearchInstantAnswer_utcFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v1 = (void *)utcFormatter_utcFormatter;
  utcFormatter_utcFormatter = (uint64_t)v0;

}

- (int64_t)instantAnswersKind
{
  return self->_instantAnswersKind;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (NSString)groupId
{
  return self->_groupId;
}

- (NSString)fallbackGroupId
{
  return self->_fallbackGroupId;
}

- (NSString)bodyCardSectionID
{
  return self->_bodyCardSectionID;
}

- (NSString)buttonsCardSectionID
{
  return self->_buttonsCardSectionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonsCardSectionID, 0);
  objc_storeStrong((id *)&self->_bodyCardSectionID, 0);
  objc_storeStrong((id *)&self->_fallbackGroupId, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_hotelReservationForAddressLocality, 0);
  objc_storeStrong((id *)&self->_hotelReservationForAddress, 0);
  objc_storeStrong((id *)&self->_hotelReservationForTelephone, 0);
  objc_storeStrong((id *)&self->_hotelReservationForName, 0);
  objc_storeStrong((id *)&self->_hotelTimeZone, 0);
  objc_storeStrong((id *)&self->_hotelCheckoutDateComponents, 0);
  objc_storeStrong((id *)&self->_hotelCheckinDateComponents, 0);
  objc_storeStrong((id *)&self->_hotelUnderName, 0);
  objc_storeStrong((id *)&self->_hotelReservationId, 0);
  objc_storeStrong((id *)&self->_flightInfoIsLive, 0);
  objc_storeStrong((id *)&self->_flightStatus, 0);
  objc_storeStrong((id *)&self->_flightDivertedAirport, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportGate, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportGate, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportTerminal, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportTerminal, 0);
  objc_storeStrong((id *)&self->_flightConfirmationNumber, 0);
  objc_storeStrong((id *)&self->_flightCarrier, 0);
  objc_storeStrong((id *)&self->_flightBookingInfoUrl, 0);
  objc_storeStrong((id *)&self->_flightArrivalTimeZone, 0);
  objc_storeStrong((id *)&self->_flightDepartureTimeZone, 0);
  objc_storeStrong((id *)&self->_flightCheckInUrl, 0);
  objc_storeStrong((id *)&self->_flightNumber, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportCode, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportCode, 0);
  objc_storeStrong((id *)&self->_flightArrivalDateComponents, 0);
  objc_storeStrong((id *)&self->_flightDepartureDateComponents, 0);
  objc_storeStrong((id *)&self->_flightCarrierCode, 0);
}

- (id)initFlightAnswerWithCSInstantAnswer:(id)a3
{
  id v4;
  MUISearchInstantAnswer *v5;
  MUISearchInstantAnswer *v6;
  MUISearchInstantAnswer *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  NSString *flightCarrierCode;
  uint64_t v19;
  NSDateComponents *flightDepartureDateComponents;
  uint64_t v21;
  NSDateComponents *flightArrivalDateComponents;
  uint64_t v23;
  NSString *flightArrivalAirportCode;
  uint64_t v25;
  NSString *flightDepartureAirportCode;
  uint64_t v27;
  NSString *flightNumber;
  uint64_t v29;
  NSURL *flightCheckInUrl;
  uint64_t v31;
  NSTimeZone *flightDepartureTimeZone;
  uint64_t v33;
  NSTimeZone *flightArrivalTimeZone;
  uint64_t v35;
  NSURL *flightBookingInfoUrl;
  uint64_t v37;
  NSString *flightCarrier;
  uint64_t v39;
  NSString *flightConfirmationNumber;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  NSNumber *flightInfoIsLive;
  uint64_t v47;
  NSDateComponents *v48;
  uint64_t v49;
  NSDateComponents *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  _BOOL4 v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  NSObject *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  NSObject *v77;
  NSObject *v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  double v85;
  uint64_t j;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  _BOOL4 v105;
  uint64_t v106;
  NSNumber *v107;
  uint64_t v108;
  NSString *flightDepartureAirportTerminal;
  uint64_t v110;
  NSString *flightArrivalAirportTerminal;
  uint64_t v112;
  NSString *flightDepartureAirportGate;
  uint64_t v114;
  NSString *flightArrivalAirportGate;
  uint64_t v116;
  NSString *flightDivertedAirport;
  uint64_t v118;
  NSString *flightStatus;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  NSNumber *v124;
  MUISearchInstantAnswer *v125;
  int v126;
  NSObject *v127;
  uint64_t v128;
  NSNumber *v129;
  MUISearchInstantAnswer *v130;
  uint64_t v131;
  id *p_flightCheckInUrl;
  id *location;
  id *p_flightArrivalDateComponents;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  id obj;
  id obja;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  void *v148;
  id v149;
  id v150;
  MUISearchInstantAnswer *v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  objc_super v164;
  _BYTE v165[128];
  _BYTE v166[128];
  uint8_t v167[128];
  uint8_t buf[4];
  uint64_t v169;
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v164.receiver = self;
  v164.super_class = (Class)MUISearchInstantAnswer;
  v5 = -[MUISearchInstantAnswer init](&v164, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_93;
  -[MUISearchInstantAnswer initSearchInstantAnswer:](v5, v4);
  objc_msgSend(v4, "flightDepartureDateComponents");
  v7 = (MUISearchInstantAnswer *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_94;
  v151 = v6;
  objc_msgSend(v4, "flightArrivalDateComponents");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_13;
  v9 = (void *)v8;
  objc_msgSend(v4, "flightArrivalAirportCode");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  v11 = (void *)v10;
  objc_msgSend(v4, "flightArrivalAirportCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v12, "length") < 2
    || (objc_msgSend(v4, "flightDepartureAirportCode"), (v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_12;
  }
  v14 = (void *)v13;
  objc_msgSend(v4, "flightDepartureAirportCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16 < 2)
  {
LABEL_14:
    v7 = 0;
    v6 = v151;
    goto LABEL_94;
  }
  objc_msgSend(v4, "flightCarrierCode");
  v17 = objc_claimAutoreleasedReturnValue();
  v6 = v151;
  flightCarrierCode = v151->_flightCarrierCode;
  v151->_flightCarrierCode = (NSString *)v17;

  objc_msgSend(v4, "flightDepartureDateComponents");
  v19 = objc_claimAutoreleasedReturnValue();
  flightDepartureDateComponents = v151->_flightDepartureDateComponents;
  v151->_flightDepartureDateComponents = (NSDateComponents *)v19;

  objc_msgSend(v4, "flightArrivalDateComponents");
  v21 = objc_claimAutoreleasedReturnValue();
  flightArrivalDateComponents = v151->_flightArrivalDateComponents;
  v151->_flightArrivalDateComponents = (NSDateComponents *)v21;

  objc_msgSend(v4, "flightArrivalAirportCode");
  v23 = objc_claimAutoreleasedReturnValue();
  flightArrivalAirportCode = v151->_flightArrivalAirportCode;
  v151->_flightArrivalAirportCode = (NSString *)v23;

  objc_msgSend(v4, "flightDepartureAirportCode");
  v25 = objc_claimAutoreleasedReturnValue();
  flightDepartureAirportCode = v151->_flightDepartureAirportCode;
  v151->_flightDepartureAirportCode = (NSString *)v25;

  objc_msgSend(v4, "flightNumber");
  v27 = objc_claimAutoreleasedReturnValue();
  flightNumber = v151->_flightNumber;
  v151->_flightNumber = (NSString *)v27;

  objc_msgSend(v4, "flightCheckInUrl");
  v29 = objc_claimAutoreleasedReturnValue();
  flightCheckInUrl = v151->_flightCheckInUrl;
  v151->_flightCheckInUrl = (NSURL *)v29;

  objc_msgSend(v4, "flightDepartureTimeZone");
  v31 = objc_claimAutoreleasedReturnValue();
  flightDepartureTimeZone = v151->_flightDepartureTimeZone;
  v151->_flightDepartureTimeZone = (NSTimeZone *)v31;

  objc_msgSend(v4, "flightArrivalTimeZone");
  v33 = objc_claimAutoreleasedReturnValue();
  flightArrivalTimeZone = v151->_flightArrivalTimeZone;
  v151->_flightArrivalTimeZone = (NSTimeZone *)v33;

  objc_msgSend(v4, "flightBookingInfoUrl");
  v35 = objc_claimAutoreleasedReturnValue();
  flightBookingInfoUrl = v151->_flightBookingInfoUrl;
  v151->_flightBookingInfoUrl = (NSURL *)v35;

  objc_msgSend(v4, "flightCarrier");
  v37 = objc_claimAutoreleasedReturnValue();
  flightCarrier = v151->_flightCarrier;
  v151->_flightCarrier = (NSString *)v37;

  objc_msgSend(v4, "flightConfirmationNumber");
  v39 = objc_claimAutoreleasedReturnValue();
  flightConfirmationNumber = v151->_flightConfirmationNumber;
  v151->_flightConfirmationNumber = (NSString *)v39;

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v45 = objc_claimAutoreleasedReturnValue();
    flightInfoIsLive = v151->_flightInfoIsLive;
    v151->_flightInfoIsLive = (NSNumber *)v45;

    objc_msgSend(v4, "flightDepartureDateComponents");
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = v151->_flightDepartureDateComponents;
    v151->_flightDepartureDateComponents = (NSDateComponents *)v47;

    objc_msgSend(v4, "flightArrivalDateComponents");
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = v151->_flightArrivalDateComponents;
    v151->_flightArrivalDateComponents = (NSDateComponents *)v49;

LABEL_93:
    v7 = v6;
    goto LABEL_94;
  }
  p_flightArrivalDateComponents = (id *)&v151->_flightArrivalDateComponents;
  v41 = objc_alloc(MEMORY[0x1E0C99D48]);
  v136 = *MEMORY[0x1E0C996C8];
  v42 = (void *)objc_msgSend(v41, "initWithCalendarIdentifier:");
  objc_msgSend(v4, "flightDepartureTimeZone");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend(v4, "flightDepartureTimeZone");
    v44 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MUISearchInstantAnswer log]();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5522000, v51, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] Received nil flightDepartureTimeZone, using UTC timeZone to initialize Calendar", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
    v44 = objc_claimAutoreleasedReturnValue();
  }
  v52 = (void *)v44;
  objc_msgSend(v42, "setTimeZone:", v44);

  objc_msgSend(v4, "flightDepartureDateComponents");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "dateFromComponents:", v53);
  v54 = objc_claimAutoreleasedReturnValue();

  v55 = (void *)MEMORY[0x1E0D46DC0];
  objc_msgSend(v4, "flightCarrierCode");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flightNumber");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = (void *)v54;
  objc_msgSend(v55, "flightInformationWithAirlineCode:flightNumber:flightDate:", v56, v57, v54);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  +[MUISearchInstantAnswer log]();
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
  if (v58)
  {
    p_flightCheckInUrl = (id *)&v151->_flightCheckInUrl;
    location = (id *)&v151->_flightDepartureDateComponents;
    v138 = v42;
    v139 = v4;
    v6 = v151;
    if (v60)
    {
      v61 = objc_msgSend(v58, "count");
      *(_DWORD *)buf = 134217984;
      v169 = v61;
      _os_log_impl(&dword_1D5522000, v59, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] found %lu events from flights api response", buf, 0xCu);
    }

    v149 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    v137 = v58;
    obj = v58;
    v145 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v167, 16);
    if (v145)
    {
      v143 = *(_QWORD *)v161;
      do
      {
        v62 = 0;
        do
        {
          if (*(_QWORD *)v161 != v143)
            objc_enumerationMutation(obj);
          v147 = v62;
          objc_msgSend(*(id *)(*((_QWORD *)&v160 + 1) + 8 * v62), "objectForKey:", CFSTR("legs"), p_flightCheckInUrl, location, p_flightArrivalDateComponents);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v63;
          if (v63)
          {
            v158 = 0u;
            v159 = 0u;
            v156 = 0u;
            v157 = 0u;
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v156, v166, 16);
            if (v65)
            {
              v66 = v65;
              v67 = *(_QWORD *)v157;
              do
              {
                for (i = 0; i != v66; ++i)
                {
                  if (*(_QWORD *)v157 != v67)
                    objc_enumerationMutation(v64);
                  v69 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * i);
                  objc_msgSend(v69, "objectForKey:", CFSTR("departureAirport"));
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  v71 = v70;
                  if (v70)
                  {
                    objc_msgSend(v70, "objectForKey:", CFSTR("code"));
                    v72 = objc_claimAutoreleasedReturnValue();
                    v73 = v72;
                    if (v72)
                    {
                      if (-[NSObject isEqualToString:](v72, "isEqualToString:", v6->_flightDepartureAirportCode))
                      {
                        objc_msgSend(v69, "objectForKey:", CFSTR("departureActualTime"));
                        v74 = objc_claimAutoreleasedReturnValue();
                        if (v74)
                        {
                          v75 = (void *)v74;
                          objc_msgSend(v69, "objectForKey:", CFSTR("arrivalActualTime"));
                          v76 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v76)
                            objc_msgSend(v149, "addObject:", v69);
                          v6 = v151;
                        }
                      }
                    }
                    else
                    {
                      +[MUISearchInstantAnswer log]();
                      v77 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1D5522000, v77, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] found flight leg with no departure airport code", buf, 2u);
                      }

                    }
                  }
                  else
                  {
                    +[MUISearchInstantAnswer log]();
                    v73 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1D5522000, v73, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] found flight leg with no departure airport", buf, 2u);
                    }
                  }

                }
                v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v156, v166, 16);
              }
              while (v66);
            }
          }

          v62 = v147 + 1;
        }
        while (v147 + 1 != v145);
        v145 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v167, 16);
      }
      while (v145);
    }

    +[MUISearchInstantAnswer log]();
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      v79 = objc_msgSend(v149, "count");
      *(_DWORD *)buf = 134217984;
      v169 = v79;
      _os_log_impl(&dword_1D5522000, v78, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] found %lu flight legs with same departure airport and date", buf, 0xCu);
    }

    v154 = 0u;
    v155 = 0u;
    v152 = 0u;
    v153 = 0u;
    v80 = v149;
    v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v152, v165, 16);
    if (v81)
    {
      v82 = v81;
      v83 = 0;
      v84 = *(_QWORD *)v153;
      v85 = 1.79769313e308;
      do
      {
        for (j = 0; j != v82; ++j)
        {
          if (*(_QWORD *)v153 != v84)
            objc_enumerationMutation(v80);
          v87 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * j);
          objc_msgSend(v87, "objectForKey:", CFSTR("departurePublishedTime"), p_flightCheckInUrl);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          if (v88)
          {
            objc_opt_class();
            +[MUISearchInstantAnswer utcFormatter]();
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "dateFromString:", v88);
            v90 = (void *)objc_claimAutoreleasedReturnValue();

            if (v90 && (objc_msgSend(v90, "timeIntervalSinceDate:", v140), v92 = fabs(v91), v92 <= v85))
            {
              v93 = v87;

              v83 = v93;
            }
            else
            {
              v92 = v85;
            }

            v85 = v92;
          }

        }
        v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v152, v165, 16);
      }
      while (v82);

      if (v80)
      {
        v42 = v138;
        v4 = v139;
        v6 = v151;
        v58 = v137;
        if (v83)
        {
          objc_msgSend(v83, "objectForKey:", CFSTR("departureActualTime"));
          v94 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "objectForKey:", CFSTR("arrivalActualTime"));
          v95 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          +[MUISearchInstantAnswer utcFormatter]();
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          obja = (id)v94;
          objc_msgSend(v96, "dateFromString:", v94);
          v97 = objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          +[MUISearchInstantAnswer utcFormatter]();
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "dateFromString:", v95);
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v136);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "flightDepartureTimeZone");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "setTimeZone:", v101);

          objc_msgSend(v100, "components:fromDate:", 252, v97);
          v150 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "flightArrivalTimeZone");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "setTimeZone:", v102);

          v144 = v100;
          objc_msgSend(v100, "components:fromDate:", 252, v99);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          +[MUISearchInstantAnswer log]();
          v104 = objc_claimAutoreleasedReturnValue();
          v105 = os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT);
          v146 = (void *)v97;
          v148 = (void *)v95;
          if (v97 && v99)
          {
            if (v105)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D5522000, v104, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] successfully updated flight instant answer with live info.", buf, 2u);
            }

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
            v106 = objc_claimAutoreleasedReturnValue();
            v107 = v151->_flightInfoIsLive;
            v151->_flightInfoIsLive = (NSNumber *)v106;

            objc_storeStrong(location, v150);
            objc_storeStrong(p_flightArrivalDateComponents, v103);
            objc_msgSend(v83, "objectForKey:", CFSTR("departureTerminal"));
            v108 = objc_claimAutoreleasedReturnValue();
            flightDepartureAirportTerminal = v151->_flightDepartureAirportTerminal;
            v151->_flightDepartureAirportTerminal = (NSString *)v108;

            objc_msgSend(v83, "objectForKey:", CFSTR("arrivalTerminal"));
            v110 = objc_claimAutoreleasedReturnValue();
            flightArrivalAirportTerminal = v151->_flightArrivalAirportTerminal;
            v151->_flightArrivalAirportTerminal = (NSString *)v110;

            objc_msgSend(v83, "objectForKey:", CFSTR("departureGate"));
            v112 = objc_claimAutoreleasedReturnValue();
            flightDepartureAirportGate = v151->_flightDepartureAirportGate;
            v151->_flightDepartureAirportGate = (NSString *)v112;

            objc_msgSend(v83, "objectForKey:", CFSTR("arrivalGate"));
            v114 = objc_claimAutoreleasedReturnValue();
            flightArrivalAirportGate = v151->_flightArrivalAirportGate;
            v151->_flightArrivalAirportGate = (NSString *)v114;

            objc_msgSend(v83, "objectForKey:", CFSTR("divertedAirport"));
            v116 = objc_claimAutoreleasedReturnValue();
            flightDivertedAirport = v151->_flightDivertedAirport;
            v151->_flightDivertedAirport = (NSString *)v116;

            objc_msgSend(v83, "objectForKey:", CFSTR("status"));
            v118 = objc_claimAutoreleasedReturnValue();
            flightStatus = v151->_flightStatus;
            v151->_flightStatus = (NSString *)v118;

            objc_msgSend(v83, "objectForKey:", CFSTR("carrierWebsite"));
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = obja;
            if (v120 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v120);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              if (v122 && !*p_flightCheckInUrl)
                objc_storeStrong(p_flightCheckInUrl, v122);
            }
            else
            {
              v122 = 0;
            }

          }
          else
          {
            if (v105)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D5522000, v104, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] flightDepartureActualDate or flightArrivalActualDate is nil, skipping live info. update", buf, 2u);
            }

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
            v131 = objc_claimAutoreleasedReturnValue();
            v122 = v151->_flightInfoIsLive;
            v151->_flightInfoIsLive = (NSNumber *)v131;
            v121 = obja;
          }

          v126 = 0;
          v6 = v151;
LABEL_91:

          goto LABEL_92;
        }
LABEL_82:
        +[MUISearchInstantAnswer log]();
        v127 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D5522000, v127, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] no matching leg was found from flights api response", buf, 2u);
        }

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
        v128 = objc_claimAutoreleasedReturnValue();
        v129 = v6->_flightInfoIsLive;
        v6->_flightInfoIsLive = (NSNumber *)v128;

        v130 = v6;
        v126 = 1;
        goto LABEL_91;
      }
      v4 = v139;
      v6 = v151;
    }
    else
    {

      v83 = 0;
      v4 = v139;
    }
    v58 = v137;
    v42 = v138;
    goto LABEL_82;
  }
  v6 = v151;
  if (v60)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5522000, v59, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] flights api response is nil, skipping live info. update", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v123 = objc_claimAutoreleasedReturnValue();
  v124 = v151->_flightInfoIsLive;
  v151->_flightInfoIsLive = (NSNumber *)v123;

  v125 = v151;
  v83 = 0;
  v126 = 1;
LABEL_92:

  v7 = v6;
  if (!v126)
    goto LABEL_93;
LABEL_94:

  return v7;
}

- (NSString)flightCarrierCode
{
  return self->_flightCarrierCode;
}

- (NSDateComponents)flightDepartureDateComponents
{
  return self->_flightDepartureDateComponents;
}

- (NSDateComponents)flightArrivalDateComponents
{
  return self->_flightArrivalDateComponents;
}

- (NSString)flightArrivalAirportCode
{
  return self->_flightArrivalAirportCode;
}

- (NSString)flightDepartureAirportCode
{
  return self->_flightDepartureAirportCode;
}

- (NSString)flightNumber
{
  return self->_flightNumber;
}

- (NSURL)flightCheckInUrl
{
  return self->_flightCheckInUrl;
}

- (NSTimeZone)flightDepartureTimeZone
{
  return self->_flightDepartureTimeZone;
}

- (NSTimeZone)flightArrivalTimeZone
{
  return self->_flightArrivalTimeZone;
}

- (NSURL)flightBookingInfoUrl
{
  return self->_flightBookingInfoUrl;
}

- (NSString)flightCarrier
{
  return self->_flightCarrier;
}

- (NSString)flightConfirmationNumber
{
  return self->_flightConfirmationNumber;
}

- (NSString)flightDepartureAirportTerminal
{
  return self->_flightDepartureAirportTerminal;
}

- (NSString)flightArrivalAirportTerminal
{
  return self->_flightArrivalAirportTerminal;
}

- (NSString)flightDepartureAirportGate
{
  return self->_flightDepartureAirportGate;
}

- (NSString)flightArrivalAirportGate
{
  return self->_flightArrivalAirportGate;
}

- (NSString)flightDivertedAirport
{
  return self->_flightDivertedAirport;
}

- (NSString)flightStatus
{
  return self->_flightStatus;
}

- (NSNumber)flightInfoIsLive
{
  return self->_flightInfoIsLive;
}

- (id)initHotelAnswerWithCSInstantAnswer:(id)a3
{
  id v4;
  MUISearchInstantAnswer *v5;
  MUISearchInstantAnswer *v6;
  MUISearchInstantAnswer *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  NSString *hotelReservationId;
  uint64_t v14;
  NSString *hotelUnderName;
  uint64_t v16;
  NSDateComponents *hotelCheckinDateComponents;
  uint64_t v18;
  NSDateComponents *hotelCheckoutDateComponents;
  uint64_t v20;
  NSTimeZone *hotelTimeZone;
  uint64_t v22;
  NSString *hotelReservationForName;
  uint64_t v24;
  NSString *hotelReservationForTelephone;
  uint64_t v26;
  NSString *hotelReservationForAddress;
  const char *v28;
  uint64_t v29;
  NSString *hotelReservationForAddressLocality;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MUISearchInstantAnswer;
  v5 = -[MUISearchInstantAnswer init](&v32, sel_init);
  v6 = v5;
  if (!v5)
  {
LABEL_11:
    v7 = v6;
    goto LABEL_12;
  }
  -[MUISearchInstantAnswer initSearchInstantAnswer:](v5, v4);
  objc_msgSend(v4, "hotelCheckinDateComponents");
  v7 = (MUISearchInstantAnswer *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "hotelReservationForName");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v4, "hotelReservationForName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11 >= 2)
      {
        objc_msgSend(v4, "hotelReservationId");
        v12 = objc_claimAutoreleasedReturnValue();
        hotelReservationId = v6->_hotelReservationId;
        v6->_hotelReservationId = (NSString *)v12;

        objc_msgSend(v4, "hotelUnderName");
        v14 = objc_claimAutoreleasedReturnValue();
        hotelUnderName = v6->_hotelUnderName;
        v6->_hotelUnderName = (NSString *)v14;

        objc_msgSend(v4, "hotelCheckinDateComponents");
        v16 = objc_claimAutoreleasedReturnValue();
        hotelCheckinDateComponents = v6->_hotelCheckinDateComponents;
        v6->_hotelCheckinDateComponents = (NSDateComponents *)v16;

        objc_msgSend(v4, "hotelCheckoutDateComponents");
        v18 = objc_claimAutoreleasedReturnValue();
        hotelCheckoutDateComponents = v6->_hotelCheckoutDateComponents;
        v6->_hotelCheckoutDateComponents = (NSDateComponents *)v18;

        objc_msgSend(v4, "hotelTimeZone");
        v20 = objc_claimAutoreleasedReturnValue();
        hotelTimeZone = v6->_hotelTimeZone;
        v6->_hotelTimeZone = (NSTimeZone *)v20;

        objc_msgSend(v4, "hotelReservationForName");
        v22 = objc_claimAutoreleasedReturnValue();
        hotelReservationForName = v6->_hotelReservationForName;
        v6->_hotelReservationForName = (NSString *)v22;

        objc_msgSend(v4, "hotelReservationForTelephone");
        v24 = objc_claimAutoreleasedReturnValue();
        hotelReservationForTelephone = v6->_hotelReservationForTelephone;
        v6->_hotelReservationForTelephone = (NSString *)v24;

        objc_msgSend(v4, "hotelReservationForAddress");
        v26 = objc_claimAutoreleasedReturnValue();
        hotelReservationForAddress = v6->_hotelReservationForAddress;
        v6->_hotelReservationForAddress = (NSString *)v26;

        v28 = NSSelectorFromString(CFSTR("hotelReservationForAddressLocality"));
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v4, v28);
          v29 = objc_claimAutoreleasedReturnValue();
          hotelReservationForAddressLocality = v6->_hotelReservationForAddressLocality;
          v6->_hotelReservationForAddressLocality = (NSString *)v29;
        }
        else
        {
          hotelReservationForAddressLocality = v6->_hotelReservationForAddressLocality;
          v6->_hotelReservationForAddressLocality = (NSString *)&stru_1E99EB1C8;
        }

        goto LABEL_11;
      }
    }
    else
    {

    }
    v7 = 0;
  }
LABEL_12:

  return v7;
}

- (NSString)hotelReservationId
{
  return self->_hotelReservationId;
}

- (NSString)hotelUnderName
{
  return self->_hotelUnderName;
}

- (NSDateComponents)hotelCheckinDateComponents
{
  return self->_hotelCheckinDateComponents;
}

- (NSDateComponents)hotelCheckoutDateComponents
{
  return self->_hotelCheckoutDateComponents;
}

- (NSTimeZone)hotelTimeZone
{
  return self->_hotelTimeZone;
}

- (NSString)hotelReservationForName
{
  return self->_hotelReservationForName;
}

- (NSString)hotelReservationForTelephone
{
  return self->_hotelReservationForTelephone;
}

- (NSString)hotelReservationForAddress
{
  return self->_hotelReservationForAddress;
}

- (NSString)hotelReservationForAddressLocality
{
  return self->_hotelReservationForAddressLocality;
}

@end
