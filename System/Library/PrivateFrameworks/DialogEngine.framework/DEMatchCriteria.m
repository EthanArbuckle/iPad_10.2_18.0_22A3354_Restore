@implementation DEMatchCriteria

- (DEMatchCriteria)initWithPrefixes:(id)a3 suffixes:(id)a4
{
  id v7;
  id v8;
  DEMatchCriteria *v9;
  DEMatchCriteria *v10;
  DEMatchCriteria *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DEMatchCriteria;
  v9 = -[DEMatchCriteria init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_prefixes, a3);
    objc_storeStrong((id *)&v10->_suffixes, a4);
    v11 = v10;
  }

  return v10;
}

- (DEMatchCriteria)init
{
  return -[DEMatchCriteria initWithPrefixes:suffixes:](self, "initWithPrefixes:suffixes:", 0, 0);
}

- (BOOL)any:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    LOBYTE(v9) = 0;
    goto LABEL_24;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_prefixes;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
LABEL_4:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v5);
      if (*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8) && (objc_msgSend(v4, "hasPrefix:") & 1) != 0)
        goto LABEL_21;
      if (v6 == ++v8)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v6)
          goto LABEL_4;
        break;
      }
    }
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_suffixes;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
LABEL_13:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v10)
        objc_enumerationMutation(v5);
      if (*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11) && (objc_msgSend(v4, "hasSuffix:", (_QWORD)v13) & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
          goto LABEL_13;
        goto LABEL_22;
      }
    }
LABEL_21:
    LOBYTE(v9) = 1;
  }
LABEL_22:

LABEL_24:
  return v9;
}

- (BOOL)all:(id)a3
{
  id v4;
  NSArray *prefixes;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSArray *suffixes;
  uint64_t v12;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  prefixes = self->_prefixes;
  if (prefixes && -[NSArray count](prefixes, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = self->_prefixes;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v6);
          if (*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i) && (objc_msgSend(v4, "hasPrefix:") & 1) != 0)
          {

            goto LABEL_14;
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v7)
          continue;
        break;
      }
    }
    LOBYTE(v10) = 0;
    goto LABEL_28;
  }
LABEL_14:
  suffixes = self->_suffixes;
  if (suffixes && -[NSArray count](suffixes, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_suffixes;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v10)
    {
      v12 = *(_QWORD *)v16;
      while (2)
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v6);
          if (*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j) && (objc_msgSend(v4, "hasSuffix:", (_QWORD)v15) & 1) != 0)
          {
            LOBYTE(v10) = 1;
            goto LABEL_28;
          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_28:

    goto LABEL_29;
  }
  LOBYTE(v10) = 1;
LABEL_29:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  DEMatchCriteria *v4;
  DEMatchCriteria *v5;
  NSArray *prefixes;
  void *v7;
  NSArray *suffixes;
  void *v9;
  _BOOL4 v10;
  NSArray *v11;
  void *v12;
  BOOL v13;
  NSArray *v14;
  void *v15;
  char v16;

  v4 = (DEMatchCriteria *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      prefixes = self->_prefixes;
      -[DEMatchCriteria prefixes](v5, "prefixes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(prefixes) = (prefixes != 0) ^ (v7 == 0);

      if ((prefixes & 1) == 0)
        goto LABEL_11;
      suffixes = self->_suffixes;
      -[DEMatchCriteria suffixes](v5, "suffixes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 == 0;

      if ((suffixes != 0) == v10
        || (v11 = self->_prefixes) != 0
        && (-[DEMatchCriteria prefixes](v5, "prefixes"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = -[NSArray isEqualToArray:](v11, "isEqualToArray:", v12),
            v12,
            !v13))
      {
LABEL_11:
        v16 = 0;
      }
      else
      {
        v14 = self->_suffixes;
        if (v14)
        {
          -[DEMatchCriteria suffixes](v5, "suffixes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[NSArray isEqualToArray:](v14, "isEqualToArray:", v15);

        }
        else
        {
          v16 = 1;
        }
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (NSArray)prefixes
{
  return self->_prefixes;
}

- (void)setPrefixes:(id)a3
{
  objc_storeStrong((id *)&self->_prefixes, a3);
}

- (NSArray)suffixes
{
  return self->_suffixes;
}

- (void)setSuffixes:(id)a3
{
  objc_storeStrong((id *)&self->_suffixes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffixes, 0);
  objc_storeStrong((id *)&self->_prefixes, 0);
}

+ (id)matchCriteriaFromPb:(const void *)a3
{
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  DEMatchCriteria *v16;

  if (*((int *)a3 + 8) < 1)
  {
    v5 = 0;
  }
  else
  {
    v4 = 0;
    v5 = 0;
    do
    {
      if (!v5)
        v5 = objc_opt_new();
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)a3 + 24, v4);
      if (*(char *)(v7 + 23) >= 0)
        v8 = v7;
      else
        v8 = *(_QWORD *)v7;
      objc_msgSend(v6, "stringWithUTF8String:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v5, "addObject:", v9);

      ++v4;
    }
    while (v4 < *((_DWORD *)a3 + 8));
  }
  if (*((int *)a3 + 14) < 1)
  {
    v11 = 0;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    do
    {
      if (!v11)
        v11 = objc_opt_new();
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)a3 + 48, v10);
      if (*(char *)(v13 + 23) >= 0)
        v14 = v13;
      else
        v14 = *(_QWORD *)v13;
      objc_msgSend(v12, "stringWithUTF8String:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v11, "addObject:", v15);

      ++v10;
    }
    while (v10 < *((_DWORD *)a3 + 14));
  }
  if (v5 | v11)
    v16 = -[DEMatchCriteria initWithPrefixes:suffixes:]([DEMatchCriteria alloc], "initWithPrefixes:suffixes:", v5, v11);
  else
    v16 = 0;

  return v16;
}

+ (void)matchCriteriaToPb:(id)a3 matchCriteriaPb:(void *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t i;
  uint64_t v13;
  std::string *v14;
  int *v15;
  uint64_t v16;
  int v17;
  _QWORD *AlignedAndAddCleanup;
  google::protobuf::internal::ArenaImpl *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t j;
  uint64_t v29;
  std::string *v30;
  int *v31;
  uint64_t v32;
  int v33;
  _QWORD *v34;
  google::protobuf::internal::ArenaImpl *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  char v47;
  std::string v48[2];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
    goto LABEL_48;
  v6 = v5;
  v38 = v5;
  objc_msgSend(v5, "prefixes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_25;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v6, "prefixes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (!v9)
    goto LABEL_24;
  v10 = *(_QWORD *)v44;
  v11 = (uint64_t *)((char *)a4 + 24);
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v44 != v10)
        objc_enumerationMutation(v8);
      v13 = objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i)), "UTF8String");
      if (!v13)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)v48, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DialogEngine/updater/CatUpdater.pb.h", 2604);
        v14 = google::protobuf::internal::LogMessage::operator<<(v48, "CHECK failed: value != nullptr: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v47, (const char **)&v14->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v48[0].__r_.__value_.__l.__data_);
      }
      v15 = (int *)*((_QWORD *)a4 + 5);
      if (!v15)
      {
        v17 = *((_DWORD *)a4 + 9);
LABEL_15:
        google::protobuf::internal::RepeatedPtrFieldBase::Reserve((unsigned int *)a4 + 6, v17 + 1);
        v15 = (int *)*((_QWORD *)a4 + 5);
        v17 = *v15;
        goto LABEL_16;
      }
      v16 = *((int *)a4 + 8);
      v17 = *v15;
      if ((int)v16 < *v15)
      {
        *((_DWORD *)a4 + 8) = v16 + 1;
        AlignedAndAddCleanup = *(_QWORD **)&v15[2 * v16 + 2];
        goto LABEL_22;
      }
      if (v17 == *((_DWORD *)a4 + 9))
        goto LABEL_15;
LABEL_16:
      *v15 = v17 + 1;
      v19 = (google::protobuf::internal::ArenaImpl *)*v11;
      if (*v11)
      {
        if (*((_QWORD *)v19 + 14))
        AlignedAndAddCleanup = google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup(v19, 0x18uLL, (void (*)(void *))google::protobuf::internal::arena_destruct_object<std::string>);
      }
      else
      {
        AlignedAndAddCleanup = (_QWORD *)operator new();
      }
      *AlignedAndAddCleanup = 0;
      AlignedAndAddCleanup[1] = 0;
      AlignedAndAddCleanup[2] = 0;
      v20 = *((_QWORD *)a4 + 5);
      v21 = *((int *)a4 + 8);
      *((_DWORD *)a4 + 8) = v21 + 1;
      *(_QWORD *)(v20 + 8 * v21 + 8) = AlignedAndAddCleanup;
LABEL_22:
      MEMORY[0x1C3B8D53C](AlignedAndAddCleanup, v13);
    }
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  }
  while (v9);
LABEL_24:

  v6 = v38;
LABEL_25:
  objc_msgSend(v6, "suffixes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  v5 = v38;
  if (!v23)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v38, "suffixes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    if (!v25)
      goto LABEL_47;
    v26 = *(_QWORD *)v40;
    v27 = (uint64_t *)((char *)a4 + 48);
    while (1)
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v40 != v26)
          objc_enumerationMutation(v24);
        v29 = objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j)), "UTF8String");
        if (!v29)
        {
          google::protobuf::internal::LogMessage::LogMessage((uint64_t)v48, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DialogEngine/updater/CatUpdater.pb.h", 2678);
          v30 = google::protobuf::internal::LogMessage::operator<<(v48, "CHECK failed: value != nullptr: ");
          google::protobuf::internal::LogFinisher::operator=((int)&v47, (const char **)&v30->__r_.__value_.__l.__data_);
          google::protobuf::internal::LogMessage::~LogMessage((void **)&v48[0].__r_.__value_.__l.__data_);
        }
        v31 = (int *)*((_QWORD *)a4 + 8);
        if (!v31)
        {
          v33 = *((_DWORD *)a4 + 15);
LABEL_38:
          google::protobuf::internal::RepeatedPtrFieldBase::Reserve((unsigned int *)a4 + 12, v33 + 1);
          v31 = (int *)*((_QWORD *)a4 + 8);
          v33 = *v31;
          goto LABEL_39;
        }
        v32 = *((int *)a4 + 14);
        v33 = *v31;
        if ((int)v32 < *v31)
        {
          *((_DWORD *)a4 + 14) = v32 + 1;
          v34 = *(_QWORD **)&v31[2 * v32 + 2];
          goto LABEL_45;
        }
        if (v33 == *((_DWORD *)a4 + 15))
          goto LABEL_38;
LABEL_39:
        *v31 = v33 + 1;
        v35 = (google::protobuf::internal::ArenaImpl *)*v27;
        if (*v27)
        {
          if (*((_QWORD *)v35 + 14))
          v34 = google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup(v35, 0x18uLL, (void (*)(void *))google::protobuf::internal::arena_destruct_object<std::string>);
        }
        else
        {
          v34 = (_QWORD *)operator new();
        }
        *v34 = 0;
        v34[1] = 0;
        v34[2] = 0;
        v36 = *((_QWORD *)a4 + 8);
        v37 = *((int *)a4 + 14);
        *((_DWORD *)a4 + 14) = v37 + 1;
        *(_QWORD *)(v36 + 8 * v37 + 8) = v34;
LABEL_45:
        MEMORY[0x1C3B8D53C](v34, v29);
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      if (!v25)
      {
LABEL_47:

        v5 = v38;
        break;
      }
    }
  }
LABEL_48:

}

@end
