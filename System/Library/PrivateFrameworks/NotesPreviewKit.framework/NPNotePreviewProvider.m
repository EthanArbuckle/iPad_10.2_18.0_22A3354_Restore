@implementation NPNotePreviewProvider

+ (NPNotePreviewProvider)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global);
  return (NPNotePreviewProvider *)(id)shared_shared;
}

void __31__NPNotePreviewProvider_shared__block_invoke()
{
  NPNotePreviewProvider *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [NPNotePreviewProvider alloc];
  +[NPNotePreviewProviderInternal shared](NPNotePreviewProviderInternal, "shared");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[NPNotePreviewProvider initWithNotePreviewProvider:](v0, "initWithNotePreviewProvider:", v3);
  v2 = (void *)shared_shared;
  shared_shared = v1;

}

- (NPNotePreviewProvider)initWithNotePreviewProvider:(id)a3
{
  id v5;
  NPNotePreviewProvider *v6;
  NPNotePreviewProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPNotePreviewProvider;
  v6 = -[NPNotePreviewProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_notePreviewProvider, a3);

  return v7;
}

- (id)previewForUserActivity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[NPNotePreviewProvider notePreviewProvider](self, "notePreviewProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewForUserActivity:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NPNotePreviewProviderInternal)notePreviewProvider
{
  return self->_notePreviewProvider;
}

- (void)setNotePreviewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_notePreviewProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notePreviewProvider, 0);
}

@end
