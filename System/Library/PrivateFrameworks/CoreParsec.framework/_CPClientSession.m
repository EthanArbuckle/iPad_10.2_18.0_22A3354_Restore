@implementation _CPClientSession

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CPClientSession agent](self, "agent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_CPClientSession userGuidString](self, "userGuidString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v7 = self->_resourceVersions;
  v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v43;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v11);
        v41 = 0;
        PBDataWriterPlaceMark();
        PBDataWriterWriteStringField();
        -[NSDictionary objectForKeyedSubscript:](self->_resourceVersions, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        PBDataWriterWriteStringField();

        PBDataWriterRecallMark();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v9);
  }

  -[_CPClientSession sessionStart](self, "sessionStart");
  if (v14 != 0.0)
    PBDataWriterWriteDoubleField();
  if (-[_CPClientSession previousSessionEndReason](self, "previousSessionEndReason"))
    PBDataWriterWriteInt32Field();
  if (-[_CPClientSession removeTimestamps](self, "removeTimestamps"))
    PBDataWriterWriteBOOLField();
  -[_CPClientSession parsecDeveloperID](self, "parsecDeveloperID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    PBDataWriterWriteStringField();
  if (-[_CPClientSession duEnabled](self, "duEnabled"))
    PBDataWriterWriteBOOLField();
  -[_CPClientSession countryCode](self, "countryCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    PBDataWriterWriteStringField();
  -[_CPClientSession locale](self, "locale");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    PBDataWriterWriteStringField();
  -[_CPClientSession usageSinceLookback](self, "usageSinceLookback");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[_CPClientSession usageSinceLookback](self, "usageSinceLookback");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPClientSession cohortsFeedback](self, "cohortsFeedback");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[_CPClientSession cohortsFeedback](self, "cohortsFeedback");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPClientSession devicePersistentD20](self, "devicePersistentD20"))
    PBDataWriterWriteUint32Field();
  if (-[_CPClientSession privateRelayStatus](self, "privateRelayStatus"))
    PBDataWriterWriteInt32Field();
  if (-[_CPClientSession isInternalCarry](self, "isInternalCarry"))
    PBDataWriterWriteBOOLField();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v22 = self->_experimentInfos;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v38;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(v22);
        PBDataWriterWriteSubmessage();
        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v24);
  }

  if (-[_CPClientSession searchOptOut](self, "searchOptOut"))
    PBDataWriterWriteBOOLField();
  -[_CPClientSession jsonFeedback](self, "jsonFeedback");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    PBDataWriterWriteDataField();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v28 = self->_feedbacks;
  v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v34;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v34 != v31)
          objc_enumerationMutation(v28);
        PBDataWriterWriteSubmessage();
        ++v32;
      }
      while (v30 != v32);
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v30);
  }

}

- (NSString)userGuidString
{
  return self->_userGuidString;
}

- (NSString)agent
{
  return self->_agent;
}

- (double)sessionStart
{
  return self->_sessionStart;
}

- (BOOL)duEnabled
{
  return self->_duEnabled;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (_CPUsageSinceLookback)usageSinceLookback
{
  return self->_usageSinceLookback;
}

- (BOOL)removeTimestamps
{
  return self->_removeTimestamps;
}

- (int)privateRelayStatus
{
  return self->_privateRelayStatus;
}

- (int)previousSessionEndReason
{
  return self->_previousSessionEndReason;
}

- (NSString)parsecDeveloperID
{
  return self->_parsecDeveloperID;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSData)jsonFeedback
{
  return self->_jsonFeedback;
}

- (BOOL)isInternalCarry
{
  return self->_isInternalCarry;
}

- (unsigned)devicePersistentD20
{
  return self->_devicePersistentD20;
}

- (_CPUsageEnvelope)cohortsFeedback
{
  return self->_cohortsFeedback;
}

- (void)setResourceVersions:(id)a3
{
  NSDictionary *v4;
  NSDictionary *resourceVersions;

  v4 = (NSDictionary *)objc_msgSend(a3, "mutableCopy");
  resourceVersions = self->_resourceVersions;
  self->_resourceVersions = v4;

}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setAgent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setUserGuidString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setSessionStart:(double)a3
{
  self->_sessionStart = a3;
}

- (void)setPrivateRelayStatus:(int)a3
{
  self->_privateRelayStatus = a3;
}

- (void)setIsInternalCarry:(BOOL)a3
{
  self->_isInternalCarry = a3;
}

- (void)setDuEnabled:(BOOL)a3
{
  self->_duEnabled = a3;
}

- (void)setDevicePersistentD20:(unsigned int)a3
{
  self->_devicePersistentD20 = a3;
}

- (void)setResourceVersions:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  NSDictionary *resourceVersions;
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (!self->_resourceVersions)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    resourceVersions = self->_resourceVersions;
    self->_resourceVersions = v8;

  }
  v10 = v7;
  v11 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NSDictionary setObject:forKey:](self->_resourceVersions, "setObject:forKey:", v11, v10);
  }

}

- (BOOL)getResourceVersions:(id *)a3 forKey:(id)a4
{
  void *v5;
  void *v6;

  -[NSDictionary objectForKeyedSubscript:](self->_resourceVersions, "objectForKeyedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 && v5)
    *a3 = objc_retainAutorelease(v5);

  return v6 != 0;
}

- (void)setExperimentInfo:(id)a3
{
  NSArray *v4;
  NSArray *experimentInfos;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  experimentInfos = self->_experimentInfos;
  self->_experimentInfos = v4;

}

- (void)clearExperimentInfo
{
  -[NSArray removeAllObjects](self->_experimentInfos, "removeAllObjects");
}

- (void)addExperimentInfo:(id)a3
{
  id v4;
  NSArray *experimentInfos;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  experimentInfos = self->_experimentInfos;
  v8 = v4;
  if (!experimentInfos)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_experimentInfos;
    self->_experimentInfos = v6;

    v4 = v8;
    experimentInfos = self->_experimentInfos;
  }
  -[NSArray addObject:](experimentInfos, "addObject:", v4);

}

- (unint64_t)experimentInfoCount
{
  return -[NSArray count](self->_experimentInfos, "count");
}

- (id)experimentInfoAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_experimentInfos, "objectAtIndexedSubscript:", a3);
}

- (void)setFeedback:(id)a3
{
  NSArray *v4;
  NSArray *feedbacks;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  feedbacks = self->_feedbacks;
  self->_feedbacks = v4;

}

- (void)clearFeedback
{
  -[NSArray removeAllObjects](self->_feedbacks, "removeAllObjects");
}

- (void)addFeedback:(id)a3
{
  id v4;
  NSArray *feedbacks;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  feedbacks = self->_feedbacks;
  v8 = v4;
  if (!feedbacks)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_feedbacks;
    self->_feedbacks = v6;

    v4 = v8;
    feedbacks = self->_feedbacks;
  }
  -[NSArray addObject:](feedbacks, "addObject:", v4);

}

- (unint64_t)feedbackCount
{
  return -[NSArray count](self->_feedbacks, "count");
}

- (id)feedbackAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_feedbacks, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _CPClientSessionReadFrom(self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  double sessionStart;
  double v23;
  int previousSessionEndReason;
  int removeTimestamps;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int duEnabled;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  unsigned int devicePersistentD20;
  int privateRelayStatus;
  int isInternalCarry;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  int searchOptOut;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  BOOL v71;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_65;
  -[_CPClientSession agent](self, "agent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "agent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_CPClientSession agent](self, "agent");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_CPClientSession agent](self, "agent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "agent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_65;
  }
  else
  {

  }
  -[_CPClientSession userGuidString](self, "userGuidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userGuidString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_CPClientSession userGuidString](self, "userGuidString");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_CPClientSession userGuidString](self, "userGuidString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userGuidString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_65;
  }
  else
  {

  }
  -[_CPClientSession resourceVersions](self, "resourceVersions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceVersions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_CPClientSession resourceVersions](self, "resourceVersions");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_CPClientSession resourceVersions](self, "resourceVersions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resourceVersions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_65;
  }
  else
  {

  }
  sessionStart = self->_sessionStart;
  objc_msgSend(v4, "sessionStart");
  if (sessionStart != v23)
    goto LABEL_65;
  previousSessionEndReason = self->_previousSessionEndReason;
  if (previousSessionEndReason != objc_msgSend(v4, "previousSessionEndReason"))
    goto LABEL_65;
  removeTimestamps = self->_removeTimestamps;
  if (removeTimestamps != objc_msgSend(v4, "removeTimestamps"))
    goto LABEL_65;
  -[_CPClientSession parsecDeveloperID](self, "parsecDeveloperID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parsecDeveloperID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_CPClientSession parsecDeveloperID](self, "parsecDeveloperID");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[_CPClientSession parsecDeveloperID](self, "parsecDeveloperID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parsecDeveloperID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_65;
  }
  else
  {

  }
  duEnabled = self->_duEnabled;
  if (duEnabled != objc_msgSend(v4, "duEnabled"))
    goto LABEL_65;
  -[_CPClientSession countryCode](self, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_CPClientSession countryCode](self, "countryCode");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_CPClientSession countryCode](self, "countryCode");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "countryCode");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_65;
  }
  else
  {

  }
  -[_CPClientSession locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_CPClientSession locale](self, "locale");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_CPClientSession locale](self, "locale");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locale");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_65;
  }
  else
  {

  }
  -[_CPClientSession usageSinceLookback](self, "usageSinceLookback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usageSinceLookback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_CPClientSession usageSinceLookback](self, "usageSinceLookback");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_CPClientSession usageSinceLookback](self, "usageSinceLookback");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "usageSinceLookback");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_65;
  }
  else
  {

  }
  -[_CPClientSession cohortsFeedback](self, "cohortsFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cohortsFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_CPClientSession cohortsFeedback](self, "cohortsFeedback");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_CPClientSession cohortsFeedback](self, "cohortsFeedback");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cohortsFeedback");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_65;
  }
  else
  {

  }
  devicePersistentD20 = self->_devicePersistentD20;
  if (devicePersistentD20 != objc_msgSend(v4, "devicePersistentD20"))
    goto LABEL_65;
  privateRelayStatus = self->_privateRelayStatus;
  if (privateRelayStatus != objc_msgSend(v4, "privateRelayStatus"))
    goto LABEL_65;
  isInternalCarry = self->_isInternalCarry;
  if (isInternalCarry != objc_msgSend(v4, "isInternalCarry"))
    goto LABEL_65;
  -[_CPClientSession experimentInfos](self, "experimentInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_CPClientSession experimentInfos](self, "experimentInfos");
  v55 = objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    v56 = (void *)v55;
    -[_CPClientSession experimentInfos](self, "experimentInfos");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentInfos");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v57, "isEqual:", v58);

    if (!v59)
      goto LABEL_65;
  }
  else
  {

  }
  searchOptOut = self->_searchOptOut;
  if (searchOptOut != objc_msgSend(v4, "searchOptOut"))
    goto LABEL_65;
  -[_CPClientSession jsonFeedback](self, "jsonFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jsonFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_CPClientSession jsonFeedback](self, "jsonFeedback");
  v61 = objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    v62 = (void *)v61;
    -[_CPClientSession jsonFeedback](self, "jsonFeedback");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jsonFeedback");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v63, "isEqual:", v64);

    if (!v65)
      goto LABEL_65;
  }
  else
  {

  }
  -[_CPClientSession feedbacks](self, "feedbacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feedbacks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_64:

    goto LABEL_65;
  }
  -[_CPClientSession feedbacks](self, "feedbacks");
  v66 = objc_claimAutoreleasedReturnValue();
  if (!v66)
  {

LABEL_68:
    v71 = 1;
    goto LABEL_66;
  }
  v67 = (void *)v66;
  -[_CPClientSession feedbacks](self, "feedbacks");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feedbacks");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v68, "isEqual:", v69);

  if ((v70 & 1) != 0)
    goto LABEL_68;
LABEL_65:
  v71 = 0;
LABEL_66:

  return v71;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  double sessionStart;
  double v7;
  long double v8;
  NSUInteger v9;
  NSUInteger v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSUInteger v20;
  uint64_t v21;
  NSUInteger v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  NSUInteger v26;

  v3 = -[NSString hash](self->_agent, "hash");
  v4 = -[NSString hash](self->_userGuidString, "hash") ^ v3;
  v5 = -[NSDictionary hash](self->_resourceVersions, "hash");
  sessionStart = self->_sessionStart;
  v26 = v4 ^ v5;
  v7 = -sessionStart;
  if (sessionStart >= 0.0)
    v7 = self->_sessionStart;
  v8 = round(v7);
  v25 = (unint64_t)(fmod(v8, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v7 - v8, 0x40uLL);
  v23 = 2654435761 * self->_removeTimestamps;
  v24 = 2654435761 * self->_previousSessionEndReason;
  v9 = -[NSString hash](self->_parsecDeveloperID, "hash");
  v21 = 2654435761 * self->_duEnabled;
  v22 = v9;
  v20 = -[NSString hash](self->_countryCode, "hash");
  v10 = -[NSString hash](self->_locale, "hash");
  v11 = -[_CPUsageSinceLookback hash](self->_usageSinceLookback, "hash");
  v12 = -[_CPUsageEnvelope hash](self->_cohortsFeedback, "hash");
  v13 = 2654435761 * self->_devicePersistentD20;
  v14 = 2654435761 * self->_privateRelayStatus;
  v15 = 2654435761 * self->_isInternalCarry;
  v16 = -[NSArray hash](self->_experimentInfos, "hash");
  v17 = 2654435761 * self->_searchOptOut;
  v18 = -[NSData hash](self->_jsonFeedback, "hash");
  return v26 ^ v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ -[NSArray hash](self->_feedbacks, "hash") ^ v25;
}

- (NSDictionary)resourceVersions
{
  return self->_resourceVersions;
}

- (void)setPreviousSessionEndReason:(int)a3
{
  self->_previousSessionEndReason = a3;
}

- (void)setRemoveTimestamps:(BOOL)a3
{
  self->_removeTimestamps = a3;
}

- (void)setParsecDeveloperID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setUsageSinceLookback:(id)a3
{
  objc_storeStrong((id *)&self->_usageSinceLookback, a3);
}

- (void)setCohortsFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_cohortsFeedback, a3);
}

- (NSArray)experimentInfos
{
  return self->_experimentInfos;
}

- (void)setExperimentInfos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)searchOptOut
{
  return self->_searchOptOut;
}

- (void)setSearchOptOut:(BOOL)a3
{
  self->_searchOptOut = a3;
}

- (void)setJsonFeedback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)feedbacks
{
  return self->_feedbacks;
}

- (void)setFeedbacks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbacks, 0);
  objc_storeStrong((id *)&self->_jsonFeedback, 0);
  objc_storeStrong((id *)&self->_experimentInfos, 0);
  objc_storeStrong((id *)&self->_cohortsFeedback, 0);
  objc_storeStrong((id *)&self->_usageSinceLookback, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_parsecDeveloperID, 0);
  objc_storeStrong((id *)&self->_resourceVersions, 0);
  objc_storeStrong((id *)&self->_userGuidString, 0);
  objc_storeStrong((id *)&self->_agent, 0);
}

@end
