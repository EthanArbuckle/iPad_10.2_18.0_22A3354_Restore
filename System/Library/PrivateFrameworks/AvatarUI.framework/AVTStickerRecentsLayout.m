@implementation AVTStickerRecentsLayout

+ (CGSize)buttonSizeForContainerSize:(CGSize)a3 imageSize:(CGSize)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = a3.height * 0.3;
  v5 = v4 * a4.width / a4.height;
  result.height = v4;
  result.width = v5;
  return result;
}

- (AVTStickerRecentsLayout)initWithNumberOfItemsPerRow:(int64_t)a3 numberOfItemsPerColumn:(int64_t)a4 interitemPadding:(double)a5 appButtonIndex:(int64_t)a6 laysOutVertically:(BOOL)a7
{
  AVTStickerRecentsLayout *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVTStickerRecentsLayout;
  result = -[AVTStickerRecentsLayout init](&v13, sel_init);
  if (result)
  {
    result->_numberOfItems = a4 * a3;
    result->_numberOfItemsPerRow = a3;
    result->_numberOfItemsPerColumn = a4;
    result->_interitemPadding = (uint64_t)a5;
    result->_appButtonIndex = a6;
    result->_laysOutVertically = a7;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  _BOOL4 v10;
  int v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[AVTStickerRecentsLayout numberOfItemsPerRow](self, "numberOfItemsPerRow");
    if (v6 == objc_msgSend(v5, "numberOfItemsPerRow")
      && (v7 = -[AVTStickerRecentsLayout numberOfItemsPerColumn](self, "numberOfItemsPerColumn"),
          v7 == objc_msgSend(v5, "numberOfItemsPerColumn"))
      && (v8 = -[AVTStickerRecentsLayout interitemPadding](self, "interitemPadding"),
          v8 == objc_msgSend(v5, "interitemPadding"))
      && (v9 = -[AVTStickerRecentsLayout appButtonIndex](self, "appButtonIndex"),
          v9 == objc_msgSend(v5, "appButtonIndex")))
    {
      v10 = -[AVTStickerRecentsLayout laysOutVertically](self, "laysOutVertically");
      v11 = v10 ^ objc_msgSend(v5, "laysOutVertically") ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  *((_QWORD *)&v4 + 1) = -[AVTStickerRecentsLayout numberOfItemsPerRow](self, "numberOfItemsPerRow");
  *(_QWORD *)&v4 = -[AVTStickerRecentsLayout numberOfItemsPerRow](self, "numberOfItemsPerRow");
  v3 = v4 >> 52;
  *((_QWORD *)&v4 + 1) = -[AVTStickerRecentsLayout numberOfItemsPerColumn](self, "numberOfItemsPerColumn");
  *(_QWORD *)&v4 = -[AVTStickerRecentsLayout numberOfItemsPerColumn](self, "numberOfItemsPerColumn");
  v5 = (v4 >> 48) ^ v3;
  *((_QWORD *)&v4 + 1) = -[AVTStickerRecentsLayout interitemPadding](self, "interitemPadding");
  *(_QWORD *)&v4 = -[AVTStickerRecentsLayout interitemPadding](self, "interitemPadding");
  v6 = v4 >> 43;
  *((_QWORD *)&v4 + 1) = -[AVTStickerRecentsLayout appButtonIndex](self, "appButtonIndex");
  *(_QWORD *)&v4 = -[AVTStickerRecentsLayout appButtonIndex](self, "appButtonIndex");
  return v5 ^ v6 ^ (v4 >> 32) ^ -[AVTStickerRecentsLayout laysOutVertically](self, "laysOutVertically");
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (int64_t)numberOfItemsPerRow
{
  return self->_numberOfItemsPerRow;
}

- (int64_t)numberOfItemsPerColumn
{
  return self->_numberOfItemsPerColumn;
}

- (int64_t)interitemPadding
{
  return self->_interitemPadding;
}

- (int64_t)appButtonIndex
{
  return self->_appButtonIndex;
}

- (BOOL)laysOutVertically
{
  return self->_laysOutVertically;
}

@end
