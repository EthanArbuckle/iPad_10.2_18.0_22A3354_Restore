@implementation HFDefaultRoomSuggestionVendor

+ (HFDefaultRoomSuggestionVendor)TVAccessorySuggestionVendor
{
  HFDefaultRoomSuggestionVendor *v2;
  void *v3;
  void *v4;
  HFDefaultRoomSuggestionVendor *v5;

  v2 = [HFDefaultRoomSuggestionVendor alloc];
  HFHomeBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("HFRoomSuggestions-TVAccessory"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFDefaultRoomSuggestionVendor initWithRoomSuggestionsPlistURL:](v2, "initWithRoomSuggestionsPlistURL:", v4);

  return v5;
}

+ (HFDefaultRoomSuggestionVendor)homeAppSuggestionVendor
{
  return objc_alloc_init(HFDefaultRoomSuggestionVendor);
}

- (HFDefaultRoomSuggestionVendor)initWithRoomSuggestionsPlistURL:(id)a3
{
  id v4;
  HFDefaultRoomSuggestionVendor *v5;
  uint64_t v6;
  NSURL *roomSuggestionsPlistURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFDefaultRoomSuggestionVendor;
  v5 = -[HFDefaultRoomSuggestionVendor init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    roomSuggestionsPlistURL = v5->_roomSuggestionsPlistURL;
    v5->_roomSuggestionsPlistURL = (NSURL *)v6;

  }
  return v5;
}

- (HFDefaultRoomSuggestionVendor)init
{
  void *v3;
  void *v4;
  HFDefaultRoomSuggestionVendor *v5;

  HFHomeBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("HFRoomSuggestions"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFDefaultRoomSuggestionVendor initWithRoomSuggestionsPlistURL:](self, "initWithRoomSuggestionsPlistURL:", v4);

  return v5;
}

- (id)prioritizedRoomSuggestions
{
  void *v2;
  void *v3;
  void *v4;

  -[HFDefaultRoomSuggestionVendor roomSuggestions](self, "roomSuggestions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_35_4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __59__HFDefaultRoomSuggestionVendor_prioritizedRoomSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "priority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "priority");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (NSSet)roomSuggestions
{
  NSSet *roomSuggestions;
  NSSet *v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSSet *v13;
  NSSet *v14;
  void *v15;
  _QWORD v17[8];
  _QWORD v18[3];
  char v19;
  _QWORD v20[3];
  uint64_t v21;

  roomSuggestions = self->_roomSuggestions;
  if (roomSuggestions)
  {
    v3 = roomSuggestions;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99D50];
    -[HFDefaultRoomSuggestionVendor roomSuggestionsPlistURL](self, "roomSuggestionsPlistURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataWithContentsOfURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("_LOCALIZABLE_"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x2020000000;
      v21 = 0;
      v21 = objc_msgSend(v10, "count");
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x2020000000;
      v19 = 0;
      v11 = (void *)MEMORY[0x1E0C99E60];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __48__HFDefaultRoomSuggestionVendor_roomSuggestions__block_invoke;
      v17[3] = &unk_1EA738B48;
      v17[4] = self;
      v17[5] = v20;
      v17[6] = v18;
      v17[7] = a2;
      objc_msgSend(v10, "na_map:", v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v12);
      v13 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v14 = self->_roomSuggestions;
      self->_roomSuggestions = v13;

      v3 = self->_roomSuggestions;
      _Block_object_dispose(v18, 8);
      _Block_object_dispose(v20, 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFRoomSuggestionVendor.m"), 86, CFSTR("Missing or malformatted suggestions plist %@"), v9);

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v3;
}

id __48__HFDefaultRoomSuggestionVendor_roomSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("priority"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        objc_msgSend(*(id *)(a1 + 32), "roomSuggestionsPlistURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Room suggestion plist %@ is using a mix of synthesized and manual priorities. This is not supported!"), v7);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("aliases"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = v10;
    else
      v12 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v9, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[HFRoomSuggestion suggestionWithName:priority:aliases:](HFRoomSuggestion, "suggestionWithName:priority:aliases:", v4, objc_msgSend(v6, "integerValue"), v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("HFRoomSuggestionVendor.m"), 99, CFSTR("Missing name in entry %@"), v3);
    v8 = 0;
  }

  return v8;
}

- (NSURL)roomSuggestionsPlistURL
{
  return self->_roomSuggestionsPlistURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomSuggestionsPlistURL, 0);
  objc_storeStrong((id *)&self->_roomSuggestions, 0);
}

@end
