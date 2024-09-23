@implementation CKAggregateMessagePartChatItem

- (CKAggregateMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  id v6;
  CKAggregateMessagePartChatItem *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKAggregateMessagePartChatItem;
  v7 = -[CKMessagePartChatItem initWithIMChatItem:maxWidth:](&v21, sel_initWithIMChatItem_maxWidth_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "subparts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "__ck_chatItemClass", (_QWORD)v17)), "initWithIMChatItem:maxWidth:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), a4);
          objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v12);
    }

    -[CKAggregateMessagePartChatItem setSubparts:](v7, "setSubparts:", v9);
  }

  return v7;
}

- (id)loadTranscriptText
{
  void *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAggregateMessagePartChatItem;
  -[CKTextMessagePartChatItem loadTranscriptText](&v5, sel_loadTranscriptText);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "length") >= 0x1F5)
  {
    objc_msgSend(v2, "attributedSubstringFromRange:", 0, 499);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  return v2;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (id)pasteboardItemProviders
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  -[CKAggregateMessagePartChatItem subparts](self, "subparts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__CKAggregateMessagePartChatItem_pasteboardItemProviders__block_invoke;
  v6[3] = &unk_1E2758B40;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

void __57__CKAggregateMessagePartChatItem_pasteboardItemProviders__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "pasteboardItemProviders");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  NSUInteger v18;
  NSUInteger v19;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAggregateMessagePartChatItem subparts](self, "subparts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__CKAggregateMessagePartChatItem_rtfDocumentItemsWithFormatString_selectedTextRange___block_invoke;
  v15[3] = &unk_1E2758B68;
  v10 = v8;
  v16 = v10;
  v17 = v7;
  v18 = location;
  v19 = length;
  v11 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);
  v12 = v17;
  v13 = v10;

  return v13;
}

void __85__CKAggregateMessagePartChatItem_rtfDocumentItemsWithFormatString_selectedTextRange___block_invoke(_QWORD *a1, void *a2)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  objc_msgSend(a2, "rtfDocumentItemsWithFormatString:selectedTextRange:", a1[5], a1[6], a1[7]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  -[CKTextMessagePartChatItem subject](self, "subject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[CKTextMessagePartChatItem text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("\n"));
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "substringToIndex:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  return (NSString *)v9;
}

- (NSArray)subparts
{
  return self->_subparts;
}

- (void)setSubparts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subparts, 0);
}

- (id)compositionWithContext:(id)a3
{
  void *v3;
  void *v4;

  -[CKAggregateMessagePartChatItem subparts](self, "subparts", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKComposition compositionForMessageParts:preserveSubject:contextIdentifier:](CKComposition, "compositionForMessageParts:preserveSubject:contextIdentifier:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
