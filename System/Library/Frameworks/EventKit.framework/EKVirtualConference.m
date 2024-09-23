@implementation EKVirtualConference

- (EKVirtualConference)initWithTitle:(id)a3 joinMethods:(id)a4 conferenceDetails:(id)a5
{
  id v8;
  id v9;
  id v10;
  EKVirtualConference *v11;
  uint64_t v12;
  NSArray *joinMethods;
  uint64_t v14;
  NSString *conferenceDetails;
  uint64_t v16;
  NSString *title;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EKVirtualConference;
  v11 = -[EKVirtualConference init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    joinMethods = v11->_joinMethods;
    v11->_joinMethods = (NSArray *)v12;

    v14 = objc_msgSend(v10, "copy");
    conferenceDetails = v11->_conferenceDetails;
    v11->_conferenceDetails = (NSString *)v14;

    v16 = objc_msgSend(v8, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v16;

  }
  return v11;
}

- (BOOL)isWritable
{
  return self->_source == 0;
}

+ (void)virtualConferenceForRoomType:(id)a3 completion:(id)a4 queue:(id)a5
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  dispatch_time_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  _QWORD block[4];
  id v34;
  uint64_t *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  NSObject *v39;
  id v40;
  id obj;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD *v50;
  _QWORD v51[3];
  char v52;
  id v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v32 = a5;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v52 = 0;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke;
  v48[3] = &unk_1E4787A70;
  v50 = v51;
  v9 = v8;
  v49 = v9;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85849D4](v48);
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__20;
  v46 = __Block_byref_object_dispose__20;
  v47 = 0;
  v11 = (void *)MEMORY[0x1E0CB35D8];
  objc_msgSend(v7, "extensionBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id *)(v43 + 5);
  obj = (id)v43[5];
  objc_msgSend(v11, "extensionWithIdentifier:error:", v12, &obj);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v13, obj);

  if (v43[5] || !v14)
  {
    v25 = (id)EKLogHandle;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "title");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "extensionBundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v43[5];
      *(_DWORD *)buf = 138413058;
      v57 = v27;
      v58 = 2112;
      v59 = v28;
      v60 = 2112;
      v61 = v29;
      v62 = 2112;
      v63 = v30;
      _os_log_error_impl(&dword_1A2318000, v25, OS_LOG_TYPE_ERROR, "Could not load extension for room type title: %@ identifier: %@ extensionIdentifier: %@, error = %@", buf, 0x2Au);

    }
    v10[2](v10, 0, v43[5]);
  }
  else
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke_12;
    v37[3] = &unk_1E4787A98;
    v15 = v7;
    v38 = v15;
    v16 = v32;
    v39 = v16;
    v17 = v10;
    v40 = v17;
    objc_msgSend(v14, "setRequestCompletionBlock:", v37);
    v18 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
    v55[0] = CFSTR("_EKVirutalConferenceRequestTypeJoinMethodsForRoomType");
    v54[0] = CFSTR("_EKVirtualConferenceRequestTypeKey");
    v54[1] = CFSTR("_EKVirtualConferenceRequestRoomTypeIdentifier");
    objc_msgSend(v15, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setUserInfo:", v20);

    v53 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id *)(v43 + 5);
    v36 = (id)v43[5];
    objc_msgSend(v14, "beginExtensionRequestWithOptions:inputItems:error:", 1, v21, &v36);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v22, v36);

    if (v43[5])
    {
      v24 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      {
        v31 = (void *)v43[5];
        *(_DWORD *)buf = 138412802;
        v57 = v14;
        v58 = 2112;
        v59 = v23;
        v60 = 2112;
        v61 = v31;
        _os_log_error_impl(&dword_1A2318000, v24, OS_LOG_TYPE_ERROR, "Failed to get virtual conference join methods, extension = %@ request = %@ error = %@", buf, 0x20u);
      }
      (*((void (**)(id, _QWORD, uint64_t))v17 + 2))(v17, 0, v43[5]);
    }
    else
    {
      v26 = dispatch_time(0, 20000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke_25;
      block[3] = &unk_1E4787AC0;
      v35 = &v42;
      v34 = v17;
      dispatch_after(v26, v16, block);

    }
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(v51, 8);

}

uint64_t __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

void __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  EKVirtualConferenceJoinMethod *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  EKVirtualConference *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  id v38;
  id v39;
  EKVirtualConference *v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  id obj;
  void *v46;
  id v47;
  _QWORD block[4];
  EKVirtualConference *v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v41 = a1;
  v63 = *MEMORY[0x1E0C80C00];
  v42 = a2;
  v4 = a3;
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (!v5)
  {
    v46 = 0;
    v47 = 0;
    goto LABEL_35;
  }
  v6 = v5;
  v46 = 0;
  v47 = 0;
  v7 = *(_QWORD *)v53;
  do
  {
    v8 = 0;
    v44 = v6;
    do
    {
      if (*(_QWORD *)v53 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v8);
      objc_msgSend(v9, "userInfo", v41, v42);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("_EKVirtualConferenceTypeIdentifierKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
      v13 = v12;
      v14 = v13;
      if (v13
        && objc_msgSend(v13, "isEqualToString:", CFSTR("_EKVirtualConferenceInfoTypeIdentifierKey")))
      {
        objc_msgSend(v9, "userInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", CFSTR("_EKVirtualConferenceInfoTitleKey"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "userInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", CFSTR("_EKVirtualConferenceInfoDetailsKey"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v16;
        else
          v19 = 0;
        v20 = v19;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v21 = v18;
        else
          v21 = 0;
        v22 = v47;
        v46 = v20;
        v47 = v21;
      }
      else
      {
        if (!objc_msgSend(v14, "isEqualToString:", CFSTR("_EKVirtualConferenceJoinMethodTypeIdentifierKey")))goto LABEL_31;
        v23 = v7;
        objc_msgSend(v9, "userInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKey:", CFSTR("_EKVirtualConferenceJoinMethodTitleKey"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "userInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", CFSTR("_EKVirtualConferenceJoinMethodURLKey"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v16;
        else
          v26 = 0;
        v22 = v26;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v27 = v18;
        else
          v27 = 0;
        v28 = v27;
        if (v28)
        {
          v29 = -[EKVirtualConferenceJoinMethod initWithTitle:url:]([EKVirtualConferenceJoinMethod alloc], "initWithTitle:url:", v22, v28);
          objc_msgSend(v43, "addObject:", v29);

        }
        else
        {
          v30 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v57 = v9;
            v58 = 2112;
            v59 = v22;
            v60 = 2112;
            v61 = 0;
            _os_log_error_impl(&dword_1A2318000, v30, OS_LOG_TYPE_ERROR, "Skipping extension join method %@ because it has insufficient information. Title = %@ URL = %@", buf, 0x20u);
          }
        }

        v7 = v23;
        v6 = v44;
      }

LABEL_31:
      ++v8;
    }
    while (v6 != v8);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  }
  while (v6);
LABEL_35:

  if (objc_msgSend(v43, "count"))
  {
    v32 = v46;
    v31 = v47;
    v33 = -[EKVirtualConference initWithTitle:joinMethods:conferenceDetails:]([EKVirtualConference alloc], "initWithTitle:joinMethods:conferenceDetails:", v46, v43, v47);
    v34 = 0;
    v35 = v41;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKVirtualConferenceError"), 0, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)EKLogHandle;
    v32 = v46;
    v31 = v47;
    v35 = v41;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke_12_cold_1(v41, v36);
    v33 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke_19;
  block[3] = &unk_1E4786800;
  v37 = *(NSObject **)(v35 + 40);
  v38 = *(id *)(v35 + 48);
  v50 = v34;
  v51 = v38;
  v49 = v33;
  v39 = v34;
  v40 = v33;
  dispatch_async(v37, block);

}

uint64_t __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke_19(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke_25(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKVirtualConferenceError"), 1, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSURL)firstPhoneNumber
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[EKVirtualConference joinMethods](self, "joinMethods", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "cal_hasSchemeTel") & 1) != 0)
        break;

      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v7 = 0;
  }

  return (NSURL *)v7;
}

- (NSURL)urlWithAllowedScheme
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[EKVirtualConference joinMethods](self, "joinMethods");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(MEMORY[0x1E0D0C290], "conferenceURLHasAllowedScheme:", v4))
    v5 = v4;
  else
    v5 = 0;

  return (NSURL *)v5;
}

- (BOOL)isEqual:(id)a3
{
  EKVirtualConference *v4;
  EKVirtualConference *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  BOOL v17;

  v4 = (EKVirtualConference *)a3;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[EKVirtualConference joinMethods](v5, "joinMethods");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKVirtualConference joinMethods](self, "joinMethods");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CalEqualObjects();

      -[EKVirtualConference conferenceDetails](v5, "conferenceDetails");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKVirtualConference conferenceDetails](self, "conferenceDetails");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CalEqualStrings();

      -[EKVirtualConference title](v5, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKVirtualConference title](self, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CalEqualStrings();

      v15 = -[EKVirtualConference source](v5, "source");
      v16 = -[EKVirtualConference source](self, "source");
      v17 = 0;
      if (v8 && v11)
      {
        if (v15 == v16)
          v17 = v14;
        else
          v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (id)description
{
  void *v2;
  NSString *conferenceDetails;
  NSArray *joinMethods;
  NSString *title;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  joinMethods = self->_joinMethods;
  conferenceDetails = self->_conferenceDetails;
  title = self->_title;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_source);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("EKVirtualConference title: %@, conferenceDetails: %@, joinMethods: %@, source: %@"), title, conferenceDetails, joinMethods, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKVirtualConference *v4;
  void *v5;
  void *v6;
  void *v7;
  EKVirtualConference *v8;

  v4 = [EKVirtualConference alloc];
  -[EKVirtualConference title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKVirtualConference joinMethods](self, "joinMethods");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKVirtualConference conferenceDetails](self, "conferenceDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKVirtualConference initWithTitle:joinMethods:conferenceDetails:](v4, "initWithTitle:joinMethods:conferenceDetails:", v5, v6, v7);

  -[EKVirtualConference setSource:](v8, "setSource:", self->_source);
  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)joinMethods
{
  return self->_joinMethods;
}

- (void)setJoinMethods:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)conferenceDetails
{
  return self->_conferenceDetails;
}

- (NSString)serializationBlockTitle
{
  return self->_serializationBlockTitle;
}

- (void)setSerializationBlockTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializationBlockTitle, 0);
  objc_storeStrong((id *)&self->_conferenceDetails, 0);
  objc_storeStrong((id *)&self->_joinMethods, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke_12_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v3, v5, "Extension %@ did not provide any join methods.", v6);

}

@end
