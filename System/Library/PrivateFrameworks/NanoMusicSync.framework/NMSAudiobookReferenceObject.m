@implementation NMSAudiobookReferenceObject

- (NMSAudiobookReferenceObject)initWithAudiobookIdentifier:(id)a3 downloadLimit:(unint64_t)a4
{
  id v7;
  NMSAudiobookReferenceObject *v8;
  NMSAudiobookReferenceObject *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NMSAudiobookReferenceObject;
  v8 = -[NMSAudiobookReferenceObject init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_audiobookIdentifier, a3);
    v9->_downloadLimit = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  NMSAudiobookReferenceObject *v4;
  NMSAudiobookReferenceObject *v5;
  NMSAudiobookReferenceObject *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  BOOL v10;

  v4 = (NMSAudiobookReferenceObject *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[NMSAudiobookReferenceObject audiobookIdentifier](self, "audiobookIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSAudiobookReferenceObject audiobookIdentifier](v6, "audiobookIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      v9 = -[NMSAudiobookReferenceObject downloadLimit](self, "downloadLimit");
      v10 = v9 == -[NMSAudiobookReferenceObject downloadLimit](v6, "downloadLimit");
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

- (id)audiobookMediaItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDDC818], "audiobooksQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDDC810];
  -[NMSAudiobookReferenceObject audiobookIdentifier](self, "audiobookIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithValue:forProperty:", v5, *MEMORY[0x24BDDBCB0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addFilterPredicate:", v6);
  objc_msgSend(v3, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NMSAudiobookReferenceObject;
  -[NMSAudiobookReferenceObject description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSAudiobookReferenceObject audiobookIdentifier](self, "audiobookIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ - identifier: %@ - downloadInfo: %lu>"), v4, v5, -[NMSAudiobookReferenceObject downloadLimit](self, "downloadLimit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSNumber)audiobookIdentifier
{
  return self->_audiobookIdentifier;
}

- (unint64_t)downloadLimit
{
  return self->_downloadLimit;
}

- (void)setDownloadLimit:(unint64_t)a3
{
  self->_downloadLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audiobookIdentifier, 0);
}

@end
