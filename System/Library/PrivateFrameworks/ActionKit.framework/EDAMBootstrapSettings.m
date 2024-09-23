@implementation EDAMBootstrapSettings

+ (id)structName
{
  return CFSTR("BootstrapSettings");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[18];

  v22[16] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_166;
  if (!structFields_structFields_166)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("serviceHost"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v21;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("marketingUrl"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v20;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("supportUrl"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v19;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 0, CFSTR("accountEmailDomain"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v18;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 14, 11, 1, CFSTR("cardscanUrl"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[4] = v17;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 15, 11, 1, CFSTR("announcementsUrl"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[5] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 1, CFSTR("enableFacebookSharing"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22[6] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 1, CFSTR("enableGiftSubscriptions"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22[7] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 2, 1, CFSTR("enableSupportTickets"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22[8] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 2, 1, CFSTR("enableSharedNotebooks"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[9] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 2, 1, CFSTR("enableSingleNoteSharing"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22[10] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 2, 1, CFSTR("enableSponsoredAccounts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22[11] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 2, 1, CFSTR("enableTwitterSharing"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[12] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 12, 2, 1, CFSTR("enableLinkedInSharing"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[13] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 13, 2, 1, CFSTR("enablePublicNotebooks"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[14] = v11;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 16, 2, 1, CFSTR("enableGoogle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[15] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 16);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_166;
    structFields_structFields_166 = v13;

    v2 = (void *)structFields_structFields_166;
  }
  return v2;
}

- (NSString)serviceHost
{
  return self->_serviceHost;
}

- (void)setServiceHost:(id)a3
{
  objc_storeStrong((id *)&self->_serviceHost, a3);
}

- (NSString)marketingUrl
{
  return self->_marketingUrl;
}

- (void)setMarketingUrl:(id)a3
{
  objc_storeStrong((id *)&self->_marketingUrl, a3);
}

- (NSString)supportUrl
{
  return self->_supportUrl;
}

- (void)setSupportUrl:(id)a3
{
  objc_storeStrong((id *)&self->_supportUrl, a3);
}

- (NSString)accountEmailDomain
{
  return self->_accountEmailDomain;
}

- (void)setAccountEmailDomain:(id)a3
{
  objc_storeStrong((id *)&self->_accountEmailDomain, a3);
}

- (NSString)cardscanUrl
{
  return self->_cardscanUrl;
}

- (void)setCardscanUrl:(id)a3
{
  objc_storeStrong((id *)&self->_cardscanUrl, a3);
}

- (NSString)announcementsUrl
{
  return self->_announcementsUrl;
}

- (void)setAnnouncementsUrl:(id)a3
{
  objc_storeStrong((id *)&self->_announcementsUrl, a3);
}

- (NSNumber)enableFacebookSharing
{
  return self->_enableFacebookSharing;
}

- (void)setEnableFacebookSharing:(id)a3
{
  objc_storeStrong((id *)&self->_enableFacebookSharing, a3);
}

- (NSNumber)enableGiftSubscriptions
{
  return self->_enableGiftSubscriptions;
}

- (void)setEnableGiftSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_enableGiftSubscriptions, a3);
}

- (NSNumber)enableSupportTickets
{
  return self->_enableSupportTickets;
}

- (void)setEnableSupportTickets:(id)a3
{
  objc_storeStrong((id *)&self->_enableSupportTickets, a3);
}

- (NSNumber)enableSharedNotebooks
{
  return self->_enableSharedNotebooks;
}

- (void)setEnableSharedNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_enableSharedNotebooks, a3);
}

- (NSNumber)enableSingleNoteSharing
{
  return self->_enableSingleNoteSharing;
}

- (void)setEnableSingleNoteSharing:(id)a3
{
  objc_storeStrong((id *)&self->_enableSingleNoteSharing, a3);
}

- (NSNumber)enableSponsoredAccounts
{
  return self->_enableSponsoredAccounts;
}

- (void)setEnableSponsoredAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_enableSponsoredAccounts, a3);
}

- (NSNumber)enableTwitterSharing
{
  return self->_enableTwitterSharing;
}

- (void)setEnableTwitterSharing:(id)a3
{
  objc_storeStrong((id *)&self->_enableTwitterSharing, a3);
}

- (NSNumber)enableLinkedInSharing
{
  return self->_enableLinkedInSharing;
}

- (void)setEnableLinkedInSharing:(id)a3
{
  objc_storeStrong((id *)&self->_enableLinkedInSharing, a3);
}

- (NSNumber)enablePublicNotebooks
{
  return self->_enablePublicNotebooks;
}

- (void)setEnablePublicNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_enablePublicNotebooks, a3);
}

- (NSNumber)enableGoogle
{
  return self->_enableGoogle;
}

- (void)setEnableGoogle:(id)a3
{
  objc_storeStrong((id *)&self->_enableGoogle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableGoogle, 0);
  objc_storeStrong((id *)&self->_enablePublicNotebooks, 0);
  objc_storeStrong((id *)&self->_enableLinkedInSharing, 0);
  objc_storeStrong((id *)&self->_enableTwitterSharing, 0);
  objc_storeStrong((id *)&self->_enableSponsoredAccounts, 0);
  objc_storeStrong((id *)&self->_enableSingleNoteSharing, 0);
  objc_storeStrong((id *)&self->_enableSharedNotebooks, 0);
  objc_storeStrong((id *)&self->_enableSupportTickets, 0);
  objc_storeStrong((id *)&self->_enableGiftSubscriptions, 0);
  objc_storeStrong((id *)&self->_enableFacebookSharing, 0);
  objc_storeStrong((id *)&self->_announcementsUrl, 0);
  objc_storeStrong((id *)&self->_cardscanUrl, 0);
  objc_storeStrong((id *)&self->_accountEmailDomain, 0);
  objc_storeStrong((id *)&self->_supportUrl, 0);
  objc_storeStrong((id *)&self->_marketingUrl, 0);
  objc_storeStrong((id *)&self->_serviceHost, 0);
}

@end
