@implementation PHCloudInvitation

- (Class)changeRequestClass
{
  return 0;
}

- (PHCloudInvitation)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  PHCloudInvitation *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *inviteeFirstName;
  uint64_t v19;
  NSString *inviteeLastName;
  uint64_t v21;
  NSString *inviteeFullName;
  uint64_t v23;
  NSDate *inviteeSubscriptionDate;
  uint64_t v25;
  NSString *albumGUID;
  uint64_t v27;
  NSString *cloudGUID;
  objc_super v30;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("uuid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    PHFetchDictionaryAccessingMutableCopy(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("cloudGUID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("uuid"));

    v8 = v11;
  }
  v30.receiver = self;
  v30.super_class = (Class)PHCloudInvitation;
  v13 = -[PHObject initWithFetchDictionary:propertyHint:photoLibrary:](&v30, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, v9);
  if (v13)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isMine"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_isMine = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("invitationState"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_invitationState = objc_msgSend(v15, "intValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("invitationStateLocal"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_invitationStateLocal = objc_msgSend(v16, "intValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inviteeFirstName"));
    v17 = objc_claimAutoreleasedReturnValue();
    inviteeFirstName = v13->_inviteeFirstName;
    v13->_inviteeFirstName = (NSString *)v17;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inviteeLastName"));
    v19 = objc_claimAutoreleasedReturnValue();
    inviteeLastName = v13->_inviteeLastName;
    v13->_inviteeLastName = (NSString *)v19;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inviteeFullName"));
    v21 = objc_claimAutoreleasedReturnValue();
    inviteeFullName = v13->_inviteeFullName;
    v13->_inviteeFullName = (NSString *)v21;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inviteeSubscriptionDate"));
    v23 = objc_claimAutoreleasedReturnValue();
    inviteeSubscriptionDate = v13->_inviteeSubscriptionDate;
    v13->_inviteeSubscriptionDate = (NSDate *)v23;

    v13->_inviteeEmailKey = (NSNumber *)(id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inviteeEmailKey"));
    v13->_inviteeHashedPersonID = (NSString *)(id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inviteeHashedPersonID"));
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("albumGUID"));
    v25 = objc_claimAutoreleasedReturnValue();
    albumGUID = v13->_albumGUID;
    v13->_albumGUID = (NSString *)v25;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudGUID"));
    v27 = objc_claimAutoreleasedReturnValue();
    cloudGUID = v13->_cloudGUID;
    v13->_cloudGUID = (NSString *)v27;

  }
  return v13;
}

- (id)inviteeDisplayNameIncludingEmail:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  BOOL v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  -[PHCloudInvitation inviteeFirstName](self, "inviteeFirstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCloudInvitation inviteeLastName](self, "inviteeLastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCloudInvitation inviteeFullName](self, "inviteeFullName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCloudInvitation inviteeEmails](self, "inviteeEmails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHCloudInvitation inviteePhones](self, "inviteePhones");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v11 = v7;
    goto LABEL_3;
  }
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v5, v6);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (objc_msgSend(v5, "length"))
  {
    v11 = v5;
    goto LABEL_3;
  }
  if (objc_msgSend(v6, "length"))
  {
    v11 = v6;
LABEL_3:
    v12 = v11;
    if (!v3)
      goto LABEL_6;
    goto LABEL_4;
  }
  if (objc_msgSend(v9, "length"))
  {
    v12 = v9;
    goto LABEL_6;
  }
  if (!v10 || !objc_msgSend(v10, "count"))
  {
    if (!v3)
      goto LABEL_7;
    v12 = 0;
    goto LABEL_4;
  }
  v21 = v3;
  v22 = v10;
  v23 = v6;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = v16;
    v12 = 0;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        if (v12)
        {
          -[__CFString stringByAppendingFormat:](v12, "stringByAppendingFormat:", CFSTR(" / %@"), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          v20 = objc_claimAutoreleasedReturnValue();

          v12 = (__CFString *)v20;
        }
        else
        {
          v12 = (__CFString *)*(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }
  else
  {
    v12 = 0;
  }

  v10 = v22;
  v6 = v23;
  if (v21)
  {
LABEL_4:
    if (objc_msgSend(v9, "length"))
    {
      -[__CFString stringByAppendingFormat:](v12, "stringByAppendingFormat:", CFSTR(" (%@)"), v9);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (__CFString *)v13;
    }
  }
LABEL_6:
  if (!v12)
LABEL_7:
    v12 = &stru_1E35DFFF8;

  return v12;
}

- (id)personInfoManager
{
  void *v2;
  void *v3;
  void *v4;

  -[PHObject photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibraryBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personInfoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)inviteeEmails
{
  void *v3;
  void *v4;
  void *v5;

  -[PHCloudInvitation personInfoManager](self, "personInfoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCloudInvitation cloudGUID](self, "cloudGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailsForInvitationRecordGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)inviteePhones
{
  void *v3;
  void *v4;
  void *v5;

  -[PHCloudInvitation personInfoManager](self, "personInfoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCloudInvitation cloudGUID](self, "cloudGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phonesForInvitationRecordGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSString)invitationStateDescription
{
  int v3;
  void *v4;

  v3 = -[PHCloudInvitation invitationState](self, "invitationState");
  v4 = 0;
  switch(v3)
  {
    case 0:
    case 2:
      return (NSString *)v4;
    case 1:
      -[PHCloudInvitation invitationStateLocal](self, "invitationStateLocal");
      goto LABEL_3;
    default:
LABEL_3:
      PLLocalizedFrameworkString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return (NSString *)v4;
}

- (int)invitationState
{
  return self->_invitationState;
}

- (NSString)inviteeFirstName
{
  return self->_inviteeFirstName;
}

- (NSString)inviteeLastName
{
  return self->_inviteeLastName;
}

- (NSString)inviteeFullName
{
  return self->_inviteeFullName;
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (NSDate)inviteeSubscriptionDate
{
  return self->_inviteeSubscriptionDate;
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (NSString)cloudGUID
{
  return self->_cloudGUID;
}

- (int)invitationStateLocal
{
  return self->_invitationStateLocal;
}

- (NSNumber)inviteeEmailKey
{
  return self->_inviteeEmailKey;
}

- (NSString)inviteeHashedPersonID
{
  return self->_inviteeHashedPersonID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudGUID, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
  objc_storeStrong((id *)&self->_inviteeSubscriptionDate, 0);
  objc_storeStrong((id *)&self->_inviteeFullName, 0);
  objc_storeStrong((id *)&self->_inviteeLastName, 0);
  objc_storeStrong((id *)&self->_inviteeFirstName, 0);
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PHCloudInvitation_propertiesToFetchWithHint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToFetchWithHint__onceToken_19889 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_19889, block);
  return (id)propertiesToFetchWithHint__array_19890;
}

+ (id)managedEntityName
{
  return CFSTR("CloudSharedAlbumInvitationRecord");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHCloudInvitation");
  return CFSTR("PHCloudInvitation");
}

void __47__PHCloudInvitation_propertiesToFetchWithHint___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[13];

  v4[12] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v0, "setName:", CFSTR("objectID"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setExpression:", v1);

  objc_msgSend(v0, "setExpressionResultType:", 2000);
  v4[0] = v0;
  v4[1] = CFSTR("albumGUID");
  v4[2] = CFSTR("cloudGUID");
  v4[3] = CFSTR("invitationState");
  v4[4] = CFSTR("invitationStateLocal");
  v4[5] = CFSTR("inviteeEmailKey");
  v4[6] = CFSTR("inviteeFirstName");
  v4[7] = CFSTR("inviteeFullName");
  v4[8] = CFSTR("inviteeHashedPersonID");
  v4[9] = CFSTR("inviteeLastName");
  v4[10] = CFSTR("inviteeSubscriptionDate");
  v4[11] = CFSTR("isMine");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 12);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)propertiesToFetchWithHint__array_19890;
  propertiesToFetchWithHint__array_19890 = v2;

}

@end
