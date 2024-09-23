@implementation _CNAtomTextAttachment

- (_CNAtomTextAttachment)initWithAtomView:(id)a3
{
  id v4;
  _CNAtomTextAttachment *v5;
  _CNAtomTextAttachment *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_CNAtomTextAttachment;
  v5 = -[_CNAtomTextAttachment initWithData:ofType:](&v8, sel_initWithData_ofType_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[_CNAtomTextAttachment setIsPlaceholder:](v5, "setIsPlaceholder:", 0);
    -[_CNAtomTextAttachment setAtomView:](v6, "setAtomView:", v4);
  }

  return v6;
}

- (CNComposeRecipient)recipient
{
  void *v2;
  void *v3;

  -[_CNAtomTextAttachment atomView](self, "atomView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNComposeRecipient *)v3;
}

- (id)attributedStringWithBaseAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int16 v10;

  v4 = a3;
  v10 = -4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", self, *MEMORY[0x1E0DC10F8]);
  +[CNAtomView defaultFont](CNAtomView, "defaultFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DC1138]);

  if (v4)
    objc_msgSend(v6, "setValuesForKeysWithDictionary:", v4);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v6);

  return v8;
}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5
{
  return 0;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  CGFloat height;
  double width;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  if (-[_CNAtomTextAttachment isPlaceholder](self, "isPlaceholder", a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y))
  {
    -[_CNAtomTextAttachment bounds](self, "bounds");
    v10 = v9;
  }
  else
  {
    -[CNAtomView intrinsicContentSize](self->_atomView, "intrinsicContentSize");
    v10 = v11;
  }
  -[_CNAtomTextAttachment atomView](self, "atomView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "presentationOptions") & 0x4000) != 0)
    v13 = 0.2;
  else
    v13 = 2.0;

  v14 = *MEMORY[0x1E0C9D648];
  +[CNAtomView defaultFont](CNAtomView, "defaultFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descender");
  v17 = v16;

  if (v10 >= width)
    v18 = width;
  else
    v18 = v10;
  v19 = v18 + v13;
  v20 = v14;
  v21 = v17;
  v22 = height;
  result.size.height = v22;
  result.size.width = v19;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CNComposeRecipientAtom)atomView
{
  return self->_atomView;
}

- (void)setAtomView:(id)a3
{
  objc_storeStrong((id *)&self->_atomView, a3);
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atomView, 0);
}

@end
