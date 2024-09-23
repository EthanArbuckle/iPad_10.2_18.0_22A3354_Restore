@implementation NPTResults

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)asDictionary
{
  id v3;
  void *v4;
  void *v5;
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

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTResults downloadResults](self, "downloadResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NPTResults downloadResults](self, "downloadResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("download_results"));

  }
  -[NPTResults uploadResults](self, "uploadResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NPTResults uploadResults](self, "uploadResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v9, CFSTR("upload_results"));

  }
  -[NPTResults pingResults](self, "pingResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NPTResults pingResults](self, "pingResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v12, CFSTR("ping_results"));

  }
  -[NPTResults metadata](self, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NPTResults metadata](self, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v14, CFSTR("metadata"));

  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[NPTResults downloadResults](self, "downloadResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("downloadResults"));

  -[NPTResults uploadResults](self, "uploadResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("uploadResults"));

  -[NPTResults pingResults](self, "pingResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("pingResults"));

  -[NPTResults metadata](self, "metadata");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("metadata"));

}

- (NPTResults)initWithCoder:(id)a3
{
  id v3;
  NPTResults *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NPTResults;
  v3 = a3;
  v4 = -[NPTResults init](&v10, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadResults"), v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTResults setDownloadResults:](v4, "setDownloadResults:", v5);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uploadResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTResults setUploadResults:](v4, "setUploadResults:", v6);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pingResults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTResults setPingResults:](v4, "setPingResults:", v7);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPTResults setMetadata:](v4, "setMetadata:", v8);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NPTResults *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[NPTResults init](+[NPTResults allocWithZone:](NPTResults, "allocWithZone:", a3), "init");
  -[NPTResults downloadResults](self, "downloadResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTResults setDownloadResults:](v4, "setDownloadResults:", v5);

  -[NPTResults uploadResults](self, "uploadResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTResults setUploadResults:](v4, "setUploadResults:", v6);

  -[NPTResults pingResults](self, "pingResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTResults setPingResults:](v4, "setPingResults:", v7);

  -[NPTResults metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTResults setMetadata:](v4, "setMetadata:", v8);

  return v4;
}

- (NPTMetricResult)downloadResults
{
  return self->_downloadResults;
}

- (void)setDownloadResults:(id)a3
{
  objc_storeStrong((id *)&self->_downloadResults, a3);
}

- (NPTMetricResult)uploadResults
{
  return self->_uploadResults;
}

- (void)setUploadResults:(id)a3
{
  objc_storeStrong((id *)&self->_uploadResults, a3);
}

- (NPTPingResult)pingResults
{
  return self->_pingResults;
}

- (void)setPingResults:(id)a3
{
  objc_storeStrong((id *)&self->_pingResults, a3);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_pingResults, 0);
  objc_storeStrong((id *)&self->_uploadResults, 0);
  objc_storeStrong((id *)&self->_downloadResults, 0);
}

@end
