@implementation BBDataProvider

- (id)defaultSubsectionInfos
{
  void *v2;
  void *v3;

  -[BBDataProvider identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultSubsectionInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)displayNameForSubsectionID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[BBDataProvider identity](self, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subsectionDisplayNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BBDataProviderIdentity)identity
{
  BBDataProvider *v2;
  BBDataProviderIdentity *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_identity;
  objc_sync_exit(v2);

  return v3;
}

- (void)setIdentity:(id)a3
{
  BBDataProviderIdentity *v4;
  BBDataProviderIdentity *identity;
  BBDataProvider *obj;

  v4 = (BBDataProviderIdentity *)a3;
  obj = self;
  objc_sync_enter(obj);
  identity = obj->_identity;
  obj->_identity = v4;

  objc_sync_exit(obj);
}

- (id)defaultSectionInfo
{
  void *v2;
  void *v3;

  -[BBDataProvider identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultSectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sectionParameters
{
  void *v2;
  void *v3;

  -[BBDataProvider identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[BBDataProvider sectionIdentifier](self, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)invalidate
{
  NSLog(CFSTR("%s not implemented"), a2, "-[BBDataProvider invalidate]");
}

- (BOOL)initialized
{
  void *v2;
  BOOL v3;

  -[BBDataProvider identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)startWatchdog
{
  NSLog(CFSTR("%s not implemented"), a2, "-[BBDataProvider startWatchdog]");
}

- (void)dataProviderDidLoad
{
  NSLog(CFSTR("%s not implemented"), a2, "-[BBDataProvider dataProviderDidLoad]");
}

- (id)sectionIdentifier
{
  void *v2;
  void *v3;

  -[BBDataProvider identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)universalSectionIdentifier
{
  void *v2;
  void *v3;

  -[BBDataProvider identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "universalSectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sectionDisplayName
{
  void *v2;
  void *v3;

  -[BBDataProvider identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sectionIcon
{
  void *v2;
  void *v3;

  -[BBDataProvider identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sortDescriptors
{
  void *v2;
  void *v3;

  -[BBDataProvider identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sortKey
{
  void *v2;
  void *v3;

  -[BBDataProvider identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)syncsBulletinDismissal
{
  void *v2;
  char v3;

  -[BBDataProvider identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "syncsBulletinDismissal");

  return v3;
}

- (BOOL)canClearAllBulletins
{
  void *v2;
  unsigned int v3;

  -[BBDataProvider identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "traits") >> 6) & 1;

  return v3;
}

- (BOOL)canClearBulletinsByDate
{
  void *v2;
  unsigned int v3;

  -[BBDataProvider identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "traits") >> 7) & 1;

  return v3;
}

- (id)parentSectionIdentifier
{
  void *v2;
  void *v3;

  -[BBDataProvider identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentSectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sectionBundlePath
{
  void *v2;
  void *v3;

  -[BBDataProvider identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionBundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4 completion:(id)a5
{
  void *v5;
  id v6;

  v6 = a5;
  NSLog(CFSTR("%s not implemented"), "-[BBDataProvider bulletinsWithRequestParameters:lastCleared:completion:]");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v5 = v6;
  }

}

- (void)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4 completion:(id)a5
{
  void *v5;
  id v6;

  v6 = a5;
  NSLog(CFSTR("%s not implemented"), "-[BBDataProvider clearedInfoForBulletins:lastClearedInfo:completion:]");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v5 = v6;
  }

}

- (void)clearedInfoForClearingAllBulletinsWithLastClearedInfo:(id)a3 completion:(id)a4
{
  void *v4;
  id v5;

  v5 = a4;
  NSLog(CFSTR("%s not implemented"), "-[BBDataProvider clearedInfoForClearingAllBulletinsWithLastClearedInfo:completion:]");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    v4 = v5;
  }

}

- (void)clearedInfoForClearingBulletinsFromDate:(id)a3 toDate:(id)a4 lastClearedInfo:(id)a5 completion:(id)a6
{
  void *v6;
  id v7;

  v7 = a6;
  NSLog(CFSTR("%s not implemented"), "-[BBDataProvider clearedInfoForClearingBulletinsFromDate:toDate:lastClearedInfo:completion:]");
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    v6 = v7;
  }

}

- (void)deliverResponse:(id)a3 forBulletinRequest:(id)a4 withCompletion:(id)a5
{
  NSLog(CFSTR("%s not implemented"), a2, a3, a4, a5, "-[BBDataProvider deliverResponse:forBulletinRequest:withCompletion:]");
}

- (void)reloadIdentityWithCompletion:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  NSLog(CFSTR("%s not implemented"), "-[BBDataProvider reloadIdentityWithCompletion:]");
  v3 = v4;
  if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
    v3 = v4;
  }

}

- (void)noteSectionInfoDidChange:(id)a3
{
  NSLog(CFSTR("%s not implemented"), a2, a3, "-[BBDataProvider noteSectionInfoDidChange:]");
}

- (void)updateClearedInfoWithClearedInfo:(id)a3 handler:(id)a4 completion:(id)a5
{
  void *v5;
  id v6;

  v6 = a5;
  NSLog(CFSTR("%s not implemented"), "-[BBDataProvider updateClearedInfoWithClearedInfo:handler:completion:]");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v5 = v6;
  }

}

- (void)updateSectionInfoWithSectionInfo:(id)a3 handler:(id)a4 completion:(id)a5
{
  void *v5;
  id v6;

  v6 = a5;
  NSLog(CFSTR("%s not implemented"), "-[BBDataProvider updateSectionInfoWithSectionInfo:handler:completion:]");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v5 = v6;
  }

}

- (BOOL)canPerformMigration
{
  return 0;
}

- (BOOL)migrateSectionInfo:(id)a3 oldSectionInfo:(id)a4
{
  return 0;
}

- (void)deliverMessageWithName:(id)a3 userInfo:(id)a4
{
  NSLog(CFSTR("%s not implemented"), a2, a3, a4, "-[BBDataProvider deliverMessageWithName:userInfo:]");
}

- (id)debugDescriptionWithChildren:(unint64_t)a3
{
  void *i;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_24C5686F0);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
    objc_msgSend(i, "appendString:", CFSTR("    "));
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBDataProvider sectionIdentifier](self, "sectionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@<%@: %p>: %@"), i, v8, self, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)debugDescription
{
  return (NSString *)-[BBDataProvider debugDescriptionWithChildren:](self, "debugDescriptionWithChildren:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
