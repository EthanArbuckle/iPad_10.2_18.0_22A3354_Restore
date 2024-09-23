@implementation SFSearchEngineControllerWrapper

- (SFSearchEngineControllerWrapper)init
{
  SFSearchEngineControllerWrapper *v2;
  void *v3;
  objc_class *v4;
  _SFSearchEngineController *v5;
  _SFSearchEngineController *searchEngineController;
  SFSearchEngineControllerWrapper *v7;
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v9.receiver = self;
  v9.super_class = (Class)SFSearchEngineControllerWrapper;
  v2 = -[SFSearchEngineControllerWrapper init](&v9, sel_init);
  if (v2)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v3 = (void *)get_SFSearchEngineControllerClass_softClass;
    v14 = get_SFSearchEngineControllerClass_softClass;
    if (!get_SFSearchEngineControllerClass_softClass)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __get_SFSearchEngineControllerClass_block_invoke;
      v10[3] = &unk_1E21E3330;
      v10[4] = &v11;
      __get_SFSearchEngineControllerClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v11, 8);
    v5 = (_SFSearchEngineController *)objc_alloc_init(v4);
    searchEngineController = v2->_searchEngineController;
    v2->_searchEngineController = v5;

    v7 = v2;
  }

  return v2;
}

- (void)setDefaultSearchEngine:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  -[_SFSearchEngineController setDefaultSearchEngine:forPrivateBrowsing:](self->_searchEngineController, "setDefaultSearchEngine:forPrivateBrowsing:", a3, a4);
}

- (NSArray)currentSearchEngineNames
{
  return (NSArray *)-[_SFSearchEngineController searchEngineNames](self->_searchEngineController, "searchEngineNames");
}

- (NSString)defaultSearchEngineName
{
  return (NSString *)-[_SFSearchEngineController defaultSearchEngineNameForPrivateBrowsing:](self->_searchEngineController, "defaultSearchEngineNameForPrivateBrowsing:", 0);
}

- (NSString)privateSearchEngineName
{
  return (NSString *)-[_SFSearchEngineController defaultSearchEngineNameForPrivateBrowsing:](self->_searchEngineController, "defaultSearchEngineNameForPrivateBrowsing:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchEngineController, 0);
}

@end
