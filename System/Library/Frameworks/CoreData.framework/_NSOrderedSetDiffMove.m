@implementation _NSOrderedSetDiffMove

- (void)applyToSet:(id)a3
{
  objc_msgSend(a3, "removeObject:", self->super.super._diffObject);
  objc_msgSend(a3, "insertObject:atIndex:", self->super.super._diffObject, self->super._index);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Move: %@ to index: %lu"), self->super.super._diffObject, self->super._index);
}

@end
