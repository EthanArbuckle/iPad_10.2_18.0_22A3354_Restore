@implementation IAMImpression

- (IAMImpression)initWithMessageEntry:(id)a3 targetIdentifier:(id)a4
{
  id v7;
  id v8;
  IAMImpression *v9;
  IAMImpression *v10;
  uint64_t v11;
  NSString *targetIdentifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IAMImpression;
  v9 = -[IAMImpression init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageEntry, a3);
    v11 = objc_msgSend(v8, "copy");
    targetIdentifier = v10->_targetIdentifier;
    v10->_targetIdentifier = (NSString *)v11;

  }
  return v10;
}

- (NSString)messageIdentifier
{
  void *v2;
  void *v3;

  -[ICInAppMessageEntry applicationMessage](self->_messageEntry, "applicationMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int)messageType
{
  void *v2;
  int v3;

  -[ICInAppMessageEntry applicationMessage](self->_messageEntry, "applicationMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "messageType");

  return v3;
}

- (NSString)targetIdentifier
{
  return self->_targetIdentifier;
}

- (void)setTargetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ICInAppMessageEntry)messageEntry
{
  return self->_messageEntry;
}

- (void)setMessageEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)displayStartTime
{
  return self->_displayStartTime;
}

- (void)setDisplayStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)displayEndTime
{
  return self->_displayEndTime;
}

- (void)setDisplayEndTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayEndTime, 0);
  objc_storeStrong((id *)&self->_displayStartTime, 0);
  objc_storeStrong((id *)&self->_messageEntry, 0);
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
}

- (id)reportableMetricsEventDictionary
{
  void *v3;
  void *v4;
  int v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  void *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  -[IAMImpression messageEntry](self, "messageEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasImpressionEvent");

  if (v5)
  {
    -[IAMImpression messageEntry](self, "messageEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "impressionEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    if (objc_msgSend(v9, "hasImpression"))
    {
      objc_msgSend(v9, "impression");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "mutableCopy");

      objc_msgSend(v9, "setImpression:", 0);
    }
    else
    {
      v12 = (void *)objc_opt_new();
    }
    -[IAMImpression messageIdentifier](self, "messageIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("id"));

    -[IAMImpression targetIdentifier](self, "targetIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("name"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("impressionId"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("impressionIndex"));

    -[IAMImpression displayStartTime](self, "displayStartTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[IAMImpression displayStartTime](self, "displayStartTime");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSince1970");
      v23 = (uint64_t)(v22 * 1000.0);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v24;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, CFSTR("impressionTimes"));

      -[IAMImpression displayEndTime](self, "displayEndTime");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        -[IAMImpression displayEndTime](self, "displayEndTime");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSince1970");
        v29 = (uint64_t)(v28 * 1000.0);

        v40[0] = CFSTR("s");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v23);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = CFSTR("d");
        v41[0] = v30;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v29 - v23);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v31;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v32;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v33, CFSTR("viewedInfo"));

      }
    }
    objc_msgSend(v9, "reportableDictionary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "mutableCopy");

    v36 = (void *)objc_msgSend(v12, "copy");
    v39 = v36;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v37, CFSTR("impressions"));

    v13 = (void *)objc_msgSend(v35, "copy");
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

@end
