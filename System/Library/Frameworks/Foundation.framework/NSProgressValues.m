@implementation NSProgressValues

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSProgressValues;
  -[NSProgressValues dealloc](&v3, sel_dealloc);
}

- (NSProgressValues)init
{
  NSProgressValues *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSProgressValues;
  result = -[NSProgressValues init](&v3, sel_init);
  if (result)
  {
    result->_isCancellable = 1;
    *(_OWORD *)&result->_selfFraction.overflowed = 0u;
    *(_OWORD *)&result->_childFraction.total = 0u;
    *(_OWORD *)&result->_selfFraction.completed = 0u;
    result->_childFraction.total = 1;
  }
  return result;
}

- (double)fractionCompleted
{
  if (self)
    -[NSProgressValues overallFraction](self, "overallFraction");
  return 0.0;
}

- (_NSProgressFraction)overallFraction
{
  *(_QWORD *)&retstr->overflowed = 0;
  *retstr = self->_selfFraction;
  return (_NSProgressFraction *)_NSProgressFractionAddFraction((uint64_t)retstr, &self->_childFraction.completed);
}

- (void)encodeWithCoder:(id)a3
{
  Class v5;
  NSMutableDictionary *userInfo;
  uint64_t v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v5 = objc_lookUpClass("NSImage");
  userInfo = self->_userInfo;
  if (v5)
  {
    v7 = -[NSMutableDictionary mutableCopy](userInfo, "mutableCopy");
    v8 = self->_userInfo;
    v11[1] = 3221225472;
    v11[2] = __36__NSProgressValues_encodeWithCoder___block_invoke;
    v11[3] = &unk_1E0F524F0;
    v11[4] = v5;
    v11[5] = v7;
    v9 = (NSMutableDictionary *)v7;
    v11[0] = MEMORY[0x1E0C809B0];
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v11);
  }
  else
  {
    v9 = userInfo;
  }
  objc_msgSend(a3, "encodeObject:forKey:", v9, CFSTR("userInfo"), v9);
  objc_msgSend(a3, "encodeInt64:forKey:", self->_selfFraction.completed, CFSTR("selfFraction.completed"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_selfFraction.total, CFSTR("selfFraction.total"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_selfFraction.overflowed, CFSTR("selfFraction.overflowed"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_childFraction.completed, CFSTR("childFraction.completed"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_childFraction.total, CFSTR("childFraction.total"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_childFraction.overflowed, CFSTR("childFraction.overflowed"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_localizedDescription, CFSTR("localizedDescription"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_localizedAdditionalDescription, CFSTR("localizedAdditionalDescription"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isCancellable, CFSTR("cancellable"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isPausable, CFSTR("pausable"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isCancelled, CFSTR("cancelled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isPaused, CFSTR("paused"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isPrioritizable, CFSTR("prioritizable"));

}

- (NSProgressValues)initWithCoder:(id)a3
{
  NSProgressValues *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSProgressValues;
  v4 = -[NSProgressValues init](&v6, sel_init);
  if (v4)
  {
    v4->_userInfo = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend((id)objc_msgSend(a3, "allowedClasses"), "setByAddingObjectsFromSet:", objc_msgSend((id)objc_opt_class(), "decodableClasses")), CFSTR("userInfo"));
    v4->_selfFraction.completed = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("selfFraction.completed"));
    v4->_selfFraction.total = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("selfFraction.total"));
    v4->_selfFraction.overflowed = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("selfFraction.overflowed")) != 0;
    v4->_childFraction.completed = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("childFraction.completed"));
    v4->_childFraction.total = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("childFraction.total"));
    v4->_childFraction.overflowed = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("childFraction.overflowed")) != 0;
    v4->_localizedDescription = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
    v4->_localizedAdditionalDescription = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedAdditionalDescription"));
    v4->_isCancellable = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("cancellable"));
    v4->_isPausable = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("pausable"));
    v4->_isCancelled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("cancelled"));
    v4->_isPaused = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("paused"));
    v4->_kind = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
    v4->_isPrioritizable = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("prioritizable"));
  }
  return v4;
}

uint64_t __36__NSProgressValues_decodableClasses__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  qword_1ECD09850 = result;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 8) = -[NSMutableDictionary mutableCopy](self->_userInfo, "mutableCopy");
  v5 = *(_QWORD *)&self->_selfFraction.overflowed;
  *(_OWORD *)(v4 + 16) = *(_OWORD *)&self->_selfFraction.completed;
  *(_QWORD *)(v4 + 32) = v5;
  v6 = *(_OWORD *)&self->_childFraction.completed;
  *(_QWORD *)(v4 + 56) = *(_QWORD *)&self->_childFraction.overflowed;
  *(_OWORD *)(v4 + 40) = v6;
  *(_QWORD *)(v4 + 72) = -[NSString copy](self->_localizedDescription, "copy");
  *(_QWORD *)(v4 + 80) = -[NSString copy](self->_localizedAdditionalDescription, "copy");
  *(_BYTE *)(v4 + 104) = self->_isCancellable;
  *(_BYTE *)(v4 + 105) = self->_isPausable;
  *(_BYTE *)(v4 + 106) = self->_isCancelled;
  *(_BYTE *)(v4 + 107) = self->_isPaused;
  *(_QWORD *)(v4 + 88) = -[NSString mutableCopy](self->_kind, "mutableCopy");
  *(_BYTE *)(v4 + 109) = self->_isPrioritizable;
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)decodableClasses
{
  if (qword_1ECD09848 != -1)
    dispatch_once(&qword_1ECD09848, &__block_literal_global_125);
  return (id)qword_1ECD09850;
}

+ (id)_importantKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("totalUnitCount"), 0);
}

- (id)_indentedDescription:(unint64_t)a3
{
  NSString *v5;
  NSString *i;
  NSMutableDictionary *userInfo;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v5 = +[NSString string](NSMutableString, "string");
  for (i = +[NSString string](NSMutableString, "string"); a3; --a3)
    -[NSString appendString:](i, "appendString:", CFSTR("  "));
  -[NSString appendFormat:](v5, "appendFormat:", CFSTR("%@self: %@"), i, _NSProgressFractionDescription(&self->_selfFraction.completed));
  -[NSString appendFormat:](v5, "appendFormat:", CFSTR("\n%@children: %@"), i, _NSProgressFractionDescription(&self->_childFraction.completed));
  -[NSString appendFormat:](v5, "appendFormat:", CFSTR("\n%@localizedDescription: %@"), i, self->_localizedDescription);
  -[NSString appendFormat:](v5, "appendFormat:", CFSTR("\n%@localizedAdditionalDescription: %@"), i, self->_localizedAdditionalDescription);
  -[NSString appendFormat:](v5, "appendFormat:", CFSTR("\n%@isCancellable: %@"), i, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isCancellable));
  -[NSString appendFormat:](v5, "appendFormat:", CFSTR("\n%@isPausable: %@"), i, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isPausable));
  -[NSString appendFormat:](v5, "appendFormat:", CFSTR("\n%@isCancelled: %@"), i, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isCancelled));
  -[NSString appendFormat:](v5, "appendFormat:", CFSTR("\n%@isPaused: %@"), i, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isPaused));
  -[NSString appendFormat:](v5, "appendFormat:", CFSTR("\n%@isPrioritizable: %@"), i, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isPrioritizable));
  -[NSString appendFormat:](v5, "appendFormat:", CFSTR("\n%@kind: %@"), i, self->_kind);
  -[NSString appendFormat:](v5, "appendFormat:", CFSTR("\n%@userInfo: {"), i);
  userInfo = self->_userInfo;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__NSProgressValues__indentedDescription___block_invoke;
  v9[3] = &unk_1E0F4D940;
  v9[4] = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](userInfo, "enumerateKeysAndObjectsUsingBlock:", v9);
  -[NSString deleteCharactersInRange:](v5, "deleteCharactersInRange:", -[NSString length](v5, "length") - 2, 2);
  -[NSString appendFormat:](v5, "appendFormat:", CFSTR("}"));
  return v5;
}

uint64_t __41__NSProgressValues__indentedDescription___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@ : %@, "), a2, a3);
}

- (id)description
{
  return -[NSProgressValues _indentedDescription:](self, "_indentedDescription:", 0);
}

uint64_t __36__NSProgressValues_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;

  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", a2);
    result = objc_msgSend(a3, "performSelector:", sel_TIFFRepresentation);
    if (result)
      return objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", result, objc_msgSend(a2, "stringByAppendingString:", CFSTR(".data")));
  }
  return result;
}

- (BOOL)isIndeterminate
{
  int64_t completed;
  int64_t total;
  BOOL v4;

  completed = self->_selfFraction.completed;
  if (completed < 0)
    return 1;
  total = self->_selfFraction.total;
  v4 = (total | completed) == 0;
  return total < 0 || v4;
}

- (BOOL)isFinished
{
  int64_t completed;
  int64_t total;
  BOOL v5;

  completed = self->_selfFraction.completed;
  total = self->_selfFraction.total;
  v5 = completed > 0 && total == 0;
  return completed >= 1 && completed >= total && total > 0 || v5;
}

- (int64_t)completedUnitCount
{
  return self->_selfFraction.completed;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  self->_selfFraction.completed = a3;
}

- (int64_t)totalUnitCount
{
  return self->_selfFraction.total;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  self->_selfFraction.total = a3;
}

@end
