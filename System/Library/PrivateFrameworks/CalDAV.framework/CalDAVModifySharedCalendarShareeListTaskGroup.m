@implementation CalDAVModifySharedCalendarShareeListTaskGroup

- (CalDAVModifySharedCalendarShareeListTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Initializing this class instance with an inherited initializer not allowed."), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (CalDAVModifySharedCalendarShareeListTaskGroup)initWithShareesToSet:(id)a3 shareesToRemove:(id)a4 muteNotifications:(BOOL)a5 summary:(id)a6 atCalendarURL:(id)a7 accountInfoProvider:(id)a8 taskManager:(id)a9
{
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  CalDAVModifySharedCalendarShareeListTaskGroup *v19;
  CalDAVModifySharedCalendarShareeListTaskGroup *v20;
  objc_super v22;

  v12 = a5;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CalDAVModifySharedCalendarShareeListTaskGroup;
  v19 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v22, sel_initWithAccountInfoProvider_taskManager_, a8, a9);
  v20 = v19;
  if (v19)
  {
    -[CalDAVModifySharedCalendarShareeListTaskGroup setShareesToRemove:](v19, "setShareesToRemove:", v16);
    -[CalDAVModifySharedCalendarShareeListTaskGroup setShareesToSet:](v20, "setShareesToSet:", v15);
    -[CalDAVModifySharedCalendarShareeListTaskGroup setCalendarURL:](v20, "setCalendarURL:", v18);
    -[CalDAVModifySharedCalendarShareeListTaskGroup setSummary:](v20, "setSummary:", v17);
    -[CalDAVModifySharedCalendarShareeListTaskGroup setInvalidSharees:](v20, "setInvalidSharees:", 0);
    -[CalDAVModifySharedCalendarShareeListTaskGroup setMuteNotifications:](v20, "setMuteNotifications:", v12);
  }

  return v20;
}

- (void)startTaskGroup
{
  CalDAVModifySharedCalendarShareeListPostTask *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CalDAVModifySharedCalendarShareeListPostTask *v8;

  v3 = [CalDAVModifySharedCalendarShareeListPostTask alloc];
  -[CalDAVModifySharedCalendarShareeListTaskGroup generateModificationMessageBody](self, "generateModificationMessageBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVModifySharedCalendarShareeListTaskGroup calendarURL](self, "calendarURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CoreDAVPostTask initWithDataPayload:dataContentType:atURL:previousETag:](v3, "initWithDataPayload:dataContentType:atURL:previousETag:", v4, CFSTR("text/xml"), v5, 0);

  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVModifySharedCalendarShareeListPostTask setAccountInfoProvider:](v8, "setAccountInfoProvider:", v6);

  -[CalDAVModifySharedCalendarShareeListPostTask setDelegate:](v8, "setDelegate:", self);
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "submitQueuedCoreDAVTask:", v8);

}

- (id)generateModificationMessageBody
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  id obj;
  id obja;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CalDAVModifySharedCalendarShareeListTaskGroup *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE1ABD8]);
  v4 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(v3, "startElement:inNamespace:withAttributeNamesAndValues:");
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v40 = self;
  -[CalDAVModifySharedCalendarShareeListTaskGroup shareesToSet](self, "shareesToSet");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v5)
  {
    v6 = v5;
    v38 = *(_QWORD *)v46;
    v36 = *MEMORY[0x24BE1AE70];
    v34 = (id)*MEMORY[0x24BE1AE30];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v46 != v38)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v3, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("set"), v4, 0);
        objc_msgSend(v8, "href");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "payloadAsString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v36, v34, v10, 0);

        objc_msgSend(v8, "commonName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "payloadAsString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("common-name"), v4, v12, 0);

        -[CalDAVModifySharedCalendarShareeListTaskGroup summary](v40, "summary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("summary"), v4, v13, 0);

        objc_msgSend(v8, "access");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "accessLevel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v15, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "nameSpace");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v17, v18, 0, 0);

        }
        objc_msgSend(v3, "endElement:inNamespace:", CFSTR("set"), v4);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v6);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[CalDAVModifySharedCalendarShareeListTaskGroup shareesToRemove](v40, "shareesToRemove");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v42;
    v39 = *MEMORY[0x24BE1AE70];
    v37 = *MEMORY[0x24BE1AE30];
    obja = (id)*MEMORY[0x24BE1AED8];
    v31 = *MEMORY[0x24BE1AF88];
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v42 != v21)
          objc_enumerationMutation(v35);
        v23 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        objc_msgSend(v23, "href");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "payloadAsString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "length");

        if (v26)
        {
          objc_msgSend(v3, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("remove"), v4, 0);
          objc_msgSend(v23, "href");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "payloadAsString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v39, v37, v28, 0);

          if (-[CalDAVModifySharedCalendarShareeListTaskGroup muteNotifications](v40, "muteNotifications"))
            objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", obja, v31, 0, 0);
          objc_msgSend(v3, "endElement:inNamespace:", CFSTR("remove"), v4);
        }
      }
      v20 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v20);
  }

  objc_msgSend(v3, "endElement:inNamespace:", CFSTR("share"), v4);
  objc_msgSend(v3, "data");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  CalDAVModifySharedCalendarShareeListTaskGroup *v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    if (objc_msgSend(v6, "responseStatusCode") == 207)
    {
      v52 = self;
      v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v48 = v6;
      objc_msgSend(v6, "responseBodyParser");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "rootElement");
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "responses");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v63;
        v49 = *(_QWORD *)v63;
        do
        {
          v12 = 0;
          v50 = v10;
          do
          {
            if (*(_QWORD *)v63 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v12);
            objc_msgSend(v13, "status");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "payloadAsString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "CDVIsHTTPStatusLineWithStatusCode:", 403);

            if (v16)
            {
              v53 = v12;
              v60 = 0u;
              v61 = 0u;
              v58 = 0u;
              v59 = 0u;
              objc_msgSend(v13, "hrefs");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
              if (v18)
              {
                v19 = v18;
                v20 = *(_QWORD *)v59;
                do
                {
                  for (i = 0; i != v19; ++i)
                  {
                    if (*(_QWORD *)v59 != v20)
                      objc_enumerationMutation(v17);
                    v22 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
                    objc_msgSend(v22, "payloadAsFullURL");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "absoluteString");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v24)
                    {
                      objc_msgSend(v8, "addObject:", v24);
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v25, "logHandleForAccountInfoProvider:", 0);
                      v26 = objc_claimAutoreleasedReturnValue();
                      v27 = v26;
                      if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v68 = v22;
                        _os_log_impl(&dword_2096EB000, v27, OS_LOG_TYPE_ERROR, "HREF had unusable URL payload, %@", buf, 0xCu);
                      }

                    }
                  }
                  v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
                }
                while (v19);
              }

              v11 = v49;
              v10 = v50;
              v12 = v53;
            }
            ++v12;
          }
          while (v12 != v10);
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
        }
        while (v10);
      }

      if (objc_msgSend(v8, "count"))
      {
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        self = v52;
        -[CalDAVModifySharedCalendarShareeListTaskGroup shareesToSet](v52, "shareesToSet");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v55;
          do
          {
            for (j = 0; j != v30; ++j)
            {
              if (*(_QWORD *)v55 != v31)
                objc_enumerationMutation(v28);
              v33 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
              objc_msgSend(v33, "href");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "payloadAsFullURL");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "absoluteString");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v8, "containsObject:", v36);

              self = v52;
              if (v37)
              {
                -[CalDAVModifySharedCalendarShareeListTaskGroup invalidSharees](v52, "invalidSharees");
                v38 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v38)
                {
                  v39 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                  -[CalDAVModifySharedCalendarShareeListTaskGroup setInvalidSharees:](v52, "setInvalidSharees:", v39);

                }
                -[CalDAVModifySharedCalendarShareeListTaskGroup invalidSharees](v52, "invalidSharees");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "addObject:", v33);

              }
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
          }
          while (v30);
        }

        -[CalDAVModifySharedCalendarShareeListTaskGroup invalidSharees](self, "invalidSharees");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "count");

        if (v42)
        {
          v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("CalDAVErrorDomain"), 0, 0);
LABEL_45:
          v6 = v48;

          goto LABEL_46;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "logHandleForAccountInfoProvider:", 0);
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = v44;
        self = v52;
        if (v44 && os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v68) = 207;
          _os_log_impl(&dword_2096EB000, v45, OS_LOG_TYPE_DEFAULT, "No invalid sharees found but status was %d", buf, 8u);
        }

      }
      v7 = 0;
      goto LABEL_45;
    }
    v7 = 0;
  }
LABEL_46:
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v7, 0);

}

- (NSMutableSet)invalidSharees
{
  return self->_invalidSharees;
}

- (void)setInvalidSharees:(id)a3
{
  objc_storeStrong((id *)&self->_invalidSharees, a3);
}

- (NSSet)shareesToRemove
{
  return self->_shareesToRemove;
}

- (void)setShareesToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_shareesToRemove, a3);
}

- (NSSet)shareesToSet
{
  return self->_shareesToSet;
}

- (void)setShareesToSet:(id)a3
{
  objc_storeStrong((id *)&self->_shareesToSet, a3);
}

- (NSURL)calendarURL
{
  return self->_calendarURL;
}

- (void)setCalendarURL:(id)a3
{
  objc_storeStrong((id *)&self->_calendarURL, a3);
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (BOOL)muteNotifications
{
  return self->_muteNotifications;
}

- (void)setMuteNotifications:(BOOL)a3
{
  self->_muteNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_calendarURL, 0);
  objc_storeStrong((id *)&self->_shareesToSet, 0);
  objc_storeStrong((id *)&self->_shareesToRemove, 0);
  objc_storeStrong((id *)&self->_invalidSharees, 0);
}

@end
