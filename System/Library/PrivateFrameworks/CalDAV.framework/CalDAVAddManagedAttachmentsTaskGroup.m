@implementation CalDAVAddManagedAttachmentsTaskGroup

- (CalDAVAddManagedAttachmentsTaskGroup)initWithAccountInfoProvider:(id)a3 resourceURL:(id)a4 attachments:(id)a5 contentTypes:(id)a6 taskManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  CalDAVAddManagedAttachmentsTaskGroup *v15;
  CalDAVAddManagedAttachmentsTaskGroup *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *filenamesToServerLocation;
  objc_super v20;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CalDAVAddManagedAttachmentsTaskGroup;
  v15 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v20, sel_initWithAccountInfoProvider_taskManager_, a3, a7);
  v16 = v15;
  if (v15)
  {
    -[CalDAVAddManagedAttachmentsTaskGroup setState:](v15, "setState:", 0);
    -[CalDAVAddManagedAttachmentsTaskGroup setResourceURL:](v16, "setResourceURL:", v12);
    -[CalDAVAddManagedAttachmentsTaskGroup setAttachments:](v16, "setAttachments:", v13);
    -[CalDAVAddManagedAttachmentsTaskGroup setContentTypes:](v16, "setContentTypes:", v14);
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    filenamesToServerLocation = v16->_filenamesToServerLocation;
    v16->_filenamesToServerLocation = v17;

  }
  return v16;
}

- (void)_finishWithError:(id)a3 state:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v4 = *(_QWORD *)&a4;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[CalDAVAddManagedAttachmentsTaskGroup setState:](self, "setState:", v4);
  if ((_DWORD)v4 == 6)
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logHandleForAccountInfoProvider:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2096EB000, v9, OS_LOG_TYPE_ERROR, "Finishing %{public}@ early because state machine reached an unexpected state.", (uint8_t *)&v12, 0xCu);

    }
  }
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v6, 0);

}

- (BOOL)_postedLastAttachment
{
  void *v3;
  unint64_t v4;
  void *v5;

  -[CalDAVAddManagedAttachmentsTaskGroup attachments](self, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[CalDAVAddManagedAttachmentsTaskGroup filenamesToServerLocation](self, "filenamesToServerLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v4 <= objc_msgSend(v5, "count");

  return v4;
}

- (id)urlWithQuery
{
  NSURL *postURLWithQuery;
  void *v4;
  void *v5;
  void *v6;
  NSURL *v7;
  NSURL *v8;

  postURLWithQuery = self->_postURLWithQuery;
  if (!postURLWithQuery)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[CalDAVAddManagedAttachmentsTaskGroup resourceURL](self, "resourceURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v5, CFSTR("?action=attachment-add"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v6);
    v8 = self->_postURLWithQuery;
    self->_postURLWithQuery = v7;

    postURLWithQuery = self->_postURLWithQuery;
  }
  return postURLWithQuery;
}

- (void)_fetchUpdatedContent
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id location;

  -[CalDAVAddManagedAttachmentsTaskGroup setState:](self, "setState:", 2);
  v3 = objc_alloc(MEMORY[0x24BE1AB00]);
  -[CalDAVAddManagedAttachmentsTaskGroup resourceURL](self, "resourceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithURL:", v4);

  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountInfoProvider:", v6);

  objc_initWeak(&location, v5);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__CalDAVAddManagedAttachmentsTaskGroup__fetchUpdatedContent__block_invoke;
  v8[3] = &unk_24C1FB638;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "setCompletionBlock:", v8);
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "submitQueuedCoreDAVTask:", v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __60__CalDAVAddManagedAttachmentsTaskGroup__fetchUpdatedContent__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "responseBodyParser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "octetStreamData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setUpdatedResourcePayload:", v5);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "responseHeaders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CDVObjectForKeyCaseInsensitive:", CFSTR("Schedule-Tag"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setUpdatedScheduleTag:", v8);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "responseHeaders");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "CDVObjectForKeyCaseInsensitive:", *MEMORY[0x24BE1AA80]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setUpdatedETag:", v11);

  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v14 = 3;
  else
    v14 = 7;

  v15 = *(void **)(a1 + 32);
  v17 = objc_loadWeakRetained(v2);
  objc_msgSend(v17, "error");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_finishWithError:state:", v16, v14);

}

- (void)_handlePostResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *filenamesToServerLocation;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  objc_msgSend(v30, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[CalDAVAddManagedAttachmentsTaskGroup setPreviousScheduleTag:](self, "setPreviousScheduleTag:", 0);
    -[CalDAVAddManagedAttachmentsTaskGroup setPreviousETag:](self, "setPreviousETag:", 0);
    objc_msgSend(v30, "responseHeaders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "CDVObjectForKeyCaseInsensitive:", CFSTR("Schedule-Tag"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVAddManagedAttachmentsTaskGroup setUpdatedScheduleTag:](self, "setUpdatedScheduleTag:", v10);

    objc_msgSend(v30, "responseHeaders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CDVObjectForKeyCaseInsensitive:", *MEMORY[0x24BE1AA80]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVAddManagedAttachmentsTaskGroup setUpdatedETag:](self, "setUpdatedETag:", v12);

    objc_msgSend(v30, "responseHeaders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "CDVObjectForKeyCaseInsensitive:", *MEMORY[0x24BE1AA98]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v16;

    filenamesToServerLocation = self->_filenamesToServerLocation;
    objc_msgSend(v30, "filename");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](filenamesToServerLocation, "setObject:forKey:", v19, v25);

    if (!-[CalDAVAddManagedAttachmentsTaskGroup _postedLastAttachment](self, "_postedLastAttachment"))
    {
      -[CalDAVAddManagedAttachmentsTaskGroup _sendAttachments](self, "_sendAttachments");
      goto LABEL_19;
    }
    objc_msgSend(v30, "responseData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVAddManagedAttachmentsTaskGroup setUpdatedResourcePayload:](self, "setUpdatedResourcePayload:", v26);

    objc_msgSend(v30, "responseData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "length"))
    {
      -[CalDAVAddManagedAttachmentsTaskGroup updatedScheduleTag](self, "updatedScheduleTag");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {

LABEL_17:
        -[CalDAVAddManagedAttachmentsTaskGroup _finishWithError:state:](self, "_finishWithError:state:", 0, 7);
        goto LABEL_19;
      }
      -[CalDAVAddManagedAttachmentsTaskGroup updatedETag](self, "updatedETag");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
        goto LABEL_17;
    }
    else
    {

    }
    -[CalDAVAddManagedAttachmentsTaskGroup _fetchUpdatedContent](self, "_fetchUpdatedContent");
    goto LABEL_19;
  }
  objc_msgSend(v30, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE1AAB8]) & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(v30, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "code");

  if (v8 != 412)
  {
LABEL_8:
    v17 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v30, "requestDataPayload");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithUnsignedLongLong:", objc_msgSend(v18, "length"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(v30, "filename");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryWithObject:forKey:", v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVAddManagedAttachmentsTaskGroup setPostFailureSizes:](self, "setPostFailureSizes:", v22);

    objc_msgSend(v30, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVAddManagedAttachmentsTaskGroup _finishWithError:state:](self, "_finishWithError:state:", v23, 5);

LABEL_19:
    goto LABEL_20;
  }
  -[CalDAVAddManagedAttachmentsTaskGroup setHadPreconditionFailure:](self, "setHadPreconditionFailure:", 1);
  -[CalDAVAddManagedAttachmentsTaskGroup setPreviousScheduleTag:](self, "setPreviousScheduleTag:", 0);
  -[CalDAVAddManagedAttachmentsTaskGroup setPreviousETag:](self, "setPreviousETag:", 0);
  -[CalDAVAddManagedAttachmentsTaskGroup _sendAttachments](self, "_sendAttachments");
LABEL_20:

}

- (void)_sendAttachments
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CalDAVPostStreamTask *v15;
  void *v16;
  CalDAVPostStreamTask *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id location;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[CalDAVAddManagedAttachmentsTaskGroup setState:](self, "setState:", 1);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[CalDAVAddManagedAttachmentsTaskGroup attachments](self, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v31;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v5)
        objc_enumerationMutation(v3);
      v7 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v6);
      -[CalDAVAddManagedAttachmentsTaskGroup filenamesToServerLocation](self, "filenamesToServerLocation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 == 0;

      if (v10)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    -[CalDAVAddManagedAttachmentsTaskGroup contentTypes](self, "contentTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v12, "length"))
    {
      -[CalDAVAddManagedAttachmentsTaskGroup _finishWithError:state:](self, "_finishWithError:state:", 0, 4);
LABEL_22:

      return;
    }
    -[CalDAVAddManagedAttachmentsTaskGroup attachments](self, "attachments");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = [CalDAVPostStreamTask alloc];
    -[CalDAVAddManagedAttachmentsTaskGroup urlWithQuery](self, "urlWithQuery");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CoreDAVPostTask initWithDataPayload:dataContentType:atURL:previousETag:](v15, "initWithDataPayload:dataContentType:atURL:previousETag:", v14, v12, v16, 0);

    if (-[CalDAVAddManagedAttachmentsTaskGroup hadPreconditionFailure](self, "hadPreconditionFailure"))
      goto LABEL_12;
    -[CalDAVAddManagedAttachmentsTaskGroup updatedScheduleTag](self, "updatedScheduleTag");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {

    }
    else
    {
      -[CalDAVAddManagedAttachmentsTaskGroup previousScheduleTag](self, "previousScheduleTag");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        -[CalDAVAddManagedAttachmentsTaskGroup updatedETag](self, "updatedETag");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {

        }
        else
        {
          -[CalDAVAddManagedAttachmentsTaskGroup previousETag](self, "previousETag");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
          {
LABEL_12:
            -[CoreDAVPostOrPutTask setForceToServer:](v17, "setForceToServer:", 1);
LABEL_21:
            -[CalDAVPostStreamTask setFilename:](v17, "setFilename:", v7);
            -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[CalDAVPostStreamTask setAccountInfoProvider:](v17, "setAccountInfoProvider:", v22);

            objc_initWeak(&location, v17);
            v27[0] = MEMORY[0x24BDAC760];
            v27[1] = 3221225472;
            v27[2] = __56__CalDAVAddManagedAttachmentsTaskGroup__sendAttachments__block_invoke;
            v27[3] = &unk_24C1FB638;
            v27[4] = self;
            objc_copyWeak(&v28, &location);
            -[CalDAVPostStreamTask setCompletionBlock:](v17, "setCompletionBlock:", v27);
            -[CoreDAVTaskGroup taskManager](self, "taskManager");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "submitQueuedCoreDAVTask:", v17);

            objc_destroyWeak(&v28);
            objc_destroyWeak(&location);

            goto LABEL_22;
          }
        }
        -[CalDAVAddManagedAttachmentsTaskGroup updatedETag](self, "updatedETag");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          -[CoreDAVPostOrPutTask setPreviousETag:](v17, "setPreviousETag:", v20);
        }
        else
        {
          -[CalDAVAddManagedAttachmentsTaskGroup previousETag](self, "previousETag");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVPostOrPutTask setPreviousETag:](v17, "setPreviousETag:", v26);

        }
LABEL_20:

        goto LABEL_21;
      }
    }
    -[CalDAVAddManagedAttachmentsTaskGroup updatedScheduleTag](self, "updatedScheduleTag");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[CalDAVPostStreamTask setPreviousScheduleTag:](v17, "setPreviousScheduleTag:", v20);
    }
    else
    {
      -[CalDAVAddManagedAttachmentsTaskGroup previousScheduleTag](self, "previousScheduleTag");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDAVPostStreamTask setPreviousScheduleTag:](v17, "setPreviousScheduleTag:", v21);

    }
    goto LABEL_20;
  }
LABEL_9:

  -[CalDAVAddManagedAttachmentsTaskGroup _finishWithError:state:](self, "_finishWithError:state:", 0, 6);
}

void __56__CalDAVAddManagedAttachmentsTaskGroup__sendAttachments__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "_handlePostResponse:", WeakRetained);

}

- (void)startTaskGroup
{
  -[CalDAVAddManagedAttachmentsTaskGroup setState:](self, "setState:", 1);
  -[CalDAVAddManagedAttachmentsTaskGroup _sendAttachments](self, "_sendAttachments");
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSString)previousETag
{
  return self->_previousETag;
}

- (void)setPreviousETag:(id)a3
{
  objc_storeStrong((id *)&self->_previousETag, a3);
}

- (NSString)previousScheduleTag
{
  return self->_previousScheduleTag;
}

- (void)setPreviousScheduleTag:(id)a3
{
  objc_storeStrong((id *)&self->_previousScheduleTag, a3);
}

- (NSData)updatedResourcePayload
{
  return self->_updatedResourcePayload;
}

- (void)setUpdatedResourcePayload:(id)a3
{
  objc_storeStrong((id *)&self->_updatedResourcePayload, a3);
}

- (BOOL)hadPreconditionFailure
{
  return self->_hadPreconditionFailure;
}

- (void)setHadPreconditionFailure:(BOOL)a3
{
  self->_hadPreconditionFailure = a3;
}

- (NSString)updatedETag
{
  return self->_updatedETag;
}

- (void)setUpdatedETag:(id)a3
{
  objc_storeStrong((id *)&self->_updatedETag, a3);
}

- (NSString)updatedScheduleTag
{
  return self->_updatedScheduleTag;
}

- (void)setUpdatedScheduleTag:(id)a3
{
  objc_storeStrong((id *)&self->_updatedScheduleTag, a3);
}

- (NSDictionary)postFailureSizes
{
  return self->_postFailureSizes;
}

- (void)setPostFailureSizes:(id)a3
{
  objc_storeStrong((id *)&self->_postFailureSizes, a3);
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (void)setResourceURL:(id)a3
{
  objc_storeStrong((id *)&self->_resourceURL, a3);
}

- (NSDictionary)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (NSDictionary)contentTypes
{
  return self->_contentTypes;
}

- (void)setContentTypes:(id)a3
{
  objc_storeStrong((id *)&self->_contentTypes, a3);
}

- (NSMutableDictionary)filenamesToServerLocation
{
  return self->_filenamesToServerLocation;
}

- (void)setFilenamesToServerLocation:(id)a3
{
  objc_storeStrong((id *)&self->_filenamesToServerLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filenamesToServerLocation, 0);
  objc_storeStrong((id *)&self->_contentTypes, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
  objc_storeStrong((id *)&self->_postFailureSizes, 0);
  objc_storeStrong((id *)&self->_updatedScheduleTag, 0);
  objc_storeStrong((id *)&self->_updatedETag, 0);
  objc_storeStrong((id *)&self->_updatedResourcePayload, 0);
  objc_storeStrong((id *)&self->_previousScheduleTag, 0);
  objc_storeStrong((id *)&self->_previousETag, 0);
  objc_storeStrong((id *)&self->_postURLWithQuery, 0);
}

@end
