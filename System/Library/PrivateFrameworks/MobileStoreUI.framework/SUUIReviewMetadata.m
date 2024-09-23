@implementation SUUIReviewMetadata

- (SUUIReviewMetadata)initWithReviewDictionary:(id)a3
{
  id v4;
  SUUIReviewMetadata *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSURL *submitURL;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *body;
  void *v22;
  uint64_t v23;
  NSString *nickname;
  void *v25;
  float v26;
  void *v27;
  uint64_t v28;
  NSString *title;
  objc_super v31;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = 0;
    goto LABEL_32;
  }
  v31.receiver = self;
  v31.super_class = (Class)SUUIReviewMetadata;
  v5 = -[SUUIReviewMetadata init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("metadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_21:
      objc_msgSend(v4, "objectForKey:", CFSTR("review-info"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v18, "objectForKey:", CFSTR("body"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = objc_msgSend(v19, "copy");
          body = v5->_body;
          v5->_body = (NSString *)v20;

        }
        objc_msgSend(v18, "objectForKey:", CFSTR("nickname"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = objc_msgSend(v22, "copy");
          nickname = v5->_nickname;
          v5->_nickname = (NSString *)v23;

        }
        objc_msgSend(v18, "objectForKey:", CFSTR("rating"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v25, "floatValue");
          v5->_rating = v26;
        }
        objc_msgSend(v18, "objectForKey:", CFSTR("title"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v28 = objc_msgSend(v27, "copy");
          title = v5->_title;
          v5->_title = (NSString *)v28;

        }
      }

      goto LABEL_32;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("body-max-length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v7, "unsignedIntegerValue");
      v5->_bodyMaxLength = v8;
      if (!v8)
        goto LABEL_9;
    }
    else if (!v5->_bodyMaxLength)
    {
LABEL_9:
      v5->_bodyMaxLength = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("nickname-max-length"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "unsignedIntegerValue");
      v11 = 0x7FFFFFFFFFFFFFFFLL;
      if (v10)
        v11 = v10;
      v5->_nicknameMaxLength = v11;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("save-user-review-url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v12);
      submitURL = v5->_submitURL;
      v5->_submitURL = (NSURL *)v13;

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("title-max-length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend(v15, "unsignedIntegerValue");
      v17 = 0x7FFFFFFFFFFFFFFFLL;
      if (v16)
        v17 = v16;
      v5->_titleMaxLength = v17;
    }

    goto LABEL_21;
  }
LABEL_32:

  return v5;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_body, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(_QWORD *)(v5 + 16) = self->_bodyMaxLength;
  v8 = -[NSString copyWithZone:](self->_nickname, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  *(_QWORD *)(v5 + 32) = self->_nicknameMaxLength;
  *(float *)(v5 + 40) = self->_rating;
  v10 = -[NSURL copyWithZone:](self->_submitURL, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  *(_QWORD *)(v5 + 64) = self->_titleMaxLength;
  return (id)v5;
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)bodyMaxLength
{
  return self->_bodyMaxLength;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)nicknameMaxLength
{
  return self->_nicknameMaxLength;
}

- (float)rating
{
  return self->_rating;
}

- (void)setRating:(float)a3
{
  self->_rating = a3;
}

- (NSURL)submitURL
{
  return self->_submitURL;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)titleMaxLength
{
  return self->_titleMaxLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_submitURL, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end
