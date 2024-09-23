@implementation IMMessagePartHighlightChatItem

- (id)_initWithItem:(id)a3 highlightedMessagePartGUID:(id)a4 highlightedMessagePartIndex:(int64_t)a5 highlightedMessagePartRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  id v13;
  _BYTE *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  length = a6.length;
  location = a6.location;
  v11 = a3;
  v12 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IMMessagePartHighlightChatItem;
  v13 = -[IMChatItem _initWithItem:](&v19, sel__initWithItem_, v11);
  v14 = v13;
  if (v13)
  {
    *((_QWORD *)v13 + 8) = a5;
    *((_QWORD *)v13 + 10) = location;
    *((_QWORD *)v13 + 11) = length;
    objc_storeStrong((id *)v13 + 9, a4);
    v14[56] = objc_msgSend(v11, "isFromMe");
    v15 = (void *)MEMORY[0x1E0D39930];
    objc_msgSend(v11, "guid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeMessagePartGUID:prefix:partNumber:", v16, CFSTR("mh"), a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setGUID:", v17);

  }
  return v14;
}

- (IMAssociatedMessageGeometryDescriptor)geometryDescriptor
{
  *(_OWORD *)&retstr->scale = 0u;
  *(_OWORD *)&retstr->xScalar = 0u;
  *(_OWORD *)&retstr->associatedLayoutIntent = 0u;
  retstr->layoutIntent = 11;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessagePartHighlightChatItem highlightedMessagePartGUID](self, "highlightedMessagePartGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IMMessagePartHighlightChatItem highlightedMessagePartIndex](self, "highlightedMessagePartIndex");
  v8 = -[IMMessagePartHighlightChatItem highlightedMessagePartRange](self, "highlightedMessagePartRange");
  v10 = (void *)objc_msgSend(v4, "_initWithItem:highlightedMessagePartGUID:highlightedMessagePartIndex:highlightedMessagePartRange:", v5, v6, v7, v8, v9);

  return v10;
}

- (unint64_t)highlightedMessagePartIndex
{
  return self->_highlightedMessagePartIndex;
}

- (NSString)highlightedMessagePartGUID
{
  return self->_highlightedMessagePartGUID;
}

- (_NSRange)highlightedMessagePartRange
{
  _NSRange *p_highlightedMessagePartRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_highlightedMessagePartRange = &self->_highlightedMessagePartRange;
  location = self->_highlightedMessagePartRange.location;
  length = p_highlightedMessagePartRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)highlightedMessageIsFromMe
{
  return self->_highlightedMessageIsFromMe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedMessagePartGUID, 0);
}

@end
