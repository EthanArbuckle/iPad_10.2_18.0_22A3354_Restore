@implementation IKEngine

- (IKEngine)initWithDelegate:(id)a3
{
  IKEngine *v4;
  IKEngine *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IKEngine;
  v4 = -[IKEngine init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_OAuthToken = 0;
    v4->_OAuthTokenSecret = 0;
    v4->_delegate = (IKEngineDelegate *)a3;
    v4->_connections = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  }
  return v5;
}

- (IKEngine)init
{
  return -[IKEngine initWithDelegate:](self, "initWithDelegate:", 0);
}

- (id)connectionForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_connections, "objectForKey:", a3);
}

- (id)identifierForConnection:(id)a3
{
  return (id)objc_msgSend((id)-[NSMutableDictionary allKeysForObject:](self->_connections, "allKeysForObject:", a3), "lastObject");
}

- (unint64_t)numberOfConnections
{
  return -[NSMutableDictionary count](self->_connections, "count");
}

- (id)authTokenForUsername:(id)a3 password:(id)a4 userInfo:(id)a5
{
  return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", CFSTR("/api/1/oauth/access_token"), objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, CFSTR("x_auth_username"), a4, CFSTR("x_auth_password"), CFSTR("client_auth"), CFSTR("x_auth_mode"), 0), 0, a5, 0);
}

- (id)verifyCredentialsWithUserInfo:(id)a3
{
  return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", CFSTR("/api/1/account/verify_credentials"), 0, 1, a3, 0);
}

- (id)bookmarksWithUserInfo:(id)a3
{
  return -[IKEngine bookmarksInFolder:limit:existingBookmarks:userInfo:](self, "bookmarksInFolder:limit:existingBookmarks:userInfo:", +[IKFolder unreadFolder](IKFolder, "unreadFolder"), 25, 0, a3);
}

- (id)bookmarksInFolder:(id)a3 limit:(unint64_t)a4 existingBookmarks:(id)a5 userInfo:(id)a6
{
  uint64_t v10;
  unint64_t v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v24;
  uint64_t v25;
  IKEngine *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v11 = objc_msgSend(a3, "folderID");
  if (v11 <= 0xFFFFFFFFFFFFFFFCLL)
    v12 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(a3, "folderID"));
  else
    v12 = off_24F8B1918[v11 + 3];
  v13 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (objc_msgSend(a5, "count"))
  {
    v24 = v12;
    v25 = v10;
    v26 = self;
    v27 = a6;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(a5);
          v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v13, "appendFormat:", CFSTR("%ld"), objc_msgSend(v18, "bookmarkID"));
          if (objc_msgSend(v18, "hashString"))
            objc_msgSend(v13, "appendFormat:", CFSTR(":%@"), objc_msgSend(v18, "hashString"));
          if (objc_msgSend(v18, "progressDate"))
          {
            objc_msgSend(v18, "progress");
            if (v19 != -1.0)
            {
              objc_msgSend((id)objc_msgSend(v18, "progressDate"), "timeIntervalSince1970");
              v21 = (int)v20;
              objc_msgSend(v18, "progress");
              objc_msgSend(v13, "appendFormat:", CFSTR(":%f:%d"), v22, v21);
            }
          }
          objc_msgSend(v13, "appendFormat:", CFSTR(","));
        }
        v15 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v15);
    }
    objc_msgSend(v13, "replaceCharactersInRange:withString:", objc_msgSend(v13, "length") - 1, 1, &stru_24F8BBA48);
    a6 = v27;
    v10 = v25;
    self = v26;
    v12 = v24;
  }
  return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", CFSTR("/api/1/bookmarks/list"), objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v10, CFSTR("limit"), v12, CFSTR("folder_id"), v13, CFSTR("have"), 0), 2, a6, a3);
}

- (id)updateReadProgressOfBookmark:(id)a3 toProgress:(double)a4 userInfo:(id)a5
{
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  double v12;
  uint64_t v13;

  v8 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a3, "bookmarkID"));
  *(float *)&v9 = a4;
  v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "date"), "timeIntervalSince1970");
  v13 = objc_msgSend(v11, "numberWithInteger:", (uint64_t)v12);
  return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", CFSTR("/api/1/bookmarks/update_read_progress"), objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v8, CFSTR("bookmark_id"), v10, CFSTR("progress"), v13, CFSTR("progress_timestamp"), 0), 3, a5, 0);
}

- (id)addBookmarkWithURL:(id)a3 userInfo:(id)a4
{
  return -[IKEngine addBookmarkWithURL:title:description:folder:resolveFinalURL:userInfo:](self, "addBookmarkWithURL:title:description:folder:resolveFinalURL:userInfo:", a3, 0, 0, 0, 1, a4);
}

- (id)addBookmarkWithURL:(id)a3 title:(id)a4 description:(id)a5 folder:(id)a6 resolveFinalURL:(BOOL)a7 userInfo:(id)a8
{
  _BOOL8 v9;
  void *v15;

  v9 = a7;
  v15 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  objc_msgSend(v15, "setObject:forKey:", objc_msgSend(a3, "absoluteString"), CFSTR("url"));
  if (a4)
    objc_msgSend(v15, "setObject:forKey:", a4, CFSTR("title"));
  if (a5)
    objc_msgSend(v15, "setObject:forKey:", a5, CFSTR("description"));
  if (a6)
    objc_msgSend(v15, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a6, "folderID")), CFSTR("folder_id"));
  objc_msgSend(v15, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9), CFSTR("resolve_final_url"));
  return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", CFSTR("/api/1/bookmarks/add"), v15, 4, a8, 0);
}

- (id)deleteBookmark:(id)a3 userInfo:(id)a4
{
  uint64_t v6;

  v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a3, "bookmarkID"));
  return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", CFSTR("/api/1/bookmarks/delete"), objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v6, CFSTR("bookmark_id")), 5, a4, v6);
}

- (id)starBookmark:(id)a3 userInfo:(id)a4
{
  uint64_t v6;

  v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a3, "bookmarkID"));
  return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", CFSTR("/api/1/bookmarks/star"), objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v6, CFSTR("bookmark_id")), 6, a4, 0);
}

- (id)unstarBookmark:(id)a3 userInfo:(id)a4
{
  uint64_t v6;

  v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a3, "bookmarkID"));
  return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", CFSTR("/api/1/bookmarks/unstar"), objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v6, CFSTR("bookmark_id")), 7, a4, 0);
}

- (id)archiveBookmark:(id)a3 userInfo:(id)a4
{
  uint64_t v6;

  v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a3, "bookmarkID"));
  return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", CFSTR("/api/1/bookmarks/archive"), objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v6, CFSTR("bookmark_id")), 8, a4, 0);
}

- (id)unarchiveBookmark:(id)a3 userInfo:(id)a4
{
  uint64_t v6;

  v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a3, "bookmarkID"));
  return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", CFSTR("/api/1/bookmarks/unarchive"), objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v6, CFSTR("bookmark_id")), 9, a4, 0);
}

- (id)moveBookmark:(id)a3 toFolder:(id)a4 userInfo:(id)a5
{
  uint64_t v8;
  uint64_t v9;

  v8 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a3, "bookmarkID"));
  v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a4, "folderID"));
  return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", CFSTR("/api/1/bookmarks/move"), objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v8, CFSTR("bookmark_id"), v9, CFSTR("folder_id"), 0), 10, a5, v9);
}

- (id)textOfBookmark:(id)a3 userInfo:(id)a4
{
  uint64_t v6;

  v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a3, "bookmarkID"));
  return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", CFSTR("/api/1/bookmarks/get_text"), objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v6, CFSTR("bookmark_id")), 11, a4, v6);
}

- (id)foldersWithUserInfo:(id)a3
{
  return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", CFSTR("/api/1/folders/list"), 0, 12, a3, 0);
}

- (id)addFolderWithTitle:(id)a3 userInfo:(id)a4
{
  return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", CFSTR("/api/1/folders/add"), objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a3, CFSTR("title")), 13, a4, 0);
}

- (id)deleteFolder:(id)a3 userInfo:(id)a4
{
  uint64_t v6;

  v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a3, "folderID"));
  return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", CFSTR("/api/1/folders/delete"), objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v6, CFSTR("folder_id")), 14, a4, v6);
}

- (id)orderFolders:(id)a3 userInfo:(id)a4
{
  id result;
  void *v8;
  unint64_t v9;

  result = (id)objc_msgSend(a3, "count");
  if (result)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
    if (objc_msgSend(a3, "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(v8, "appendFormat:", CFSTR("%ld:%lu,"), objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v9), "folderID"), v9);
        ++v9;
      }
      while (v9 < objc_msgSend(a3, "count"));
    }
    objc_msgSend(v8, "replaceCharactersInRange:withString:", objc_msgSend(v8, "length") - 1, 1, &stru_24F8BBA48);
    return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", CFSTR("/api/1/folders/set_order"), objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v8, CFSTR("order")), 15, a4, 0);
  }
  return result;
}

- (void)cancelConnection:(id)a3
{
  id v5;
  id v6;

  v5 = -[IKEngine identifierForConnection:](self, "identifierForConnection:");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(a3, "cancel");
    -[IKEngine delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[IKEngineDelegate engine:didCancelConnection:](-[IKEngine delegate](self, "delegate"), "engine:didCancelConnection:", self, a3);
    -[NSMutableDictionary removeObjectForKey:](self->_connections, "removeObjectForKey:", v6);
  }
}

- (void)cancelAllConnections
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:", self->_connections);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[IKEngine cancelConnection:](self, "cancelConnection:", objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++)));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  objc_msgSend(a3, "_setResponse:", a4);
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  objc_msgSend(a3, "_appendData:", a4);
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  -[IKEngine delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[IKEngineDelegate engine:didFailConnection:error:](-[IKEngine delegate](self, "delegate"), "engine:didFailConnection:error:", self, a3, a4);
  -[NSMutableDictionary removeObjectForKey:](self->_connections, "removeObjectForKey:", -[IKEngine identifierForConnection:](self, "identifierForConnection:", a3));
}

- (void)connectionDidFinishLoading:(id)a3
{
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  IKEngineDelegate *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  IKEngine *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", objc_msgSend(a3, "data"), 4);
  v6 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], -1011, 0);
  v7 = objc_msgSend(a3, "type");
  if (v7 == 11)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "response"), "statusCode") == 200)
    {
      -[IKEngine delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[IKEngineDelegate engine:connection:didReceiveText:ofBookmarkWithBookmarkID:](-[IKEngine delegate](self, "delegate"), "engine:connection:didReceiveText:ofBookmarkWithBookmarkID:", self, a3, v5, objc_msgSend((id)objc_msgSend(a3, "_context"), "integerValue"));
      goto LABEL_11;
    }
    v20 = +[IKDeserializer objectFromJSONString:](IKDeserializer, "objectFromJSONString:", v5);
    if (v20)
    {
      v12 = v20;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_24:
        v18 = self;
        v19 = a3;
        v17 = (uint64_t)v12;
        goto LABEL_84;
      }
    }
LABEL_83:
    v18 = self;
    v19 = a3;
    v17 = v6;
    goto LABEL_84;
  }
  v8 = v7;
  if (!v7)
  {
    v9 = objc_msgSend((id)objc_msgSend(a3, "response"), "statusCode");
    if (v9 == 200)
    {
      v72 = 0;
      v73 = 0;
      if (!+[IKDeserializer token:andTokenSecret:fromQlineString:](IKDeserializer, "token:andTokenSecret:fromQlineString:", &v73, &v72, v5))
      {
        -[IKEngine connection:didFailWithError:](self, "connection:didFailWithError:", a3, v6);
        return;
      }
      -[IKEngine delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v10 = -[IKEngine delegate](self, "delegate");
        -[IKEngineDelegate engine:connection:didReceiveAuthToken:andTokenSecret:](v10, "engine:connection:didReceiveAuthToken:andTokenSecret:", self, a3, v73, v72);
      }
      -[IKEngine setOAuthToken:](self, "setOAuthToken:", v73);
      -[IKEngine setOAuthTokenSecret:](self, "setOAuthTokenSecret:", v72);
      goto LABEL_11;
    }
    v15 = v9;
    v16 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v5, CFSTR("message"));
    v17 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.matthiasplappert.InstapaperKit"), v15, v16);
    v18 = self;
    v19 = a3;
LABEL_84:
    -[IKEngine connection:didFailWithError:](v18, "connection:didFailWithError:", v19, v17);
    return;
  }
  v11 = +[IKDeserializer objectFromJSONString:](IKDeserializer, "objectFromJSONString:", v5);
  if (!v11)
    goto LABEL_83;
  v12 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_24;
  switch(v8)
  {
    case 1:
      v13 = objc_msgSend(v12, "lastObject");
      if (!v13)
        goto LABEL_83;
      v14 = v13;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_83;
      -[IKEngine delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[IKEngineDelegate engine:connection:didVerifyCredentialsForUser:](-[IKEngine delegate](self, "delegate"), "engine:connection:didVerifyCredentialsForUser:", self, a3, v14);
      break;
    case 2:
      v21 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v22 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      if (v22)
      {
        v23 = v22;
        v24 = 0;
        v25 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v69 != v25)
              objc_enumerationMutation(v12);
            v27 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = v27;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v21, "addObject:", v27);
            }
          }
          v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
        }
        while (v23);
      }
      else
      {
        v24 = 0;
      }
      v59 = objc_msgSend(a3, "_context");
      -[IKEngine delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[IKEngineDelegate engine:connection:didReceiveBookmarks:ofUser:forFolder:](-[IKEngine delegate](self, "delegate"), "engine:connection:didReceiveBookmarks:ofUser:forFolder:", self, a3, v21, v24, v59);
      break;
    case 3:
      v28 = objc_msgSend(v12, "lastObject");
      if (!v28)
        goto LABEL_83;
      v29 = v28;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_83;
      -[IKEngine delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[IKEngineDelegate engine:connection:didUpdateReadProgressOfBookmark:](-[IKEngine delegate](self, "delegate"), "engine:connection:didUpdateReadProgressOfBookmark:", self, a3, v29);
      break;
    case 4:
      v30 = objc_msgSend(v12, "lastObject");
      if (!v30)
        goto LABEL_83;
      v31 = v30;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_83;
      -[IKEngine delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[IKEngineDelegate engine:connection:didAddBookmark:](-[IKEngine delegate](self, "delegate"), "engine:connection:didAddBookmark:", self, a3, v31);
      break;
    case 5:
      v32 = objc_msgSend((id)objc_msgSend(a3, "_context"), "integerValue");
      -[IKEngine delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[IKEngineDelegate engine:connection:didDeleteBookmarkWithBookmarkID:](-[IKEngine delegate](self, "delegate"), "engine:connection:didDeleteBookmarkWithBookmarkID:", self, a3, v32);
      break;
    case 6:
      v33 = objc_msgSend(v12, "lastObject");
      if (!v33)
        goto LABEL_83;
      v34 = v33;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_83;
      -[IKEngine delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[IKEngineDelegate engine:connection:didStarBookmark:](-[IKEngine delegate](self, "delegate"), "engine:connection:didStarBookmark:", self, a3, v34);
      break;
    case 7:
      v35 = objc_msgSend(v12, "lastObject");
      if (!v35)
        goto LABEL_83;
      v36 = v35;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_83;
      -[IKEngine delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[IKEngineDelegate engine:connection:didUnstarBookmark:](-[IKEngine delegate](self, "delegate"), "engine:connection:didUnstarBookmark:", self, a3, v36);
      break;
    case 8:
      v37 = objc_msgSend(v12, "lastObject");
      if (!v37)
        goto LABEL_83;
      v38 = v37;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_83;
      -[IKEngine delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[IKEngineDelegate engine:connection:didArchiveBookmark:](-[IKEngine delegate](self, "delegate"), "engine:connection:didArchiveBookmark:", self, a3, v38);
      break;
    case 9:
      v39 = objc_msgSend(v12, "lastObject");
      if (!v39)
        goto LABEL_83;
      v40 = v39;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_83;
      -[IKEngine delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[IKEngineDelegate engine:connection:didUnarchiveBookmark:](-[IKEngine delegate](self, "delegate"), "engine:connection:didUnarchiveBookmark:", self, a3, v40);
      break;
    case 10:
      v41 = objc_msgSend(v12, "lastObject");
      v42 = objc_msgSend((id)objc_msgSend(a3, "_context"), "integerValue");
      if (!v41)
        goto LABEL_83;
      v43 = v42;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_83;
      -[IKEngine delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[IKEngineDelegate engine:connection:didMoveBookmark:toFolderWithFolderID:](-[IKEngine delegate](self, "delegate"), "engine:connection:didMoveBookmark:toFolderWithFolderID:", self, a3, v41, v43);
      break;
    case 12:
      v44 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v45 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v65;
        do
        {
          for (j = 0; j != v46; ++j)
          {
            if (*(_QWORD *)v65 != v47)
              objc_enumerationMutation(v12);
            v49 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v44, "addObject:", v49);
          }
          v46 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
        }
        while (v46);
      }
      -[IKEngine delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[IKEngineDelegate engine:connection:didReceiveFolders:](-[IKEngine delegate](self, "delegate"), "engine:connection:didReceiveFolders:", self, a3, v44);
      break;
    case 13:
      v50 = objc_msgSend(v12, "lastObject");
      if (!v50)
        goto LABEL_83;
      v51 = v50;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_83;
      -[IKEngine delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[IKEngineDelegate engine:connection:didAddFolder:](-[IKEngine delegate](self, "delegate"), "engine:connection:didAddFolder:", self, a3, v51);
      break;
    case 14:
      v52 = objc_msgSend((id)objc_msgSend(a3, "_context"), "integerValue");
      -[IKEngine delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[IKEngineDelegate engine:connection:didDeleteFolderWithFolderID:](-[IKEngine delegate](self, "delegate"), "engine:connection:didDeleteFolderWithFolderID:", self, a3, v52);
      break;
    case 15:
      v53 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v54 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v61;
        do
        {
          for (k = 0; k != v55; ++k)
          {
            if (*(_QWORD *)v61 != v56)
              objc_enumerationMutation(v12);
            v58 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v53, "addObject:", v58);
          }
          v55 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
        }
        while (v55);
      }
      -[IKEngine delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[IKEngineDelegate engine:connection:didOrderFolders:](-[IKEngine delegate](self, "delegate"), "engine:connection:didOrderFolders:", self, a3, v53);
      break;
    default:
      break;
  }
LABEL_11:
  -[IKEngine delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[IKEngineDelegate engine:didFinishConnection:](-[IKEngine delegate](self, "delegate"), "engine:didFinishConnection:", self, a3);
  -[NSMutableDictionary removeObjectForKey:](self->_connections, "removeObjectForKey:", -[IKEngine identifierForConnection:](self, "identifierForConnection:", a3));
}

- (void)dealloc
{
  objc_super v3;

  self->_delegate = 0;
  -[IKEngine cancelAllConnections](self, "cancelAllConnections");

  v3.receiver = self;
  v3.super_class = (Class)IKEngine;
  -[IKEngine dealloc](&v3, sel_dealloc);
}

- (id)_startConnectionWithAPIPath:(id)a3 bodyArguments:(id)a4 type:(int)a5 userInfo:(id)a6 context:(id)a7
{
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  const __CFString *OAuthTokenSecret;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  IKURLConnection *v47;
  void *v48;
  uint64_t v49;
  void *v51;
  unsigned int v52;
  id v53;
  id v54;
  IKEngine *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  if (!_startConnectionWithAPIPath_bodyArguments_type_userInfo_context__baseURL)
    _startConnectionWithAPIPath_bodyArguments_type_userInfo_context__baseURL = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("https://www.instapaper.com"));
  v13 = objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:relativeToURL:", a3);
  if (!v13)
    return 0;
  v14 = (void *)v13;
  v52 = a5;
  v53 = a6;
  v54 = a7;
  v55 = self;
  v15 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v16 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v70 != v18)
          objc_enumerationMutation(a4);
        v20 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "ik_URLEncodedString");
        v22 = (void *)objc_msgSend(a4, "objectForKey:", v20);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          v22 = (void *)objc_msgSend(v22, "stringValue");
        objc_msgSend(v15, "setObject:forKey:", objc_msgSend(v22, "ik_URLEncodedString"), v21);
      }
      v17 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    }
    while (v17);
  }
  v56 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (objc_msgSend(v15, "count"))
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v23 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v66;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v66 != v25)
            objc_enumerationMutation(v15);
          objc_msgSend(v56, "appendFormat:", CFSTR("%@=%@&"), *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j), objc_msgSend(v15, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j)));
        }
        v24 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
      }
      while (v24);
    }
    objc_msgSend(v56, "replaceCharactersInRange:withString:", objc_msgSend(v56, "length") - 1, 1, &stru_24F8BBA48);
  }
  v51 = v14;
  v27 = objc_msgSend((id)objc_msgSend(v14, "absoluteString"), "ik_URLEncodedString");
  v28 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1760], "processInfo"), "globallyUniqueString");
  v29 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "date"), "timeIntervalSince1970");
  v31 = objc_msgSend(v29, "stringWithFormat:", CFSTR("%d"), (int)v30);
  v32 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  objc_msgSend(v32, "setObject:forKey:", v28, CFSTR("oauth_nonce"));
  objc_msgSend(v32, "setObject:forKey:", CFSTR("HMAC-SHA1"), CFSTR("oauth_signature_method"));
  objc_msgSend(v32, "setObject:forKey:", v31, CFSTR("oauth_timestamp"));
  objc_msgSend(v32, "setObject:forKey:", _OAuthConsumerKey, CFSTR("oauth_consumer_key"));
  objc_msgSend(v32, "setObject:forKey:", CFSTR("1.0"), CFSTR("oauth_version"));
  if (-[IKEngine OAuthToken](v55, "OAuthToken"))
    objc_msgSend(v32, "setObject:forKey:", -[IKEngine OAuthToken](v55, "OAuthToken"), CFSTR("oauth_token"));
  v33 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v15);
  objc_msgSend(v33, "addEntriesFromDictionary:", v32);
  v34 = (void *)objc_msgSend((id)objc_msgSend(v33, "allKeys"), "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v35 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@&%@&"), CFSTR("POST"), v27);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v37; ++k)
      {
        if (*(_QWORD *)v62 != v38)
          objc_enumerationMutation(v34);
        objc_msgSend(v35, "appendFormat:", CFSTR("%@%%3D%@%%26"), objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * k), "ik_URLEncodedString"), objc_msgSend((id)objc_msgSend(v33, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k)), "ik_URLEncodedString"));
      }
      v37 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
    }
    while (v37);
  }
  objc_msgSend(v35, "replaceCharactersInRange:withString:", objc_msgSend(v35, "length") - 3, 3, &stru_24F8BBA48);
  OAuthTokenSecret = (const __CFString *)v55->_OAuthTokenSecret;
  if (!OAuthTokenSecret)
    OAuthTokenSecret = &stru_24F8BBA48;
  objc_msgSend(v32, "setObject:forKey:", -[IKEngine _signatureWithKey:baseString:](v55, "_signatureWithKey:baseString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@&%@"), _OAuthConsumerSecret, OAuthTokenSecret), v35), CFSTR("oauth_signature"));
  v41 = (void *)objc_msgSend(MEMORY[0x24BDB7458], "requestWithURL:", v51);
  objc_msgSend(v41, "_setNonAppInitiated:", 1);
  objc_msgSend(v41, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v41, "setHTTPBody:", objc_msgSend(v56, "dataUsingEncoding:", 4));
  v42 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("OAuth "));
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v43 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v58;
    do
    {
      for (m = 0; m != v44; ++m)
      {
        if (*(_QWORD *)v58 != v45)
          objc_enumerationMutation(v32);
        objc_msgSend(v42, "appendFormat:", CFSTR("%@=\"%@\", "), *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * m), objc_msgSend(v32, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * m)));
      }
      v44 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
    }
    while (v44);
  }
  objc_msgSend(v42, "replaceCharactersInRange:withString:", objc_msgSend(v42, "length") - 2, 2, &stru_24F8BBA48);
  objc_msgSend(v41, "setValue:forHTTPHeaderField:", v42, CFSTR("Authorization"));
  v47 = -[IKURLConnection initWithRequest:delegate:startImmediately:]([IKURLConnection alloc], "initWithRequest:delegate:startImmediately:", v41, v55, 0);
  -[IKURLConnection _setType:](v47, "_setType:", v52);
  -[IKURLConnection _setUserInfo:](v47, "_setUserInfo:", v53);
  -[IKURLConnection _setContext:](v47, "_setContext:", v54);
  v48 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1760], "processInfo"), "globallyUniqueString");
  -[NSMutableDictionary setObject:forKey:](v55->_connections, "setObject:forKey:", v47, v48);

  -[IKEngine delegate](v55, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[IKEngineDelegate engine:willStartConnection:](-[IKEngine delegate](v55, "delegate"), "engine:willStartConnection:", v55, v47);
  v49 = objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  -[NSURLConnection scheduleInRunLoop:forMode:](v47, "scheduleInRunLoop:forMode:", v49, *MEMORY[0x24BDBCB80]);
  -[NSURLConnection start](v47, "start");
  return v48;
}

- (id)_signatureWithKey:(id)a3 baseString:(id)a4
{
  const char *v5;
  const char *v6;
  size_t v7;
  size_t v8;
  void *v9;
  void *v10;
  _BYTE macOut[20];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (const char *)objc_msgSend(a3, "cStringUsingEncoding:", 1);
  v6 = (const char *)objc_msgSend(a4, "cStringUsingEncoding:", 1);
  v7 = strlen(v5);
  v8 = strlen(v6);
  CCHmac(0, v5, v7, v6, v8, macOut);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", macOut, 20);
  v10 = (void *)objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);

  return v10;
}

- (IKEngineDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (IKEngineDelegate *)a3;
}

- (NSString)OAuthToken
{
  return self->_OAuthToken;
}

- (void)setOAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)OAuthTokenSecret
{
  return self->_OAuthTokenSecret;
}

- (void)setOAuthTokenSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

+ (void)setOAuthConsumerKey:(id)a3 andConsumerSecret:(id)a4
{

  _OAuthConsumerKey = objc_msgSend(a3, "copy");
  _OAuthConsumerSecret = objc_msgSend(a4, "copy");
}

@end
