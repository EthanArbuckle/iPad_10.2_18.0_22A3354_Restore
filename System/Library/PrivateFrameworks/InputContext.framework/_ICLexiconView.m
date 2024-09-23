@implementation _ICLexiconView

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_lexicon);
  v3.receiver = self;
  v3.super_class = (Class)_ICLexiconView;
  -[_ICLexiconView dealloc](&v3, sel_dealloc);
}

- (_ICLexiconView)initWithName:(id)a3 typeFlags:(unsigned __int8)a4
{
  id v7;
  _ICLexiconView *v8;
  _ICLexiconView *v9;
  uint64_t View;
  _ICLexiconView *v11;
  NSObject *v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_ICLexiconView;
  v8 = -[_ICLexiconView init](&v14, sel_init);
  v9 = v8;
  if (v8
    && (objc_storeStrong((id *)&v8->_name, a3),
        v9->_typeFlags = a4,
        View = LXLexiconRepositoryCreateView(),
        (v9->_lexicon = (_LXLexicon *)View) == 0))
  {
    _ICPersNamedEntityOSLogFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_ICLexiconView initWithName:typeFlags:].cold.1((uint64_t)v7, v12);

    v11 = 0;
  }
  else
  {
    v11 = v9;
  }

  return v11;
}

- (BOOL)contains:(id)a3
{
  return +[_ICLexiconUtilities lexiconContainsEntry:forString:](_ICLexiconUtilities, "lexiconContainsEntry:forString:", self->_lexicon, a3);
}

- (id)getSortKeyEquivalents:(id)a3
{
  return +[_ICLexiconUtilities sortKeyEquivalents:forString:](_ICLexiconUtilities, "sortKeyEquivalents:forString:", self->_lexicon, a3);
}

- (_LXEntry)copyEntryForString:(id)a3
{
  return +[_ICLexiconUtilities copyEntry:forString:](_ICLexiconUtilities, "copyEntry:forString:", self->_lexicon, a3);
}

- (_LXLexicon)getLexiconImplementation
{
  return self->_lexicon;
}

- (unsigned)typeFlags
{
  return self->_typeFlags;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithName:(uint64_t)a1 typeFlags:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22716D000, a2, OS_LOG_TYPE_ERROR, "Error creating lexicon view (name = %@)", (uint8_t *)&v2, 0xCu);
}

@end
