@implementation _MFSearchMatcherContext

- (void)dealloc
{
  char *lastSearchString;
  objc_super v4;

  lastSearchString = self->_lastSearchString;
  if (lastSearchString)
    free(lastSearchString);
  v4.receiver = self;
  v4.super_class = (Class)_MFSearchMatcherContext;
  -[_MFSearchMatcherContext dealloc](&v4, sel_dealloc);
}

- (void)flush
{
  -[NSMutableDictionary removeAllObjects](self->_matchers, "removeAllObjects");
}

- (CPSearchMatcher)lastMatcher
{
  return self->_lastMatcher;
}

- (void)setLastMatcher:(id)a3
{
  objc_storeStrong((id *)&self->_lastMatcher, a3);
}

- (char)lastSearchString
{
  return self->_lastSearchString;
}

- (void)setLastSearchString:(char *)a3
{
  self->_lastSearchString = a3;
}

- (unint64_t)lastSearchStringLength
{
  return self->_lastSearchStringLength;
}

- (void)setLastSearchStringLength:(unint64_t)a3
{
  self->_lastSearchStringLength = a3;
}

- (NSMutableDictionary)matchers
{
  return self->_matchers;
}

- (void)setMatchers:(id)a3
{
  objc_storeStrong((id *)&self->_matchers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchers, 0);
  objc_storeStrong((id *)&self->_lastMatcher, 0);
}

@end
