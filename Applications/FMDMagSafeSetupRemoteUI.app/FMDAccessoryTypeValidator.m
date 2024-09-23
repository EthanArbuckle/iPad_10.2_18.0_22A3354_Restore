@implementation FMDAccessoryTypeValidator

+ (id)sharedInstance
{
  if (qword_100042DC8 != -1)
    dispatch_once(&qword_100042DC8, &stru_1000359C8);
  return (id)qword_100042DC0;
}

- (FMDAccessoryTypeValidator)init
{
  FMDAccessoryTypeValidator *v2;
  FMDAccessoryTypeValidator *v3;
  NSArray *allowedAccessoryTypes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDAccessoryTypeValidator;
  v2 = -[FMDAccessoryTypeValidator init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    allowedAccessoryTypes = v2->_allowedAccessoryTypes;
    v2->_allowedAccessoryTypes = (NSArray *)&off_100039930;

  }
  return v3;
}

- (BOOL)isAllowedAccessoryWithType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryTypeValidator allowedAccessoryTypes](self, "allowedAccessoryTypes", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i)) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (NSArray)allowedAccessoryTypes
{
  return self->_allowedAccessoryTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedAccessoryTypes, 0);
}

@end
