@implementation IMScheduledSectionDateChatItem

- (IMScheduledSectionDateChatItem)initWithItem:(id)a3
{
  id v4;
  IMScheduledSectionDateChatItem *v5;
  uint64_t v6;
  NSDate *date;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMScheduledSectionDateChatItem;
  v5 = -[IMChatItem _initWithItem:](&v9, sel__initWithItem_, v4);
  if (v5)
  {
    objc_msgSend(v4, "time");
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

  }
  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
