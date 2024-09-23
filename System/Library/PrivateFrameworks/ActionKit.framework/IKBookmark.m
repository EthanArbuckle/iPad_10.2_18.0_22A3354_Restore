@implementation IKBookmark

- (IKBookmark)init
{
  return -[IKBookmark initWithBookmarkID:](self, "initWithBookmarkID:", 0x7FFFFFFFFFFFFFFFLL);
}

- (IKBookmark)initWithBookmarkID:(int64_t)a3
{
  IKBookmark *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKBookmark;
  result = -[IKBookmark init](&v5, sel_init);
  if (result)
  {
    result->_bookmarkID = a3;
    *(_OWORD *)&result->_URL = 0u;
    *(_OWORD *)&result->_descr = 0u;
    result->_starred = 0;
    result->_privateSource = 0;
    result->_hashString = 0;
    result->_progress = -1.0;
    result->_progressDate = 0;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@ (%ld), URL:(%@)>"), NSStringFromClass(v4), -[IKBookmark title](self, "title"), -[IKBookmark bookmarkID](self, "bookmarkID"), -[IKBookmark URL](self, "URL"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IKBookmark;
  -[IKBookmark dealloc](&v3, sel_dealloc);
}

- (int64_t)bookmarkID
{
  return self->_bookmarkID;
}

- (void)setBookmarkID:(int64_t)a3
{
  self->_bookmarkID = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)descr
{
  return self->_descr;
}

- (void)setDescr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (BOOL)isStarred
{
  return self->_starred;
}

- (void)setStarred:(BOOL)a3
{
  self->_starred = a3;
}

- (NSString)privateSource
{
  return self->_privateSource;
}

- (void)setPrivateSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)hashString
{
  return self->_hashString;
}

- (void)setHashString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (NSDate)progressDate
{
  return self->_progressDate;
}

- (void)setProgressDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

+ (id)bookmarkWithBookmarkID:(int64_t)a3
{
  return -[IKBookmark initWithBookmarkID:]([IKBookmark alloc], "initWithBookmarkID:", a3);
}

@end
