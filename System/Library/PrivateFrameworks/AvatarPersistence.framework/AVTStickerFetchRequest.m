@implementation AVTStickerFetchRequest

+ (id)requestForAllRecentStickers
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCriteria:", 1);
}

+ (id)requestForMostRecentStickersWithResultLimit:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCriteria:resultLimit:", 2, a3);
}

+ (id)requestForStickersWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCriteria:avatarIdentifier:stickerIdentifier:", 3, v7, v6);

  return v8;
}

- (AVTStickerFetchRequest)initWithCriteria:(int64_t)a3
{
  AVTStickerFetchRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTStickerFetchRequest;
  result = -[AVTStickerFetchRequest init](&v5, sel_init);
  if (result)
    result->_criteria = a3;
  return result;
}

- (AVTStickerFetchRequest)initWithCriteria:(int64_t)a3 resultLimit:(int64_t)a4
{
  AVTStickerFetchRequest *result;

  result = -[AVTStickerFetchRequest initWithCriteria:](self, "initWithCriteria:", a3);
  if (result)
    result->_resultLimit = a4;
  return result;
}

- (AVTStickerFetchRequest)initWithCriteria:(int64_t)a3 avatarIdentifier:(id)a4 stickerIdentifier:(id)a5
{
  id v9;
  id v10;
  AVTStickerFetchRequest *v11;
  AVTStickerFetchRequest *v12;

  v9 = a4;
  v10 = a5;
  v11 = -[AVTStickerFetchRequest initWithCriteria:](self, "initWithCriteria:", a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_avatarIdentifier, a4);
    objc_storeStrong((id *)&v12->_stickerIdentifier, a5);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  AVTStickerFetchRequest *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v5 = (AVTStickerFetchRequest *)a3;
  if (v5 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[AVTStickerFetchRequest criteria](self, "criteria");
      if (v6 == -[AVTStickerFetchRequest criteria](v5, "criteria"))
      {
        v7 = -[AVTStickerFetchRequest resultLimit](self, "resultLimit");
        if (v7 == -[AVTStickerFetchRequest resultLimit](v5, "resultLimit"))
        {
          -[AVTStickerFetchRequest avatarIdentifier](self, "avatarIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v8)
          {
            -[AVTStickerFetchRequest avatarIdentifier](v5, "avatarIdentifier");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v3)
            {
LABEL_9:
              -[AVTStickerFetchRequest stickerIdentifier](self, "stickerIdentifier");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12
                || (-[AVTStickerFetchRequest stickerIdentifier](v5, "stickerIdentifier"),
                    (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
              {
                -[AVTStickerFetchRequest stickerIdentifier](self, "stickerIdentifier");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                -[AVTStickerFetchRequest stickerIdentifier](v5, "stickerIdentifier");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v13, "isEqual:", v14);

                if (v12)
                {
LABEL_19:

                  goto LABEL_16;
                }
              }
              else
              {
                v15 = 1;
              }

              goto LABEL_19;
            }
          }
          -[AVTStickerFetchRequest avatarIdentifier](self, "avatarIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVTStickerFetchRequest avatarIdentifier](v5, "avatarIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (v8)
          {

            if (v11)
              goto LABEL_9;
          }
          else
          {

            if ((v11 & 1) != 0)
              goto LABEL_9;
          }
        }
      }
    }
    v15 = 0;
  }
LABEL_16:

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  -[AVTStickerFetchRequest avatarIdentifier](self, "avatarIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerFetchRequest avatarIdentifier](self, "avatarIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v6 + 1) = v3;
  *(_QWORD *)&v6 = v4;
  v5 = v6 >> 48;
  -[AVTStickerFetchRequest stickerIdentifier](self, "stickerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerFetchRequest stickerIdentifier](self, "stickerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v6 + 1) = v7;
  *(_QWORD *)&v6 = v8;
  v9 = (v6 >> 43) ^ v5;
  *((_QWORD *)&v6 + 1) = -[AVTStickerFetchRequest resultLimit](self, "resultLimit");
  *(_QWORD *)&v6 = -[AVTStickerFetchRequest resultLimit](self, "resultLimit");
  v10 = v9 ^ (v6 >> 32) ^ -[AVTStickerFetchRequest criteria](self, "criteria");

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVTStickerFetchRequest;
  -[AVTStickerFetchRequest description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = -[AVTStickerFetchRequest criteria](self, "criteria");
  v6 = -[AVTStickerFetchRequest resultLimit](self, "resultLimit");
  -[AVTStickerFetchRequest avatarIdentifier](self, "avatarIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerFetchRequest stickerIdentifier](self, "stickerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" criteria:%ld limit:%ld ari:%@ sci:%@"), v5, v6, v7, v8);

  v9 = (void *)objc_msgSend(v4, "copy");
  return v9;
}

- (int64_t)resultLimit
{
  return self->_resultLimit;
}

- (NSString)avatarIdentifier
{
  return self->_avatarIdentifier;
}

- (NSString)stickerIdentifier
{
  return self->_stickerIdentifier;
}

- (int64_t)criteria
{
  return self->_criteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerIdentifier, 0);
  objc_storeStrong((id *)&self->_avatarIdentifier, 0);
}

@end
