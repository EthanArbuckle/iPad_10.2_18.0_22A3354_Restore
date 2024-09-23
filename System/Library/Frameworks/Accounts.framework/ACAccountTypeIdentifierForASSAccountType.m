@implementation ACAccountTypeIdentifierForASSAccountType

void __ACAccountTypeIdentifierForASSAccountType_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[13];
  _QWORD v3[14];

  v3[13] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Subscribed Calendar");
  v2[1] = CFSTR("CalDAV");
  v3[0] = CFSTR("com.apple.account.SubscribedCalendar");
  v3[1] = CFSTR("com.apple.account.CalDAV");
  v2[2] = CFSTR("CardDAV");
  v2[3] = CFSTR("BookmarkDAV");
  v3[2] = CFSTR("com.apple.account.CardDAV");
  v3[3] = CFSTR("com.apple.account.BookmarkDAV");
  v2[4] = CFSTR("SMTP");
  v2[5] = CFSTR("Exchange");
  v3[4] = CFSTR("com.apple.account.SMTP");
  v3[5] = CFSTR("com.apple.account.Exchange");
  v2[6] = CFSTR("LDAP");
  v2[7] = CFSTR("Gmail");
  v3[6] = CFSTR("com.apple.account.LDAP");
  v3[7] = CFSTR("com.apple.account.Google");
  v2[8] = CFSTR("Yahoo");
  v2[9] = CFSTR("OnMyDevice");
  v3[8] = CFSTR("com.apple.account.Yahoo");
  v3[9] = CFSTR("com.apple.account.OnMyDevice");
  v2[10] = CFSTR("IMAPNotes");
  v2[11] = CFSTR("AppleAccount");
  v3[10] = CFSTR("com.apple.account.IMAPNotes");
  v3[11] = CFSTR("com.apple.account.AppleAccount");
  v2[12] = CFSTR("CastleIMAP");
  v3[12] = CFSTR("com.apple.account.IMAPMail");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 13);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ACAccountTypeIdentifierForASSAccountType_accountTypeDictionary;
  ACAccountTypeIdentifierForASSAccountType_accountTypeDictionary = v0;

}

@end
