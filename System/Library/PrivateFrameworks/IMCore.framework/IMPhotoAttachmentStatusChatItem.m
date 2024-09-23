@implementation IMPhotoAttachmentStatusChatItem

+ (id)_guidForItem:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)sub_1A2132A84();

  return v4;
}

- (id)_initWithItem:(id)a3 numberOfPhotos:(unint64_t)a4 numberOfVideos:(unint64_t)a5 numberOfSavedAssets:(unint64_t)a6
{
  id v10;
  _QWORD *v11;
  void *v12;
  objc_super v14;

  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMPhotoAttachmentStatusChatItem;
  v11 = -[IMChatItem _initWithItem:](&v14, sel__initWithItem_, v10);
  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "_guidForItem:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setGUID:", v12);
    v11[7] = a4;
    v11[8] = a5;
    v11[9] = a6;

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;

  -[IMTranscriptChatItem guid](self, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4 ^ (4 * self->_numberOfPhotos) ^ (16 * self->_numberOfVideos) ^ (self->_numberOfSavedAssets << 6);
}

- (BOOL)_isEqualToGuid:(id)a3 numberOfPhotos:(unint64_t)a4 numberOfVideos:(unint64_t)a5 numberOfSavedAssets:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  BOOL v15;

  v10 = a3;
  -[IMTranscriptChatItem guid](self, "guid");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v12;
  if (v11 == v12)
  {

  }
  else
  {
    if (!v12 || !v11)
    {

LABEL_11:
      v15 = 0;
      goto LABEL_12;
    }
    v14 = objc_msgSend(v11, "isEqualToString:", v12);

    if (!v14)
      goto LABEL_11;
  }
  if (self->_numberOfPhotos != a4 || self->_numberOfVideos != a5)
    goto LABEL_11;
  v15 = self->_numberOfSavedAssets == a6;
LABEL_12:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "guid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[IMPhotoAttachmentStatusChatItem _isEqualToGuid:numberOfPhotos:numberOfVideos:numberOfSavedAssets:](self, "_isEqualToGuid:numberOfPhotos:numberOfVideos:numberOfSavedAssets:", v5, objc_msgSend(v4, "numberOfPhotos"), objc_msgSend(v4, "numberOfVideos"), objc_msgSend(v4, "numberOfSavedAssets"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)IMPhotoAttachmentStatusChatItem;
  -[IMTranscriptChatItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[[%@] numberOfPhotos: %tu, numberOfVideos: %tu, numberOfSavedAssets: %tu]"), v4, self->_numberOfPhotos, self->_numberOfVideos, self->_numberOfSavedAssets);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithItem:numberOfPhotos:numberOfVideos:numberOfSavedAssets:", v5, self->_numberOfPhotos, self->_numberOfVideos, self->_numberOfSavedAssets);

  return v6;
}

- (BOOL)isFromMe
{
  void *v2;
  char v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromMe");

  return v3;
}

- (BOOL)wouldBeEqualIfInitializedWithItem:(id)a3 numberOfPhotos:(unint64_t)a4 numberOfVideos:(unint64_t)a5 numberOfSavedAssets:(unint64_t)a6
{
  id v10;
  void *v11;

  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "_guidForItem:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a6) = -[IMPhotoAttachmentStatusChatItem _isEqualToGuid:numberOfPhotos:numberOfVideos:numberOfSavedAssets:](self, "_isEqualToGuid:numberOfPhotos:numberOfVideos:numberOfSavedAssets:", v11, a4, a5, a6);
  return a6;
}

- (unint64_t)numberOfPhotos
{
  return self->_numberOfPhotos;
}

- (unint64_t)numberOfVideos
{
  return self->_numberOfVideos;
}

- (unint64_t)numberOfSavedAssets
{
  return self->_numberOfSavedAssets;
}

@end
