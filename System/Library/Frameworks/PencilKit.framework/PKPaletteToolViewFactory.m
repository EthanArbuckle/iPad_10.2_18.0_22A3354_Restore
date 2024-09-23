@implementation PKPaletteToolViewFactory

- (id)makePaletteToolViewForTool:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
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
  void *v20;
  void *v21;
  id v23;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Tool parameter can not be nil."), 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v23);
    }
    objc_msgSend(v3, "ink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "customConfigurationCopy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v4, "_isRulerTool"))
    {
      v8 = CFSTR("com.apple.tool.ruler");

      +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:](PKToolConfiguration, "defaultConfigurationForToolWithIdentifier:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v8;
    }
    else
    {
      objc_msgSend(v4, "_configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v4, "_configuration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v10, "copy");
      }
      else
      {
        objc_msgSend(v4, "ink");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "ink");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:inkVersion:]((uint64_t)PKToolConfiguration, v11, objc_msgSend(v12, "version"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v4, "ink");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "variant");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaletteToolView toolViewWithIdentifier:variant:configuration:](PKPaletteToolView, "toolViewWithIdentifier:variant:configuration:", v6, v14, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "ink");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "properties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setToolProperties:", v17);

    objc_msgSend(v4, "ink");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v18, "_isHandwritingInk");

    if ((_DWORD)v17)
    {
      objc_msgSend(v15, "tool");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handwritingTool");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localeIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLocaleIdentifier:", v21);

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
