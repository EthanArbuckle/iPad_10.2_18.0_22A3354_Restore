@implementation MUIMailboxFilter

- (MUIMailboxFilter)initWithType:(int64_t)a3 name:(id)a4 description:(id)a5 iconImageName:(id)a6 iconTintColor:(id)a7 predicate:(id)a8 hasMailboxPredicate:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  MUIMailboxFilter *v21;
  MUIMailboxFilter *v22;
  uint64_t v23;
  NSString *name;
  void *v25;
  uint64_t v26;
  NSString *filterDescription;
  uint64_t v28;
  NSString *iconImageName;
  void *v31;
  objc_super v32;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MUIMailboxFilter.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v32.receiver = self;
  v32.super_class = (Class)MUIMailboxFilter;
  v21 = -[MUIMailboxFilter init](&v32, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_type = a3;
    v23 = objc_msgSend(v16, "copy");
    name = v22->_name;
    v22->_name = (NSString *)v23;

    if (v17)
      v25 = v17;
    else
      v25 = v16;
    v26 = objc_msgSend(v25, "copy");
    filterDescription = v22->_filterDescription;
    v22->_filterDescription = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    iconImageName = v22->_iconImageName;
    v22->_iconImageName = (NSString *)v28;

    objc_storeStrong((id *)&v22->_iconTintColor, a7);
    objc_storeStrong((id *)&v22->_predicate, a8);
    v22->_hasMailboxPredicate = a9;
  }

  return v22;
}

- (BOOL)isEquivalentToPredicate:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MUIMailboxFilter predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6;
}

- (NSDate)lastFetchDate
{
  NSDate *lastFetchDate;
  NSDate *v4;
  NSDate *v5;

  lastFetchDate = self->_lastFetchDate;
  if (!lastFetchDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_lastFetchDate;
    self->_lastFetchDate = v4;

    lastFetchDate = self->_lastFetchDate;
  }
  return lastFetchDate;
}

- (void)setUnreadCount:(unint64_t)a3
{
  NSDate *v4;
  NSDate *lastFetchDate;

  if (self->_unreadCount != a3)
  {
    self->_unreadCount = a3;
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastFetchDate = self->_lastFetchDate;
      self->_lastFetchDate = v4;

    }
  }
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[MUIMailboxFilter predicate](self, "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[MUIMailboxFilter name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 33 * (33 * v4 + objc_msgSend(v5, "hash"));

  -[MUIMailboxFilter filterDescription](self, "filterDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + objc_msgSend(v7, "hash") + 35937;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  MUIMailboxFilter *v4;
  BOOL v5;

  v4 = (MUIMailboxFilter *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[MUIMailboxFilter isEqualToFilter:](self, "isEqualToFilter:", v4);
  }

  return v5;
}

- (BOOL)isEqualToFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (v4)
  {
    -[MUIMailboxFilter predicate](self, "predicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MUIMailboxFilter predicate](self, "predicate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "isEquivalentToPredicate:", v6);

    }
    else
    {
      v7 = 0;
    }
    -[MUIMailboxFilter name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", v10))
    {
      -[MUIMailboxFilter filterDescription](self, "filterDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "filterDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "isEqualToString:", v12) & v7;

    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIMailboxFilter name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIMailboxFilter filterDescription](self, "filterDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIMailboxFilter predicate](self, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p\nName: %@\nDescription:  %@\nPredicate: \n%@"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)initForFlaggedMessages
{
  void *v3;
  void *v4;
  void *v5;
  MUIMailboxFilter *v6;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForFlaggedMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = -[MUIMailboxFilter initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:](self, "initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:", 0, v4, v4, CFSTR("flag.fill"), v5, v3, v8);

  return v6;
}

- (id)initForUnreadMessages
{
  void *v3;
  void *v4;
  void *v5;
  MUIMailboxFilter *v6;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForUnreadMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = -[MUIMailboxFilter initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:](self, "initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:", 1, v4, v4, CFSTR("envelope.badge"), v5, v3, v8);

  return v6;
}

- (id)initForToMeMessages
{
  void *v3;
  void *v4;
  void *v5;
  MUIMailboxFilter *v6;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForToMeMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "mailTransparentLightGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = -[MUIMailboxFilter initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:](self, "initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:", 2, v4, 0, 0, v5, v3, v8);

  return v6;
}

- (id)initForCCMeMessages
{
  void *v3;
  void *v4;
  void *v5;
  MUIMailboxFilter *v6;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForCCMeMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "mailTransparentLightGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = -[MUIMailboxFilter initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:](self, "initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:", 3, v4, 0, 0, v5, v3, v8);

  return v6;
}

- (id)initForTodayMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MUIMailboxFilter *v7;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForTodayMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _EFLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "mailTodayFilterColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 0;
  v7 = -[MUIMailboxFilter initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:](self, "initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:", 5, v4, v5, CFSTR("calendar"), v6, v3, v9);

  return v7;
}

- (id)initForMessagesWithAttachments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MUIMailboxFilter *v7;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesWithAttachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _EFLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "mailAttachmentsFilterColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 0;
  v7 = -[MUIMailboxFilter initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:](self, "initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:", 6, v4, v5, CFSTR("paperclip"), v6, v3, v9);

  return v7;
}

- (id)initForVIPMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MUIMailboxFilter *v7;
  uint64_t v9;

  _EFLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForIsVIP:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "mailVIPFilterColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 0;
  v7 = -[MUIMailboxFilter initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:](self, "initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:", 8, v3, v4, CFSTR("star.fill"), v6, v5, v9);

  return v7;
}

- (MUIMailboxFilter)initWithAccount:(id)a3 iconFromSmartMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  MUIMailboxFilter *v12;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForAccount:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 8;
  switch(objc_msgSend(v7, "smartMailboxType"))
  {
    case 0:
      goto LABEL_9;
    case 1:
      v10 = CFSTR("flag");
      v9 = 0;
      break;
    case 2:
      v9 = 1;
      goto LABEL_9;
    case 3:
      v9 = 4;
      goto LABEL_9;
    case 4:
      v9 = 6;
      goto LABEL_9;
    case 5:
      v10 = CFSTR("bell");
      v9 = 10;
      break;
    case 6:
      v9 = 5;
LABEL_9:
      v10 = CFSTR("tray");
      break;
    case 7:
      v10 = CFSTR("bell.slash");
      v9 = 9;
      break;
    case 8:
      +[MUIMailboxFilter iconNameForMailboxType:](MUIMailboxFilter, "iconNameForMailboxType:", objc_msgSend(v7, "type"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = 11;
      break;
    case 9:
      v10 = CFSTR("clock");
      v9 = 13;
      break;
    case 10:
      v10 = CFSTR("envelope.open.badge.clock");
      v9 = 14;
      break;
    case 11:
      v10 = CFSTR("arrow.up.circle.badge.clock");
      v9 = 15;
      break;
    case 12:
      v10 = CFSTR("xmark");
      v9 = 16;
      break;
    default:
      v10 = 0;
      v9 = -1;
      break;
  }
  objc_msgSend(v6, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = 1;
  v12 = -[MUIMailboxFilter initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:](self, "initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:", v9, v11, 0, v10, 0, v8, v14);

  return v12;
}

- (id)initForSmartMailboxType:(int64_t)a3
{
  id result;

  switch(a3)
  {
    case 0:
      result = -[MUIMailboxFilter initForVIPMessages](self, "initForVIPMessages");
      break;
    case 1:
      result = -[MUIMailboxFilter initForFlaggedMessages](self, "initForFlaggedMessages");
      break;
    case 2:
      result = -[MUIMailboxFilter initForUnreadMessages](self, "initForUnreadMessages");
      break;
    case 3:
      result = -[MUIMailboxFilter initForToMeMessages](self, "initForToMeMessages");
      break;
    case 4:
      result = -[MUIMailboxFilter initForMessagesWithAttachments](self, "initForMessagesWithAttachments");
      break;
    case 6:
      result = -[MUIMailboxFilter initForTodayMessages](self, "initForTodayMessages");
      break;
    default:

      result = 0;
      break;
  }
  return result;
}

+ (id)iconNameForMailboxType:(int64_t)a3
{
  __CFString **v3;

  if ((unint64_t)(a3 - 1) > 6)
    v3 = MFImageGlyphFilterGenericMailbox;
  else
    v3 = off_1E99E2BC0[a3 - 1];
  return *v3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)filterDescription
{
  return self->_filterDescription;
}

- (NSString)iconImageName
{
  return self->_iconImageName;
}

- (void)setIconImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (UIColor)iconTintColor
{
  return self->_iconTintColor;
}

- (void)setIconTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_iconTintColor, a3);
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (BOOL)hasMailboxPredicate
{
  return self->_hasMailboxPredicate;
}

- (void)setHasMailboxPredicate:(BOOL)a3
{
  self->_hasMailboxPredicate = a3;
}

- (int64_t)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(int64_t)a3
{
  self->_badgeType = a3;
}

- (unint64_t)unreadCount
{
  return self->_unreadCount;
}

- (void)setLastFetchDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastFetchDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetchDate, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_iconTintColor, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_iconImageName, 0);
  objc_storeStrong((id *)&self->_filterDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
