@implementation ICTrackedParagraphTreeNode

+ (id)nodeFromTrackedParagraph:(id)a3 textView:(id)a4
{
  id v4;
  ICTrackedParagraphTreeNode *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(ICTrackedParagraphTreeNode);
  -[ICTrackedParagraphTreeNode setTrackedParagraph:](v5, "setTrackedParagraph:", v4);
  objc_msgSend(v4, "paragraph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTrackedParagraphTreeNode setIndent:](v5, "setIndent:", objc_msgSend(v6, "indent"));

  objc_msgSend(v4, "paragraph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "todo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTrackedParagraphTreeNode setChecked:](v5, "setChecked:", objc_msgSend(v8, "done"));

  return v5;
}

+ (id)placeholderNodeWithIndentation:(unint64_t)a3
{
  ICTrackedParagraphTreeNode *v4;

  v4 = objc_alloc_init(ICTrackedParagraphTreeNode);
  -[ICTrackedParagraphTreeNode setIndent:](v4, "setIndent:", a3);
  return v4;
}

- (void)addChild:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[ICTrackedParagraphTreeNode children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[ICTrackedParagraphTreeNode setChildren:](self, "setChildren:", v6);

  }
  objc_msgSend(v4, "setParent:", self);
  -[ICTrackedParagraphTreeNode children](self, "children");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)recursivlySortCheckedItemsToBottom
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[ICTrackedParagraphTreeNode children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") >= 2)
  {
    objc_msgSend(v2, "ic_objectsPassingTest:", &__block_literal_global_190);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObjectsInArray:", v3);
    objc_msgSend(v2, "addObjectsFromArray:", v3);

  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "recursivlySortCheckedItemsToBottom", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

uint64_t __64__ICTrackedParagraphTreeNode_recursivlySortCheckedItemsToBottom__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "checked");
}

- (id)linerizedRepresentation
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[ICTrackedParagraphTreeNode recursivlyAddTrackedParagraphsToArray:](self, "recursivlyAddTrackedParagraphsToArray:", v3);
  return v3;
}

- (void)recursivlyAddTrackedParagraphsToArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICTrackedParagraphTreeNode trackedParagraph](self, "trackedParagraph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_addNonNilObject:", v5);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ICTrackedParagraphTreeNode children](self, "children", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "recursivlyAddTrackedParagraphsToArray:", v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSString)recurisiveDescription
{
  void *v3;

  v3 = (void *)objc_msgSend(&stru_1EA7E9860, "mutableCopy");
  -[ICTrackedParagraphTreeNode recursivlyAddDescriptionToString:](self, "recursivlyAddDescriptionToString:", v3);
  return (NSString *)v3;
}

- (void)recursivlyAddDescriptionToString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[ICTrackedParagraphTreeNode description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v5);

  -[ICTrackedParagraphTreeNode children](self, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__ICTrackedParagraphTreeNode_recursivlyAddDescriptionToString___block_invoke;
  v8[3] = &unk_1EA7E0978;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __63__ICTrackedParagraphTreeNode_recursivlyAddDescriptionToString___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recursivlyAddDescriptionToString:", *(_QWORD *)(a1 + 32));
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(&stru_1EA7E9860, "mutableCopy");
  if (-[ICTrackedParagraphTreeNode indent](self, "indent") >= 1)
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "appendString:", CFSTR("\t"));
      ++v4;
    }
    while (-[ICTrackedParagraphTreeNode indent](self, "indent") > v4);
  }
  -[ICTrackedParagraphTreeNode trackedParagraph](self, "trackedParagraph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICTrackedParagraphTreeNode string](self, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v6);

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("[placeholder(%d)]\n"), -[ICTrackedParagraphTreeNode indent](self, "indent"));
  }
  return v3;
}

- (ICTrackedParagraph)trackedParagraph
{
  return self->_trackedParagraph;
}

- (void)setTrackedParagraph:(id)a3
{
  objc_storeStrong((id *)&self->_trackedParagraph, a3);
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (ICTrackedParagraphTreeNode)parent
{
  return (ICTrackedParagraphTreeNode *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (BOOL)checked
{
  return self->_checked;
}

- (void)setChecked:(BOOL)a3
{
  self->_checked = a3;
}

- (int64_t)indent
{
  return self->_indent;
}

- (void)setIndent:(int64_t)a3
{
  self->_indent = a3;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_trackedParagraph, 0);
}

@end
