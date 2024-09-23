@implementation AXSSDocumentIssue

- (AXSSDocumentIssue)init
{
  AXSSDocumentIssue *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXSSDocumentIssue;
  result = -[AXSSDocumentIssue init](&v3, sel_init);
  if (result)
    result->_autoMatchSuggestionAttributes = 1;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)AXSSDocumentIssue;
  -[AXSSDocumentIssue description](&v20, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AXSSDocumentIssue offendingText](self, "offendingText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXDocumentConsoleString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AXSSDocumentIssue suggestions](self, "suggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "string");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        AXDocumentConsoleString(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v10);
  }

  objc_msgSend(v4, "appendString:", CFSTR("}"));
  return v4;
}

- (void)_updateSuggestionStyleIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *suggestions;
  id v19;
  AXSSDocumentIssue *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (-[AXSSDocumentIssue autoMatchSuggestionAttributes](self, "autoMatchSuggestionAttributes"))
  {
    -[AXSSDocumentIssue suggestions](self, "suggestions");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      -[AXSSDocumentIssue offendingText](self, "offendingText");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "length");

      if (v4)
      {
        -[AXSSDocumentIssue offendingText](self, "offendingText");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "attributesAtIndex:effectiveRange:", 0, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = (void *)objc_opt_new();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v20 = self;
        -[AXSSDocumentIssue suggestions](self, "suggestions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v22;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v22 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
              v14 = objc_alloc(MEMORY[0x24BDD1458]);
              objc_msgSend(v13, "string");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = (void *)objc_msgSend(v14, "initWithString:attributes:", v15, v6);

              if (v16)
                objc_msgSend(v7, "addObject:", v16);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v10);
        }

        v17 = objc_msgSend(v7, "copy");
        suggestions = v20->_suggestions;
        v20->_suggestions = (NSArray *)v17;

      }
    }
    else
    {

    }
  }
}

- (void)setSuggestions:(id)a3
{
  NSArray *v4;
  NSArray *suggestions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  suggestions = self->_suggestions;
  self->_suggestions = v4;

  -[AXSSDocumentIssue _updateSuggestionStyleIfNeeded](self, "_updateSuggestionStyleIfNeeded");
}

- (void)setOffendingText:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *offendingText;

  v4 = (NSAttributedString *)objc_msgSend(a3, "copy");
  offendingText = self->_offendingText;
  self->_offendingText = v4;

  -[AXSSDocumentIssue _updateSuggestionStyleIfNeeded](self, "_updateSuggestionStyleIfNeeded");
}

- (AXSSDocumentNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  objc_storeStrong((id *)&self->_node, a3);
}

- (NSAttributedString)offendingText
{
  return self->_offendingText;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)severity
{
  return self->_severity;
}

- (void)setSeverity:(int64_t)a3
{
  self->_severity = a3;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (BOOL)autoMatchSuggestionAttributes
{
  return self->_autoMatchSuggestionAttributes;
}

- (void)setAutoMatchSuggestionAttributes:(BOOL)a3
{
  self->_autoMatchSuggestionAttributes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_offendingText, 0);
  objc_storeStrong((id *)&self->_node, 0);
}

@end
