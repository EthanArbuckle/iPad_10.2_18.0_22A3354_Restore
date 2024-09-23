@implementation CNUIGeminiDataSource

- (void)resetDataSource
{
  CNContact *contact;
  CNGeminiResult *geminiResult;

  contact = self->_contact;
  self->_contact = 0;

  geminiResult = self->_geminiResult;
  self->_geminiResult = 0;

}

- (void)channelsDidChangeForGeminiManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CNUIGeminiDataSource geminiManager](self, "geminiManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIGeminiDataSource contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteGeminiResultForContact:substituteDefaultForDangling:error:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIGeminiDataSource setGeminiResult:](self, "setGeminiResult:", v6);

  -[CNUIGeminiDataSource delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "geminiDataSourceDidUpdate:", self);

}

- (void)setContact:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[CNContact identifier](self->_contact, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    -[CNUIGeminiDataSource geminiManager](self, "geminiManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteGeminiResultForContact:substituteDefaultForDangling:error:", v11, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIGeminiDataSource setGeminiResult:](self, "setGeminiResult:", v9);

    -[CNUIGeminiDataSource delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "geminiDataSourceDidUpdate:", self);

  }
}

- (void)setGeminiResult:(id)a3
{
  objc_storeStrong((id *)&self->_geminiResult, a3);
}

- (CNGeminiManager)geminiManager
{
  return self->_geminiManager;
}

- (CNUIGeminiDataSourceDelegate)delegate
{
  return (CNUIGeminiDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNGeminiResult)geminiResult
{
  return self->_geminiResult;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNUIGeminiDataSource)initWithGeminiManager:(id)a3
{
  id v5;
  CNUIGeminiDataSource *v6;
  CNUIGeminiDataSource *v7;
  void *v8;
  CNUIGeminiDataSource *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNUIGeminiDataSource;
  v6 = -[CNUIGeminiDataSource init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_geminiManager, a3);
    objc_msgSend(v5, "addDelegate:queue:", v7, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);

    v9 = v7;
  }

  return v7;
}

- (void)applicationWillEnterForeground:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D13848];
  -[CNUIGeminiDataSource contact](self, "contact", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredChannel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  if ((_DWORD)v4)
  {
    -[CNUIGeminiDataSource geminiManager](self, "geminiManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CNUIGeminiDataSource channelsDidChangeForGeminiManager:](self, "channelsDidChangeForGeminiManager:", v7);

  }
}

- (NSString)channelIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[CNUIGeminiDataSource geminiResult](self, "geminiResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "channel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "channelIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setGeminiManager:(id)a3
{
  objc_storeStrong((id *)&self->_geminiManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geminiManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_geminiResult, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
