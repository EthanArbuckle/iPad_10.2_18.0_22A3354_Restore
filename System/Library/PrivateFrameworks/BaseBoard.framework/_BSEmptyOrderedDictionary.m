@implementation _BSEmptyOrderedDictionary

+ (id)emptyDictionary
{
  objc_opt_self();
  if (qword_1ECD39B40 != -1)
    dispatch_once(&qword_1ECD39B40, &__block_literal_global_209);
  return (id)qword_1ECD39B38;
}

@end
