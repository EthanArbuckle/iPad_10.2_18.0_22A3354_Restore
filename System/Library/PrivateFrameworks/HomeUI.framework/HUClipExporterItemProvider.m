@implementation HUClipExporterItemProvider

- (HUClipExporterItemProvider)initWithURL:(id)a3
{
  id v6;
  HUClipExporterItemProvider *v7;
  HUClipExporterItemProvider *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUClipExporterItemProvider.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HUClipExporterItemProvider;
  v7 = -[UIActivityItemProvider initWithPlaceholderItem:](&v11, sel_initWithPlaceholderItem_, v6);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_clipURL, a3);

  return v8;
}

- (id)item
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[UIActivityItemProvider activityType](self, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CEB1B0]);

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D50]);
    -[HUClipExporterItemProvider clipURL](self, "clipURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithContentsOfURL:", v6);

    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = objc_msgSend(v7, "length");
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Exporting data for AirDrop dropping with bytes = %lu", (uint8_t *)&v12, 0xCu);
    }

  }
  else
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[UIActivityItemProvider activityType](self, "activityType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = (uint64_t)v10;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Exporting data for activity type = %@", (uint8_t *)&v12, 0xCu);

    }
    -[HUClipExporterItemProvider clipURL](self, "clipURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return CFSTR("public.mpeg-4");
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HUClipExporterItemProvider clipURL](self, "clipURL", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".mp4"), &stru_1E6F60E80);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraExportSubject"), CFSTR("HUCameraExportSubject"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ - %@"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSURL)clipURL
{
  return self->_clipURL;
}

- (void)setClipURL:(id)a3
{
  objc_storeStrong((id *)&self->_clipURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipURL, 0);
}

@end
