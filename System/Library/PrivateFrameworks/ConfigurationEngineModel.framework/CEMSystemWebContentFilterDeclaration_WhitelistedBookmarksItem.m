@implementation CEMSystemWebContentFilterDeclaration_WhitelistedBookmarksItem

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("URL");
  v6[1] = CFSTR("BookmarkPath");
  v6[2] = CFSTR("Title");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithURL:(id)a3 withBookmarkPath:(id)a4 withTitle:(id)a5
{
  id v7;
  __CFString *v8;
  id v9;
  void *v10;
  const __CFString *v11;

  v7 = a5;
  v8 = (__CFString *)a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setPayloadURL:", v9);

  if (v8)
    v11 = v8;
  else
    v11 = CFSTR("The default bookmarks directory.");
  objc_msgSend(v10, "setPayloadBookmarkPath:", v11);

  objc_msgSend(v10, "setPayloadTitle:", v7);
  return v10;
}

+ (id)buildRequiredOnlyWithURL:(id)a3 withTitle:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadURL:", v6);

  objc_msgSend(v7, "setPayloadTitle:", v5);
  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *unknownPayloadKeys;
  NSString *v13;
  id v14;
  NSString *payloadURL;
  NSString *v16;
  NSString *payloadBookmarkPath;
  NSString *v18;
  NSString *payloadTitle;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSystemWebContentFilterDeclaration_WhitelistedBookmarksItem allowedPayloadKeys](CEMSystemWebContentFilterDeclaration_WhitelistedBookmarksItem, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v23 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("URL"), 1, 0, &v23);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  payloadURL = self->_payloadURL;
  self->_payloadURL = v13;

  if (!v14)
  {
    v22 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("BookmarkPath"), 0, CFSTR("The default bookmarks directory."), &v22);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    payloadBookmarkPath = self->_payloadBookmarkPath;
    self->_payloadBookmarkPath = v16;

    if (!v14)
    {
      v21 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Title"), 1, 0, &v21);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      payloadTitle = self->_payloadTitle;
      self->_payloadTitle = v18;

    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("URL"), self->_payloadURL, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("BookmarkPath"), self->_payloadBookmarkPath, 0, CFSTR("The default bookmarks directory."));
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Title"), self->_payloadTitle, 1, 0);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CEMSystemWebContentFilterDeclaration_WhitelistedBookmarksItem;
  v4 = -[CEMPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadURL, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadBookmarkPath, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadTitle, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadURL
{
  return self->_payloadURL;
}

- (void)setPayloadURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadBookmarkPath
{
  return self->_payloadBookmarkPath;
}

- (void)setPayloadBookmarkPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadTitle
{
  return self->_payloadTitle;
}

- (void)setPayloadTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTitle, 0);
  objc_storeStrong((id *)&self->_payloadBookmarkPath, 0);
  objc_storeStrong((id *)&self->_payloadURL, 0);
}

@end
