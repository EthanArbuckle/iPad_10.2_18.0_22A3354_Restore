@implementation _NSOrderedSetDiffDelete

- (void)applyToSet:(id)a3
{
  objc_msgSend(a3, "removeObject:", self->super._diffObject);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Delete: %@"), self->super._diffObject);
}

@end
