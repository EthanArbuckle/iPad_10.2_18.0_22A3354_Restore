@implementation BRLTScriptString

- (BRLTScriptString)init
{
  return -[BRLTScriptString initWithString:selection:](self, "initWithString:selection:", &stru_24CBF1330, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (BRLTScriptString)initWithString:(id)a3 selection:(_NSRange)a4
{
  return -[BRLTScriptString initWithString:selection:focus:token:](self, "initWithString:selection:focus:token:", a3, a4.location, a4.length, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
}

- (BRLTScriptString)initWithString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  id v12;
  BRLTScriptString *v13;
  uint64_t v14;
  NSString *string;
  uint64_t v16;
  NSMutableArray *v17;
  NSMutableArray *tokenRanges;
  NSMutableArray *v19;
  BRLTTokenRange *v20;
  objc_super v22;

  length = a5.length;
  location = a5.location;
  v9 = a4.length;
  v10 = a4.location;
  v12 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BRLTScriptString;
  v13 = -[BRLTScriptString init](&v22, sel_init);
  v14 = objc_msgSend(v12, "copy");
  string = v13->_string;
  v13->_string = (NSString *)v14;

  v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = v10;
    if (v10 > objc_msgSend(v12, "length"))
      v16 = objc_msgSend(v12, "length");
    if (v16 + v9 > objc_msgSend(v12, "length"))
      v9 = objc_msgSend(v12, "length") - v16;
  }
  v13->_selection.location = v16;
  v13->_selection.length = v9;
  v13->_focus.location = location;
  v13->_focus.length = length;
  v13->_suggestionRange = (_NSRange)xmmword_2114E7BB0;
  v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  tokenRanges = v13->_tokenRanges;
  v13->_tokenRanges = v17;

  v19 = v13->_tokenRanges;
  v20 = -[BRLTTokenRange initWithRange:token:]([BRLTTokenRange alloc], "initWithRange:token:", 0, -[NSString length](v13->_string, "length"), a6);
  -[NSMutableArray addObject:](v19, "addObject:", v20);

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BRLTScriptString *v4;
  uint64_t v5;
  NSString *string;
  uint64_t v7;
  NSMutableArray *tokenRanges;
  uint64_t v9;
  BRLTTextFormattingRanges *textFormattingRanges;

  v4 = -[BRLTScriptString initWithString:selection:]([BRLTScriptString alloc], "initWithString:selection:", &stru_24CBF1330, 0x7FFFFFFFFFFFFFFFLL, 0);
  v5 = -[NSString copy](self->_string, "copy");
  string = v4->_string;
  v4->_string = (NSString *)v5;

  v4->_selection = self->_selection;
  v4->_focus = self->_focus;
  v4->_suggestionRange = self->_suggestionRange;
  v7 = -[NSMutableArray mutableCopy](self->_tokenRanges, "mutableCopy");
  tokenRanges = v4->_tokenRanges;
  v4->_tokenRanges = (NSMutableArray *)v7;

  v9 = -[BRLTTextFormattingRanges copy](self->_textFormattingRanges, "copy");
  textFormattingRanges = v4->_textFormattingRanges;
  v4->_textFormattingRanges = (BRLTTextFormattingRanges *)v9;

  return v4;
}

- (void)addString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  NSMutableArray *tokenRanges;
  BRLTTokenRange *v13;
  NSString *v14;
  NSString *string;
  id v16;

  length = a5.length;
  location = a5.location;
  v9 = a4.length;
  v10 = a4.location;
  v16 = a3;
  tokenRanges = self->_tokenRanges;
  v13 = -[BRLTTokenRange initWithRange:token:]([BRLTTokenRange alloc], "initWithRange:token:", -[NSString length](self->_string, "length"), objc_msgSend(v16, "length"), a6);
  -[NSMutableArray addObject:](tokenRanges, "addObject:", v13);

  if (location != 0x7FFFFFFFFFFFFFFFLL && length)
  {
    self->_focus.location = -[NSString length](self->_string, "length") + location;
    self->_focus.length = length;
  }
  -[NSString stringByAppendingString:](self->_string, "stringByAppendingString:", v16);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  string = self->_string;
  self->_string = v14;

  -[BRLTScriptString _addSelectionRange:](self, "_addSelectionRange:", v10, v9);
}

- (BOOL)isEqualToScriptString:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v8;
  int v9;
  BRLTTextFormattingRanges *v10;
  BRLTTextFormattingRanges *v11;
  void *v12;
  int v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
LABEL_18:
    LOBYTE(v13) = 1;
    goto LABEL_19;
  }
  if (self->_selection.location == v4[4]
    && self->_selection.length == v4[5]
    && self->_suggestionRange.location == v4[8]
    && self->_suggestionRange.length == v4[9])
  {
    objc_msgSend(v4, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", self->_string);

    if (v9)
    {
      objc_msgSend(v5, "textFormattingRanges");
      v10 = (BRLTTextFormattingRanges *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 == self->_textFormattingRanges)
      {

      }
      else
      {
        objc_msgSend(v5, "textFormattingRanges");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", self->_textFormattingRanges);

        if (!v13)
          goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  LOBYTE(v13) = 0;
LABEL_19:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  BRLTScriptString *v4;
  BOOL v5;

  v4 = (BRLTScriptString *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[BRLTScriptString isEqualToScriptString:](self, "isEqualToScriptString:", v4);
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)BRLTScriptString;
  -[BRLTScriptString description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString description](self->_string, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: string<%@>, range<%ld, %ld>"), v4, v5, self->_selection.location, self->_selection.length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_NSRange)_backwardEditingAtomForSelection:(_NSRange)a3 isBreak:(BOOL *)a4
{
  NSUInteger v5;
  NSRange v6;
  NSUInteger location;
  NSUInteger v8;
  NSUInteger length;
  NSRange v10;
  NSUInteger v11;
  _NSRange result;

  v6.location = -[BRLTScriptString _backwardEditingAtomForCursorLocation:isBreak:](self, "_backwardEditingAtomForCursorLocation:isBreak:", a3.location, a4);
  v6.length = v5;
  location = self->_selection.location;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      length = self->_selection.length;
      if (length | location)
        v8 = self->_selection.location;
      else
        v8 = 0x7FFFFFFFFFFFFFFFLL;
      if (length | location)
        v6.length = self->_selection.length;
    }
  }
  else
  {
    v8 = v6.location;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = NSUnionRange(self->_selection, v6);
      v8 = v10.location;
      v6.length = v10.length;
    }
  }
  v11 = v6.length;
  result.length = v11;
  result.location = v8;
  return result;
}

- (_NSRange)_backwardEditingAtomForCursorLocation:(unint64_t)a3 isBreak:(BOOL *)a4
{
  unint64_t v5;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;
  NSUInteger v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  _NSRange result;

  v5 = a3;
  if (a4)
    *a4 = 0;
  v7 = 0;
  if (a3)
  {
    v8 = 0;
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSString length](self->_string, "length");
      -[NSString substringFromIndex:](self->_string, "substringFromIndex:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "rangeOfCharacterFromSet:", v9);
      -[NSString substringToIndex:](self->_string, "substringToIndex:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "rangeOfCharacterFromSet:options:", v9, 4);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = 0;
      }
      else
      {
        v7 = v14 + v15;
        if (v14 + v15 == objc_msgSend(v13, "length"))
        {
          v7 = v5 - 1;
          if (a4)
            *a4 = 1;
          goto LABEL_14;
        }
      }
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        v5 = v10;
      else
        v5 += v12;
LABEL_14:
      v8 = v5 - v7;

    }
  }
  else
  {
    v8 = 0;
  }
  v16 = v7;
  v17 = v8;
  result.length = v17;
  result.location = v16;
  return result;
}

- (_NSRange)deleteMergeAtom
{
  NSUInteger location;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger length;
  NSUInteger v11;
  NSUInteger v12;
  NSRange v13;
  char v14;
  NSRange v15;
  _NSRange result;
  NSRange v17;

  location = self->_selection.location;
  if (location >= 2
    && ((v4 = self->_selection.length, -[BRLTScriptString backwardEditingAtom](self, "backwardEditingAtom"), v5 > 1)
     || (-[BRLTScriptString forwardEditingAtom](self, "forwardEditingAtom"), v6))
    && (v14 = 0,
        v7 = -[BRLTScriptString _backwardEditingAtomForSelection:isBreak:](self, "_backwardEditingAtomForSelection:isBreak:", location - 1, v4, &v14), !v14))
  {
    v11 = v7;
    v12 = v8;
    v15.location = -[BRLTScriptString forwardEditingAtom](self, "forwardEditingAtom");
    v17.location = v11;
    v17.length = v12;
    v13 = NSUnionRange(v15, v17);
    length = v13.length;
    v9 = v13.location;
  }
  else
  {
    v9 = -[BRLTScriptString backwardEditingAtom](self, "backwardEditingAtom");
  }
  result.length = length;
  result.location = v9;
  return result;
}

- (_NSRange)backwardEditingAtom
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[BRLTScriptString _backwardEditingAtomForSelection:isBreak:](self, "_backwardEditingAtomForSelection:isBreak:", self->_selection.location, self->_selection.length, 0);
  result.length = v3;
  result.location = v2;
  return result;
}

- (_NSRange)forwardEditingAtom
{
  NSRange selection;
  NSRange v4;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  selection.location = -[BRLTScriptString forwardEditingAtomForCursorLocation:](self, "forwardEditingAtomForCursorLocation:", self->_selection.location);
  selection.length = v4.length;
  v4.location = self->_selection.location;
  if (selection.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    selection.location = 0x7FFFFFFFFFFFFFFFLL;
    if (v4.location != 0x7FFFFFFFFFFFFFFFLL)
      selection = self->_selection;
  }
  else if (v4.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4.length = self->_selection.length;
    selection = NSUnionRange(v4, selection);
  }
  location = selection.location;
  length = selection.length;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)forwardEditingAtomForCursorLocation:(unint64_t)a3
{
  NSUInteger v3;
  unint64_t v4;
  void *v6;
  NSUInteger v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = a3;
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString length](self->_string, "length");
    -[NSString substringFromIndex:](self->_string, "substringFromIndex:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "rangeOfCharacterFromSet:", v6);
    -[NSString substringToIndex:](self->_string, "substringToIndex:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "rangeOfCharacterFromSet:options:", v6, 4);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v9)
        v13 = 0;
      else
        v13 = v11 + v12 == v4;
      if (v13)
      {
        v7 = v4;
LABEL_12:
        v3 = v7 - v4;

        goto LABEL_13;
      }
      v7 = v9 + v4;
    }
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v4 = 0;
    else
      v4 = v11 + v12;
    goto LABEL_12;
  }
  v3 = 0;
  v4 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
  v14 = v4;
  v15 = v3;
  result.length = v15;
  result.location = v14;
  return result;
}

- (NSString)string
{
  return self->_string;
}

- (_NSRange)selection
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_selection.length;
  location = self->_selection.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)focus
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_focus.length;
  location = self->_focus.location;
  result.length = length;
  result.location = location;
  return result;
}

- (BRLTTextFormattingRanges)textFormattingRanges
{
  return self->_textFormattingRanges;
}

- (void)setTextFormattingRanges:(id)a3
{
  objc_storeStrong((id *)&self->_textFormattingRanges, a3);
}

- (_NSRange)suggestionRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_suggestionRange.length;
  location = self->_suggestionRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSuggestionRange:(_NSRange)a3
{
  self->_suggestionRange = a3;
}

- (NSMutableArray)tokenRanges
{
  return self->_tokenRanges;
}

- (void)setTokenRanges:(id)a3
{
  objc_storeStrong((id *)&self->_tokenRanges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenRanges, 0);
  objc_storeStrong((id *)&self->_textFormattingRanges, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
