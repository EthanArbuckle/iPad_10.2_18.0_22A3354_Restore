@implementation CKVocabularySandboxSearcher

- (CKVocabularySandboxSearcher)initWithSandbox:(id)a3 userId:(id)a4 prewarm:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  CKVocabularySandboxSearcher *v12;
  objc_super v14;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "indexMatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)CKVocabularySandboxSearcher;
  v12 = -[CKVocabularySearcher initWithUserId:spanMatcher:prewarm:](&v14, sel_initWithUserId_spanMatcher_prewarm_, v10, v11, v5);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_sandbox, a3);
    objc_storeStrong((id *)&v12->_userId, a4);
  }

  return v12;
}

- (id)_searcher
{
  return (id)-[SEMSandbox appCustomVocabularySearcherWithUserId:](self->_sandbox, "appCustomVocabularySearcherWithUserId:", self->_userId);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_sandbox, 0);
}

@end
