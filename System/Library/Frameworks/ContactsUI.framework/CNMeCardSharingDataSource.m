@implementation CNMeCardSharingDataSource

- (CNMeCardSharingDataSource)init
{
  CNMeCardSharingDataSource *v2;
  CNMeCardSharingDataSource *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNMeCardSharingDataSource;
  v2 = -[CNMeCardSharingDataSource init](&v5, sel_init);
  if (v2)
  {
    v2->_meCardSharingStatus = CFPreferencesGetAppIntegerValue(CFSTR("CNMeCardSharingStatus"), CFSTR("com.apple.Contacts"), 0);
    v3 = v2;
  }

  return v2;
}

- (void)setMeCardSharingStatus:(unint64_t)a3
{
  if (self->_meCardSharingStatus != a3)
  {
    self->_meCardSharingStatus = a3;
    CFPreferencesSetAppValue(CFSTR("CNMeCardSharingStatus"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:"), CFSTR("com.apple.Contacts"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.Contacts"));
  }
}

- (id)localizedStringForMeCardSharingStatus
{
  unint64_t v2;

  v2 = -[CNMeCardSharingDataSource meCardSharingStatus](self, "meCardSharingStatus");
  if (v2 > 2)
    return 0;
  else
    return off_1E204B060[v2];
}

- (unint64_t)meCardSharingStatus
{
  return self->_meCardSharingStatus;
}

+ (id)localizedStringForMeCardSharingStatus:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return off_1E204B060[a3];
}

@end
