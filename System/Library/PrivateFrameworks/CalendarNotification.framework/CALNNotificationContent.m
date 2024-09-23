@implementation CALNNotificationContent

- (id)_initWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 categoryIdentifier:(id)a6 sectionIdentifier:(id)a7 date:(id)a8 expirationDate:(id)a9 defaultActionURL:(id)a10 iconIdentifier:(id)a11 shouldHideTime:(BOOL)a12 shouldSuppressSyncDismissalWhenRemoved:(BOOL)a13 peopleIdentifiers:(id)a14 sound:(id)a15 userInfo:(id)a16 threadIdentifier:(id)a17 interruptionLevel:(unint64_t)a18 filterCriteria:(id)a19
{
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  CALNNotificationContent *v32;
  uint64_t v33;
  NSString *title;
  uint64_t v35;
  NSString *subtitle;
  uint64_t v37;
  NSString *body;
  uint64_t v39;
  NSString *categoryIdentifier;
  uint64_t v41;
  NSString *sectionIdentifier;
  uint64_t v43;
  NSDate *date;
  uint64_t v45;
  NSDate *expirationDate;
  uint64_t v47;
  NSURL *defaultActionURL;
  uint64_t v49;
  NSString *iconIdentifier;
  uint64_t v51;
  NSArray *peopleIdentifiers;
  uint64_t v53;
  CALNNotificationSound *sound;
  uint64_t v55;
  NSDictionary *userInfo;
  uint64_t v57;
  NSString *threadIdentifier;
  uint64_t v59;
  NSString *filterCriteria;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  objc_super v70;

  v24 = a3;
  v25 = a4;
  v69 = a5;
  v68 = a6;
  v67 = a7;
  v66 = a8;
  v26 = v25;
  v65 = a9;
  v64 = a10;
  v63 = a11;
  v27 = a14;
  v28 = a15;
  v29 = a16;
  v30 = a17;
  v31 = a19;
  v70.receiver = self;
  v70.super_class = (Class)CALNNotificationContent;
  v32 = -[CALNNotificationContent init](&v70, sel_init);
  if (v32)
  {
    v33 = objc_msgSend(v24, "copy");
    title = v32->_title;
    v32->_title = (NSString *)v33;

    v35 = objc_msgSend(v26, "copy");
    subtitle = v32->_subtitle;
    v32->_subtitle = (NSString *)v35;

    v37 = objc_msgSend(v69, "copy");
    body = v32->_body;
    v32->_body = (NSString *)v37;

    v39 = objc_msgSend(v68, "copy");
    categoryIdentifier = v32->_categoryIdentifier;
    v32->_categoryIdentifier = (NSString *)v39;

    v41 = objc_msgSend(v67, "copy");
    sectionIdentifier = v32->_sectionIdentifier;
    v32->_sectionIdentifier = (NSString *)v41;

    v43 = objc_msgSend(v66, "copy");
    date = v32->_date;
    v32->_date = (NSDate *)v43;

    v45 = objc_msgSend(v65, "copy");
    expirationDate = v32->_expirationDate;
    v32->_expirationDate = (NSDate *)v45;

    v47 = objc_msgSend(v64, "copy");
    defaultActionURL = v32->_defaultActionURL;
    v32->_defaultActionURL = (NSURL *)v47;

    v49 = objc_msgSend(v63, "copy");
    iconIdentifier = v32->_iconIdentifier;
    v32->_iconIdentifier = (NSString *)v49;

    v32->_shouldHideTime = a12;
    v32->_shouldSuppressSyncDismissalWhenRemoved = a13;
    v51 = objc_msgSend(v27, "copy");
    peopleIdentifiers = v32->_peopleIdentifiers;
    v32->_peopleIdentifiers = (NSArray *)v51;

    v53 = objc_msgSend(v28, "copy");
    sound = v32->_sound;
    v32->_sound = (CALNNotificationSound *)v53;

    v55 = objc_msgSend(v29, "copy");
    userInfo = v32->_userInfo;
    v32->_userInfo = (NSDictionary *)v55;

    v57 = objc_msgSend(v30, "copy");
    threadIdentifier = v32->_threadIdentifier;
    v32->_threadIdentifier = (NSString *)v57;

    v32->_interruptionLevel = a18;
    v59 = objc_msgSend(v31, "copy");
    filterCriteria = v32->_filterCriteria;
    v32->_filterCriteria = (NSString *)v59;

  }
  return v32;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v20 = (void *)MEMORY[0x24BDD17C8];
  v19 = objc_opt_class();
  -[CALNNotificationContent title](self, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ICSRedactString();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent subtitle](self, "subtitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  ICSRedactString();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent body](self, "body");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  ICSRedactString();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent categoryIdentifier](self, "categoryIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent sectionIdentifier](self, "sectionIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent date](self, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent expirationDate](self, "expirationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent defaultActionURL](self, "defaultActionURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent iconIdentifier](self, "iconIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CALNNotificationContent shouldHideTime](self, "shouldHideTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CALNNotificationContent shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent peopleIdentifiers](self, "peopleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent sound](self, "sound");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent threadIdentifier](self, "threadIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CALNNotificationContent interruptionLevel](self, "interruptionLevel");
  -[CALNNotificationContent filterCriteria](self, "filterCriteria");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p>(title = %@, subtitle = %@, body = %@, categoryIdentifier = %@, sectionIdentifier = %@, date = %@, expirationDate = %@, defaultActionURL = %@, iconIdentifier = %@, shouldHideTime = %@, shouldSuppressSyncDismissalWhenRemoved = %@, peopleIdentifiers = %@, sound = %@, threadIdentifier = %@, interruptionLevel = %lu, filterCriteria = %@, userInfo = %@)"), v19, self, v26, v24, v25, v18, v17, v16, v15, v13, v14, v12, v11, v10, v3, v4,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[CALNNotificationContent isEqualToContent:](self, "isEqualToContent:", v4);

  return v5;
}

- (BOOL)isEqualToContent:(id)a3
{
  CALNNotificationContent *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (CALNNotificationContent *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (-[CALNNotificationContent isEqualForDiffingPurposesToContent:](self, "isEqualForDiffingPurposesToContent:", v4))
  {
    -[CALNNotificationContent expirationDate](self, "expirationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationContent expirationDate](v4, "expirationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CalEqualObjects();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualForDiffingPurposesToContent:(id)a3
{
  CALNNotificationContent *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  _BOOL4 v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  int v42;
  unint64_t v43;
  void *v44;
  void *v45;
  char v46;

  v4 = (CALNNotificationContent *)a3;
  if (self == v4)
  {
    v46 = 1;
  }
  else
  {
    -[CALNNotificationContent title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationContent title](v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CalEqualStrings();

    if (!v7)
      goto LABEL_18;
    -[CALNNotificationContent subtitle](self, "subtitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationContent subtitle](v4, "subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CalEqualStrings();

    if (!v10)
      goto LABEL_18;
    -[CALNNotificationContent body](self, "body");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationContent body](v4, "body");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CalEqualStrings();

    if (!v13)
      goto LABEL_18;
    -[CALNNotificationContent categoryIdentifier](self, "categoryIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationContent categoryIdentifier](v4, "categoryIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CalEqualStrings();

    if (!v16)
      goto LABEL_18;
    -[CALNNotificationContent sectionIdentifier](self, "sectionIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationContent sectionIdentifier](v4, "sectionIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = CalEqualStrings();

    if (!v19)
      goto LABEL_18;
    -[CALNNotificationContent date](self, "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationContent date](v4, "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = CalEqualObjects();

    if (!v22)
      goto LABEL_18;
    -[CALNNotificationContent defaultActionURL](self, "defaultActionURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationContent defaultActionURL](v4, "defaultActionURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = CalEqualObjects();

    if (!v25)
      goto LABEL_18;
    -[CALNNotificationContent iconIdentifier](self, "iconIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationContent iconIdentifier](v4, "iconIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = CalEqualStrings();

    if (!v28)
      goto LABEL_18;
    v29 = -[CALNNotificationContent shouldHideTime](self, "shouldHideTime");
    if (v29 != -[CALNNotificationContent shouldHideTime](v4, "shouldHideTime"))
      goto LABEL_18;
    v30 = -[CALNNotificationContent shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved");
    if (v30 != -[CALNNotificationContent shouldSuppressSyncDismissalWhenRemoved](v4, "shouldSuppressSyncDismissalWhenRemoved"))goto LABEL_18;
    -[CALNNotificationContent peopleIdentifiers](self, "peopleIdentifiers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationContent peopleIdentifiers](v4, "peopleIdentifiers");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = CalEqualObjects();

    if (!v33)
      goto LABEL_18;
    -[CALNNotificationContent sound](self, "sound");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationContent sound](v4, "sound");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = CalEqualObjects();

    if (!v36)
      goto LABEL_18;
    -[CALNNotificationContent userInfo](self, "userInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationContent userInfo](v4, "userInfo");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = CalEqualObjects();

    if (!v39)
      goto LABEL_18;
    -[CALNNotificationContent threadIdentifier](self, "threadIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationContent threadIdentifier](v4, "threadIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = CalEqualStrings();

    if (!v42)
      goto LABEL_18;
    v43 = -[CALNNotificationContent interruptionLevel](self, "interruptionLevel");
    if (v43 == -[CALNNotificationContent interruptionLevel](v4, "interruptionLevel"))
    {
      -[CALNNotificationContent filterCriteria](self, "filterCriteria");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALNNotificationContent filterCriteria](v4, "filterCriteria");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CalEqualStrings();

    }
    else
    {
LABEL_18:
      v46 = 0;
    }
  }

  return v46;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  _BOOL4 v33;
  uint64_t v34;

  -[CALNNotificationContent title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[CALNNotificationContent subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[CALNNotificationContent body](self, "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[CALNNotificationContent categoryIdentifier](self, "categoryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  -[CALNNotificationContent sectionIdentifier](self, "sectionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  -[CALNNotificationContent date](self, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");

  -[CALNNotificationContent expirationDate](self, "expirationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");

  -[CALNNotificationContent defaultActionURL](self, "defaultActionURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");

  -[CALNNotificationContent iconIdentifier](self, "iconIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");

  -[CALNNotificationContent sound](self, "sound");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");

  -[CALNNotificationContent userInfo](self, "userInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v16 ^ v22 ^ objc_msgSend(v23, "hash");

  v25 = -[CALNNotificationContent shouldHideTime](self, "shouldHideTime");
  -[CALNNotificationContent peopleIdentifiers](self, "peopleIdentifiers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v25 ^ objc_msgSend(v26, "hash");

  -[CALNNotificationContent threadIdentifier](self, "threadIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v27 ^ objc_msgSend(v28, "hash");

  v30 = v24 ^ v29 ^ -[CALNNotificationContent interruptionLevel](self, "interruptionLevel");
  -[CALNNotificationContent filterCriteria](self, "filterCriteria");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "hash");

  v33 = -[CALNNotificationContent shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved");
  v34 = 2;
  if (!v33)
    v34 = 0;
  return v30 ^ v32 ^ v34;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  CALNMutableNotificationContent *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;

  v20 = +[CALNMutableNotificationContent allocWithZone:](CALNMutableNotificationContent, "allocWithZone:", a3);
  -[CALNNotificationContent title](self, "title");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent subtitle](self, "subtitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent body](self, "body");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent categoryIdentifier](self, "categoryIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent sectionIdentifier](self, "sectionIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent date](self, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent expirationDate](self, "expirationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent defaultActionURL](self, "defaultActionURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent iconIdentifier](self, "iconIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CALNNotificationContent shouldHideTime](self, "shouldHideTime");
  v14 = -[CALNNotificationContent shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved");
  -[CALNNotificationContent peopleIdentifiers](self, "peopleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent sound](self, "sound");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent threadIdentifier](self, "threadIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CALNNotificationContent interruptionLevel](self, "interruptionLevel");
  -[CALNNotificationContent filterCriteria](self, "filterCriteria");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v11) = v14;
  LOBYTE(v11) = v16;
  v21 = -[CALNNotificationContent _initWithTitle:subtitle:body:categoryIdentifier:sectionIdentifier:date:expirationDate:defaultActionURL:iconIdentifier:shouldHideTime:shouldSuppressSyncDismissalWhenRemoved:peopleIdentifiers:sound:userInfo:threadIdentifier:interruptionLevel:filterCriteria:](v20, "_initWithTitle:subtitle:body:categoryIdentifier:sectionIdentifier:date:expirationDate:defaultActionURL:iconIdentifier:shouldHideTime:shouldSuppressSyncDismissalWhenRemoved:peopleIdentifiers:sound:userInfo:threadIdentifier:interruptionLevel:filterCriteria:", v24, v23, v22, v19, v18, v17, v15, v13, v12, v11, v4, v5, v6, v7, v8,
          v9);

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  -[CALNNotificationContent body](self, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("body"));

  -[CALNNotificationContent subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("subtitle"));

  -[CALNNotificationContent title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("title"));

  -[CALNNotificationContent categoryIdentifier](self, "categoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("categoryIdentifier"));

  -[CALNNotificationContent sectionIdentifier](self, "sectionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("sectionIdentifier"));

  -[CALNNotificationContent date](self, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("date"));

  -[CALNNotificationContent iconIdentifier](self, "iconIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("iconIdentifier"));

  -[CALNNotificationContent expirationDate](self, "expirationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("expirationDate"));

  -[CALNNotificationContent defaultActionURL](self, "defaultActionURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("defaultActionURL"));

  objc_msgSend(v4, "encodeBool:forKey:", -[CALNNotificationContent shouldHideTime](self, "shouldHideTime"), CFSTR("shouldHideTime"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CALNNotificationContent shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved"), CFSTR("shouldSuppressSyncDismissalWhenRemoved"));
  -[CALNNotificationContent peopleIdentifiers](self, "peopleIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("peopleIdentifiers"));

  -[CALNNotificationContent sound](self, "sound");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("sound"));

  -[CALNNotificationContent userInfo](self, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("userInfo"));

  -[CALNNotificationContent threadIdentifier](self, "threadIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("threadIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[CALNNotificationContent interruptionLevel](self, "interruptionLevel"), CFSTR("interruptionLevel"));
  -[CALNNotificationContent filterCriteria](self, "filterCriteria");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("filterCriteria"));

}

- (CALNNotificationContent)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CALNNotificationContent *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("categoryIdentifier"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionIdentifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultActionURL"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldHideTime"));
  v20 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldSuppressSyncDismissalWhenRemoved"));
  if (initWithCoder__onceToken != -1)
    dispatch_once(&initWithCoder__onceToken, &__block_literal_global_6);
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", initWithCoder__peopleIdentifiersClasses, CFSTR("peopleIdentifiers"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sound"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v12, CFSTR("userInfo"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threadIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("interruptionLevel"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filterCriteria"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v17) = v20;
  LOBYTE(v17) = v21;
  v28 = -[CALNNotificationContent _initWithTitle:subtitle:body:categoryIdentifier:sectionIdentifier:date:expirationDate:defaultActionURL:iconIdentifier:shouldHideTime:shouldSuppressSyncDismissalWhenRemoved:peopleIdentifiers:sound:userInfo:threadIdentifier:interruptionLevel:filterCriteria:](self, "_initWithTitle:subtitle:body:categoryIdentifier:sectionIdentifier:date:expirationDate:defaultActionURL:iconIdentifier:shouldHideTime:shouldSuppressSyncDismissalWhenRemoved:peopleIdentifiers:sound:userInfo:threadIdentifier:interruptionLevel:filterCriteria:", v30, v31, v32, v26, v25, v24, v29, v23, v22, v17, v19, v4, v18, v13, v14,
          v15);

  return v28;
}

void __41__CALNNotificationContent_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__peopleIdentifiersClasses;
  initWithCoder__peopleIdentifiersClasses = v2;

}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSDate)date
{
  return self->_date;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSURL)defaultActionURL
{
  return self->_defaultActionURL;
}

- (BOOL)shouldHideTime
{
  return self->_shouldHideTime;
}

- (NSString)iconIdentifier
{
  return self->_iconIdentifier;
}

- (BOOL)shouldSuppressSyncDismissalWhenRemoved
{
  return self->_shouldSuppressSyncDismissalWhenRemoved;
}

- (NSArray)peopleIdentifiers
{
  return self->_peopleIdentifiers;
}

- (CALNNotificationSound)sound
{
  return self->_sound;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (unint64_t)interruptionLevel
{
  return self->_interruptionLevel;
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterCriteria, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_peopleIdentifiers, 0);
  objc_storeStrong((id *)&self->_iconIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultActionURL, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
