@implementation ATXFaceSuggestionConfiguredFacesSignal

- (ATXFaceSuggestionConfiguredFacesSignal)init
{
  ATXFaceSuggestionConfiguredFacesSignal *v2;
  ATXFaceSuggestionConfiguredFacesSignal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXFaceSuggestionConfiguredFacesSignal;
  v2 = -[ATXFaceSuggestionConfiguredFacesSignal init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ATXFaceSuggestionConfiguredFacesSignal _prepare](v2, "_prepare");
  return v3;
}

- (void)_prepare
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[ATXFaceSuggestionConfiguredFacesSignal _prepare]";
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "%s: no posters in configuration cache!", (uint8_t *)&v1, 0xCu);
}

id __50__ATXFaceSuggestionConfiguredFacesSignal__prepare__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "galleryItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "galleryItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "descriptorIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  descriptorKey(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)valueForDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  descriptorKey(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSCountedSet countForObject:](self->_configuredExtensionBundleIdentifiers, "countForObject:", v7))
    v8 = -5.0;
  else
    v8 = 0.0;

  return v8;
}

- (double)weight
{
  return 10.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuredExtensionBundleIdentifiers, 0);
}

@end
