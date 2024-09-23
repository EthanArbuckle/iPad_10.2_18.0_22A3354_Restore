@implementation EKUITextAndHeaderItem

- (EKUITextAndHeaderItem)initWithDictionary:(id)a3
{
  id v4;
  EKUITextAndHeaderItem *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSString *header;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EKUITextAndHeaderItem;
  v5 = -[EKUITextAndHeaderItem init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("header"));
    v8 = objc_claimAutoreleasedReturnValue();
    header = v5->_header;
    v5->_header = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lines"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");
    if (v11 <= 1)
      v12 = 1;
    else
      v12 = v11;
    v5->_lines = v12;

  }
  return v5;
}

+ (EKUITextAndHeaderItem)itemWithText:(id)a3 andHeader:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v7, "setHeader:", v5);
  objc_msgSend(v7, "setLines:", 1);
  return (EKUITextAndHeaderItem *)v7;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *text;
  NSString *header;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  text = self->_text;
  if (text)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", text, CFSTR("text"));
  header = self->_header;
  if (header)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", header, CFSTR("header"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_lines);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("lines"));

  v8 = (void *)objc_msgSend(v4, "copy");
  return (NSDictionary *)v8;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKUITextAndHeaderItem;
  -[EKUITextAndHeaderItem description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@ text: %@ header: %@ lines: %d"), v3, self->_text, self->_header, self->_lines);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (int64_t)lines
{
  return self->_lines;
}

- (void)setLines:(int64_t)a3
{
  self->_lines = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
