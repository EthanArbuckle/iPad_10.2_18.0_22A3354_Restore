@implementation DDMapAction

+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4
{
  void *v4;
  BOOL v5;

  DDMapsURLForUrlAndResult(a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (DDMapAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8;
  void *v9;
  DDMapAction *v10;
  CNContact *contact;
  void *v12;
  void *v13;
  uint64_t v14;
  NSURL *url;
  DDMapAction *v16;
  objc_super v18;

  v8 = a5;
  DDMapsURLForUrlAndResult(a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)DDMapAction;
  v10 = -[DDAction initWithURL:result:context:](&v18, sel_initWithURL_result_context_, v9, a4, v8);

  if (v10)
  {
    contact = v10->super.super.super._contact;
    if (contact)
    {
      DDDefaultAddressForContact(contact);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          DDMapURLForString(v13);
          v14 = objc_claimAutoreleasedReturnValue();
          url = v10->super.super.super._url;
          v10->super.super.super._url = (NSURL *)v14;

        }
      }

    }
    v16 = v10;
  }

  return v10;
}

- (id)commitURL
{
  return self->super.super.super._url;
}

+ (id)viewControllerProviderClass
{
  return CFSTR("DDRemoteMapViewControllerProvider");
}

- (id)previewActions
{
  NSURL *url;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  char v8;
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[4];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  url = self->super.super.super._url;
  if (!url)
  {
    v9[0] = objc_opt_class();
    v9[1] = objc_opt_class();
    v9[2] = objc_opt_class();
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v9;
LABEL_12:
    v6 = 3;
    goto LABEL_13;
  }
  v8 = 0;
  if (!-[NSURL dd_isMaps:isDirections:](url, "dd_isMaps:isDirections:", 0, &v8))
  {
    if (v8)
    {
      v11[0] = objc_opt_class();
      v11[1] = objc_opt_class();
      v11[2] = objc_opt_class();
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = v11;
    }
    else
    {
      v10[0] = objc_opt_class();
      v10[1] = objc_opt_class();
      v10[2] = objc_opt_class();
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = v10;
    }
    goto LABEL_12;
  }
  if (self->super.super.super._contact || self->super.super.super._result && DDResultHasType())
  {
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v13[4] = objc_opt_class();
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v13;
    v6 = 5;
  }
  else
  {
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    v12[2] = objc_opt_class();
    v12[3] = objc_opt_class();
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v12;
    v6 = 4;
  }
LABEL_13:
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)menuActionClasses
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDMapAction previewActions](self, "previewActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v17 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v6);
  }
  if (objc_msgSend(v3, "count"))
    v10 = v3;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

+ (BOOL)actionAvailableForContact:(id)a3
{
  void *v3;
  BOOL v4;

  DDDefaultAddressForContact(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

@end
