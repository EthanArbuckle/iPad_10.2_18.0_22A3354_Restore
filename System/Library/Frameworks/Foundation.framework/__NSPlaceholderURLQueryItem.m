@implementation __NSPlaceholderURLQueryItem

- (__NSPlaceholderURLQueryItem)init
{
  return (__NSPlaceholderURLQueryItem *)+[NSURLQueryItem _queryItem](NSURLQueryItem, "_queryItem");
}

- (__NSPlaceholderURLQueryItem)initWithName:(id)a3 value:(id)a4
{
  id v6;

  if (!_NSIsNSString())
    a3 = &stru_1E0F56070;
  if (_NSIsNSString())
    v6 = a4;
  else
    v6 = 0;
  return (__NSPlaceholderURLQueryItem *)+[NSURLQueryItem _queryItemWithName:value:](NSURLQueryItem, "_queryItemWithName:value:", a3, v6);
}

- (unint64_t)retainCount
{
  return -1;
}

@end
