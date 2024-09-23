@implementation _MXExtension

- (_MXExtension)initWithExtensionIdentifier:(id)a3 extensionProvider:(id)a4
{
  id v6;
  id v7;
  _MXExtension *v8;
  uint64_t v9;
  NSString *identifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_MXExtension;
  v8 = -[_MXExtension init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_storeWeak((id *)&v8->_provider, v7);
  }

  return v8;
}

- (NSString)extensionPointIdentifier
{
  void *v2;
  void *v3;

  -[_MXExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionPointIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)infoDictionary
{
  void *v2;
  void *v3;

  -[_MXExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)attributes
{
  void *v2;
  void *v3;

  -[_MXExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)isEnabled
{
  void *v2;
  char v3;

  -[_MXExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "optedIn");

  return v3;
}

- (unint64_t)type
{
  void *v2;
  unint64_t v3;

  -[_MXExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_mapExtensionType");

  return v3;
}

- (NSSet)capabilities
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[_MXExtension attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("MapsExtensionCapabilities"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_13;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4, v12);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0C99E60], "set", v12);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return (NSSet *)v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p> "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("{ bundle identifier: %@; "), self->_identifier);
  -[_MXExtension extension](self, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionPointIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_MXExtension type](self, "type");
  v7 = CFSTR("Non-UI");
  if (v6 == 1)
    v7 = CFSTR("UI");
  objc_msgSend(v3, "appendFormat:", CFSTR("ExtensionPointName: %@; %@ }"), v5, v7);

  v8 = (void *)objc_msgSend(v3, "copy");
  return v8;
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  -[_MXExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)containingAppDisplayName
{
  void *v2;
  void *v3;

  -[_MXExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_containingAppDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSExtension)extension
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "_extensionWithIdentifier:", self->_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSExtension *)v4;
}

- (BOOL)_setEnabled:(BOOL)a3 error:(id *)a4
{
  id WeakRetained;
  void *v8;
  char v9;
  BOOL v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v8 = WeakRetained;
  if (a3)
    v9 = objc_msgSend(WeakRetained, "_enableExtension:error:", self, a4);
  else
    v9 = objc_msgSend(WeakRetained, "_disableExtension:error:", self, a4);
  v10 = v9;

  return v10;
}

- (BOOL)_isMapsExtension
{
  void *v3;
  char v4;
  void *v5;

  -[_MXExtension extensionPointIdentifier](self, "extensionPointIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.maps.services")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[_MXExtension extensionPointIdentifier](self, "extensionPointIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.maps.ui-services"));

  }
  return v4;
}

- (BOOL)_isIntentExtension
{
  void *v3;
  char v4;
  void *v5;

  -[_MXExtension extensionPointIdentifier](self, "extensionPointIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CBD4B8]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[_MXExtension extensionPointIdentifier](self, "extensionPointIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CBD4C0]);

  }
  return v4;
}

- (id)siblingExtensions
{
  void *v3;
  void *v4;
  void *v5;

  -[_MXExtension provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MXExtension _containingAppIdentifer](self, "_containingAppIdentifer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siblingExtensionsWithContainingAppIdentifer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_containingAppIdentifer
{
  void *v2;
  void *v3;

  -[_MXExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_containingAppIdentifer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_iconForTableUI
{
  return -[_MXExtension _iconWithFormat:](self, "_iconWithFormat:", 0);
}

- (id)_iconWithFormat:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[_MXExtension extension](self, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_iconWithFormat:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_MXExtensionProvider)provider
{
  return (_MXExtensionProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)handleRequest:(id)a3 requestDispatcher:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _MXExtensionService *v11;
  _MXExtensionService *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  _MXExtensionService *v17;
  id v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[_MXExtensionService initWithExtensionProxy:]([_MXExtensionService alloc], "initWithExtensionProxy:", self);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87___MXExtension_MXExtensionRequestHandling__handleRequest_requestDispatcher_completion___block_invoke;
  v16[3] = &unk_1E20DC0C8;
  v17 = v11;
  v18 = v8;
  v12 = v11;
  v13 = v8;
  -[_MXExtensionService handleRequest:requestDispatcher:completion:](v12, "handleRequest:requestDispatcher:completion:", v10, v9, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)startSendingUpdatesForRequest:(id)a3 requestDispatcher:(id)a4 toObserver:(id)a5
{
  id v8;
  id v9;
  id v10;
  _MXExtensionService *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[_MXExtensionService initWithExtensionProxy:]([_MXExtensionService alloc], "initWithExtensionProxy:", self);
  -[_MXExtensionService startSendingUpdatesForRequest:requestDispatcher:toObserver:](v11, "startSendingUpdatesForRequest:requestDispatcher:toObserver:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)canSupportIntent:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[_MXExtension extension](self, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_canSupportIntent:", v4);

  return v6;
}

- (BOOL)canSupportIntentClass:(Class)a3
{
  void *v4;

  -[_MXExtension extension](self, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "_canSupportIntentClass:", a3);

  return (char)a3;
}

- (void)startExtensionServiceWithInputItems:(id)a3 begin:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  _MXExtensionService *v9;
  id v10;
  _MXExtensionService *v11;
  id v12;
  _QWORD v13[4];
  _MXExtensionService *v14;
  id v15;
  id v16;

  v7 = a4;
  v8 = a5;
  v9 = -[_MXExtensionService initWithExtensionProxy:]([_MXExtensionService alloc], "initWithExtensionProxy:", self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __104___MXExtension_ridesharing_willBeDepreicatedSoon__startExtensionServiceWithInputItems_begin_completion___block_invoke;
  v13[3] = &unk_1E20D99E0;
  v14 = v9;
  v15 = v7;
  v16 = v8;
  v10 = v8;
  v11 = v9;
  v12 = v7;
  -[_MXExtensionService connectExtensionWithHandler:](v11, "connectExtensionWithHandler:", v13);

}

+ (BOOL)shouldDeserializeCacheItems
{
  return _shouldDeserializeCacheItems;
}

+ (void)setShouldDeserializeCacheItems:(BOOL)a3
{
  _shouldDeserializeCacheItems = a3;
}

- (id)resolveIntentSlot:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _MXExtensionService *v12;
  id v13;
  _MXExtensionService *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  _MXExtensionService *v19;
  id v20;
  id v21;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_MXExtensionService initWithExtensionProxy:]([_MXExtensionService alloc], "initWithExtensionProxy:", self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70___MXExtension_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke;
  v18[3] = &unk_1E20DF830;
  v20 = v11;
  v21 = v8;
  v19 = v12;
  v13 = v11;
  v14 = v12;
  v15 = v8;
  -[_MXExtensionService resolveIntentSlot:forIntent:completionBlock:](v14, "resolveIntentSlot:forIntent:completionBlock:", v10, v9, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)confirmIntent:(id)a3 expectResponseClass:(Class)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _MXExtensionService *v11;
  id v12;
  _MXExtensionService *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  _MXExtensionService *v18;
  id v19;
  id v20;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_MXExtensionService initWithExtensionProxy:]([_MXExtensionService alloc], "initWithExtensionProxy:", self);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75___MXExtension_INIntent__confirmIntent_expectResponseClass_withCompletion___block_invoke;
  v17[3] = &unk_1E20DF858;
  v17[4] = self;
  v18 = v11;
  v19 = v10;
  v20 = v8;
  v12 = v10;
  v13 = v11;
  v14 = v8;
  -[_MXExtensionService confirmIntent:expectResponseClass:withCompletion:](v13, "confirmIntent:expectResponseClass:withCompletion:", v9, a4, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)handleIntent:(id)a3 expectResponseClass:(Class)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _MXExtensionService *v11;
  id v12;
  _MXExtensionService *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  _MXExtensionService *v18;
  id v19;
  id v20;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_MXExtensionService initWithExtensionProxy:]([_MXExtensionService alloc], "initWithExtensionProxy:", self);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74___MXExtension_INIntent__handleIntent_expectResponseClass_withCompletion___block_invoke;
  v17[3] = &unk_1E20DF858;
  v17[4] = self;
  v18 = v11;
  v19 = v10;
  v20 = v8;
  v12 = v10;
  v13 = v11;
  v14 = v8;
  -[_MXExtensionService handleIntent:expectResponseClass:withCompletion:](v13, "handleIntent:expectResponseClass:withCompletion:", v9, a4, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)startSendingUpdatesForIntent:(id)a3 toObserver:(id)a4
{
  id v6;
  id v7;
  _MXExtensionService *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[_MXExtensionService initWithExtensionProxy:]([_MXExtensionService alloc], "initWithExtensionProxy:", self);
  -[_MXExtensionService startSendingUpdatesForIntent:toObserver:](v8, "startSendingUpdatesForIntent:toObserver:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_loadCacheItems:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42___MXExtension_INIntent___loadCacheItems___block_invoke;
  v3[3] = &unk_1E20DF8D0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0CBDBA8], "deserializeCacheItems:completion:", a3, v3);
}

@end
