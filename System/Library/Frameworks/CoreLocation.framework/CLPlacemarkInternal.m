@implementation CLPlacemarkInternal

- (CLPlacemarkInternal)init
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!objc_opt_class())
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990930);
    v4 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "[GEOLocation class]";
      _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Do not use CLPlaceMark when GeoServices is missing\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990930);
    }
    v5 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "[GEOLocation class]";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Do not use CLPlaceMark when GeoServices is missing", "{\"msg%{public}.0s\":\"Do not use CLPlaceMark when GeoServices is missing\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990930);
    }
    v6 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "[GEOLocation class]";
      _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Do not use CLPlaceMark when GeoServices is missing\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  v7.receiver = self;
  v7.super_class = (Class)CLPlacemarkInternal;
  return -[CLPlacemarkInternal init](&v7, sel_init);
}

@end
