@implementation EMKEmojiTokenList

- (EMKEmojiTokenList)initWithEmojiTokenArray:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *emojiTokenArray;
  objc_super v8;

  v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)EMKEmojiTokenList;
    self = -[EMKEmojiTokenList init](&v8, sel_init);
    if (self)
    {
      v5 = (NSArray *)objc_msgSend(v4, "copy");
      emojiTokenArray = self->_emojiTokenArray;
      self->_emojiTokenArray = v5;

    }
  }

  return self;
}

- (NSArray)emojiTokenArray
{
  return self->_emojiTokenArray;
}

- (unint64_t)count
{
  return -[NSArray count](self->_emojiTokenArray, "count");
}

- (id)emojiTokenAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_emojiTokenArray, "objectAtIndex:", a3);
}

- (id)objectAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_emojiTokenArray, "objectAtIndex:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EMKEmojiTokenList;
  -[EMKEmojiTokenList description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = -[NSArray count](self->_emojiTokenArray, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->_emojiTokenArray, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendString:", v9);

      if (++v7 < v6)
        objc_msgSend(v4, "appendString:", CFSTR("/"));
    }
    while (v6 != v7);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiTokenArray, 0);
}

@end
