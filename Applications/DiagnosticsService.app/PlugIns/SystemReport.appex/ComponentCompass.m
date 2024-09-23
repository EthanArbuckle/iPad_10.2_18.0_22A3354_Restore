@implementation ComponentCompass

- (void)populateAttributes:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ComponentCompass;
  -[ComponentBase populateAttributes:](&v6, "populateAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCompass backglassCompassSerialNumber](self, "backglassCompassSerialNumber"));
  if (v5)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("backglassCompassSerialNumber"));

}

- (BOOL)isPresent
{
  return findDeviceWithName("compass");
}

- (id)backglassCompassSerialNumber
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v7;
  uint8_t buf[4];
  void *v9;

  v7 = 0;
  v2 = (void *)ZhuGeCopyValue(CFSTR("BackglassCompassSerialNumber"), 0, 0, &v7);
  v3 = v7;
  if (!v2)
  {
    v4 = DiagnosticLogHandleForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error getting BackglassCompassSerialNumber: %@", buf, 0xCu);
    }

  }
  return v2;
}

@end
