@implementation ANAnalyticsDailyAnnouncements

- (ANAnalyticsDailyAnnouncements)init
{
  return -[ANAnalyticsDailyAnnouncements initWithLastAccess:](self, "initWithLastAccess:", 0.0);
}

- (ANAnalyticsDailyAnnouncements)initWithLastAccess:(double)a3
{
  ANAnalyticsDailyAnnouncements *v4;
  ANAnalyticsDailyAnnouncements *v5;
  uint64_t v6;
  NSMutableDictionary *homes;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ANAnalyticsDailyAnnouncements;
  v4 = -[ANAnalyticsDailyAnnouncements init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lastAccess = a3;
    v6 = objc_opt_new();
    homes = v5->_homes;
    v5->_homes = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (ANAnalyticsDailyAnnouncements)initWithDictionary:(id)a3
{
  id v4;
  ANAnalyticsDailyAnnouncements *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  NSMutableDictionary *homes;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ANAnalyticsDailyAnnouncements init](self, "init");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("lastAccess"), (_QWORD)v16))
        {
          objc_msgSend(v6, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "doubleValue");
          v5->_lastAccess = v13;
        }
        else
        {
          homes = v5->_homes;
          objc_msgSend(v6, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](homes, "setObject:forKey:", v12, v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[ANAnalyticsDailyAnnouncements lastAccess](self, "lastAccess");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("lastAccess"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ANAnalyticsDailyAnnouncements homes](self, "homes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        -[ANAnalyticsDailyAnnouncements homes](self, "homes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v3;
}

- (void)merge:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t i;
  uint64_t v14;
  ANAnalyticsDailyAnnouncements *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v35 = a3;
  objc_msgSend(v35, "homes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v42;
    v30 = *(_QWORD *)v42;
    do
    {
      v7 = 0;
      v31 = v5;
      do
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v7);
        -[ANAnalyticsDailyAnnouncements homes](self, "homes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          objc_msgSend(v35, "homes");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v36)
          {
            v33 = v7;
            v34 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v36; ++i)
              {
                if (*(_QWORD *)v38 != v34)
                  objc_enumerationMutation(v12);
                v14 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
                v15 = self;
                -[ANAnalyticsDailyAnnouncements homes](self, "homes");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectForKeyedSubscript:", v8);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = (void *)objc_msgSend(v17, "mutableCopy");

                objc_msgSend(v18, "objectForKeyedSubscript:", v14);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "homes");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "objectForKeyedSubscript:", v8);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectForKeyedSubscript:", v14);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (v19)
                {
                  v23 = objc_msgSend(v19, "unsignedIntegerValue");
                  v24 = objc_msgSend(v22, "unsignedIntegerValue");
                  if (v23 <= v24)
                    v25 = v24;
                  else
                    v25 = v23;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "setObject:forKey:", v26, v14);

                }
                else
                {
                  objc_msgSend(v18, "setObject:forKey:", v22, v14);
                }
                -[ANAnalyticsDailyAnnouncements homes](v15, "homes");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v18, v8);

                self = v15;
              }
              v36 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            }
            while (v36);
            v6 = v30;
            v5 = v31;
            v7 = v33;
          }
        }
        else
        {
          objc_msgSend(v35, "homes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v8);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[ANAnalyticsDailyAnnouncements homes](self, "homes");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v8);

        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v5);
  }

}

- (unint64_t)announcementsCount
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ANAnalyticsDailyAnnouncements homes](self, "homes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  v3 = 0;
  if (v19)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(obj);
        v20 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v4);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        -[ANAnalyticsDailyAnnouncements homes](self, "homes");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v22;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v22 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
              -[ANAnalyticsDailyAnnouncements homes](self, "homes");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", v5);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKey:", v12);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              v3 += objc_msgSend(v15, "unsignedIntegerValue");
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v9);
        }

        v4 = v20 + 1;
      }
      while (v20 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v19);
  }

  return v3;
}

- (unint64_t)homesCount
{
  void *v2;
  unint64_t v3;

  -[ANAnalyticsDailyAnnouncements homes](self, "homes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)shouldReport
{
  void *v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4 + -43200.0;

  -[ANAnalyticsDailyAnnouncements lastAccess](self, "lastAccess");
  return v6 < v5;
}

- (void)incrementCountInHome:(id)a3 group:(id)a4
{
  id v6;
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
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnalyticsDailyAnnouncements homes](self, "homes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ANAnalyticsDailyAnnouncements homes](self, "homes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "objectForKeyedSubscript:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue") + 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v16, v6);

    }
    else
    {
      objc_msgSend(v13, "setObject:forKey:", &unk_1E939CD50, v6);
    }
    -[ANAnalyticsDailyAnnouncements homes](self, "homes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, v7);

  }
  else
  {
    v19 = v6;
    v20[0] = &unk_1E939CD50;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v17, v7);

  }
}

- (double)lastAccess
{
  return self->_lastAccess;
}

- (void)setLastAccess:(double)a3
{
  self->_lastAccess = a3;
}

- (NSMutableDictionary)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
  objc_storeStrong((id *)&self->_homes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homes, 0);
}

@end
