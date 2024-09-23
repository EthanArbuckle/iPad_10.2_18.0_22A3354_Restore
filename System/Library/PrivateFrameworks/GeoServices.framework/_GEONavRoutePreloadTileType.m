@implementation _GEONavRoutePreloadTileType

- (_GEONavRoutePreloadTileType)init
{
  _GEONavRoutePreloadTileType *result;

  result = (_GEONavRoutePreloadTileType *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (_GEONavRoutePreloadTileType)initWithStyle:(int)a3 restrictions:(unint64_t)a4
{
  _GEONavRoutePreloadTileType *v6;
  _GEONavRoutePreloadTileType *v7;
  _GEONavRoutePreloadTileType *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GEONavRoutePreloadTileType;
  v6 = -[_GEONavRoutePreloadTileType init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_style = a3;
    v6->_restrictions = a4;
    v8 = v6;
  }

  return v7;
}

- (int)style
{
  return self->_style;
}

- (unint64_t)restrictions
{
  return self->_restrictions;
}

@end
