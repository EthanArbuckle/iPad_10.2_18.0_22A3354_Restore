@implementation _NSOrderedCollectionDifferenceMoves

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSOrderedCollectionDifferenceMoves;
  -[_NSOrderedCollectionDifferenceMoves dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  unint64_t result;

  result = -[NSMutableDictionary count](self->_removeDict, "count");
  if (result)
    return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_removeDict, "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_firstRemove)), "hash");
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[NSMutableDictionary isEqual:](self->_removeDict, "isEqual:", *((_QWORD *)a3 + 1)))
  {
    return -[NSMutableDictionary isEqual:](self->_insertDict, "isEqual:", *((_QWORD *)a3 + 2));
  }
  else
  {
    return 0;
  }
}

@end
