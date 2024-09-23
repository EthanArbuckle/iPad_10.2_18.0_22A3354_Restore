@implementation GEOTextItem

- (GEOTextItem)init
{
  GEOTextItem *result;

  result = (GEOTextItem *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOTextItem)initWithPrimaryText:(id)a3
{
  id v4;
  GEOTextItem *v5;
  uint64_t v6;
  NSString *primaryText;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOTextItem;
  v5 = -[GEOTextItem init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    primaryText = v5->_primaryText;
    v5->_primaryText = (NSString *)v6;

  }
  return v5;
}

- (GEOTextItem)initWithTextItem:(id)a3
{
  id *v4;
  GEOTextItem *v5;
  void *v6;

  v4 = (id *)a3;
  -[GEOPDTextItem primaryText](v4);
  v5 = (GEOTextItem *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[GEOPDTextItem primaryText](v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[GEOTextItem initWithPrimaryText:](self, "initWithPrimaryText:", v6);

    v5 = self;
  }

  return v5;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryText, 0);
}

@end
