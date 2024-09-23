@implementation ASCTrailers

- (ASCTrailers)initWithVideos:(id)a3 mediaPlatform:(id)a4
{
  id v6;
  id v7;
  ASCTrailers *v8;
  uint64_t v9;
  NSArray *videos;
  uint64_t v11;
  ASCMediaPlatform *mediaPlatform;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v14.receiver = self;
  v14.super_class = (Class)ASCTrailers;
  v8 = -[ASCTrailers init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    videos = v8->_videos;
    v8->_videos = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    mediaPlatform = v8->_mediaPlatform;
    v8->_mediaPlatform = (ASCMediaPlatform *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCTrailers)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ASCTrailers *v10;
  uint64_t v11;
  NSArray *videos;
  uint64_t v13;
  ASCMediaPlatform *mediaPlatform;
  ASCTrailers *v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v33;

  v4 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("videos"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaPlatform"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v33.receiver = self;
      v33.super_class = (Class)ASCTrailers;
      v10 = -[ASCTrailers init](&v33, sel_init);
      if (v10)
      {
        v11 = objc_msgSend(v8, "copy");
        videos = v10->_videos;
        v10->_videos = (NSArray *)v11;

        v13 = objc_msgSend(v9, "copy");
        mediaPlatform = v10->_mediaPlatform;
        v10->_mediaPlatform = (ASCMediaPlatform *)v13;

      }
      self = v10;
      v15 = self;
    }
    else
    {
      v24 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v24)
        -[ASCTrailers initWithCoder:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);
      v15 = 0;
    }

  }
  else
  {
    v16 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v16)
      -[ASCTrailers initWithCoder:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ASCTrailers videos](self, "videos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("videos"));

  -[ASCTrailers mediaPlatform](self, "mediaPlatform");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("mediaPlatform"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCTrailers videos](self, "videos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCTrailers mediaPlatform](self, "mediaPlatform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;

  v4 = a3;
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
  v7 = v6;

  if (v7)
  {
    -[ASCTrailers videos](self, "videos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "videos");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
        goto LABEL_10;
    }
    else if (v8 == (void *)v9)
    {
LABEL_10:
      -[ASCTrailers mediaPlatform](self, "mediaPlatform");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mediaPlatform");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v11 && v12)
        v14 = objc_msgSend(v11, "isEqual:", v12);
      else
        v14 = v11 == (void *)v12;

      goto LABEL_18;
    }
    v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v14 = 0;
LABEL_19:

  return v14;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCTrailers videos](self, "videos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("videos"));

  -[ASCTrailers mediaPlatform](self, "mediaPlatform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("mediaPlatform"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)videos
{
  return self->_videos;
}

- (ASCMediaPlatform)mediaPlatform
{
  return self->_mediaPlatform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaPlatform, 0);
  objc_storeStrong((id *)&self->_videos, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCTrailers because videos was missing", a5, a6, a7, a8, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCTrailers because mediaPlatform was missing", a5, a6, a7, a8, 0);
}

@end
