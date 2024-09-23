@implementation NUTileInfo

- (id)translatedAndClippedRegion:(id)a3
{
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size;
  void *v5;
  void *v6;
  _OWORD v8[2];

  size = self->_frameRect.size;
  v8[0] = self->_frameRect.origin;
  v8[1] = size;
  objc_msgSend(a3, "regionByClippingToRect:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "translateBy:", -self->_frameRect.origin.x, -self->_frameRect.origin.y);
  return v6;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[NUTileInfo index](self, "index");
  v6 = -[NUTileInfo size](self, "size");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%ld, %ld}"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUTileInfo frameRect](self, "frameRect");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{origin={%ld, %ld} size={%ld, %ld}}]"), v16, v17, v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUTileInfo contentRect](self, "contentRect");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{origin={%ld, %ld} size={%ld, %ld}}]"), v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> index=%ld, size=%@, frameRect=%@, contentRect=%@"), v4, self, v5, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)index
{
  return self->_index;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t height;
  int64_t width;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  height = self->_size.height;
  width = self->_size.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)frameRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = self[1].var1;
  retstr->var0 = self[1].var0;
  retstr->var1 = var1;
  return self;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)contentRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = self[2].var1;
  retstr->var0 = self[2].var0;
  retstr->var1 = var1;
  return self;
}

+ (id)tileInfoWithIndex:(int64_t)a3 size:(id)a4 frameRect:(id *)a5 contentRect:(id *)a6
{
  int64_t var1;
  int64_t var0;
  NUTileInfo *v11;
  $0AC6E346AE4835514AAA8AC86D8F4844 v12;
  $0AC6E346AE4835514AAA8AC86D8F4844 v13;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = objc_alloc_init(NUTileInfo);
  v11->_index = a3;
  v11->_size.width = var0;
  v11->_size.height = var1;
  v12 = a5->var1;
  v11->_frameRect.origin = ($86B46DF249C2B4242DBB096758D29184)a5->var0;
  v11->_frameRect.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v12;
  v13 = a6->var1;
  v11->_contentRect.origin = ($86B46DF249C2B4242DBB096758D29184)a6->var0;
  v11->_contentRect.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v13;
  return v11;
}

@end
