@implementation _MFAtomTextAttachment

- (_MFAtomTextAttachment)initWithAtomView:(id)a3
{
  id v4;
  _MFAtomTextAttachment *v5;
  _MFAtomTextAttachment *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MFAtomTextAttachment;
  v5 = -[_MFAtomTextAttachment initWithData:ofType:](&v8, sel_initWithData_ofType_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[_MFAtomTextAttachment setIsPlaceholder:](v5, "setIsPlaceholder:", 0);
    -[_MFAtomTextAttachment setAtomView:](v6, "setAtomView:", v4);
  }

  return v6;
}

- (MFComposeRecipient)recipient
{
  void *v2;
  void *v3;

  -[_MFAtomTextAttachment atomView](self, "atomView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MFComposeRecipient *)v3;
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
  +[MFModernAtomView defaultFont](MFModernAtomView, "defaultFont");
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  if (-[_MFAtomTextAttachment isPlaceholder](self, "isPlaceholder", a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y))
  {
    -[_MFAtomTextAttachment bounds](self, "bounds");
    v10 = v9;
  }
  else
  {
    -[MFModernAtomView intrinsicContentSize](self->_atomView, "intrinsicContentSize");
    v10 = v11;
  }
  +[MFModernAtomView defaultFont](MFModernAtomView, "defaultFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descender");
  v14 = v13;
  v15 = *MEMORY[0x1E0C9D648];

  if (v10 >= width)
    v16 = width;
  else
    v16 = v10;
  v17 = v15;
  v18 = v14;
  v19 = height;
  result.size.height = v19;
  result.size.width = v16;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (MFModernComposeRecipientAtom)atomView
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
