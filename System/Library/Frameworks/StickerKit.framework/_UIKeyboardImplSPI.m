@implementation _UIKeyboardImplSPI

+ (void)playInputClick
{
  id v2;

  objc_msgSend(MEMORY[0x24BEBD6E0], "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "playInputClick");

}

+ (void)insertSticker:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BEBD6E0];
  v4 = a3;
  objc_msgSend(v3, "activeInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertSticker:", v4);

}

+ (void)insertEmojiImageTextAttachment:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BEBD6E0];
  v4 = a3;
  objc_msgSend(v3, "activeInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertEmojiImageTextAttachment:", v4);

}

+ (void)postEmojiSearchViewButtonConfigurationWillChangeNotification:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BEB5B10];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", *MEMORY[0x24BEB5B18], 0, v4);

}

@end
