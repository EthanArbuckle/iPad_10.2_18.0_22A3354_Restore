@implementation MTLFunctionStitchingAttributeKernel

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  NSString *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MTLFunctionStitchingAttributeKernel;
  v6 = -[MTLFunctionStitchingAttributeKernel description](&v8, sel_description);
  v9[0] = v4;
  v9[1] = CFSTR("kernel");
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2), "componentsJoinedByString:", CFSTR(" ")));
}

- (NSString)description
{
  return (NSString *)-[MTLFunctionStitchingAttributeKernel formattedDescription:](self, "formattedDescription:", 0);
}

@end
