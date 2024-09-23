@implementation BUBag

- (id)URLForKey:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self->_bag, sel_URLForKey_, a3);
}

- (id)stringForKey:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self->_bag, sel_stringForKey_, a3);
}

- (id)BOOLForKey:(id)a3
{
  return (id)objc_msgSend_BOOLForKey_(self->_bag, a2, (uint64_t)a3);
}

- (id)dictionaryForKey:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self->_bag, sel_dictionaryForKey_, a3);
}

- (id)arrayForKey:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self->_bag, sel_arrayForKey_, a3);
}

- (AMSBagValue)isBooksStoreEnabled
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, (uint64_t)CFSTR("isBooksStoreEnabled"));
}

- (id)integerForKey:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self->_bag, sel_integerForKey_, a3);
}

+ (BUBag)defaultBag
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E4A154;
  block[3] = &unk_24CED9980;
  block[4] = a1;
  if (qword_253DB2580 != -1)
    dispatch_once(&qword_253DB2580, block);
  return (BUBag *)(id)qword_253DB2588;
}

- (id)doubleForKey:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self->_bag, sel_doubleForKey_, a3);
}

- (AMSBagValue)countryCode
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("countryCode"));
}

- (AMSBagValue)booksTabs
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_dictionaryForKey_, CFSTR("booksTabs"));
}

- (AMSBagValue)remoteConfigSupportedStorefronts
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_arrayForKey_, CFSTR("remoteConfigSupportedStorefronts"));
}

- (BUBag)initWithBackingBag:(id)a3
{
  id v5;
  BUBag *v6;
  BUBag *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BUBag;
  v6 = -[BUBag init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bag, a3);

  return v7;
}

- (void)createSnapshotWithCompletion:(id)a3
{
  MEMORY[0x24BEDD108](self->_bag, sel_createSnapshotWithCompletion_, a3);
}

- (AMSBagValue)appAnalyticsURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("app-analytics-url"));
}

+ (void)setOfflineCacheProvider:(id)a3
{
  objc_storeStrong((id *)&qword_254B69F28, a3);
}

+ (BUBagOfflineCacheProviding)offlineCacheProvider
{
  return (BUBagOfflineCacheProviding *)(id)qword_254B69F28;
}

+ (NSDictionary)defaultBagKeysDictionary
{
  _QWORD v3[106];
  _QWORD v4[107];

  v4[106] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("account-flow-url-patterns");
  v3[1] = CFSTR("acquireSlot");
  v4[0] = &unk_24CEE4F50;
  v4[1] = &unk_24CEE4F68;
  v3[2] = CFSTR("AddFundsUrl");
  v3[3] = CFSTR("allow-citations");
  v4[2] = &unk_24CEE4F68;
  v4[3] = &unk_24CEE4F80;
  v3[4] = CFSTR("allowing-citations");
  v3[5] = CFSTR("amd-domains");
  v4[4] = &unk_24CEE4F98;
  v4[5] = &unk_24CEE4F98;
  v3[6] = CFSTR("amd-finish-provisioning");
  v3[7] = CFSTR("amd-sync-machine");
  v4[6] = &unk_24CEE4F68;
  v4[7] = &unk_24CEE4F68;
  v3[8] = CFSTR("app-analytics-url");
  v3[9] = CFSTR("audiobooks-grouping-id");
  v4[8] = &unk_24CEE4F68;
  v4[9] = &unk_24CEE4F50;
  v3[10] = CFSTR("automatic-downloads2/downloads-url");
  v3[11] = CFSTR("enabled-media-types-url");
  v4[10] = &unk_24CEE4F68;
  v4[11] = &unk_24CEE4F68;
  v3[12] = CFSTR("register-media-types-url");
  v3[13] = CFSTR("available-book-updates");
  v4[12] = &unk_24CEE4F68;
  v4[13] = &unk_24CEE4F68;
  v3[14] = CFSTR("available-book-updates-reload-frequency");
  v3[15] = CFSTR("books-isbn-url");
  v4[14] = &unk_24CEE4FB0;
  v4[15] = &unk_24CEE4F50;
  v3[16] = CFSTR("booksMediaAPIHost");
  v3[17] = CFSTR("booksMediaAPIPreviewHost");
  v4[16] = &unk_24CEE4F50;
  v4[17] = &unk_24CEE4F50;
  v3[18] = CFSTR("books-reading-now-widget-rollout-rate");
  v3[19] = CFSTR("books-service-and-support-url");
  v4[18] = &unk_24CEE4FC8;
  v4[19] = &unk_24CEE4F68;
  v3[20] = CFSTR("booksTabs");
  v3[21] = CFSTR("buyProduct");
  v4[20] = &unk_24CEE4FE0;
  v4[21] = &unk_24CEE4F68;
  v3[22] = CFSTR("checkBookQueue");
  v3[23] = CFSTR("check-download-queue");
  v4[22] = &unk_24CEE4F68;
  v4[23] = &unk_24CEE4F68;
  v3[24] = CFSTR("commerce-ui-urls");
  v3[25] = CFSTR("p2-content-restore/max-item-count");
  v4[24] = &unk_24CEE4FE0;
  v4[25] = &unk_24CEE4FB0;
  v3[26] = CFSTR("p2-content-restore/url");
  v3[27] = CFSTR("countryCode");
  v4[26] = &unk_24CEE4F68;
  v4[27] = &unk_24CEE4F50;
  v3[28] = CFSTR("currencyCode");
  v3[29] = CFSTR("deleteUserReviewUrl");
  v4[28] = &unk_24CEE4F50;
  v4[29] = &unk_24CEE4F50;
  v3[30] = CFSTR("display-seller-label-for-country");
  v3[31] = CFSTR("dt-purchases-page");
  v4[30] = &unk_24CEE4F80;
  v4[31] = &unk_24CEE4F50;
  v3[32] = CFSTR("enable-books-unified-product-pages");
  v3[33] = CFSTR("enable-seller-info");
  v4[32] = &unk_24CEE4F80;
  v4[33] = &unk_24CEE4F80;
  v3[34] = CFSTR("end-of-book-upsell-enabled");
  v3[35] = CFSTR("end-of-picture-book-upsell-enabled");
  v4[34] = &unk_24CEE4F50;
  v4[35] = &unk_24CEE4F50;
  v3[36] = CFSTR("family-info");
  v3[37] = CFSTR("forgottenPassword");
  v4[36] = &unk_24CEE4F68;
  v4[37] = &unk_24CEE4F68;
  v3[38] = CFSTR("isAudiobooksStoreEnabled");
  v3[39] = CFSTR("isBooksStoreEnabled");
  v4[38] = &unk_24CEE4F80;
  v4[39] = &unk_24CEE4F80;
  v3[40] = CFSTR("is-paid-storefront");
  v3[41] = CFSTR("isOnDevicePersonalizationEnabled");
  v4[40] = &unk_24CEE4F80;
  v4[41] = &unk_24CEE4F80;
  v3[42] = CFSTR("isYIREnabled");
  v3[43] = CFSTR("isYIRNotificationsAllowed");
  v4[42] = &unk_24CEE4F80;
  v4[43] = &unk_24CEE4F80;
  v3[44] = CFSTR("ix-store-sheet");
  v3[45] = CFSTR("ix-store-sheet-books");
  v4[44] = &unk_24CEE4FE0;
  v4[45] = &unk_24CEE4FE0;
  v3[46] = CFSTR("js-app-url");
  v3[47] = CFSTR("kvs-getall");
  v4[46] = &unk_24CEE4F50;
  v4[47] = &unk_24CEE4F68;
  v3[48] = CFSTR("kvs-putall");
  v3[49] = CFSTR("language");
  v4[48] = &unk_24CEE4F68;
  v4[49] = &unk_24CEE4F50;
  v3[50] = CFSTR("language-tag");
  v3[51] = CFSTR("library-link");
  v4[50] = &unk_24CEE4F50;
  v4[51] = &unk_24CEE4F50;
  v3[52] = CFSTR("manga-grouping-id");
  v3[53] = CFSTR("md-finish-provisioning");
  v4[52] = &unk_24CEE4F50;
  v4[53] = &unk_24CEE4F68;
  v3[54] = CFSTR("md-sync-machine");
  v3[55] = CFSTR("sf-api-token-service-url");
  v4[54] = &unk_24CEE4F68;
  v4[55] = &unk_24CEE4F68;
  v3[56] = CFSTR("metrics");
  v3[57] = CFSTR("mobile-network-constraints");
  v4[56] = &unk_24CEE4FE0;
  v4[57] = &unk_24CEE4F98;
  v3[58] = CFSTR("onboarding-personalization-id");
  v3[59] = CFSTR("oprah-audiobook-club-grouping-id");
  v4[58] = &unk_24CEE4F50;
  v4[59] = &unk_24CEE4F50;
  v3[60] = CFSTR("oprah-book-club-grouping-id");
  v3[61] = CFSTR("oprah-book-club-id");
  v4[60] = &unk_24CEE4F50;
  v4[61] = &unk_24CEE4F50;
  v3[62] = CFSTR("p2-launch-ebookstore-host-patterns");
  v3[63] = CFSTR("p2-launch-ebookstore-path-patterns");
  v4[62] = &unk_24CEE4F98;
  v4[63] = &unk_24CEE4F98;
  v3[64] = CFSTR("p2-launch-audio-book-store-path-patterns");
  v4[64] = &unk_24CEE4F98;
  v3[65] = CFSTR("p2-service-terms-url");
  v4[65] = &unk_24CEE4F50;
  v3[66] = CFSTR("pendingBooks");
  v4[66] = &unk_24CEE4F68;
  v3[67] = CFSTR("pendingSongs");
  v4[67] = &unk_24CEE4F68;
  v3[68] = CFSTR("books-price-tracking-enabled");
  v4[68] = &unk_24CEE4F80;
  v3[69] = CFSTR("books-price-tracking-media-api-host");
  v4[69] = &unk_24CEE4F50;
  v3[70] = CFSTR("privacyAcknowledgementUrl");
  v4[70] = &unk_24CEE4F68;
  v3[71] = CFSTR("processRedirectUrl");
  v4[71] = &unk_24CEE4FE0;
  v3[72] = CFSTR("purchase-daap");
  v4[72] = &unk_24CEE4FE0;
  v3[73] = CFSTR("push-notifications/environment");
  v4[73] = &unk_24CEE4F50;
  v3[74] = CFSTR("reading-goal-share-url");
  v4[74] = &unk_24CEE4F50;
  v3[75] = CFSTR("remoteConfigSupportedStorefronts");
  v4[75] = &unk_24CEE4F98;
  v3[76] = CFSTR("sg-audiobooks-report-concern");
  v4[76] = &unk_24CEE4FE0;
  v3[77] = CFSTR("reportConcernReasons");
  v4[77] = &unk_24CEE4F98;
  v3[78] = CFSTR("reportConcernUrl");
  v4[78] = &unk_24CEE4F68;
  v3[79] = CFSTR("resetAndRedirectUrl");
  v4[79] = &unk_24CEE4F50;
  v3[80] = CFSTR("saveUserReviewUrl");
  v4[80] = &unk_24CEE4F50;
  v3[81] = CFSTR("searchHints");
  v4[81] = &unk_24CEE4F50;
  v3[82] = CFSTR("search-transparency-url");
  v4[82] = &unk_24CEE4F68;
  v3[83] = CFSTR("enable-series-info-updates-in-book-libraries");
  v4[83] = &unk_24CEE4F80;
  v3[84] = CFSTR("book-library-series-info-update-interval-in-days");
  v4[84] = &unk_24CEE4FB0;
  v3[85] = CFSTR("book-library-series-info-request-batch-size");
  v4[85] = &unk_24CEE4FB0;
  v3[86] = CFSTR("enable-live-fetches-in-book-library-series-view");
  v4[86] = &unk_24CEE4F80;
  v3[87] = CFSTR("shared-purchases-enabled");
  v4[87] = &unk_24CEE4F80;
  v3[88] = CFSTR("sign-sap-request");
  v4[88] = &unk_24CEE4FE0;
  v3[89] = CFSTR("sign-sap-setup");
  v4[89] = &unk_24CEE4F68;
  v3[90] = CFSTR("sign-sap-setup-cert");
  v4[90] = &unk_24CEE4F68;
  v3[91] = CFSTR("songDownloadDone");
  v4[91] = &unk_24CEE4F68;
  v3[92] = CFSTR("storeFront");
  v4[92] = &unk_24CEE4F50;
  v3[93] = CFSTR("storeplatform-lookup-url-unpersonalized");
  v4[93] = &unk_24CEE4F68;
  v3[94] = CFSTR("supports-books-slp-v2");
  v4[94] = &unk_24CEE4F80;
  v3[95] = CFSTR("taf-email-body-url-base");
  v4[95] = &unk_24CEE4F68;
  v3[96] = CFSTR("trending-searches");
  v4[96] = &unk_24CEE4F50;
  v3[97] = CFSTR("trustedDomains");
  v4[97] = &unk_24CEE4F98;
  v3[98] = CFSTR("userRateContentUrl");
  v4[98] = &unk_24CEE4F50;
  v3[99] = CFSTR("userReviewsSortOptions");
  v4[99] = &unk_24CEE4F98;
  v3[100] = CFSTR("viewAudiobook");
  v4[100] = &unk_24CEE4F68;
  v3[101] = CFSTR("viewBook");
  v4[101] = &unk_24CEE4F68;
  v3[102] = CFSTR("view-book-update-params");
  v4[102] = &unk_24CEE4F68;
  v3[103] = CFSTR("voteUrl");
  v4[103] = &unk_24CEE4F50;
  v3[104] = CFSTR("writeUserReviewUrl");
  v4[104] = &unk_24CEE4F50;
  v3[105] = CFSTR("mobile-url-handlers");
  v4[105] = &unk_24CEE4F98;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v4, v3, 106);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

+ (NSDictionary)_defaultValueDictionary
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  _QWORD v18[7];
  _QWORD v19[8];

  v19[7] = *MEMORY[0x24BDAC8D0];
  v19[0] = &stru_24CEDBD58;
  v18[0] = CFSTR("manga-grouping-id");
  v18[1] = CFSTR("audiobooks-grouping-id");
  objc_msgSend_null(MEMORY[0x24BDBCEF8], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v3;
  v18[2] = CFSTR("oprah-audiobook-club-grouping-id");
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v6;
  v18[3] = CFSTR("oprah-book-club-id");
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v9;
  v18[4] = CFSTR("oprah-book-club-grouping-id");
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v12;
  v19[5] = &unk_24CEE4F38;
  v18[5] = CFSTR("books-reading-now-widget-rollout-rate");
  v18[6] = CFSTR("books-service-and-support-url");
  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v13, (uint64_t)CFSTR("https://support.apple.com/books"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)v19, v18, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v16;
}

+ (NSString)jsAppUrlKey
{
  return (NSString *)CFSTR("js-app-url");
}

- (AMSBagProtocol)backingBag
{
  return self->_bag;
}

- (AMSBagValue)accountFlowURLPatterns
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("account-flow-url-patterns"));
}

- (AMSBagValue)acquireSlotURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("acquireSlot"));
}

- (AMSBagValue)addFundsURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("AddFundsUrl"));
}

- (AMSBagValue)allowCitations
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, (uint64_t)CFSTR("allow-citations"));
}

- (AMSBagValue)allowingCitations
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_arrayForKey_, CFSTR("allowing-citations"));
}

- (AMSBagValue)amdDomains
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_arrayForKey_, CFSTR("amd-domains"));
}

- (AMSBagValue)amdFinishProvisioning
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("amd-finish-provisioning"));
}

- (AMSBagValue)amdSyncMachine
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("amd-sync-machine"));
}

- (AMSBagValue)automaticDownloadQueueURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("automatic-downloads2/downloads-url"));
}

- (AMSBagValue)availableBookUpdates
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("available-book-updates"));
}

- (AMSBagValue)availableBookUpdatesReloadFrequency
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_integerForKey_, CFSTR("available-book-updates-reload-frequency"));
}

- (AMSBagValue)booksISBNURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("books-isbn-url"));
}

- (AMSBagValue)booksMediaAPIHost
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("booksMediaAPIHost"));
}

- (AMSBagValue)booksMediaAPIPreviewHost
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("booksMediaAPIPreviewHost"));
}

- (AMSBagValue)booksReadingNowWidgetRolloutRate
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_doubleForKey_, CFSTR("books-reading-now-widget-rollout-rate"));
}

- (AMSBagValue)booksServiceAndSupportURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("books-service-and-support-url"));
}

- (AMSBagValue)buyProduct
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("buyProduct"));
}

- (AMSBagValue)commerceUIURLs
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_dictionaryForKey_, CFSTR("commerce-ui-urls"));
}

- (AMSBagValue)contentRestoreMaxItemCount
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_integerForKey_, CFSTR("p2-content-restore/max-item-count"));
}

- (AMSBagValue)contentRestoreURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("p2-content-restore/url"));
}

- (AMSBagValue)currencyCode
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("currencyCode"));
}

- (AMSBagValue)deleteUserReviewUrl
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("deleteUserReviewUrl"));
}

- (AMSBagValue)displaySellerLabelForCountry
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, (uint64_t)CFSTR("display-seller-label-for-country"));
}

- (AMSBagValue)dtPurchasesPages
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("dt-purchases-page"));
}

- (AMSBagValue)enableBooksUnifiedProductPages
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, (uint64_t)CFSTR("enable-books-unified-product-pages"));
}

- (AMSBagValue)enableSellerInfo
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, (uint64_t)CFSTR("enable-seller-info"));
}

- (AMSBagValue)endOfBookUpsellEnabled
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("end-of-book-upsell-enabled"));
}

- (AMSBagValue)endOfPictureBookUpsellEnabled
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("end-of-picture-book-upsell-enabled"));
}

- (AMSBagValue)familyInfo
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("family-info"));
}

- (AMSBagValue)forgottenPassword
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("forgottenPassword"));
}

- (AMSBagValue)isAudiobooksStoreEnabled
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, (uint64_t)CFSTR("isAudiobooksStoreEnabled"));
}

- (AMSBagValue)isPaidStorefront
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, (uint64_t)CFSTR("is-paid-storefront"));
}

- (AMSBagValue)isYIREnabled
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, (uint64_t)CFSTR("isYIREnabled"));
}

- (AMSBagValue)isYIRNotificationsAllowed
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, (uint64_t)CFSTR("isYIRNotificationsAllowed"));
}

- (AMSBagValue)ixStoreSheet
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_dictionaryForKey_, CFSTR("ix-store-sheet"));
}

- (AMSBagValue)ixStoreSheetBooks
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_dictionaryForKey_, CFSTR("ix-store-sheet-books"));
}

- (AMSBagValue)kvsGetAll
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("kvs-getall"));
}

- (AMSBagValue)kvsPutAll
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("kvs-putall"));
}

- (AMSBagValue)language
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("language"));
}

- (AMSBagValue)languageTag
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("language-tag"));
}

- (AMSBagValue)libraryLink
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("library-link"));
}

- (AMSBagValue)mdFinishProvisioning
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("md-finish-provisioning"));
}

- (AMSBagValue)mdSyncMachine
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("md-sync-machine"));
}

- (AMSBagValue)mediaAPITokenProviderURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("sf-api-token-service-url"));
}

- (AMSBagValue)metrics
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_dictionaryForKey_, CFSTR("metrics"));
}

- (AMSBagValue)mobileNetworkConstraints
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_arrayForKey_, CFSTR("mobile-network-constraints"));
}

- (AMSBagValue)mobileURLHandlers
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_arrayForKey_, CFSTR("mobile-url-handlers"));
}

- (AMSBagValue)onboardingPersonalizationID
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("onboarding-personalization-id"));
}

- (AMSBagValue)p2LaunchEbookstoreHostPatterns
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_arrayForKey_, CFSTR("p2-launch-ebookstore-host-patterns"));
}

- (AMSBagValue)p2LaunchEbookstorePathPatterns
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_arrayForKey_, CFSTR("p2-launch-ebookstore-path-patterns"));
}

- (AMSBagValue)p2LaunchAudioBookStorePathPatterns
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_arrayForKey_, CFSTR("p2-launch-audio-book-store-path-patterns"));
}

- (AMSBagValue)p2ServiceTermsURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("p2-service-terms-url"));
}

- (AMSBagValue)priceTrackingEnabled
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_integerForKey_, CFSTR("books-price-tracking-enabled"));
}

- (AMSBagValue)priceTrackingMediaAPIHost
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("books-price-tracking-media-api-host"));
}

- (AMSBagValue)privacyAcknowledgementURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("privacyAcknowledgementUrl"));
}

- (AMSBagValue)processRedirectURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_dictionaryForKey_, CFSTR("processRedirectUrl"));
}

- (AMSBagValue)purchaseDAAP
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_dictionaryForKey_, CFSTR("purchase-daap"));
}

- (AMSBagValue)pushNotificationsEnvironment
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("push-notifications/environment"));
}

- (AMSBagValue)readingGoalShareURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("reading-goal-share-url"));
}

- (AMSBagValue)reportConcerns
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_dictionaryForKey_, CFSTR("sg-audiobooks-report-concern"));
}

- (AMSBagValue)reportConcernReasons
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_arrayForKey_, CFSTR("reportConcernReasons"));
}

- (AMSBagValue)reportConcernURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("reportConcernUrl"));
}

- (AMSBagValue)resetAndRedirectURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("resetAndRedirectUrl"));
}

- (AMSBagValue)saveUserReviewURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("saveUserReviewUrl"));
}

- (AMSBagValue)searchHints
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("searchHints"));
}

- (AMSBagValue)searchTransparencyURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("search-transparency-url"));
}

- (AMSBagValue)seriesInfoUpdateIntervalEnabled
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_integerForKey_, CFSTR("enable-series-info-updates-in-book-libraries"));
}

- (AMSBagValue)seriesInfoUpdateIntervalInDays
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_integerForKey_, CFSTR("book-library-series-info-update-interval-in-days"));
}

- (AMSBagValue)seriesInfoRequestBatchSize
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_integerForKey_, CFSTR("book-library-series-info-request-batch-size"));
}

- (AMSBagValue)seriesInfoLiveFetchesEnabled
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_integerForKey_, CFSTR("enable-live-fetches-in-book-library-series-view"));
}

- (AMSBagValue)sharedPurchasesEnabled
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, (uint64_t)CFSTR("shared-purchases-enabled"));
}

- (AMSBagValue)signSAPRequest
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_dictionaryForKey_, CFSTR("sign-sap-request"));
}

- (AMSBagValue)signSAPSetup
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("sign-sap-setup"));
}

- (AMSBagValue)signSAPSetupCert
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("sign-sap-setup-cert"));
}

- (AMSBagValue)songDownloadDone
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("songDownloadDone"));
}

- (AMSBagValue)storeFront
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("storeFront"));
}

- (AMSBagValue)storePlatformLookupURLUnpersonalized
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("storeplatform-lookup-url-unpersonalized"));
}

- (AMSBagValue)tafEmailBodyUrlBase
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("taf-email-body-url-base"));
}

- (AMSBagValue)trendingSearches
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("trending-searches"));
}

- (AMSBagValue)trustedDomains
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_arrayForKey_, CFSTR("trustedDomains"));
}

- (AMSBagValue)userRateContentURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("userRateContentUrl"));
}

- (AMSBagValue)userReviewSortOptions
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_arrayForKey_, CFSTR("userReviewsSortOptions"));
}

- (AMSBagValue)viewAudiobook
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("viewAudiobook"));
}

- (AMSBagValue)viewBook
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("viewBook"));
}

- (AMSBagValue)viewBookUpdateParams
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_URLForKey_, CFSTR("view-book-update-params"));
}

- (id)bu_voteURL
{
  return (id)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("voteUrl"));
}

- (AMSBagValue)writeUserReviewURL
{
  return (AMSBagValue *)MEMORY[0x24BEDD108](self, sel_stringForKey_, CFSTR("writeUserReviewUrl"));
}

+ (void)audiobookStoreIsAvailable:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v6, v7, (uint64_t)CFSTR("BUSimulateAudiobookStoreAvailability"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11 = objc_msgSend_BOOLForKey_(v6, v9, (uint64_t)CFSTR("BUSimulateAudiobookStoreAvailability"));
    BookUtilityLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v25 = v11;
      _os_log_impl(&dword_212E45000, v12, OS_LOG_TYPE_DEFAULT, "WARNING: Forcing isAudiobooksStoreEnabled to %d.", buf, 8u);
    }

    v13 = MEMORY[0x2199A7288](v3);
    v14 = (void *)v13;
    if (v13)
      (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, v11);
  }
  else
  {
    objc_msgSend_defaultBag(BUBag, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_isAudiobooksStoreEnabled(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = sub_212E4C514;
      v22[3] = &unk_24CED99A8;
      v23 = v3;
      objc_msgSend_valueWithCompletion_(v17, v18, (uint64_t)v22);
      v19 = v23;
    }
    else
    {
      BookUtilityLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_212E6BF04(v20);

      v21 = MEMORY[0x2199A7288](v3);
      v19 = (void *)v21;
      if (v21)
        (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v21, 1);
    }

  }
}

- (BOOL)isExpired
{
  return ((uint64_t (*)(AMSBagProtocol *, char *))MEMORY[0x24BEDD108])(self->_bag, sel_isExpired);
}

- (NSDate)expirationDate
{
  return (NSDate *)((uint64_t (*)(AMSBagProtocol *, char *))MEMORY[0x24BEDD108])(self->_bag, sel_expirationDate);
}

- (NSString)profile
{
  return (NSString *)((uint64_t (*)(AMSBagProtocol *, char *))MEMORY[0x24BEDD108])(self->_bag, sel_profile);
}

- (NSString)profileVersion
{
  return (NSString *)((uint64_t (*)(AMSBagProtocol *, char *))MEMORY[0x24BEDD108])(self->_bag, sel_profileVersion);
}

- (AMSProcessInfo)processInfo
{
  uint64_t v2;

  return (AMSProcessInfo *)objc_msgSend_processInfo(self->_bag, a2, v2);
}

- (id)URLForKey:(id)a3 account:(id)a4
{
  return (id)MEMORY[0x24BEDD108](self->_bag, sel_URLForKey_account_, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
