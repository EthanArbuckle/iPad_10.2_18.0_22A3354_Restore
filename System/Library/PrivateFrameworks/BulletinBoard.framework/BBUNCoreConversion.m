@implementation BBUNCoreConversion

+ (id)toUNCBulletin:(id)a3
{
  return (id)objc_msgSend(a3, "toUNCBulletin");
}

+ (id)toBBSectionInfo:(id)a3 parentSection:(id)a4
{
  id v5;
  id v6;
  BBSectionInfo *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BBSectionInfo initWithUNCSectionInfo:parentSection:]([BBSectionInfo alloc], "initWithUNCSectionInfo:parentSection:", v6, v5);

  return v7;
}

+ (id)toUNCSectionInfo:(id)a3 parentSection:(id)a4
{
  return (id)objc_msgSend(a3, "toUNCSectionInfoWithParentSection:", a4);
}

+ (id)toBBSectionInfos:(id)a3 parentSection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__BBUNCoreConversion_toBBSectionInfos_parentSection___block_invoke;
  v9[3] = &unk_24C563B30;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "bs_compactMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __53__BBUNCoreConversion_toBBSectionInfos_parentSection___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[BBUNCoreConversion toBBSectionInfo:parentSection:](BBUNCoreConversion, "toBBSectionInfo:parentSection:", a2, *(_QWORD *)(a1 + 32));
}

+ (id)toUNCSectionInfos:(id)a3 parentSection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__BBUNCoreConversion_toUNCSectionInfos_parentSection___block_invoke;
  v9[3] = &unk_24C563B58;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "bs_compactMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __54__BBUNCoreConversion_toUNCSectionInfos_parentSection___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[BBUNCoreConversion toUNCSectionInfo:parentSection:](BBUNCoreConversion, "toUNCSectionInfo:parentSection:", a2, *(_QWORD *)(a1 + 32));
}

+ (id)bbObjectFromUNCObject:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "toBBMuteAssertion:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "toBBSectionIcon:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "toBBSectionInfo:parentSection:", v4, 0);
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "toBBSectionInfoSettings:", v4);
          v5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v5 = v4;
        }
      }
    }
  }
  v6 = v5;

  return v6;
}

+ (id)uncObjectFromBBObject:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "toUNCMuteAssertion:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "toUNCSectionIcon:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "toUNCSectionInfo:parentSection:", v4, 0);
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "toUNCSectionInfoSettings:", v4);
          v5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v5 = v4;
        }
      }
    }
  }
  v6 = v5;

  return v6;
}

+ (id)toBBSectionInfoDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __48__BBUNCoreConversion_toBBSectionInfoDictionary___block_invoke;
  v13 = &unk_24C563B80;
  v14 = v6;
  v15 = a1;
  v7 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

void __48__BBUNCoreConversion_toBBSectionInfoDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "bbObjectFromUNCObject:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bs_setSafeObject:forKey:", v7, v6);

}

+ (id)toUNCSectionInfoDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __49__BBUNCoreConversion_toUNCSectionInfoDictionary___block_invoke;
  v13 = &unk_24C563B80;
  v14 = v6;
  v15 = a1;
  v7 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

void __49__BBUNCoreConversion_toUNCSectionInfoDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "uncObjectFromBBObject:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bs_setSafeObject:forKey:", v7, v6);

}

+ (id)toBBSectionInfoSettings:(id)a3
{
  id v3;
  BBSectionInfoSettings *v4;

  v3 = a3;
  v4 = -[BBSectionInfoSettings initWithUNCSectionInfoSettings:]([BBSectionInfoSettings alloc], "initWithUNCSectionInfoSettings:", v3);

  return v4;
}

+ (id)toUNCSectionInfoSettings:(id)a3
{
  return (id)objc_msgSend(a3, "toUNCSectionInfoSettings");
}

+ (id)toBBSectionIcon:(id)a3
{
  id v3;
  BBSectionIcon *v4;

  v3 = a3;
  v4 = -[BBSectionIcon initWithUNCSectionIcon:]([BBSectionIcon alloc], "initWithUNCSectionIcon:", v3);

  return v4;
}

+ (id)toUNCSectionIcon:(id)a3
{
  return (id)objc_msgSend(a3, "toUNCSectionIcon");
}

+ (unint64_t)toBBFeed:(unint64_t)a3
{
  return a3;
}

+ (unint64_t)toUNCFeed:(unint64_t)a3
{
  return a3;
}

+ (int64_t)toBBSectionType:(int64_t)a3
{
  return a3;
}

+ (int64_t)toUNCSectionType:(int64_t)a3
{
  return a3;
}

+ (int64_t)toBBSectionCategory:(int64_t)a3
{
  return a3;
}

+ (int64_t)toUNCSectionCategory:(int64_t)a3
{
  return a3;
}

+ (int64_t)toBBAnnounceCarPlaySetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toUNCAnnounceCarPlaySetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toBBAnnounceSetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toUNCAnnounceSetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toBBContentPreviewSetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toUNCContentPreviewSetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toBBListDisplayStyleSetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toUNCListDisplayStyleSetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toBBScheduledDeliverySetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toUNCScheduledDeliverySetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toBBSystemSetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toUNCSystemSetting:(int64_t)a3
{
  return a3;
}

+ (unint64_t)toBBSettings:(unint64_t)a3
{
  return a3;
}

+ (unint64_t)toUNCSettings:(unint64_t)a3
{
  return a3;
}

+ (id)toBBMuteAssertion:(id)a3
{
  return +[BBMuteAssertion assertionFromUNCMuteAssertion:](BBMuteAssertion, "assertionFromUNCMuteAssertion:", a3);
}

+ (id)toUNCMuteAssertion:(id)a3
{
  return (id)objc_msgSend(a3, "toUNCMuteAssertion");
}

@end
