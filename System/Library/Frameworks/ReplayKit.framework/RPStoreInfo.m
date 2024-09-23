@implementation RPStoreInfo

- (id)dictionary
{
  void *v3;
  void *v4;
  NSString *bundleID;
  NSString *appName;
  NSString *author;
  NSURL *itemURL;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", bundleID, CFSTR("RPStoreInfoBundleIDKey"));
  appName = self->_appName;
  if (appName)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", appName, CFSTR("RPStoreInfoAppNameKey"));
  author = self->_author;
  if (author)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", author, CFSTR("RPStoreInfoAuthorKey"));
  itemURL = self->_itemURL;
  if (itemURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", itemURL, CFSTR("RPStoreInfoItemURLKey"));
  return v4;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_storeStrong((id *)&self->_author, a3);
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
  objc_storeStrong((id *)&self->_itemURL, a3);
}

- (NSURL)appArtworkURL
{
  return self->_appArtworkURL;
}

- (void)setAppArtworkURL:(id)a3
{
  objc_storeStrong((id *)&self->_appArtworkURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appArtworkURL, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
