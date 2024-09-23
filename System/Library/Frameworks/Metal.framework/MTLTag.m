@implementation MTLTag

- (MTLTag)initWithTagType:(unint64_t)a3
{
  self->_tagType = a3;
  return self;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  objc_super v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MTLTag;
  v6 = -[MTLTag description](&v8, sel_description);
  v9[0] = v4;
  v9[1] = CFSTR("Tag =");
  v9[2] = MTLTagTypeString(self->_tagType);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3), "componentsJoinedByString:", CFSTR(" ")));
}

- (unint64_t)tagType
{
  return self->_tagType;
}

@end
