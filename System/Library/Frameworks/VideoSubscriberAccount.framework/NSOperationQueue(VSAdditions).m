@implementation NSOperationQueue(VSAdditions)

+ (id)queueWithName:()VSAdditions
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3828];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setName:", v4);

  return v5;
}

@end
