@implementation MOEventSharedWithYou

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *itemURL;
  id v5;

  itemURL = self->_itemURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemURL, CFSTR("itemURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemSenders, CFSTR("itemSenders"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemRecipients, CFSTR("itemRecipients"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_itemIsPinned, CFSTR("itemIsPinned"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_itemShareDirection != 0, CFSTR("itemShareDirection"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemSyndicationStatus, CFSTR("itemSyndicationStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemAttributionsCount, CFSTR("itemAttributionsCount"));

}

- (MOEventSharedWithYou)initWithCoder:(id)a3
{
  id v4;
  MOEventSharedWithYou *v5;
  uint64_t v6;
  NSURL *itemURL;
  uint64_t v8;
  NSArray *itemSenders;
  uint64_t v10;
  NSArray *itemRecipients;
  uint64_t v12;
  NSNumber *itemAttributionsCount;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MOEventSharedWithYou;
  v5 = -[MOEventSharedWithYou init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemURL = v5->_itemURL;
    v5->_itemURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("itemSenders"));
    v8 = objc_claimAutoreleasedReturnValue();
    itemSenders = v5->_itemSenders;
    v5->_itemSenders = (NSArray *)v8;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("itemRecipients"));
    v10 = objc_claimAutoreleasedReturnValue();
    itemRecipients = v5->_itemRecipients;
    v5->_itemRecipients = (NSArray *)v10;

    v5->_itemIsPinned = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("itemIsPinned"));
    v5->_itemShareDirection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("itemShareDirection"));
    v5->_itemSyndicationStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("itemSyndicationStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemAttributionsCount"));
    v12 = objc_claimAutoreleasedReturnValue();
    itemAttributionsCount = v5->_itemAttributionsCount;
    v5->_itemAttributionsCount = (NSNumber *)v12;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventSharedWithYou *v4;

  v4 = objc_alloc_init(MOEventSharedWithYou);
  objc_storeStrong((id *)&v4->_itemURL, self->_itemURL);
  objc_storeStrong((id *)&v4->_itemSenders, self->_itemSenders);
  objc_storeStrong((id *)&v4->_itemRecipients, self->_itemRecipients);
  v4->_itemIsPinned = self->_itemIsPinned;
  v4->_itemShareDirection = self->_itemShareDirection;
  v4->_itemSyndicationStatus = self->_itemSyndicationStatus;
  objc_storeStrong((id *)&v4->_itemAttributionsCount, self->_itemAttributionsCount);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSURL absoluteString](self->_itemURL, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mask");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_itemIsPinned)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("itemURL, %@, itemIsPinned, %@, itemShareDirection, %lu, itemAttributionsCount, %@"), v5, v7, self->_itemShareDirection, self->_itemAttributionsCount);

  return v8;
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
  objc_storeStrong((id *)&self->_itemURL, a3);
}

- (NSArray)itemSenders
{
  return self->_itemSenders;
}

- (void)setItemSenders:(id)a3
{
  objc_storeStrong((id *)&self->_itemSenders, a3);
}

- (NSArray)itemRecipients
{
  return self->_itemRecipients;
}

- (void)setItemRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_itemRecipients, a3);
}

- (unint64_t)itemShareDirection
{
  return self->_itemShareDirection;
}

- (void)setItemShareDirection:(unint64_t)a3
{
  self->_itemShareDirection = a3;
}

- (BOOL)itemIsPinned
{
  return self->_itemIsPinned;
}

- (void)setItemIsPinned:(BOOL)a3
{
  self->_itemIsPinned = a3;
}

- (unint64_t)itemSyndicationStatus
{
  return self->_itemSyndicationStatus;
}

- (void)setItemSyndicationStatus:(unint64_t)a3
{
  self->_itemSyndicationStatus = a3;
}

- (NSNumber)itemAttributionsCount
{
  return self->_itemAttributionsCount;
}

- (void)setItemAttributionsCount:(id)a3
{
  objc_storeStrong((id *)&self->_itemAttributionsCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemAttributionsCount, 0);
  objc_storeStrong((id *)&self->_itemRecipients, 0);
  objc_storeStrong((id *)&self->_itemSenders, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
}

@end
