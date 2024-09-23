@implementation CNContainerConstraintsPathDescription

- (int)abPropertyID
{
  return *MEMORY[0x1E0CF62D8];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  objc_msgSend(a4, "setConstraintsPath:", a3);
}

- (id)key
{
  return CFSTR("constraintsPath");
}

- (BOOL)isWritable
{
  return 1;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueForContainer:(id)a3
{
  return (id)objc_msgSend(a3, "constraintsPath");
}

@end
