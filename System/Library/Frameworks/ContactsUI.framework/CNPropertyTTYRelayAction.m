@implementation CNPropertyTTYRelayAction

- (void)performActionForItem:(id)a3 sender:(id)a4
{
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "labeledValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v7 = v19;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v19, "labeledValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "length"))
    {
LABEL_9:

      v7 = v19;
      goto LABEL_10;
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13C68]), "initWithStringValue:type:", v10, 2);
    objc_msgSend(v19, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v19, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "geminiDataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "channelIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
      {

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "_cnui_ttyRelayURLWithHandle:contact:channelIdentifier:", v12, v11, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
LABEL_8:
          objc_msgSend((id)*MEMORY[0x1E0DC4730], "openURL:withCompletionHandler:", v18, 0);

          goto LABEL_9;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "_cnui_ttyRelayURLWithHandle:contact:", v12, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_10:

}

@end
