@implementation HKOntologyShardRegistryEntry

- (HKOntologyShardRegistryEntry)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKOntologyShardRegistryEntry)initWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 settings:(unint64_t)a6 slot:(int64_t)a7 desiredState:(int64_t)a8 desiredStateDate:(id)a9 currentVersion:(int64_t)a10 currentVersionDate:(id)a11 currentRegion:(id)a12 currentRegionDate:(id)a13 currentLocale:(id)a14 currentLocaleDate:(id)a15 availableVersion:(int64_t)a16 availableVersionDate:(id)a17 availableRegion:(id)a18 availableRegionDate:(id)a19 availableLocale:(id)a20 availableLocaleDate:(id)a21 availableURL:(id)a22 availableURLDate:(id)a23 availableChecksum:(id)a24 availableChecksumDate:(id)a25 availableSize:(int64_t)a26 availableSizeDate:(id)a27 availableState:(int64_t)a28 availableStateDate:(id)a29
{
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  HKOntologyShardRegistryEntry *v39;
  uint64_t v40;
  NSString *identifier;
  uint64_t v42;
  NSString *schemaType;
  uint64_t v44;
  NSDate *desiredStateDate;
  uint64_t v46;
  NSDate *currentVersionDate;
  uint64_t v48;
  NSString *currentRegion;
  uint64_t v50;
  NSDate *currentRegionDate;
  uint64_t v52;
  NSString *currentLocale;
  uint64_t v54;
  NSDate *currentLocaleDate;
  uint64_t v56;
  NSDate *availableVersionDate;
  uint64_t v58;
  NSString *availableRegion;
  uint64_t v60;
  NSDate *availableRegionDate;
  uint64_t v62;
  NSString *availableLocale;
  uint64_t v64;
  NSDate *availableLocaleDate;
  uint64_t v66;
  NSURL *availableURL;
  uint64_t v68;
  NSDate *availableURLDate;
  uint64_t v70;
  NSString *availableChecksum;
  uint64_t v72;
  NSDate *availableChecksumDate;
  uint64_t v74;
  NSDate *availableSizeDate;
  uint64_t v76;
  NSDate *availableStateDate;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  objc_super v94;

  v93 = a3;
  v92 = a4;
  v91 = a9;
  v30 = a11;
  v31 = a12;
  v32 = a13;
  v33 = a14;
  v34 = a15;
  v35 = a17;
  v36 = a18;
  v37 = a19;
  v38 = a20;
  v90 = a21;
  v89 = a22;
  v88 = a23;
  v87 = a24;
  v86 = a25;
  v85 = a27;
  v84 = a29;
  v94.receiver = self;
  v94.super_class = (Class)HKOntologyShardRegistryEntry;
  v39 = -[HKOntologyShardRegistryEntry init](&v94, sel_init);
  if (v39)
  {
    v40 = objc_msgSend(v93, "copy");
    identifier = v39->_identifier;
    v39->_identifier = (NSString *)v40;

    v42 = objc_msgSend(v92, "copy");
    schemaType = v39->_schemaType;
    v39->_schemaType = (NSString *)v42;

    v39->_schemaVersion = a5;
    v39->_settings = a6;
    v39->_slot = a7;
    v39->_desiredState = a8;
    v44 = objc_msgSend(v91, "copy");
    desiredStateDate = v39->_desiredStateDate;
    v39->_desiredStateDate = (NSDate *)v44;

    v39->_currentVersion = a10;
    v46 = objc_msgSend(v30, "copy");
    currentVersionDate = v39->_currentVersionDate;
    v39->_currentVersionDate = (NSDate *)v46;

    v48 = objc_msgSend(v31, "copy");
    currentRegion = v39->_currentRegion;
    v39->_currentRegion = (NSString *)v48;

    v50 = objc_msgSend(v32, "copy");
    currentRegionDate = v39->_currentRegionDate;
    v39->_currentRegionDate = (NSDate *)v50;

    v52 = objc_msgSend(v33, "copy");
    currentLocale = v39->_currentLocale;
    v39->_currentLocale = (NSString *)v52;

    v54 = objc_msgSend(v34, "copy");
    currentLocaleDate = v39->_currentLocaleDate;
    v39->_currentLocaleDate = (NSDate *)v54;

    v39->_availableVersion = a16;
    v56 = objc_msgSend(v35, "copy");
    availableVersionDate = v39->_availableVersionDate;
    v39->_availableVersionDate = (NSDate *)v56;

    v58 = objc_msgSend(v36, "copy");
    availableRegion = v39->_availableRegion;
    v39->_availableRegion = (NSString *)v58;

    v60 = objc_msgSend(v37, "copy");
    availableRegionDate = v39->_availableRegionDate;
    v39->_availableRegionDate = (NSDate *)v60;

    v62 = objc_msgSend(v38, "copy");
    availableLocale = v39->_availableLocale;
    v39->_availableLocale = (NSString *)v62;

    v64 = objc_msgSend(v90, "copy");
    availableLocaleDate = v39->_availableLocaleDate;
    v39->_availableLocaleDate = (NSDate *)v64;

    v66 = objc_msgSend(v89, "copy");
    availableURL = v39->_availableURL;
    v39->_availableURL = (NSURL *)v66;

    v68 = objc_msgSend(v88, "copy");
    availableURLDate = v39->_availableURLDate;
    v39->_availableURLDate = (NSDate *)v68;

    v70 = objc_msgSend(v87, "copy");
    availableChecksum = v39->_availableChecksum;
    v39->_availableChecksum = (NSString *)v70;

    v72 = objc_msgSend(v86, "copy");
    availableChecksumDate = v39->_availableChecksumDate;
    v39->_availableChecksumDate = (NSDate *)v72;

    v39->_availableSize = a26;
    v74 = objc_msgSend(v85, "copy");
    availableSizeDate = v39->_availableSizeDate;
    v39->_availableSizeDate = (NSDate *)v74;

    v39->_availableState = a28;
    v76 = objc_msgSend(v84, "copy");
    availableStateDate = v39->_availableStateDate;
    v39->_availableStateDate = (NSDate *)v76;

  }
  return v39;
}

- (id)description
{
  NSString *identifier;
  NSString *schemaType;
  int64_t schemaVersion;
  void *v6;
  int64_t slot;
  __CFString *v8;
  void *v9;
  int64_t currentVersion;
  int64_t availableVersion;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v15 = objc_opt_class();
  identifier = self->_identifier;
  schemaType = self->_schemaType;
  schemaVersion = self->_schemaVersion;
  HKStringFromOntologyShardSettings(self->_settings);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  slot = self->_slot;
  if (slot == -1)
  {
    v8 = CFSTR("none");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_slot);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  HKStringFromOntologyShardState(self->_desiredState);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  currentVersion = self->_currentVersion;
  availableVersion = self->_availableVersion;
  HKStringFromOntologyShardState(self->_availableState);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: (%@:%@:%ld), %@, %@, %@, %ld, %ld, %@>"), v15, identifier, schemaType, schemaVersion, v6, v8, v9, currentVersion, availableVersion, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (slot != -1)
  return v13;
}

- (id)debugDescription
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSURL *availableURL;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSString *availableChecksum;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int64_t availableSize;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSString *availableLocale;
  NSString *availableRegion;
  NSString *currentLocale;
  NSString *currentRegion;
  uint64_t v39;
  uint64_t v40;
  int64_t schemaVersion;
  NSString *schemaType;
  NSString *identifier;
  uint64_t v44;
  void *v45;
  __CFString *v46;
  int64_t slot;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;

  v45 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  identifier = self->_identifier;
  v44 = v3;
  schemaVersion = self->_schemaVersion;
  schemaType = self->_schemaType;
  HKStringFromOntologyShardSettings(self->_settings);
  v4 = objc_claimAutoreleasedReturnValue();
  slot = self->_slot;
  v48 = (void *)v4;
  if (slot == -1)
  {
    v46 = CFSTR("none");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  HKStringFromOntologyShardState(self->_desiredState);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate(self->_desiredStateDate);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](self->_desiredStateDate, "timeIntervalSinceReferenceDate");
  v40 = v5;
  HKStringFromOntologyShardVersion(self->_currentVersion);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate(self->_currentVersionDate);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](self->_currentVersionDate, "timeIntervalSinceReferenceDate");
  v39 = v6;
  currentRegion = self->_currentRegion;
  HKDiagnosticStringFromDate(self->_currentRegionDate);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](self->_currentRegionDate, "timeIntervalSinceReferenceDate");
  v8 = v7;
  currentLocale = self->_currentLocale;
  HKDiagnosticStringFromDate(self->_currentLocaleDate);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](self->_currentLocaleDate, "timeIntervalSinceReferenceDate");
  v10 = v9;
  HKStringFromOntologyShardVersion(self->_availableVersion);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate(self->_availableVersionDate);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](self->_availableVersionDate, "timeIntervalSinceReferenceDate");
  v12 = v11;
  availableRegion = self->_availableRegion;
  HKDiagnosticStringFromDate(self->_availableRegionDate);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](self->_availableRegionDate, "timeIntervalSinceReferenceDate");
  v14 = v13;
  availableLocale = self->_availableLocale;
  HKDiagnosticStringFromDate(self->_availableLocaleDate);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](self->_availableLocaleDate, "timeIntervalSinceReferenceDate");
  v16 = v15;
  availableURL = self->_availableURL;
  HKDiagnosticStringFromDate(self->_availableURLDate);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](self->_availableURLDate, "timeIntervalSinceReferenceDate");
  v20 = v19;
  availableChecksum = self->_availableChecksum;
  HKDiagnosticStringFromDate(self->_availableChecksumDate);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](self->_availableChecksumDate, "timeIntervalSinceReferenceDate");
  v24 = v23;
  availableSize = self->_availableSize;
  if (availableSize == -1)
  {
    v26 = CFSTR("unknown");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_availableSize);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  HKDiagnosticStringFromDate(self->_availableSizeDate);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](self->_availableSizeDate, "timeIntervalSinceReferenceDate");
  v29 = v28;
  HKStringFromOntologyShardState(self->_availableState);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate(self->_availableStateDate);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](self->_availableStateDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v45, "stringWithFormat:", CFSTR("<%@:%p id: %@, schema: %@, scheamVersion: %ld, settings:%@, slot:%@, desired:%@, desiredDate:\"%@\" (%f), currentVersion:%@, currentVersionDate:\"%@\" (%f), currentRegion:%@, currentRegionDate:\"%@\" (%f), currentLocale:%@, currentLocaleDate:\"%@\" (%f), availableVersion:%@, availableVersionDate:\"%@\" (%f), availableRegion:%@, availableRegionDate:\"%@\" (%f), availableLocale:%@, availableLocaleDate:\"%@\" (%f), availableURL:%@, availableURLDate:\"%@\" (%f), availableChecksum:%@, availableChecksumDate:\"%@\" (%f), availableSize:%@, availableSizeDate:\"%@\" (%f), availableState:%@, availableStateDate:\"%@\" (%f)>"), v44, self, identifier, schemaType, schemaVersion, v48, v46, v58, v57, v40, v56, v55, v39, currentRegion, v54, v8,
    currentLocale,
    v53,
    v10,
    v52,
    v51,
    v12,
    availableRegion,
    v50,
    v14,
    availableLocale,
    v49,
    v16,
    availableURL,
    v18,
    v20,
    availableChecksum,
    v22,
    v24,
    v26,
    v27,
    v29,
    v30,
    v31,
    v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (availableSize != -1)
  if (slot != -1)

  return v33;
}

- (HKOntologyShardRegistryEntry)initWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 desiredState:(int64_t)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  HKOntologyShardRegistryEntry *v14;

  v10 = (void *)MEMORY[0x1E0C99D68];
  v11 = a4;
  v12 = a3;
  objc_msgSend(v10, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKOntologyShardRegistryEntry initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:](self, "initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:", v12, v11, a5, 0, -1, a6, v13, 0, v13, CFSTR("XX"), v13, 0, v13, -1,
          v13,
          CFSTR("XX"),
          v13,
          0,
          v13,
          0,
          v13,
          0,
          v13,
          -1,
          v13,
          0,
          v13);

  return v14;
}

- (HKOntologyShardRegistryEntry)initWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 availableURL:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HKOntologyShardRegistryEntry *v15;

  v10 = (void *)MEMORY[0x1E0C99D68];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKOntologyShardRegistryEntry initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:](self, "initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:", v13, v12, a5, 0, -1, 3, v14, 0, v14, CFSTR("XX"), v14, 0, v14, -1,
          v14,
          CFSTR("XX"),
          v14,
          0,
          v14,
          v11,
          v14,
          0,
          v14,
          -1,
          v14,
          1,
          v14);

  return v15;
}

- (HKOntologyShardRegistryEntry)initWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 availableVersion:(int64_t)a6 availableRegion:(id)a7 availableLocale:(id)a8 availableURL:(id)a9 availableChecksum:(id)a10 availableSize:(int64_t)a11 date:(id)a12
{
  return -[HKOntologyShardRegistryEntry initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:](self, "initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:", a3, a4, a5, 0, -1, 0, a12, 0, a12, CFSTR("XX"), a12, 0, a12, a6,
           a12,
           a7,
           a12,
           a8,
           a12,
           a9,
           a12,
           a10,
           a12,
           a11,
           a12,
           1,
           a12);
}

- (HKOntologyShardRegistryEntry)initWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 availableVersion:(int64_t)a6 date:(id)a7
{
  return -[HKOntologyShardRegistryEntry initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:](self, "initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:", a3, a4, a5, 0, -1, 0, a7, -1, a7, CFSTR("XX"), a7, 0, a7, a6,
           a7,
           CFSTR("XX"),
           a7,
           0,
           a7,
           0,
           a7,
           0,
           a7,
           -1,
           a7,
           2,
           a7);
}

- (id)copyWithAvailableState:(int64_t)a3
{
  HKOntologyShardRegistryEntry *v4;
  uint64_t v5;
  NSDate *availableStateDate;

  v4 = -[HKOntologyShardRegistryEntry _copy](self);
  v4->_availableState = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = objc_claimAutoreleasedReturnValue();
  availableStateDate = v4->_availableStateDate;
  v4->_availableStateDate = (NSDate *)v5;

  return v4;
}

- (HKOntologyShardRegistryEntry)_copy
{
  if (result)
    return -[HKOntologyShardRegistryEntry initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:]([HKOntologyShardRegistryEntry alloc], "initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:", result->_identifier, result->_schemaType, result->_schemaVersion, result->_settings, result->_slot, result->_desiredState, result->_desiredStateDate, result->_currentVersion, result->_currentVersionDate, result->_currentRegion, result->_currentRegionDate, result->_currentLocale, result->_currentLocaleDate, result->_availableVersion,
             result->_availableVersionDate,
             result->_availableRegion,
             result->_availableRegionDate,
             result->_availableLocale,
             result->_availableLocaleDate,
             result->_availableURL,
             result->_availableURLDate,
             result->_availableChecksum,
             result->_availableChecksumDate,
             result->_availableSize,
             result->_availableSizeDate,
             result->_availableState,
             result->_availableStateDate);
  return result;
}

- (id)copyWithAvailableVersion:(int64_t)a3
{
  HKOntologyShardRegistryEntry *v4;
  uint64_t v5;
  NSDate *availableVersionDate;

  v4 = -[HKOntologyShardRegistryEntry _copy](self);
  v4->_availableVersion = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = objc_claimAutoreleasedReturnValue();
  availableVersionDate = v4->_availableVersionDate;
  v4->_availableVersionDate = (NSDate *)v5;

  return v4;
}

- (id)copyWithAvailableVersion:(int64_t)a3 availableState:(int64_t)a4
{
  NSDate *v7;
  HKOntologyShardRegistryEntry *v8;
  NSDate *availableStateDate;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKOntologyShardRegistryEntry _copy](self);
  v8->_availableVersion = a3;
  objc_storeStrong((id *)&v8->_availableVersionDate, v7);
  availableStateDate = v8->_availableStateDate;
  v8->_availableState = a4;
  v8->_availableStateDate = v7;

  return v8;
}

- (id)copyWithAvailableStateImported
{
  NSDate *v3;
  HKOntologyShardRegistryEntry *v4;
  NSDate *availableStateDate;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKOntologyShardRegistryEntry _copy](self);
  v4->_currentVersion = v4->_availableVersion;
  objc_storeStrong((id *)&v4->_currentVersionDate, v3);
  objc_storeStrong((id *)&v4->_currentRegion, v4->_availableRegion);
  objc_storeStrong((id *)&v4->_currentRegionDate, v3);
  objc_storeStrong((id *)&v4->_currentLocale, v4->_availableLocale);
  objc_storeStrong((id *)&v4->_currentLocaleDate, v3);
  availableStateDate = v4->_availableStateDate;
  v4->_availableState = 3;
  v4->_availableStateDate = v3;

  return v4;
}

- (id)copyWithAvailableStateNotImportedForDate:(id)a3
{
  id v5;
  HKOntologyShardRegistryEntry *v6;
  NSString *currentLocale;

  v5 = a3;
  v6 = -[HKOntologyShardRegistryEntry _copy](self);
  v6->_slot = -1;
  v6->_currentVersion = 0;
  objc_storeStrong((id *)&v6->_currentVersionDate, a3);
  objc_storeStrong((id *)&v6->_currentRegion, CFSTR("XX"));
  objc_storeStrong((id *)&v6->_currentRegionDate, a3);
  currentLocale = v6->_currentLocale;
  v6->_currentLocale = 0;

  objc_storeStrong((id *)&v6->_currentLocaleDate, a3);
  if (self->_availableState == 3)
  {
    v6->_availableState = 1;
    objc_storeStrong((id *)&v6->_availableStateDate, a3);
  }

  return v6;
}

- (id)copyWithCurrentVersionUndeterminedForDate:(id)a3
{
  NSDate *v5;
  HKOntologyShardRegistryEntry *v6;
  NSString *currentLocale;
  NSDate *currentLocaleDate;

  v5 = (NSDate *)a3;
  v6 = -[HKOntologyShardRegistryEntry _copy](self);
  v6->_currentVersion = -1;
  objc_storeStrong((id *)&v6->_currentVersionDate, a3);
  objc_storeStrong((id *)&v6->_currentRegion, CFSTR("XX"));
  objc_storeStrong((id *)&v6->_currentRegionDate, a3);
  currentLocale = v6->_currentLocale;
  v6->_currentLocale = 0;

  currentLocaleDate = v6->_currentLocaleDate;
  v6->_currentLocaleDate = v5;

  return v6;
}

- (id)copyWithDesiredState:(int64_t)a3
{
  uint64_t v5;
  HKOntologyShardRegistryEntry *v6;
  NSDate *desiredStateDate;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[HKOntologyShardRegistryEntry _copy](self);
  desiredStateDate = v6->_desiredStateDate;
  v6->_desiredState = a3;
  v6->_desiredStateDate = (NSDate *)v5;

  return v6;
}

- (id)copyWithSlot:(int64_t)a3
{
  id result;

  result = -[HKOntologyShardRegistryEntry _copy](self);
  *((_QWORD *)result + 5) = a3;
  return result;
}

- (id)updatedCopyWithAvailableVersion:(int64_t)a3 availableRegion:(id)a4 availableLocale:(id)a5 availableURL:(id)a6 availableChecksum:(id)a7 availableSize:(int64_t)a8 date:(id)a9
{
  NSString *v13;
  NSString *v14;
  int64_t availableVersion;
  NSString *availableRegion;
  int v17;
  NSString *availableLocale;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  NSString *v26;
  void *v27;
  int v28;
  int v29;
  NSString *availableChecksum;
  int v31;
  int64_t availableSize;
  HKOntologyShardRegistryEntry *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSString *v37;
  uint64_t v39;
  NSString *v40;
  uint64_t v41;
  NSString *v42;
  uint64_t v43;
  NSURL *availableURL;
  int64_t v45;
  id v48;
  NSString *v49;
  id v50;
  NSString *v51;

  v13 = (NSString *)a4;
  v51 = (NSString *)a5;
  v50 = a6;
  v49 = (NSString *)a7;
  v14 = v13;
  v48 = a9;
  availableVersion = self->_availableVersion;
  availableRegion = self->_availableRegion;
  if (availableRegion == v13)
  {
    v17 = 1;
  }
  else if (availableRegion)
  {
    v17 = -[NSString isEqualToString:](v13, "isEqualToString:");
  }
  else
  {
    v17 = 0;
  }
  availableLocale = self->_availableLocale;
  if (availableLocale == v51)
  {
    v19 = 1;
  }
  else if (availableLocale)
  {
    v19 = -[NSString isEqualToString:](v51, "isEqualToString:");
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v50, "absoluteString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL absoluteString](self->_availableURL, "absoluteString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 == v21)
  {
    v29 = 1;
  }
  else
  {
    v45 = availableVersion;
    -[NSURL absoluteString](self->_availableURL, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v50, "absoluteString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL absoluteString](self->_availableURL, "absoluteString");
      v24 = v19;
      v25 = v17;
      v26 = v14;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v23, "isEqualToString:", v27);

      v14 = v26;
      v17 = v25;
      v19 = v24;
      v29 = v28;

    }
    else
    {
      v29 = 0;
    }

    availableVersion = v45;
  }

  availableChecksum = self->_availableChecksum;
  if (availableChecksum == v49)
  {
    v31 = 1;
  }
  else if (availableChecksum)
  {
    v31 = -[NSString isEqualToString:](v49, "isEqualToString:");
  }
  else
  {
    v31 = 0;
  }
  availableSize = self->_availableSize;
  if (availableVersion == a3
    && ((v17 ^ 1) & 1) == 0
    && ((v19 ^ 1) & 1) == 0
    && ((v29 ^ 1) & 1) == 0
    && v31
    && availableSize == a8)
  {
    v33 = self;
    goto LABEL_40;
  }
  v33 = -[HKOntologyShardRegistryEntry _copy](self);
  v34 = (void *)objc_msgSend(v48, "copy");
  v35 = v34;
  if (availableVersion == a3)
  {
    if ((v17 & 1) != 0)
      goto LABEL_31;
  }
  else
  {
    v33->_availableVersion = a3;
    objc_storeStrong((id *)&v33->_availableVersionDate, v34);
    if ((v17 & 1) != 0)
    {
LABEL_31:
      if ((v19 & 1) != 0)
        goto LABEL_32;
      goto LABEL_43;
    }
  }
  v39 = -[NSString copy](v14, "copy");
  v40 = v33->_availableRegion;
  v33->_availableRegion = (NSString *)v39;

  objc_storeStrong((id *)&v33->_availableRegionDate, v35);
  if ((v19 & 1) != 0)
  {
LABEL_32:
    if ((v29 & 1) != 0)
      goto LABEL_33;
LABEL_44:
    v43 = objc_msgSend(v50, "copy");
    availableURL = v33->_availableURL;
    v33->_availableURL = (NSURL *)v43;

    objc_storeStrong((id *)&v33->_availableURLDate, v35);
    if ((v31 & 1) != 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_43:
  v41 = -[NSString copy](v51, "copy");
  v42 = v33->_availableLocale;
  v33->_availableLocale = (NSString *)v41;

  objc_storeStrong((id *)&v33->_availableLocaleDate, v35);
  if ((v29 & 1) == 0)
    goto LABEL_44;
LABEL_33:
  if ((v31 & 1) == 0)
  {
LABEL_34:
    v36 = -[NSString copy](v49, "copy");
    v37 = v33->_availableChecksum;
    v33->_availableChecksum = (NSString *)v36;

    objc_storeStrong((id *)&v33->_availableChecksumDate, v35);
  }
LABEL_35:
  if (availableSize != a8)
  {
    v33->_availableSize = a8;
    objc_storeStrong((id *)&v33->_availableSizeDate, v35);
  }
  if (self->_availableState != 1)
  {
    v33->_availableState = 1;
    objc_storeStrong((id *)&v33->_availableStateDate, v35);
  }

LABEL_40:
  return v33;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[NSString hash](self->_schemaType, "hash") ^ v3 ^ self->_schemaVersion;
}

- (BOOL)isEqual:(id)a3
{
  HKOntologyShardRegistryEntry *v4;
  HKOntologyShardRegistryEntry *v5;
  NSString *identifier;
  NSString *v7;
  NSString *schemaType;
  NSString *v9;
  BOOL v10;

  v4 = (HKOntologyShardRegistryEntry *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      v7 = v5->_identifier;
      v10 = (identifier == v7 || v7 && -[NSString isEqualToString:](identifier, "isEqualToString:"))
         && ((schemaType = self->_schemaType, v9 = v5->_schemaType, schemaType == v9)
          || v9 && -[NSString isEqualToString:](schemaType, "isEqualToString:"))
         && self->_schemaVersion == v5->_schemaVersion;

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_schemaType, CFSTR("schema"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_schemaVersion, CFSTR("schemaVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_settings, CFSTR("settings"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_slot, CFSTR("slot"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_desiredState, CFSTR("desired_state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_desiredStateDate, CFSTR("desired_state_date"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_currentVersion, CFSTR("current_version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentVersionDate, CFSTR("current_version_date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentRegion, CFSTR("current_region"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentRegionDate, CFSTR("current_region_date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentLocale, CFSTR("current_locale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentLocaleDate, CFSTR("current_locale_date"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_availableVersion, CFSTR("available_version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableVersionDate, CFSTR("available_version_date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableRegion, CFSTR("available_region"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableRegionDate, CFSTR("available_region_date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableLocale, CFSTR("available_locale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableLocaleDate, CFSTR("available_locale_date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableURL, CFSTR("available_url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableURLDate, CFSTR("available_url_date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableChecksum, CFSTR("available_checksum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableChecksumDate, CFSTR("available_checksum_date"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_availableSize, CFSTR("available_size"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableSizeDate, CFSTR("available_size_date"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_availableState, CFSTR("available_state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableStateDate, CFSTR("available_state_date"));

}

- (HKOntologyShardRegistryEntry)initWithCoder:(id)a3
{
  id v4;
  HKOntologyShardRegistryEntry *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *schemaType;
  uint64_t v10;
  NSDate *desiredStateDate;
  uint64_t v12;
  NSDate *currentVersionDate;
  uint64_t v14;
  NSString *currentRegion;
  uint64_t v16;
  NSDate *currentRegionDate;
  uint64_t v18;
  NSString *currentLocale;
  uint64_t v20;
  NSDate *currentLocaleDate;
  uint64_t v22;
  NSDate *availableVersionDate;
  uint64_t v24;
  NSString *availableRegion;
  uint64_t v26;
  NSDate *availableRegionDate;
  uint64_t v28;
  NSString *availableLocale;
  uint64_t v30;
  NSDate *availableLocaleDate;
  uint64_t v32;
  NSURL *availableURL;
  uint64_t v34;
  NSDate *availableURLDate;
  uint64_t v36;
  NSString *availableChecksum;
  uint64_t v38;
  NSDate *availableChecksumDate;
  uint64_t v40;
  NSDate *availableSizeDate;
  uint64_t v42;
  NSDate *availableStateDate;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)HKOntologyShardRegistryEntry;
  v5 = -[HKOntologyShardRegistryEntry init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("schema"));
    v8 = objc_claimAutoreleasedReturnValue();
    schemaType = v5->_schemaType;
    v5->_schemaType = (NSString *)v8;

    v5->_schemaVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("schemaVersion"));
    v5->_settings = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("settings"));
    v5->_slot = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("slot"));
    v5->_desiredState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("desired_state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("desired_state_date"));
    v10 = objc_claimAutoreleasedReturnValue();
    desiredStateDate = v5->_desiredStateDate;
    v5->_desiredStateDate = (NSDate *)v10;

    v5->_currentVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("current_version"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("current_version_date"));
    v12 = objc_claimAutoreleasedReturnValue();
    currentVersionDate = v5->_currentVersionDate;
    v5->_currentVersionDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("current_region"));
    v14 = objc_claimAutoreleasedReturnValue();
    currentRegion = v5->_currentRegion;
    v5->_currentRegion = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("current_region_date"));
    v16 = objc_claimAutoreleasedReturnValue();
    currentRegionDate = v5->_currentRegionDate;
    v5->_currentRegionDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("current_locale"));
    v18 = objc_claimAutoreleasedReturnValue();
    currentLocale = v5->_currentLocale;
    v5->_currentLocale = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("current_locale_date"));
    v20 = objc_claimAutoreleasedReturnValue();
    currentLocaleDate = v5->_currentLocaleDate;
    v5->_currentLocaleDate = (NSDate *)v20;

    v5->_availableVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("available_version"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("available_version_date"));
    v22 = objc_claimAutoreleasedReturnValue();
    availableVersionDate = v5->_availableVersionDate;
    v5->_availableVersionDate = (NSDate *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("available_region"));
    v24 = objc_claimAutoreleasedReturnValue();
    availableRegion = v5->_availableRegion;
    v5->_availableRegion = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("available_region_date"));
    v26 = objc_claimAutoreleasedReturnValue();
    availableRegionDate = v5->_availableRegionDate;
    v5->_availableRegionDate = (NSDate *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("available_locale"));
    v28 = objc_claimAutoreleasedReturnValue();
    availableLocale = v5->_availableLocale;
    v5->_availableLocale = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("available_locale_date"));
    v30 = objc_claimAutoreleasedReturnValue();
    availableLocaleDate = v5->_availableLocaleDate;
    v5->_availableLocaleDate = (NSDate *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("available_url"));
    v32 = objc_claimAutoreleasedReturnValue();
    availableURL = v5->_availableURL;
    v5->_availableURL = (NSURL *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("available_url_date"));
    v34 = objc_claimAutoreleasedReturnValue();
    availableURLDate = v5->_availableURLDate;
    v5->_availableURLDate = (NSDate *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("available_checksum"));
    v36 = objc_claimAutoreleasedReturnValue();
    availableChecksum = v5->_availableChecksum;
    v5->_availableChecksum = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("available_checksum_date"));
    v38 = objc_claimAutoreleasedReturnValue();
    availableChecksumDate = v5->_availableChecksumDate;
    v5->_availableChecksumDate = (NSDate *)v38;

    v5->_availableSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("available_size"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("available_size_date"));
    v40 = objc_claimAutoreleasedReturnValue();
    availableSizeDate = v5->_availableSizeDate;
    v5->_availableSizeDate = (NSDate *)v40;

    v5->_availableState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("available_state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("available_state_date"));
    v42 = objc_claimAutoreleasedReturnValue();
    availableStateDate = v5->_availableStateDate;
    v5->_availableStateDate = (NSDate *)v42;

  }
  return v5;
}

- (BOOL)unitTesting_isIdentical:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  NSString *identifier;
  NSString *v9;
  NSString *schemaType;
  NSString *v11;
  NSDate *desiredStateDate;
  NSDate *v13;
  NSDate *currentVersionDate;
  NSDate *v15;
  NSString *currentRegion;
  NSString *v17;
  NSDate *currentRegionDate;
  NSDate *v19;
  NSString *currentLocale;
  NSString *v21;
  NSDate *currentLocaleDate;
  NSDate *v23;
  NSDate *availableVersionDate;
  NSDate *v25;
  NSString *availableRegion;
  NSString *v27;
  NSDate *availableRegionDate;
  NSDate *v29;
  NSString *availableLocale;
  NSString *v31;
  NSDate *availableLocaleDate;
  NSDate *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  char v37;
  NSDate *availableURLDate;
  NSDate *v40;
  NSString *availableChecksum;
  NSString *v42;
  NSDate *availableChecksumDate;
  NSDate *v44;
  NSDate *availableSizeDate;
  NSDate *v46;
  NSDate *availableStateDate;
  NSDate *v48;

  v7 = a3;
  if (-[HKOntologyShardRegistryEntry isEqual:](self, "isEqual:", v7))
  {
    identifier = self->_identifier;
    v9 = (NSString *)*((_QWORD *)v7 + 1);
    if (identifier == v9 || v9 && -[NSString isEqualToString:](identifier, "isEqualToString:"))
    {
      schemaType = self->_schemaType;
      v11 = (NSString *)*((_QWORD *)v7 + 2);
      if ((schemaType == v11 || v11 && -[NSString isEqualToString:](schemaType, "isEqualToString:"))
        && self->_schemaVersion == *((_QWORD *)v7 + 3)
        && self->_settings == *((_QWORD *)v7 + 4)
        && self->_slot == *((_QWORD *)v7 + 5)
        && self->_desiredState == *((_QWORD *)v7 + 6))
      {
        desiredStateDate = self->_desiredStateDate;
        v13 = (NSDate *)*((_QWORD *)v7 + 7);
        if ((desiredStateDate == v13 || v13 && -[NSDate isEqualToDate:](desiredStateDate, "isEqualToDate:"))
          && self->_currentVersion == *((_QWORD *)v7 + 8))
        {
          currentVersionDate = self->_currentVersionDate;
          v15 = (NSDate *)*((_QWORD *)v7 + 9);
          if (currentVersionDate == v15 || v15 && -[NSDate isEqualToDate:](currentVersionDate, "isEqualToDate:"))
          {
            currentRegion = self->_currentRegion;
            v17 = (NSString *)*((_QWORD *)v7 + 10);
            if (currentRegion == v17 || v17 && -[NSString isEqualToString:](currentRegion, "isEqualToString:"))
            {
              currentRegionDate = self->_currentRegionDate;
              v19 = (NSDate *)*((_QWORD *)v7 + 11);
              if (currentRegionDate == v19 || v19 && -[NSDate isEqualToDate:](currentRegionDate, "isEqualToDate:"))
              {
                currentLocale = self->_currentLocale;
                v21 = (NSString *)*((_QWORD *)v7 + 12);
                if (currentLocale == v21 || v21 && -[NSString isEqualToString:](currentLocale, "isEqualToString:"))
                {
                  currentLocaleDate = self->_currentLocaleDate;
                  v23 = (NSDate *)*((_QWORD *)v7 + 13);
                  if ((currentLocaleDate == v23 || v23 && -[NSDate isEqualToDate:](currentLocaleDate, "isEqualToDate:"))
                    && self->_availableVersion == *((_QWORD *)v7 + 14))
                  {
                    availableVersionDate = self->_availableVersionDate;
                    v25 = (NSDate *)*((_QWORD *)v7 + 15);
                    if (availableVersionDate == v25
                      || v25 && -[NSDate isEqualToDate:](availableVersionDate, "isEqualToDate:"))
                    {
                      availableRegion = self->_availableRegion;
                      v27 = (NSString *)*((_QWORD *)v7 + 16);
                      if (availableRegion == v27
                        || v27 && -[NSString isEqualToString:](availableRegion, "isEqualToString:"))
                      {
                        availableRegionDate = self->_availableRegionDate;
                        v29 = (NSDate *)*((_QWORD *)v7 + 17);
                        if (availableRegionDate == v29
                          || v29 && -[NSDate isEqualToDate:](availableRegionDate, "isEqualToDate:"))
                        {
                          availableLocale = self->_availableLocale;
                          v31 = (NSString *)*((_QWORD *)v7 + 18);
                          if (availableLocale == v31
                            || v31 && -[NSString isEqualToString:](availableLocale, "isEqualToString:"))
                          {
                            availableLocaleDate = self->_availableLocaleDate;
                            v33 = (NSDate *)*((_QWORD *)v7 + 19);
                            if (availableLocaleDate == v33
                              || v33 && -[NSDate isEqualToDate:](availableLocaleDate, "isEqualToDate:"))
                            {
                              -[NSURL absoluteString](self->_availableURL, "absoluteString");
                              v34 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(*((id *)v7 + 20), "absoluteString");
                              v35 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v34 != v35)
                              {
                                objc_msgSend(*((id *)v7 + 20), "absoluteString");
                                v36 = objc_claimAutoreleasedReturnValue();
                                if (!v36)
                                {
                                  v37 = 0;
                                  goto LABEL_74;
                                }
                                v3 = (void *)v36;
                                -[NSURL absoluteString](self->_availableURL, "absoluteString");
                                v4 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(*((id *)v7 + 20), "absoluteString");
                                v5 = (void *)objc_claimAutoreleasedReturnValue();
                                if (!objc_msgSend(v4, "isEqual:", v5))
                                {
                                  v37 = 0;
                                  goto LABEL_72;
                                }
                              }
                              availableURLDate = self->_availableURLDate;
                              v40 = (NSDate *)*((_QWORD *)v7 + 21);
                              if (availableURLDate == v40
                                || v40 && -[NSDate isEqualToDate:](availableURLDate, "isEqualToDate:"))
                              {
                                availableChecksum = self->_availableChecksum;
                                v42 = (NSString *)*((_QWORD *)v7 + 22);
                                if (availableChecksum == v42
                                  || v42 && -[NSString isEqualToString:](availableChecksum, "isEqualToString:"))
                                {
                                  availableChecksumDate = self->_availableChecksumDate;
                                  v44 = (NSDate *)*((_QWORD *)v7 + 23);
                                  if ((availableChecksumDate == v44
                                     || v44 && -[NSDate isEqualToDate:](availableChecksumDate, "isEqualToDate:"))
                                    && self->_availableSize == *((_QWORD *)v7 + 24))
                                  {
                                    availableSizeDate = self->_availableSizeDate;
                                    v46 = (NSDate *)*((_QWORD *)v7 + 25);
                                    if ((availableSizeDate == v46
                                       || v46 && -[NSDate isEqualToDate:](availableSizeDate, "isEqualToDate:"))
                                      && self->_availableState == *((_QWORD *)v7 + 26))
                                    {
                                      availableStateDate = self->_availableStateDate;
                                      v48 = (NSDate *)*((_QWORD *)v7 + 27);
                                      if (availableStateDate == v48)
                                      {
                                        v37 = 1;
LABEL_71:
                                        if (v34 == v35)
                                        {
LABEL_74:

                                          goto LABEL_52;
                                        }
LABEL_72:

                                        goto LABEL_74;
                                      }
                                      if (v48)
                                      {
                                        v37 = -[NSDate isEqualToDate:](availableStateDate, "isEqualToDate:");
                                        goto LABEL_71;
                                      }
                                    }
                                  }
                                }
                              }
                              v37 = 0;
                              goto LABEL_71;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v37 = 0;
LABEL_52:

  return v37;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)schemaType
{
  return self->_schemaType;
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (unint64_t)settings
{
  return self->_settings;
}

- (int64_t)slot
{
  return self->_slot;
}

- (int64_t)desiredState
{
  return self->_desiredState;
}

- (NSDate)desiredStateDate
{
  return self->_desiredStateDate;
}

- (int64_t)currentVersion
{
  return self->_currentVersion;
}

- (NSDate)currentVersionDate
{
  return self->_currentVersionDate;
}

- (NSString)currentRegion
{
  return self->_currentRegion;
}

- (NSDate)currentRegionDate
{
  return self->_currentRegionDate;
}

- (NSString)currentLocale
{
  return self->_currentLocale;
}

- (NSDate)currentLocaleDate
{
  return self->_currentLocaleDate;
}

- (int64_t)availableVersion
{
  return self->_availableVersion;
}

- (NSDate)availableVersionDate
{
  return self->_availableVersionDate;
}

- (NSString)availableRegion
{
  return self->_availableRegion;
}

- (NSDate)availableRegionDate
{
  return self->_availableRegionDate;
}

- (NSString)availableLocale
{
  return self->_availableLocale;
}

- (NSDate)availableLocaleDate
{
  return self->_availableLocaleDate;
}

- (NSURL)availableURL
{
  return self->_availableURL;
}

- (NSDate)availableURLDate
{
  return self->_availableURLDate;
}

- (NSString)availableChecksum
{
  return self->_availableChecksum;
}

- (NSDate)availableChecksumDate
{
  return self->_availableChecksumDate;
}

- (int64_t)availableSize
{
  return self->_availableSize;
}

- (NSDate)availableSizeDate
{
  return self->_availableSizeDate;
}

- (int64_t)availableState
{
  return self->_availableState;
}

- (NSDate)availableStateDate
{
  return self->_availableStateDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableStateDate, 0);
  objc_storeStrong((id *)&self->_availableSizeDate, 0);
  objc_storeStrong((id *)&self->_availableChecksumDate, 0);
  objc_storeStrong((id *)&self->_availableChecksum, 0);
  objc_storeStrong((id *)&self->_availableURLDate, 0);
  objc_storeStrong((id *)&self->_availableURL, 0);
  objc_storeStrong((id *)&self->_availableLocaleDate, 0);
  objc_storeStrong((id *)&self->_availableLocale, 0);
  objc_storeStrong((id *)&self->_availableRegionDate, 0);
  objc_storeStrong((id *)&self->_availableRegion, 0);
  objc_storeStrong((id *)&self->_availableVersionDate, 0);
  objc_storeStrong((id *)&self->_currentLocaleDate, 0);
  objc_storeStrong((id *)&self->_currentLocale, 0);
  objc_storeStrong((id *)&self->_currentRegionDate, 0);
  objc_storeStrong((id *)&self->_currentRegion, 0);
  objc_storeStrong((id *)&self->_currentVersionDate, 0);
  objc_storeStrong((id *)&self->_desiredStateDate, 0);
  objc_storeStrong((id *)&self->_schemaType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
