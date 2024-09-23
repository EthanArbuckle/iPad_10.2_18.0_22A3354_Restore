@implementation ComponentSoftwareEnhancedLoggingState

- (BOOL)isPresent
{
  return 1;
}

- (void)populateAttributes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _BYTE v47[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "snapshot"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "status")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, ELSDefaultStatus);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "consent")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, ELSDefaultConsent);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "formatterWithType:", 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromDate:", v11));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, ELSSubDefaultDatesStart);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromDate:", v14));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, ELSSubDefaultDatesEnd);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queue"));

  if (v16)
  {
    v36 = v9;
    v38 = v3;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v37 = v5;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queue"));
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v42;
      v20 = ELSSubDefaultQueueEntryType;
      v21 = ELSSubDefaultQueueEntryExecuteAfterDuration;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v19)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "type"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[ELSWhitelist findEntryForBundleIdentifier:](ELSWhitelist, "findEntryForBundleIdentifier:", v24));

          if (v25)
          {
            v45[0] = v20;
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "parameterName"));
            v45[1] = v21;
            v46[0] = v26;
            objc_msgSend(v23, "executeAfterDuration");
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            v46[1] = v27;
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 2));
            objc_msgSend(v40, "addObject:", v28);

          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v18);
    }

    v3 = v38;
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v40, ELSDefaultQueue);

    v9 = v36;
    v5 = v37;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadata"));

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadata"));
    v31 = ELSMetadataEnrollmentTicketNumber;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", ELSMetadataEnrollmentTicketNumber));

    if (v32)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadata"));
    v34 = ELSMetadataGigafilesToken;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", ELSMetadataGigafilesToken));

    if (v35)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, v34);

  }
}

@end
