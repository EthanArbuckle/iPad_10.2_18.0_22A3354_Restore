@implementation CRKASMSuspendableRosterProvider

- (void)dealloc
{
  objc_super v3;

  -[CRKASMSuspendableRosterProvider stopObservingUnderlyingProvider](self, "stopObservingUnderlyingProvider");
  v3.receiver = self;
  v3.super_class = (Class)CRKASMSuspendableRosterProvider;
  -[CRKASMSuspendableRosterProvider dealloc](&v3, sel_dealloc);
}

- (CRKASMSuspendableRosterProvider)initWithGenerator:(id)a3
{
  id v4;
  CRKASMSuspendableRosterProvider *v5;
  uint64_t v6;
  id generator;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKASMSuspendableRosterProvider;
  v5 = -[CRKASMSuspendableRosterProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x219A226E8](v4);
    generator = v5->_generator;
    v5->_generator = (id)v6;

    -[CRKASMSuspendableRosterProvider latchDefaultValues](v5, "latchDefaultValues");
  }

  return v5;
}

- (void)suspend
{
  if (-[CRKASMSuspendableRosterProvider hasRosterProvider](self, "hasRosterProvider"))
    -[CRKASMSuspendableRosterProvider setUnderlyingRosterProvider:](self, "setUnderlyingRosterProvider:", 0);
}

- (void)resume
{
  void *v3;
  void (**v4)(void);

  if (!-[CRKASMSuspendableRosterProvider hasRosterProvider](self, "hasRosterProvider"))
  {
    -[CRKASMSuspendableRosterProvider generator](self, "generator");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKASMSuspendableRosterProvider setUnderlyingRosterProvider:](self, "setUnderlyingRosterProvider:", v3);

  }
}

- (BOOL)hasRosterProvider
{
  void *v2;
  BOOL v3;

  -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)noRosterProviderError
{
  return CRKErrorWithCodeAndUserInfo(2, &unk_24DA07D28);
}

- (void)latchDefaultValues
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;

  -[CRKASMSuspendableRosterProvider roster](self, "roster");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[CRKASMSuspendableRosterProvider roster](self, "roster");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", 0);

    if ((v6 & 1) == 0)
      -[CRKASMSuspendableRosterProvider setRoster:](self, "setRoster:", 0);
  }
  -[CRKASMSuspendableRosterProvider locationsWithManagePermissions](self, "locationsWithManagePermissions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMSuspendableRosterProvider locationsWithManagePermissions](self, "locationsWithManagePermissions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", MEMORY[0x24BDBD1A8]);

  if ((v9 & 1) == 0)
    -[CRKASMSuspendableRosterProvider setLocationsWithManagePermissions:](self, "setLocationsWithManagePermissions:", MEMORY[0x24BDBD1A8]);
}

- (void)setUnderlyingRosterProvider:(id)a3
{
  CRKASMRosterProviding *v5;
  CRKASMRosterProviding *v6;

  v5 = (CRKASMRosterProviding *)a3;
  if (self->_underlyingRosterProvider != v5)
  {
    v6 = v5;
    -[CRKASMSuspendableRosterProvider stopObservingUnderlyingProvider](self, "stopObservingUnderlyingProvider");
    objc_storeStrong((id *)&self->_underlyingRosterProvider, a3);
    if (self->_underlyingRosterProvider)
      -[CRKASMSuspendableRosterProvider startObservingUnderlyingProvider](self, "startObservingUnderlyingProvider");
    else
      -[CRKASMSuspendableRosterProvider latchDefaultValues](self, "latchDefaultValues");
    v5 = v6;
  }

}

- (id)observedKeyPaths
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("roster");
  v3[1] = CFSTR("locationsWithManagePermissions");
  v3[2] = CFSTR("populated");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)startObservingUnderlyingProvider
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CRKASMSuspendableRosterProvider observedKeyPaths](self, "observedKeyPaths", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, v8, 4, CFSTR("CRKASMSuspendableRosterProviderObservationContext"));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)stopObservingUnderlyingProvider
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CRKASMSuspendableRosterProvider observedKeyPaths](self, "observedKeyPaths", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObserver:forKeyPath:context:", self, v8, CFSTR("CRKASMSuspendableRosterProviderObservationContext"));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  objc_super v28;

  v10 = a3;
  v11 = v10;
  if (a6 != CFSTR("CRKASMSuspendableRosterProviderObservationContext"))
  {
    v28.receiver = self;
    v28.super_class = (Class)CRKASMSuspendableRosterProvider;
    -[CRKASMSuspendableRosterProvider observeValueForKeyPath:ofObject:change:context:](&v28, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
    goto LABEL_27;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("roster")))
  {
    -[CRKASMSuspendableRosterProvider roster](self, "roster");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
LABEL_7:
      -[CRKASMSuspendableRosterProvider roster](self, "roster");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "roster");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "isEqual:", v16);

      if (v12)
      {

        if ((v17 & 1) != 0)
          goto LABEL_27;
      }
      else
      {

        if ((v17 & 1) != 0)
          goto LABEL_27;
      }
      -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
      a6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a6, "roster");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKASMSuspendableRosterProvider setRoster:](self, "setRoster:", v27);
      goto LABEL_25;
    }
    -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
    a6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a6, "roster");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      a4 = v13;
      goto LABEL_7;
    }
LABEL_26:

    goto LABEL_27;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("locationsWithManagePermissions")))
  {
    -[CRKASMSuspendableRosterProvider locationsWithManagePermissions](self, "locationsWithManagePermissions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
      a6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a6, "locationsWithManagePermissions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
        goto LABEL_26;
      a4 = v19;
    }
    -[CRKASMSuspendableRosterProvider locationsWithManagePermissions](self, "locationsWithManagePermissions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "locationsWithManagePermissions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "isEqual:", v22);

    if (v18)
    {

      if ((v23 & 1) != 0)
        goto LABEL_27;
    }
    else
    {

      if ((v23 & 1) != 0)
        goto LABEL_27;
    }
    -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
    a6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a6, "locationsWithManagePermissions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKASMSuspendableRosterProvider setLocationsWithManagePermissions:](self, "setLocationsWithManagePermissions:", v27);
LABEL_25:

    goto LABEL_26;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("populated")))
  {
    if (!-[CRKASMSuspendableRosterProvider isPopulated](self, "isPopulated"))
    {
      v24 = -[CRKASMSuspendableRosterProvider isPopulated](self, "isPopulated");
      -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isPopulated");

      if (v24 != v26)
      {
        -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
        a6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRKASMSuspendableRosterProvider setPopulated:](self, "setPopulated:", objc_msgSend(a6, "isPopulated"));
        goto LABEL_26;
      }
    }
  }
LABEL_27:

}

- (CRKASMUserFetching)userFetcher
{
  void *v3;
  CRKASMSuspendableRosterProvider *v4;

  if (-[CRKASMSuspendableRosterProvider hasRosterProvider](self, "hasRosterProvider"))
  {
    -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userFetcher");
    v4 = (CRKASMSuspendableRosterProvider *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self;
  }
  return (CRKASMUserFetching *)v4;
}

- (id)studentDirectoryForLocationIDs:(id)a3
{
  id v4;
  void *v5;
  CRKASMSuspendableRosterProvider *v6;

  v4 = a3;
  if (-[CRKASMSuspendableRosterProvider hasRosterProvider](self, "hasRosterProvider"))
  {
    -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "studentDirectoryForLocationIDs:", v4);
    v6 = (CRKASMSuspendableRosterProvider *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = self;
  }

  return v6;
}

- (id)instructorDirectoryForLocationIDs:(id)a3
{
  id v4;
  void *v5;
  CRKASMSuspendableRosterProvider *v6;

  v4 = a3;
  if (-[CRKASMSuspendableRosterProvider hasRosterProvider](self, "hasRosterProvider"))
  {
    -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "instructorDirectoryForLocationIDs:", v4);
    v6 = (CRKASMSuspendableRosterProvider *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = self;
  }

  return v6;
}

- (void)refresh
{
  id v2;

  -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refresh");

}

- (BOOL)ingestCertificates:(id)a3 forTrustedUserIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;

  v8 = a3;
  v9 = a4;
  if (-[CRKASMSuspendableRosterProvider hasRosterProvider](self, "hasRosterProvider"))
  {
    -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "ingestCertificates:forTrustedUserIdentifier:error:", v8, v9, a5);

  }
  else if (a5)
  {
    -[CRKASMSuspendableRosterProvider noRosterProviderError](self, "noRosterProviderError");
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)createCourseWithProperties:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, void *))a4;
  if (-[CRKASMSuspendableRosterProvider hasRosterProvider](self, "hasRosterProvider"))
  {
    -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createCourseWithProperties:completion:", v8, v6);
  }
  else
  {
    -[CRKASMSuspendableRosterProvider noRosterProviderError](self, "noRosterProviderError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7);
  }

}

- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, void *))a4;
  if (-[CRKASMSuspendableRosterProvider hasRosterProvider](self, "hasRosterProvider"))
  {
    -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeCourseWithIdentifier:completion:", v8, v6);
  }
  else
  {
    -[CRKASMSuspendableRosterProvider noRosterProviderError](self, "noRosterProviderError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7);
  }

}

- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  if (-[CRKASMSuspendableRosterProvider hasRosterProvider](self, "hasRosterProvider"))
  {
    -[CRKASMSuspendableRosterProvider underlyingRosterProvider](self, "underlyingRosterProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateCourseWithIdentifier:properties:completion:", v11, v8, v9);
  }
  else
  {
    -[CRKASMSuspendableRosterProvider noRosterProviderError](self, "noRosterProviderError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v10);
  }

}

- (void)fetchASMUsersWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[CRKASMSuspendableRosterProvider noRosterProviderError](self, "noRosterProviderError");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v6, 0, v7);

}

- (void)fetchNextUsersWithCompletion:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[CRKASMSuspendableRosterProvider noRosterProviderError](self, "noRosterProviderError");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v6);

}

- (id)generator
{
  return self->_generator;
}

- (CRKASMRosterProviding)underlyingRosterProvider
{
  return self->_underlyingRosterProvider;
}

- (CRKASMRoster)roster
{
  return self->_roster;
}

- (void)setRoster:(id)a3
{
  objc_storeStrong((id *)&self->_roster, a3);
}

- (BOOL)isPopulated
{
  return self->_populated;
}

- (void)setPopulated:(BOOL)a3
{
  self->_populated = a3;
}

- (NSArray)locationsWithManagePermissions
{
  return self->_locationsWithManagePermissions;
}

- (void)setLocationsWithManagePermissions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationsWithManagePermissions, 0);
  objc_storeStrong((id *)&self->_roster, 0);
  objc_storeStrong((id *)&self->_underlyingRosterProvider, 0);
  objc_storeStrong(&self->_generator, 0);
}

@end
