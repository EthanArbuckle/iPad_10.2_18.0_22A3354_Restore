@implementation SUUIGift

- (SUUIGift)initWithGiftCategory:(int64_t)a3
{
  SUUIGift *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIGift;
  result = -[SUUIGift init](&v5, sel_init);
  if (result)
    result->_category = a3;
  return result;
}

- (SUUIGift)initWithItem:(id)a3
{
  id v5;
  SUUIGift *v6;
  SUUIGift *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIGift;
  v6 = -[SUUIGift init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_item, a3);

  return v7;
}

- (id)HTTPBodyDictionary
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SUUIGiftTheme *theme;
  void *v18;
  void *v19;
  void *v20;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[SUUIGift deliveryDate](self, "deliveryDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    objc_msgSend(v5, "stringFromDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("customSendGiftDate"));

    objc_msgSend(v3, "setObject:forKey:", CFSTR("custom"), CFSTR("dateSendType"));
  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", CFSTR("today"), CFSTR("dateSendType"));
  }
  -[SUUIGift item](self, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "primaryItemOffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("actionParams"));
    objc_msgSend(v3, "setObject:forKey:", CFSTR("product"), CFSTR("giftType"));

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), -[SUUIGift giftAmount](self, "giftAmount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("amount"));

    objc_msgSend(v3, "setObject:forKey:", CFSTR("credit"), CFSTR("giftType"));
  }
  -[SUUIGift message](self, "message");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("message"));
  -[SUUIGift recipientAddresses](self, "recipientAddresses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("toEmail"));

  }
  -[SUUIGift senderEmailAddress](self, "senderEmailAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("senderEmail"));
  -[SUUIGift senderName](self, "senderName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("fromName"));
  theme = self->_theme;
  if (theme)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[SUUIGiftTheme themeIdentifier](theme, "themeIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("fcAdamId"));

  }
  objc_msgSend(MEMORY[0x24BEC8B88], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "guid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("guid"));

  return v3;
}

- (void)reset
{
  NSDate *deliveryDate;
  NSString *giftAmountString;
  NSString *message;
  NSArray *recipientAddresses;
  SUUIGiftTheme *theme;
  NSString *totalGiftAmountString;

  deliveryDate = self->_deliveryDate;
  self->_deliveryDate = 0;

  giftAmountString = self->_giftAmountString;
  self->_giftAmount = 0;
  self->_giftAmountString = 0;

  message = self->_message;
  self->_message = 0;

  recipientAddresses = self->_recipientAddresses;
  self->_recipientAddresses = 0;

  theme = self->_theme;
  self->_theme = 0;

  totalGiftAmountString = self->_totalGiftAmountString;
  self->_totalGiftAmountString = 0;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = self->_category;
  v6 = -[NSDate copyWithZone:](self->_deliveryDate, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_QWORD *)(v5 + 24) = self->_giftAmount;
  v8 = -[NSString copyWithZone:](self->_giftAmountString, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  objc_storeStrong((id *)(v5 + 40), self->_item);
  v10 = -[NSString copyWithZone:](self->_message, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSArray copyWithZone:](self->_recipientAddresses, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v14 = -[NSString copyWithZone:](self->_senderEmailAddress, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v16 = -[NSString copyWithZone:](self->_senderName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v16;

  v18 = -[SUUIGiftTheme copyWithZone:](self->_theme, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v18;

  v20 = -[NSString copyWithZone:](self->_totalGiftAmountString, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v20;

  return (id)v5;
}

- (NSDate)deliveryDate
{
  return self->_deliveryDate;
}

- (void)setDeliveryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)giftAmount
{
  return self->_giftAmount;
}

- (void)setGiftAmount:(int64_t)a3
{
  self->_giftAmount = a3;
}

- (NSString)giftAmountString
{
  return self->_giftAmountString;
}

- (void)setGiftAmountString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)giftCategory
{
  return self->_category;
}

- (SUUIItem)item
{
  return self->_item;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)recipientAddresses
{
  return self->_recipientAddresses;
}

- (void)setRecipientAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)senderEmailAddress
{
  return self->_senderEmailAddress;
}

- (void)setSenderEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)senderName
{
  return self->_senderName;
}

- (void)setSenderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (SUUIGiftTheme)theme
{
  return self->_theme;
}

- (void)setTheme:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)totalGiftAmountString
{
  return self->_totalGiftAmountString;
}

- (void)setTotalGiftAmountString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalGiftAmountString, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_senderEmailAddress, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_giftAmountString, 0);
  objc_storeStrong((id *)&self->_deliveryDate, 0);
}

@end
