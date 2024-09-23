@implementation MusicKit_SoftLinking_MPContentTasteController

+ (MusicKit_SoftLinking_MPContentTasteController)sharedContentTasteController
{
  if (sharedContentTasteController_sOnceToken != -1)
    dispatch_once(&sharedContentTasteController_sOnceToken, &__block_literal_global_9);
  return (MusicKit_SoftLinking_MPContentTasteController *)(id)sharedContentTasteController_sSharedContentTasteController;
}

- (id)_initWithUnderlyingContentTasteController:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPContentTasteController *v6;
  MusicKit_SoftLinking_MPContentTasteController *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPContentTasteController;
  v6 = -[MusicKit_SoftLinking_MPContentTasteController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingContentTasteController, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getMPContentTasteControllerDidChangeNotification();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleContentTasteControllerDidChangeNotification_, v9, v7->_underlyingContentTasteController);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getMPContentTasteControllerDidChangeNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, self->_underlyingContentTasteController);

  v5.receiver = self;
  v5.super_class = (Class)MusicKit_SoftLinking_MPContentTasteController;
  -[MusicKit_SoftLinking_MPContentTasteController dealloc](&v5, sel_dealloc);
}

- (int64_t)tasteTypeForModelObject:(id)a3
{
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "_underlyingModelObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MusicKit_SoftLinking_MPContentTasteController _contentTasteTypeFromUnderlyingTasteType:](self, "_contentTasteTypeFromUnderlyingTasteType:", -[MPContentTasteController tasteTypeForModel:](self->_underlyingContentTasteController, "tasteTypeForModel:", v4));

  return v5;
}

- (void)setTasteType:(int64_t)a3 forModelObject:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = -[MusicKit_SoftLinking_MPContentTasteController _underlyingTasteTypeFromContentTasteType:](self, "_underlyingTasteTypeFromContentTasteType:", a3);
  objc_msgSend(v9, "_underlyingModelObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[MPContentTasteController setTasteType:forModel:withCompletionHandler:](self->_underlyingContentTasteController, "setTasteType:forModel:withCompletionHandler:", v10, v11, v8);
}

- (int64_t)_contentTasteTypeFromUnderlyingTasteType:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (int64_t)_underlyingTasteTypeFromContentTasteType:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (NSString)contentTasteControllerDidChangeNotificationName
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPContentTasteControllerDidChangeNotification");
}

- (void)_handleContentTasteControllerDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPContentTasteControllerDidChangeNotification"), self, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingContentTasteController, 0);
}

@end
