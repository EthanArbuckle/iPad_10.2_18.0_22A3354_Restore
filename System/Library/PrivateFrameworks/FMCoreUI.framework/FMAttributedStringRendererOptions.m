@implementation FMAttributedStringRendererOptions

- (FMAttributedStringRendererOptions)init
{
  return -[FMAttributedStringRendererOptions initWithLineBreakMode:lineFragmentPadding:maximumNumberOfLines:hyphenationFactor:exclusionPaths:](self, "initWithLineBreakMode:lineFragmentPadding:maximumNumberOfLines:hyphenationFactor:exclusionPaths:", 0, 0, MEMORY[0x24BDBD1A8], 5.0, 0.0);
}

- (FMAttributedStringRendererOptions)initWithLineBreakMode:(int64_t)a3 lineFragmentPadding:(double)a4 maximumNumberOfLines:(unint64_t)a5 hyphenationFactor:(double)a6 exclusionPaths:(id)a7
{
  id v12;
  FMAttributedStringRendererOptions *v13;
  FMAttributedStringRendererOptions *v14;
  uint64_t v15;
  NSArray *exclusionPaths;
  objc_super v18;

  v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)FMAttributedStringRendererOptions;
  v13 = -[FMAttributedStringRendererOptions init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_lineBreakMode = a3;
    v13->_lineFragmentPadding = a4;
    v13->_maximumNumberOfLines = a5;
    v13->_hyphenationFactor = a6;
    v15 = objc_msgSend(v12, "copy");
    exclusionPaths = v14->_exclusionPaths;
    v14->_exclusionPaths = (NSArray *)v15;

  }
  return v14;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (double)lineFragmentPadding
{
  return self->_lineFragmentPadding;
}

- (unint64_t)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (double)hyphenationFactor
{
  return self->_hyphenationFactor;
}

- (NSArray)exclusionPaths
{
  return self->_exclusionPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusionPaths, 0);
}

@end
