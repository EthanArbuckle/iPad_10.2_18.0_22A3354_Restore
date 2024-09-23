@implementation DSSourceDescriptor(DigitalSeparationUI)

- (id)iconForDetail
{
  uint64_t v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "correspondingApplicationIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(a1, "correspondingApplicationIdentifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = +[DSUIUtilities isPlaceholderForApp:](DSUIUtilities, "isPlaceholderForApp:", v4),
        v4,
        v3,
        !v5))
  {
    v10 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(a1, "correspondingApplicationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    objc_msgSend(v10, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 2);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x24BE2CC00]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:", v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;

  return v11;
}

- (id)iconForTable
{
  uint64_t v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  objc_msgSend(a1, "correspondingApplicationIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(a1, "correspondingApplicationIdentifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = +[DSUIUtilities isPlaceholderForApp:](DSUIUtilities, "isPlaceholderForApp:", v4),
        v4,
        v3,
        !v5))
  {
    v14 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(a1, "correspondingApplicationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    objc_msgSend(v14, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x24BE2CC00]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[DSUIUtilities appIconForAppID:format:](DSUIUtilities, "appIconForAppID:format:", &stru_24EFF4790, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v12 = v11;
    objc_msgSend(v10, "size");
    objc_msgSend(v9, "imageByPreparingThumbnailOfSize:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

@end
