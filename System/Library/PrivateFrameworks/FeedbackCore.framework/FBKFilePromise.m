@implementation FBKFilePromise

+ (id)entityName
{
  return CFSTR("FilePromise");
}

- (int64_t)state
{
  void *v3;
  int64_t v4;

  -[FBKFilePromise willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("state"));
  -[FBKFilePromise statusEnum](self, "statusEnum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[FBKFilePromise didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("state"));
  return v4;
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("status_enum"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[FBKFilePromise setStatusEnum:](self, "setStatusEnum:", v5);
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("device_id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[FBKFilePromise setDeviceID:](self, "setDeviceID:", v7);
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("uuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[FBKFilePromise setUuid:](self, "setUuid:", v9);
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[FBKFilePromise setName:](self, "setName:", v11);
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("size"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    -[FBKFilePromise setSize:](self, "setSize:", objc_msgSend(v13, "unsignedLongLongValue"));
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("created_at"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    FBKDateFromServerString(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFilePromise setCreatedAt:](self, "setCreatedAt:", v16);

  }
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("updated_at"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    FBKDateFromServerString(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFilePromise setUpdatedAt:](self, "setUpdatedAt:", v19);

  }
}

+ (unint64_t)downloadStateWithUUID:(id)a3 state:(int64_t)a4 creationDate:(id)a5 contentItem:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (v11 && !objc_msgSend(v11, "canDownloadFiles"))
  {
    v14 = 3;
  }
  else
  {
    if (v9)
      v13 = 0;
    else
      v13 = a4 == 3;
    v14 = v13;
    if (v9)
    {
      if (a4 == 8)
      {
        v14 = 2;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timeIntervalSinceDate:", v10);
        v17 = v16;

        v18 = 1;
        if (a4 >= 5)
          v18 = 4 * ((unint64_t)(a4 - 13) < 3);
        if (v17 <= 86400.0)
          v14 = v18;
        else
          v14 = 0;
      }
    }
  }

  return v14;
}

+ (id)localizedDownloadErrorStringForState:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  v3 = 0;
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("CommonStrings");
      v7 = CFSTR("FILE_DOWNLOAD_UNAVAILABLE_FOREVER_MESSAGE");
      goto LABEL_5;
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("CommonStrings");
      v7 = CFSTR("FILE_DOWNLOAD_UNAVAILABLE_MESSAGE");
      goto LABEL_5;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("CommonStrings");
      v7 = CFSTR("FILE_DOWNLOAD_UNAVAILABLE_TEAM_FORBIDDEN");
LABEL_5:
      v8 = &stru_24E15EAF8;
      goto LABEL_7;
    case 4uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v7 = CFSTR("FILE_DOWNLOAD_UNAVAILABLE_TEAM_DELETED");
      v8 = CFSTR("This file has been deleted.");
      v6 = 0;
LABEL_7:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v7, v8, v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

+ (id)displaySortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("status"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)filename
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[FBKFilePromise name](self, "name");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_24E15EAF8;
  v4 = v2;

  return v4;
}

- (int64_t)status
{
  void *v2;
  int64_t v3;

  -[FBKFilePromise statusEnum](self, "statusEnum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)canDownload
{
  return -[FBKFilePromise downloadState](self, "downloadState") == 2;
}

- (BOOL)canDelete
{
  return -[FBKFilePromise downloadState](self, "downloadState") == 2;
}

- (unint64_t)downloadState
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v3 = (void *)objc_opt_class();
  -[FBKFilePromise uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FBKFilePromise state](self, "state");
  -[FBKFilePromise createdAt](self, "createdAt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFilePromise feedbackFollowup](self, "feedbackFollowup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feedback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "downloadStateWithUUID:state:creationDate:contentItem:", v4, v5, v6, v9);

  return v10;
}

- (NSString)localizedDownloadErrorString
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "localizedDownloadErrorStringForState:", -[FBKFilePromise downloadState](self, "downloadState"));
}

- (void)setState:(int64_t)a3
{
  self->state = a3;
}

@end
