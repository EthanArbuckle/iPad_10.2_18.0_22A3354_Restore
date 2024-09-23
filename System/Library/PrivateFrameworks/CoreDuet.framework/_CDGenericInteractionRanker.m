@implementation _CDGenericInteractionRanker

- (_CDGenericInteractionRanker)init
{
  _CDGenericInteractionRanker *v2;
  void *v3;
  NSArray *seedContacts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CDGenericInteractionRanker;
  v2 = -[_CDGenericInteractionRanker init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDGenericInteractionRanker setReferenceDate:](v2, "setReferenceDate:", v3);

    seedContacts = v2->_seedContacts;
    v2->_seedContacts = (NSArray *)MEMORY[0x1E0C9AA60];

    *(_OWORD *)&v2->_timeHalfLife = xmmword_18DF4C750;
    *(_OWORD *)&v2->_timeOfWeekHalfLife = xmmword_18DF4C760;
    *(_OWORD *)&v2->_diffWeekPeriodWeight = xmmword_18DF4C770;
    *(_OWORD *)&v2->_socialWeight = xmmword_18DF4C780;
    *(_OWORD *)&v2->_keywordWeight = xmmword_18DF4C790;
    v2->_requireAllSeedContacts = 0;
    v2->_rankAggregationMethod = 0;
    *(_OWORD *)&v2->_timeOfDayWeight = xmmword_18DF4C770;
    *(_OWORD *)&v2->_c = xmmword_18DF4C7A0;
  }
  return v2;
}

+ (BOOL)isDateInWeekend:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isDateInWeekend__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isDateInWeekend__onceToken, &__block_literal_global_41);
  v5 = objc_msgSend((id)isDateInWeekend__calendar, "isDateInWeekend:", v4);

  return v5;
}

- (id)rankInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  long double v9;
  long double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  double v17;
  double timeOfWeekWeight;
  float v19;
  double v20;
  double outgoingWeight;
  int v22;
  int v23;
  uint64_t v24;
  NSArray *seedContacts;
  double locationWeight;
  double v27;
  NSArray *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  NSSet *referenceKeywords;
  double v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t j;
  char v54;
  double v55;
  double v56;
  double v57;
  double c;
  void *v59;
  void *v60;
  double v61;
  double v62;
  NSArray *v63;
  double v64;
  _CDGenericInteractionRanker *v66;
  double v67;
  double v68;
  double timeOfDayWeight;
  double v70;
  double v71;
  double timeWeight;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "laterDate:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  -[NSDate timeIntervalSinceDate:](self->_referenceDate, "timeIntervalSinceDate:", v5);
  v10 = v9;
  v11 = fmod(v9, 86400.0);
  if (v11 >= 86400.0 - v11)
    v12 = 86400.0 - v11;
  else
    v12 = v11;
  v13 = fmod(v10, 604800.0);
  if (v13 >= 604800.0 - v13)
    v14 = 604800.0 - v13;
  else
    v14 = v13;
  timeWeight = self->_timeWeight;
  v15 = v10 / self->_timeHalfLife;
  v70 = exp((float)-(float)(v15 * v15));
  timeOfDayWeight = self->_timeOfDayWeight;
  v16 = v12 / self->_timeOfDayHalfLife;
  v17 = exp((float)-(float)(v16 * v16));
  timeOfWeekWeight = self->_timeOfWeekWeight;
  v19 = v14 / self->_timeOfWeekHalfLife;
  v71 = exp((float)-(float)(v19 * v19));
  v20 = 1.0;
  outgoingWeight = 1.0;
  if (objc_msgSend(v4, "direction"))
    outgoingWeight = self->_outgoingWeight;
  if (self->_sameWeekPeriodWeight != self->_diffWeekPeriodWeight)
  {
    v22 = objc_msgSend((id)objc_opt_class(), "isDateInWeekend:", self->_referenceDate);
    v23 = objc_msgSend((id)objc_opt_class(), "isDateInWeekend:", v5);
    v24 = 136;
    if (v22 != v23)
      v24 = 144;
    v20 = *(double *)((char *)&self->super.isa + v24);
  }
  seedContacts = self->_seedContacts;
  locationWeight = 1.0;
  v27 = 1.0;
  if (seedContacts && -[NSArray count](seedContacts, "count"))
  {
    v66 = self;
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v28 = self->_seedContacts;
    v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    if (v29)
    {
      v30 = v29;
      v31 = 0;
      v32 = *(_QWORD *)v78;
      while (1)
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v78 != v32)
            objc_enumerationMutation(v28);
          v34 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend(v4, "sender", v66);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v35, "mayRepresentSamePersonAs:", v34))
          {

          }
          else
          {
            objc_msgSend(v4, "recipients");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = +[_CDInteractionAdvisorUtils contact:mayRepresentTheSamePersonAsOneOf:](_CDInteractionAdvisorUtils, "contact:mayRepresentTheSamePersonAsOneOf:", v34, v36);

            if (!v37)
              continue;
          }
          ++v31;
        }
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
        if (!v30)
          goto LABEL_30;
      }
    }
    v31 = 0;
LABEL_30:

    self = v66;
    if (v66->_requireAllSeedContacts && -[NSArray count](v66->_seedContacts, "count") > v31)
    {
      v38 = 0;
      goto LABEL_67;
    }
    v27 = v66->_socialWeight * (double)v31;
  }
  v67 = outgoingWeight;
  v68 = v12;
  if (self->_referenceLocationUUID
    && (objc_msgSend(v4, "locationUUID"), (v39 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v40 = (void *)v39;
    objc_msgSend(v4, "locationUUID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isEqualToString:", self->_referenceLocationUUID);

    if (v42)
    {
      locationWeight = self->_locationWeight;
      v42 = 1;
    }
  }
  else
  {
    v42 = 0;
  }
  referenceKeywords = self->_referenceKeywords;
  v44 = 1.0;
  if (referenceKeywords
    && -[NSSet count](referenceKeywords, "count")
    && (objc_msgSend(v4, "keywords"),
        v45 = (void *)objc_claimAutoreleasedReturnValue(),
        v46 = objc_msgSend(v45, "count"),
        v45,
        v46))
  {
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    objc_msgSend(v4, "keywords");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    if (v48)
    {
      v49 = v48;
      v50 = v20;
      v51 = 0;
      v52 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v49; ++j)
        {
          if (*(_QWORD *)v74 != v52)
            objc_enumerationMutation(v47);
          v51 += -[NSSet containsObject:](self->_referenceKeywords, "containsObject:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j), v66);
        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
      }
      while (v49);

      if (v51)
      {
        v54 = 0;
        v44 = self->_keywordWeight * (double)v51;
        goto LABEL_53;
      }
    }
    else
    {
      v50 = v20;

    }
  }
  else
  {
    v50 = v20;
  }
  v54 = 1;
LABEL_53:
  v55 = timeWeight * v70;
  v56 = timeOfDayWeight * v17;
  v57 = locationWeight * v44;
  c = self->_c;
  objc_msgSend(MEMORY[0x1E0C99E20], "set", v66);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if (fabs(v10) <= 7200.0 && v55 > 0.0)
    objc_msgSend(v59, "addObject:", &unk_1E272AB40);
  v61 = timeOfWeekWeight * v71;
  v62 = v27 * v57;
  if (v68 <= 7200.0 && v56 > 0.0)
    objc_msgSend(v60, "addObject:", &unk_1E272AB58, v68);
  v63 = self->_seedContacts;
  if (v63 && -[NSArray count](v63, "count"))
    objc_msgSend(v60, "addObject:", &unk_1E272AB70);
  v64 = v55 + v56 + v61 + c;
  if (v42)
    objc_msgSend(v60, "addObject:", &unk_1E272AB88);
  if ((v54 & 1) == 0)
    objc_msgSend(v60, "addObject:", &unk_1E272ABA0);
  v38 = (void *)objc_opt_new();
  objc_msgSend(v38, "setScore:", v64 * (v50 * (v67 * v62)));
  objc_msgSend(v38, "setReasons:", v60);

LABEL_67:
  return v38;
}

- (BOOL)canRankContacts
{
  NSSet *referenceKeywords;
  NSString *contactPrefix;

  referenceKeywords = self->_referenceKeywords;
  if (referenceKeywords && -[NSSet count](referenceKeywords, "count"))
  {
    LOBYTE(contactPrefix) = 1;
  }
  else
  {
    contactPrefix = self->_contactPrefix;
    if (contactPrefix)
      LOBYTE(contactPrefix) = -[NSString length](contactPrefix, "length") != 0;
  }
  return (char)contactPrefix;
}

- (double)rankContact:(id)a3
{
  id v4;
  NSString *contactPrefix;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  contactPrefix = self->_contactPrefix;
  if (!contactPrefix
    || !-[NSString length](contactPrefix, "length")
    || (v6 = 0.0, objc_msgSend(v4, "mayContainPrefix:", self->_contactPrefix)))
  {
    v6 = 1.0;
    if (self->_referenceKeywords)
    {
      objc_msgSend(v4, "displayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v4, "displayName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lowercaseString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(" "));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
        {
          v13 = v12;
          v14 = 0;
          v15 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v19 != v15)
                objc_enumerationMutation(v11);
              v14 += -[NSSet containsObject:](self->_referenceKeywords, "containsObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          }
          while (v13);

          if (v14 < 1)
            v6 = 1.0;
          else
            v6 = self->_contactNameKeywordMatchWeight * (double)v14;
        }
        else
        {

        }
      }
    }
  }

  return v6;
}

- (BOOL)contactIsAllowed:(id)a3
{
  id v4;
  void *v5;
  NSSet *allowedPersonIdType;
  void *v7;
  _BOOL4 v8;
  NSSet *allowedIdentifiers;
  void *v10;
  _BOOL4 v11;
  NSSet *allowedPersonIds;
  void *v13;
  char v14;

  v4 = a3;
  v5 = v4;
  allowedPersonIdType = self->_allowedPersonIdType;
  if (allowedPersonIdType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "personIdType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSSet containsObject:](allowedPersonIdType, "containsObject:", v7);

    if (!v8)
      goto LABEL_7;
  }
  allowedIdentifiers = self->_allowedIdentifiers;
  if (allowedIdentifiers
    && (objc_msgSend(v5, "identifier"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[NSSet containsObject:](allowedIdentifiers, "containsObject:", v10),
        v10,
        !v11))
  {
LABEL_7:
    v14 = 0;
  }
  else
  {
    allowedPersonIds = self->_allowedPersonIds;
    if (allowedPersonIds)
    {
      objc_msgSend(v5, "personId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[NSSet containsObject:](allowedPersonIds, "containsObject:", v13);

    }
    else
    {
      v14 = 1;
    }
  }

  return v14;
}

- (NSDate)referenceDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReferenceDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)seedContacts
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSeedContacts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)referenceLocationUUID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReferenceLocationUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSSet)referenceKeywords
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReferenceKeywords:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSSet)allowedIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAllowedIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSSet)allowedPersonIds
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAllowedPersonIds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSSet)allowedPersonIdType
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAllowedPersonIdType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)contactPrefix
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setContactPrefix:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (double)timeHalfLife
{
  return self->_timeHalfLife;
}

- (void)setTimeHalfLife:(double)a3
{
  self->_timeHalfLife = a3;
}

- (double)timeOfDayHalfLife
{
  return self->_timeOfDayHalfLife;
}

- (void)setTimeOfDayHalfLife:(double)a3
{
  self->_timeOfDayHalfLife = a3;
}

- (double)timeOfWeekHalfLife
{
  return self->_timeOfWeekHalfLife;
}

- (void)setTimeOfWeekHalfLife:(double)a3
{
  self->_timeOfWeekHalfLife = a3;
}

- (double)timeWeight
{
  return self->_timeWeight;
}

- (void)setTimeWeight:(double)a3
{
  self->_timeWeight = a3;
}

- (double)timeOfDayWeight
{
  return self->_timeOfDayWeight;
}

- (void)setTimeOfDayWeight:(double)a3
{
  self->_timeOfDayWeight = a3;
}

- (double)timeOfWeekWeight
{
  return self->_timeOfWeekWeight;
}

- (void)setTimeOfWeekWeight:(double)a3
{
  self->_timeOfWeekWeight = a3;
}

- (double)c
{
  return self->_c;
}

- (void)setC:(double)a3
{
  self->_c = a3;
}

- (double)sameWeekPeriodWeight
{
  return self->_sameWeekPeriodWeight;
}

- (void)setSameWeekPeriodWeight:(double)a3
{
  self->_sameWeekPeriodWeight = a3;
}

- (double)diffWeekPeriodWeight
{
  return self->_diffWeekPeriodWeight;
}

- (void)setDiffWeekPeriodWeight:(double)a3
{
  self->_diffWeekPeriodWeight = a3;
}

- (double)outgoingWeight
{
  return self->_outgoingWeight;
}

- (void)setOutgoingWeight:(double)a3
{
  self->_outgoingWeight = a3;
}

- (double)socialWeight
{
  return self->_socialWeight;
}

- (void)setSocialWeight:(double)a3
{
  self->_socialWeight = a3;
}

- (BOOL)requireAllSeedContacts
{
  return self->_requireAllSeedContacts;
}

- (void)setRequireAllSeedContacts:(BOOL)a3
{
  self->_requireAllSeedContacts = a3;
}

- (double)locationWeight
{
  return self->_locationWeight;
}

- (void)setLocationWeight:(double)a3
{
  self->_locationWeight = a3;
}

- (double)keywordWeight
{
  return self->_keywordWeight;
}

- (void)setKeywordWeight:(double)a3
{
  self->_keywordWeight = a3;
}

- (double)contactNameKeywordMatchWeight
{
  return self->_contactNameKeywordMatchWeight;
}

- (void)setContactNameKeywordMatchWeight:(double)a3
{
  self->_contactNameKeywordMatchWeight = a3;
}

- (unint64_t)rankAggregationMethod
{
  return self->_rankAggregationMethod;
}

- (void)setRankAggregationMethod:(unint64_t)a3
{
  self->_rankAggregationMethod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactPrefix, 0);
  objc_storeStrong((id *)&self->_allowedPersonIdType, 0);
  objc_storeStrong((id *)&self->_allowedPersonIds, 0);
  objc_storeStrong((id *)&self->_allowedIdentifiers, 0);
  objc_storeStrong((id *)&self->_referenceKeywords, 0);
  objc_storeStrong((id *)&self->_referenceLocationUUID, 0);
  objc_storeStrong((id *)&self->_seedContacts, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
}

@end
