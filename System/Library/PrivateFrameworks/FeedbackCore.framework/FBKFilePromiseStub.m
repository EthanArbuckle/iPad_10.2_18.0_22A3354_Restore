@implementation FBKFilePromiseStub

+ (id)entityName
{
  return CFSTR("FilePromiseStub");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status_enum"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[FBKFilePromiseStub setStatusEnum:](self, "setStatusEnum:", objc_msgSend(v12, "longValue"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("created_at"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FBKDateFromServerString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFilePromiseStub setCreatedAt:](self, "setCreatedAt:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFilePromiseStub setUuid:](self, "setUuid:", v9);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  FBKNilIfNSNull(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFilePromiseStub setName:](self, "setName:", v11);

}

- (unint64_t)downloadState
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[FBKFilePromiseStub UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FBKFilePromiseStub status](self, "status");
  -[FBKFilePromiseStub createdAt](self, "createdAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFilePromiseStub formResponseStub](self, "formResponseStub");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[FBKFilePromise downloadStateWithUUID:state:creationDate:contentItem:](FBKFilePromise, "downloadStateWithUUID:state:creationDate:contentItem:", v3, v4, v5, v7);

  return v8;
}

- (NSString)filename
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[FBKFilePromiseStub name](self, "name");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_24E15EAF8;
  v4 = v2;

  return v4;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("FilePromiseStub"));
}

- (BOOL)canDownload
{
  return -[FBKFilePromiseStub downloadState](self, "downloadState") == 2;
}

- (BOOL)canDelete
{
  return -[FBKFilePromiseStub downloadState](self, "downloadState") == 2;
}

- (NSString)localizedDownloadErrorString
{
  return (NSString *)+[FBKFilePromise localizedDownloadErrorStringForState:](FBKFilePromise, "localizedDownloadErrorStringForState:", -[FBKFilePromiseStub downloadState](self, "downloadState"));
}

@end
