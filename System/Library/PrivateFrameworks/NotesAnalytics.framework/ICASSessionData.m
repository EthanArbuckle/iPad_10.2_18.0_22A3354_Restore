@implementation ICASSessionData

- (ICASSessionData)initWithUtcOffset:(id)a3 countryCode:(id)a4 languageCode:(id)a5 productType:(id)a6 cellularRadioAccessTechnology:(id)a7 bioAuthEnabled:(id)a8 localNotesEnabled:(id)a9 accountTypeSummary:(id)a10 sessionType:(id)a11 isSaltRegenerated:(id)a12 isGlobalSession:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  ICASSessionData *v23;
  ICASSessionData *v24;
  id v27;
  id v28;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v35 = a3;
  v34 = a4;
  v27 = a5;
  v33 = a5;
  v32 = a6;
  v31 = a7;
  v28 = a8;
  v30 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v36.receiver = self;
  v36.super_class = (Class)ICASSessionData;
  v23 = -[ICASSessionData init](&v36, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_utcOffset, a3);
    objc_storeStrong((id *)&v24->_countryCode, a4);
    objc_storeStrong((id *)&v24->_languageCode, v27);
    objc_storeStrong((id *)&v24->_productType, a6);
    objc_storeStrong((id *)&v24->_cellularRadioAccessTechnology, a7);
    objc_storeStrong((id *)&v24->_bioAuthEnabled, v28);
    objc_storeStrong((id *)&v24->_localNotesEnabled, a9);
    objc_storeStrong((id *)&v24->_accountTypeSummary, a10);
    objc_storeStrong((id *)&v24->_sessionType, a11);
    objc_storeStrong((id *)&v24->_isSaltRegenerated, a12);
    objc_storeStrong((id *)&v24->_isGlobalSession, a13);
  }

  return v24;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("SessionData");
}

- (id)toDict
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
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
  _QWORD v38[11];
  _QWORD v39[13];

  v39[11] = *MEMORY[0x1E0C80C00];
  v38[0] = CFSTR("utcOffset");
  -[ICASSessionData utcOffset](self, "utcOffset");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    -[ICASSessionData utcOffset](self, "utcOffset");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v36 = (void *)v3;
  v39[0] = v3;
  v38[1] = CFSTR("countryCode");
  -[ICASSessionData countryCode](self, "countryCode");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    -[ICASSessionData countryCode](self, "countryCode");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v34 = (void *)v4;
  v39[1] = v4;
  v38[2] = CFSTR("languageCode");
  -[ICASSessionData languageCode](self, "languageCode");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    -[ICASSessionData languageCode](self, "languageCode");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v32 = (void *)v5;
  v39[2] = v5;
  v38[3] = CFSTR("productType");
  -[ICASSessionData productType](self, "productType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[ICASSessionData productType](self, "productType");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v30 = (void *)v6;
  v39[3] = v6;
  v38[4] = CFSTR("cellularRadioAccessTechnology");
  -[ICASSessionData cellularRadioAccessTechnology](self, "cellularRadioAccessTechnology");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[ICASSessionData cellularRadioAccessTechnology](self, "cellularRadioAccessTechnology");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v28 = (void *)v7;
  v39[4] = v7;
  v38[5] = CFSTR("bioAuthEnabled");
  -[ICASSessionData bioAuthEnabled](self, "bioAuthEnabled");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[ICASSessionData bioAuthEnabled](self, "bioAuthEnabled");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v26 = (void *)v8;
  v39[5] = v8;
  v38[6] = CFSTR("localNotesEnabled");
  -[ICASSessionData localNotesEnabled](self, "localNotesEnabled");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[ICASSessionData localNotesEnabled](self, "localNotesEnabled");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_new();
  }
  v10 = (void *)v9;
  v39[6] = v9;
  v38[7] = CFSTR("accountTypeSummary");
  -[ICASSessionData accountTypeSummary](self, "accountTypeSummary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[ICASSessionData accountTypeSummary](self, "accountTypeSummary");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_opt_new();
  }
  v13 = (void *)v12;
  v39[7] = v12;
  v38[8] = CFSTR("sessionType");
  -[ICASSessionData sessionType](self, "sessionType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[ICASSessionData sessionType](self, "sessionType");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_opt_new();
  }
  v16 = (void *)v15;
  v39[8] = v15;
  v38[9] = CFSTR("isSaltRegenerated");
  -[ICASSessionData isSaltRegenerated](self, "isSaltRegenerated");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[ICASSessionData isSaltRegenerated](self, "isSaltRegenerated");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = objc_opt_new();
  }
  v19 = (void *)v18;
  v39[9] = v18;
  v38[10] = CFSTR("isGlobalSession");
  -[ICASSessionData isGlobalSession](self, "isGlobalSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[ICASSessionData isGlobalSession](self, "isGlobalSession");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = objc_opt_new();
  }
  v22 = (void *)v21;
  v39[10] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (NSNumber)utcOffset
{
  return self->_utcOffset;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)productType
{
  return self->_productType;
}

- (ICASCellularRadioAccessTechnology)cellularRadioAccessTechnology
{
  return self->_cellularRadioAccessTechnology;
}

- (NSNumber)bioAuthEnabled
{
  return self->_bioAuthEnabled;
}

- (NSNumber)localNotesEnabled
{
  return self->_localNotesEnabled;
}

- (NSArray)accountTypeSummary
{
  return self->_accountTypeSummary;
}

- (NSString)sessionType
{
  return self->_sessionType;
}

- (NSNumber)isSaltRegenerated
{
  return self->_isSaltRegenerated;
}

- (NSNumber)isGlobalSession
{
  return self->_isGlobalSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isGlobalSession, 0);
  objc_storeStrong((id *)&self->_isSaltRegenerated, 0);
  objc_storeStrong((id *)&self->_sessionType, 0);
  objc_storeStrong((id *)&self->_accountTypeSummary, 0);
  objc_storeStrong((id *)&self->_localNotesEnabled, 0);
  objc_storeStrong((id *)&self->_bioAuthEnabled, 0);
  objc_storeStrong((id *)&self->_cellularRadioAccessTechnology, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_utcOffset, 0);
}

@end
