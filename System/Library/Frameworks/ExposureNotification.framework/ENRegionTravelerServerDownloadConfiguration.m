@implementation ENRegionTravelerServerDownloadConfiguration

- (void)encodeWithCoder:(id)a3
{
  NSURL *tekTravelerDownloadBaseURL;
  id v5;

  tekTravelerDownloadBaseURL = self->_tekTravelerDownloadBaseURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tekTravelerDownloadBaseURL, CFSTR("tekTravelerDownloadBasePath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tekTravelerDownloadIndexURL, CFSTR("tekTravelerDownloadIndexFile"));

}

- (ENRegionTravelerServerDownloadConfiguration)initWithServerResponseDictionary:(id)a3
{
  id v4;
  ENRegionTravelerServerDownloadConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ENRegionTravelerServerDownloadConfiguration *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ENRegionTravelerServerDownloadConfiguration;
  v5 = -[ENRegionTravelerServerDownloadConfiguration init](&v12, sel_init);
  if (v5)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_storeStrong((id *)&v5->_tekTravelerDownloadBaseURL, v7);
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_storeStrong((id *)&v5->_tekTravelerDownloadIndexURL, v9);
        v10 = v5;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (ENRegionTravelerServerDownloadConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ENRegionTravelerServerDownloadConfiguration *v7;
  id *p_isa;
  ENRegionTravelerServerDownloadConfiguration *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tekTravelerDownloadBasePath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tekTravelerDownloadIndexFile"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v11.receiver = self;
      v11.super_class = (Class)ENRegionTravelerServerDownloadConfiguration;
      v7 = -[ENRegionTravelerServerDownloadConfiguration init](&v11, sel_init);
      p_isa = (id *)&v7->super.isa;
      if (v7)
      {
        objc_storeStrong((id *)&v7->_tekTravelerDownloadBaseURL, v5);
        objc_storeStrong(p_isa + 2, v6);
      }
      self = p_isa;
      v9 = self;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)tekTravelerDownloadBaseURL
{
  return self->_tekTravelerDownloadBaseURL;
}

- (NSURL)tekTravelerDownloadIndexURL
{
  return self->_tekTravelerDownloadIndexURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tekTravelerDownloadIndexURL, 0);
  objc_storeStrong((id *)&self->_tekTravelerDownloadBaseURL, 0);
}

@end
