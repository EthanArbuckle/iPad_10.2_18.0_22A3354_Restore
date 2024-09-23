@implementation SGConversationHistory

- (SGConversationHistory)initWithMessages:(id)a3
{
  id v5;
  SGConversationHistory *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *likelyLanguage;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SGConversationHistory;
  v6 = -[SGConversationHistory init](&v12, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1C3BD4F6C]();
    sgMapAndFilter();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_messages, a3);
    objc_msgSend(MEMORY[0x1E0D70A90], "detectLanguageFromLanguageTags:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    likelyLanguage = v6->_likelyLanguage;
    v6->_likelyLanguage = (NSString *)v9;

    objc_autoreleasePoolPop(v7);
  }

  return v6;
}

- (NSArray)messages
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)likelyLanguage
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_likelyLanguage, 0);
  objc_storeStrong((id *)&self->_messages, 0);
}

uint64_t __42__SGConversationHistory_initWithMessages___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "language");
}

@end
