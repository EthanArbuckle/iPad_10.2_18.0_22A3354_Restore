@implementation CPSMessageCell

- (void)configureWithMessageListItem:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  char v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id location[2];
  CPSMessageCell *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = (void *)MEMORY[0x24BE15388];
  v20 = (id)objc_msgSend(location[0], "text");
  v19 = (id)objc_msgSend(location[0], "detailText");
  v18 = (id)objc_msgSend(location[0], "leadingConfiguration");
  v17 = (id)objc_msgSend(v18, "leadingImage");
  v16 = (id)objc_msgSend(location[0], "leadingConfiguration");
  v6 = objc_msgSend(v16, "isUnread");
  v15 = (id)objc_msgSend(location[0], "leadingConfiguration");
  v7 = objc_msgSend(v15, "leadingItem") == 1;
  v14 = (id)objc_msgSend(location[0], "leadingConfiguration");
  v8 = objc_msgSend(v14, "leadingItem") == 2;
  v13 = (id)objc_msgSend(location[0], "trailingConfiguration");
  v5 = objc_msgSend(v13, "trailingItem") == 1;
  v12 = (id)objc_msgSend(location[0], "trailingText");
  v11 = (id)objc_msgSend(location[0], "trailingConfiguration");
  v10 = (id)objc_msgSend(v11, "trailingImage");
  LOBYTE(v3) = v5;
  LOBYTE(v4) = objc_msgSend(location[0], "isEnabled") & 1;
  v21 = (id)objc_msgSend(v9, "configurationWithText:detailText:image:unread:showsPin:showsStar:showsMute:trailingText:trailingImage:enabled:", v20, v19, v17, v6 & 1, v7, v8, v3, v12, v10, v4);

  -[CPUIMessageCell applyConfiguration:](v23, "applyConfiguration:", v21);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

@end
