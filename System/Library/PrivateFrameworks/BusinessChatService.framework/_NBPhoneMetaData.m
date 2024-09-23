@implementation _NBPhoneMetaData

- (_NBPhoneMetaData)init
{
  _NBPhoneMetaData *v2;
  NSArray *v3;
  NSArray *numberFormats;
  NSArray *v5;
  NSArray *intlNumberFormats;
  NSString *internationalPrefix;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_NBPhoneMetaData;
  v2 = -[_NBPhoneMetaData init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    numberFormats = v2->_numberFormats;
    v2->_numberFormats = v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    intlNumberFormats = v2->_intlNumberFormats;
    v2->_intlNumberFormats = v5;

    v2->_leadingZeroPossible = 0;
    *(_WORD *)&v2->_sameMobileAndFixedLinePattern = 0;
    internationalPrefix = v2->_internationalPrefix;
    v2->_internationalPrefix = (NSString *)CFSTR("NA");

  }
  return v2;
}

- (_NBPhoneMetaData)initWithEntry:(id)a3
{
  id v4;
  _NBPhoneMetaData *v5;
  _NBPhoneMetaData *v6;
  _NBPhoneNumberDesc *v7;
  void *v8;
  uint64_t v9;
  _NBPhoneNumberDesc *generalDesc;
  _NBPhoneNumberDesc *v11;
  void *v12;
  uint64_t v13;
  _NBPhoneNumberDesc *fixedLine;
  _NBPhoneNumberDesc *v15;
  void *v16;
  uint64_t v17;
  _NBPhoneNumberDesc *mobile;
  _NBPhoneNumberDesc *v19;
  void *v20;
  uint64_t v21;
  _NBPhoneNumberDesc *tollFree;
  _NBPhoneNumberDesc *v23;
  void *v24;
  uint64_t v25;
  _NBPhoneNumberDesc *premiumRate;
  _NBPhoneNumberDesc *v27;
  void *v28;
  uint64_t v29;
  _NBPhoneNumberDesc *sharedCost;
  _NBPhoneNumberDesc *v31;
  void *v32;
  uint64_t v33;
  _NBPhoneNumberDesc *personalNumber;
  _NBPhoneNumberDesc *v35;
  void *v36;
  uint64_t v37;
  _NBPhoneNumberDesc *voip;
  _NBPhoneNumberDesc *v39;
  void *v40;
  uint64_t v41;
  _NBPhoneNumberDesc *pager;
  _NBPhoneNumberDesc *v43;
  void *v44;
  uint64_t v45;
  _NBPhoneNumberDesc *uan;
  _NBPhoneNumberDesc *v47;
  void *v48;
  uint64_t v49;
  _NBPhoneNumberDesc *emergency;
  _NBPhoneNumberDesc *v51;
  void *v52;
  uint64_t v53;
  _NBPhoneNumberDesc *voicemail;
  _NBPhoneNumberDesc *v55;
  void *v56;
  uint64_t v57;
  _NBPhoneNumberDesc *noInternationalDialling;
  uint64_t v59;
  NSString *codeID;
  uint64_t v61;
  NSNumber *countryCode;
  uint64_t v63;
  NSString *internationalPrefix;
  uint64_t v65;
  NSString *preferredInternationalPrefix;
  uint64_t v67;
  NSString *nationalPrefix;
  uint64_t v69;
  NSString *preferredExtnPrefix;
  uint64_t v71;
  NSString *nationalPrefixForParsing;
  uint64_t v73;
  NSString *nationalPrefixTransformRule;
  void *v75;
  void *v76;
  uint64_t v77;
  NSArray *numberFormats;
  void *v79;
  uint64_t v80;
  NSArray *intlNumberFormats;
  void *v82;
  uint64_t v83;
  NSString *leadingDigits;
  void *v85;
  objc_super v87;

  v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)_NBPhoneMetaData;
  v5 = -[_NBPhoneMetaData init](&v87, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [_NBPhoneNumberDesc alloc];
    objc_msgSend(v4, "nb_safeArrayAtIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_NBPhoneNumberDesc initWithEntry:](v7, "initWithEntry:", v8);
    generalDesc = v6->_generalDesc;
    v6->_generalDesc = (_NBPhoneNumberDesc *)v9;

    v11 = [_NBPhoneNumberDesc alloc];
    objc_msgSend(v4, "nb_safeArrayAtIndex:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_NBPhoneNumberDesc initWithEntry:](v11, "initWithEntry:", v12);
    fixedLine = v6->_fixedLine;
    v6->_fixedLine = (_NBPhoneNumberDesc *)v13;

    v15 = [_NBPhoneNumberDesc alloc];
    objc_msgSend(v4, "nb_safeArrayAtIndex:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[_NBPhoneNumberDesc initWithEntry:](v15, "initWithEntry:", v16);
    mobile = v6->_mobile;
    v6->_mobile = (_NBPhoneNumberDesc *)v17;

    v19 = [_NBPhoneNumberDesc alloc];
    objc_msgSend(v4, "nb_safeArrayAtIndex:", 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[_NBPhoneNumberDesc initWithEntry:](v19, "initWithEntry:", v20);
    tollFree = v6->_tollFree;
    v6->_tollFree = (_NBPhoneNumberDesc *)v21;

    v23 = [_NBPhoneNumberDesc alloc];
    objc_msgSend(v4, "nb_safeArrayAtIndex:", 5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[_NBPhoneNumberDesc initWithEntry:](v23, "initWithEntry:", v24);
    premiumRate = v6->_premiumRate;
    v6->_premiumRate = (_NBPhoneNumberDesc *)v25;

    v27 = [_NBPhoneNumberDesc alloc];
    objc_msgSend(v4, "nb_safeArrayAtIndex:", 6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[_NBPhoneNumberDesc initWithEntry:](v27, "initWithEntry:", v28);
    sharedCost = v6->_sharedCost;
    v6->_sharedCost = (_NBPhoneNumberDesc *)v29;

    v31 = [_NBPhoneNumberDesc alloc];
    objc_msgSend(v4, "nb_safeArrayAtIndex:", 7);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[_NBPhoneNumberDesc initWithEntry:](v31, "initWithEntry:", v32);
    personalNumber = v6->_personalNumber;
    v6->_personalNumber = (_NBPhoneNumberDesc *)v33;

    v35 = [_NBPhoneNumberDesc alloc];
    objc_msgSend(v4, "nb_safeArrayAtIndex:", 8);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[_NBPhoneNumberDesc initWithEntry:](v35, "initWithEntry:", v36);
    voip = v6->_voip;
    v6->_voip = (_NBPhoneNumberDesc *)v37;

    v39 = [_NBPhoneNumberDesc alloc];
    objc_msgSend(v4, "nb_safeArrayAtIndex:", 21);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[_NBPhoneNumberDesc initWithEntry:](v39, "initWithEntry:", v40);
    pager = v6->_pager;
    v6->_pager = (_NBPhoneNumberDesc *)v41;

    v43 = [_NBPhoneNumberDesc alloc];
    objc_msgSend(v4, "nb_safeArrayAtIndex:", 25);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[_NBPhoneNumberDesc initWithEntry:](v43, "initWithEntry:", v44);
    uan = v6->_uan;
    v6->_uan = (_NBPhoneNumberDesc *)v45;

    v47 = [_NBPhoneNumberDesc alloc];
    objc_msgSend(v4, "nb_safeArrayAtIndex:", 27);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[_NBPhoneNumberDesc initWithEntry:](v47, "initWithEntry:", v48);
    emergency = v6->_emergency;
    v6->_emergency = (_NBPhoneNumberDesc *)v49;

    v51 = [_NBPhoneNumberDesc alloc];
    objc_msgSend(v4, "nb_safeArrayAtIndex:", 28);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[_NBPhoneNumberDesc initWithEntry:](v51, "initWithEntry:", v52);
    voicemail = v6->_voicemail;
    v6->_voicemail = (_NBPhoneNumberDesc *)v53;

    v55 = [_NBPhoneNumberDesc alloc];
    objc_msgSend(v4, "nb_safeArrayAtIndex:", 24);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[_NBPhoneNumberDesc initWithEntry:](v55, "initWithEntry:", v56);
    noInternationalDialling = v6->_noInternationalDialling;
    v6->_noInternationalDialling = (_NBPhoneNumberDesc *)v57;

    objc_msgSend(v4, "nb_safeStringAtIndex:", 9);
    v59 = objc_claimAutoreleasedReturnValue();
    codeID = v6->_codeID;
    v6->_codeID = (NSString *)v59;

    objc_msgSend(v4, "nb_safeNumberAtIndex:", 10);
    v61 = objc_claimAutoreleasedReturnValue();
    countryCode = v6->_countryCode;
    v6->_countryCode = (NSNumber *)v61;

    objc_msgSend(v4, "nb_safeStringAtIndex:", 11);
    v63 = objc_claimAutoreleasedReturnValue();
    internationalPrefix = v6->_internationalPrefix;
    v6->_internationalPrefix = (NSString *)v63;

    objc_msgSend(v4, "nb_safeStringAtIndex:", 17);
    v65 = objc_claimAutoreleasedReturnValue();
    preferredInternationalPrefix = v6->_preferredInternationalPrefix;
    v6->_preferredInternationalPrefix = (NSString *)v65;

    objc_msgSend(v4, "nb_safeStringAtIndex:", 12);
    v67 = objc_claimAutoreleasedReturnValue();
    nationalPrefix = v6->_nationalPrefix;
    v6->_nationalPrefix = (NSString *)v67;

    objc_msgSend(v4, "nb_safeStringAtIndex:", 13);
    v69 = objc_claimAutoreleasedReturnValue();
    preferredExtnPrefix = v6->_preferredExtnPrefix;
    v6->_preferredExtnPrefix = (NSString *)v69;

    objc_msgSend(v4, "nb_safeStringAtIndex:", 15);
    v71 = objc_claimAutoreleasedReturnValue();
    nationalPrefixForParsing = v6->_nationalPrefixForParsing;
    v6->_nationalPrefixForParsing = (NSString *)v71;

    objc_msgSend(v4, "nb_safeStringAtIndex:", 16);
    v73 = objc_claimAutoreleasedReturnValue();
    nationalPrefixTransformRule = v6->_nationalPrefixTransformRule;
    v6->_nationalPrefixTransformRule = (NSString *)v73;

    objc_msgSend(v4, "nb_safeNumberAtIndex:", 18);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_sameMobileAndFixedLinePattern = objc_msgSend(v75, "BOOLValue");

    objc_msgSend(v4, "nb_safeArrayAtIndex:", 19);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneMetaData numberFormatsFromEntry:](v6, "numberFormatsFromEntry:", v76);
    v77 = objc_claimAutoreleasedReturnValue();
    numberFormats = v6->_numberFormats;
    v6->_numberFormats = (NSArray *)v77;

    objc_msgSend(v4, "nb_safeArrayAtIndex:", 20);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneMetaData numberFormatsFromEntry:](v6, "numberFormatsFromEntry:", v79);
    v80 = objc_claimAutoreleasedReturnValue();
    intlNumberFormats = v6->_intlNumberFormats;
    v6->_intlNumberFormats = (NSArray *)v80;

    objc_msgSend(v4, "nb_safeNumberAtIndex:", 22);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_mainCountryForCode = objc_msgSend(v82, "BOOLValue");

    objc_msgSend(v4, "nb_safeStringAtIndex:", 23);
    v83 = objc_claimAutoreleasedReturnValue();
    leadingDigits = v6->_leadingDigits;
    v6->_leadingDigits = (NSString *)v83;

    objc_msgSend(v4, "nb_safeNumberAtIndex:", 26);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_leadingZeroPossible = objc_msgSend(v85, "BOOLValue");

  }
  return v6;
}

- (id)numberFormatsFromEntry:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _NBNumberFormat *v11;
  _NBNumberFormat *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [_NBNumberFormat alloc];
        v12 = -[_NBNumberFormat initWithEntry:](v11, "initWithEntry:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;

  v2 = CFSTR("Y");
  if (self->_sameMobileAndFixedLinePattern)
    v3 = CFSTR("Y");
  else
    v3 = CFSTR("N");
  if (self->_mainCountryForCode)
    v4 = CFSTR("Y");
  else
    v4 = CFSTR("N");
  if (!self->_leadingZeroPossible)
    v2 = CFSTR("N");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("* codeID[%@] countryCode[%@] generalDesc[%@] fixedLine[%@] mobile[%@] tollFree[%@] premiumRate[%@] sharedCost[%@] personalNumber[%@] voip[%@] pager[%@] uan[%@] emergency[%@] voicemail[%@] noInternationalDialling[%@] internationalPrefix[%@] preferredInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] sameMobileAndFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]"), *(_OWORD *)&self->_codeID, *(_OWORD *)&self->_generalDesc, *(_OWORD *)&self->_mobile, *(_OWORD *)&self->_premiumRate, *(_OWORD *)&self->_personalNumber, *(_OWORD *)&self->_pager, *(_OWORD *)&self->_emergency, self->_noInternationalDialling, self->_internationalPrefix, self->_preferredInternationalPrefix, self->_nationalPrefix, self->_preferredExtnPrefix, self->_nationalPrefixForParsing, self->_nationalPrefixTransformRule, v3, self->_numberFormats,
               self->_intlNumberFormats,
               v4,
               self->_leadingDigits,
               v2);
}

- (_NBPhoneNumberDesc)generalDesc
{
  return self->_generalDesc;
}

- (void)setGeneralDesc:(id)a3
{
  objc_storeStrong((id *)&self->_generalDesc, a3);
}

- (_NBPhoneNumberDesc)fixedLine
{
  return self->_fixedLine;
}

- (void)setFixedLine:(id)a3
{
  objc_storeStrong((id *)&self->_fixedLine, a3);
}

- (_NBPhoneNumberDesc)mobile
{
  return self->_mobile;
}

- (void)setMobile:(id)a3
{
  objc_storeStrong((id *)&self->_mobile, a3);
}

- (_NBPhoneNumberDesc)tollFree
{
  return self->_tollFree;
}

- (void)setTollFree:(id)a3
{
  objc_storeStrong((id *)&self->_tollFree, a3);
}

- (_NBPhoneNumberDesc)premiumRate
{
  return self->_premiumRate;
}

- (void)setPremiumRate:(id)a3
{
  objc_storeStrong((id *)&self->_premiumRate, a3);
}

- (_NBPhoneNumberDesc)sharedCost
{
  return self->_sharedCost;
}

- (void)setSharedCost:(id)a3
{
  objc_storeStrong((id *)&self->_sharedCost, a3);
}

- (_NBPhoneNumberDesc)personalNumber
{
  return self->_personalNumber;
}

- (void)setPersonalNumber:(id)a3
{
  objc_storeStrong((id *)&self->_personalNumber, a3);
}

- (_NBPhoneNumberDesc)voip
{
  return self->_voip;
}

- (void)setVoip:(id)a3
{
  objc_storeStrong((id *)&self->_voip, a3);
}

- (_NBPhoneNumberDesc)pager
{
  return self->_pager;
}

- (void)setPager:(id)a3
{
  objc_storeStrong((id *)&self->_pager, a3);
}

- (_NBPhoneNumberDesc)uan
{
  return self->_uan;
}

- (void)setUan:(id)a3
{
  objc_storeStrong((id *)&self->_uan, a3);
}

- (_NBPhoneNumberDesc)emergency
{
  return self->_emergency;
}

- (void)setEmergency:(id)a3
{
  objc_storeStrong((id *)&self->_emergency, a3);
}

- (_NBPhoneNumberDesc)voicemail
{
  return self->_voicemail;
}

- (void)setVoicemail:(id)a3
{
  objc_storeStrong((id *)&self->_voicemail, a3);
}

- (_NBPhoneNumberDesc)noInternationalDialling
{
  return self->_noInternationalDialling;
}

- (void)setNoInternationalDialling:(id)a3
{
  objc_storeStrong((id *)&self->_noInternationalDialling, a3);
}

- (NSString)codeID
{
  return self->_codeID;
}

- (void)setCodeID:(id)a3
{
  objc_storeStrong((id *)&self->_codeID, a3);
}

- (NSNumber)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSString)internationalPrefix
{
  return self->_internationalPrefix;
}

- (void)setInternationalPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_internationalPrefix, a3);
}

- (NSString)preferredInternationalPrefix
{
  return self->_preferredInternationalPrefix;
}

- (void)setPreferredInternationalPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_preferredInternationalPrefix, a3);
}

- (NSString)nationalPrefix
{
  return self->_nationalPrefix;
}

- (void)setNationalPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_nationalPrefix, a3);
}

- (NSString)preferredExtnPrefix
{
  return self->_preferredExtnPrefix;
}

- (void)setPreferredExtnPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_preferredExtnPrefix, a3);
}

- (NSString)nationalPrefixForParsing
{
  return self->_nationalPrefixForParsing;
}

- (void)setNationalPrefixForParsing:(id)a3
{
  objc_storeStrong((id *)&self->_nationalPrefixForParsing, a3);
}

- (NSString)nationalPrefixTransformRule
{
  return self->_nationalPrefixTransformRule;
}

- (void)setNationalPrefixTransformRule:(id)a3
{
  objc_storeStrong((id *)&self->_nationalPrefixTransformRule, a3);
}

- (BOOL)sameMobileAndFixedLinePattern
{
  return self->_sameMobileAndFixedLinePattern;
}

- (void)setSameMobileAndFixedLinePattern:(BOOL)a3
{
  self->_sameMobileAndFixedLinePattern = a3;
}

- (NSArray)numberFormats
{
  return self->_numberFormats;
}

- (void)setNumberFormats:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormats, a3);
}

- (NSArray)intlNumberFormats
{
  return self->_intlNumberFormats;
}

- (void)setIntlNumberFormats:(id)a3
{
  objc_storeStrong((id *)&self->_intlNumberFormats, a3);
}

- (BOOL)mainCountryForCode
{
  return self->_mainCountryForCode;
}

- (void)setMainCountryForCode:(BOOL)a3
{
  self->_mainCountryForCode = a3;
}

- (NSString)leadingDigits
{
  return self->_leadingDigits;
}

- (void)setLeadingDigits:(id)a3
{
  objc_storeStrong((id *)&self->_leadingDigits, a3);
}

- (BOOL)leadingZeroPossible
{
  return self->_leadingZeroPossible;
}

- (void)setLeadingZeroPossible:(BOOL)a3
{
  self->_leadingZeroPossible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingDigits, 0);
  objc_storeStrong((id *)&self->_intlNumberFormats, 0);
  objc_storeStrong((id *)&self->_numberFormats, 0);
  objc_storeStrong((id *)&self->_nationalPrefixTransformRule, 0);
  objc_storeStrong((id *)&self->_nationalPrefixForParsing, 0);
  objc_storeStrong((id *)&self->_preferredExtnPrefix, 0);
  objc_storeStrong((id *)&self->_nationalPrefix, 0);
  objc_storeStrong((id *)&self->_preferredInternationalPrefix, 0);
  objc_storeStrong((id *)&self->_internationalPrefix, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_codeID, 0);
  objc_storeStrong((id *)&self->_noInternationalDialling, 0);
  objc_storeStrong((id *)&self->_voicemail, 0);
  objc_storeStrong((id *)&self->_emergency, 0);
  objc_storeStrong((id *)&self->_uan, 0);
  objc_storeStrong((id *)&self->_pager, 0);
  objc_storeStrong((id *)&self->_voip, 0);
  objc_storeStrong((id *)&self->_personalNumber, 0);
  objc_storeStrong((id *)&self->_sharedCost, 0);
  objc_storeStrong((id *)&self->_premiumRate, 0);
  objc_storeStrong((id *)&self->_tollFree, 0);
  objc_storeStrong((id *)&self->_mobile, 0);
  objc_storeStrong((id *)&self->_fixedLine, 0);
  objc_storeStrong((id *)&self->_generalDesc, 0);
}

@end
