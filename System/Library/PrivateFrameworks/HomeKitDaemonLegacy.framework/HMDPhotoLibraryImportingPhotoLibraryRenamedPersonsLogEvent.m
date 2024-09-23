@implementation HMDPhotoLibraryImportingPhotoLibraryRenamedPersonsLogEvent

- (HMDPhotoLibraryImportingPhotoLibraryRenamedPersonsLogEvent)initWithNumberOfRenamedPersons:(int64_t)a3
{
  HMDPhotoLibraryImportingPhotoLibraryRenamedPersonsLogEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDPhotoLibraryImportingPhotoLibraryRenamedPersonsLogEvent;
  result = -[HMMLogEvent init](&v5, sel_init);
  if (result)
    result->_numberOfRenamedPersons = a3;
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.photoLibraryImporting.renamedPersons");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("numberOfRenamedPersons");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intervalIndexForValue:", -[HMDPhotoLibraryImportingPhotoLibraryRenamedPersonsLogEvent numberOfRenamedPersons](self, "numberOfRenamedPersons"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (int64_t)numberOfRenamedPersons
{
  return self->_numberOfRenamedPersons;
}

@end
