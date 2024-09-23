@implementation CLGeocoder

- (void)_ticket:(id)a3 didReturnGeoMapItems:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_internal->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F5B8F18;
  block[3] = &unk_1E29911F8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)reverseGeocodeLocation:(id)a3 preferredLocale:(id)a4 heading:(double)a5 localResultsOnly:(BOOL)a6 completionHandler:(id)a7
{
  NSObject *queue;
  _QWORD v8[9];
  BOOL v9;

  queue = self->_internal->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F5BF77C;
  v8[3] = &unk_1E29924C0;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  v8[7] = a7;
  *(double *)&v8[8] = a5;
  v9 = a6;
  dispatch_async(queue, v8);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLGeocoder;
  -[CLGeocoder dealloc](&v3, sel_dealloc);
}

- (void)_notifyResult:(id)a3 error:(id)a4
{
  CLGeocoderInternal *internal;
  id geocodeCompletionHandler;
  void *v8;
  const char *v9;
  uint64_t v10;
  _QWORD v11[7];

  internal = self->_internal;
  geocodeCompletionHandler = internal->_geocodeCompletionHandler;
  internal->_geocodeCompletionHandler = 0;
  if (geocodeCompletionHandler)
  {
    v8 = (void *)objc_msgSend_responseSilo(self->_internal, a2, (uint64_t)a3, (uint64_t)a4);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18F5CD0D4;
    v11[3] = &unk_1E2990EA8;
    v11[5] = a4;
    v11[6] = geocodeCompletionHandler;
    v11[4] = a3;
    objc_msgSend_async_(v8, v9, (uint64_t)v11, v10);

  }
}

- (void)_notifyResult:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel__notifyResult_error_, a3, 0);
}

- (CLGeocoder)init
{
  CLGeocoder *v3;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!objc_opt_class())
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990870);
    v5 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2082;
      v14 = "assert";
      v15 = 2081;
      v16 = "[GEOMapService class]";
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Do not use CLGeocoder when GeoServices is missing\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990870);
    }
    v6 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289539;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2082;
      v14 = "assert";
      v15 = 2081;
      v16 = "[GEOMapService class]";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Do not use CLGeocoder when GeoServices is missing", "{\"msg%{public}.0s\":\"Do not use CLGeocoder when GeoServices is missing\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990870);
    }
    v7 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2082;
      v14 = "assert";
      v15 = 2081;
      v16 = "[GEOMapService class]";
      _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Do not use CLGeocoder when GeoServices is missing\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  v8.receiver = self;
  v8.super_class = (Class)CLGeocoder;
  v3 = -[CLGeocoder init](&v8, sel_init);
  if (v3)
    v3->_internal = objc_alloc_init(CLGeocoderInternal);
  return v3;
}

- (BOOL)isGeocoding
{
  CLGeocoderInternal *internal;

  internal = self->_internal;
  return internal && internal->_ticket != 0;
}

+ (id)_timeZoneAtLocation:(id)a3
{
  return (id)sub_18F6E0DB0((uint64_t)a3);
}

- (void)_setResponseSilo:(id)a3
{
  ((void (*)(CLGeocoderInternal *, char *, id))MEMORY[0x1E0DE7D20])(self->_internal, sel_setResponseSilo_, a3);
}

- (CLSilo)_responseSilo
{
  uint64_t v2;
  uint64_t v3;

  return (CLSilo *)objc_msgSend_responseSilo(self->_internal, a2, v2, v3);
}

- (void)reverseGeocodeLocation:(id)a3 localResultsOnly:(BOOL)a4 completionHandler:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_reverseGeocodeLocation_preferredLocale_heading_localResultsOnly_completionHandler_, a3, 0);
}

- (void)reverseGeocodeLocation:(CLLocation *)location completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
  MEMORY[0x1E0DE7D20](self, sel_reverseGeocodeLocation_preferredLocale_heading_localResultsOnly_completionHandler_, location, 0);
}

- (void)reverseGeocodeLocation:(CLLocation *)location preferredLocale:(NSLocale *)locale completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
  MEMORY[0x1E0DE7D20](self, sel_reverseGeocodeLocation_preferredLocale_heading_localResultsOnly_completionHandler_, location, locale);
}

- (void)reverseGeocodeLocation:(id)a3 heading:(double)a4 completionHandler:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_reverseGeocodeLocation_preferredLocale_heading_localResultsOnly_completionHandler_, a3, 0);
}

- (void)reverseGeocodeLocation:(id)a3 heading:(double)a4 localResultsOnly:(BOOL)a5 completionHandler:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel_reverseGeocodeLocation_preferredLocale_heading_localResultsOnly_completionHandler_, a3, 0);
}

- (void)geocodeAddressDictionary:(NSDictionary *)addressDictionary completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
  objc_msgSend_geocodeAddressDictionary_preferredLocale_completionHandler_(self, a2, (uint64_t)addressDictionary, 0, completionHandler);
}

- (void)geocodeAddressDictionary:(id)a3 preferredLocale:(id)a4 completionHandler:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_internal->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F6BF89C;
  v6[3] = &unk_1E2992510;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)geocodeAddressString:(NSString *)addressString completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
  MEMORY[0x1E0DE7D20](self, sel_geocodeAddressString_inRegion_preferredLocale_completionHandler_, addressString, 0);
}

- (void)geocodeAddressString:(NSString *)addressString inRegion:(CLRegion *)region completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
  MEMORY[0x1E0DE7D20](self, sel_geocodeAddressString_inRegion_preferredLocale_completionHandler_, addressString, region);
}

- (void)geocodeAddressString:(id)a3 inRegionCenteredAt:(CLLocationCoordinate2D)a4 inRegionRadius:(double)a5 preferredLocale:(id)a6 completionHandler:(id)a7
{
  double longitude;
  double latitude;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  CLCircularRegion *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, (uint64_t)a6);
  v17 = objc_msgSend_UUIDString(v13, v14, v15, v16);
  v20 = objc_msgSend_stringWithFormat_(v12, v18, (uint64_t)CFSTR("com.apple.CoreLocation.geocodeAddressStringRegion-%@"), v19, v17);
  v21 = [CLCircularRegion alloc];
  v24 = objc_msgSend_initWithCenter_radius_identifier_(v21, v22, v20, v23, latitude, longitude, a5);
  MEMORY[0x1E0DE7D20](self, sel_geocodeAddressString_inRegion_preferredLocale_completionHandler_, a3, v24);
}

- (void)geocodeAddressString:(NSString *)addressString inRegion:(CLRegion *)region preferredLocale:(NSLocale *)locale completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
  NSObject *queue;
  _QWORD block[9];

  queue = self->_internal->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F6BFBC4;
  block[3] = &unk_1E2992538;
  block[4] = region;
  block[5] = self;
  block[7] = locale;
  block[8] = completionHandler;
  block[6] = addressString;
  dispatch_async(queue, block);
}

+ (void)hydrateGeoMapItemLocallyFromHandle:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[6];

  if (a4)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = sub_18F6BFFD4;
    v4[3] = &unk_1E2990F20;
    v4[4] = a3;
    v4[5] = a4;
    dispatch_async(MEMORY[0x1E0C80D38], v4);
  }
}

- (void)cancelGeocode
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_internal->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F6C0158;
  block[3] = &unk_1E2990DE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_ticket:(id)a3 didReturnError:(id)a4 partialResultForLocation:(id)a5
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_internal->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F6C021C;
  block[3] = &unk_1E29911F8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)_ticket:(id)a3 didReturnError:(id)a4
{
  objc_msgSend__ticket_didReturnError_partialResultForLocation_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (void)_notifyPartialResult:(id)a3
{
  uint64_t v5;

  v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, (uint64_t)CFSTR("kCLErrorDomain"), 9, 0);
  MEMORY[0x1E0DE7D20](self, sel__notifyResult_error_, a3, v5);
}

- (void)_notifyNoResult
{
  uint64_t v3;

  v3 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, (uint64_t)CFSTR("kCLErrorDomain"), 8, 0);
  MEMORY[0x1E0DE7D20](self, sel__notifyResult_error_, 0, v3);
}

- (void)_notifyCancel
{
  uint64_t v3;

  v3 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, (uint64_t)CFSTR("kCLErrorDomain"), 10, 0);
  MEMORY[0x1E0DE7D20](self, sel__notifyResult_error_, 0, v3);
}

- (void)_notifyError:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, (uint64_t)CFSTR("kCLErrorDomain"), 2, 0);
  MEMORY[0x1E0DE7D20](self, sel__notifyResult_error_, 0, v4);
}

- (void)geocodePostalAddress:(CNPostalAddress *)postalAddress completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
  MEMORY[0x1E0DE7D20](self, sel_geocodePostalAddress_preferredLocale_completionHandler_, postalAddress, 0);
}

- (void)geocodePostalAddress:(CNPostalAddress *)postalAddress preferredLocale:(NSLocale *)locale completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  id v84;

  v84 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = (void *)objc_msgSend_street(postalAddress, v9, v10, v11);
  if (objc_msgSend_length(v12, v13, v14, v15))
  {
    v19 = objc_msgSend_street(postalAddress, v16, v17, v18);
    objc_msgSend_setObject_forKey_(v84, v20, v19, (uint64_t)CFSTR("Thoroughfare"));
  }
  v21 = (void *)objc_msgSend_subLocality(postalAddress, v16, v17, v18);
  if (objc_msgSend_length(v21, v22, v23, v24))
  {
    v28 = objc_msgSend_subLocality(postalAddress, v25, v26, v27);
    objc_msgSend_setObject_forKey_(v84, v29, v28, (uint64_t)CFSTR("SubLocality"));
  }
  v30 = (void *)objc_msgSend_city(postalAddress, v25, v26, v27);
  if (objc_msgSend_length(v30, v31, v32, v33))
  {
    v37 = objc_msgSend_city(postalAddress, v34, v35, v36);
    objc_msgSend_setObject_forKey_(v84, v38, v37, (uint64_t)CFSTR("City"));
  }
  v39 = (void *)objc_msgSend_subAdministrativeArea(postalAddress, v34, v35, v36);
  if (objc_msgSend_length(v39, v40, v41, v42))
  {
    v46 = objc_msgSend_subAdministrativeArea(postalAddress, v43, v44, v45);
    objc_msgSend_setObject_forKey_(v84, v47, v46, (uint64_t)CFSTR("SubAdministrativeArea"));
  }
  v48 = (void *)objc_msgSend_state(postalAddress, v43, v44, v45);
  if (objc_msgSend_length(v48, v49, v50, v51))
  {
    v55 = objc_msgSend_state(postalAddress, v52, v53, v54);
    objc_msgSend_setObject_forKey_(v84, v56, v55, (uint64_t)CFSTR("State"));
  }
  v57 = (void *)objc_msgSend_postalCode(postalAddress, v52, v53, v54);
  if (objc_msgSend_length(v57, v58, v59, v60))
  {
    v64 = objc_msgSend_postalCode(postalAddress, v61, v62, v63);
    objc_msgSend_setObject_forKey_(v84, v65, v64, (uint64_t)CFSTR("ZIP"));
  }
  v66 = (void *)objc_msgSend_country(postalAddress, v61, v62, v63);
  if (objc_msgSend_length(v66, v67, v68, v69))
  {
    v73 = objc_msgSend_country(postalAddress, v70, v71, v72);
    objc_msgSend_setObject_forKey_(v84, v74, v73, (uint64_t)CFSTR("Country"));
  }
  v75 = (void *)objc_msgSend_ISOCountryCode(postalAddress, v70, v71, v72);
  if (objc_msgSend_length(v75, v76, v77, v78))
  {
    v82 = objc_msgSend_ISOCountryCode(postalAddress, v79, v80, v81);
    objc_msgSend_setObject_forKey_(v84, v83, v82, (uint64_t)CFSTR("CountryCode"));
  }
  objc_msgSend_geocodeAddressDictionary_preferredLocale_completionHandler_(self, v79, (uint64_t)v84, (uint64_t)locale, completionHandler);

}

@end
