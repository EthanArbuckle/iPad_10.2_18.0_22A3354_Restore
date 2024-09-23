@implementation DDParsecPreviewAction

- (DDParsecPreviewAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  DDParsecPreviewAction *v5;
  DDParsecPreviewAction *v6;
  DDParsecPreviewAction *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DDParsecPreviewAction;
  v5 = -[DDAction initWithURL:result:context:](&v9, sel_initWithURL_result_context_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[DDParsecPreviewAction setPreviewMode:](v5, "setPreviewMode:", 1);
    v7 = v6;
  }

  return v6;
}

- (BOOL)wantsSeamlessCommit
{
  return 1;
}

- (void)setPreviewMode:(BOOL)a3
{
  self->super._previewMode = a3;
  -[DDParsecCollectionViewController setPreviewMode:](self->super._parsecViewController, "setPreviewMode:");
}

- (id)menuActionClasses
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)prepareViewControllerForActionController:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DDParsecPreviewAction;
  v4 = a3;
  -[DDAction prepareViewControllerForActionController:](&v5, sel_prepareViewControllerForActionController_, v4);
  objc_msgSend(v4, "action:presentationShouldBeModal:", self, 0, v5.receiver, v5.super_class);

}

@end
