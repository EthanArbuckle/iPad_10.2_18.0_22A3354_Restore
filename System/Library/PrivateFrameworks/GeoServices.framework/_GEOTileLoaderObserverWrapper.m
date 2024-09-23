@implementation _GEOTileLoaderObserverWrapper

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

@end
