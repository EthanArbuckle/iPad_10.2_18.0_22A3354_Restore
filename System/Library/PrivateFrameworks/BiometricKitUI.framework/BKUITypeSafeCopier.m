@implementation BKUITypeSafeCopier

- (BKUITypeSafeCopier)init
{

  return 0;
}

+ (id)copy:(id)a3
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v11;
  id v12;
  uint8_t buf[4];
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 0, &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (!v4)
  {
    v11 = 0;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v11);
    v5 = v11;
    if (!v5)
    {
      -[NSObject setRequiresSecureCoding:](v6, "setRequiresSecureCoding:", 0);
      -[NSObject decodeObjectForKey:](v6, "decodeObjectForKey:", *MEMORY[0x1E0CB2CD0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    _BKUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "description");
      v8 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1DB281000, v7, OS_LOG_TYPE_DEFAULT, "[BKUITypeSafeDeepCopier copy], unarchive failed %@", buf, 0xCu);

    }
    goto LABEL_7;
  }
  v5 = v4;
  _BKUILoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "description");
    v7 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, "[BKUITypeSafeDeepCopier copy], archive failed %@", buf, 0xCu);
LABEL_7:

  }
  v9 = 0;
LABEL_9:

  return v9;
}

@end
