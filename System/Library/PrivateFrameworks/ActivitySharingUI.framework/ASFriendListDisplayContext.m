@implementation ASFriendListDisplayContext

- (unint64_t)hash
{
  return self->_displayMode + (self->_displayFilter << 15);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDisplayMode:", -[ASFriendListDisplayContext displayMode](self, "displayMode"));
  objc_msgSend(v4, "setDisplayFilter:", -[ASFriendListDisplayContext displayFilter](self, "displayFilter"));
  return v4;
}

- (void)setDisplayMode:(int64_t)a3
{
  self->_displayMode = a3;
}

- (void)setDisplayFilter:(int64_t)a3
{
  self->_displayFilter = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t displayMode;
  int64_t displayFilter;
  BOOL v7;

  v4 = a3;
  displayMode = self->_displayMode;
  if (displayMode == objc_msgSend(v4, "displayMode"))
  {
    displayFilter = self->_displayFilter;
    v7 = displayFilter == objc_msgSend(v4, "displayFilter");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (int64_t)displayFilter
{
  return self->_displayFilter;
}

@end
