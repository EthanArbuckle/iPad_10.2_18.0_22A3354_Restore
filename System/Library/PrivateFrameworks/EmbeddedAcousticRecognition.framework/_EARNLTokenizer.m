@implementation _EARNLTokenizer

- (_EARNLTokenizer)init
{
  _EARNLTokenizer *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NLTagger *nlTagger;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_EARNLTokenizer;
  v2 = -[_EARNLTokenizer init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CCE170]);
    v9[0] = *MEMORY[0x1E0CCE0E0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithTagSchemes:", v4);
    nlTagger = v2->_nlTagger;
    v2->_nlTagger = (NLTagger *)v5;

  }
  v2->_toLowerCase = 1;
  v2->_replacePunctuation = 1;
  v2->_tagOptions = 36;
  return v2;
}

- (id)tokenize:(id)a3
{
  id v4;
  void *v5;
  NLTagger *nlTagger;
  uint64_t v7;
  uint64_t v8;
  unint64_t tagOptions;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _EARNLTokenizer *v17;
  id v18;

  v4 = a3;
  -[NLTagger setString:](self->_nlTagger, "setString:", v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  nlTagger = self->_nlTagger;
  v7 = objc_msgSend(v4, "length");
  v8 = *MEMORY[0x1E0CCE0E0];
  tagOptions = self->_tagOptions;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __28___EARNLTokenizer_tokenize___block_invoke;
  v15[3] = &unk_1E5D49268;
  v10 = v4;
  v16 = v10;
  v17 = self;
  v11 = v5;
  v18 = v11;
  -[NLTagger enumerateTagsInRange:unit:scheme:options:usingBlock:](nlTagger, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v7, 0, v8, tagOptions, v15);
  v12 = v18;
  v13 = v11;

  return v13;
}

- (id)tokenize:(id)a3 limit:(unint64_t)a4
{
  void *v5;
  unint64_t v6;
  id v7;
  void *v8;

  -[_EARNLTokenizer tokenize:](self, "tokenize:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 <= a4)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v5, "subarrayWithRange:", v6 - a4, a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)toLowerCase
{
  return self->_toLowerCase;
}

- (void)setToLowerCase:(BOOL)a3
{
  self->_toLowerCase = a3;
}

- (BOOL)replacePunctuation
{
  return self->_replacePunctuation;
}

- (void)setReplacePunctuation:(BOOL)a3
{
  self->_replacePunctuation = a3;
}

- (unint64_t)tagOptions
{
  return self->_tagOptions;
}

- (void)setTagOptions:(unint64_t)a3
{
  self->_tagOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlTagger, 0);
}

@end
