@implementation CLSInvestigation

- (CLSInvestigation)initWithClueCollection:(id)a3 profiles:(id)a4 helper:(id)a5
{
  id v9;
  id v10;
  CLSInvestigation *v11;
  CLSInvestigation *v12;
  uint64_t v13;
  NSMutableArray *profiles;

  v9 = a3;
  v10 = a4;
  v11 = -[CLSInvestigation initWithHelper:](self, "initWithHelper:", a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_clueCollection, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    profiles = v12->_profiles;
    v12->_profiles = (NSMutableArray *)v13;

  }
  return v12;
}

- (CLSInvestigation)initWithFeeder:(id)a3 profiles:(id)a4 helper:(id)a5
{
  id v9;
  id v10;
  CLSInvestigation *v11;
  CLSInvestigation *v12;
  uint64_t v13;
  NSMutableArray *profiles;

  v9 = a3;
  v10 = a4;
  v11 = -[CLSInvestigation initWithHelper:](self, "initWithHelper:", a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_feeder, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    profiles = v12->_profiles;
    v12->_profiles = (NSMutableArray *)v13;

    -[CLSInvestigation setInterviewDelegate:](v12, "setInterviewDelegate:", v9);
  }

  return v12;
}

- (CLSInvestigation)initWithHelper:(id)a3
{
  id v5;
  CLSInvestigation *v6;
  uint64_t v7;
  NSString *uuid;
  CLSInvestigationFeeder *feeder;
  NSMutableArray *profiles;
  id context;
  CLSClueCollection *v12;
  void *v13;
  uint64_t v14;
  CLSClueCollection *clueCollection;
  NSArray *informants;
  uint64_t v17;
  NSMutableDictionary *tracesLogsByURIs;
  uint64_t v19;
  NSMutableArray *tracesLogsURIs;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLSInvestigation;
  v6 = -[CLSInvestigation init](&v22, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "cls_generateUUID");
    v7 = objc_claimAutoreleasedReturnValue();
    uuid = v6->_uuid;
    v6->_uuid = (NSString *)v7;

    feeder = v6->_feeder;
    v6->_feeder = 0;

    profiles = v6->_profiles;
    v6->_profiles = 0;

    objc_storeWeak((id *)&v6->_delegate, 0);
    objc_storeWeak((id *)&v6->_interviewDelegate, 0);
    context = v6->_context;
    v6->_context = 0;

    objc_storeWeak((id *)&v6->_inspector, 0);
    v12 = [CLSClueCollection alloc];
    objc_msgSend(v5, "serviceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CLSClueCollection initWithServiceManager:](v12, "initWithServiceManager:", v13);
    clueCollection = v6->_clueCollection;
    v6->_clueCollection = (CLSClueCollection *)v14;

    informants = v6->_informants;
    v6->_precision = 2;
    v6->_informants = 0;

    objc_storeStrong((id *)&v6->_helper, a3);
    v17 = objc_opt_new();
    tracesLogsByURIs = v6->_tracesLogsByURIs;
    v6->_tracesLogsByURIs = (NSMutableDictionary *)v17;

    v19 = objc_opt_new();
    tracesLogsURIs = v6->_tracesLogsURIs;
    v6->_tracesLogsURIs = (NSMutableArray *)v19;

    v6->_enableDebuggingClues = 0;
    v6->_investigationFlags = 0;
  }

  return v6;
}

- (CLSInvestigation)initWithProfiles:(id)a3 helper:(id)a4
{
  id v6;
  CLSInvestigation *v7;
  uint64_t v8;
  NSMutableArray *profiles;

  v6 = a3;
  v7 = -[CLSInvestigation initWithHelper:](self, "initWithHelper:", a4);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    profiles = v7->_profiles;
    v7->_profiles = (NSMutableArray *)v8;

  }
  return v7;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  char v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_BYTE *)&self->_investigationFlags = *(_BYTE *)&self->_investigationFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_BYTE *)&self->_investigationFlags = *(_BYTE *)&self->_investigationFlags & 0xFD | v5;
  }

}

- (void)setInterviewDelegate:(id)a3
{
  id WeakRetained;
  char v5;
  char v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interviewDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_interviewDelegate, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 4;
    else
      v5 = 0;
    *(_BYTE *)&self->_investigationFlags = *(_BYTE *)&self->_investigationFlags & 0xFB | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 8;
    else
      v6 = 0;
    *(_BYTE *)&self->_investigationFlags = *(_BYTE *)&self->_investigationFlags & 0xF7 | v6;
  }

}

- (id)description
{
  return -[CLSInvestigation description:](self, "description:", 1);
}

- (id)description:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\n<Investigation> [%@]"), self->_uuid);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\n\tprofiles:"));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_profiles;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cls_indentBy:", 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("\n%@"), v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  -[CLSClueCollection description](self->_clueCollection, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cls_indentBy:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\n%@"), v14);

  if (v3)
  {
    -[CLSInvestigation tracesDescription](self, "tracesDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cls_indentBy:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n\n%@"), v16);

  }
  return v5;
}

- (void)_willBeginInvestigation:(id)a3
{
  CLSInvestigation *v4;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_storeWeak((id *)&v4->_inspector, obj);
  if ((*(_BYTE *)&v4->_investigationFlags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v4->_delegate);
    v6 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "investigationWillBegin:", v4);

  }
  objc_sync_exit(v4);

}

- (void)_didEndInvestigation:(BOOL)a3
{
  CLSInvestigation *v3;
  id WeakRetained;
  void *v5;
  CLSInvestigation *obj;

  obj = self;
  objc_sync_enter(obj);
  v3 = obj;
  if ((*(_BYTE *)&obj->_investigationFlags & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&obj->_delegate);
    v5 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "investigationDidEnd:", obj);

    v3 = obj;
  }
  objc_sync_exit(v3);

}

- (unint64_t)numberOfItems
{
  id WeakRetained;
  void *v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_investigationFlags & 4) == 0)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interviewDelegate);
  if (!WeakRetained)
    return 0;
  v4 = WeakRetained;
  v5 = objc_msgSend(WeakRetained, "numberOfItemsInInvestigation:", self);

  return v5;
}

- (id)sampleOfItems
{
  id WeakRetained;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t precision;
  double v9;
  double v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t i;

  if ((*(_BYTE *)&self->_investigationFlags & 8) != 0
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_interviewDelegate)) != 0)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "sampleOfItemsInInvestigation:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CLSInvestigation numberOfItems](self, "numberOfItems");
    if (v6)
    {
      v7 = v6;
      precision = self->_precision;
      v9 = 0.2;
      v10 = 0.5;
      v11 = 25;
      if (precision == 1)
      {
        v10 = 1.0;
        v11 = 1000;
      }
      if (precision == 3)
      {
        v12 = 10;
      }
      else
      {
        v9 = v10;
        v12 = v11;
      }
      v13 = vcvtmd_u64_f64(1.0 / v9);
      if (v6 / v13 > v12)
        v13 = v6 / v12;
      for (i = 0; i < v7; i += v13)
        objc_msgSend(v5, "addIndex:", i);
    }
  }
  return v5;
}

- (id)_traceStringForType:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return 0;
  else
    return off_1E84F8590[a3 - 1];
}

- (id)tracesDescription
{
  id v3;
  CLSInvestigation *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id *p_isa;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = self;
  objc_sync_enter(v4);
  p_isa = (id *)&v4->super.isa;
  if (-[NSMutableDictionary count](v4->_tracesLogsByURIs, "count"))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("<Traces>"));
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v4->_tracesLogsURIs;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v20)
    {
      v19 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(obj);
          v5 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v3, "appendFormat:", CFSTR("\n\t<%@>"), v5);
          objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          objc_msgSend(p_isa[11], "objectForKey:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v7)
          {
            v8 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v7; ++j)
              {
                if (*(_QWORD *)v24 != v8)
                  objc_enumerationMutation(v6);
                v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
                v11 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v10, "objectForKey:", CFSTR("type"));
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(p_isa, "_traceStringForType:", objc_msgSend(v12, "unsignedIntegerValue"));
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "objectForKey:", CFSTR("description"));
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@> %@"), v13, v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "cls_indentBy:", 2);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "appendString:", v16);

                objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
              }
              v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v7);
          }

        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v20);
    }

  }
  objc_sync_exit(p_isa);

  return v3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (CLSInvestigationFeeder)feeder
{
  return self->_feeder;
}

- (NSArray)profiles
{
  return &self->_profiles->super;
}

- (CLSInvestigationDelegate)delegate
{
  return (CLSInvestigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CLSInvestigationInterviewDelegate)interviewDelegate
{
  return (CLSInvestigationInterviewDelegate *)objc_loadWeakRetained((id *)&self->_interviewDelegate);
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (CLSClueCollection)clueCollection
{
  return (CLSClueCollection *)objc_getProperty(self, a2, 64, 1);
}

- (unint64_t)precision
{
  return self->_precision;
}

- (void)setPrecision:(unint64_t)a3
{
  self->_precision = a3;
}

- (CLSInvestigationHelper)helper
{
  return (CLSInvestigationHelper *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)enableDebuggingClues
{
  return self->_enableDebuggingClues;
}

- (void)setEnableDebuggingClues:(BOOL)a3
{
  self->_enableDebuggingClues = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_tracesLogsURIs, 0);
  objc_storeStrong((id *)&self->_tracesLogsByURIs, 0);
  objc_storeStrong((id *)&self->_informants, 0);
  objc_storeStrong((id *)&self->_clueCollection, 0);
  objc_destroyWeak((id *)&self->_inspector);
  objc_storeStrong((id *)&self->_profiles, 0);
  objc_destroyWeak((id *)&self->_interviewDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feeder, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)investigationWithProfiles:(id)a3 helper:(id)a4
{
  id v5;
  id v6;
  CLSInvestigation *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CLSInvestigation initWithProfiles:helper:]([CLSInvestigation alloc], "initWithProfiles:helper:", v6, v5);

  return v7;
}

+ (id)investigationWithProfiles:(id)a3 clueDates:(id)a4 clueLocations:(id)a5 cluePeoples:(id)a6 helper:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  CLSInvestigation *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a3;
  v16 = -[CLSInvestigation initWithProfiles:helper:]([CLSInvestigation alloc], "initWithProfiles:helper:", v15, v14);

  v17 = (void *)objc_opt_new();
  if (v11 && objc_msgSend(v11, "count"))
  {
    objc_msgSend(v14, "serviceManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLSInputTimeClue clueWithDates:serviceManager:](CLSInputTimeClue, "clueWithDates:serviceManager:", v11, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v20);

  }
  if (v12 && objc_msgSend(v12, "count"))
  {
    objc_msgSend(v14, "locationCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLSInputLocationClue cluesWithLocations:locationCache:](CLSInputLocationClue, "cluesWithLocations:locationCache:", v12, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v22);

  }
  if (v13 && objc_msgSend(v13, "count"))
  {
    objc_msgSend(v14, "serviceManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLSInputPeopleClue cluesWithPeoples:serviceManager:](CLSInputPeopleClue, "cluesWithPeoples:serviceManager:", v13, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v24);

  }
  -[CLSInvestigation clueCollection](v16, "clueCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "mergeClues:", v17);

  return v16;
}

@end
