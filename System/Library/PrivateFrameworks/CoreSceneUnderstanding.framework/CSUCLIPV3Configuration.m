@implementation CSUCLIPV3Configuration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  if (a3 == -1)
    return 1;
  else
    return a3;
}

- (CSUCLIPV3Configuration)initWithRevision:(int64_t)a3 textEncoderConfiguration:(id)a4 imageEncoderConfiguration:(id)a5 embeddingRevision:(int64_t)a6 textEmbeddingType:(int64_t)a7
{
  id v13;
  id v14;
  CSUCLIPV3Configuration *v15;
  CSUCLIPV3Configuration *v16;
  CSUCLIPV3Configuration *v17;
  objc_super v19;

  v13 = a4;
  v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CSUCLIPV3Configuration;
  v15 = -[CSUCLIPV3Configuration init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_revision = a3;
    objc_storeStrong((id *)&v15->_textEncoderConfiguration, a4);
    objc_storeStrong((id *)&v16->_imageEncoderConfiguration, a5);
    v16->_embeddingRevision = a6;
    v16->_textEmbeddingType = a7;
    v17 = v16;
  }

  return v16;
}

+ (id)CLIPV3ConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CSUCLIPV3Configuration *v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  if (objc_msgSend__resolvedRevision_(CSUCLIPV3Configuration, a2, a3, (uint64_t)a4, v4) == 1)
  {
    objc_msgSend_CLIPTextEncoderV3ConfigurationForRevision_error_(CSUCLIPTextEncoderV3Configuration, v7, 1, (uint64_t)a4, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v16 = 0;
LABEL_12:

      return v16;
    }
    objc_msgSend_CLIPImageEncoderV3ConfigurationForRevision_error_(CSUCLIPImageEncoderV3Configuration, v10, 1, (uint64_t)a4, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = [CSUCLIPV3Configuration alloc];
      v16 = (void *)objc_msgSend_initWithRevision_textEncoderConfiguration_imageEncoderConfiguration_embeddingRevision_textEmbeddingType_(v14, v15, 1, (uint64_t)v12, (uint64_t)v13, 1, 2);
    }
    else
    {
      v16 = 0;
    }
LABEL_11:

    goto LABEL_12;
  }
  if (a4)
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v7, a3, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v17, v18, (uint64_t)CFSTR("Unsupported CLIPV3 revision %@"), v19, v20, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v21, (uint64_t)v13, v22, v23);
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  return 0;
}

+ (id)availableRevisions
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  return v2;
}

- (int64_t)revision
{
  return self->_revision;
}

- (CSUCLIPImageEncoderV3Configuration)imageEncoderConfiguration
{
  return self->_imageEncoderConfiguration;
}

- (CSUCLIPTextEncoderV3Configuration)textEncoderConfiguration
{
  return self->_textEncoderConfiguration;
}

- (int64_t)embeddingRevision
{
  return self->_embeddingRevision;
}

- (int64_t)textEmbeddingType
{
  return self->_textEmbeddingType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEncoderConfiguration, 0);
  objc_storeStrong((id *)&self->_imageEncoderConfiguration, 0);
}

@end
