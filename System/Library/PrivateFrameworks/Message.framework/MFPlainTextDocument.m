@implementation MFPlainTextDocument

- (void)getFormatFlowedString:(id *)a3 insertedTrailingSpaces:(BOOL *)a4 encoding:(unsigned int)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = +[_MFFormatFlowedWriter newWithPlainTextDocument:encoding:](_MFFormatFlowedWriter, "newWithPlainTextDocument:encoding:", self, *(_QWORD *)&a5);
  objc_msgSend(v9, "outputString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3)
    *a3 = objc_retainAutorelease(v7);
  if (a4)
    *a4 = objc_msgSend(v9, "addedTrailingSpaces");

}

- (id)quotedString:(unsigned int)a3
{
  id v3;
  void *v4;

  v3 = +[_MFFormatFlowedWriter newWithPlainTextDocument:encoding:](_MFFormatFlowedWriter, "newWithPlainTextDocument:encoding:", self, *(_QWORD *)&a3);
  objc_msgSend(v3, "quotedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)appendString:(id)a3 withQuoteLevel:(unsigned int)a4
{
  NSMutableString *text;
  NSMutableString *v7;
  NSMutableString *v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  NSMutableArray *fragments;
  MFPlainTextFragment *v13;
  id v14;

  v14 = a3;
  text = self->_text;
  if (!text)
  {
    v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v8 = self->_text;
    self->_text = v7;

    text = self->_text;
  }
  v9 = -[NSMutableString length](text, "length");
  v10 = objc_msgSend(v14, "length");
  -[NSMutableString appendString:](self->_text, "appendString:", v14);
  if (!self->_fragments)
  {
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    fragments = self->_fragments;
    self->_fragments = v11;

  }
  v13 = objc_alloc_init(MFPlainTextFragment);
  v13->_range.location = v9;
  v13->_range.length = v10;
  v13->_quoteLevel = a4;
  -[NSMutableArray addObject:](self->_fragments, "addObject:", v13);

}

- (unint64_t)fragmentCount
{
  return -[NSMutableArray count](self->_fragments, "count");
}

- (void)getString:(id *)a3 quoteLevel:(unsigned int *)a4 ofFragmentAtIndex:(unint64_t)a5
{
  uint64_t v8;
  uint64_t v9;

  -[NSMutableArray objectAtIndex:](self->_fragments, "objectAtIndex:", a5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v9 = v8;
    -[NSMutableString substringWithRange:](self->_text, "substringWithRange:", *(_QWORD *)(v8 + 8), *(_QWORD *)(v8 + 16));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v9;
  }
  if (a4)
    *a4 = *(_DWORD *)(v8 + 24);

}

- (id)string
{
  return self->_text;
}

- (id)archivedRepresentation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v10;
  unsigned int v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSMutableArray count](self->_fragments, "count");
  if (v4)
  {
    v5 = 0;
    do
    {
      v11 = -1431655766;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      -[MFPlainTextDocument getString:quoteLevel:ofFragmentAtIndex:](self, "getString:quoteLevel:ofFragmentAtIndex:", &v10, &v11, v5);
      v7 = v10;
      objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("string"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("quoteLevel"));

      objc_msgSend(v3, "addObject:", v6);
      ++v5;
    }
    while (v4 != v5);
  }
  return v3;
}

- (void)appendArchivedRepresentation:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(v10, "count");
  if (v4)
  {
    v5 = 0;
    do
    {
      objc_msgSend(v10, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("string"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("quoteLevel"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "unsignedIntValue");

      -[MFPlainTextDocument appendString:withQuoteLevel:](self, "appendString:withQuoteLevel:", v7, v9);
      ++v5;
    }
    while (v4 != v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragments, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
