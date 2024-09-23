@implementation NMSMutableMediaDownloadInfo

- (NMSMutableMediaDownloadInfo)init
{
  void *v3;
  NMSMutableMediaDownloadInfo *v4;

  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NMSMediaDownloadInfo initWithItems:](self, "initWithItems:", v3);

  return v4;
}

- (void)addItem:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NMSMediaDownloadInfo items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if ((v5 & 1) == 0)
    -[NMSMediaDownloadInfo setTotalItemSize:](self, "setTotalItemSize:", objc_msgSend(v7, "size") + -[NMSMediaDownloadInfo totalItemSize](self, "totalItemSize"));
  -[NMSMediaDownloadInfo items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

@end
