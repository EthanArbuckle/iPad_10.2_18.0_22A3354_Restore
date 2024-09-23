id sub_230F03B44(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  char isEqualToString;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_accountsWithAccountTypeIdentifier_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCEB8];
  v10 = objc_msgSend_count(v5, v7, v8, v9);
  objc_msgSend_arrayWithCapacity_(v6, v11, v10, v12);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = v5;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v15)
  {
    v19 = v15;
    v20 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v42 != v20)
          objc_enumerationMutation(v13);
        v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend_identifier(v22, v16, v17, v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(*(void **)(a1 + 48), v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v23, v28, (uint64_t)v27, v29);

        if ((isEqualToString & 1) == 0)
        {
          objc_msgSend_accountTypeWithIdentifier_(*(void **)(a1 + 32), v16, *(_QWORD *)(a1 + 40), v18);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAccountType_(v22, v32, (uint64_t)v31, v33);

          objc_msgSend_daAccountSubclassWithBackingAccountInfo_(MEMORY[0x24BE2AA60], v34, (uint64_t)v22, v35);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
            objc_msgSend_addObject_(v40, v36, (uint64_t)v38, v37);

        }
      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v41, (uint64_t)v45, 16);
    }
    while (v19);
  }

  return v40;
}

void sub_230F03D3C()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v0 = (void *)objc_opt_new();
  objc_msgSend_addObject_(v0, v1, *MEMORY[0x24BDB4580], v2);
  objc_msgSend_addObject_(v0, v3, *MEMORY[0x24BDB45E0], v4);
  objc_msgSend_addObject_(v0, v5, *MEMORY[0x24BDB4598], v6);
  objc_msgSend_addObject_(v0, v7, *MEMORY[0x24BDB4608], v8);
  objc_msgSend_addObject_(v0, v9, *MEMORY[0x24BDB45A0], v10);
  v11 = (void *)qword_25414B6B0;
  qword_25414B6B0 = (uint64_t)v0;

}

void sub_230F05810(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = *MEMORY[0x24BDB42B0];
  v9[0] = CFSTR("username");
  v9[1] = v3;
  v9[2] = *MEMORY[0x24BDB42B8];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v9, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v2, v5, (uint64_t)v4, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_25414B6C0;
  qword_25414B6C0 = v7;

}

void sub_230F0590C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  _QWORD v49[107];

  v49[105] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = *MEMORY[0x24BDB3F10];
  v49[0] = *MEMORY[0x24BDB3ED8];
  v49[1] = v5;
  v6 = *MEMORY[0x24BDB3F68];
  v49[2] = *MEMORY[0x24BDB3F30];
  v49[3] = v6;
  v49[4] = *MEMORY[0x24BDB3F90];
  v49[5] = CFSTR("active");
  v49[6] = CFSTR("authenticated");
  v49[7] = CFSTR("creationDate");
  v49[8] = CFSTR("credential");
  v49[9] = CFSTR("accountDescription");
  v49[10] = CFSTR("enabledDataclasses");
  v49[11] = CFSTR("identifier");
  v49[12] = CFSTR("owningBundleID");
  v49[13] = CFSTR("parentAccountIdentifier");
  v49[14] = CFSTR("provisionedDataclasses");
  v49[15] = CFSTR("supportsAuthentication");
  v49[16] = CFSTR("accountType");
  v49[17] = CFSTR("username");
  v7 = *MEMORY[0x24BE66220];
  v49[18] = CFSTR("visible");
  v49[19] = v7;
  v8 = *MEMORY[0x24BE66238];
  v49[20] = *MEMORY[0x24BE66230];
  v49[21] = v8;
  v9 = *MEMORY[0x24BE66258];
  v49[22] = *MEMORY[0x24BE66248];
  v49[23] = v9;
  v10 = *MEMORY[0x24BE66290];
  v49[24] = *MEMORY[0x24BE66270];
  v49[25] = v10;
  v11 = *MEMORY[0x24BE662A0];
  v49[26] = *MEMORY[0x24BE66298];
  v49[27] = v11;
  v12 = *MEMORY[0x24BE66240];
  v49[28] = *MEMORY[0x24BE662A8];
  v49[29] = v12;
  v13 = *MEMORY[0x24BE66260];
  v49[30] = *MEMORY[0x24BE66250];
  v49[31] = v13;
  v49[32] = *MEMORY[0x24BE66268];
  v49[33] = CFSTR("MCAccountIsManaged");
  v49[34] = CFSTR("CalAccountPropertyCalDAVAttachmentDownloadHasTakenPlace");
  v49[35] = CFSTR("CalAccountPropertyCalDAVAttachmentDownloadHasTakenPlace");
  v49[36] = CFSTR("kCalDAVCollectionSetName");
  v49[37] = CFSTR("CalAccountPropertyCalDAVLocalDataMigrationHasTakenPlace");
  v49[38] = CFSTR("kCalDAVPrincipalIsManuallyConfigured");
  v49[39] = CFSTR("kCalDAVPrincipalPathKey");
  v49[40] = CFSTR("CalAccountPropertyCalDAVSkipCredentialVerification");
  v49[41] = CFSTR("CalAccountPropertyCalDAVSyncHasTakenPlace");
  v49[42] = CFSTR("kCalDAVUseKerberos");
  v49[43] = CFSTR("kCalDAVWebServicesRecordGUID");
  v49[44] = CFSTR("kCalDAVDelegatePrincipalIsWriteableKey");
  v49[45] = CFSTR("kCalDAVDelegatePrincipalTitleKey");
  v49[46] = CFSTR("CalAccountPropertyExchangeUseExternalURL");
  v49[47] = CFSTR("kCalDAVMainPrincipalUIDKey");
  v49[48] = CFSTR("kCalDAVPrincipalIsDelegate");
  v49[49] = CFSTR("kCalDAVPrincipalsKey");
  v49[50] = CFSTR("kCalDAVPushDisabled");
  v49[51] = CFSTR("kCalDAVRefreshIntervalKey");
  v49[52] = CFSTR("DAAccountValidationDomain");
  v49[53] = CFSTR("CalDAVAccountVersion");
  v49[54] = CFSTR("CalDAVHostKey");
  v49[55] = CFSTR("CalDAVMainPrincipalUID");
  v49[56] = CFSTR("CalDAVMobileAccountCollectionSetName");
  v49[57] = CFSTR("CalDAVMobileAccountIsWritable");
  v49[58] = CFSTR("CalDAVMobileAccountOverriddenPort");
  v49[59] = CFSTR("CalDAVMobileAccountOverriddenScheme");
  v49[60] = CFSTR("CalDAVMobileAccountOverriddenServer");
  v49[61] = CFSTR("CalDAVMobileAccountSearchPropertySet");
  v49[62] = CFSTR("CalDAVMobileAccountSearchPropertySetKey_CoreDAV");
  v49[63] = CFSTR("CalDAVMobileAccountServerVersion");
  v49[64] = CFSTR("WasUpgradedFromLegacy");
  v49[65] = CFSTR("CalDAVPortKey");
  v49[66] = CFSTR("CalDAVPrincipals");
  v49[67] = CFSTR("CalDAVSchemeKey");
  objc_msgSend_CalDAVSubscribedCalendarsKey(MEMORY[0x24BE2AD20], a2, a3, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v49[68] = v14;
  objc_msgSend_DAAccountDoNotSaveReason(MEMORY[0x24BE2AD20], v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49[69] = v18;
  v49[70] = CFSTR("DAAccountEmailAddress");
  v49[71] = CFSTR("DAAccountHost");
  objc_msgSend_DAAccountIdentifiersToIgnoreForUniquenessCheck(MEMORY[0x24BE2AD20], v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[72] = v22;
  v49[73] = CFSTR("DAOldKeychainURLs");
  v49[74] = CFSTR("DAAccountPersistentUUID");
  v49[75] = CFSTR("DAAccountPort");
  objc_msgSend_DAAccountPrincipalPath(MEMORY[0x24BE2AD20], v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49[77] = CFSTR("ACUIDisplayUsername");
  v49[78] = CFSTR("DAAccountUseSSL");
  v49[79] = CFSTR("DAAccountUseTrustedSSLCertificate");
  v49[80] = CFSTR("DAAccountVersion2");
  v49[81] = CFSTR("DAAcountWasUpgradedFromLegacyAccount");
  v49[82] = CFSTR("DAAccountDidAutodiscover");
  v49[83] = CFSTR("DAEASEndPointFQDN");
  v49[84] = CFSTR("DAEncryptionIdentityPersistentReference");
  v49[85] = CFSTR("DAExchangeOAuthSupportedKey");
  v49[86] = CFSTR("DAExchangeOAuthURI");
  v49[87] = CFSTR("DAExchangeOAuthTokenRequestURI");
  v49[88] = CFSTR("DAIdentityPersist");
  v49[89] = CFSTR("DAIdentityPersistIsManagedByProfile");
  v49[90] = CFSTR("DASigningIdentityPersistentReference");
  v49[91] = CFSTR("DATrustSettingsExceptions");
  v49[76] = v26;
  v49[92] = CFSTR("SubCalCalDAVURL");
  v49[93] = CFSTR("SubCalExtRep");
  objc_msgSend_SubCalFilterAlarmsKey(MEMORY[0x24BE2AD20], v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v49[94] = v30;
  v49[95] = CFSTR("FilterAttachments");
  v49[96] = CFSTR("com.apple.ical.urlsubscribe.filtertasks");
  v49[97] = CFSTR("isManagedByServer");
  v49[98] = CFSTR("RefreshInterval");
  v49[99] = CFSTR("SubCalShouldRemoveAlarms");
  objc_msgSend_SubCalSubscriptionURLKey(MEMORY[0x24BE2AD20], v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v49[100] = v34;
  v49[101] = CFSTR("SubCalSyncId");
  objc_msgSend_SubCalTitleKey(MEMORY[0x24BE2AD20], v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49[102] = v38;
  v49[103] = CFSTR("SubCalAccountVersion");
  objc_msgSend_SubCalInsecureConnectionApproved(MEMORY[0x24BE2AD20], v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49[104] = v42;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v43, (uint64_t)v49, 105);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v4, v45, (uint64_t)v44, v46);
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)qword_25414B6A0;
  qword_25414B6A0 = v47;

}

uint64_t DALoggingwithCategory()
{
  return MEMORY[0x24BE2ACA8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

