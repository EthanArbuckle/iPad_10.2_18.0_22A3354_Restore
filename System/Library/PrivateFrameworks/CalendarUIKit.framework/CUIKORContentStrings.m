@implementation CUIKORContentStrings

- (NSArray)nonNilComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKORContentStrings titleString](self, "titleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CUIKORContentStrings titleString](self, "titleString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[CUIKORContentStrings locationString](self, "locationString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CUIKORContentStrings locationString](self, "locationString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[CUIKORContentStrings timeString](self, "timeString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CUIKORContentStrings timeString](self, "timeString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v10;
}

- (NSAttributedString)combinedString
{
  return self->_combinedString;
}

- (void)setCombinedString:(id)a3
{
  objc_storeStrong((id *)&self->_combinedString, a3);
}

- (NSAttributedString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  objc_storeStrong((id *)&self->_titleString, a3);
}

- (NSAttributedString)locationString
{
  return self->_locationString;
}

- (void)setLocationString:(id)a3
{
  objc_storeStrong((id *)&self->_locationString, a3);
}

- (NSAttributedString)timeString
{
  return self->_timeString;
}

- (void)setTimeString:(id)a3
{
  objc_storeStrong((id *)&self->_timeString, a3);
}

- (NSAttributedString)trailingString
{
  return self->_trailingString;
}

- (void)setTrailingString:(id)a3
{
  objc_storeStrong((id *)&self->_trailingString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingString, 0);
  objc_storeStrong((id *)&self->_timeString, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_combinedString, 0);
}

@end
