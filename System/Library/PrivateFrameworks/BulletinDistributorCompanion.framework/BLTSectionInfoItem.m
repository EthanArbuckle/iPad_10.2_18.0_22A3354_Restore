@implementation BLTSectionInfoItem

- (NSString)displayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[BLTSectionInfoItem sectionInfo](self, "sectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)MEMORY[0x24BDC1538];
    -[BLTSectionInfoItem sectionInfo](self, "sectionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationProxyForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "localizedName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (BBSectionInfo)sectionInfo
{
  return self->_sectionInfo;
}

- (void)setSectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sectionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionInfo, 0);
}

@end
