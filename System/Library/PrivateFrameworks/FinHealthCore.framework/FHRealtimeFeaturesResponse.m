@implementation FHRealtimeFeaturesResponse

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("timeOfDay: '%lu'; "), self->_timeOfDay);
  objc_msgSend(v3, "appendFormat:", CFSTR("transactionDateAtZerothHour: '%lu'; "), self->_transactionDateAtZerothHour);
  objc_msgSend(v3, "appendFormat:", CFSTR("isInternationalSpend: '%d'; "), self->_isInternationalSpend);
  objc_msgSend(v3, "appendFormat:", CFSTR("isTapToPay: '%d'; "), self->_isTapToPay);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantCategory: '%lu'; "), self->_merchantCategory);
  objc_msgSend(v3, "appendFormat:", CFSTR("country: '%@'; "), self->_country);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantDisplayName: '%@'; "), self->_merchantDisplayName);
  objc_msgSend(v3, "appendFormat:", CFSTR("mapsMerchantID: '%llu'; "), self->_mapsMerchantID);
  objc_msgSend(v3, "appendFormat:", CFSTR("mapsMerchantBrandID: '%llu'; "), self->_mapsMerchantBrandID);
  objc_msgSend(v3, "appendFormat:", CFSTR("smartCompoundFeatures: '%@'; "), self->_smartCompoundFeatures);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)smartCompoundFeaturesDictionaryForJson
{
  NSDictionary *smartCompoundFeatures;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  uint64_t v30;
  FHRealtimeFeaturesResponse *v31;
  uint64_t v32;
  NSDictionary *obj;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v34 = (void *)objc_opt_new();
  smartCompoundFeatures = self->_smartCompoundFeatures;
  if (smartCompoundFeatures)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = smartCompoundFeatures;
    v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v47;
      v30 = *(_QWORD *)v47;
      v31 = self;
      do
      {
        v8 = 0;
        v9 = v6;
        v32 = v5;
        do
        {
          if (*(_QWORD *)v47 != v7)
            objc_enumerationMutation(obj);
          v6 = *(id *)(*((_QWORD *)&v46 + 1) + 8 * v8);

          -[NSDictionary objectForKey:](self->_smartCompoundFeatures, "objectForKey:", v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count"))
          {
            v40 = (void *)objc_opt_new();
            v42 = 0u;
            v43 = 0u;
            v44 = 0u;
            v45 = 0u;
            v38 = v10;
            v41 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
            if (v41)
            {
              v35 = v10;
              v36 = v8;
              v37 = v6;
              v11 = 0;
              v39 = *(_QWORD *)v43;
              do
              {
                v12 = 0;
                v13 = v11;
                do
                {
                  if (*(_QWORD *)v43 != v39)
                    objc_enumerationMutation(v38);
                  v11 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * v12);

                  objc_msgSend(v11, "eventIdentifiers");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();

                  v15 = (void *)MEMORY[0x24BDBCE70];
                  objc_msgSend(v11, "featureLabel");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "featureRank");
                  v17 = objc_claimAutoreleasedReturnValue();
                  v18 = (void *)v17;
                  if (v14)
                  {
                    objc_msgSend(v11, "eventIdentifiers");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    v20 = (void *)MEMORY[0x24BDD16E0];
                    objc_msgSend(v11, "eventStartDate");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "timeIntervalSinceReferenceDate");
                    objc_msgSend(v20, "numberWithDouble:");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = (void *)MEMORY[0x24BDD16E0];
                    objc_msgSend(v11, "eventEndDate");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "timeIntervalSinceReferenceDate");
                    objc_msgSend(v23, "numberWithDouble:");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v16, CFSTR("featureLabel"), v18, CFSTR("featureRank"), v19, CFSTR("featureEventIdentifiers"), v22, CFSTR("featureEventStartDate"), v25, CFSTR("featureEventEndDate"), 0);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "addObject:", v26);

                  }
                  else
                  {
                    objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v16, CFSTR("featureLabel"), v17, CFSTR("featureRank"), 0);
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "addObject:", v19);
                  }

                  ++v12;
                  v13 = v11;
                }
                while (v41 != v12);
                v41 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
              }
              while (v41);

              v7 = v30;
              self = v31;
              v5 = v32;
              v8 = v36;
              v6 = v37;
              v10 = v35;
            }

            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v40);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setObject:forKey:", v27, v6);

          }
          ++v8;
          v9 = v6;
        }
        while (v8 != v5);
        v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v5);

    }
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v34);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (unint64_t)timeOfDay
{
  return self->_timeOfDay;
}

- (void)setTimeOfDay:(unint64_t)a3
{
  self->_timeOfDay = a3;
}

- (unint64_t)transactionDateAtZerothHour
{
  return self->_transactionDateAtZerothHour;
}

- (void)setTransactionDateAtZerothHour:(unint64_t)a3
{
  self->_transactionDateAtZerothHour = a3;
}

- (BOOL)isInternationalSpend
{
  return self->_isInternationalSpend;
}

- (void)setIsInternationalSpend:(BOOL)a3
{
  self->_isInternationalSpend = a3;
}

- (BOOL)isTapToPay
{
  return self->_isTapToPay;
}

- (void)setIsTapToPay:(BOOL)a3
{
  self->_isTapToPay = a3;
}

- (unint64_t)merchantCategory
{
  return self->_merchantCategory;
}

- (void)setMerchantCategory:(unint64_t)a3
{
  self->_merchantCategory = a3;
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)merchantDisplayName
{
  return self->_merchantDisplayName;
}

- (void)setMerchantDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)mapsMerchantID
{
  return self->_mapsMerchantID;
}

- (void)setMapsMerchantID:(unint64_t)a3
{
  self->_mapsMerchantID = a3;
}

- (unint64_t)mapsMerchantBrandID
{
  return self->_mapsMerchantBrandID;
}

- (void)setMapsMerchantBrandID:(unint64_t)a3
{
  self->_mapsMerchantBrandID = a3;
}

- (NSDictionary)smartCompoundFeatures
{
  return self->_smartCompoundFeatures;
}

- (void)setSmartCompoundFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)repeatingPatternClass
{
  return self->_repeatingPatternClass;
}

- (void)setRepeatingPatternClass:(unint64_t)a3
{
  self->_repeatingPatternClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartCompoundFeatures, 0);
  objc_storeStrong((id *)&self->_merchantDisplayName, 0);
  objc_storeStrong((id *)&self->_country, 0);
}

@end
