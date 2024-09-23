@implementation MXDiagnosticPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *timeStampBegin;
  id v5;

  timeStampBegin = self->_timeStampBegin;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", timeStampBegin, CFSTR("timeStampBegin"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeStampEnd, CFSTR("timeStampEnd"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cpuExceptionDiagnostics, CFSTR("cpuExceptionDiagnostics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_diskWriteExceptionDiagnostics, CFSTR("diskWriteExceptionDiagnostics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hangDiagnostics, CFSTR("hangDiagnostics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appLaunchDiagnostics, CFSTR("appLaunchDiagnostics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_crashDiagnostics, CFSTR("crashDiagnostics"));

}

- (MXDiagnosticPayload)initWithCoder:(id)a3
{
  id v4;
  MXDiagnosticPayload *v5;
  uint64_t v6;
  NSDate *timeStampBegin;
  uint64_t v8;
  NSDate *timeStampEnd;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *cpuExceptionDiagnostics;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *diskWriteExceptionDiagnostics;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *hangDiagnostics;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSArray *appLaunchDiagnostics;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSArray *crashDiagnostics;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MXDiagnosticPayload;
  v5 = -[MXDiagnosticPayload init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeStampBegin"));
    v6 = objc_claimAutoreleasedReturnValue();
    timeStampBegin = v5->_timeStampBegin;
    v5->_timeStampBegin = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeStampEnd"));
    v8 = objc_claimAutoreleasedReturnValue();
    timeStampEnd = v5->_timeStampEnd;
    v5->_timeStampEnd = (NSDate *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("cpuExceptionDiagnostics"));
    v13 = objc_claimAutoreleasedReturnValue();
    cpuExceptionDiagnostics = v5->_cpuExceptionDiagnostics;
    v5->_cpuExceptionDiagnostics = (NSArray *)v13;

    v15 = (void *)MEMORY[0x24BDBCF20];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("diskWriteExceptionDiagnostics"));
    v18 = objc_claimAutoreleasedReturnValue();
    diskWriteExceptionDiagnostics = v5->_diskWriteExceptionDiagnostics;
    v5->_diskWriteExceptionDiagnostics = (NSArray *)v18;

    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("hangDiagnostics"));
    v23 = objc_claimAutoreleasedReturnValue();
    hangDiagnostics = v5->_hangDiagnostics;
    v5->_hangDiagnostics = (NSArray *)v23;

    v25 = (void *)MEMORY[0x24BDBCF20];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("appLaunchDiagnostics"));
    v28 = objc_claimAutoreleasedReturnValue();
    appLaunchDiagnostics = v5->_appLaunchDiagnostics;
    v5->_appLaunchDiagnostics = (NSArray *)v28;

    v30 = (void *)MEMORY[0x24BDBCF20];
    v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("crashDiagnostics"));
    v33 = objc_claimAutoreleasedReturnValue();
    crashDiagnostics = v5->_crashDiagnostics;
    v5->_crashDiagnostics = (NSArray *)v33;

  }
  return v5;
}

- (MXDiagnosticPayload)initWithTimeStampBegin:(id)a3 withTimeStampEnd:(id)a4 withDiagnostics:(id)a5
{
  id v9;
  id v10;
  id v11;
  MXDiagnosticPayload *v12;
  MXDiagnosticPayload *v13;
  uint64_t v14;
  NSArray *cpuExceptionDiagnostics;
  uint64_t v16;
  NSArray *diskWriteExceptionDiagnostics;
  uint64_t v18;
  NSArray *hangDiagnostics;
  uint64_t v20;
  NSArray *appLaunchDiagnostics;
  uint64_t v22;
  NSArray *crashDiagnostics;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MXDiagnosticPayload;
  v12 = -[MXDiagnosticPayload init](&v25, sel_init);
  if (!v12)
    goto LABEL_5;
  v13 = 0;
  if (v9 && v10)
  {
    objc_msgSend(v11, "valueForKey:", CFSTR("cpuExceptionDiagnostics"));
    v14 = objc_claimAutoreleasedReturnValue();
    cpuExceptionDiagnostics = v12->_cpuExceptionDiagnostics;
    v12->_cpuExceptionDiagnostics = (NSArray *)v14;

    objc_msgSend(v11, "valueForKey:", CFSTR("diskWriteExceptionDiagnostics"));
    v16 = objc_claimAutoreleasedReturnValue();
    diskWriteExceptionDiagnostics = v12->_diskWriteExceptionDiagnostics;
    v12->_diskWriteExceptionDiagnostics = (NSArray *)v16;

    objc_msgSend(v11, "valueForKey:", CFSTR("hangDiagnostics"));
    v18 = objc_claimAutoreleasedReturnValue();
    hangDiagnostics = v12->_hangDiagnostics;
    v12->_hangDiagnostics = (NSArray *)v18;

    objc_msgSend(v11, "valueForKey:", CFSTR("appLaunchDiagnostics"));
    v20 = objc_claimAutoreleasedReturnValue();
    appLaunchDiagnostics = v12->_appLaunchDiagnostics;
    v12->_appLaunchDiagnostics = (NSArray *)v20;

    objc_msgSend(v11, "valueForKey:", CFSTR("crashDiagnostics"));
    v22 = objc_claimAutoreleasedReturnValue();
    crashDiagnostics = v12->_crashDiagnostics;
    v12->_crashDiagnostics = (NSArray *)v22;

    objc_storeStrong((id *)&v12->_timeStampEnd, a4);
    objc_storeStrong((id *)&v12->_timeStampBegin, a3);
LABEL_5:
    v13 = v12;
  }

  return v13;
}

- (NSData)JSONRepresentation
{
  void *v2;
  void *v3;
  id v5;

  -[MXDiagnosticPayload toDictionary](self, "toDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    v5 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 1, &v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)toDictionary
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  NSArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v4, "setLocale:", v5);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  if (self->_timeStampBegin)
  {
    objc_msgSend(v4, "stringFromDate:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("timeStampBegin"));

  }
  if (self->_timeStampEnd)
  {
    objc_msgSend(v4, "stringFromDate:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timeStampEnd"));

  }
  if (self->_cpuExceptionDiagnostics)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v9 = self->_cpuExceptionDiagnostics;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v61;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v61 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * v13), "toDictionary");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("cpuExceptionDiagnostics"));
  }
  if (self->_diskWriteExceptionDiagnostics)
  {
    v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v16 = self->_diskWriteExceptionDiagnostics;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v57;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v57 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v20), "toDictionary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setValue:forKey:", v15, CFSTR("diskWriteExceptionDiagnostics"));
  }
  if (self->_hangDiagnostics)
  {
    v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v23 = self->_hangDiagnostics;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v53;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v53 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v27), "toDictionary");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

          ++v27;
        }
        while (v25 != v27);
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setValue:forKey:", v22, CFSTR("hangDiagnostics"));
  }
  if (self->_appLaunchDiagnostics)
  {
    v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v30 = self->_appLaunchDiagnostics;
    v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v49;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v49 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v34), "toDictionary");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v35);

          ++v34;
        }
        while (v32 != v34);
        v32 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
      }
      while (v32);
    }

    objc_msgSend(v3, "setValue:forKey:", v29, CFSTR("appLaunchDiagnostics"));
  }
  if (self->_crashDiagnostics)
  {
    v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v37 = self->_crashDiagnostics;
    v38 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v44, v64, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v45;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v45 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v41), "toDictionary", (_QWORD)v44);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v42);

          ++v41;
        }
        while (v39 != v41);
        v39 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v44, v64, 16);
      }
      while (v39);
    }

    objc_msgSend(v3, "setValue:forKey:", v36, CFSTR("crashDiagnostics"));
  }

  return v3;
}

- (NSArray)cpuExceptionDiagnostics
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)diskWriteExceptionDiagnostics
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)hangDiagnostics
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)appLaunchDiagnostics
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)crashDiagnostics
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)timeStampBegin
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)timeStampEnd
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStampEnd, 0);
  objc_storeStrong((id *)&self->_timeStampBegin, 0);
  objc_storeStrong((id *)&self->_crashDiagnostics, 0);
  objc_storeStrong((id *)&self->_appLaunchDiagnostics, 0);
  objc_storeStrong((id *)&self->_hangDiagnostics, 0);
  objc_storeStrong((id *)&self->_diskWriteExceptionDiagnostics, 0);
  objc_storeStrong((id *)&self->_cpuExceptionDiagnostics, 0);
}

@end
