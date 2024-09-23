@implementation EDAMUserAttributes

+ (id)structName
{
  return CFSTR("UserAttributes");
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[38];

  v44[36] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_31;
  if (!structFields_structFields_31)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("defaultLocationName"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v43;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 4, 1, CFSTR("defaultLatitude"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v42;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 4, 1, CFSTR("defaultLongitude"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v41;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 1, CFSTR("preactivation"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v40;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 5, 15, 1, CFSTR("viewedPromotions"), v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v44[4] = v38;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 1, CFSTR("incomingEmailAddress"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v44[5] = v37;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 7, 15, 1, CFSTR("recentMailedAddresses"), v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v44[6] = v35;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 11, 1, CFSTR("comments"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v44[7] = v34;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 10, 1, CFSTR("dateAgreedToTermsOfService"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v44[8] = v33;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 12, 8, 1, CFSTR("maxReferrals"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44[9] = v32;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 13, 8, 1, CFSTR("referralCount"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v44[10] = v31;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 14, 11, 1, CFSTR("refererCode"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44[11] = v30;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 15, 10, 1, CFSTR("sentEmailDate"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44[12] = v29;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 16, 8, 1, CFSTR("sentEmailCount"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v44[13] = v28;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 17, 8, 1, CFSTR("dailyEmailLimit"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v44[14] = v27;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 18, 10, 1, CFSTR("emailOptOutDate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v44[15] = v26;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 19, 10, 1, CFSTR("partnerEmailOptInDate"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v44[16] = v25;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 20, 11, 1, CFSTR("preferredLanguage"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44[17] = v24;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 21, 11, 1, CFSTR("preferredCountry"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v44[18] = v23;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 22, 2, 1, CFSTR("clipFullPage"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v44[19] = v22;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 23, 11, 1, CFSTR("twitterUserName"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44[20] = v21;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 24, 11, 1, CFSTR("twitterId"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v44[21] = v20;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 25, 11, 1, CFSTR("groupName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v44[22] = v19;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 26, 11, 1, CFSTR("recognitionLanguage"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44[23] = v18;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 28, 11, 1, CFSTR("referralProof"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v44[24] = v17;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 29, 2, 1, CFSTR("educationalDiscount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v44[25] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 30, 11, 1, CFSTR("businessAddress"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v44[26] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 31, 2, 1, CFSTR("hideSponsorBilling"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v44[27] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 32, 2, 1, CFSTR("taxExempt"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v44[28] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 33, 2, 1, CFSTR("useEmailAutoFiling"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v44[29] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 34, 8, 1, CFSTR("reminderEmailConfig"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v44[30] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 35, 10, 1, CFSTR("emailAddressLastConfirmed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v44[31] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 36, 10, 1, CFSTR("passwordUpdated"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v44[32] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 37, 2, 1, CFSTR("salesforcePushEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v44[33] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 38, 2, 1, CFSTR("shouldLogClientEvent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v44[34] = v11;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 39, 2, 1, CFSTR("optOutMachineLearning"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v44[35] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 36);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_31;
    structFields_structFields_31 = v13;

    v2 = (void *)structFields_structFields_31;
  }
  return v2;
}

- (NSString)defaultLocationName
{
  return self->_defaultLocationName;
}

- (void)setDefaultLocationName:(id)a3
{
  objc_storeStrong((id *)&self->_defaultLocationName, a3);
}

- (NSNumber)defaultLatitude
{
  return self->_defaultLatitude;
}

- (void)setDefaultLatitude:(id)a3
{
  objc_storeStrong((id *)&self->_defaultLatitude, a3);
}

- (NSNumber)defaultLongitude
{
  return self->_defaultLongitude;
}

- (void)setDefaultLongitude:(id)a3
{
  objc_storeStrong((id *)&self->_defaultLongitude, a3);
}

- (NSNumber)preactivation
{
  return self->_preactivation;
}

- (void)setPreactivation:(id)a3
{
  objc_storeStrong((id *)&self->_preactivation, a3);
}

- (NSArray)viewedPromotions
{
  return self->_viewedPromotions;
}

- (void)setViewedPromotions:(id)a3
{
  objc_storeStrong((id *)&self->_viewedPromotions, a3);
}

- (NSString)incomingEmailAddress
{
  return self->_incomingEmailAddress;
}

- (void)setIncomingEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_incomingEmailAddress, a3);
}

- (NSArray)recentMailedAddresses
{
  return self->_recentMailedAddresses;
}

- (void)setRecentMailedAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_recentMailedAddresses, a3);
}

- (NSString)comments
{
  return self->_comments;
}

- (void)setComments:(id)a3
{
  objc_storeStrong((id *)&self->_comments, a3);
}

- (NSNumber)dateAgreedToTermsOfService
{
  return self->_dateAgreedToTermsOfService;
}

- (void)setDateAgreedToTermsOfService:(id)a3
{
  objc_storeStrong((id *)&self->_dateAgreedToTermsOfService, a3);
}

- (NSNumber)maxReferrals
{
  return self->_maxReferrals;
}

- (void)setMaxReferrals:(id)a3
{
  objc_storeStrong((id *)&self->_maxReferrals, a3);
}

- (NSNumber)referralCount
{
  return self->_referralCount;
}

- (void)setReferralCount:(id)a3
{
  objc_storeStrong((id *)&self->_referralCount, a3);
}

- (NSString)refererCode
{
  return self->_refererCode;
}

- (void)setRefererCode:(id)a3
{
  objc_storeStrong((id *)&self->_refererCode, a3);
}

- (NSNumber)sentEmailDate
{
  return self->_sentEmailDate;
}

- (void)setSentEmailDate:(id)a3
{
  objc_storeStrong((id *)&self->_sentEmailDate, a3);
}

- (NSNumber)sentEmailCount
{
  return self->_sentEmailCount;
}

- (void)setSentEmailCount:(id)a3
{
  objc_storeStrong((id *)&self->_sentEmailCount, a3);
}

- (NSNumber)dailyEmailLimit
{
  return self->_dailyEmailLimit;
}

- (void)setDailyEmailLimit:(id)a3
{
  objc_storeStrong((id *)&self->_dailyEmailLimit, a3);
}

- (NSNumber)emailOptOutDate
{
  return self->_emailOptOutDate;
}

- (void)setEmailOptOutDate:(id)a3
{
  objc_storeStrong((id *)&self->_emailOptOutDate, a3);
}

- (NSNumber)partnerEmailOptInDate
{
  return self->_partnerEmailOptInDate;
}

- (void)setPartnerEmailOptInDate:(id)a3
{
  objc_storeStrong((id *)&self->_partnerEmailOptInDate, a3);
}

- (NSString)preferredLanguage
{
  return self->_preferredLanguage;
}

- (void)setPreferredLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_preferredLanguage, a3);
}

- (NSString)preferredCountry
{
  return self->_preferredCountry;
}

- (void)setPreferredCountry:(id)a3
{
  objc_storeStrong((id *)&self->_preferredCountry, a3);
}

- (NSNumber)clipFullPage
{
  return self->_clipFullPage;
}

- (void)setClipFullPage:(id)a3
{
  objc_storeStrong((id *)&self->_clipFullPage, a3);
}

- (NSString)twitterUserName
{
  return self->_twitterUserName;
}

- (void)setTwitterUserName:(id)a3
{
  objc_storeStrong((id *)&self->_twitterUserName, a3);
}

- (NSString)twitterId
{
  return self->_twitterId;
}

- (void)setTwitterId:(id)a3
{
  objc_storeStrong((id *)&self->_twitterId, a3);
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (NSString)recognitionLanguage
{
  return self->_recognitionLanguage;
}

- (void)setRecognitionLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_recognitionLanguage, a3);
}

- (NSString)referralProof
{
  return self->_referralProof;
}

- (void)setReferralProof:(id)a3
{
  objc_storeStrong((id *)&self->_referralProof, a3);
}

- (NSNumber)educationalDiscount
{
  return self->_educationalDiscount;
}

- (void)setEducationalDiscount:(id)a3
{
  objc_storeStrong((id *)&self->_educationalDiscount, a3);
}

- (NSString)businessAddress
{
  return self->_businessAddress;
}

- (void)setBusinessAddress:(id)a3
{
  objc_storeStrong((id *)&self->_businessAddress, a3);
}

- (NSNumber)hideSponsorBilling
{
  return self->_hideSponsorBilling;
}

- (void)setHideSponsorBilling:(id)a3
{
  objc_storeStrong((id *)&self->_hideSponsorBilling, a3);
}

- (NSNumber)taxExempt
{
  return self->_taxExempt;
}

- (void)setTaxExempt:(id)a3
{
  objc_storeStrong((id *)&self->_taxExempt, a3);
}

- (NSNumber)useEmailAutoFiling
{
  return self->_useEmailAutoFiling;
}

- (void)setUseEmailAutoFiling:(id)a3
{
  objc_storeStrong((id *)&self->_useEmailAutoFiling, a3);
}

- (NSNumber)reminderEmailConfig
{
  return self->_reminderEmailConfig;
}

- (void)setReminderEmailConfig:(id)a3
{
  objc_storeStrong((id *)&self->_reminderEmailConfig, a3);
}

- (NSNumber)emailAddressLastConfirmed
{
  return self->_emailAddressLastConfirmed;
}

- (void)setEmailAddressLastConfirmed:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddressLastConfirmed, a3);
}

- (NSNumber)passwordUpdated
{
  return self->_passwordUpdated;
}

- (void)setPasswordUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_passwordUpdated, a3);
}

- (NSNumber)salesforcePushEnabled
{
  return self->_salesforcePushEnabled;
}

- (void)setSalesforcePushEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_salesforcePushEnabled, a3);
}

- (NSNumber)shouldLogClientEvent
{
  return self->_shouldLogClientEvent;
}

- (void)setShouldLogClientEvent:(id)a3
{
  objc_storeStrong((id *)&self->_shouldLogClientEvent, a3);
}

- (NSNumber)optOutMachineLearning
{
  return self->_optOutMachineLearning;
}

- (void)setOptOutMachineLearning:(id)a3
{
  objc_storeStrong((id *)&self->_optOutMachineLearning, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optOutMachineLearning, 0);
  objc_storeStrong((id *)&self->_shouldLogClientEvent, 0);
  objc_storeStrong((id *)&self->_salesforcePushEnabled, 0);
  objc_storeStrong((id *)&self->_passwordUpdated, 0);
  objc_storeStrong((id *)&self->_emailAddressLastConfirmed, 0);
  objc_storeStrong((id *)&self->_reminderEmailConfig, 0);
  objc_storeStrong((id *)&self->_useEmailAutoFiling, 0);
  objc_storeStrong((id *)&self->_taxExempt, 0);
  objc_storeStrong((id *)&self->_hideSponsorBilling, 0);
  objc_storeStrong((id *)&self->_businessAddress, 0);
  objc_storeStrong((id *)&self->_educationalDiscount, 0);
  objc_storeStrong((id *)&self->_referralProof, 0);
  objc_storeStrong((id *)&self->_recognitionLanguage, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_twitterId, 0);
  objc_storeStrong((id *)&self->_twitterUserName, 0);
  objc_storeStrong((id *)&self->_clipFullPage, 0);
  objc_storeStrong((id *)&self->_preferredCountry, 0);
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
  objc_storeStrong((id *)&self->_partnerEmailOptInDate, 0);
  objc_storeStrong((id *)&self->_emailOptOutDate, 0);
  objc_storeStrong((id *)&self->_dailyEmailLimit, 0);
  objc_storeStrong((id *)&self->_sentEmailCount, 0);
  objc_storeStrong((id *)&self->_sentEmailDate, 0);
  objc_storeStrong((id *)&self->_refererCode, 0);
  objc_storeStrong((id *)&self->_referralCount, 0);
  objc_storeStrong((id *)&self->_maxReferrals, 0);
  objc_storeStrong((id *)&self->_dateAgreedToTermsOfService, 0);
  objc_storeStrong((id *)&self->_comments, 0);
  objc_storeStrong((id *)&self->_recentMailedAddresses, 0);
  objc_storeStrong((id *)&self->_incomingEmailAddress, 0);
  objc_storeStrong((id *)&self->_viewedPromotions, 0);
  objc_storeStrong((id *)&self->_preactivation, 0);
  objc_storeStrong((id *)&self->_defaultLongitude, 0);
  objc_storeStrong((id *)&self->_defaultLatitude, 0);
  objc_storeStrong((id *)&self->_defaultLocationName, 0);
}

@end
