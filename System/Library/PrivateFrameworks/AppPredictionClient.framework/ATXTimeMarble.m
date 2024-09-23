@implementation ATXTimeMarble

- (ATXTimeMarble)initWithSymbolName:(id)a3 colorName:(id)a4 dateComponents:(id)a5 title:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ATXTimeMarble *v14;
  uint64_t v15;
  NSString *symbolName;
  uint64_t v17;
  NSString *colorName;
  uint64_t v19;
  NSDateComponents *dateComponents;
  uint64_t v21;
  NSString *title;
  ATXTimeMarble *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)ATXTimeMarble;
  v14 = -[ATXTimeMarble init](&v25, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    symbolName = v14->_symbolName;
    v14->_symbolName = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    colorName = v14->_colorName;
    v14->_colorName = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    dateComponents = v14->_dateComponents;
    v14->_dateComponents = (NSDateComponents *)v19;

    v21 = objc_msgSend(v13, "copy");
    title = v14->_title;
    v14->_title = (NSString *)v21;

    v23 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXTimeMarble)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ATXTimeMarble *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colorName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateComponents"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ATXTimeMarble initWithSymbolName:colorName:dateComponents:title:](self, "initWithSymbolName:colorName:dateComponents:title:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *symbolName;
  id v5;

  symbolName = self->_symbolName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", symbolName, CFSTR("symbolName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_colorName, CFSTR("colorName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateComponents, CFSTR("dateComponents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));

}

- (NSDate)date
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXTimeMarble dateComponents](self, "dateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFromComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_dateComponents, 0);
}

@end
