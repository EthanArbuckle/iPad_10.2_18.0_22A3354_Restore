@implementation HMDPhotoLibraryImportingPersonsImportedLogEvent

- (HMDPhotoLibraryImportingPersonsImportedLogEvent)initWithTotalNumberOfImportedPersons:(int64_t)a3 numberOfNamedImportedPersons:(int64_t)a4
{
  HMDPhotoLibraryImportingPersonsImportedLogEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDPhotoLibraryImportingPersonsImportedLogEvent;
  result = -[HMMLogEvent init](&v7, sel_init);
  if (result)
  {
    result->_totalNumberOfImportedPersons = a3;
    result->_numberOfNamedImportedPersons = a4;
  }
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.photoLibraryImporting.personsImported");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("totalNumberOfImportedPersons");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intervalIndexForValue:", -[HMDPhotoLibraryImportingPersonsImportedLogEvent totalNumberOfImportedPersons](self, "totalNumberOfImportedPersons"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("numberOfNamedImportedPersons");
  v10[0] = v4;
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intervalIndexForValue:", -[HMDPhotoLibraryImportingPersonsImportedLogEvent numberOfNamedImportedPersons](self, "numberOfNamedImportedPersons"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (int64_t)totalNumberOfImportedPersons
{
  return self->_totalNumberOfImportedPersons;
}

- (int64_t)numberOfNamedImportedPersons
{
  return self->_numberOfNamedImportedPersons;
}

@end
