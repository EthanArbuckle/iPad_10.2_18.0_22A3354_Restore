@implementation MKSearchFoundationRichText

- (MKSearchFoundationRichText)initWithString:(id)a3
{
  id v4;
  MKSearchFoundationRichText *v5;
  MKSearchFoundationRichText *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKSearchFoundationRichText;
  v5 = -[MKSearchFoundationRichText init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MKSearchFoundationRichText setText:](v5, "setText:", v4);

  return v6;
}

- (id)initRichTextTitleWithMapItem:(id)a3 resultsType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  MKSearchFoundationRichText *v11;
  MKSearchFoundationRichText *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4 == 2)
  {
    objc_msgSend(v6, "_geoAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "singleLineAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4 == 1)
  {
    if ((objc_msgSend(v6, "_hasTransitDisplayName") & 1) != 0)
      objc_msgSend(v7, "_transitDisplayName");
    else
      objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  MKGetMKSearchFoundationResultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v14 = 138477827;
    v15 = v9;
    _os_log_impl(&dword_18B0B0000, v10, OS_LOG_TYPE_INFO, "MapItem name: %{private}@", (uint8_t *)&v14, 0xCu);
  }

  v11 = -[MKSearchFoundationRichText initWithString:](self, "initWithString:", v9);
  v12 = v11;
  if (v11)
    -[SFText setMaxLines:](v11, "setMaxLines:", 1);

  return v12;
}

- (void)loadRichTextWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
    if (!-[MKSearchFoundationRichText isRichTextResolved](self, "isRichTextResolved"))
    {
      -[MKSearchFoundationRichText completionHandlers](self, "completionHandlers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __64__MKSearchFoundationRichText_loadRichTextWithCompletionHandler___block_invoke;
        v8[3] = &unk_1E20DC828;
        v9 = v6;
        v10 = v5;
        -[MKSearchFoundationRichText setCompletionHandlers:](self, "setCompletionHandlers:", v8);

      }
      else
      {
        -[MKSearchFoundationRichText setCompletionHandlers:](self, "setCompletionHandlers:", v5);
      }

    }
  }

}

uint64_t __64__MKSearchFoundationRichText_loadRichTextWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKSearchFoundationRichText;
  -[SFText setText:](&v4, sel_setText_, a3);
  -[MKSearchFoundationRichText _invokeCompletionHandlers](self, "_invokeCompletionHandlers");
}

- (void)setFormattedTextPieces:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKSearchFoundationRichText;
  -[SFRichText setFormattedTextPieces:](&v4, sel_setFormattedTextPieces_, a3);
  -[MKSearchFoundationRichText _invokeCompletionHandlers](self, "_invokeCompletionHandlers");
}

- (void)_invokeCompletionHandlers
{
  dispatch_block_t block;

  -[MKSearchFoundationRichText completionHandlers](self, "completionHandlers");
  block = (dispatch_block_t)objc_claimAutoreleasedReturnValue();
  if (block)
    dispatch_async(MEMORY[0x1E0C80D38], block);
  if (-[MKSearchFoundationRichText isRichTextResolved](self, "isRichTextResolved"))
    -[MKSearchFoundationRichText setCompletionHandlers:](self, "setCompletionHandlers:", 0);

}

- (BOOL)isRichTextResolved
{
  return 1;
}

- (id)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandlers, 0);
}

@end
