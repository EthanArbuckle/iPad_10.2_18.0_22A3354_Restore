@implementation MFPlainTextDocument

- (void)getFormatFlowedString:(id *)a3 insertedTrailingSpaces:(BOOL *)a4 encoding:(unsigned int)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = +[_MFFormatFlowedWriter newWithPlainTextDocument:encoding:](_MFFormatFlowedWriter, "newWithPlainTextDocument:encoding:", self, *(_QWORD *)&a5);
  v7 = (void *)objc_msgSend(v9, "outputString");
  if (a3)
    *a3 = v7;
  v8 = v9;
  if (a4)
  {
    *a4 = objc_msgSend(v9, "addedTrailingSpaces");
    v8 = v9;
  }

}

- (id)quotedString:(unsigned int)a3
{
  id v3;
  void *v4;

  v3 = +[_MFFormatFlowedWriter newWithPlainTextDocument:encoding:](_MFFormatFlowedWriter, "newWithPlainTextDocument:encoding:", self, *(_QWORD *)&a3);
  v4 = (void *)objc_msgSend(v3, "quotedString");

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFPlainTextDocument;
  -[MFPlainTextDocument dealloc](&v3, sel_dealloc);
}

- (void)appendString:(id)a3 withQuoteLevel:(unsigned int)a4
{
  NSMutableString *text;
  uint64_t v8;
  uint64_t v9;
  MFPlainTextFragment *v10;

  text = self->_text;
  if (!text)
  {
    text = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    self->_text = text;
  }
  v8 = -[NSMutableString length](text, "length");
  v9 = objc_msgSend(a3, "length");
  -[NSMutableString appendString:](self->_text, "appendString:", a3);
  if (!self->_fragments)
    self->_fragments = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MFPlainTextFragment);
  v10->_range.location = v8;
  v10->_range.length = v9;
  v10->_quoteLevel = a4;
  -[NSMutableArray addObject:](self->_fragments, "addObject:", v10);

}

- (unint64_t)fragmentCount
{
  return -[NSMutableArray count](self->_fragments, "count");
}

- (void)getString:(id *)a3 quoteLevel:(unsigned int *)a4 ofFragmentAtIndex:(unint64_t)a5
{
  uint64_t v8;

  v8 = -[NSMutableArray objectAtIndex:](self->_fragments, "objectAtIndex:", a5);
  if (a3)
    *a3 = (id)-[NSMutableString substringWithRange:](self->_text, "substringWithRange:", *(_QWORD *)(v8 + 8), *(_QWORD *)(v8 + 16));
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
  uint64_t i;
  void *v7;
  unsigned int v9;
  uint64_t v10;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[NSMutableArray count](self->_fragments, "count");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      v10 = 0;
      v9 = 0;
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      -[MFPlainTextDocument getString:quoteLevel:ofFragmentAtIndex:](self, "getString:quoteLevel:ofFragmentAtIndex:", &v10, &v9, i);
      objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("string"));
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9), CFSTR("quoteLevel"));
      objc_msgSend(v3, "addObject:", v7);
    }
  }
  return v3;
}

- (void)appendArchivedRepresentation:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;

  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      v8 = (void *)objc_msgSend(a3, "objectAtIndex:", i);
      -[MFPlainTextDocument appendString:withQuoteLevel:](self, "appendString:withQuoteLevel:", objc_msgSend(v8, "objectForKey:", CFSTR("string")), objc_msgSend((id)objc_msgSend(v8, "objectForKey:", CFSTR("quoteLevel")), "unsignedIntValue"));
    }
  }
}

@end
