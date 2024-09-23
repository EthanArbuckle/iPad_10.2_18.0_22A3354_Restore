@implementation HUGridCellBackgroundDisplayOptions

- (id)copyWithZone:(_NSZone *)a3
{
  HUGridCellBackgroundDisplayOptions *v4;
  void *v5;

  v4 = objc_alloc_init(HUGridCellBackgroundDisplayOptions);
  -[HUGridCellBackgroundDisplayOptions setContentColorStyle:](v4, "setContentColorStyle:", -[HUGridCellBackgroundDisplayOptions contentColorStyle](self, "contentColorStyle"));
  -[HUGridCellBackgroundDisplayOptions contentSizeCategory](self, "contentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridCellBackgroundDisplayOptions setContentSizeCategory:](v4, "setContentSizeCategory:", v5);

  -[HUGridCellBackgroundDisplayOptions setDisplayStyle:](v4, "setDisplayStyle:", -[HUGridCellBackgroundDisplayOptions displayStyle](self, "displayStyle"));
  return v4;
}

- (void)setDisplayStyle:(unint64_t)a3
{
  self->_displayStyle = a3;
}

- (void)setContentSizeCategory:(id)a3
{
  self->_contentSizeCategory = (NSString *)a3;
}

- (void)setContentColorStyle:(unint64_t)a3
{
  self->_contentColorStyle = a3;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (unint64_t)contentColorStyle
{
  return self->_contentColorStyle;
}

+ (id)defaultOptions
{
  HUGridCellBackgroundDisplayOptions *v2;

  v2 = objc_alloc_init(HUGridCellBackgroundDisplayOptions);
  -[HUGridCellBackgroundDisplayOptions setContentColorStyle:](v2, "setContentColorStyle:", 0);
  -[HUGridCellBackgroundDisplayOptions setContentSizeCategory:](v2, "setContentSizeCategory:", *MEMORY[0x1E0CEB440]);
  -[HUGridCellBackgroundDisplayOptions setDisplayStyle:](v2, "setDisplayStyle:", 0);
  return v2;
}

- (double)gutter
{
  return 0.0;
}

@end
