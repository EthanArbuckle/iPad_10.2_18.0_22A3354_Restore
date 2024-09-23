@implementation HSBrowseRequest

+ (id)requestWithDatabaseID:(unsigned int)a3 browseGroupType:(int64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDatabaseID:browseGroupType:", *(_QWORD *)&a3, a4);
}

- (HSBrowseRequest)initWithDatabaseID:(unsigned int)a3 browseGroupType:(int64_t)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  HSBrowseRequest *v9;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x24BDD17C8];
  -[HSBrowseRequest _stringForBrowseGroupType:](self, "_stringForBrowseGroupType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("databases/%u/browse/%@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HSRequest initWithAction:](self, "initWithAction:", v8);

  return v9;
}

- (id)canonicalResponseForResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[HSResponse responseWithResponse:](HSBrowseResponse, "responseWithResponse:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responseData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HSResponseDataParser parseResponseData:](HSResponseDataParser, "parseResponseData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setCollections:", v5);
  return v3;
}

- (id)_stringForBrowseGroupType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("albums");
  else
    return off_24C364730[a3 - 1];
}

@end
