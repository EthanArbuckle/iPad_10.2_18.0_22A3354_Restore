@implementation ASCVideo

- (ASCVideo)initWithVideoURL:(id)a3 preview:(id)a4
{
  id v6;
  id v7;
  ASCVideo *v8;
  uint64_t v9;
  NSString *videoURL;
  uint64_t v11;
  ASCArtwork *preview;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v14.receiver = self;
  v14.super_class = (Class)ASCVideo;
  v8 = -[ASCVideo init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    videoURL = v8->_videoURL;
    v8->_videoURL = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    preview = v8->_preview;
    v8->_preview = (ASCArtwork *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCVideo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ASCVideo *v7;
  uint64_t v8;
  NSString *videoURL;
  uint64_t v10;
  ASCArtwork *preview;
  ASCVideo *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v30;

  v4 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("videoURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preview"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v30.receiver = self;
      v30.super_class = (Class)ASCVideo;
      v7 = -[ASCVideo init](&v30, sel_init);
      if (v7)
      {
        v8 = objc_msgSend(v5, "copy");
        videoURL = v7->_videoURL;
        v7->_videoURL = (NSString *)v8;

        v10 = objc_msgSend(v6, "copy");
        preview = v7->_preview;
        v7->_preview = (ASCArtwork *)v10;

      }
      self = v7;
      v12 = self;
    }
    else
    {
      v21 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v21)
        -[ASCVideo initWithCoder:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);
      v12 = 0;
    }

  }
  else
  {
    v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v13)
      -[ASCVideo initWithCoder:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ASCVideo videoURL](self, "videoURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("videoURL"));

  -[ASCVideo preview](self, "preview");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("preview"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCVideo videoURL](self, "videoURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCVideo preview](self, "preview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ASCVideo *v4;
  ASCVideo *v5;
  ASCVideo *v6;
  char v7;
  ASCVideo *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = (ASCVideo *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    if (!v8)
    {
      v7 = 0;
LABEL_21:

      goto LABEL_22;
    }
    -[ASCVideo videoURL](self, "videoURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCVideo videoURL](v8, "videoURL");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 && v10)
    {
      if (objc_msgSend(v9, "isEqual:", v10))
        goto LABEL_12;
    }
    else if (v9 == (void *)v10)
    {
LABEL_12:
      -[ASCVideo preview](self, "preview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCVideo preview](v8, "preview");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v12 && v13)
        v7 = objc_msgSend(v12, "isEqual:", v13);
      else
        v7 = v12 == (void *)v13;

      goto LABEL_20;
    }
    v7 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v7 = 1;
LABEL_22:

  return v7;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCVideo videoURL](self, "videoURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("videoURL"));

  -[ASCVideo preview](self, "preview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("preview"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)videoURL
{
  return self->_videoURL;
}

- (ASCArtwork)preview
{
  return self->_preview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCVideo because videoURL was missing", a5, a6, a7, a8, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCVideo because preview was missing", a5, a6, a7, a8, 0);
}

@end
