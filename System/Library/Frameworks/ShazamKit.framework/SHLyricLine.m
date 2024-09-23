@implementation SHLyricLine

+ (id)lyricLineWithText:(id)a3 offset:(double)a4
{
  id v5;
  SHLyricLine *v6;

  v5 = a3;
  v6 = -[SHLyricLine initWithLineWithText:offset:]([SHLyricLine alloc], "initWithLineWithText:offset:", v5, a4);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHLyricLine)initWithLineWithText:(id)a3 offset:(double)a4
{
  id v7;
  SHLyricLine *v8;
  SHLyricLine *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHLyricLine;
  v8 = -[SHLyricLine init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_text, a3);
    v9->_offset = a4;
  }

  return v9;
}

- (SHLyricLine)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  SHLyricLine *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("offset"));
  v7 = v6;

  v8 = -[SHLyricLine initWithLineWithText:offset:](self, "initWithLineWithText:offset:", v5, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("text"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("offset"), self->_offset);

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SHLyricLine text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHLyricLine offset](self, "offset");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ : %f"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
