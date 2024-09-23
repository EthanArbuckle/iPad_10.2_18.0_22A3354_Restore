@implementation CNAUIMessagesImagesFacade

- (id)imageForResult:(id)a3
{
  void *v3;
  void *v4;

  -[CNAUIMessagesImagesFacade imageDataForResult:](self, "imageDataForResult:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)imageDataForResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void (*IMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc)(id);
  void *v8;
  void *v9;
  void *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!IMCoreLibraryCore_frameworkLibrary)
  {
    v12 = xmmword_1E62BF9F8;
    v13 = 0;
    IMCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (IMCoreLibraryCore_frameworkLibrary && getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc())
  {
    objc_msgSend(v3, "psSuggestion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagesGroupIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v11 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      IMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc = (void (*)(id))getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc();
      if (!IMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc)
        -[CNAUIMessagesImagesFacade imageDataForResult:].cold.1();
      IMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectForKeyedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)imageDataForResult:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return +[CNComposeRecipientNamer nameForGroup:sources:].cold.1(v0);
}

@end
